import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:flutter_drawing_board/paint_contents.dart';
import 'package:flutter_drawing_board/paint_extension.dart';

import 'package:auto_route/auto_route.dart';

Future<ui.Image> _getImage(String path) async {
  final Completer<ImageInfo> completer = Completer<ImageInfo>();
  final NetworkImage img = NetworkImage(path);

  img.resolve(ImageConfiguration.empty).addListener(
    ImageStreamListener(
      (ImageInfo info, _) {
        completer.complete(info);
      },
    ),
  );
  final ImageInfo imageInfo = await completer.future;
  return imageInfo.image;
}

@RoutePage()
class DrawingBoardPage extends StatefulWidget {
  const DrawingBoardPage({super.key});

  @override
  State<DrawingBoardPage> createState() => _DrawingBoardPageState();
}

class _DrawingBoardPageState extends State<DrawingBoardPage> {
  final DrawingController _drawingBoardController = DrawingController();
  final TransformationController _transformationController =
      TransformationController();
  void _restBoard() {
    _transformationController.value = Matrix4.identity();
  }

  void dispose() {
    _drawingBoardController.dispose();
    super.dispose();
  }

  Future<void> _getImageData() async {
    final Uint8List? data =
        (await _drawingBoardController.getImageData())?.buffer.asUint8List();
    if (data == null) {
      debugPrint('АЙАЙАЙ');
      return;
    }

    if (mounted) {
      showDialog(
        context: context,
        builder: (BuildContext c) {
          return Material(
            color: const Color.fromARGB(255, 31, 20, 37),
            child: InkWell(
              onTap: () => Navigator.pop(c),
              child: Image.memory(data),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 31, 20, 37),
      appBar: AppBar(
        title: const Text('Доска для рисования'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.done),
            onPressed: () {
              _getImageData;
            },
          ),
          IconButton(
            icon: const Icon(Icons.restore_page),
            onPressed: () {
              _restBoard;
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return DrawingBoard(
                  transformationController: _transformationController,
                  controller: _drawingBoardController,
                  background: Container(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight,
                    color: Colors.white,
                  ),
                  showDefaultActions: true,
                  showDefaultTools: true,
                  defaultToolsBuilder: (Type t, _) {
                    return DrawingBoard.defaultTools(t, _drawingBoardController)
                      ..insert(
                        1,
                        DefToolItem(
                          icon: Icons.text_rotation_angledown,
                          isActive: t == Triangle,
                          onTap: () => _drawingBoardController
                              .setPaintContent(Triangle()),
                        ),
                      )
                      ..insert(
                        2,
                        DefToolItem(
                          icon: Icons.image,
                          isActive: t == ImageContent,
                          onTap: () async {
                            showDialog(
                              context: context,
                              builder: (BuildContext c) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            );
                            try {
                              _drawingBoardController
                                  .setPaintContent(ImageContent(
                                await _getImage(_imageUrl),
                                imageUrl: _imageUrl,
                              ));
                            } catch (e) {
                              //
                            } finally {
                              if (context.mounted) {
                                Navigator.pop(context);
                              }
                            }
                          },
                        ),
                      );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Triangle extends PaintContent {
  Triangle();

  Triangle.data({
    required this.startPoint,
    required this.A,
    required this.B,
    required this.C,
    required Paint paint,
  }) : super.paint(paint);

  factory Triangle.fromJson(Map<String, dynamic> data) {
    return Triangle.data(
      startPoint: jsonToOffset(data['startPoint'] as Map<String, dynamic>),
      A: jsonToOffset(data['A'] as Map<String, dynamic>),
      B: jsonToOffset(data['B'] as Map<String, dynamic>),
      C: jsonToOffset(data['C'] as Map<String, dynamic>),
      paint: jsonToPaint(data['paint'] as Map<String, dynamic>),
    );
  }

  Offset startPoint = Offset.zero;

  Offset A = Offset.zero;
  Offset B = Offset.zero;
  Offset C = Offset.zero;

  @override
  void startDraw(Offset startPoint) => this.startPoint = startPoint;

  @override
  void drawing(Offset nowPoint) {
    A = Offset(
      startPoint.dx + (nowPoint.dx - startPoint.dx) / 2,
      startPoint.dy,
    );
    B = Offset(
      startPoint.dx,
      startPoint.dy,
    );
    C = nowPoint;
  }

  @override
  void draw(Canvas canvas, Size size, bool deeper) {
    final Path path = Path()
      ..moveTo(A.dx, A.dy)
      ..lineTo(B.dx, B.dy)
      ..lineTo(C.dx, C.dy)
      ..close();
  }

  @override
  Triangle copy() => Triangle();

  @override
  Map<String, dynamic> toContentJson() {
    return <String, dynamic>{
      'startPoint': startPoint.toJson(),
      'A': A.toJson(),
      'B': B.toJson(),
      'C': C.toJson(),
      'Paint': paint.toJson(),
    };
  }
}

const String _imageUrl =
    'http://klubmama.ru/uploads/posts/2022-08/1660295978_73-klubmama-ru-p-shrek-podelki-iz-bumagi-foto-77.png';

class ImageContent extends PaintContent {
  ImageContent(this.image, {this.imageUrl = ''});

  ImageContent.data({
    required this.startPoint,
    required this.size,
    required this.image,
    required this.imageUrl,
    required Paint paint,
  }) : super.paint(paint);

  factory ImageContent.fromJson(Map<String, dynamic> data) {
    return ImageContent.data(
      startPoint: jsonToOffset(data['startPoint'] as Map<String, dynamic>),
      size: jsonToOffset(data['size'] as Map<String, dynamic>),
      imageUrl: data['image'] as String,
      image: data['imageUrl'] as ui.Image,
      paint: jsonToPaint(data['paint'] as Map<String, dynamic>),
    );
  }
  @override
  void startDraw(Offset startPoint) => this.startPoint = startPoint;

  @override
  void drawing(Offset nowPoint) => size = nowPoint - startPoint;

  @override
  void draw(Canvas canvas, Size size, bool deeper) {
    final Rect rect = Rect.fromPoints(startPoint, startPoint + this.size);
    paintImage(canvas: canvas, rect: rect, image: image, fit: BoxFit.fill);
  }

  @override
  ImageContent copy() => ImageContent(image);

  @override
  Map<String, dynamic> toContentJson() {
    return <String, dynamic>{
      'startPoint': startPoint.toJson(),
      'size': size.toJson(),
      'imageUrl': imageUrl,
      'image': image,
      'Paint': paint.toJson(),
    };
  }

  Offset startPoint = Offset.zero;
  Offset size = Offset.zero;
  final String imageUrl;
  final ui.Image image;
}

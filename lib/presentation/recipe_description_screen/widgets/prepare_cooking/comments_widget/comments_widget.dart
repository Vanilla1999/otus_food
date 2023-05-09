import 'dart:async';
import 'dart:io';

import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:otus_food/data/model/comment.dart';

import 'package:otus_food/presentation/recipe_description_screen/bloc/recipe_description_cubit.dart';

class CommentsWidget extends StatelessWidget {
  final ValueNotifier<List<Comment>> valueNotifier;
  final RecipeDescriptionCubit cubit;
  final List<Comment> comments;
  final ScrollController scrollController;
  final ScrollController commentScrollController = ScrollController();
   CommentsWidget({Key? key,
    required this.comments,
    required this.cubit,
    required this.valueNotifier,
    required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CommentsListWidget(
          comments: comments,
          valueNotifier: valueNotifier
        ),
        Padding(
          padding: const EdgeInsets.only(left: 17, right: 16, bottom: 37),
          child: _CustomEdittext(
            cubit: cubit,
            scrollController: scrollController
          ),
        )
      ],
    );
  }
}

class _CommentsListWidget extends StatefulWidget {
  final List<Comment> comments;
  final ValueNotifier<List<Comment>> valueNotifier;
  final ScrollController commentScrollController = ScrollController();

   _CommentsListWidget(
      {Key? key, required this.comments, required this.valueNotifier})
      : super(key: key);

  @override
  State<_CommentsListWidget> createState() => _CommentsWidgetState();
}

class _CommentsWidgetState extends State<_CommentsListWidget> {

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  double _maxHeight(bool emptyOrNot, double minvalue, double maxvalue) {
    if (emptyOrNot) {
      return minvalue;
    } else {
      return maxvalue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: widget.valueNotifier,
        builder: (BuildContext context, List<Comment> value, Widget? child) {
          Future.delayed(Duration.zero, () =>
              widget.commentScrollController.animateTo(
                widget.commentScrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 100),
                curve: Curves.fastOutSlowIn)
          );
          return Container(
            constraints: BoxConstraints(
                maxHeight: _maxHeight(value.isEmpty, 0, 300)),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 25, left: 17, right: 16, bottom: 48),
              child: ListView.separated(
                  controller: widget.commentScrollController,
                  itemBuilder: (context, index) {
                    final comment = value[index];
                    final commentDate =
                    DateTime.fromMillisecondsSinceEpoch(comment.time);
                    final commentDateString =
                    DateFormat('dd.MM.yyyy').format(commentDate);
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 7),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(360),
                            child: Image(
                                height: 63,
                                width: 63,
                                image: AssetImage(comment.accountImg)),
                          ),
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      comment.accountName,
                                      style: const TextStyle(
                                          color: Color(0xff2ECC71),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Text(
                                    commentDateString,
                                    style: const TextStyle(
                                        color: Color(0xffC2C2C2),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                comment.text,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                height: _maxHeight(comment.img.isEmpty, 0, 160),
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Center(
                                        child: Container(
                                          decoration: const BoxDecoration(
                                              borderRadius:
                                              BorderRadius.all(
                                                  Radius.circular(5))),
                                          clipBehavior: Clip.antiAlias,
                                          child: Image.file(
                                              File(comment.img[index]),
                                              height: 160,
                                              width: 160,
                                              fit: BoxFit.fitWidth),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(
                                        width: 10,
                                      );
                                    },
                                    itemCount: comment.img.length),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: value.length),
            ),
          );
        });
  }
}

class _CustomEdittext extends StatefulWidget {
  final RecipeDescriptionCubit cubit;
  final ScrollController scrollController;

  const _CustomEdittext(
      {Key? key, required this.cubit, required this.scrollController})
      : super(key: key);

  @override
  State<_CustomEdittext> createState() => _CustomEdittextState();
}

class _CustomEdittextState extends State<_CustomEdittext> {
  final TextEditingController textEditingController = TextEditingController();
  final listPhotos = <String>[];
  late StreamSubscription<bool> keyboardSubscription;
  var isKeyboardVisible = false;
  bool focus = false;
  FocusNode _focus = FocusNode();

  void _onFocusChange() {
    setState(() {
      focus = !focus;
    });
  }

  @override
  void initState() {
    super.initState();
    var keyboardVisibilityController = KeyboardVisibilityController();
    _focus.addListener(_onFocusChange);
    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
          setState(() {
            isKeyboardVisible = visible;
          });
        });
  }

  double _paddingKeyboard(BuildContext context, bool isKeyboardVisible) {
    if (isKeyboardVisible) {
      if (!_flagDeleteImage) {
        widget.scrollController.animateTo(
            widget.scrollController.position.maxScrollExtent +
                MediaQuery
                    .of(context)
                    .viewInsets
                    .bottom,
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear);
      } else {
        _flagDeleteImage = false;
      }
      return MediaQuery
          .of(context)
          .viewInsets
          .bottom;
    } else {
      return 30.0;
    }
  }

  bool _flagDeleteImage = false;

  void _deleteImageFromList(int index) {
    widget.cubit.removeFromDisk(listPhotos[index]);
    setState(() {
      listPhotos.removeAt(index);
      _flagDeleteImage = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.only(bottom: _paddingKeyboard(context, isKeyboardVisible)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          border: Border.all(color: const Color(0xff165932), width: 2),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding:
                    const EdgeInsets.only(left: 14, right: 14, bottom: 14),
                    child: TextField(
                      focusNode: _focus,
                      controller: textEditingController,
                      maxLines: 2,
                      decoration: const InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: "оставить комментарий",
                          hintStyle: TextStyle(color: Color(0xffC2C2C2))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Row(
                    children: [
                      IconButton(
                        color: const Color(0xff165932),
                        icon: const Icon(Icons.image),
                        onPressed: () {
                          _focus.requestFocus();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      CameraCamera(
                                        onFile: (file) {
                                          //photos.add(file);
                                          //When take foto you should close camera
                                          Navigator.pop(context);
                                          setState(() {
                                            listPhotos.add(file.path);
                                          });
                                        },
                                      )));
                        },
                      ),
                      if (focus)
                        IconButton(
                          color: const Color(0xff165932),
                          icon: const Icon(Icons.send),
                          onPressed: () {
                            if (textEditingController.text.isNotEmpty) {
                              widget.cubit.addNewComment(
                                  textEditingController.text, listPhotos);
                            }
                          },
                        ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: _maxHeight(listPhotos),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Container(
                          height: 76,
                          width: 76,
                          child: Stack(alignment: Alignment.center, children: [
                            Container(
                              decoration: const BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                              clipBehavior: Clip.antiAlias,
                              child: Image.file(
                                File(listPhotos[index]),
                                height: 63,
                                width: 63,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                                top: -13.0,
                                right: -13.0,
                                child: IconButton(
                                    onPressed: () {
                                      _deleteImageFromList(index);
                                    },
                                    icon: const Icon(
                                        color: Colors.red, Icons.cancel))),
                          ]),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 14,
                      );
                    },
                    itemCount: listPhotos.length),
              ),
            )
          ],
        ),
      ),
    );
  }

  double _maxHeight(List<String> value) {
    if (value.isEmpty) {
      return 0;
    } else {
      return 100;
    }
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
    super.dispose();
  }
}

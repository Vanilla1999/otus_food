import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:otus_food/data/model/comment.dart';

import 'package:otus_food/presentation/recipe_description_screen/bloc/recipe_description_cubit.dart';

class CommentsWidget extends StatelessWidget {
  final ValueNotifier<List<Comment>> valueNotifier;
  final RecipeDescriptionCubit cubit;
  final List<Comment> comments;

  const CommentsWidget(
      {Key? key,
      required this.comments,
      required this.cubit,
      required this.valueNotifier})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CommentsListWidget(
          comments: comments,
          valueNotifier: valueNotifier,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 17, right: 16, bottom: 37),
          child: _CustomEdittext(cubit: cubit),
        )
      ],
    );
  }
}

class _CommentsListWidget extends StatefulWidget {
  final List<Comment> comments;
  final ValueNotifier<List<Comment>> valueNotifier;

  const _CommentsListWidget(
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

  double _maxHeight(List<Comment> value) {
    if (value.isEmpty) {
      return 0;
    } else {
      return 264;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: widget.valueNotifier,
        builder: (BuildContext context, List<Comment> value, Widget? child) {
          return Padding(
            padding:
                const EdgeInsets.only(top: 25, left: 17, right: 16, bottom: 48),
            child: Container(
              constraints: BoxConstraints(maxHeight: _maxHeight(value)),
              child: ListView.separated(
                  physics: const ScrollPhysics(),
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
                              Image(
                                  height: 160,
                                  width: double.infinity,
                                  fit: BoxFit.fitWidth,
                                  image: AssetImage(comment.img)),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 14,
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

  const _CustomEdittext({Key? key, required this.cubit}) : super(key: key);

  @override
  State<_CustomEdittext> createState() => _CustomEdittextState();
}

class _CustomEdittextState extends State<_CustomEdittext> {
  final TextEditingController textEditingController = TextEditingController();
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
    _focus.addListener(_onFocusChange);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        border: Border.all(color: const Color(0xff165932), width: 2),
      ),
      child: Row(
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 14, right: 14, bottom: 14),
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => CameraCamera(
                              onFile: (file) {
                                //photos.add(file);
                                //When take foto you should close camera
                                Navigator.pop(context);
                                // setState(() {});
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
                        widget.cubit.addNewComment(textEditingController.text,
                            "assets/images/comment_image.jpg");
                      }
                    },
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }
}

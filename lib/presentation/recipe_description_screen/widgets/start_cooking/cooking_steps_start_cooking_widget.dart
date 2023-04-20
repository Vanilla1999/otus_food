import 'package:flutter/material.dart';
import 'package:otus_food/data/model/cooking_step.dart';
import 'package:otus_food/presentation/components/styles.dart';
import 'package:otus_food/utils/extention.dart';

class CookingStepsStartCookingWidget extends StatelessWidget {
  final List<CookingStep> cookingSteps;

  const CookingStepsStartCookingWidget({Key? key, required this.cookingSteps})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 19, 15, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Шаги приготовления",
            style: title,
          ),
          const SizedBox(
            height: 20,
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return _CookingStepItem(cookingStep: cookingSteps[index]);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 14,
                );
              },
              itemCount: cookingSteps.length)
        ],
      ),
    );
  }
}

class _CookingStepItem extends StatelessWidget {
  final CookingStep cookingStep;

  const _CookingStepItem({Key? key, required this.cookingStep})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
          color: const Color(0xff2ECC71).withOpacity(0.15),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          const SizedBox(
            width: 24,
          ),
          Text(
            cookingStep.numberStep.toString(),
            style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w900,
                color: Color(0xff2ECC71)),
          ),
          const SizedBox(
            width: 24,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 17, bottom: 15),
              child: Text(
                style: const TextStyle(
                    color: Color(0xff2D490C),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
                maxLines: 4,
                cookingStep.description,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const SizedBox(
            width: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 33),
            child: Column(
              children: [
                _CheckBoxStep(),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  cookingStep.time.timeToString(),
                  style: const TextStyle(
                      color: Color(0xff165932),
                      fontSize: 13,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 22,
          ),
        ],
      ),
    );
  }
}

class _CheckBoxStep extends StatefulWidget {
  bool isChecked = false;

  _CheckBoxStep({Key? key}) : super(key: key);

  @override
  State<_CheckBoxStep> createState() => _CheckBoxStepState();
}

class _CheckBoxStepState extends State<_CheckBoxStep> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 30,width: 30,
      child: Transform.scale(
        scale: (30/Checkbox.width),
        child: Checkbox(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          checkColor: Colors.white,
          value: widget.isChecked,
          fillColor:
              MaterialStateColor.resolveWith((states) => const Color(0xff165932)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5/(30/Checkbox.width))),
          side: const BorderSide(width: 4/(30/Checkbox.width), color: const Color(0xff165932)),
          onChanged: (bool? value) {
            setState(() {
              widget.isChecked = value!;
            });
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:otus_food/data/model/cooking_step.dart';
import 'package:otus_food/presentation/components/styles.dart';
import 'package:otus_food/utils/colors.dart';

class CookingStepsWidget extends StatelessWidget {
  final List<CookingStep> cookingSteps;

  const CookingStepsWidget({Key? key, required this.cookingSteps})
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
          color: const Color(0xffECECEC), borderRadius: BorderRadius.circular(5)),
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
                color: Color(0xffC2C2C2)),
          ),
          const SizedBox(
            width: 24,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 17, bottom: 15),
              child: Text(
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
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
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: const Color(0xff797676), width: 4)),
                ),
                const SizedBox(height: 14,),
                Text(cookingStep.time.timeToString(),style: const TextStyle(color: Color(0xff797676),fontSize: 13,fontWeight: FontWeight.w700),)
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

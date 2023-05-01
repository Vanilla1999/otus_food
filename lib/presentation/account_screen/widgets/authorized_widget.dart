import 'dart:io';

import 'package:flutter/material.dart';
import 'package:otus_food/data/model/account.dart';
import 'package:otus_food/presentation/account_screen/bloc/account_screen_cubit.dart';

class Authorized extends StatelessWidget {
  final AccountScreenCubit cubit;
  final Account account;

  const Authorized({Key? key, required this.cubit, required this.account})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            foregroundDecoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 4, color: const Color(0xff165932))),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 4, color: const Color(0xff165932))),
            clipBehavior: Clip.hardEdge,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 13, top: 14, right: 14, bottom: 13),
              child: Image.file(
                File(account.img),
                height: 96,
                width: 96,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 29,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color(0xffE4E3E3),
                  blurRadius: 4.0,
                  spreadRadius: 4.0,
                  offset: Offset(0, 4.0), // shadow direction: bottom right
                )
              ],
            ),
            child: Row(
              children:  [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, top: 21, bottom: 20),
                    child: Text(
                      "Логин",
                      style: TextStyle(color: Color(0xff165932), fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(right: 20, top: 21, bottom: 20),
                  child: Text(
                    account.name,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        color: Color(0xff2ecc71),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ))
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              splashFactory: InkRipple.splashFactory,
              backgroundColor: Colors.white,
              foregroundColor: Colors.grey.shade400,
              shadowColor: const Color(0xffE4E3E3) ,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5), // <-- Radius
              ),
            ),
            onPressed: () {
              cubit.exit();
            },
            child: const Center(
                child: Padding(
              padding: EdgeInsets.only(top: 17, bottom: 16),
              child: Text(
                "Выход",
                style: TextStyle(color: Color(0xffF54848),fontSize: 16),
              ),
            )),
          ),
        )
      ],
    );
  }
}

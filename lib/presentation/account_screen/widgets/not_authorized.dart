import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:otus_food/presentation/account_screen/bloc/account_screen_cubit.dart';
import 'package:otus_food/presentation/account_screen/bloc/account_screen_state.dart';

class NotAuthorized extends StatelessWidget {
  final AccountScreenCubit cubit;
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  NotAuthorized({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
              height: 123,
              width: 123,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image.asset("assets/images/logo.webp")),
        ),
        const SizedBox(
          height: 42,
        ),
        Form(
          key: _formKey,
            child: Column(
          children: [
            Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(8),
              child: TextFormField(
                validator: (value) {
                  if (!EmailValidator.validate(value!)) {
                    return 'Пожалуйста, введите правильный адресс';
                  }
                  return null;
                },
                controller: loginController,
                maxLines: 1,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: "Введите email",
                    contentPadding:
                        const EdgeInsets.only(top: 21, left: 15, bottom: 20),
                    hintStyle: const TextStyle(
                        color: Color(0xff165932), fontSize: 16)),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(8),
              child: TextFormField(
                validator: (value) {
                  if (!value!.isNotEmpty) {
                    return 'Пароль не должен быть пустым';
                  }
                  return null;
                },
                controller: passwordController,
                maxLines: 1,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: "пароль",
                    contentPadding:
                        const EdgeInsets.only(top: 21, left: 15, bottom: 20),
                    hintStyle: const TextStyle(
                        color: Color(0xff165932), fontSize: 16)),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xff2ECC71))),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  cubit.auth(loginController.text, passwordController.text);
                }
              },
              child: const Center(
                child: Text("Авторизоваться",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ],
        )),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xff2ECC71))),
          onPressed: () {},
          child: const Center(
            child: Text("Зарегистрироваться",
                style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
        ),
      ],
    );
  }
}

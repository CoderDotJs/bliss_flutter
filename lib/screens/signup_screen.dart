import 'package:flutter/material.dart';
import 'package:frontend/constants/app_regex.dart';
import 'package:frontend/controllers/signup_controller.dart';
import 'package:get/get.dart';
import 'package:frontend/components/app_text_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  final ValueNotifier<bool> passwordNotifier = ValueNotifier(true);
  final ValueNotifier<bool> fieldValidNotifier = ValueNotifier(false);

  final SignupController signupController = Get.put(SignupController());

  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  void initializeControllers() {
    signupController.nameController = TextEditingController()..addListener(controllerListener);
    signupController.emailController = TextEditingController()..addListener(controllerListener);
    signupController.passwordController = TextEditingController()
      ..addListener(controllerListener);
  }

  void disposeControllers() {
    signupController.nameController.dispose();
    signupController.emailController.dispose();
    signupController.passwordController.dispose();
  }

  void controllerListener() {
    final name = signupController.nameController.text;
    final email = signupController.emailController.text;
    final password = signupController.passwordController.text;

    if (name.isEmpty && email.isEmpty && password.isEmpty) return;

    if (AppRegex.emailRegex.hasMatch(email) &&
        AppRegex.passwordRegex.hasMatch(password)) {
      fieldValidNotifier.value = true;
    } else {
      fieldValidNotifier.value = false;
    }
  }

  @override
  void initState() {
    initializeControllers();
    super.initState();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: const Color.fromRGBO(31, 61, 124, 1),
            width: double.infinity,
            height: 300,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: const Text(
            'Create New \nAccount',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 34,
              letterSpacing: 0.5,
            ),
          ),
          ),
          const SizedBox(height: 20),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AppTextFormField(
                    controller: signupController.nameController,
                    labelText: 'Name',
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    onChanged: (_) => _formKey.currentState?.validate(),
                    validator: (value) {
                      return value!.isEmpty
                          ? 'Please, Enter Your Name'
                          : value.isEmpty
                              ? 'Invalid Name'
                              : null;
                    },
                  ),
                  AppTextFormField(
                    controller: signupController.emailController,
                    labelText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onChanged: (_) => _formKey.currentState?.validate(),
                    validator: (value) {
                      return value!.isEmpty
                          ? 'Please, Enter Email Address'
                          : AppRegex.emailRegex.hasMatch(value)
                              ? null
                              : 'Invalid Email Address';
                    },
                  ),
                  ValueListenableBuilder(
                    valueListenable: passwordNotifier,
                    builder: (_, passwordObscure, __) {
                      return AppTextFormField(
                        obscureText: passwordObscure,
                        controller: signupController.passwordController,
                        labelText: 'Password',
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (_) => _formKey.currentState?.validate(),
                        validator: (value) {
                          return value!.isEmpty
                              ? 'Please, Enter Password'
                              : AppRegex.passwordRegex.hasMatch(value)
                                  ? null
                                  : 'Invalid Password';
                        },
                        suffixIcon: IconButton(
                          onPressed: () =>
                              passwordNotifier.value = !passwordObscure,
                          style: IconButton.styleFrom(
                            minimumSize: const Size.square(48),
                          ),
                          icon: Icon(
                            passwordObscure
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: ValueListenableBuilder(
                    valueListenable: fieldValidNotifier,
                    builder: (_, isValid, __) {
                      return FilledButton(
                        onPressed: isValid
                            ? () {
                                signupController.registerWithEmail();
                              }
                            : null,
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(
                                const Size(double.infinity, 50)
                                ),
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                    )
                                ),
                                padding: const MaterialStatePropertyAll(
                                  EdgeInsets.fromLTRB(0, 25, 0, 25)
                                  )
                                 // Adjust the height as needed
                            ),
                        child: const Text('Login'),
                      );
                    },
                  ),),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Already have an account?',
              ),
              const SizedBox(width: 4),
              TextButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/login');
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ],) ,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:frontend/components/app_text_field.dart';
import 'package:frontend/components/bottom_nav.dart';
import 'package:frontend/controllers/new_product_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class NewProductScreen extends StatefulWidget{
  const NewProductScreen({super.key});

  @override
  State<NewProductScreen> createState() => _NewProductScreenState();
}

class _NewProductScreenState extends State<NewProductScreen> {
    final _formKey = GlobalKey<FormState>();

  final ValueNotifier<bool> fieldValidNotifier = ValueNotifier(false);

  final NewProductController newProductController = Get.put(NewProductController());

  void initializeControllers() {
    newProductController.nameController = TextEditingController()..addListener(controllerListener);
    newProductController.descController = TextEditingController()
      ..addListener(controllerListener);
    newProductController.priceController = TextEditingController()
      ..addListener(controllerListener);
    newProductController.stockController = TextEditingController()
      ..addListener(controllerListener);
  }

  void disposeControllers() {
    newProductController.nameController.dispose();
    newProductController.descController.dispose();
    newProductController.priceController.dispose();
    newProductController.stockController.dispose();
  }

  void controllerListener() {
    final name = newProductController.nameController.text;
    final desc = newProductController.descController.text;
    final price = newProductController.priceController.text;
    final stock = newProductController.stockController.text;

    if (name.isEmpty && desc.isEmpty && price.isEmpty && stock.isEmpty) {
      fieldValidNotifier.value = false;
    }else{
      fieldValidNotifier.value = true;

    }
  }

  @override
  void initState() {
    super.initState();
    initializeControllers();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Product Create!'), backgroundColor: Colors.blueAccent,foregroundColor: Colors.white),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
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
                    controller: newProductController.nameController,
                    labelText: 'Name',
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    onChanged: (_) => _formKey.currentState?.validate(),
                    validator: (value) {
                      return value!.isEmpty
                          ? 'Please, Enter Prouct Name'
                          : null;
                    },
                  ),
                  const SizedBox(height: 20),
                  AppTextFormField(
                    controller: newProductController.descController,
                    labelText: 'Description',
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    onChanged: (_) => _formKey.currentState?.validate(),
                    validator: (value) {
                      return value!.isEmpty
                          ? 'Please, Enter Product Description'
                          : null;
                    },
                  ),
                  const SizedBox(height: 20),
                  AppTextFormField(
                    controller: newProductController.stockController,
                    labelText: 'Stock',
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    onChanged: (_) => _formKey.currentState?.validate(),
                    validator: (value) {
                      return value!.isEmpty
                          ? 'Please, Enter Total Stock'
                          : value.isNum ? null: 'Invalid Input';
                    },
                  ),
                  const SizedBox(height: 20),
                  AppTextFormField(
                    controller: newProductController.priceController,
                    labelText: 'Price',
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    onChanged: (_) => _formKey.currentState?.validate(),
                    validator: (value) {
                      return value!.isEmpty
                          ? 'Please, Enter Price'
                          : value.isNum ? null: 'Invalid Input';
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(right: 10),
                        child: ElevatedButton(
                        onPressed: () {
                          newProductController.pickImage(ImageSource.gallery);
                        },
                      child: const Text('Pick Image'),
                      ),),
                  Obx(() =>
                    newProductController.image.value != null
                    ?
                    SizedBox(width: 100, height: 100,child: Image.file(newProductController.image.value!, height: 100,width: 100,),)
                    : const Text('No image selected',),
                  ),],),
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: ValueListenableBuilder(
                    valueListenable: fieldValidNotifier,
                    builder: (_, isValid, __) {
                      return FilledButton(
                        onPressed: isValid
                            ? (){
                                newProductController.createProduct();
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
                        child: const Text('Submit'),
                      );
                    },
                  ),),
                ],
              ),
            ),
          ),
        ],) ,
    );
  }
}
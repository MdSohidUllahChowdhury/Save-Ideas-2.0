import 'package:get/get.dart';

class Counting extends GetxController {
  RxInt startPoint = RxInt(0);

  RxString saveitems = RxString('Add Your Ideas');

  increment() {
    startPoint.value++;
  }

  decrement() {
    startPoint.value--;
  }
}

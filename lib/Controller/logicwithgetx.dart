import 'package:get/get.dart';


class Counting extends GetxController {
  
  RxInt startPoint = RxInt(0);

  increment (){
    
    startPoint.value++;
    
  }

  decrement (){
    
    startPoint.value--;
    
  }
  
}
import 'package:get/get.dart';

class EditController extends  GetxController{
  var set_data={}.obs;
  var feedback_id="".obs;

  set_id(val){
    feedback_id(val);
  }
  set_single_data(val){
    set_data(val);
    update();
  }

}
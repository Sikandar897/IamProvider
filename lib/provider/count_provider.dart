import 'package:flutter/foundation.dart';

class CountProvider with ChangeNotifier{
  int _count = 50;  //declear a count veribale here
  int get count => _count;  //idher hum ney get kiya count ko abh agey set krenegy esko esi trha pher hum count exaple mai jodher es countprovider ka veriable baneynge odher os mai hum ny os verible ko class provider de diya hai

  void setCount (){ 
    _count ++;
    notifyListeners();  //jab be mai ess setCount ko call karnuga toh ye notifyLister os ko notify krege amd value ko incremenet krega initily 52 hojyege and geter method sy hum get kr lingy 
  }
}
import 'package:food/data/repository/location_repo.dart';
import 'package:get/get.dart';

import '../models/address_model.dart';

class LocationController extends GetxController implements GetxService{
  LocationRepo locationRepo;
  LocationController({required this.locationRepo});
  bool _loading=false;
  List<AddressModel> _addressList=[];
  List<AddressModel> get addressList=>_addressList;
  late List<AddressModel> _allAddressList;
  final List<String> _addressTypeList=["home","office","others"];
  List<String> get addressTypeList=>_addressTypeList;
  int _addressTypeIndex=0;
  void setAddressTypeIndex(int index){
    _addressTypeIndex=index;
    update();
  }
}
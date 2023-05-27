class AddressModel{
  late int? _id;
  late String _addressType;
  late String? _contactPersonName;
  late String? _contactPersonNumber;
  late String _address;

  AddressModel({
    id,
    required addressType,
    contactPersonName,
    contactPersonNumber,
    address
}){
   _id=id;
   _addressType=addressType;
   _contactPersonName=contactPersonName;
   _contactPersonNumber=contactPersonName;
   _address=address;
  }
  String get address=>_address;
  String get addressType=>_addressType;
  String? get contactPersonName=>_contactPersonName;
  String? get contactPersonNumber=>_contactPersonNumber;

  AddressModel.fromJson(Map<String,dynamic> json){
    _id=json['id'];
    _addressType=json["address_type"]??"";
    _contactPersonNumber=json["contact_person_number"]??"";
    _contactPersonName=json["contact_person_name"]??"";
    _address=json["address"];
  }

}
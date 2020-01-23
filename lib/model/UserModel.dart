class UserModel {

   int id ;
   String name;
   String username;
   String email;
   AddressModel address;
   String phone;
   String website;
   CompanyModel company;

  UserModel({this.id,this.name, this.username,this.email,this.address,
                this.phone,this.website,this.company});

   factory UserModel.fromJson(Map<String,dynamic> parsedJson){
        return UserModel(id : parsedJson['id'] as int,
        name : parsedJson['name'],
        username : parsedJson['username'],
        email : parsedJson['email'],
        address : AddressModel.fromJson(parsedJson['address']),
        phone : parsedJson['phone'],
        website : parsedJson['website'],
        company : CompanyModel.fromJson(parsedJson['company'])
     );
   }
   
   }
   
   class CompanyModel {

     String name;
     String catchPhrase;
     String bs;

     CompanyModel.fromJson(Map<String,dynamic> parsedJson){

        name = parsedJson['name'];
        catchPhrase = parsedJson['catchPhrase'];
        bs = parsedJson['bs'];

     }

}

class AddressModel {

  String street;
  String suite;
  String city;
  String zipcode;
  GeoModel geo;

  AddressModel.fromJson(Map<String,dynamic> parsedJson){

       street =  parsedJson['street'];
       suite = parsedJson['suite'];
       city = parsedJson['city'];
       zipcode = parsedJson['zipcode'];
       geo = GeoModel.fromJson(parsedJson['geo']);

     }
  }
  
  class GeoModel {

    String lat;
    String lng;

     GeoModel.fromJson(Map<String,dynamic> parsedJson){

       lat = parsedJson['lat'];
       lng = parsedJson['lng'];

     }
  }


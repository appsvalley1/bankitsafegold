import 'package:safegoldapp/loginresponse/kyc_requirement.dart';

class LoginResp {

  int id;
  String name;
  String mobile_no;
  String pincode;
  String email;
  Object gold_balance;
  Kyc_requirement kyc_requirement;

	LoginResp.fromJsonMap(Map<String, dynamic> map): 
		id = map["id"],
		name = map["name"],
		mobile_no = map["mobile_no"],
		pincode = map["pincode"],
		email = map["email"],
		gold_balance = map["gold_balance"],
		kyc_requirement = Kyc_requirement.fromJsonMap(map["kyc_requirement"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['name'] = name;
		data['mobile_no'] = mobile_no;
		data['pincode'] = pincode;
		data['email'] = email;
		data['gold_balance'] = gold_balance;
		data['kyc_requirement'] = kyc_requirement == null ? null : kyc_requirement.toJson();
		return data;
	}
}

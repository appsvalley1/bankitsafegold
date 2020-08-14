
class Kyc_requirement {

  int identity_required;
  int pan_required;

	Kyc_requirement.fromJsonMap(Map<String, dynamic> map): 
		identity_required = map["identity_required"],
		pan_required = map["pan_required"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['identity_required'] = identity_required;
		data['pan_required'] = pan_required;
		return data;
	}
}

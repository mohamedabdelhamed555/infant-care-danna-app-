import 'package:dio/dio.dart';
import 'package:graduation/models/hospital_card_model.dart';

class HospitalServices {
  final Dio dio;
  HospitalServices(this.dio);

  Future<List<HospitalModel>> getHospitals() async {
    var response = await dio.get('http://danna-pi.vercel.app/api/v1/hospitals');
    Map<String, dynamic> jsonData = response.data;
    List<dynamic> hospitals = jsonData['result'];
    List<HospitalModel> hospitalsList = [];
    for (var hospital in hospitals) {
      HospitalModel hospitalModel = HospitalModel(
          name: hospital['hospital']['userName'],
          imageUrl: hospital['hospital']['profileImage']['url'],
          address: hospital['address'],
          numOfIncubations: hospital['availableIncubations']);
      hospitalsList.add(hospitalModel);
    }
    return hospitalsList;
  }
}

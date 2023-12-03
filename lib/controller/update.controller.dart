import 'package:blooddonation3/controller/home_controller.dart';
import 'package:blooddonation3/services/donor_service.dart';
import 'package:flutter/material.dart';

class UpdateController extends ChangeNotifier {
  Homecontroller homeData = Homecontroller();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  final List bloodGroups = ['A+', "A-", "B+", "B-", "O+", "O-", "AB+", "AB-"];
  String? selectedGroups;


  // updateHonors
  updateDonor(docId) async {
    await DonorFirebaseService().updateDonors(
    nameController.text, numberController.text, selectedGroups, docId);
    homeData.donorDatas;
    notifyListeners();
  }
}

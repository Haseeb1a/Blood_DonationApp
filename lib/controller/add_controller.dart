import 'package:blooddonation3/controller/home_controller.dart';
import 'package:blooddonation3/services/donor_service.dart';
import 'package:flutter/material.dart';

class AddController extends ChangeNotifier {
  Homecontroller homeData = Homecontroller();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  final List bloodGroups = ['A+', "A-", "B+", "B-", "O+", "O-", "AB+", "AB-"];
  String? selectedGroups;
  void addDonor() {
    DonorFirebaseService().submitDonoer(
        nameController.text, numberController.text, selectedGroups);
    homeData.donorDatas;
    notifyListeners();
    nameController.clear();
    numberController.clear();
  }
}

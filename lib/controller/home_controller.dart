import 'package:blooddonation3/model/donor_model.dart';
import 'package:blooddonation3/services/donor_service.dart';
import 'package:flutter/material.dart';

class Homecontroller extends ChangeNotifier {
  List<DonorModel> donorDatas = [];
  // getDonors
  Future<void> fecthDonorDatas() async {
    donorDatas = await DonorFirebaseService().getDonors();
    notifyListeners();
  }

  // deletedonors
  deleteDonor(docId) async {
    await DonorFirebaseService().removeDonor(docId);
    fecthDonorDatas();
    notifyListeners();
  }
}

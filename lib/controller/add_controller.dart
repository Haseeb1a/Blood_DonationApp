import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddController extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  final List bloodGroups = ['A+', "A-", "B+", "B-", "O+", "O-", "AB+", "AB-"];
  String? selectedGroups;

  final CollectionReference donor = FirebaseFirestore.instance.collection('donor');
  void addDonor() {
    final data = {
      'name': nameController.text,
      "phone": numberController.text,
      "group": selectedGroups
    };
    donor.add(data);
    nameController.clear();
    numberController.clear();
  }

  deleteDonor(docId) {
    donor.doc(docId).delete();
  }
}

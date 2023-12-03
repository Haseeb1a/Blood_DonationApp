import 'package:blooddonation3/model/donor_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DonorFirebaseService {
  final CollectionReference donor =
      FirebaseFirestore.instance.collection('donor');

  // donor fetch
  Future<List<DonorModel>> getDonors() async {
    final snapshot = await donor.orderBy('name').get();
    return snapshot.docs.map((doc) {
      return DonorModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
    }).toList();
  }

  // addd donor
  submitDonoer(name, phone, group) {
    final data = DonorModel(name: name, phone: phone, group: group).toMap();
    donor.add(data);
  }

  // delete  donor
  removeDonor(docId) {
    donor.doc(docId).delete();
  }

  // udpate donor
  updateDonors(name, phone, group, id) {
    final data = DonorModel(name: name, phone: phone, group: group).toMap();
    donor.doc(id).update(data);
  }
}

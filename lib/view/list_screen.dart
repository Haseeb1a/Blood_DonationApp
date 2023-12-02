import 'package:blooddonation3/controller/add_controller.dart';
import 'package:blooddonation3/view/add_screen.dart';
import 'package:blooddonation3/view/update_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersList extends StatelessWidget {
  UsersList({super.key});
  @override
  Widget build(BuildContext context) {
    final addData = Provider.of<AddController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Donors List',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: StreamBuilder(
        stream: addData.donor.orderBy('name').snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                // print('sanpppppppppppppppp$snapshot');
                // print('dataaaaaaaaaaaaaaa${snapshot.data.docs[index]}');
                final DocumentSnapshot donorSnap = snapshot.data.docs[index];
                return Card(
                  child: ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          donorSnap['group'],
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.black,
                      ),
                      title: Text(donorSnap['name']),
                      subtitle: Text(donorSnap['phone'].toString()),
                      // trailing: Row(),//
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UpdataUser(
                                              name: donorSnap['name'],
                                              number: donorSnap['phone'].toString(),
                                              group: donorSnap['group'],
                                              id: donorSnap.id,
                                            )));
                              },
                              icon: Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                addData.deleteDonor(donorSnap.id);
                              },
                              icon: Icon(Icons.delete),
                            )
                          ],
                        ),
                      )),
                );
              },
            );
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddPage(),
                ));
          }),
    );
  }
}

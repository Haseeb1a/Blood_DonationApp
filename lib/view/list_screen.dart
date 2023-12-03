import 'package:blooddonation3/controller/home_controller.dart';
import 'package:blooddonation3/model/donor_model.dart';
import 'package:blooddonation3/view/add_screen.dart';
import 'package:blooddonation3/view/update_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersList extends StatelessWidget {
  UsersList({super.key});
  @override
  Widget build(BuildContext context) {
      Provider.of<Homecontroller>(context).fecthDonorDatas();
    final addData = Provider.of<Homecontroller>(context);
    return Scaffold(
            appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'DONORS ',
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'LIST',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        centerTitle: true,
      ),
      body: Consumer<Homecontroller>(builder: (context, value, index) {
        if (value.donorDatas.isEmpty) {
          return const Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.black,
                  child: Icon(Icons.bloodtype,color: Colors.red,size: 40,)
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Add Donors',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ));
        }
        return ListView.builder(
          itemCount: value.donorDatas.length,
          itemBuilder: (context, index) {
            final DonorModel donorSnap = value.donorDatas[index];
            return Card(
              child: ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      donorSnap.group .toString()  ,
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.black,
                  ),
                  title: Text(donorSnap.name.toString() ),
                  subtitle: Text(donorSnap.phone.toString() ),
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
                                          name: donorSnap.name.toString() ,
                                          number: donorSnap.phone.toString(),
                                          group: donorSnap.group.toString() ,
                                          id: donorSnap.id,
                                        )));
                          },
                          icon: const Icon(Icons.edit),color: Colors.blue,
                        ),
                        IconButton(
                          onPressed: () {
                            addData.deleteDonor(donorSnap.id);
                          },
                          icon: const Icon(Icons.delete,color: Colors.red,),
                        )
                      ],
                    ),
                  )),
            );
          },
        );
      }),
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

import 'package:blooddonation3/controller/add_controller.dart';
import 'package:blooddonation3/view/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPage extends StatelessWidget {
  AddPage({super.key});
  @override
  Widget build(BuildContext context) {
    final addData = Provider.of<AddController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Domer',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: addData.nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text('Doner ')),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: addData.numberController,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text('Phone Number ')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField(
                  decoration:
                      const InputDecoration(label: Text('Select Blood Group')),
                  items: addData.bloodGroups
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (val) {
                    addData.selectedGroups = val as String?;
                  }),
            ),
            ElevatedButton(
                style: const ButtonStyle(
                    minimumSize:
                        MaterialStatePropertyAll(Size(double.infinity, 50)),
                    backgroundColor: MaterialStatePropertyAll(Colors.red)),
                onPressed: () {
                  addData.addDonor();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UsersList(),
                      ));
                },
                child: const Text(
                  'submit',
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}

import 'package:blooddonation3/controller/update.controller.dart';
import 'package:blooddonation3/view/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdataUser extends StatelessWidget {
  final String name;
  final String number;
  final String group;
  final dynamic id;
  UpdataUser(
      {super.key,
      required this.name,
      required this.number,
      required this.group,
      required this.id});
  @override
  Widget build(BuildContext context) {
    print(number);
    print(id);
    print(name);
    print(group);
    final updateData = Provider.of<UpdateController>(context);
    updateData.nameController.text = name;
    updateData.numberController.text = number;
    updateData.selectedGroups = group;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Update Doner',
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
                controller: updateData.nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text('Doner ')),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: updateData.numberController,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text('Phone Number ')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField(
                  value: updateData.selectedGroups,
                  decoration:
                      const InputDecoration(label: Text('Select Blood Group')),
                  items: updateData.bloodGroups
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (val) {
                    updateData.selectedGroups = val as String?;
                  }),
            ),
            ElevatedButton(
                style: const ButtonStyle(
                    minimumSize:
                        MaterialStatePropertyAll(Size(double.infinity, 50)),
                    backgroundColor: MaterialStatePropertyAll(Colors.red)),
                onPressed: () {
                  updateData.updateDonor(id);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UsersList(),
                      ));
                },
                child: const Text(
                  'update',
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}

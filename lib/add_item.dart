import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  TextEditingController _controllerName=TextEditingController();
  TextEditingController _controllerQuantity=TextEditingController();
  TextEditingController _controllerFavorite=TextEditingController();

  GlobalKey<FormState> key=GlobalKey();

  CollectionReference _reference=FirebaseFirestore.instance.collection('shopping_list');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add an item'),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: key,
          child: Column(
            children: [
              TextFormField(
                controller: _controllerName,
                decoration: InputDecoration(
                  hintText: 'Enter the NAME of the item'
                ),
                validator: (String? value){

                  if(value==null || value.isEmpty)
                    {
                      return 'Please enter the item NAME';
                    }

                  return null;
                },
              ),
              TextFormField(
                controller: _controllerQuantity,
                decoration: InputDecoration(
                    hintText: 'Enter the PRICE of the item'
                ),
                validator: (String? value){

                  if(value==null || value.isEmpty)
                  {
                    return 'Please enter the item PRICE';
                  }

                  return null;
                },
              ),


              TextFormField(
                controller: _controllerFavorite,
                decoration: InputDecoration(
                    hintText: 'Enter the FAVORITE CATEGORY of the item'
                ),
                validator: (String? value){

                  if(value==null || value.isEmpty)
                  {
                    return 'Please enter the item FAVORITE CATEGORY';
                  }

                  return null;
                },
              ),


              ElevatedButton(onPressed: () async{

                if(key.currentState!.validate())
                  {
                      String itemName=_controllerName.text;
                      String itemQuantity=_controllerQuantity.text;
                      String itemFavorite=_controllerFavorite.text;

                      //Create a Map of data
                      Map<String,String> dataToSend={
                        'name':itemName,
                        'quantity':itemQuantity,
                        'favorite':itemFavorite
                      };

                      //Add a new item
                      _reference.add(dataToSend);
                  }
              }, child: Text('Submit'))

            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToDoPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return ToDoPageView();
  }
}

class ToDoPageView extends State<ToDoPage>{
  
  List ToDoList1 = [];
  List ToDoList2 = [];
  List ToDoList3 = [];
  String item1 = "";
  String item2= "";
  String item3= "";

  MyInputOnChange1(content1){
    setState(() {
      item1 = content1;
    });
  }
  MyInputOnChange2(content2){
    setState(() {
      item2 = content2;
    });
  }
  MyInputOnChange3(content3){
    setState(() {
      item3 = content3;
    });
  }


  AddItem1(){
    setState(() {
      ToDoList1.add({"item":item1});
    });
  }

  AddItem2(){
    setState(() {
      ToDoList2.add({"item":item2});
    });
  }

  AddItem3(){
    setState(() {
      ToDoList3.add({"item":item3});
    });
  }

  RemoveItem1(index){
    setState(() {
      ToDoList1.removeAt(index);
    });
  }

  RemoveItem2(index){
    setState(() {
      ToDoList2.removeAt(index);
    });
  }

  RemoveItem3(index){
    setState(() {
      ToDoList3.removeAt(index);
    });
  }


  MyAlertDialog(context){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return Expanded(
              child: AlertDialog(
                title: Text('Add Task'),
                content: Container(
                  height: 240,
                  child: SingleChildScrollView(
                    child: Column(
                        children: [
                          SizedBox(
                            child: TextField(onChanged: (content1){MyInputOnChange1(content1);},decoration: InputDecoration(labelText:'Title',enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Colors.grey))),),
                          ),
                          Padding(padding: EdgeInsets.all(5)),

                          SizedBox(
                            child: TextField(onChanged: (content2){MyInputOnChange2(content2);},decoration: InputDecoration(labelText:'Description',contentPadding: EdgeInsets.fromLTRB(13, 40, 40, 40),enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Colors.grey))),),
                          ),
                          Padding(padding: EdgeInsets.all(5)),

                          SizedBox(
                            child: TextField(onChanged: (content3){MyInputOnChange3(content3);},decoration: InputDecoration(labelText:'Days Required',enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Colors.grey))),),
                          ),

                        ]

                    ),
                  )

                ),

                actions: [
                  TextButton(onPressed: (){AddItem1();AddItem2();AddItem3();Navigator.of(context).pop();}, child: Text('Save'))
                ],
              )
          );
        }

    );
  }


  myTaskBottomSheet(){
    return SizedBox(
      width: 500,
      height: 200,
          child: BottomSheet(
              onClosing: (){Navigator.of(context).restorationId;},
              builder:(BuildContext){
                return ListView.builder(
                    itemCount: ToDoList1.length,
                    itemBuilder: (context,index){
                      return Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Task Details',style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),),
                            Padding(padding: EdgeInsets.only(bottom: 15)),
                            Text('Title: '+ToDoList1[index]["item"].toString()),
                            Text('Description: '+ToDoList2[index]["item"].toString()),
                            Text('Days Required: '+ToDoList3[index]["item"].toString()),
                            SizedBox(
                                child: ElevatedButton(
                                  child: Text('Delete'),
                                  onPressed: (){RemoveItem1(index);RemoveItem2(index);RemoveItem3(index);Navigator.of(context).pop();},
                                )
                            )


                          ],
                        ),
                      );


                    }

                );
              }

          ),





    );


  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Task Management'),
      ),

     floatingActionButton: FloatingActionButton(
        onPressed: (){MyAlertDialog(context);},
        child: Icon(Icons.add),
      ),
      
      body: ListView.builder(
          itemCount: ToDoList1.length,
          itemBuilder: (context,index){
            return GestureDetector(
              //onLongPress: (){myTaskBottomSheet();},
              onLongPress: (){showBottomSheet(context: context, builder: (BuildContext){return myTaskBottomSheet();});},
              //},
                //showBottomSheet(context: context, builder: (BuildContext){return Text('Text');});},
              // onLongPress: (){mySnackBar(context, Text('this is task'));},
              child: Card(
                elevation: 0,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(ToDoList1[index]["item"].toString()),
                      subtitle: Text(ToDoList2[index]["item"].toString()),
                    )

                  ],
                ),
              ),
            );

          }

      ),

    );


  }




}
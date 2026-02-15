
import 'package:adsf/db_helper/db_helper.dart';
import 'package:adsf/model/model.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

 DBHelper? dbHelper;
 late Future<List<NotesModel>> notesList;

 loadData()async{
   notesList = dbHelper!.getNotesList();
 }


 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = DBHelper();
loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
        Expanded(child: FutureBuilder(future: notesList,
            builder: (context,AsyncSnapshot<List<NotesModel>> snaphsort){
          return ListView.builder(
            itemCount: snaphsort.data?.length,
              shrinkWrap: true,
              itemBuilder: (context,indext){
            return Card(
              child: ListTile(
                title: Text(snaphsort.data![indext].title),
              ),
            );
          });
            }))
        ],

      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {

          try {
            await dbHelper?.insertNote(
              NotesModel(
                title: 'This is a title',
                description: 'This is a description',
                age: 22,
                email: 'ferdaus@gami.com',
                // id: null // let SQLite auto increment
              ),
            );
            print('Note added successfully!');
          } catch (e) {
            print('Error inserting note: $e');
          }
          setState(() {
loadData();
          });
        },
        child: const Icon(Icons.add),
      ),


    );

  }

}

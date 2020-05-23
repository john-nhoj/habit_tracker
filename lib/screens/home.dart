import 'package:flutter/material.dart';
import 'package:habit_tracker/controllers/fetch.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My habits')),
      body: FutureBuilder(
        future: Fetch().getWithCredentials('/habits', context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 100),
                itemCount: 10,
                itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.fromLTRB(
                        0.0, index == 0 ? 0.0 : 15.0, 0.0, 0.0),
                    decoration: BoxDecoration(
                        color: Colors.amber[(index % 5 + 1) * 100],
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      title: Text(index.toString()),
                      trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => print('pressed')),
                    )));
          }

          return Center(
            child: Text('Loading your habits, please wait a moment...'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => print('add moooooore'), child: Icon(Icons.add)),
    );
  }
}

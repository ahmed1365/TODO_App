import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        leading: Icon(
            Icons.menu
        ),
        title: Text(
            'First App'
        ),
        actions: [
          IconButton(
            onPressed: ()
            {

            },
            icon: Icon(Icons.search, ),
            ),
         IconButton(
           onPressed: (){},
           icon:  Icon(
           Icons.notification_important,
         ),
         )
        ],
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children:
          [
            Stack(
              children: [
                Text(
                    'Flower is beautiful',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
                Text('cow is so big',
                  style:
                  TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  ),
                ),
                Text('tower is much tall wow' ,
                  style:
                  TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  ),
                ),
              ],
            )
          ]
      ),
    );
  }
}

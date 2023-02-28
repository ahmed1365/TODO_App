import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        backgroundColor: Colors.white70,
        elevation: 0.0,
        titleSpacing: 20.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage('https://scontent.fcai20-6.fna.fbcdn.net/v/t39.30808-6/320555976_1156367415242165_8978820881250083664_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=174925&_nc_ohc=aZwqW24sb8wAX9tglB5&_nc_ht=scontent.fcai20-6.fna&oh=00_AfApSOgSsmfHGy-EPr-VLsootuNSZMEwwJOzw8cG-MHyfg&oe=63EFC0C7'),
            ),
            SizedBox(
              width: 16.0,
            ),
            Text(
              'Chats Flutter Design',
              style: TextStyle(
                  color: Colors.black
              ),
            )
          ],
        ),
        actions: [
          IconButton(onPressed: (){},
            icon: CircleAvatar(
              radius: 15.0,
              backgroundColor:Colors.blue,
              child: Icon(
                Icons.camera_alt,
                size: 16.0,
                color:Colors.white,
              ),
            ),
          ),
          IconButton(onPressed: (){},
            icon: CircleAvatar(
              radius: 15.0,
              backgroundColor:Colors.blue,
              child: Icon(
                Icons.edit,
                size: 16.0,
                color:Colors.white,
              ),
            ),
          )

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.grey[300],
                ),
                padding: EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(
                        width: 15.0
                    ),
                    Text('Search'),
                  ],
                ),
              ),
              SizedBox(
                height: 22.0,
              ),
              Container(
                height: 100.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context , index)=>buildStoryItem(),
                  itemCount: 5,
                  separatorBuilder: (context, index)=>SizedBox(
                    width: 20.0,
                  ),
                ),
              ),
              SizedBox(
                height: 22.0,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder:(context,index)=> buildChatItem(),
                separatorBuilder:(context,index)=> SizedBox(
                  height: 20.0,
                ),
                itemCount:15 ,
              ),
            ],
          ),
        ),
      ),
    );
  }


  //arrow function
  Widget buildChatItem()  => Row(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage('https://scontent.fcai20-6.fna.fbcdn.net/v/t1.6435-9/119109604_959533444527089_2758874639960404294_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=Fpb5AX4ob-wAX98Mmkd&_nc_ht=scontent.fcai20-6.fna&oh=00_AfAhjkzwdwaQwh__LaIzfD7TWpobDNZ_r_dfFhyq_4q4Dw&oe=6412E65F'),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              bottom: 3.0,
              end:3.0,
            ),
            child: CircleAvatar(
              radius: 7.0,
              backgroundColor: Colors.green,
            ),
          ),
        ],
      ),
      SizedBox(
        width: 20.0,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hamood',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 7.0,
            ),
            Row(
              children: [
                Text(
                  'يلا ننزل ؟ ',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    width: 7.0,
                    height:7.0,
                    decoration: BoxDecoration(
                      color:Colors.blue,
                      shape: BoxShape.circle,
                    ) ,
                  ),
                ),
                Text(
                  '02:00 pm',
                ),
              ],
            ),
          ],
        ),
      )
    ],
  );
  Widget buildStoryItem()  => Container(
    width: 60.0,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage('https://scontent.fcai20-6.fna.fbcdn.net/v/t39.30808-6/327066478_1304611520105707_7911664358432443888_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=lpL2tWgogMYAX_uYgsX&tn=Yre66bDFTQ6XxomF&_nc_ht=scontent.fcai20-6.fna&oh=00_AfCoehyPGHpuV8emoc3ygz9SckzcTN_NN0Nr8pM8rrJ-lA&oe=63F0484B'),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 3.0,
                end:3.0,
              ),
              child: CircleAvatar(
                radius: 7.0,
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 7.0,
        ),
        Text(
          'Mostafa Mahran',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );

}

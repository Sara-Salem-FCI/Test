import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.menu,
            color: Colors.black,
            ),),
            SizedBox(
              width: 5,
            ),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.grey[300],
            child: IconButton(onPressed: (){}, icon: Icon(
              Icons.edit,
              color: Colors.black,
              size: 20,
            ),),
          ),
          SizedBox(
            width: 10,
          ),
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.grey[300],
            child: IconButton(onPressed: (){}, icon: Icon(
              Icons.camera_alt,
              color: Colors.black,
              size: 20,
            ),),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(9),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.grey[300],
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Search',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
            height: 20,
          ),
              Container(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index) => buildStoryItem(),
                 separatorBuilder: (context, iindex) => SizedBox( width: 5,),
                 itemCount: 10,
                ),
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => buildChatItem() ,
                separatorBuilder: (context, index) => SizedBox(
                  height: 5,
                ) ,
                itemCount: 20,),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildStoryItem() =>  Container(
    width: 40,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('https://yt3.ggpht.com/a/AATXAJwLCs1X4ga4zEneN6hxsbO2-SiQmYSAD8xxIwUh=s900-c-k-c0xffffffff-no-rj-mo',),
            ),
            CircleAvatar(
              backgroundColor: Colors.green,
              radius: 4.5,

            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Angelo',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
  Widget buildChatItem() => Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage('https://yt3.ggpht.com/a/AATXAJwLCs1X4ga4zEneN6hxsbO2-SiQmYSAD8xxIwUh=s900-c-k-c0xffffffff-no-rj-mo',),
              ),
              CircleAvatar(
                backgroundColor: Colors.green,
                radius: 4.5,

              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Angelo',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  Text(
                    'يحيا أنجلو',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 3,
                    height: 3,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '02:00 PM',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      );
}

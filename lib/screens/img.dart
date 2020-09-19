import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

var lan;

class MyImg extends StatefulWidget {
  @override
  _MyImgState createState() => _MyImgState();
}

var txt;
var url1 =
    "https://www.dicoding.com/images/original/event/dsc_chapter_stmik_stikom_indonesia_introducing_developer_student_club_and_google_technologies_logo_041019113915.png";
var url2 =
    "https://www.hiretheyouth.org/wp-content/uploads/2019/04/Developer-Student-Club.png";
var url3 =
    "https://scontent.fudr1-1.fna.fbcdn.net/v/t1.0-9/103410722_103885298032465_499046933806969965_n.png?_nc_cat=110&_nc_sid=dd9801&_nc_ohc=NE5uX2uRyiYAX9u-m1T&_nc_ht=scontent.fudr1-1.fna&oh=c71ef1b088ec0d3adbaa4f06086ddbfc&oe=5F897FAD";
var url4 =
    "https://cdn-images-1.medium.com/max/800/1*fDv4ftmFy4VkJmMR7VQmEA.png";
var url5 =
    "https://tse2.mm.bing.net/th?id=OIP.rQj3npeybsCJyTyjwk3bFwHaDt&pid=Api&P=0&w=316&h=159";
var url6 =
    "https://tse1.mm.bing.net/th?id=OIP.eOVxqrIx9b5SYBecqu-ffAHaEz&pid=Api&P=0&w=242&h=158";

List src = [
  url1,
  url2,
  url3,
  url4,
  url5,
  url6,
];
var user;

class _MyImgState extends State<MyImg> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  _portraitView() {
    return ListView.builder(
        itemCount: src.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: UniqueKey(),
            background: Container(color: Colors.white),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {
                setState(() {
                  src.removeAt(index);
                });
              }
              if (index == src.length) {
                txt = "No image left!!";
              } else {
                txt = "Image removed";
              }
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(txt),
                  duration: Duration(seconds: 1),
                ),
              );
            },
            child: Card(
              elevation: 3,
              child: ListTile(
                  title: Container(
                height: 400,
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: NetworkImage(src[index]),
                  ),
                ),
              )),
            ),
          );
        });
  }

  _landscapeView() {
    return ListView.builder(
        itemCount: src.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: UniqueKey(),
            background: Container(color: Colors.white),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {
                setState(() {
                  src.removeAt(index);
                });
              }
              if (index == src.length) {
                txt = "No image left!!";
              } else {
                txt = "Image removed";
              }
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(txt),
                duration: Duration(seconds: 1),
              ));
            },
            child: Card(
              elevation: 3,
              child: ListTile(
                  title: Container(
                height: 400,
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: NetworkImage(src[index]),
                  ),
                ),
              )),
            ),
          );
        });
  }

  var authc = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Container(
            padding: EdgeInsets.all(7),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'DSC  MBM',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                  ),
                ),
                SizedBox(height: 35),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        child: Image.network(
                          url1,
                          width: 50,
                          height: 50,
                        ),
                      ),
                      Text(
                        '    Admin',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ]),
                SizedBox(height: 23),
                FlatButton(
                  onPressed: () {
                    print('language clicked');
                    lan = "hi";
                  },
                  child: Text("Language"),
                ),
                SizedBox(height: 6),
                FlatButton(
                  onPressed: () async {
                    print('logout clicked');
                    await authc.signOut();
                    user = await authc.currentUser;
                    print(user);
                    Navigator.pushNamed(context, "home");
                  },
                  child: Text("Logout"),
                ),
              ],
            ),
          ),
        ),
        drawerEnableOpenDragGesture: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: Text(
            'DSC',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: OrientationBuilder(builder: (context, orientation) {
          return Center(
              child: orientation == Orientation.portrait
                  ? _portraitView()
                  : _landscapeView());
        }));
  }
}

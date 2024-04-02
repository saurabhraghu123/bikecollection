import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


void main() {
 runApp(MyApp());
}


class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     title: 'Carousel Slider',
     theme: ThemeData(
       colorSchemeSeed: Color.fromARGB(55, 212, 239, 12),
     ),
     home: Dashboard(),
   );
 }
}

class Dashboard extends StatefulWidget {
 @override
 _DashboardState createState() => _DashboardState();
}


class _DashboardState extends State<Dashboard> {
 int _currentIndex = 0;
 List<String> listOfCategories = [
   "https://i.pinimg.com/736x/91/f7/9f/91f79fa6e323ef63aafa99d23b3eb9bc.jpg",
   "https://t4.ftcdn.net/jpg/06/07/35/75/360_F_607357581_bBKeR1IhWNHAm86KD3rBnbrt4biK9kFZ.jpg",
   "https://images.unsplash.com/photo-1586708594147-e9c0d72f0c83?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGt0bSUyMGJpa2V8ZW58MHx8MHx8fDA%3D",
   "https://images.unsplash.com/photo-1542781377-94a934d092e1?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
   "https://imgd.aeplcdn.com/1280x720/n/cw/ec/45489/ktm-rc-200-front-three-quarter0.jpeg?q=100",
   "https://bd.gaadicdn.com/processedimages/ktm/2021-rc-200/source/2021-rc-200616eb234421de.jpg?imwidth=880",
 ];


 @override
 Widget build(BuildContext context) {
   return Scaffold(
     drawer: NavDrawer(),
     appBar: AppBar(
       title: Text("Sr1cBIKECollections"),
       backgroundColor: Color.fromARGB(55, 212, 239, 12),
     ),
     body: Padding(
       padding: const EdgeInsets.only(top: 20.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           CarouselSlider(
             items: [
               // Image containers
               imageContainer("https://wallpapers.com/images/hd/ktm-rc-200-in-mountains-sxybc0crr8y01ep1.jpg"),
               imageContainer("https://www.modifiedx.com/wp-content/uploads/2020/08/modified-ktm-rc200-in-neon-green-highway-475x356.jpg"),
               imageContainer("https://bd.gaadicdn.com/processedimages/ktm/2021-rc-200/source/2021-rc-200616eb234421de.jpg?imwidth=880"),
             ],
             options: CarouselOptions(
               height: 180.0,
               enlargeCenterPage: true,
               autoPlay: true,
               aspectRatio: 4 / 4,
               autoPlayCurve: Curves.fastOutSlowIn,
               enableInfiniteScroll: true,
               autoPlayAnimationDuration: Duration(milliseconds: 800),
               viewportFraction: 0.8,
               onPageChanged: (index, reason) {
                 setState(() {
                   _currentIndex = index;
                 });
               },
             ),
           ),
           SizedBox(height: 15),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: List.generate(
               4, // Number of images
               (index) => buildDot(index),
             ),
           ),
           SizedBox(height: 15),
           Padding(
             padding: const EdgeInsets.all(4.0),
             child: Text(
               "KTMrc200",
               style: TextStyle(
                 fontSize: 20,
                 fontWeight: FontWeight.bold,
               ),
             ),
           ),
           Padding(
             padding: const EdgeInsets.all(4.0),
             child: GridView.builder(
                 shrinkWrap: true,
                 itemCount: listOfCategories.length,
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 3,
                   crossAxisSpacing: 6,
                   mainAxisSpacing: 6,
                 ),
                 itemBuilder: (context, index) {
                   return Padding(
                     padding: const EdgeInsets.all(4.0),
                     child: Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(15),
                         //  color: Color.fromARGB(255, 246, 238, 93),
                         image: DecorationImage(image: NetworkImage(listOfCategories[index]), fit: BoxFit.fill),
                       ),
                       margin: EdgeInsets.symmetric(horizontal: 1.0),
                     ),
                   );
                 }),
           ),
         ],
       ),
     ),
     bottomNavigationBar: BottomNavigationBar(
       backgroundColor: Color.fromARGB(55, 212, 239, 12),
       currentIndex: _currentIndex,
       onTap: (index) {
         setState(() {
           _currentIndex = index;
         });
       },
       items: [
         BottomNavigationBarItem(
           icon: Icon(Icons.home),
           label: 'Home',
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.search),
           label: 'Search',
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.person),
           label: 'profile',
         ),
       ],
     ),
   );
 }


 // method to create image containers
 Widget imageContainer(String imageUrl) {
   return Container(
     margin: EdgeInsets.all(2.0),
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(15.0),
       image: DecorationImage(
         image: NetworkImage(imageUrl),
         fit: BoxFit.cover,
       ),
     ),
   );
 }


 // method to build dot indicator
 Widget buildDot(int index) {
   return Container(
     width: 10,
     height: 10,
     margin: EdgeInsets.symmetric(horizontal: 1.0),
     decoration: BoxDecoration(
       shape: BoxShape.circle,
       color: _currentIndex == index ? Color.fromARGB(55, 212, 239, 12) : Colors.grey,
     ),
   );
 }
}


////here it is code of navdrawer/menu barrr.....///////////
///
///..................
class NavDrawer extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return Drawer(
     child: ListView(
       padding: EdgeInsets.zero,
       children: <Widget>[
         DrawerHeader(
           child: Text(
             'SIDEMENU',
             style: TextStyle(color: Color.fromRGBO(250, 60, 10, 16), fontSize: 25),
           ),
           decoration: BoxDecoration(color: Color.fromARGB(55, 212, 239, 12), image: DecorationImage(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRS5YDx2QIFgNEYvjMKiwDJfhgy3LQm3xGGf-FaUX3YeQ&s'), fit: BoxFit.fill)),
         ),
         ListTile(
           leading: Icon(Icons.input),
           title: Text('Welcome'),
           onTap: () => {},
         ),
         ListTile(
           leading: Icon(Icons.verified_user),
           title: Text('Profile'),
           onTap: () => {
             Navigator.of(context).pop()
           },
         ),
         ListTile(
           leading: Icon(Icons.settings),
           title: Text('Settings'),
           onTap: () => {
             Navigator.of(context).pop()
           },
         ),
         ListTile(
           leading: Icon(Icons.border_color),
           title: Text('Feedback'),
           onTap: () => {
             Navigator.of(context).pop()
           },
         ),
         ListTile(
           leading: Icon(Icons.exit_to_app),
           title: Text('Logout'),
           onTap: () => {
             Navigator.of(context).pop()
           },
         ),
       ],
     ),
   );
 }
}



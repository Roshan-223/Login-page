import 'package:flutter/material.dart';
import 'package:login_page/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  final List<String> images = [
    'lib/image/akhil.jpeg',
    'lib/image/alex.jpeg',
    'lib/image/athish.jpg',
    'lib/image/chris.jpeg',
    'lib/image/shijin.jpeg',
    'lib/image/manu.jpeg',
    'lib/image/ribin.jpeg',
    'lib/image/aju.jpeg',
    'lib/image/joyal.jpeg',
    'lib/image/jerin.jpeg',
    'lib/image/nandhu.jpeg',
    'lib/image/sushil.jpeg',
    'lib/image/gokul.jpeg',
    'lib/image/prince.jpeg',
    'lib/image/gopss.jpeg',
    'lib/image/Shobee.jpeg',
  ];
  final List<String> names = [
    'Akhil',
    'Alex',
    'Athish',
    'Chris',
    'Shijin',
    'Manu',
    'Ribin',
    'Aju',
    'Joyal',
    'jerin',
    'Nandhu',
    'Sushil',
    'Gokul',
    'Prince',
    'Gops',
    'Shobee',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            backgroundColor: const Color(0xff128C7E),
        
            title: const Text('Home'),
          
            actions: [
              IconButton(
                onPressed: () {
                  showSignoutAlertDialog(context);
                },
                iconSize: 30,
                icon: const Icon(Icons.exit_to_app),
              ),
            ],
          )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: ListView.builder(
            itemBuilder: (ctx, index) {
              return ListTile(
                title: Text(names[index],style:const TextStyle(fontSize: 15,),),
                subtitle: const Text('recevied msg'),
                leading: index % 2 == 0
                    ? CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.green,
                          backgroundImage: AssetImage(images[index]),
                        )
                    : Image(
                        image: AssetImage(images[index]),
                        width: 60,
                        height: 50,
                      ),
                trailing: Text('1$index:00')
              );
            }, 
            // separatorBuilder: (context, index) => const Divider(),
            itemCount: images.length,
          ),
        ),
      ),
    );
  }

  void showSignoutAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Sign Out'),
          content: const Text('Are you sure you want to sign out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext); // Close the alert dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                signout(context);
                Navigator.pop(dialogContext); // Close the alert dialog
              },
              child: const Text('Sign Out'),
            ),
          ],
        );
      },
    );
  }

  signout(BuildContext ctx) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.clear();

    // ignore: use_build_context_synchronously
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => const ScreenLogin()),
        (route) => false);
  }
}

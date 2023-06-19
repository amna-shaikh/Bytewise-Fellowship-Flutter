
import 'package:blogapp/auth/login.dart';
import 'package:blogapp/user/user_blogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../helper/notifier.dart';

class userprofile extends ConsumerStatefulWidget {
  const userprofile({Key? key}) : super(key: key);
  @override
  ConsumerState<userprofile> createState() => _userprofileState();
}
class _userprofileState extends ConsumerState<userprofile> {
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    String? profileUrl;
     profileUrl = ref.watch(profileUrlProvider);
    final userName = ref.watch(UserNameProvider);
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black87,
        title: const Text(
          "Profile",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
   child :  Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(height: 20,),
    InkWell(
      onTap: () async{

          final image = await ImagePicker().pickImage(source: ImageSource.gallery);
          if (image == null) return;
          setState(() {
            final temporaryImage = File(image.path);
            imageFile = temporaryImage;
          final profileUrlNotifier = ref.read(profileUrlProvider.notifier);
          profileUrlNotifier.setProfileUrl(imageFile!.path);
          final profileurl = ref.watch(profileUrlProvider);


    });
      },
      child: ClipOval(
    //  borderRadius: BorderRadius.circular(50),
          child:profileUrl!.isEmpty ? Image.network("https://www.seekpng.com/png/small/41-410093_circled-user-icon-user-profile-icon-png.png",
            width: 150,
            height: 150,)
              : Image.file(File(profileUrl
          ),
            width: 150,
            height: 150,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,

          ),),
    ),
        SizedBox(height: 10,),

    Text("${userName}", style: TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Colors.white
    ),),
    SizedBox(height: 10,),
    ListTile(
    onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => userBlogs())),
    leading: Icon(Icons.people_alt_sharp , color: Colors.white,),
    title: Text("My blogs",style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white
    ),),
    ),
    SizedBox(height: 10,),
    ListTile(
    onTap: (){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>loginpage()));
    },
    leading: Icon(Icons.logout, color: Colors.red,),
    title: Text("Logout",style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white
    ),),
    )
    ],
    )
      ),
      ));
  }
}

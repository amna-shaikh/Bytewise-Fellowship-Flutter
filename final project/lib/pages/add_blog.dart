import 'dart:io';
import 'package:blogapp/helper/list_notifier.dart';
import 'package:blogapp/models/blogmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../helper/notifier.dart';
import 'home_page.dart';

class AddBlog extends ConsumerStatefulWidget {
  const AddBlog({super.key});

  ConsumerState<AddBlog> createState() => _AddBlogState();
}

class _AddBlogState extends ConsumerState<AddBlog> {
  bool _isLoading = false;
  File? imageFile;
  Future pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final temporaryImage = File(image.path);
    setState(() {
      this.imageFile = temporaryImage;
      _isLoading = true;
    });
  }

  TextEditingController titlecontroller = TextEditingController();
  TextEditingController description = TextEditingController();
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    final list = ref.read(BlogList);
    final userlist = ref.read(userList);


  /* final profileUrlNotifier = ref.read(profileUrlProvider.notifier);
    profileUrlNotifier.setProfileUrl(imageFile!.path);*/
    return WillPopScope(
        onWillPop: () async {
          if (isDialOpen.value) {
            isDialOpen.value = false;
            return false;
          } else {
            return true;
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.black87,
          appBar: AppBar(
            backgroundColor: Colors.black87,
            elevation: 0.0,
            title: const Text(
              "Upload Blogs",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  imageFile == null
                      ? Container(width: 0.0, height: 0.0)
                      : Container(
                          child: Image(
                          image: FileImage(imageFile!),
                          width: MediaQuery.of(context).size.width,
                          height: 250.0,
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                        )),
                  SizedBox(height: 5,),
                  TextFormField(
                    controller: titlecontroller,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: "Add title",
                        labelStyle: const TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        )),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: description,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: "Add Description",
                        labelStyle: const TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          if (titlecontroller.text.isEmpty &&
                              description.text.isEmpty &&
                              imageFile == null) {
                            const Text("return all fields");
                          } else {
                            final userName = ref.watch(UserNameProvider);
                            String? profileUrl;
                            profileUrl =  ref.watch(profileUrlProvider);
                            print("this is add blogmethod");
                            print(profileUrl);

                            userlist.add(blogModel(
                                username: userName.isEmpty? "Amna": userName ,
                                title: titlecontroller.text,
                                description: description.text,
                                imageURL: imageFile!.path,
                                userProfile: profileUrl!.isEmpty ? "" : profileUrl
                            ));
                            list.add(blogModel(
                                username: userName.isEmpty? "Amna": userName ,
                                title: titlecontroller.text,
                                description: description.text,
                                imageURL: imageFile!.path,
                                userProfile: profileUrl.isEmpty ? "https://www.seekpng.com/png/small/41-410093_circled-user-icon-user-profile-icon-png.png" : profileUrl
                            ));
                            titlecontroller.clear();
                            description.clear();

                            Navigator.push(context, MaterialPageRoute(builder: (context)=> home()));
                          }
                        },
                        child: const Text(
                          "Post Blog",
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                /*  _isLoading
                      ? Container(
                          height: 0.0,
                          width: 0.0,
                        )
                      : Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          width: 200,
                          child: const LinearProgressIndicator(),
                        ),*/
                ],
              ),
            ),
          ),
          floatingActionButton: SpeedDial(
            animatedIcon: AnimatedIcons.add_event,
            icon: Icons.add,
            foregroundColor: Colors.white,
            openCloseDial: isDialOpen,
            backgroundColor: Colors.blue,
            children: [
              SpeedDialChild(
                  child: const Icon(
                    Icons.browse_gallery_sharp,
                    color: Colors.black,
                  ),
                  label: 'Gallery',
                  backgroundColor: Colors.white,
                  onTap: () {
                    pickImage(ImageSource.gallery);
                  }),
              SpeedDialChild(
                  child: const Icon(
                    Icons.camera,
                    color: Colors.black,
                  ),
                  label: 'Camera',
                  backgroundColor: Colors.white,
                  onTap: () {
                    setState(() {
                      pickImage(ImageSource.camera);
                    });

                  }),
            ],
          ),
        ));
  }
}

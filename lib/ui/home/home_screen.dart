import 'package:contact_app/detail_info/detail_info.dart';
import 'package:contact_app/detail_info/image_screen.dart';
import 'package:contact_app/models/my_contact_data.dart';
import 'package:contact_app/ui/others/other_screen.dart';
import 'package:contact_app/utils/icon/icons.dart';
import 'package:contact_app/widgets/contact_item.dart';
import 'package:contact_app/widgets/utility_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/widget/fake_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MyContactInfo> list = FakeData.getMyContacts();
  String contactName = "";
  String contactNumber = "";
  String contactAbout = "";

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();

  int activeIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Contacts"),
          leading: GestureDetector(
            child: Icon(Icons.arrow_back_sharp),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return const OtherScreen();
              }));
            },
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    list.clear();
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5.w,
              ),
              child: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    myCustomDialogAdd();
                  });
                },
              ),
            )
          ],
        ),
        body: ListView.builder(
            itemCount: list.length,
            itemBuilder: (
              BuildContext context,
              index,
            ) {
              return ContactItem(
                onImageTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return ImageScreen(imagePath: list[index].iconPath);
                    }),
                  );
                },
                updateClicked: () {
                  myCustomDialogUpdate(
                      myContactInfo: list[index], updateIndex: index);
                },
                deleteClicked: () {
                  setState(() {
                    UtilityFunctions.getMyToast(
                      message: "Contact ${list[index].contactName} deleted.",
                    );
                    if (activeIndex == index) activeIndex = -1;
                    list.removeAt(index);
                  });
                },
                iconPath: list[index].iconPath,
                contactName: list[index].contactName,
                number: list[index].contactNumber,
                whenClicked: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return DetailInfo(
                      myContactInfo: list[index],
                    );
                  }));
                  setState(() {
                    activeIndex = index;
                  });
                },
                isSelected: activeIndex == index,
              );
            }));
  }

  void myCustomDialogAdd() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 15.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Enter contact info",
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                  TextField(
                    controller: nameController,
                    // onChanged: (value) {
                    //   contactName = value;
                    // },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(hintText: 'Enter name'),
                  ),
                  TextField(
                    controller: phoneController,
                    onChanged: (value) {
                      print(value);
                      contactNumber = value;
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'Enter number',
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          contactName = nameController.text;
                          contactNumber = phoneController.text;

                          if (contactNumber.isNotEmpty &&
                              contactName.isNotEmpty) {
                            list.add(
                              MyContactInfo(
                                aboutInfo: "New User",
                                iconPath: MyIcons.image7,
                                contactName: contactName,
                                contactNumber: contactNumber,
                              ),
                            );
                            UtilityFunctions.getMyToast(
                                message: "Added $contactName");
                            // contactNumber = '';
                            // contactName = '';
                            nameController.text = "";
                            phoneController.text = "";
                            Navigator.pop(context);
                          } else {
                            UtilityFunctions.getMyToast(
                                message: "Enter inputs");
                          }
                        });
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                      ),
                      child: const Text(
                        "Save contact",
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              ),
            ),
          );
        });
  }

  void myCustomDialogUpdate(
      {required MyContactInfo myContactInfo, required int updateIndex}) {
    phoneController.text = myContactInfo.contactNumber;
    nameController.text = myContactInfo.contactName;
    aboutController.text = myContactInfo.aboutInfo;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Enter contact info",
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                  TextField(
                    controller: aboutController,
                    // onChanged: (value) {
                    //   contactName = value;
                    // },
                    keyboardType: TextInputType.text,
                    decoration:
                        const InputDecoration(hintText: 'Enter About info'),
                  ),
                  TextField(
                    controller: nameController,
                    // onChanged: (value) {
                    //   contactName = value;
                    // },
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(hintText: 'Enter name'),
                  ),
                  TextField(
                    controller: phoneController,
                    // onChanged: (value) {
                    //   print(value);
                    //   contactNumber = value;
                    // },
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintText: 'Enter number',
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          contactName = nameController.text;
                          contactNumber = phoneController.text;
                          contactAbout = aboutController.text;

                          if (contactNumber.isNotEmpty &&
                              contactName.isNotEmpty &&
                              contactAbout.isNotEmpty) {
                            list[updateIndex] = MyContactInfo(
                              aboutInfo: contactAbout,
                              iconPath: MyIcons.food3,
                              contactName: contactName,
                              contactNumber: contactNumber,
                            );
                            UtilityFunctions.getMyToast(
                                message: "Updated $contactName");
                            // contactNumber = '';
                            // contactName = '';
                            nameController.text = "";
                            phoneController.text = "";
                            Navigator.pop(context);
                          } else {
                            UtilityFunctions.getMyToast(
                                message: "Enter inputs");
                          }
                        });
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                      ),
                      child: const Text(
                        "Save contact",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
          );
        });
  }

  void getMyAlert() => AlertDialog(
        title: Text(
          "Warning!",
        ),
        content: Text("Internet error ocurred"),
        actions: [
          TextButton(
              onPressed: () {
                setState(() {
                  list.clear();
                });
              },
              child: Text("Delete All")),
          IconButton(
              onPressed: () {
                setState(() {
                  list.add(
                    MyContactInfo(
                      aboutInfo: "",
                      iconPath: "",
                      contactName: "contactName",
                      contactNumber: "contactNumber",
                    ),
                  );
                  UtilityFunctions.getMyToast(
                    message: "Contact  added.",
                  );
                });
              },
              icon: Text("Add"))
        ],
      );

  @override
  void initState() {
    print('Init ishladi');
    super.initState();
  }

  @override
  void dispose() {
    print("Dispose ishladi");
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}

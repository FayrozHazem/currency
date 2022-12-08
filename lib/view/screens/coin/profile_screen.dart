import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../core/themes.dart';
import '../../../view_model/provider/auth/auth_provider.dart';
import '../../../view_model/provider/auth/photo_provider.dart';
import '../../../view_model/provider/coin/profile_provider.dart';
import '../../../view_model/provider/theme_proider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(builder: (context, provider, child ) {
      return Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              Container(
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(provider.userData!.image == ""
                          ? "https://pasrc.princeton.edu/sites/g/files/toruqf431/files/styles/freeform_750w/public/2021-03/blank-profile-picture-973460_1280.jpg?itok=QzRqRVu8"
                          : provider.userData!.image),
                      fit: BoxFit.fill),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                provider.userData!.name.toString(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                provider.userData!.email.toString(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.46,
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Themes.isDarkMode(context) ? Color(0xff151f2c)
                              : Colors.blueGrey ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Provider.of<PhotoProvider>(context,listen: false)
                                  .getImage(ImageSource.gallery);

                            },
                            child: Text(
                            'from gallery',
                              style:
                              TextStyle(fontSize: 15),
                            ),
                          ),
                          Icon(
                            Icons.photo,
                          ),
                        ],
                      ),
                    ),
                    //////////////////////////
                    Container(
                      width: MediaQuery.of(context).size.width * 0.46,
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Themes.isDarkMode(context) ? Color(0xff151f2c)
                              : Colors.blueGrey ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Provider.of<PhotoProvider>(context,listen: false)
                                  .getImage(ImageSource.camera);
                            },
                            child: Text(
                              'add photo',
                              style:
                              TextStyle(fontSize: 15),
                            ),
                          ),
                          Icon(
                            Icons.camera_alt,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              /////////////////////left containers
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color:  Themes.isDarkMode(context) ? Color(0xff151f2c)
                          : Colors.blueGrey ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                backgroundColor:
                                Themes.isDarkMode(context) ? Color(0xff151f2c)
                                    : Colors.blueGrey ,
                                title: Text(
                                 'change theme',
                                  style: TextStyle(color: Colors.white),
                                ),
                                actions: [
                                  Center(
                                    child: Column(
                                      children: [
                                        MaterialButton(
                                          onPressed: () {
                                            Provider.of<ThemeProvider>(context,listen: false).saveThemeModeToSharedPref(ThemeMode.system) ;
                                            Get.back() ;
                                          },
                                          child: Text(
                                          'system',
                                          ),
                                        ),
                                        MaterialButton(
                                          onPressed: () {
                                            Provider.of<ThemeProvider>(context,listen: false).saveThemeModeToSharedPref(ThemeMode.light) ;
                                            Get.back() ;
                                          },
                                          child: Text(
                                           'Light',
                                          ),
                                        ),
                                        MaterialButton(
                                          onPressed: () {
                                            Provider.of<ThemeProvider>(context,listen: false).saveThemeModeToSharedPref(ThemeMode.dark) ;
                                            Get.back() ;
                                          },
                                          child: Text(
                                           'Dark',
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ));
                        },
                        child: Text(
                         'Change Theme',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.arrow_drop_down,
                          ),
                          onPressed: () {}),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Themes.isDarkMode(context) ? Color(0xff151f2c)
                          : Colors.blueGrey ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () => showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor:
                              Themes.isDarkMode(context) ? Color(0xff151f2c)
                                  : Colors.blueGrey ,
                              title: Text(
                                 'Change Language'
                              ),
                              actions: [
                                Center(
                                  child: Column(
                                    children: [
                                      MaterialButton(
                                        onPressed: () async{
                                        },
                                        child: Text(
                                         'English',
                                        ),
                                      ),
                                      MaterialButton(
                                        onPressed: () async{
                                        },
                                        child: Text(
                                         'Arabic',
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )),
                        child: Text(
                         'Change Language',
                          style: TextStyle( fontSize: 15),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_drop_down,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Themes.isDarkMode(context) ? Color(0xff151f2c)
                          : Colors.blueGrey ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Provider.of<AuthProvider>(context, listen: false)
                              .signOut();
                        },
                        child: Text(
                         'Log Out',
                          style: TextStyle( fontSize: 15),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.logout,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
            ],
          ),
        ),
      );
    });
  }
}

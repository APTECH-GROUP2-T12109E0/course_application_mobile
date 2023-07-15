import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/main_blocs.dart';
import 'bloc/main_state.dart';
import 'course_dto.dart';
import 'list_view_horizontal.dart';

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({Key? key}) : super(key: key);

  @override
  State<MainScreenPage> createState() => MainScreen();
}
class MainScreen extends State<MainScreenPage> {


  List<CourseDTO> courseList = [
    CourseDTO(
        id: "1",
        title: "UI/UX",
        author: "Author",
        rate: "4.5",
        price: "200",
        salePrice: "200",
        voteCount: "5000",
        isSale: false,
        tag: "Programing",
        description: "This is description",
        expiredTime: "2023/07/15",
        view: "2000",
        imageUrl: "http://via.placeholder.com/350x150"
    ),
    CourseDTO(
        id: "2",
        title: "UI/UX 2",
        author: "Author 2",
        rate: "4.5",
        price: "200",
        salePrice: "200",
        voteCount: "5000",
        isSale: true,
        tag: "Programing",
        description: "This is description",
        expiredTime: "2023/07/15",
        view: "2000",
        imageUrl: "http://via.placeholder.com/350x150"
    ),
    CourseDTO(
        id: "3",
        title: "UI/UX 3",
        author: "Author 3",
        rate: "4.5",
        price: "200",
        salePrice: "200",
        voteCount: "5000",
        isSale: false,
        tag: "Programing",
        description: "This is description",
        expiredTime: "2023/07/15",
        view: "2000",
        imageUrl: "http://via.placeholder.com/350x150"
    )
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenBloc, MainScreenState>(builder: (context, state) {
      return Container(
        decoration: BoxDecoration(color: Colors.grey.shade300),
        child: SingleChildScrollView(
          child: SafeArea(
              bottom: true,
              child:   Column(
                children: [
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // direction: Axis.vertical,
                    // spacing: 20,
                    children: <Widget>[ //logo
                      Container(
                        child: Image.asset('assets/images/bg.jpg', fit: BoxFit.cover,),
                        padding: EdgeInsets.all(5),
                        height: 200,width: double.infinity,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.white
                          ),
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(Icons.settings, color: Colors.indigoAccent,),
                              SizedBox(width: 10,),
                              Center(
                                child: Text("Management Blog", style: TextStyle(fontSize: 15,color: Colors.indigoAccent, fontWeight: FontWeight.w400),),
                              )
                            ],
                          )
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      //welcome
                      const Text(
                        "MY BLOG",
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigoAccent,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //text
                      const Center(
                        child: Text(
                          "Thanks for joining! Access or create your account below, and get started on your learning!",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Colors.black12,
                            decoration: TextDecoration.none,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //List view horizontal
                      listCourse(),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                  //nút sign up, sign in
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 150,
                        height: 40,
                        decoration: BoxDecoration(
                            color:  Colors.amber, borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black12,
                            decoration: TextDecoration.none,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      Container(
                        alignment: Alignment.center,
                        width: 150,
                        height: 40,
                        decoration: BoxDecoration(
                            color:  Colors.blue, borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            decoration: TextDecoration.none,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 100,)
                ],
              )),
        ),
      );
    });
  }

  Widget listCourse() {
    print("Count ${courseList.length}");

    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      height: 310,
      child:  ListView.separated(
        padding: EdgeInsets.zero,
        itemBuilder: (BuildContext context, int index) {
          return ListViewHorizontal(courseList[index], index);
        },
        separatorBuilder:(context, index) => getSeparator(horizontalMargin: 16),
        itemCount: courseList.length,
        scrollDirection: Axis.horizontal,),
    );
  }

  static Widget getSeparator({double horizontalMargin = 8}) {
    return Container(
        height: 1,
        margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
        decoration: const BoxDecoration(color: Colors.transparent));
  }
}

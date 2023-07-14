import 'package:flutter/material.dart';

import '../../common/routes/route_name.dart';
import 'course_dto.dart';

class ListViewHorizontal extends StatelessWidget {
  CourseDTO courseItem;
  int index;

  ListViewHorizontal(this.courseItem, this.index,  {super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.transparent
        ),
        height: 310,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.COURSE_DETAIL);
          },
          child:  Container(
            width: size.width - 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child:  ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(0), topRight: Radius.circular(0)),
                    child: Image.network(courseItem.imageUrl ?? '', fit: BoxFit.cover,height: 150,width: double.infinity,),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.price_change, color: Colors.black,),
                            SizedBox(width: 5,),
                            Text("${courseItem.tag}")
                          ],
                        ),
                        SizedBox(height: 5,),
                        Text("${courseItem.title}", style: TextStyle(fontWeight: FontWeight.w500),),
                        SizedBox(height: 10,),
                        Text("${courseItem.description}", style: TextStyle(fontWeight: FontWeight.w200),),
                        SizedBox(height: 10,),
                        Row(
                            children: [
                              Icon(Icons.timelapse, color: Colors.black,),
                              SizedBox(width: 5,),
                              Expanded(child: Text("${courseItem.expiredTime}")),
                              Icon(Icons.countertops),
                              Text("${courseItem.voteCount}")
                            ]
                        )
                      ],
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
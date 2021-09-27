import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ptsganjil202112rpl1rifki29/FilmDetail.dart';
import 'package:ptsganjil202112rpl1rifki29/FilmModel.dart';
import 'dart:convert';

class FilmList extends StatefulWidget {
  const FilmList({Key key}) : super(key: key);

  @override
  _FilmListState createState() => _FilmListState();
}

class _FilmListState extends State<FilmList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadFormJson();
  }

  bool isloading = true;
  FilmModel filmModel;

  void loadFormJson() async {
    final res =
        await http.get(Uri.parse("https://restaurant-api.dicoding.dev/list"));
    if (res.statusCode == 200) {
      print("hasil : " + res.body.toString());
      filmModel = FilmModel.fromJson(json.decode(res.body.toString()));
      setState(() {
        isloading = false;
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isloading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Container(
                padding: EdgeInsets.only(top: 10),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => FilmDetail(
                                      filmModel: filmModel,
                                      index: index,
                                    )));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: CachedNetworkImage(
                                      height: 100,
                                      imageUrl:
                                          // "https://restaurant-api.dicoding.dev/images/small/" +
                                          filmModel.result[index].thumbnail
                                      // placeholder: (context, url) => Image.asset(
                                      //   'images/food.png',
                                      //   height: 200,
                                      // ),
                                      // errorWidget: (context, url, error) =>
                                      //     Image.asset(
                                      //   'images/food.png',
                                      //   height: 200,
                                      // ),
                                      ),
                                ),
                              ),
                              SizedBox(width: 10),
                              // Expanded(
                              //   flex: 3,
                              //   child: Column(
                              //     mainAxisAlignment: MainAxisAlignment.start,
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: <Widget>[
                              //       Text(
                              //           restaurantModel.restaurants[index].name,
                              //           style: TextStyle(
                              //               fontWeight: FontWeight.bold,
                              //               color: Colors.black,
                              //               fontSize: 16)),
                              //       SizedBox(height: 3),
                              //       Row(
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.start,
                              //         children: [
                              //           Icon(Icons.pin_drop),
                              //           Text(
                              //             '${restaurantModel.restaurants[index].city}',
                              //             style: TextStyle(fontSize: 14),
                              //             maxLines: 3,
                              //             overflow: TextOverflow.ellipsis,
                              //           ),
                              //         ],
                              //       ),
                              //       SizedBox(height: 15),
                              //       Row(
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.start,
                              //         children: [
                              //           Icon(
                              //             Icons.star,
                              //             color: Colors.yellow,
                              //           ),
                              //           Text(
                              //             '${restaurantModel.restaurants[index].rating.toString()}',
                              //             style: TextStyle(fontSize: 14),
                              //             maxLines: 3,
                              //             overflow: TextOverflow.ellipsis,
                              //           ),
                              //         ],
                              //       ),
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}

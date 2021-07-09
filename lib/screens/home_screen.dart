import 'dart:convert';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'https://cdn.pixabay.com/photo/2015/01/18/11/20/glass-602889_1280.jpg',
  'https://cdn.pixabay.com/photo/2019/07/27/06/21/giraffe-4366005_1280.jpg',
  'https://cdn.pixabay.com/photo/2012/02/24/16/59/swan-16736_1280.jpg',
  'https://cdn.pixabay.com/photo/2015/07/09/22/45/tree-838667_1280.jpg',
  'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg'
];

final List dataList = [
  {
    "img":
        "https://cdn.pixabay.com/photo/2015/01/18/11/20/glass-602889_1280.jpg",
    "name": "test 1",
    "date": "date 1"
  },
  {
    "img":
        "https://cdn.pixabay.com/photo/2019/07/27/06/21/giraffe-4366005_1280.jpg",
    "name": "test 2",
    "date": "date 2"
  },
  {
    "img": "https://cdn.pixabay.com/photo/2012/02/24/16/59/swan-16736_1280.jpg",
    "name": "test 2.5",
    "date": "date 2.5"
  },
  {
    "img":
        "https://cdn.pixabay.com/photo/2015/07/09/22/45/tree-838667_1280.jpg",
    "name": "test 3",
    "date": "date 3"
  },
  {
    "img":
        "https://cdn.pixabay.com/photo/2015/01/18/11/20/glass-602889_1280.jpg",
    "name": "test 4",
    "date": "date 4"
  },
  {
    "img":
        "https://cdn.pixabay.com/photo/2019/07/27/06/21/giraffe-4366005_1280.jpg",
    "name": "test 5",
    "date": "date 5"
  },
  {
    "img": "https://cdn.pixabay.com/photo/2012/02/24/16/59/swan-16736_1280.jpg",
    "name": "test 6",
    "date": "date 6"
  },
  {
    "img":
        "https://cdn.pixabay.com/photo/2015/07/09/22/45/tree-838667_1280.jpg",
    "name": "test 7",
    "date": "date 7"
  },
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          carouselEvent(),
          Container(
            child: Text(
              'Events',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 220.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: dataList.map((e) => eventCard(e)).toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget carouselEvent() {
    return Stack(
      children: [
        Container(
          height: 350,
          width: double.infinity,
          color: Colors.black,
        ),
        Container(
          padding: EdgeInsets.only(top: 50, bottom: 20),
          child: CarouselSlider(
              items: imgList
                  .map(
                    (e) => newImage(e.toString()),
                  )
                  .toList(),
              options: CarouselOptions(
                height: 250,
                aspectRatio: 19 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              )),
        )
      ],
    );
  }

  Widget newImage(String image) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(image))));
  }

  Widget eventCard(e) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(e["img"].toString()),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10)),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 20,
              child: Text(
                e["name"].toString(),
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          ],
        )
      ],
    );
  }
}

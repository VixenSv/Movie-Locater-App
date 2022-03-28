// import 'package:flutter/material.dart';
// import 'package:movie_locator_app/features/domain/entities/movieList.enitity.dart';

// class SamplePage extends StatefulWidget {
//   const SamplePage({Key? key}) : super(key: key);

//   @override
//   State<SamplePage> createState() => _SamplePageState();
// }

// class _SamplePageState extends State<SamplePage> {
//   MovieListEntity movieList = new MovieListEntity(movieList: []);

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     movieList.movieList = 
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             children: <Widget>[
//               SizedBox(
//                 height: 10.0,
//               ),
//               SingleChildScrollView(
//                   physics: AlwaysScrollableScrollPhysics(),
//                   child: ListView.builder(
//                       physics: AlwaysScrollableScrollPhysics(),
//                       itemCount: movieList.movieList.length,
//                       shrinkWrap: true,
//                       itemBuilder: (context, index) {
//                         return ImageList(
//                           index: index,
//                           imageListEntity: movieList,
//                         );
//                       })),
//               SizedBox(
//                 height: 10.0,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ImageList extends StatelessWidget {
//   const ImageList({
//     Key? key,
//     required MovieListEntity imageListEntity,
//     required int index,
//   })  : _imageList = imageListEntity,
//         _index = index,
//         super(key: key);

//   final MovieListEntity _imageList;
//   final int _index;

//   printlog() {
//     print('index is ' + _index.toString());
//   }

//   @override
//   Widget build(BuildContext context) {
//     String imagePath = _imageList.movieList[_index];
//     return ListTile(
//       onTap: printlog,
//       title: Container(child: Image.network(imagePath)),
//     );
//   }
// }

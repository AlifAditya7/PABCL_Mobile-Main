import 'package:flutter/material.dart';
import 'package:movie_app/desc.dart';
import 'package:movie_app/utils/text.dart';

class TopRated extends StatelessWidget {
  final List toprated;
  const TopRated({ Key? key, required this.toprated }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: "Top Rated Movies",size: 26,color: Colors.white),
          SizedBox(height: 10,),
          Container(height: 270,
          child: ListView.builder(
            itemCount: toprated.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(name: toprated[index]['title'], description: toprated[index]['overview'], bannerurl: 'https://image.tmdb.org/t/p/w500'+ toprated[index]['backdrop_path'], posterurl: 'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path'], vote: toprated[index]['vote_average'].toString(), launch_on: toprated[index]['release_date'])));
                },
                child: 
                toprated[index]['original_title'] !=null?Container(
                  width: 140,
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500'+ toprated[index]['poster_path']
                        ))),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        child: modified_text(text: toprated[index]["original_title"] != null?toprated[index]['original_title']:" Title Not Found", color: Colors.white, size: 10),
                      )
                    ],
                  ),
                ):Container(),
              );
            },),
          )
          
        ],
      ),
    );
  }
}
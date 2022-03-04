import 'package:flutter/material.dart';
import 'package:movie_app/desc.dart';
import 'package:movie_app/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  const TrendingMovies({ Key? key, required this.trending }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: "Trending Movies",size: 26,color: Colors.white),
          SizedBox(height: 10,),
          Container(height: 270,
          child: ListView.builder(
            itemCount: trending.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(name: trending[index]['title'], description: trending[index]['overview'], bannerurl: 'https://image.tmdb.org/t/p/w500'+ trending[index]['backdrop_path'], posterurl: 'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path'], vote: trending[index]['vote_average'].toString(), launch_on: trending[index]['release_date'])));
                },
                child: 
                trending[index]['original_title'] !=null? Container(
                  padding: EdgeInsets.all(5),
                  width: 250,
                  child: Column(
                    children: [
                      Container(
                        
                        height: 200,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500'+ trending[index]['backdrop_path']
                        ),fit: BoxFit.cover)),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        child: modified_text(text: trending[index]["original_title"] != null?trending[index]['original_title']:" Title Not Found", color: Colors.white, size: 10),
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
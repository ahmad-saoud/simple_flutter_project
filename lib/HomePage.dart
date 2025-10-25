
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key}) ;
  @override
  State<StatefulWidget> createState() {
    return _HomePageState()  ;
  }
}
class _HomePageState extends State<HomePage>{
  int i  = 10 ;
   List <bool> v = [false , false , false , false , false , false , false , false , false , false ] ;



  @override
  Widget build(BuildContext context){
  return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            showSearch(context: context, delegate: MySearch());
          }, icon: Icon(Icons.search) , iconSize: 25,) ,

        ],

      ),
      drawer: Drawer(

        child: ListView(
          padding: EdgeInsets.only(left: 10 , top: 60),
          children: [
            Card(
              child: ListTile(
                title: Text("Ahmad Saoud"),
                leading: Icon(Icons.person , size: 50,),
                subtitle: Text("0939819192"),
                trailing: Text("authorized"),
              ),
            ) ,
            Card(child: Row(children: [ Icon(Icons.settings , size: 30,textDirection: TextDirection.rtl,) , Text(" settings " , style: TextStyle(fontSize: 30),) ,],),) ,
            Card(child: Row(children: [ Icon(Icons.question_answer , size: 30,textDirection: TextDirection.rtl,) , Text(" FAQs " , style: TextStyle(fontSize: 30),) ,],),) ,
            Card(child: Row(children: [ Icon(Icons.error , size: 30,textDirection: TextDirection.rtl,) , Text(" have a problem ?  " , style: TextStyle(fontSize: 30),) ,],),) ,
            Card(child: Row(children: [ Icon(Icons.info , size: 30,textDirection: TextDirection.rtl,) , Text(" about us " , style: TextStyle(fontSize: 30),) ,],),) ,
            Card(child: Row(children: [ Icon(Icons.logout , size: 30,textDirection: TextDirection.rtl,) , Text(" log out " , style: TextStyle(fontSize: 30),) ,],),) ,






          ],
        ),

      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: 10,
        itemBuilder: (context , index){

          return Container(
            height: 400,
            width: 400,
            decoration: BoxDecoration(
              border: Border.all(width: 3),
              borderRadius: BorderRadius.all(Radius.circular(30)) ,
              //boxShadow: [BoxShadow(offset: Offset(10, 10) , spreadRadius:10 , color: Colors.black38 , blurRadius: 10) ,]

            ),
            child: Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("  shop                    owner" , style: TextStyle(fontSize: 30 ) , textAlign: TextAlign.left,) ,

                SwitchListTile(value: v[index], onChanged: (value){

                  setState(() {
                    v[i] = value ;
                    print ("$v") ;
                    print ("$value") ;
                  });
                } , title: Text(" shop notifications " ,style: TextStyle(fontSize: 20),),) ,
                Center(
                   child :  Container(
                      height : 250 ,
                      width: 325,
                      decoration: BoxDecoration(border: Border.all(width: 3) , borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Image.asset("dfd") ,
                          Image.asset("dfdf") ,
                          Image.asset("dfdf") ,
                          IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward ) , iconSize: 100,)
                        ],
                      ),
                    )
                )

              ],
            ),



          ) ;
        },
      ),







    );
  }
}

class MySearch extends SearchDelegate{
  String? result ;


  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        query = "" ;
      }, icon: Icon(Icons.close)) ,
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
       close(context, result) ;
    }, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("hi") ;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text("welcome") ;
  }

}
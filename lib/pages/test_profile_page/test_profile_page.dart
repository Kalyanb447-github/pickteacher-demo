import 'package:flutter/material.dart';
class TestProfilePage extends StatefulWidget {
  @override
  _TestProfilePageState createState() => _TestProfilePageState();
}

class _TestProfilePageState extends State<TestProfilePage> {
 Widget build(BuildContext cx) {
    return new Scaffold(
        appBar: null,
        body: new ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                Container(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Row(children: <Widget>[
                        Expanded(child: 
                        Container(
                        height: 100.0,
                        // decoration: BoxDecoration(                          
                        //   image: DecorationImage(
                        //     fit: BoxFit.cover,
                        //     image: NetworkImage('https://www.sageisland.com/wp-content/uploads/2017/06/beat-instagram-algorithm.jpg')
                        //   )
                        // ),
                      ),
                      ),

                      ],
                      ),
                      Positioned(
                        top: 50.0,
                        child: Container(
                          height: 120.0,
                          width: 120.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                             // image: NetworkImage('http://cdn.ppcorn.com/us/wp-content/uploads/sites/14/2016/01/Mark-Zuckerberg-pop-art-ppcorn.jpg'),
                            image: AssetImage('assets/kalyan.jpg'),
                            ),
                            border: Border.all(
                              color: Colors.white,
                              width: 6.0
                            )
                          ),
                        ),
                      ),
                    ],)                    
                  ,
                ),


                    Container(
                      alignment: Alignment.bottomCenter,
                      height: 130.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                            Text('Teacher Name', style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28.0
                            ),),
                            SizedBox(width: 5.0,),
                        Icon(Icons.check_circle, color: Colors.blueAccent,)                      
                        ],
                      ),
                    ),
                    SizedBox(height: 12.0,),
                    Container(
                      child: Text('Software Developer', style: TextStyle(fontSize: 18.0),)
                    ),
                    SizedBox(height: 10.0,),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.collections,color: Colors.blueAccent),
                              ),
                              Text('following',style: TextStyle(
                                color: Colors.blueAccent
                              ),)
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.message,color: Colors.black),
                              ),
                              Text('Message',style: TextStyle(
                                color: Colors.black
                              ),)
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.more_vert,color: Colors.black),
                                onPressed: (){
                                  _showMoreOption(cx);
                                },
                              ),
                              Text('More',style: TextStyle(
                                color: Colors.black
                              ),)
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Container(
                      padding: EdgeInsets.only(left: 10.0,right: 10.0),
                      child: Column(
                        children: <Widget>[
                          // Row(children: <Widget>[
                          //   Icon(Icons.work),
                          //   SizedBox(width: 5.0,),
                          //   Text('Working at',style: TextStyle(
                          //     fontSize: 18.0
                          //   ),),
                          //   SizedBox(width: 5.0,),
                          //   Text('MUS Technology',style: TextStyle(
                          //   fontSize: 18.0,
                          //     fontWeight: FontWeight.bold
                          //   ),)
                          // ],),
                          SizedBox(height: 10.0,),
                          Row(children: <Widget>[
                            Icon(Icons.work),
                            SizedBox(width: 5.0,),
                            Text('Works at',style: TextStyle(
                              fontSize: 18.0
                            ),),
                            SizedBox(width: 5.0,),
                            Text('MUS Technology ',style: TextStyle(
                            fontSize: 18.0,
                              fontWeight: FontWeight.bold
                            ),)
                          ],),
                          SizedBox(height: 10.0,),
                          Row(children: <Widget>[
                            Icon(Icons.school),
                            SizedBox(width: 5.0,),
                            Text('Studied Computer Science at',style: TextStyle(
                              fontSize: 18.0
                            ),),
                            SizedBox(width: 5.0,),                            
                          ],),
                          Wrap(
                            children: <Widget>[
                              Text('IGNOU University',style: TextStyle(
                            fontSize: 18.0,
                              fontWeight: FontWeight.bold
                            ),)
                            ],
                          ),

SizedBox(height: 10.0,),
                          Row(children: <Widget>[
                            Icon(Icons.home),
                            SizedBox(width: 5.0,),
                            Text('Lives in',style: TextStyle(
                              fontSize: 18.0
                            ),),
                            SizedBox(width: 5.0,),    
                            Text('India',style: TextStyle(
                            fontSize: 18.0,
                              fontWeight: FontWeight.bold
                            ),)                        
                          ],),


                          SizedBox(height: 10.0,),
                          Row(children: <Widget>[
                            Icon(Icons.location_on),
                            SizedBox(width: 5.0,),
                            Text('From',style: TextStyle(
                              fontSize: 18.0
                            ),),
                            SizedBox(width: 5.0,), 
                            Text('West Bengal',style: TextStyle(
                            fontSize: 18.0,
                              fontWeight: FontWeight.bold
                            ),)                           
                          ],),



                          SizedBox(height: 10.0,),
                          Row(children: <Widget>[
                            Icon(Icons.list),
                            SizedBox(width: 5.0,),
                            Text('No of Student',style: TextStyle(
                              fontSize: 18.0
                            ),),
                            SizedBox(width: 5.0,), 
                            Text('100 Students',style: TextStyle(
                            fontSize: 18.0,
                              fontWeight: FontWeight.bold
                            ),)                           
                          ],),
                          SizedBox(height: 20.0,),
                          Row(children: <Widget>[
                            Expanded(
                              child: RaisedButton(
                                child: Text('see more about Kalyan Biswas'),
                              ),
                            )
                          ],),

                          Container(
                            height: 10.0,
                            child: 
                            Divider(
                              color: Colors.grey,                              
                            ),
                          ),

                        Container(
                          alignment: Alignment.topLeft,
                          child: Text('Photos',style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                          ),
                        
          Container(child: 
            Column(
              children: <Widget>[
                Row(children: <Widget>[
                  Expanded(
                    child: Card(
                      child: 
                      Image.network('https://nation.com.pk/print_images/large/2014-12-28/truck-art-1419719431-3924.png'),
                    )
                  ),
                  Expanded(
                    child: Card(
                      child: 
                      Image.network('https://nation.com.pk/print_images/large/2014-12-28/truck-art-1419719431-3924.png'),
                    )
                  )
                ],),
                Row(children: <Widget>[
                  Expanded(
                    child: Card(
                      child: 
                      Image.network('https://nation.com.pk/print_images/large/2014-12-28/truck-art-1419719431-3924.png'),
                    )
                  ),
                  Expanded(
                    child: Card(
                      child: 
                      Image.network('https://nation.com.pk/print_images/large/2014-12-28/truck-art-1419719431-3924.png'),
                    )
                  ),
                  Expanded(
                    child: Card(
                      child: 
                      Image.network('https://nation.com.pk/print_images/large/2014-12-28/truck-art-1419719431-3924.png'),
                    )
                  )
                ],)
              ],
            )
          ,)




                        ],
                      ),
                    )


              ],
            )
          ],
        ),
    );
  
  }



  _showMoreOption(cx) {

     showModalBottomSheet(
      context: cx,
      builder: (BuildContext bcx) {

        return new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: 
            Row(children: <Widget>[
              Icon(Icons.feedback,
              color: Colors.black,),
              SizedBox(width: 10.0,),
              Text('Give feedback or report this profile',
              style: TextStyle(
                fontSize: 18.0
              ),)
            ],),),


Container(
              padding: EdgeInsets.all(10.0),
              child: 
            Row(children: <Widget>[
              Icon(Icons.block,
              color: Colors.black,),
              SizedBox(width: 10.0,),
              Text('Block',
              style: TextStyle(
                fontSize: 18.0
              ),)
            ],),),



            Container(
              padding: EdgeInsets.all(10.0),
              child: 
            Row(children: <Widget>[
              Icon(Icons.link,
              color: Colors.black,),
              SizedBox(width: 10.0,),
              Text('Copy link to profile',
              style: TextStyle(
                fontSize: 18.0
              ),)
            ],),),



            Container(
              padding: EdgeInsets.all(10.0),
              child: 
            Row(children: <Widget>[
              Icon(Icons.search,
              color: Colors.black,),
              SizedBox(width: 10.0,),
              Text('Search Profile',
              style: TextStyle(
                fontSize: 18.0
              ),)
            ],),)




           

          ],
        );

      },


     ); 


  }
}
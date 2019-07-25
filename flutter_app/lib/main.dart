import 'package:flutter/material.dart';
import 'ticker_controller.dart';

void main() => runApp(StreamExample());

class StreamExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamExampleHome(),
      theme: ThemeData(
        primaryColor: Colors.teal
      ),
      debugShowCheckedModeBanner: false,
    );
  }

}

class StreamExampleHome extends StatefulWidget {
  @override
  _StreamExampleHomeState createState() => _StreamExampleHomeState();
}
  //object from Class TickerController
 TickerController tickerController= TickerController();
class _StreamExampleHomeState extends State<StreamExampleHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Stream Controller"),
      ),
      body:StreamBuilder(
        stream: tickerController.tickerStream,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot){
          //Validation DataStream throw snapshot
          if (snapshot.hasError)

          {
            return Text('Error');
          }
          else if (!snapshot.hasData)
          {
            return Text('Error');
          }
          //
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(snapshot.data.toString(),style: TextStyle(
                  fontSize: 48,
                  color: Colors.redAccent,
                ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(onPressed: (){
                        tickerController.increment.add(snapshot.data);
                    },child: Icon(Icons.add),color: Colors.amberAccent,),
                    SizedBox(
                      height: 48.0,
                    ),
                    RaisedButton(onPressed: (){
                        tickerController.decrement.add(snapshot.data);
                    },child: Icon(Icons.remove),color: Colors.amberAccent,),
                  ],
                ),
              ],
            ),
          );
        },),

    );
  }
}
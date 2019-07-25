import 'dart:async';
class TickerController {
  //Data
  int _ticker;
// Controller Data
final StreamController<int> _tickerController    = StreamController<int>();
//Stream Getter [output Data]
  Stream<int> get tickerStream => _tickerController.stream;
//Sink Getter [input Data]
  StreamSink<int> get tickerSink => _tickerController.sink;

//Controller Action Data
final StreamController<int> _incrementController = StreamController<int>();
//Sink Getter [input Data]
  StreamSink<int> get increment => _incrementController.sink;
//Controller Action Data
final StreamController<int> _decrementController = StreamController<int>();
//Sink Getter [input Data]
  StreamSink<int> get decrement => _decrementController.sink;

TickerController(){
  //init Value
  _ticker =0;
  //Add Data from sink to stream with controller
_tickerController.add(_ticker);
//Listen Action One
_incrementController.stream.listen(_incrementTicker);
//Listen Action Tow
_decrementController.stream.listen(_decrementTicker);
}
  //Action One
  void _incrementTicker(int ticker){
    ticker++;
    //new version ticker
    tickerSink.add(ticker);
  }
   //Action Tow
  void _decrementTicker (int ticker){
    if (ticker>0){
      ticker--;
    }

   //new version ticker
    tickerSink.add(ticker);
  }

  void dispose (){
  //Close All and Any Controller
    _tickerController.close();
    _incrementController.close();
    _decrementController.close();
  }

}
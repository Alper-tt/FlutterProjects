import 'dart:async';

main() {
  // myStreamFunction().listen((e) {
  //   print(e);
  // });

  StreamController _myStreamController = StreamController();

  void functionForStreamController() async {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(milliseconds: 500));
      if (i == 6) {
        _myStreamController.addError("error");
      }
      _myStreamController.sink.add(i + 1);
    }
    _myStreamController.close();
  }

  functionForStreamController();

  _myStreamController.stream.listen(
      (e) {
        print(e * 10);
      },
      onDone: () => print("object"),
      onError: (e) {
        print(e);
      },
      cancelOnError: true
      );
  ;
}

Stream<int> myStreamFunction() async* {
  for (int i = 0; i < 10; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield i + 1;
  }
}

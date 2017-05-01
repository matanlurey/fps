import 'dart:async';
import 'dart:html';

import 'package:fps/fps.dart';

void main() {
  // Hook up the `eachFrame` Stream, using the optimized animationFrame API.
  final counter = document.getElementById('counter');
  eachFrame(animationFrame: () => window.animationFrame)
    .transform(const ComputeFps())
    .listen((fps) => counter.text = fps.toStringAsFixed(1));

  // Allow computing the fibonacci sequence in the background, using CPU time.
  final work = document.getElementById('work');
  work.onClick.listen((_) {
    var counter = 0;
    Timer timer;
    timer = new Timer.periodic(const Duration(milliseconds: 1), (_) {
      if (++counter > 40) {
        timer.cancel();
        counter = 0;
      }
      print(fibonacci(counter));
    });
  });
}

int fibonacci(int n) {
  return n < 2 ? n : (fibonacci(n - 1) + fibonacci(n - 2));
}

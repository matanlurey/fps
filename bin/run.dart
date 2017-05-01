import 'package:fps/fps.dart';

void main() {
  eachFrame()
    .take(10)
    .transform(const ComputeFps())
    .listen(print);
}

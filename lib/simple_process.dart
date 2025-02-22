import 'package:simdart/simdart.dart';

void main() async {
  final SimDart sim = SimDart();

  sim.process(event: _a, name: 'A');
  sim.process(event: _b, start: 5, name: 'B');

  await sim.run();
}

Future<void> _a(SimContext context) async {
  print('[${context.now}][${context.eventName}] start');
  await context.wait(10);
  context.process(event: _c, delay: 1, name: 'C');
  print('[${context.now}][${context.eventName}] end');
}

Future<void> _b(SimContext context) async {
  print('[${context.now}][${context.eventName}] start');
  await context.wait(1);
  print('[${context.now}][${context.eventName}] end');
}

Future<void> _c(SimContext context) async {
  print('[${context.now}][${context.eventName}] start');
  await context.wait(10);
  print('[${context.now}][${context.eventName}] end');
}

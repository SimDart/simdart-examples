import 'package:simdart/simdart.dart';

void main() async {
  final SimDart sim = SimDart();

  sim.repeatProcess(
      event: _a,
      start: 1,
      name: (start) => 'A$start',
      interval: Interval.fixed(fixedInterval: 2, untilTime: 5));

  await sim.run();
}

Future<void> _a(SimContext context) async {
  print('[${context.now}][${context.eventName}]');
}

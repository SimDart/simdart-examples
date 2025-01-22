import 'package:simdart/simdart.dart';

void main() async {
  final SimDart sim = SimDart(onTrack: (track) => print(track));

  sim.repeatProcess(
      event: _a,
      start: 1,
      name: 'A',
      interval: Interval.fixed(fixedInterval: 2, untilTime: 6));

  await sim.run();
}

void _a(EventContext context) async {}

import 'package:simdart/simdart.dart';

void main() async {
  final SimDart sim = SimDart(onTrack: (track) => print(track));

  sim.resources.limited(id: 'resource', capacity: 2);

  sim.process(event: _a, name: 'A1', resourceId: 'resource');
  sim.process(event: _a, name: 'A2', start: 1, resourceId: 'resource');
  sim.process(event: _a, name: 'A3', start: 2, resourceId: 'resource');
  sim.process(event: _b, name: 'B', start: 3);

  await sim.run();
}

void _a(EventContext context) async {
  await context.wait(10);
}

void _b(EventContext context) async {}

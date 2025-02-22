import 'package:simdart/simdart.dart';

void main() async {
  final SimDart sim = SimDart();

  sim.resources.limited(id: 'resource', capacity: 1);

  sim.process(event: _eventResource, name: 'A');
  sim.process(event: _eventResource, name: 'B');

  await sim.run();
}

Future<void> _eventResource(SimContext context) async {
  print('[${context.now}][${context.eventName}] acquiring resource...');
  await context.resources.acquire('resource');
  print('[${context.now}][${context.eventName}] resource acquired');
  await context.wait(10);
  print('[${context.now}][${context.eventName}] releasing resource...');
  context.resources.release('resource');
}

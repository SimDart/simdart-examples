import 'package:simdart/simdart.dart';

void main() async {
  final SimDart sim = SimDart();

  sim.process(eventA);
  sim.process(eventB, start: 5);

  await sim.run();
}

void eventA(EventContext context) async {
  await context.wait(10);
  context.sim.process(eventC);
}

void eventB(EventContext context) async {
  await context.wait(5);
}

void eventC(EventContext context) async {
  await context.wait(15);
}

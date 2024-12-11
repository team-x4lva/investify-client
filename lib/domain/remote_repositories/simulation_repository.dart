import 'package:flutter/material.dart';

abstract interface class SimulationRepository {
  Future<Simulation> login();
}

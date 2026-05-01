import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';

import '../models/parking_lot.dart';
import '../theme/app_theme.dart';

class OccupancySnapshot {
  const OccupancySnapshot({
    required this.percent,
    required this.level,
    required this.color,
    required this.label,
  });

  final int percent;
  final OccupancyLevel level;
  final Color color;
  final String label;
}

class OccupancyService extends ChangeNotifier {
  OccupancyService({Duration tickInterval = const Duration(minutes: 5)})
      : _tickInterval = tickInterval;

  final Duration _tickInterval;
  Timer? _timer;

  int get currentTick =>
      DateTime.now().millisecondsSinceEpoch ~/ _tickInterval.inMilliseconds;

  DateTime get nextChangeAt {
    final ms = (currentTick + 1) * _tickInterval.inMilliseconds;
    return DateTime.fromMillisecondsSinceEpoch(ms);
  }

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);
    if (_timer == null) _scheduleNextTick();
  }

  @override
  void removeListener(VoidCallback listener) {
    super.removeListener(listener);
    if (!hasListeners) {
      _timer?.cancel();
      _timer = null;
    }
  }

  void _scheduleNextTick() {
    final nowMs = DateTime.now().millisecondsSinceEpoch;
    final delay = nextChangeAt.millisecondsSinceEpoch - nowMs;
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: delay <= 0 ? 1 : delay), () {
      notifyListeners();
      if (hasListeners) _scheduleNextTick();
    });
  }

  OccupancySnapshot snapshotFor(ParkingLot lot) {
    final percent = _percentFor(lot);
    final level = _levelFor(percent);
    return OccupancySnapshot(
      percent: percent,
      level: level,
      color: _colorFor(level),
      label: _labelFor(level),
    );
  }

  int _percentFor(ParkingLot lot) {
    final mix = (lot.id * 73856093) ^ (currentTick * 19349663);
    final delta = (mix.abs() % 51) - 25;
    return (lot.baseOccupancyPercent + delta).clamp(0, 100);
  }

  OccupancyLevel _levelFor(int percent) {
    if (percent >= 95) return OccupancyLevel.full;
    if (percent >= 75) return OccupancyLevel.high;
    if (percent >= 45) return OccupancyLevel.medium;
    return OccupancyLevel.low;
  }

  Color _colorFor(OccupancyLevel level) {
    switch (level) {
      case OccupancyLevel.low:
        return AppColors.occupancyLow;
      case OccupancyLevel.medium:
        return AppColors.occupancyMedium;
      case OccupancyLevel.high:
        return AppColors.occupancyHigh;
      case OccupancyLevel.full:
        return AppColors.occupancyFull;
    }
  }

  String _labelFor(OccupancyLevel level) {
    switch (level) {
      case OccupancyLevel.low:
        return 'Disponible';
      case OccupancyLevel.medium:
        return 'Medio lleno';
      case OccupancyLevel.high:
        return 'Casi lleno';
      case OccupancyLevel.full:
        return 'Lleno';
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

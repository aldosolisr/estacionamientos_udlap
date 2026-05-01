import 'package:flutter/foundation.dart';

import '../models/parking_lot.dart';
import 'notifications_service.dart';
import 'occupancy_service.dart';

class DestinationTracker extends ChangeNotifier {
  DestinationTracker({
    required OccupancyService occupancy,
    required NotificationsService notifications,
  })  : _occupancy = occupancy,
        _notifications = notifications;

  final OccupancyService _occupancy;
  final NotificationsService _notifications;

  ParkingLot? _destination;
  OccupancyLevel? _lastLevel;
  bool _subscribed = false;

  ParkingLot? get destination => _destination;
  bool get hasDestination => _destination != null;

  void setDestination(ParkingLot lot) {
    _destination = lot;
    _lastLevel = _occupancy.snapshotFor(lot).level;
    _ensureSubscribed();
    notifyListeners();
  }

  void clear({String? message}) {
    _destination = null;
    _lastLevel = null;
    _ensureUnsubscribed();
    notifyListeners();
  }

  void _ensureSubscribed() {
    if (_subscribed) return;
    _occupancy.addListener(_onTick);
    _subscribed = true;
  }

  void _ensureUnsubscribed() {
    if (!_subscribed) return;
    _occupancy.removeListener(_onTick);
    _subscribed = false;
  }

  void _onTick() {
    final lot = _destination;
    if (lot == null) return;
    final snap = _occupancy.snapshotFor(lot);
    if (_lastLevel != null && snap.level != _lastLevel) {
      _notifications.show(
        title: 'El estacionamiento ${lot.code} cambió',
        body: 'Ahora está ${snap.label.toLowerCase()} (${snap.percent}%).',
      );
    }
    _lastLevel = snap.level;
    notifyListeners();
  }

  @override
  void dispose() {
    _ensureUnsubscribed();
    super.dispose();
  }
}

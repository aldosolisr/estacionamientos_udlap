import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/parking_data.dart';
import '../models/parking_lot.dart';

class RecentParkingEntry {
  const RecentParkingEntry({required this.lotId, required this.openedAt});

  final int lotId;
  final DateTime openedAt;
}

class RecentParkingsService extends ChangeNotifier {
  RecentParkingsService(this._prefs) {
    _entries = _read();
  }

  static const _kKey = 'recent_parkings_v1';
  static const int maxEntries = 5;

  final SharedPreferences _prefs;
  late List<RecentParkingEntry> _entries;

  static Future<RecentParkingsService> load() async {
    final prefs = await SharedPreferences.getInstance();
    return RecentParkingsService(prefs);
  }

  List<RecentParkingEntry> get entries => List.unmodifiable(_entries);

  List<ParkingLot> get lots {
    final byId = {for (final l in kAllParkingLots) l.id: l};
    return [
      for (final e in _entries)
        if (byId[e.lotId] != null) byId[e.lotId]!,
    ];
  }

  Future<void> push(int lotId) async {
    final now = DateTime.now();
    _entries
      ..removeWhere((e) => e.lotId == lotId)
      ..insert(0, RecentParkingEntry(lotId: lotId, openedAt: now));
    if (_entries.length > maxEntries) {
      _entries = _entries.sublist(0, maxEntries);
    }
    await _write();
    notifyListeners();
  }

  Future<void> clear() async {
    _entries = [];
    await _prefs.remove(_kKey);
    notifyListeners();
  }

  List<RecentParkingEntry> _read() {
    final raw = _prefs.getStringList(_kKey) ?? const <String>[];
    final result = <RecentParkingEntry>[];
    for (final line in raw) {
      final parts = line.split('|');
      if (parts.length != 2) continue;
      final id = int.tryParse(parts[0]);
      final ts = int.tryParse(parts[1]);
      if (id == null || ts == null) continue;
      result.add(RecentParkingEntry(
        lotId: id,
        openedAt: DateTime.fromMillisecondsSinceEpoch(ts),
      ));
    }
    return result;
  }

  Future<void> _write() async {
    final encoded = [
      for (final e in _entries)
        '${e.lotId}|${e.openedAt.millisecondsSinceEpoch}',
    ];
    await _prefs.setStringList(_kKey, encoded);
  }
}

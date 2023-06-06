import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedbahanNotifier extends ChangeNotifier{
  String? initialbahan;

  void setSelectedbahan(String bahan) {
    initialbahan = bahan;
    notifyListeners();
  }
}

final selectedbahanProvider = ChangeNotifierProvider<SelectedbahanNotifier>((ref) {
  return SelectedbahanNotifier();
});

class SelectedtipeNotifier extends ChangeNotifier {
  String? initialtipe;

  void setSelectedtipe(String tipe) {
    initialtipe = tipe;
    
    notifyListeners();
  }
}

final selectedtipeProvider = ChangeNotifierProvider<SelectedtipeNotifier>((ref) {
  return SelectedtipeNotifier();
});

class SelectedsizeNotifier extends ChangeNotifier {
  int? initialsize;

  void setSelectedsize(int size) {
    initialsize = size;
    
    notifyListeners();
  }
}

final selectedsizeProvider = ChangeNotifierProvider<SelectedsizeNotifier>((ref) {
  return SelectedsizeNotifier();
});

class SelectedgenderNotifier extends ChangeNotifier {
  String? initialgender;

  void setSelectedgender(String gender) {
    initialgender = gender;
    
    notifyListeners();
  }
}

final selectedgenderProvider = ChangeNotifierProvider<SelectedgenderNotifier>((ref) {
  return SelectedgenderNotifier();
});

class SelectedwarnaNotifier extends ChangeNotifier {
  String? initialwarna;

  void setSelectedwarna(String warna) {
    initialwarna = warna;
    
    notifyListeners();
  }
}

final selectedwarnaProvider = ChangeNotifierProvider<SelectedwarnaNotifier>((ref) {
  return SelectedwarnaNotifier();
});





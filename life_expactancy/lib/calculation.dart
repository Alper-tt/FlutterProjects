import 'package:life_expactancy/user_data.dart';

class Calculation {
  late UserData _userData;
  Calculation(this._userData);

  double calculate() {
    double sonuc;

    sonuc = 90 + _userData.noe! - _userData.noc!;
    sonuc = sonuc + (_userData.weight! / _userData.height!);

    _userData.selectedSex == 'woman' ? sonuc += 3 : sonuc;
    return sonuc;
  }
}

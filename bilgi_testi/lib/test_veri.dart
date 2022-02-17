import 'soru.dart';

class TestVeri {
  int _soruSayac = 0;
  List<Soru> _soruBankasi = [
    Soru(
        soruMetni: 'Titanic gelmiş geçmiş en büyük gemidir', soruYaniti: false),
    Soru(
        soruMetni: 'Dünyadaki tavuk sayısı insan sayısından fazladır',
        soruYaniti: true),
    Soru(soruMetni: 'Kelebeklerin ömrü bir gündür', soruYaniti: false),
    Soru(soruMetni: 'Dünya düzdür', soruYaniti: false),
    Soru(
        soruMetni: 'Kaju fıstığı aslında bir meyvenin sapıdır',
        soruYaniti: true),
    Soru(
        soruMetni: 'Fatih Sultan Mehmet hiç patates yememiştir',
        soruYaniti: true),
    Soru(soruMetni: 'Fransızlar 80 demek için, 4 - 20 der', soruYaniti: true),
  ];

  String getSoruMetni() {
    return _soruBankasi[_soruSayac].soruMetni;
  }

  bool getSoruYanit() {
    return _soruBankasi[_soruSayac].soruYaniti;
  }

  void sonrakiSoru() {
    if (_soruSayac < _soruBankasi.length - 1) {
      _soruSayac++;
    }
  }

  bool testBittiMi() {
    if (_soruSayac + 1 >= _soruBankasi.length) {
      return true;
    } else {
      return false;
    }
  }

  void sayacSifirla() {
    _soruSayac = 0;
  }
}

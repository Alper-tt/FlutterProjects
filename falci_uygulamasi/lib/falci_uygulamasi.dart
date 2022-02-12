import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

void main() {
  runApp(falci());
}

class falci extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[400],
          centerTitle: true,
          title: Text(
            'GÜNÜN FALI',
            style: GoogleFonts.rowdies(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ),
        body: anaSayfa(),
        backgroundColor: Colors.purple[300],
      ),
    );
  }
}

class anaSayfa extends StatefulWidget {
  anaSayfa({Key? key}) : super(key: key);

  @override
  _anaSayfaState createState() => _anaSayfaState();
}

var yanitlar = [
  'TIKLA FALIN GELSİN',
  'AŞK: Bugün, aşk ve ilişki hayatınızda biraz daha temkinli olmalısın. Onu her konuda doğru anlamda anladığından da emin misin?',
  'AŞK: Aşk ve ilişki hayatınızda hakimiyeti eline almak ve birlikteliğinizi dilediğiniz gibi yönlendirmek isteyebilirsin. Bu isteğinin denge içerisindeki bir ilişkiye ne şekilde fayda edeceğini gözden geçirmelisin.',
  'AŞK: Duygularınızın bugün biraz düzensiz olduğunu görebilirsiniz. Güne, daha önce hiç yapmadığınız bir şekilde başlamanızı sağlayan doğal bir elektrik hissi var. Kalbiniz her zaman doğruyu söyler.',
  'AŞK: Duygularınız çoğu zaman rasyonel düşüncelerinize galip geliyor ve sonunda derinlerde duyguların beslediği bir karmaşa ortaya çıkıyor. Çok da mantıklı düşünerek kalbinizi görmezden gelmeyin. Amacınız bu ikisi arasında dengeyi bulmak.',
  'AŞK: Duygusal olarak kötü hissetmeyin, sezgileriniz güçlü durumda. Sevgilinizin hislerini bu sezgiler ile anlamaya çalışın. Bazen sadece eğlenmek gerekir, siz de rahatlayın ve birlikte eğlenin!',
  'PARA: Kafanıza uzun süredir koyduğunuz bazı harcamalar var, bugün kendinize bunlara gerçekten ne kadar ihtiyacınız olduğunu sorun ve bir kısmını iptal edin. Bugün bir hayır kurumuna küçücük bir bağış yapın, kendinizi çok daha iyi hissedeceksiniz.',
  'PARA: Nakit akışınızın dengesini bozabilecek dönemlere giriyoruz, bu aralar kesinlikle masa başına oturup bir bütçe hesabı yapmalısınız, önümüzdeki 3 ay boyunca gelir gider dengenizden emin olmadan hareket etmeyin',
  'PARA: Bugün, başkalarına yardım, destek ve hizmet duygunuzun yüksek olduğu bir gün olabilir, hayır, bağış işlerinde yer alabilirsiniz.',
  'PARA: Bugün kendinize güveniniz oldukça yüksek, ancak bu size pek fayda getirmeyebilir, bağlantılarınız size verdikleri destekten şüphelenebilirler. Sakin hareket edin, bir adım geri durun, ve paradan çok sağlığınızla ilgilenin.',
  'PARA: Para kaynaklarımız ile ilgili detaylar bu dönem dikkat etmelisiniz. Ayrıca maddi konularda ve harcamalarda uzun süredir sizi meşgul eden bir konuda karara varabilirsiniz, yakınlarınızdan veya eşinizden karar alırken yardım isteyin.',
  'TAVSİYE: Bugün meraklı kişiliğini ön plana çıkartarak insanlara soru sormaktan çekinme ',
  'TAVSİYE: Bugün daha önce hiç fark etmediğin şeylerin hep orada olduğunu fark edebilirsin, sadece biraz daha dikkatli olmaya çalış',
  'TAVSİYE: Bugün ikili ilişkilerinde daha aktif ve verici olmaya çalışabilirsin, aynı fikirde olduğun insanları daha dikkatli dinlemeye ve sorgulamaya başla',
  'TAVSİYE: Bugün sadece işine odaklan, dikkatini dağıtacak her türlü nesne ve sosyal medyadan uzaklaşmak kendini daha mutlu hissettirebilir',
  'TAVSİYE: Bugün tek başına biraz yürüyüş yap, çocukluğunda dinlediğin şarkıları aç ve o zamanlar oynadığın oyunları hayal et'
];

int yanitIndex = 0;
int askNo = 1;
int paraNo = 1;
int tavsiyeNo = 1;

class _anaSayfaState extends State<anaSayfa> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('images/falci.png', height: 150, width: 200),
          SizedBox(height: 20),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: FlatButton(
              onPressed: () {
                setState(() {
                  yanitIndex = Random().nextInt(5) + 1;
                });
              },
              child: ListTile(
                title: Text(
                  'AŞK DURUMU',
                  style: TextStyle(color: Colors.red),
                ),
                leading: Icon(
                  CupertinoIcons.heart_fill,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),

          Card(
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: FlatButton(
              onPressed: () {
                setState(() {
                  yanitIndex = Random().nextInt(5) + 6;
                });
              },
              child: ListTile(
                title: Text(
                  'PARA DURUMU',
                  style: TextStyle(color: Colors.lightGreen),
                ),
                leading: Icon(Icons.monetization_on, color: Colors.lightGreen),
              ),
            ),
          ),
          SizedBox(height: 10),

          Card(
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: FlatButton(
              onPressed: () {
                setState(() {
                  yanitIndex = Random().nextInt(5) + 11;
                });
              },
              child: ListTile(
                title: Text(
                  'GÜNLÜK TAVSİYE',
                  style: TextStyle(color: Colors.lightBlue),
                ),
                leading: Icon(Icons.explore, color: Colors.lightBlue),
              ),
            ),
          ),

          Container(
            height: 150,
            width: 300,
            child: Center(
              child: Text(
                (yanitlar[yanitIndex]),
                style: GoogleFonts.akayaTelivigala(fontSize: 15,
                color: Colors.white)
              ),
            ),
          ),
        ],
      ),
    );
  }
}

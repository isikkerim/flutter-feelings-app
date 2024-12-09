import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BottomActivityPage extends StatelessWidget {
  final List<String> activities = [
    "Su İçme Takibi",
    "Günlük Yazma",
    "Mindfulness Uygulamaları",
    "Müzik Dinleme Terapisi",
    "ASMR Deneyimi",
    "Nefes Egzersizleri",
    "Dikkat Egzersizleri",
    "Öfke Kontrol Egzersizleri",
    "Stres Kontrolü Teknikleri",
    "Kaygı Yönetimi",
    "Takıntılara Karşı Farkındalık",
    "Acelecilik Kontrolü",
    "Kararsızlıkla Baş Etme"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ActivityDetailPage(activities[index]),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              elevation: 10, // Increase elevation for shadow effect
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Optional: add rounded corners to the card
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), // Ensure the corners match the card's border radius
                  image: DecorationImage(
                    image: AssetImage("assets/images/zaman04.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    // Overlay a semi-transparent black color to improve text visibility
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5), // Adjust opacity to make the overlay darker
                          borderRadius: BorderRadius.circular(10), // Match the container's rounded corners
                        ),
                      ),
                    ),
                    ListTile(
                      titleAlignment: ListTileTitleAlignment.center,
                      contentPadding: EdgeInsets.all(16),
                      title: Text(
                        activities[index],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white, // Make the text white for better contrast
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward,
                        color: Colors.white, // Make the icon white for better contrast
                      ),
                    ),
                  ],
                ),
              ),
            )



          );
        },
      ),
    );
  }
}

class ActivityDetailPage extends StatefulWidget {
  final String activityName;

  ActivityDetailPage(this.activityName);

  @override
  _ActivityDetailPageState createState() => _ActivityDetailPageState();
}

class _ActivityDetailPageState extends State<ActivityDetailPage> {
  int currentStep = 0;
  String description = "";
  int timerDuration = 0;
  bool isTaskCompleted = false;

  List<Map<String, dynamic>> steps = [];

  @override
  void initState() {
    super.initState();
    setActivitySteps();
  }

  void setActivitySteps() {
    switch (widget.activityName) {
      case "Su İçme Takibi":
        description =
            "Gün boyu su içmeyi unutma! Hedefini belirle ve hatırlatıcıları kullan.";
        steps = [
          {"step": "Su İçme Hatırlatıcıları Kur", "time": 2},
          {"step": "Günlük Su Miktarını Takip Et", "time": 5},
          {"step": "İçilen Su Miktarını Güncelle", "time": 2},
          {"step": "Sonuçları Gözden Geçir", "time": 3},
        ];
        break;

      case "Günlük Yazma":
        description = "Duygularını ve düşüncelerini yazıya dökerek rahatla.";
        steps = [
          {"step": "Günlük Başlat", "time": 3},
          {"step": "Bugün Nasılsın?", "time": 5},
          {"step": "Öğrenilenlerden Bahset", "time": 5},
          {"step": "Pozitif Deneyimlerini Yaz", "time": 5},
        ];
        break;

      // Diğer aktiviteler için benzer şekilde tanımlar ekleyin...

      default:
        description = "Bu aktivite için özel bir tanım yok.";
        break;
    }
  }

  void nextStep() {
    if (currentStep < steps.length - 1) {
      setState(() {
        currentStep++;
      });
    } else {
      setState(() {
        isTaskCompleted = true;
      });
      Fluttertoast.showToast(
          msg: "Tebrikler! Aktiviteyi tamamladınız.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER);
    }
  }

  void resetActivity() {
    setState(() {
      currentStep = 0;
      isTaskCompleted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.activityName,
            style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          if (isTaskCompleted)
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: resetActivity,
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              description,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            isTaskCompleted
                ? Column(
                    children: [
                      Icon(Icons.check_circle, color: Colors.green, size: 50),
                      SizedBox(height: 10),
                      Text(
                        "Tebrikler, tüm adımları başarıyla tamamladınız!",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Text(
                        "Adım ${currentStep + 1}: ${steps[currentStep]['step']}",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Zaman: ${steps[currentStep]['time']} dakika",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 20),
                      LinearProgressIndicator(
                        value: (currentStep + 1) / steps.length,
                        color: Colors.blue,
                        backgroundColor: Colors.grey[200],
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: nextStep,
                        child: Text(currentStep == steps.length - 1
                            ? "Tamamla"
                            : "Sonraki Adım"),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          backgroundColor: Colors.blue,
                          textStyle: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}

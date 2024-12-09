import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../models/info_model.dart';
import '../../models/quote_model.dart';
import 'dart:math';

class BottomHomePage extends StatefulWidget {
  const BottomHomePage({super.key});

  @override
  State<BottomHomePage> createState() => _BottomHomePageState();
}

class _BottomHomePageState extends State<BottomHomePage> {
  @override
  Widget build(BuildContext context) {
    return const SliverAppBarExample();
  }
}

class SliverAppBarExample extends StatefulWidget {
  const SliverAppBarExample({super.key});

  @override
  State<SliverAppBarExample> createState() => _SliverAppBarExampleState();
}

class _SliverAppBarExampleState extends State<SliverAppBarExample> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: CustomPage(),
    );
  }
}

class CustomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Carousel Slider
          CarouselSlider(
            options: CarouselOptions(
              height: 230.0,
              autoPlay: true,
              // Enable auto-play for continuous sliding
              enlargeCenterPage: true,
              // Enlarge the center item for a more dynamic look
              viewportFraction: 0.5,
              // Reduce the size of adjacent images
              onPageChanged: (index, reason) {
                // Add a custom action when the page changes
              },
            ),
            items: [
              'assets/images/zaman01.jpg',
              'assets/images/zaman02.jpg',
              'assets/images/zaman03.jpg'
            ].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      // Rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26, // Light shadow
                          offset: Offset(0, 4), // Shadow position
                          blurRadius: 6, // Shadow blur
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      // Rounded corners for image
                      child: Image.asset(
                        i,
                        fit: BoxFit
                            .cover, // Ensure the image fills the container
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 20),

          infoCardLast(),
          const SizedBox(height: 20),

          ProgressChart(),

          const SizedBox(height: 20),
          quoteCardFuture(),
          const SizedBox(height: 20,),

          ProgressChart2(),

        ],
      ),
    );
  }

  // Progress Chart (Line and Bar Graphs)
  Widget ProgressChart() {
    return Container(
      height: 200,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(show: true),
          borderData: FlBorderData(show: true),
          minX: 0,
          maxX: 6,
          minY: 0,
          maxY: 100,
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 10),
                FlSpot(1, 40),
                FlSpot(2, 70),
                FlSpot(3, 50),
                FlSpot(4, 90),
                FlSpot(5, 60),
              ],
              isCurved: true,
              barWidth: 4,
            ),
          ],
        ),
      ),
    );
  }

  Widget ProgressChart2() {
    return Container(
      height: 200,
      child: BarChart(
        BarChartData(
          gridData: FlGridData(show: true),
          titlesData: const FlTitlesData(show: true),
          borderData: FlBorderData(show: true),
          barGroups: [
            BarChartGroupData(x: 0, barRods: [
              BarChartRodData(toY: 10, color: Colors.red),
            ]),
            BarChartGroupData(x: 1, barRods: [
              BarChartRodData(toY: 40, color: Colors.red),
            ]),
            BarChartGroupData(x: 2, barRods: [
              BarChartRodData(toY: 70, color: Colors.red),
            ]),
            BarChartGroupData(x: 3, barRods: [
              BarChartRodData(toY: 50, color: Colors.red),
            ]),
            BarChartGroupData(x: 4, barRods: [
              BarChartRodData(toY: 90, color: Colors.red),
            ]),
            BarChartGroupData(x: 5, barRods: [
              BarChartRodData(toY: 60, color: Colors.red),
            ]),
          ],
        ),
      ),
    );
  }

  // Test için Dialog
  void _showTestDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Test Sorusu"),
          content: Text("Bugün yaşadığınız en büyük zorluk neydi?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("İptal"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Test cevabınız kaydedildi!")),
                );
              },
              child: Text("Kaydet"),
            ),
          ],
        );
      },
    );
  }

  // Güzel Sözler için FutureBuilder
  Widget quoteCardFuture() {
    return FutureBuilder<List<Quote>>(
      future: QuoteService().loadQuotes(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text("Hata oluştu: ${snapshot.error}"));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          List<Quote> quotes = snapshot.data!;
          List<int> numbers =
              generateUniqueRandomNumbers(maxLength: quotes.length, count: 1);

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: numbers.map((index) {
              return _quoteCard(quotes[index].quote);
            }).toList(),
          );
        }

        return Center(child: Text("Veri yok."));
      },
    );
  }

  // Güzel Sözler için Widget
  Widget _quoteCard(String quote) {
    return Container(
      width: Get.width * 0.95,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            quote,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

// Info Card için FutureBuilder
Widget infoCardLast() {
  return Container(
    width: Get.width * 0.95,
    child: FutureBuilder<List<InfoCard>>(
      future: InfoCardService().loadInfoCards(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text("Hata oluştu: ${snapshot.error}"));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          List<InfoCard> cards = snapshot.data!;
          List<int> numbers =
              generateUniqueRandomNumbers(maxLength: cards.length, count: 3);

          return _infoCardWidget(cards[numbers[0]]);
        }

        return Center(child: Text("Veri yok."));
      },
    ),
  );
}

// Info Card Widget
Widget _infoCardWidget(InfoCard card) {
  return Container(
    width: Get.width * 0.95,
    child: Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              card.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              card.description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    ),
  );
}

// Helper function for generating unique random numbers
List<int> generateUniqueRandomNumbers(
    {required int maxLength, required int count}) {
  final Random random = Random();
  Set<int> numbers = Set<int>();

  while (numbers.length < count) {
    numbers.add(random.nextInt(maxLength));
  }

  return numbers.toList();
}

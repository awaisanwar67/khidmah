import 'package:flutter/material.dart';
import 'package:khidmah/view/screen4_khidmah.dart';

class Screen3Khidmah extends StatefulWidget {
  const Screen3Khidmah({super.key});

  @override
  State<Screen3Khidmah> createState() => _Screen3KhidmahState();
}

class _Screen3KhidmahState extends State<Screen3Khidmah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 3, 95, 86),
                  ),
                ),
                Positioned(
                  bottom: -40,
                  left: 24,
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(color: Colors.amber),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Awais',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),

                  Text('Certified Plumber . 6 yrs experience'),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            '4.9',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'Rating',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 131, 130, 130),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 15),
                      Column(
                        children: [
                          Text(
                            '312',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'Jobs done',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 131, 130, 130),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 15),
                      Column(
                        children: [
                          Text(
                            '12 min',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'Avg.arrival',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 131, 130, 130),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(94, 49, 160, 149),
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                        ),

                        child: Center(
                          child: Text(
                            'Leak Repair',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 8, 99, 90),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(94, 49, 160, 149),
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                        ),

                        child: Center(
                          child: Text(
                            'Pipe Fitting',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 8, 99, 90),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(94, 49, 160, 149),
                      borderRadius: BorderRadius.all(Radius.circular(35)),
                    ),

                    child: Center(
                      child: Text(
                        'Water Heater',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 8, 99, 90),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Awais has completed over 300 residential jobs across Riyadh. Background verified through Absher and insured for every visit booked via Khidmah.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'SAR 120',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Screen4Khidmah()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                    255,
                    3,
                    95,
                    86,
                  ), // green color
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // rounded corners
                  ),
                ),
                child: Text('Book now', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

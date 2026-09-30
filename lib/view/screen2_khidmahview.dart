import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:khidmah/view/screen3_khidmah.dart';
import 'package:khidmah/view/screen4_khidmah.dart';
import 'package:khidmah/view/screen6_khidmah.dart';

class Screen2Khidmahview extends StatefulWidget {
  const Screen2Khidmahview({super.key});

  @override
  State<Screen2Khidmahview> createState() => _Screen2KhidmahviewState();
}

class _Screen2KhidmahviewState extends State<Screen2Khidmahview> {
  Position? userPosition;
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    startLocationUpdates();
  }

  Future<void> startLocationUpdates() async {
    print("1: Function start hua");
    bool serviceEnable = await Geolocator.isLocationServiceEnabled();
    print("2: GPS service enabled = $serviceEnable");
    if (!serviceEnable) {
      print("3: GPS off hai, dialog dikha rahe hain");
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Location Service off'),
          content: Text('pleas turn on location service to continue'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancle'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                await Geolocator.openLocationSettings();
                await Future.delayed(Duration(seconds: 2));
                startLocationUpdates();
              },
              child: Text('Turn on'),
            ),
          ],
        ),
      );
      return;
    }
    LocationPermission permission = await Geolocator.checkPermission();
    print("4: Permission status = $permission");
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      print("5: Permission request ke baad = $permission");
    }
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      print("6: Permission nahi mili, function ruk raha hai");
      return;
    }
    print("7: Ab GPS stream start ho raha hai");
    Geolocator.getPositionStream(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 50,
      ),
    ).listen((Position Position) {
      print(
        "8: Naya location mila: ${Position.latitude}, ${Position.longitude}",
      );
      setState(() {
        userPosition = Position;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 230,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(top: 60, left: 30),
              child: Column(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Good morning'),
                            SizedBox(width: 160),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 199, 197, 197),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Center(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.notifications),
                                ),
                              ),
                            ),
                          ],
                        ),

                        Text(
                          'Faisal Al-Harbi',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: 45,
                          width: 300,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 209, 207, 207),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Icon(Icons.search),
                              ),
                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: 'Search"AC technnician"',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 20),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 165, 195, 221),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.plumbing,
                          color: const Color.fromARGB(255, 43, 2, 109),
                        ),
                      ),
                    ),
                    Text('Plumbing'),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 165, 195, 221),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.bolt,
                          color: const Color.fromARGB(255, 43, 2, 109),
                        ),
                      ),
                    ),
                    Text('Electric'),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 165, 195, 221),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.ac_unit,
                          color: const Color.fromARGB(255, 43, 2, 109),
                        ),
                      ),
                    ),
                    Text('AC Repair'),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 165, 195, 221),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.cleaning_services,
                          color: const Color.fromARGB(255, 206, 12, 21),
                        ),
                      ),
                    ),
                    Text('Cleaning'),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('khd').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (!snapshot.hasData || userPosition == null) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  print("Firestore error: ${snapshot.error}");
                  return Center(child: Text('Error:${snapshot.error}'));
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var provider = snapshot.data!.docs[index];
                      double distanceInKm =
                          Geolocator.distanceBetween(
                            userPosition!.latitude,
                            userPosition!.longitude,
                            provider['latitude'],
                            provider['longitude'],
                          ) /
                          1000;
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                          top: 10,
                        ),
                        child: InkWell(
                          onTap: () {
                            print('Google button dbya gya');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Screen3Khidmah(),
                              ),
                            );
                          },
                          child: Container(
                            height: 130,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 1,
                                  spreadRadius: 0,

                                  color: Colors.black,
                                ),
                              ],
                            ),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 100),
                                  child: Text(
                                    provider['Name'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 2,
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          child: Image.network(
                                            provider['url'],
                                            width: 50,
                                            height: 50,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Column(
                                        children: [
                                          Text('Plumbing.Riyadh'),
                                          Text(
                                            '${distanceInKm.toStringAsFixed(1)}km',
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                return SizedBox();
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Screen2Khidmahview()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Screen3Khidmah()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Screen4Khidmah()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Screen6Khidmah()),
            );
          }
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Booking',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

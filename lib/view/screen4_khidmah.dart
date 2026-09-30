import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:khidmah/view/screen5_khidmah.dart';
import 'package:khidmah/viewmode/khidmah_viewmodel.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class Screen4Khidmah extends StatefulWidget {
  const Screen4Khidmah({super.key});

  @override
  State<Screen4Khidmah> createState() => _Screen4KhidmahState();
}

class _Screen4KhidmahState extends State<Screen4Khidmah> {
  @override
  Widget build(BuildContext context) {
    final viewmodel = context.watch<KhidmahViewmodel>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: FlutterMap(
                options: MapOptions(
                  initialCenter: LatLng(24.7136, 46.6753),
                  initialZoom: 14,
                  onTap: (tapPosition, point) {
                    setState(() {
                      final viewmodel = context.read<KhidmahViewmodel>();
                      viewmodel.saveLoc(point);
                    });
                  },
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'come.example.khidmah',
                  ),
                  MarkerLayer(
                    markers: viewmodel.locationSaver == null
                        ? []
                        : [
                            Marker(
                              point: viewmodel.locationSaver!,
                              width: 40,
                              height: 40,
                              child: Icon(
                                Icons.location_pin,
                                color: Colors.red,
                                size: 40,
                              ),
                            ),
                          ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Text(
                    'Confirm booking',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Service addres', style: TextStyle(color: Colors.grey)),
                  Text(
                    viewmodel.addres ?? "pleas select the address",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text(
                    viewmodel.timeDate != null
                        ? "${viewmodel.timeDate!.day}/${viewmodel.timeDate!.month}/${viewmodel.timeDate!.year},${viewmodel.timeDate!.hour}:${viewmodel.timeDate!.minute}"
                        : "Select Date&Time",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 140),
                  TextButton(
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate == null) return;
                      TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (pickedTime == null) return;
                      viewmodel.saveDateTime(pickedDate, pickedTime);
                    },
                    child: Text('Edit'),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20, top: 30),
              child: Text('Service', style: TextStyle(color: Colors.grey)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text(
                    'Leak Repair --1 hour',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 140),
                  Text('SR 120', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 170),
              child: Row(
                children: [
                  Text(
                    'SAR 120',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(width: 100),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                    ),

                    onPressed: () {
                      if (viewmodel.addres == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Pleas select addres')),
                        );
                      }
                      if (viewmodel.timeDate == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('pleas select Date&Time')),
                        );
                        return;
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Screen5Khidmah(),
                        ),
                      );
                      return;
                    },
                    child: Text(
                      'Confirm&Pay',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

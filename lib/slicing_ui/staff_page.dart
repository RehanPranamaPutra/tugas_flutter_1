import 'package:flutter/material.dart';

class StaffPage extends StatefulWidget {
  const StaffPage({super.key});

  @override
  State<StaffPage> createState() => _StaffPageState();
}

class _StaffPageState extends State<StaffPage> {
  List<Map<String, String>> staffList = [
    {"name": "Henry Itondo", "role": "Math Teacher", "gambar": "staf1.jpg"},
    {"name": "Courtney Henry", "role": "Supervisor", "gambar": "staf2.jpg"},
    {"name": "Darika Samak", "role": "Admin", "gambar": "staf3.jpg"},
    {"name": "Em Assinder", "role": "Class Teacher", "gambar": "staf5.jpg"},
    {"name": "Darika Samak", "role": "Admin", "gambar": "staf6.jpg"},
    {"name": "Em Assinder", "role": "Class Teacher", "gambar": "staf4.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Tambahkan fungsi search jika diperlukan
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Header Profile
          Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("gambar/Ellipse.png"),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lucas Wilson",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Thomas Jefferson High School",
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.sync, color: Colors.white),
                ),
              ],
            ),
          ),

          // Section Title
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Staff available for Lucas Wilson",
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
            ),
          ),
          SizedBox(height: 8),

          // Staff List
          Expanded(
            child: ListView.builder(
              itemCount: staffList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("gambar/${staffList[index]['gambar']}"),
                  ),
                  title: Text(
                    staffList[index]["name"]!,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    staffList[index]["role"]!,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  trailing: Icon(Icons.phone, color: Colors.blue),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

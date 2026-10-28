import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Container(
        color: const Color.fromARGB(255, 127, 139, 151),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // DIUBAH
            children: [
              Column(
                children: [
                  Container(
                    width: 400,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 241, 177),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.blue,
                          child: Icon(
                            Icons.person,
                            size: 60,
                            color: Colors.white,
                          ),
                        ),

                        Text(
                          "Muhammad Ahsan Fatahillah",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          "Siswa Rekayasa Perangkat Lunak",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 241, 177),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.email, color: Colors.blue),
                      title: Text("Email"),
                      subtitle: Text("Masfatt@gmail.com"),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 241, 177),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.school, color: Colors.blue),
                      title: Text("Sekolah"),
                      subtitle: Text("SMK Raden Umar Said"),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top:20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 241, 177),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.code, color: Colors.blue),
                      title: Text("Jurusan"),
                      subtitle: Text("PPLG"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

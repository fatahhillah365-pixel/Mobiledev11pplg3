import 'package:flutter/material.dart';

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
      title :Text("Kalkulator",
      style: TextStyle(fontSize: 20,)
        )),
      body: Column(
        children: [
   //angka 1
    Container(
      margin: EdgeInsets.only(
        top: 10,
        bottom: 15,
        left: 15,
        right: 15,),
      child: TextField(
        decoration: InputDecoration(
        hint: Text("Input Angka 1"))),
    ),
    Container(
      margin: EdgeInsets.all(15),
      child: TextField(
        decoration: InputDecoration(
        hint: Text("Input Angka 2"))),
    ),

    Row( 
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
              children: [ 
                ElevatedButton( 
                  onPressed: () { 
                    print("+ ditekan"); 
                  }, 
                  child: Text( 
                    "+", 
                  style: TextStyle(fontSize: 20, 
                  color: const Color.fromARGB(255, 1, 47, 255), 
                  fontWeight: FontWeight.bold), 
                  ) 
                ), 
                ElevatedButton( 
                  onPressed: () { 
                    print("- ditekan"); 
                  }, 
                  child: Text("-", 
                   style: TextStyle(fontSize: 20, 
                  color: const Color.fromARGB(255, 1, 47, 255), 
                  fontWeight: FontWeight.bold),), 
                ), 
                 ElevatedButton( 
                  onPressed: () { 
                    print("x ditekan"); 
                  }, 
                  child: Text("x", 
                   style: TextStyle(fontSize: 20, 
                  color: const Color.fromARGB(255, 1, 47, 255), 
                  fontWeight: FontWeight.bold),), 
                ), 
                 ElevatedButton( 
                  onPressed: () { 
                    print("/ ditekan"); 
                  }, 
                  child: Text("/", 
                   style: TextStyle(fontSize: 20, 
                  color: const Color.fromARGB(255, 1, 47, 255), 
                  fontWeight: FontWeight.bold),), 
                ), 
              ], 
            ), 
        Container(
          child: Text("Hasil",
          style: TextStyle(fontSize: 50,)
          
          ),
        ),
      ElevatedButton(
        onPressed: () {
          print("Reset ditekan");
        },
        child: Text("Reset",
         style: TextStyle(fontSize: 20,
        color: const Color.fromARGB(255, 255, 1, 1),
        fontWeight: FontWeight.bold,
        ),
      )
    )
        ]
      )
   );
  }
}
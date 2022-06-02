import 'package:flutter/material.dart';
void main(){
  runApp(const MaterialApp(
    home: Home() ,

  ));

}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.refresh),
          )
        ],

      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(Icons.person_outline, size: 120,color: Colors.green),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Peso (kg)',
                labelStyle: TextStyle(
                  color:Colors.green
                )
              ),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontSize: 25.0
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Altura (cm)',
                  labelStyle: TextStyle(
                      color:Colors.green
                  )
              ),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 25.0
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                height: 50.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green
                  ),
                    onPressed: (){},
                    child: Text('Calcular',
                      style: TextStyle(
                        fontSize: 25.0,
                        color:Colors.white
                      ),
                    )
                ),
              ),
            ),
            Text('Info',
              textAlign: TextAlign.center,
              style: TextStyle(
                color:Colors.green,
                fontSize: 25.0
              ),

            )

          ],
        ),
      ),
    );
  }
}

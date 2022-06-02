import 'package:flutter/material.dart';
void main(){
  runApp( MaterialApp(
    home: Home() ,

  ));

}
class Home extends StatefulWidget {
 Home({Key? key}) : super(key: key);


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String _infoText = "Informe seu dados!";
  void _resetFields(){
    weightController.text = "";
    heightController.text = "";
    setState((){
      _infoText = "Informe seus dados!";
    });

  }
  void _calculate(){
    setState((){
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);
      print(imc);
      if(imc < 18.6){
        _infoText = "Abaixo do Peso (${imc.toStringAsPrecision(4)})";
      }else if( imc >= 8.6 && imc <24.9){
        _infoText = "Peso Ideal (${imc.toStringAsPrecision(4)})";
      }else if(imc >= 29.9 && imc < 34.9){
        _infoText = "Obesidade Grau I (${imc.toStringAsPrecision(4)})";

      }else if(imc >= 34.9 && imc <39.9){
        _infoText = " Obesidade Grau II (${imc.toStringAsPrecision(4)})";

      }else if(imc >= 40){
        _infoText = "Obesidade Grau III (${imc.toStringAsPrecision(4)})";

      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: _resetFields,
              icon: Icon(Icons.refresh),
          )
        ],

      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Form(
          key: _formkey,
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
                controller: weightController,


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
                controller: heightController,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Container(
                  height: 50.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green
                    ),
                      onPressed: _calculate,
                      child: Text('Calcular',
                        style: TextStyle(
                          fontSize: 25.0,
                          color:Colors.white
                        ),
                      )
                  ),
                ),
              ),
              Text(_infoText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color:Colors.green,
                  fontSize: 25.0
                ),

              )

            ],
          ),
        ),
      ),
    );
  }
}

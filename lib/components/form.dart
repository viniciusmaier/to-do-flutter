
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class Tarefa {
  const Tarefa({required String ds_tarefa, required String name_tarefa});
}

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => FormStates();
}

class FormStates extends State<FormPage> {
  
  List<tarefa> _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Center(child : SizedBox(
      width: 500,
      height: 700,
      child : Form(
        child: Column(
           children : [
            inputsForm(),
            const SizedBox(height: 200),
            Expanded(child: ListView(
              children: [
              
       
              ],
            ))
            ]
        )
      )
    ))
  ,);
  }
}



inputsForm() {
  return Column(  
                children: [
                  TextFormField(decoration: const InputDecoration(labelText: 'TAREFA')),
                  TextFormField(decoration: const InputDecoration(labelText: 'DESCRIÇÃO')),
                  SizedBox(height: 20),
                  Row(
                    children:[
                     ElevatedButton(onPressed: () => { print('testando')}, child: Text('CADASTRAR')),
                     SizedBox(width: 10),
                     ElevatedButton(onPressed: () => { print('testando')}, child: Text('EDITAR')),
                     SizedBox(width: 10),
                     ElevatedButton(onPressed: () => { print('testando')}, child: Text('REMOVER')),
                    ]
                  )
                  ],
               );
}
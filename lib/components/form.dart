// ignore_for_file: non_constant_identifier_names, avoid_print
// ignore: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teste/util/modal/EdicaoTarefa.dart';

class Tarefa {
  final int id;
  String ds_tarefa;
  String name_tarefa;
  Tarefa(int this.id, String this.ds_tarefa, String this.name_tarefa);
}

List<Tarefa> list_tarefa = <Tarefa>[];

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => FormStates();
}

class FormStates extends State<FormPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController? ds_tarefa = TextEditingController();
  TextEditingController? name_tarefa = TextEditingController();
  TextEditingController? editDsTarefa = TextEditingController();
  TextEditingController? editNameTarefa = TextEditingController();

  void addElement(String ds_tarefa, String name_tarefa) {
    var count = list_tarefa.length;
    list_tarefa.add(Tarefa(count, ds_tarefa, name_tarefa));
    setState(() {});
  }

  void removeElement(index) {
    setState(() {
      list_tarefa.removeWhere((item) => item == list_tarefa[index]);
    });
  }

  void editElement(int index, String editName, String editDescricao) {
    setState(() {
      editDescricao.isNotEmpty
          ? list_tarefa[index].ds_tarefa = editDescricao
          : print(editDescricao);

      editName.isNotEmpty
          ? list_tarefa[index].name_tarefa = editName
          : print(editName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 1200,
          height: 700,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                        decoration: const InputDecoration(labelText: 'TAREFA'),
                        controller: name_tarefa,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "POR FAVOR ADICIONAR O TITULO DA TAREFA";
                          }
                          return null;
                        }),
                    TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'DESCRIÇÃO'),
                        controller: ds_tarefa,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "POR FAVOR ADICIONAR O DESCRICAO DA TAREFA";
                          }
                          return null;
                        }),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                addElement(ds_tarefa!.text, name_tarefa!.text);
                                ds_tarefa = TextEditingController();
                                name_tarefa = TextEditingController();
                              }
                            },
                            child: const Text('CADASTRAR')),
                        const SizedBox(width: 10),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 200),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: axisDirectionToAxis(AxisDirection.up),
                    itemCount: list_tarefa.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Center(child:  Container(
                            width: 1200,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(188, 240, 237, 253),),
                            child: Row(children: [
                              const Text('ID : '),
                              Text(list_tarefa[index].id.toString()),
                              const SizedBox(width: 40),
                              const Text('TITULO : '),
                              Text(list_tarefa[index].name_tarefa),
                              const SizedBox(width: 40),
                              const Text('DESCRICAO : '),
                              SizedBox(
                                  width: 150,
                                  child: Text(
                                    list_tarefa[index].ds_tarefa,
                                    overflow: TextOverflow.fade,
                                    maxLines: 5,
                                  )),
                              const SizedBox(width: 40),
                              IconButton(
                                  onPressed: () => removeElement(index),
                                  icon: const Icon(
                                      Icons.restore_from_trash_outlined)),
                              IconButton(
                                  onPressed: () async => await modalEdicao(
                                      index,
                                      editNameTarefa,
                                      editDsTarefa,
                                      list_tarefa,
                                      context,
                                      editElement),
                                  icon: const Icon(Icons.edit_sharp)),
                            ]))),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

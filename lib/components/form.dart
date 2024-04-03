// ignore_for_file: non_constant_identifier_names

import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Tarefa {
  final int id;
  String ds_tarefa;
  String name_tarefa;
  Tarefa(int this.id, String this.ds_tarefa, String this.name_tarefa);
}

// ignore: non_constant_identifier_names
List<Tarefa> list_tarefa = <Tarefa>[];

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => FormStates();
}

class FormStates extends State<FormPage> {
  // ignore: non_constant_identifier_names
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
          width: 700,
          height: 700,
          child: Form(
            child: Column(
              children: [
                Column(
                  children: [
                    TextFormField(
                        decoration: const InputDecoration(labelText: 'TAREFA'),
                        controller: name_tarefa),
                    TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'DESCRIÇÃO'),
                        controller: ds_tarefa),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              addElement(ds_tarefa!.text, name_tarefa!.text);
                              ds_tarefa = TextEditingController();
                              name_tarefa = TextEditingController();
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
                        title: Row(children: [
                          const Text('ID : '),
                          Text(list_tarefa[index].id.toString()),
                          const SizedBox(width: 40),
                          const Text('TITULO : '),
                          Text(list_tarefa[index].name_tarefa),
                          const SizedBox(width: 40),
                          const Text('DESCRICAO : '),
                          Text(list_tarefa[index].ds_tarefa),
                          const SizedBox(width: 40),
                          IconButton(
                              onPressed: () => removeElement(index),
                              icon: const Icon(
                                  Icons.restore_from_trash_outlined)),
                          IconButton(
                              onPressed: () async => {
                                    await showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        content: SizedBox(
                                          width: 600,
                                          height: 400,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Positioned(
                                                //height: 100,
                                                right: 1,
                                                child: TextButton(
                                                  onPressed: () =>
                                                      Navigator.of(context)
                                                          .pop(),
                                                  child: const Icon(
                                                      Icons.exit_to_app),
                                                ),
                                              ),
                                              Positioned(
                                                child: Form(
                                                  child: Column(
                                                    children: [
                                                      const Text('TITULO'),
                                                      Text(
                                                          'TITULO ANTIGO : ${list_tarefa[index].name_tarefa}'),
                                                      TextFormField(
                                                        controller:
                                                            editDsTarefa,
                                                      ),
                                                      const Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 0, 0, 50)),
                                                      const Text('DESCRICAO'),
                                                      Text(
                                                          'DESCRICAO ANTIGA: ${list_tarefa[index].ds_tarefa}'),
                                                      TextFormField(
                                                        controller:
                                                            editNameTarefa,
                                                      ),
                                                      const SizedBox(
                                                          height: 20),
                                                      Row(children: [
                                                        ElevatedButton(
                                                            onPressed: () => {
                                                                  editElement(
                                                                    index,
                                                                    editDsTarefa!
                                                                        .text,
                                                                    editNameTarefa!
                                                                        .text,
                                                                  ),
                                                                  Navigator.pop(
                                                                      context),
                                                                  editDsTarefa =
                                                                      '' as TextEditingController?,
                                                                  editNameTarefa =
                                                                      '' as TextEditingController?
                                                                },
                                                            child: const Text(
                                                                'EDITAR')),
                                                        const SizedBox(
                                                            width: 10),
                                                      ])
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  },
                              icon: const Icon(Icons.edit_sharp)),
                        ]),
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

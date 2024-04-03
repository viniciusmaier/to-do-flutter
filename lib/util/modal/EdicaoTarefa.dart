import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
modalEdicao(index, editNameTarefa, editDsTarefa, list_tarefa, context,
    editElement) async {
  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: SizedBox(
        width: 600,
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Positioned(
              //height: 100,
              right: 1,
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Icon(Icons.exit_to_app),
              ),
            ),
            Positioned(
              child: Form(
                child: Column(
                  children: [
                    const Text('TITULO'),
                    Text('TITULO ANTIGO : ${list_tarefa[index].name_tarefa}'),
                    TextFormField(
                      controller: editDsTarefa,
                    ),
                    const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 50)),
                    const Text('DESCRICAO'),
                    Text('DESCRICAO ANTIGA: ${list_tarefa[index].ds_tarefa}'),
                    TextFormField(
                      controller: editNameTarefa,
                    ),
                    const SizedBox(height: 20),
                    Row(children: [
                      ElevatedButton(
                          onPressed: () => {
                                editElement(
                                  index,
                                  editDsTarefa!.text,
                                  editNameTarefa!.text,
                                ),
                                Navigator.pop(context),
                                editDsTarefa = '' as TextEditingController?,
                                editNameTarefa = '' as TextEditingController?
                              },
                          child: const Text('EDITAR')),
                      const SizedBox(width: 10),
                    ])
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

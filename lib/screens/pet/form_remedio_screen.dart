import 'package:flutter/material.dart';
import 'package:petlife_app/models/pet_model.dart';
import 'package:petlife_app/models/remedio_model.dart';
import 'package:petlife_app/screens/remedio_screen.dart';
import 'package:petlife_app/services/remedio_service.dart';
import 'package:uuid/uuid.dart';

class FormRemedioScreen extends StatelessWidget {
  FormRemedioScreen({Key? key, required this.pet}) : super(key: key);

  PetModel pet;
  final _nomeRemedioController = TextEditingController();
  final _dataRemedioController = TextEditingController();
  final RemedioService service = RemedioService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cadastro de Remédios',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nomeRemedioController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  label: Text("Nome do remédio"),
                ),
              ),
              TextFormField(
                controller: _dataRemedioController,
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                  label: Text("Data do remédio"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Container(
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      RemedioModel novoRemedio = RemedioModel(
                        nome: _nomeRemedioController.text,
                        data: _dataRemedioController.text,
                        id: const Uuid().v4(),
                        pet: pet,
                      );
                      service.addRemedio(novoRemedio);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RemedioScreen(pet: pet)));
                    },
                    child: const Text(
                      'Salvar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}

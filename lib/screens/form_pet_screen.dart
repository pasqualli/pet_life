import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:petlife_app/models/pet_model.dart';
import 'package:petlife_app/screens/home_screen.dart';
import 'package:petlife_app/services/pet_service.dart';
import 'package:uuid/uuid.dart';

class FormPetScreen extends StatefulWidget {
  String? petId;
  FormPetScreen({Key? key, this.petId}) : super(key: key);

  @override
  _FormPetScreenState createState() => _FormPetScreenState();
}

class _FormPetScreenState extends State<FormPetScreen> {
  late PetModel pet;
  @override
  void initState() {
    super.initState();
    if (widget.petId != null) {
      pet = service.getPetPorId(widget.petId);
      tituloDaTela = 'Editar ${pet.nome.toString()}';
      _nomeController.text = pet.nome;
      _bioController.text = pet.bio;
      _idadeController.text = pet.idade.toString();
      _descricaoController.text = pet.descricao;
      cor = pet.cor;
      sexo = pet.sexo;
    }
  }

  var cor = 'Branco';
  var sexo = 'M';
  final _nomeController = TextEditingController();
  final _bioController = TextEditingController();
  final _idadeController = TextEditingController();
  final _descricaoController = TextEditingController();

  var tituloDaTela = 'Cadastro do Pet';
  PetService service = PetService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tituloDaTela),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _nomeController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    label: Text("Nome do pet"),
                  ),
                ),
                TextFormField(
                  controller: _bioController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    label: Text("Bio"),
                  ),
                ),
                TextFormField(
                  controller: _idadeController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text("Idade"),
                  ),
                ),
                DropdownButtonFormField(
                  items: _itemsSexo,
                  value: sexo,
                  onChanged: (String? sexoSelecionado) {
                    setState(
                      () {
                        sexo = sexoSelecionado!;
                      },
                    );
                  },
                ),
                TextFormField(
                  controller: _descricaoController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    label: Text("Descrição"),
                  ),
                ),
                DropdownButtonFormField(
                  disabledHint: const Text("Selecione uma cor"),
                  value: cor,
                  items: _items,
                  onChanged: (String? novaCor) {
                    setState(
                      () {
                        cor = novaCor!;
                      },
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (widget.petId == null) {
                          PetModel _novoPet = PetModel(
                            nome: _nomeController.text,
                            imagemUrl: 'assets/images/shih-tzu.jpg',
                            descricao: _descricaoController.text,
                            idade: int.parse(_idadeController.text),
                            sexo: sexo,
                            cor: cor,
                            bio: _bioController.text,
                            id: const Uuid().v4(),
                          );
                          service.addPet(_novoPet);
                        } else {
                          PetModel _editarPet = PetModel(
                              nome: _nomeController.text,
                              imagemUrl: pet.imagemUrl,
                              descricao: _descricaoController.text,
                              idade: int.parse(_idadeController.text),
                              sexo: sexo,
                              cor: cor,
                              bio: _bioController.text,
                              id: widget.petId.toString());
                          service.editPet(_editarPet);
                        }

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final List<DropdownMenuItem<String>> _items = [
    const DropdownMenuItem(child: Text("Branco"), value: "Branco"),
    const DropdownMenuItem(child: Text("Preto"), value: "Preto"),
    const DropdownMenuItem(child: Text("Marron"), value: "Marron"),
    const DropdownMenuItem(child: Text("Caramelo"), value: "Caramelo"),
  ];

  final List<DropdownMenuItem<String>> _itemsSexo = [
    const DropdownMenuItem(child: Text("M"), value: "M"),
    const DropdownMenuItem(child: Text("F"), value: "F"),
  ];
}

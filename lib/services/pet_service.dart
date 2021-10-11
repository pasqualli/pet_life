import 'package:petlife_app/models/pet_model.dart';
import 'package:uuid/uuid.dart';

class PetService {
  final List<PetModel> _pets = [];

  static final PetService _singleton = PetService._internal();

  factory PetService() {
    return _singleton;
  }

  void addPet(pet) {
    _pets.add(pet);
  }

  pets() => _pets;

  getPetPorId(id) {
    return _pets.singleWhere(
      (pet) => pet.id == id,
    );
  }

  PetService._internal() {
    _pets.add(
      PetModel(
          nome: 'Totó',
          imagemUrl: 'assets/images/pitbull-branco.png',
          descricao: 'Cão legal',
          idade: 2,
          sexo: 'M',
          cor: 'Preto',
          bio: 'Sou um totó bem esperto',
          id: '1'),
    );
    _pets.add(
      PetModel(
          nome: 'Bolinha',
          imagemUrl: 'assets/images/shih-tzu.jpg',
          descricao: 'Cão muito legal',
          idade: 2,
          sexo: 'F',
          cor: 'Branco',
          bio: 'Sou uma bolinha bem esperto',
          id: const Uuid().v4()),
    );
  }

  void editPet(PetModel editarPet) {
    PetModel pet = getPetPorId(editarPet.id);
    pet.nome = editarPet.nome;
    pet.imagemUrl = editarPet.imagemUrl;
    pet.descricao = editarPet.descricao;
    pet.idade = editarPet.idade;
    pet.sexo = editarPet.sexo;
    pet.cor = editarPet.cor;
    pet.bio = editarPet.bio;
  }
}

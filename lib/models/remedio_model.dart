import 'package:petlife_app/models/pet_model.dart';

class RemedioModel {
  final String nome;
  final String data;
  final String id;
  final PetModel pet;

  RemedioModel(
      {required this.nome,
      required this.data,
      required this.id,
      required this.pet});
}

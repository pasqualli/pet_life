import 'package:petlife_app/models/remedio_model.dart';
import 'package:petlife_app/services/pet_service.dart';
import 'package:uuid/uuid.dart';

class RemedioService {
  final List<RemedioModel> _remedios = [];
  final PetService _petService = PetService();

  static final RemedioService _singleton = RemedioService._internal();

  factory RemedioService() {
    return _singleton;
  }

  RemedioService._internal() {
    _remedios.add(
      RemedioModel(
          nome: 'Remédio Teste',
          data: '11/10/2021',
          id: const Uuid().v4(),
          pet: _petService.getPetPorId('1')),
    );
  }

  void addRemedio(remedio) {
    _remedios.add(remedio);
  }

  List<RemedioModel> remedios(String petId) {
    return _remedios.where((remedio) => remedio.pet.id == petId).toList();
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petlife_app/models/pet_model.dart';
import 'package:petlife_app/models/remedio_model.dart';
import 'package:petlife_app/screens/pet/form_remedio_screen.dart';
import 'package:petlife_app/services/remedio_service.dart';
import 'package:petlife_app/widgets/custom_navbar.dart';

class RemedioScreen extends StatelessWidget {
  final PetModel pet;
  List<RemedioModel> _remedios = List.empty(growable: true);

  RemedioScreen({Key? key, required this.pet}) : super(key: key) {
    _remedios = service.remedios(pet.id);
  }

  final RemedioService service = RemedioService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Hero(
                tag: pet.id,
                child: Container(
                  width: double.infinity,
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(pet.imagemUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 10),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Remédios',
                  style: GoogleFonts.montserrat(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _remedios.length,
              itemBuilder: (context, index) {
                return _criarCardDeRemedio(_remedios[index]);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FormRemedioScreen(pet: pet)));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomNavbar(
        pet: pet,
        pagina: 1,
      ),
    );
  }

  _criarCardDeRemedio(RemedioModel remedio) {
    return Card(
      elevation: 8.0,
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      child: Container(
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          leading: Container(
            padding: const EdgeInsets.only(right: 12),
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(
                  width: 1.0,
                  color: Colors.lightGreen,
                ),
              ),
            ),
            child: const Icon(
              Icons.healing,
              color: Colors.lightGreen,
            ),
          ),
          title: Text(
            remedio.nome,
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          subtitle: Text(
            remedio.data,
          ),
        ),
      ),
    );
  }
}

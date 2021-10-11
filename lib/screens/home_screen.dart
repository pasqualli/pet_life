import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petlife_app/models/pet_model.dart';
import 'package:petlife_app/screens/form_pet_screen.dart';
import 'package:petlife_app/screens/pet/perfil_pet_screen.dart';
import 'package:petlife_app/services/pet_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key) {
    pets = service.pets();
  }
  List<PetModel> pets = List.empty(growable: true);
  PetService service = PetService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: pets.length,
        itemBuilder: (context, index) {
          return _pedCard(pets[index], context);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormPetScreen(),
            ),
          );
        },
        label: const Text('Castrar'),
        icon: const Icon(Icons.pets),
      ),
    );
  }

  _pedCard(pet, context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PerfilPetScreen(pet: pet),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: pet.id,
              child: Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  image: DecorationImage(
                      image: AssetImage(pet.imagemUrl), fit: BoxFit.cover),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 40, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    pet.nome,
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 40, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    pet.bio,
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

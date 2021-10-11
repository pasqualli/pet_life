import 'package:flutter/material.dart';
import 'package:petlife_app/models/pet_model.dart';
import 'package:petlife_app/screens/pet/perfil_pet_screen.dart';
import 'package:petlife_app/screens/remedio_screen.dart';

class CustomNavbar extends StatefulWidget {
  CustomNavbar({Key? key, required this.pet, required this.pagina})
      : super(key: key);

  final PetModel pet;
  int pagina;

  @override
  _CustomNavbarState createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.green[50],
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // lado esquerdo
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      widget.pagina = 0;
                    });
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PerfilPetScreen(pet: widget.pet)));
                  },
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.pets,
                        color: widget.pagina == 0
                            ? Colors.lightGreen
                            : Colors.grey,
                      ),
                      Text(
                        'Perfil',
                        style: TextStyle(
                          color: widget.pagina == 0
                              ? Colors.lightGreen
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      widget.pagina = 1;
                    });
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                RemedioScreen(pet: widget.pet)));
                  },
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.healing,
                        color: widget.pagina == 1
                            ? Colors.lightGreen
                            : Colors.grey,
                      ),
                      Text(
                        'Remédio',
                        style: TextStyle(
                          color: widget.pagina == 1
                              ? Colors.lightGreen
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),

            // lado direito
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      widget.pagina = 2;
                    });
                  },
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.local_hospital,
                        color: widget.pagina == 2
                            ? Colors.lightGreen
                            : Colors.grey,
                      ),
                      Text(
                        'Consulta',
                        style: TextStyle(
                          color: widget.pagina == 2
                              ? Colors.lightGreen
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      widget.pagina = 3;
                    });
                  },
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.event_note,
                        color: widget.pagina == 3
                            ? Colors.lightGreen
                            : Colors.grey,
                      ),
                      Text(
                        'Anotações',
                        style: TextStyle(
                          color: widget.pagina == 3
                              ? Colors.lightGreen
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

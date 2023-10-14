import 'package:flutter/material.dart';
import 'create_petition_page_widget.dart';

class CreatePetitionPageContainer extends StatelessWidget {
  const CreatePetitionPageContainer({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Container(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 8),
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(187, 0, 0, 0),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)
                      ),
                    ),
                    child: const CreatePetitionPage(),
                  )
              ),
            ],
          )
        )
      ),
    );
  }
}
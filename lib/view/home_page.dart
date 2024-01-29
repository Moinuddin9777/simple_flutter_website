import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makeup_api_app/controller/dropdown_controller.dart';
import 'package:makeup_api_app/view/searchable_dropdown_button.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final DropdownController dropdownController = Get.put(DropdownController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(15, 15, 15, 1.0),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(253, 177, 216, 1.0),
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(25.0), // Add rounded corners to the app bar
        ),
        leading: const Icon(
          Icons.home,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        centerTitle: true,
        title: const Text(
          'Home Page',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          //image or design element
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: 400,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(253, 177, 216, 1.0),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'lib/assets/makeupImage.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          //Select your favourite brand text
          Padding(
            padding: const EdgeInsets.all(10),
            child: RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 35),
                children: [
                  TextSpan(
                    text: 'Select your ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  TextSpan(
                    text: 'Favorite Brand',
                    style: TextStyle(
                      color: Color.fromRGBO(218, 136, 182, 1.0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ' here !!',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Dropdown button
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SearchableDropdownButton(),
                  ),
                ),
                //search icon
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {
                      dropdownController.handleSearchIconClick();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(25),
                        color: const Color.fromRGBO(50, 50, 50, 1.0),
                        border: Border.all(
                          color: Color.fromARGB(255, 0, 0, 0),
                          width: 1.0,
                        ),
                      ),
                      child: const IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

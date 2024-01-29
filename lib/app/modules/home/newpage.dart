import 'package:brands/app/data/brands.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:get/get.dart';
import 'package:brands/app/modules/product/nextscreen.dart';


class newpage extends StatefulWidget{
  const newpage({super.key});
  

  @override
  State<newpage> createState() => _newpage();
}
 

 class _newpage extends State<newpage>{
 String? selectedValue;
 @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 14, 11, 6),
        title: Center(
          child:Text(
          'MAKE UP PRODUCTS',
          style:Theme.of(context).textTheme.titleLarge!.copyWith(
            color:const Color.fromARGB(255, 237, 233, 228),
            fontSize: 30,
          ) ,
        ),
      ),
      ),
      
     
      body:Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/brush.jpg'),
            fit: BoxFit.cover, // Adjust fit as needed
          ),
        ),
        child: Center( 
              child: Column(
              children: [
                const SizedBox(height: 40),
                Container(
                  width: 1000,
                  margin: const EdgeInsets.all(20),
                  color: Colors.white,
                  
                  child: DropdownSearch<String>(
                
                  items: brands,
                  popupProps: const PopupProps.menu(
                    showSearchBox: true,
                    title: Text("Select item",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                  ),
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                        labelText: "search Brand",
                        labelStyle:  TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                        hintText: "Select Brand",
                        hintStyle: TextStyle(fontSize:10,color: Colors.black),
                    ),
                  ),
                  onChanged: (value){
                    setState(() {
                      selectedValue = value;
                      print(selectedValue);
                    });
                  },
                  
                ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (selectedValue != null) {
                      Get.to(
                        () => nextscreen(brand: selectedValue!),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary:const Color.fromARGB(255, 22, 21, 20) ,
                  ),
                  child:const Text('search',style:TextStyle(color: Color.fromARGB(255, 227, 224, 224)),),
                  
                  )
              ],
            ),
            

            )
      )
    );
  }
 }


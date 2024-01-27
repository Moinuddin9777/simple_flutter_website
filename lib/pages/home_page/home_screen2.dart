import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:assignment/pages/home_page/controller.dart';
import 'package:assignment/pages/product_page/product_screen1.dart';

class BrandView extends StatefulWidget {
  const BrandView({super.key});
  @override
  State<BrandView> createState() => _BrandViewState();
}

class _BrandViewState extends State<BrandView> {
  String? selectedValue;
  final ctrl = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 1,
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Text(
                'Available Brands',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).hintColor,
                  fontSize: 23,
                ),
              ),
              items: ctrl.brandList
                  .map(
                    (item) => DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Theme.of(context).colorScheme.onBackground,
                              fontSize: 20,
                            ),
                      ),
                    ),
                  )
                  .toList(),
              value: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
              },
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 30,
                width: 250,
                elevation: 1,
              ),
              dropdownStyleData: const DropdownStyleData(
                maxHeight: 250,
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 50,
              ),
              dropdownSearchData: DropdownSearchData(
                searchController: ctrl.textEditingController,
                searchInnerWidgetHeight:
                    MediaQuery.of(context).size.height * 0.1,
                searchInnerWidget: Container(
                  height: 50,
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 4,
                    right: 8,
                    left: 8,
                  ),
                  child: TextFormField(
                    expands: true,
                    maxLines: null,
                    controller: ctrl.textEditingController,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      hintText: 'Search Here',
                      hintStyle: const TextStyle(fontSize: 18),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                searchMatchFn: (item, searchValue) {
                  return item.value.toString().contains(searchValue);
                },
              ),
              onMenuStateChange: (isOpen) {
                if (!isOpen) {
                  ctrl.textEditingController.clear();
                }
              },
            ),
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.search),
            onPressed: () {
              if (selectedValue != null) {
                Get.to(
                  () => Products(brand: selectedValue!),
                );
              }
            },
            label: const Text('Search'),
          ),
          Container(
            height: 200,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage('images/images.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Text(
              'MakeUp Products',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          )
        ],
      ),
    );
  }
}

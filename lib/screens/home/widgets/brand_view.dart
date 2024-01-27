import 'package:api_call/screens/home/controller/home_controller.dart';
import 'package:api_call/screens/product/products.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter_arc_text/flutter_arc_text.dart';

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
          DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              // barrierColor: Theme.of(context).colorScheme.onBackground,
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.arrow_drop_down_circle_outlined,
                ),
              ),
              isExpanded: true,
              hint: Text(
                'Select Brand',
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).hintColor,
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
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 60,
                width: 300,
                elevation: 1,
              ),
              dropdownStyleData: const DropdownStyleData(
                maxHeight: 300,
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 45,
              ),
              dropdownSearchData: DropdownSearchData(
                searchController: ctrl.textEditingController,
                searchInnerWidgetHeight: 50,
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
                      hintText: 'Search for an Brand...',
                      hintStyle: const TextStyle(fontSize: 18),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
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
          const SizedBox(
            height: 30,
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
          const SizedBox(
            height: 40,
          ),
          Container(
            height: 400,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage('assets/images/makeup.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              'Good makeup, Good mood',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          )
          // Center(
          //   child: ArcText(
          //     radius: 300,
          //     text: 'Everything you want..',
          //     textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
          //           color: Theme.of(context).colorScheme.primary,
          //           fontSize: 50,
          //         ),
          //     startAngle: 0,
          //     startAngleAlignment: StartAngleAlignment.center,
          //     placement: Placement.middle,
          //     direction: Direction.clockwise,
          //   ),
          // ),
        ],
      ),
    );
  }
}

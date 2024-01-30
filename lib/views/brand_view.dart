import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:getxapi/controllers/home_controller.dart';
import 'package:getxapi/Myapp/product.dart';

class BrandView extends StatelessWidget {
  BrandView({super.key});

  final control = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (ctrl) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                ),
              ),
              isExpanded: true,
              hint: Text(
                'Select Your Favorite Brand',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.black,
                    ),
              ),
              items: ctrl.brandList
                  .map(
                    (item) => DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Colors.black,
                            ),
                      ),
                    ),
                  )
                  .toList(),
              value: ctrl.selectedValue,
              onChanged: (value) {
                ctrl.updateSelected(value);
              },
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                height: 40.0,
                width: 200.0,
                elevation: 1,
              ),
              dropdownStyleData: const DropdownStyleData(
                maxHeight: 160.0,
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40.0,
              ),
              dropdownSearchData: DropdownSearchData(
                searchController: ctrl.textEditingController,
                searchInnerWidgetHeight: 30.0,
                searchInnerWidget: Container(
                  height: 40.0,
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    right: 10.0,
                    left: 10.0,
                  ),
                  child: TextFormField(
                    expands: true,
                    maxLines: null,
                    controller: ctrl.textEditingController,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 5.0,
                      ),
                      hintText: 'Search ',
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
            height: 10.0,
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.search),
            onPressed: () async {
              if (ctrl.selectedValue != null) {
                await Get.to(
                  () => Products(brand: ctrl.selectedValue!),
                );
              } else {
                Get.defaultDialog(
                  title: 'Error',
                  middleText: 'Select Your Favorite Brand',
                  backgroundColor: Colors.red,
                  titleStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.white,
                      ),
                  middleTextStyle:
                      Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: Colors.white,
                          ),
                );
              }
              ctrl.updateSelected(null);
            },
            label: const Text('Search'),
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}

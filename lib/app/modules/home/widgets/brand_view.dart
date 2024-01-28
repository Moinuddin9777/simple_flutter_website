import 'package:api_call/app/core/utils/extensions.dart';
import 'package:api_call/app/modules/home/controller/home_controller.dart';
import 'package:api_call/app/modules/product/view.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandView extends StatelessWidget {
  BrandView({super.key});
  final ctrl = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (ctrl) => Column(
        children: [
          DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.arrow_drop_down_circle_outlined,
                ),
              ),
              isExpanded: true,
              hint: Text(
                'Select Brand',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
                            ),
                      ),
                    ),
                  )
                  .toList(),
              value: ctrl.selectedValue,
              onChanged: (value) {
                ctrl.updateSelected(value);
              },
              buttonStyleData: ButtonStyleData(
                padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
                height: 14.0.wp,
                width: 80.0.wp,
                elevation: 1,
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 80.0.wp,
              ),
              menuItemStyleData: MenuItemStyleData(
                height: 11.0.wp,
              ),
              dropdownSearchData: DropdownSearchData(
                searchController: ctrl.textEditingController,
                searchInnerWidgetHeight: 10.0.wp,
                searchInnerWidget: Container(
                  height: 12.0.wp,
                  padding: EdgeInsets.only(
                    top: 3.0.wp,
                    right: 2.0.wp,
                    left: 2.0.wp,
                  ),
                  child: TextFormField(
                    expands: true,
                    maxLines: null,
                    controller: ctrl.textEditingController,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 2.0.wp,
                        vertical: 1.0.wp,
                      ),
                      hintText: 'Search for an Brand...',
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
          SizedBox(
            height: 3.0.wp,
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.search),
            onPressed: () async {
              if (ctrl.selectedValue != null) {
                await Get.to(
                  () => Products(brand: ctrl.selectedValue!),
                );
              } else {
                Get.snackbar('', '',
                    titleText: Text(
                      'Select Brand',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                    ),
                    messageText: Text(
                      'Brand can\'t be null',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.background,
                    borderWidth: 3,
                    borderColor:
                        Theme.of(context).colorScheme.secondaryContainer,
                    snackPosition: SnackPosition.BOTTOM,
                    icon: const Icon(Icons.error));
              }
              ctrl.updateSelected(null);
            },
            label: const Text('Search'),
          ),
          SizedBox(
            height: 10.0.wp,
          ),
        ],
      ),
    );
  }
}

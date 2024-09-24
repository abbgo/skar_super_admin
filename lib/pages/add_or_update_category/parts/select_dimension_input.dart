import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/models/dimension_group.dart';
import 'package:skar_super_admin/providers/local_storadge.dart';
import 'package:skar_super_admin/providers/pages/add_or_update_category.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_super_admin/services/api/dimension_group.dart';

class SelectDimensionInput extends ConsumerWidget {
  const SelectDimensionInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;
    String accessToken = ref.watch(accessTokenProvider);
    DimensionGroup dimensionGroup = ref.watch(dimensionGroupProvider);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: DropdownSearch<DimensionGroup>(
          // asyncItems: (text) async {
          //   ResultDimensionGroup resultDimensionGroup =
          //       await DimensionGroupApiService.fetchDimensionGroups(
          //           accessToken, 1);

          //   return resultDimensionGroup.dimensionGroups!;
          // },

          items: (filter, loadProps) async {
            ResultDimensionGroup resultDimensionGroup =
                await DimensionGroupApiService.fetchDimensionGroups(
                    accessToken, 1);

            return resultDimensionGroup.dimensionGroups!;
          },
          onChanged: (value) {
            if (value == null) {
              ref.read(dimensionGroupProvider.notifier).state =
                  DimensionGroup.defaultValue();
            } else {
              ref.read(dimensionGroupProvider.notifier).state =
                  DimensionGroup(id: value.id, name: '', dimensions: []);
            }
          },
          popupProps: PopupProps.menu(
            // itemBuilder: (context, item, isSelected) => Card(
            //   child: ListTile(
            //     title: Text(item.name),
            //     subtitle: Row(
            //       children: item.dimensions.map((e) => Text(' $e ,')).toList(),
            //     ),
            //   ),
            // ),
            itemBuilder: (context, item, isDisabled, isSelected) => Card(
              child: ListTile(
                title: Text(item.name),
                subtitle: Row(
                  children: item.dimensions.map((e) => Text(' $e ,')).toList(),
                ),
              ),
            ),
          ),
          dropdownBuilder: (context, selectedItem) => selectedItem == null
              ? Text('${lang.selectCategoryDimensionGroup} *')
              : ListTile(
                  title: Text(selectedItem.name),
                  subtitle: Row(
                    children: selectedItem.dimensions
                        .map((e) => Text(' $e ,'))
                        .toList(),
                  ),
                ),
          // clearButtonProps: const ClearButtonProps(isVisible: true),
          selectedItem: dimensionGroup.id == "" ? null : dimensionGroup,
        ),
      ),
    );
  }
}

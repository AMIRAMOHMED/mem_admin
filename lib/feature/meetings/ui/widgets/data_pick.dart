import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:mem_admain/core/theme/app_pallete.dart';
import 'package:mem_admain/core/theme/app_style.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class PickTime extends StatefulWidget {
  final Function(String) onPickedData;

  const PickTime({super.key, required this.onPickedData});

  @override
  State<PickTime> createState() => _PickTimeState();
}

class _PickTimeState extends State<PickTime> {
  String _selectedDate = '';
  String _selectedDateCubit = '';

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is DateTime) {
        _selectedDate = DateFormat('dd/MM/yyyy').format(args.value);
        _selectedDateCubit = args.value.toString();

        widget.onPickedData(_selectedDateCubit);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    _selectedDate.isEmpty
                        ? ' اختر يوم الاجتماع '
                        : "تم تحديد التاريخ: $_selectedDate",
                    style: AppStyles.font20Black(context),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            top: 80,
            right: 0,
            bottom: 0,
            child: SfDateRangePicker(
              monthCellStyle: DateRangePickerMonthCellStyle(
                todayTextStyle: AppStyles.font40Black(context),
                textStyle: AppStyles.font20Black(context),
              ),
              yearCellStyle: DateRangePickerYearCellStyle(
                todayTextStyle: AppStyles.font40Black(context),
                textStyle: AppStyles.font20Black(context),
              ),
              view: DateRangePickerView.month,
              headerHeight: 50,
              headerStyle: DateRangePickerHeaderStyle(
                textStyle: AppStyles.font20Black(context),
                backgroundColor: AppPallete.lightPastelBlue,
                textAlign: TextAlign.center,
              ),
              todayHighlightColor: AppPallete.transparentColor,
              selectionColor: AppPallete.pastelBlue,
              backgroundColor: AppPallete.lightPastelBlue,
              selectionTextStyle: AppStyles.font30Black(context),
              onSelectionChanged: _onSelectionChanged,
              selectionMode: DateRangePickerSelectionMode.single,
              initialSelectedDate: DateTime.now(),
            ),
          )
        ],
      ),
    );
  }
}

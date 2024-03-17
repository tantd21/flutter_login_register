import 'package:thi_don_s_application2/widgets/app_bar/appbar_title.dart';
import 'package:thi_don_s_application2/widgets/app_bar/custom_app_bar.dart';
import 'package:thi_don_s_application2/widgets/custom_checkbox_button.dart';
import 'package:flutter/material.dart';
import 'package:thi_don_s_application2/core/app_export.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:thi_don_s_application2/widgets/custom_floating_button.dart';
import 'package:intl/intl.dart';
// ignore for_file: must be_immutable
class HomeScreen extends StatelessWidget {
HomeScreen({Key? key})
: super(
key: key,
);
bool month = false;
List<DateTime?> selectedDatesFromCalendar1 = [];
@override
Widget build(BuildContext context) {
return SafeArea(
child: Scaffold(
appBar: _buildAppBar(context),
body: SizedBox (
width: SizeUtils.width,
child: SingleChildScrollView(
padding: EdgeInsets.only(top: 30.v),
child: Column (
children: [
Align(
alignment: Alignment.centerLeft,
child: Padding(
padding: EdgeInsets.only(left: 20.h),
child: Text(
"Next client",
style: theme.textTheme.bodyLarge,
),
),
),
SizedBox(height: 17.v),
_buildTwo(context),
SizedBox(height: 29.v),
_buildMonth(context),
SizedBox(height: 16.v),
_buildCalendar (context),
SizedBox(height: 22.v),
Align(
alignment: Alignment.centerRight,
child: Padding(
padding: EdgeInsets.only(right: 19.h),
child: Row(
mainAxisAlignment: MainAxisAlignment.end,
children: [
Container(
height: 8.adaptSize,
width: 8.adaptSize,
margin: EdgeInsets.only(
top: 1.v,
bottom: 2.v,
),
decoration: BoxDecoration(
color: appTheme.gray900,
borderRadius: BorderRadius.circular(
4.h,
),
),
),
Padding(
padding: EdgeInsets.only(left: 8.h),
child: Text(
"Current date",
style: CustomTextStyles.bodySmall10_1,
),
),
Container(
height: 8.adaptSize,
width: 8.adaptSize,
margin: EdgeInsets.only(
left: 16.h,
top: 1.v,
bottom: 2.v,
),
decoration: BoxDecoration(
color: appTheme.whiteA700,
borderRadius: BorderRadius.circular( 4.h,
),
border: Border.all(
color: appTheme.blueGray400,
width: 1.h,
),
),
),
Padding(
padding: EdgeInsets.only(left: 8.h),
child: Text(
"Next client",
style: CustomTextStyles.bodySmall10_1,
),
),
],
)
),
),
SizedBox(height: 21.v),
SizedBox(
height: 140.v,
width: double.maxFinite,
),
],
),
),
),
floatingActionButton: _buildFloatingActionButton(context),
),
);
}
/// Section Widget
PreferredSizeWidget _buildAppBar (BuildContext context) {
return CustomAppBar(
centerTitle: true,
title: AppbarTitle(
text: "Dashboard",
),
styleType: Style.bgoutline,
);
}
/// Section Widget
Widget _buildTwo(BuildContext context) {
  // Lấy ngày tháng hiện tại
  String currentDate = DateFormat.yMMMMd().format(DateTime.now());

  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20.h),
    padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 17.v),
    decoration: AppDecoration.outlineGray.copyWith(
      borderRadius: BorderRadiusStyle.roundedBorder5,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 11.h, right: 19.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgClock,
                    height: 18.adaptSize,
                    width: 18.adaptSize,
                  ),
                  SizedBox(height: 7.v),
                  Text(
                    "John D.",
                    style: CustomTextStyles.bodyMediumBluegray400,
                  ),
                ],
              ),
              Spacer(flex: 45),
              Column(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgThumbsUp,
                    height: 18.adaptSize,
                    width: 18.adaptSize,
                  ),
                  SizedBox(height: 9.v),
                  Text(
                    currentDate, // Sử dụng ngày tháng hiện tại thay vì "Mon, Aug"
                    style: CustomTextStyles.bodyMediumBluegray400,
                  ),
                ],
              ),
              Spacer(flex: 54),
              Column(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgClock,
                    height: 18.adaptSize,
                    width: 18.adaptSize,
                  ),
                  SizedBox(height: 7.v),
                  Text(
                    "1 PM",
                    style: CustomTextStyles.bodyMediumBluegray400,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 16.v),
        Divider(),
        SizedBox(height: 17.v),
        Padding(
          padding: EdgeInsets.only(right: 7.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Reschedule",
                style: theme.textTheme.bodyMedium,
              ),
              Padding(
                padding: EdgeInsets.only(left: 28.h),
                child: SizedBox(
                  height: 17.v,
                  child: VerticalDivider(
                    width: 1.h,
                    thickness: 1.v,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 27.h),
                child: Text(
                  "Add Service",
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 26.h),
                child: SizedBox(
                  height: 17.v,
                  child: VerticalDivider(
                    width: 1.h,
                    thickness: 1.v,
                  ),
                ),
              ),
              Spacer(),
              Text(
                "Add Note",
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
/// Section Widget
Widget _buildMonth(BuildContext context) {
return Padding(
padding: EdgeInsets.symmetric(horizontal: 20.h),
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Padding(
padding: EdgeInsets.symmetric(vertical: 1.v),
child: Text(
"Calendar",
style: theme.textTheme.bodyLarge,
),
),
CustomCheckboxButton(
width: 76.h,
text: "Month",
value: month,
padding: EdgeInsets.symmetric(vertical: 2.v),
isRightCheck: true,
onChange: (value) {
month = value;
},
),
],
),
);
}
/// Section Widgetf
Widget _buildCalendar (BuildContext context) {
return SizedBox(
height: 398.v,
width: 388.h,
child: CalendarDatePicker2(
config: CalendarDatePicker2Config(
calendarType: CalendarDatePicker2Type.range,
rangeBidirectional: true,
firstDate: DateTime(DateTime.now().year - 5),
lastDate: DateTime (DateTime.now().year + 5),
selectedDayHighlightColor: Color(0xFF00FF00), // Màu xanh lá cây
centerAlignModePicker: true,
firstDayOfWeek: 1,
controlsHeight: 18.91,
weekdayLabelTextStyle: TextStyle(
color: appTheme.blueGray400,
fontFamily: 'SF Pro Display',
fontWeight: FontWeight.w500,
),
selectedDayTextStyle: TextStyle(
color: Color (0XFF191A1A),
fontFamily: 'SF Pro Display',
fontWeight: FontWeight.w400,
),
controlsTextStyle: TextStyle(
color: appTheme.gray900,
fontFamily: 'SF Pro Display',
fontWeight: FontWeight.w400,
),
dayTextStyle: TextStyle(
color: appTheme.gray900,
fontFamily: 'SF Pro Display',
fontWeight: FontWeight.w400,
),
weekdayLabels: ["S", "M", "T", "W", "T", "F", "S"],
dayBorderRadius: BorderRadius.circular(
16.h,
),
),
value: selectedDatesFromCalendar1,
onValueChanged: (dates) {},
), 
);
}
/// Section Widget
Widget _buildFloatingActionButton(BuildContext context) {
return CustomFloatingButton(
height: 56,
width: 56,
backgroundColor: appTheme.gray900,
child: CustomImageView(
imagePath: ImageConstant.imgPlus,
height: 28.0.v,
width: 28.0.h,
),
);
}
}
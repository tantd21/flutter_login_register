import 'package:flutter/material.dart';
import '../core/app_export.dart';

class CustomCheckboxButton extends StatelessWidget {
  CustomCheckboxButton({
Key? key,
 this.decoration,
  this.alignment,
   this.isRightCheck,
    this.iconSize,
     this.value,
      this.text,
       this.width, 
       this.padding, 
       this.textstyle,
        this.textAlignment, 
        this.isExpandedText = false, required this.onChange, 

}): super( 
  key: key, 
  );

final BoxDecoration? decoration;

final Alignment? alignment;

final bool? isRightCheck;

final double? iconSize;

bool? value;

final Function (bool) onChange;

final String? text;
final double? width;
final EdgeInsetsGeometry? padding;
final TextStyle? textstyle;
final TextAlign? textAlignment;
final bool isExpandedText;

  get textAlign => null;
@override
Widget build(BuildContext context) {
return alignment != null
? Align(
alignment: alignment ?? Alignment.center,
child: buildCheckBoxWidget,
)
: buildCheckBoxWidget;
}
Widget get buildCheckBoxWidget => InkWell(
  onTap: () {
    if (value != null) {
      value = !(value!);
      onChange(value!);
    }
  },
  child: Container(
    decoration: decoration,
    width: width,
    child: (isRightCheck ?? false) ? rightSideCheckbox : leftSideCheckbox,
  ),
);

Widget get leftSideCheckbox => Row(
children: [
Padding(
child: checkboxwidget,
padding: EdgeInsets.only(right: 8),
),
isExpandedText ? Expanded (child: textwidget) : textwidget,
],
);
Widget get rightSideCheckbox => Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
isExpandedText ? Expanded (child: textwidget): textwidget,
Padding(
padding: EdgeInsets.only(left: 8),
child: checkboxwidget,
),
],
);
Widget get textwidget => Text(
text ?? "",
textAlign: textAlignment ?? TextAlign.center,
style: textstyle ?? CustomTextStyles.bodyMedium_3,
);
Widget get checkboxwidget => SizedBox(
height: iconSize,
width: iconSize,
child: Checkbox(
visualDensity: VisualDensity(
  vertical: -4,
horizontal: -4,
),
value: value ?? false,
onChanged: (value) {
onChange(value!);
},
),
);
}
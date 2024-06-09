part of '../../utils/import_paths/import_paths.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? helperText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved ;
  final Function(String)? onChanged ;
  final Function()? onTapSuffixIcon;
  final TextEditingController? controller ;
  final Widget? label ;
  final Color? fillColor;

  const   CustomTextFormField({super.key,
  this.hintText,this.helperText,this.prefixIcon,this.suffixIcon,
  this.obscureText=false,
  this.keyboardType,
  this.validator,
  this.onSaved,
  this.onChanged,
  this.onTapSuffixIcon,
  this.controller,
  this.label,
  this.fillColor,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller ,
      keyboardType:keyboardType ?? TextInputType.emailAddress,
      obscureText: obscureText,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      
      onSaved: onSaved,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        border: InputBorder.none,
        errorMaxLines: 2,
        hintText:hintText??'enter data',
        label: label,
        fillColor: fillColor?? Colors.transparent,
        filled: true,
        helperText: helperText??'',
        prefixIcon: Icon(prefixIcon),
        suffixIcon: InkWell(
          onTap:onTapSuffixIcon ,
          child: Icon(suffixIcon)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:const BorderSide(color: AppColors.bgBlue),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:const BorderSide(color: AppColors.bgBlue),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:const BorderSide(color: AppColors.bgRed),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:const BorderSide(color: AppColors.bgRed),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../common/values/colors.dart';

AppBar buildAppBar(String type) {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: const Color.fromARGB(255, 76, 146, 238),
        //dòng kẻ ngăn cách
        height: 1.0,
      ),
    ),
    title: Text(
      type,
      style: TextStyle(
        color: AppColors.primaryColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
    iconTheme: const IconThemeData(color: AppColors.primaryText),
    centerTitle: true,
  );
}

//Cần dùng cho bloc => Widget
Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(
      top: 20.h,
      bottom: 20.h,
      left: 20.w,
      right: 20.w,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _reusableIcon("google.png"),
        _reusableIcon("apple.png"),
        _reusableIcon("facebook.png"),
      ],
    ),
  );
}

Widget _reusableIcon(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: 40.w,
      height: 40.h,
      child: Image.asset("assets/icons/$iconName"),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(
      top: 10.h,
      bottom: 5.h,
    ),
    child: Text(
      text,
      style: TextStyle(
        color: AppColors.primaryColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

Widget buildTextField(String hintText, String textType, String iconName,
    void Function(String value)? function) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 15.h),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.2),
      borderRadius: BorderRadius.circular(15.w),
      border: Border.all(color: AppColors.primaryFourElementText),
    ),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 16.w),
          width: 16.w,
          height: 16.w,
          child: Image.asset("assets/icons/$iconName"),
        ),
        SizedBox(
          width: 270.w,
          height: 50.h,
          child: TextField(
            //pass data to taxtfield
            onChanged: (value) => function!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: hintText,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              hintStyle: TextStyle(
                color: AppColors.primarySecondaryElementText,
              ),
            ),
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
            autocorrect: false,
            obscureText: textType == "password" ? true : false,
          ),
        )
      ],
    ),
  );
}

class PasswordTextField extends StatefulWidget {
  final String hintText;
  final void Function(String value)? onChanged;

  const PasswordTextField({
    Key? key,
    required this.hintText,
    this.onChanged,
  }) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15.w),
        border: Border.all(color: AppColors.primaryFourElementText),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 16.w),
            width: 16.w,
            height: 16.w,
            child: Image.asset("assets/icons/lock.png"),
          ),
          SizedBox(
            width: 270.w,
            height: 50.h,
            child: TextFormField(
              onChanged: widget.onChanged,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: widget.hintText,
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                hintStyle: TextStyle(
                  color: AppColors.primarySecondaryElementText,
                ),
              ),
              style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
              ),
              autocorrect: false,
              obscureText: !isPasswordVisible,
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildTextFieldValidate(String hintText,
    String textType,
    String iconName,
    void Function(String value)? function,
    String? Function(String? value)? validator, // Add validator parameter
    ) {
  if (textType == "password") {
    return PasswordTextField(
      hintText: hintText,
      onChanged: function,
    );
  }
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 15.h),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.2),
      borderRadius: BorderRadius.circular(15.w),
      border: Border.all(color: AppColors.primaryFourElementText),
    ),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 16.w),
          width: 16.w,
          height: 16.w,
          child: Image.asset("assets/icons/$iconName"),
        ),
        SizedBox(
          width: 270.w,
          height: 50.h,
          child: TextFormField(
            onChanged: (value) => function!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: hintText,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              hintStyle: TextStyle(
                color: AppColors.primarySecondaryElementText,
              ),
            ),
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
            autocorrect: false,
            obscureText: textType == "password" ? true : false,
            validator: validator != null ? (value) => validator(value) : null,
          ),
        )
      ],
    ),
  );
}

//dòng chữ Forgot Password và Privacy Policy
Widget onTapTextLink(String text) {
  return Center(
    child: Container(
      width: 260.w,
      height: 44.h,
      child: GestureDetector(
        onTap: () {},
        child: Text(
          text,
          style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
              decorationColor: Colors.blue,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}

Widget buildLoginandRegisterButton(String buttonName, String buttonType,
    void Function()? function) {
  return GestureDetector(
    onTap: function,
    child: Container(
      margin: EdgeInsets.only(
          left: 25.w,
          right: 25.w,
          bottom: 10.h,
          top: buttonType == "login" ? 10.h : 10.h),
      width: 325.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: buttonType == "login"
            ? AppColors.primaryElement
            : AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(15.w),
        //bordercolor of button
        border: Border.all(
          color: buttonType == "login"
              ? Colors.transparent
              : AppColors.primaryFourElementText,
        ),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
            color: Colors.grey.withOpacity(0.1),
          )
        ],
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color: buttonType == "login"
                ? AppColors.primaryBackground
                : AppColors.primaryText,
          ),
        ),
      ),
    ),
  );
}

Widget divider() {
  return Container(
      margin: EdgeInsets.only(left: 25.w, right: 25.w),
      child: const Divider(
        color: AppColors.darkColor,
      ));
}

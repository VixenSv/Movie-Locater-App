import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class AuthButton extends StatefulWidget {
  final String text;
  final buttoncolor;
  final VoidCallback onTap;

  const AuthButton({
    Key? key,
    required this.buttoncolor,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  _AuthButtonState createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 5,
              primary: widget.buttoncolor,
              minimumSize: const Size.fromHeight(60),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              splashFactory: InkSplash.splashFactory,
            ),
            onPressed: widget.onTap,
            child: Text(
              widget.text,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )));
  }
}

class SocialButton extends StatefulWidget {
  final String text;
  final String url;
  final VoidCallback onTap;

  const SocialButton({
    Key? key,
    required this.text,
    required this.url,
    required this.onTap,
  }) : super(key: key);

  @override
  _SocialButtonState createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 40, left: 40, bottom: 20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 2,
            primary: const Color(0xffffffff),
            minimumSize: const Size.fromHeight(60),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            splashFactory: InkSplash.splashFactory,
          ),
          onPressed: widget.onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                widget.url,
                width: 40,
                height: 40,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.text,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white54,
                ),
              ),
            ],
          ),
        ));
  }
}

class IconButtonWidget extends StatefulWidget {
  final String text;
  final IconData icon;
  final ontap;
  const IconButtonWidget(
      {Key? key, required this.ontap, required this.text, required this.icon})
      : super(key: key);

  @override
  _IconButtonWidgetState createState() => _IconButtonWidgetState();
}

class _IconButtonWidgetState extends State<IconButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 8,
          primary: AppColors.yellowColorDark,
          minimumSize: const Size.fromHeight(60),
          splashFactory: InkSplash.splashFactory,
          shadowColor: Colors.white,
        ),
        onPressed: widget.ontap,
        icon: Icon(
          widget.icon,
          size: 30,
          color: Colors.white,
        ),
        label: Text(
          widget.text,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}

part of 'utils.dart';

TextStyle blackFont = GoogleFonts.poppins(
    color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600);

ArsProgressDialog progressDialog(BuildContext context) =>
    ArsProgressDialog(context,
        blur: 2,
        backgroundColor: Colors.black54,
        animationDuration: Duration(milliseconds: 500));

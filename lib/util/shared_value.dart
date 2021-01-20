part of 'utils.dart';

String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Pagi';
  }
  if (hour < 15) {
    return 'Siang';
  }
  if (hour < 17) {
    return 'Sore';
  }
  return 'Malam';
}

Widget greetingLottie() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return VxBox(
            child: Lottie.asset('assets/animations/loading.json',
                width: 100, height: 100))
        .make();
  }
  if (hour < 15) {
    return VxBox(
            child: Lottie.asset('assets/animations/loading.json',
                width: 100, height: 100))
        .make();
  }
  if (hour < 17) {
    return VxBox(
            child: Lottie.asset('assets/animations/loading.json',
                width: 100, height: 100))
        .make();
  }
  return VxBox(
          child: Lottie.asset('assets/animations/loading.json',
              width: 100, height: 100))
      .make();
}

final imagePicker = ImagePicker();
File imageFile;

Future<File> getImage() async {
  final pickedFile =
      await imagePicker.getImage(source: ImageSource.gallery, imageQuality: 20);

  imageFile = File(pickedFile.path);
  return imageFile;
}

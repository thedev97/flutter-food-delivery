part of values;

class ButtonStyles {
  static final ButtonStyle primaryDecoration = ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
            side: const BorderSide(color: Color(0XFF05014A)))),
    backgroundColor: MaterialStateProperty.all(const Color(0XFF05014A)),
  );

  static final ButtonStyle decoration1 = ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: const BorderSide(color: Colors.redAccent))),
    backgroundColor: MaterialStateProperty.all(Colors.redAccent),
  );

  static final ButtonStyle decoration2 = ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side:  BorderSide(color: Colors.yellowAccent.shade400))),
    backgroundColor: MaterialStateProperty.all(Colors.yellowAccent.shade400),
  );
}

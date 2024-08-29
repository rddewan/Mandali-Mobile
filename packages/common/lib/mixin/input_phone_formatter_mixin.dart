part of common;

mixin InputPhoneFormatter {
  var maskPhoneFormatter = MaskTextInputFormatter(
    mask: '###-###-####', //016-196-0210
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
}

class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([
    this._message,
    this._prefix,
  ]);

  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataExceptions extends AppExceptions {
  FetchDataExceptions([String? message])
      : super(message, ' Error During Communications');
}

class BadRequestExertions extends AppExceptions {
  BadRequestExertions([String? message]) : super(message, 'Invalid request');
}

class UnAuthorizedExceptions extends AppExceptions {
  UnAuthorizedExceptions([String? message])
      : super(message, 'Unauthorized request');
}

class InvalidInputExceptions extends AppExceptions {
  InvalidInputExceptions([String? message]) : super(message, 'Invalid Input');
}


class UnSupportedMediaType extends AppExceptions {
  UnSupportedMediaType([String? message])
      : super(message, 'Unsupported Media-type');
}

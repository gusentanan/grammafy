class ApiResponseException implements Exception {
  final dynamic data;
  final String message;

  ApiResponseException(this.message, this.data);
  @override
  String toString() => "$message ${data['errorMsg']}";
}

class PreConditionedException extends ApiResponseException {
  PreConditionedException(dynamic data) : super("Error: ", data);
  @override
  String toString() => data['errorMsg'];
}

class DefaultException implements Exception {
  final String? _message;

  DefaultException(this._message);
  @override
  String toString() => _message ?? "No internet connection";
}

class NoInternetException extends DefaultException {
  NoInternetException() : super('No internet connection');
}

class UnknownException extends DefaultException {
  UnknownException(e)
      : super(e != null
            ? e.toString()
            : 'Unknown error, please report this to us');
}

class TimeoutException extends DefaultException {
  TimeoutException()
      : super('Problem with connection timeout, please try again');
}

class ApiResponseNotValidException extends DefaultException {
  ApiResponseNotValidException()
      : super('Server error, please report this to us');
}

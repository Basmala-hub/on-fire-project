// ignore_for_file: public_member_api_docs, sort_constructors_first
sealed class ResultFireBase<T> {}

class Sucess<T> extends ResultFireBase<T> {
  final T data;

  Sucess({required this.data});
}

class Error<T> extends ResultFireBase<T> {
  String message;
  Error({required this.message});
}

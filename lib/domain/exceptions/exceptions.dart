class NoInternetException implements Exception{
  String? message;
  NoInternetException({this.message = 'Ni Internet Connection'});
}
class ServerError implements Exception{
  String? message;
  String? statusMsg;
  ServerError({
    this.message = 'Ni Internet Connection',
    this.statusMsg = 'Fail'
});
}
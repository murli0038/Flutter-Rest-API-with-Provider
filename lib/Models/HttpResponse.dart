class HTTPResponse<T>
{
  bool isSuccessful;
  T data;
  String message;
  int responseCode;

  HTTPResponse(this.data,this.isSuccessful,{this.responseCode,this.message}); // message and responseCode are optional
}
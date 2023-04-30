class Success{
  int code;
  Object response;
  Success({required this.code , required this.response});
}

class Failure{
  int code;
  Object errorresponse;
  Failure({required this.code , required this.errorresponse});
}
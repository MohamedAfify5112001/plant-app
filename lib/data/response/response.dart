class ResponseData {
  String type;
  String message;
  ResponseData(this.type, this.message);

  factory ResponseData.formJson(Map<String, dynamic> json) =>
      ResponseData(json["type"], json["message"]);
}
class ErrorResponse{
  String msg;

  ErrorResponse(this.msg);
}

///默认成功相应
//#ignore:lowerCamelCase
const  RESULT_SUCCESS_CODE = 0;

class DataResult<T> {
  ///响应代码 RESULT_SUCCESS_CODE=成功=success
  int code;

  ///相应信息
  String msg;

  ///数据
  T? data;

  DataResult({
    required this.code,
    required this.msg,
    this.data,
  });

  DataResult.success(this.data)
      : msg = "Ok",
        code = RESULT_SUCCESS_CODE;

  DataResult.error({String? msg, int errorCode = -1})
      : msg = msg ?? "Error",
        code = errorCode;

  ///你如果知道数据真的不为null
  T get requiredData => data!;

  ///是否成功
  bool get isSuccess => code == 0;

  ///是否成功状态枚举
  ResultStatus get resultStatus =>
      isSuccess ? ResultStatus.success : ResultStatus.error;

  DataResult<T> copyWith({
    int? code,
    String? msg,
    T? data,
    T? Function(T? data)? callData,
  }) {
    assert(data == null || callData == null, "data 和 callData不能同传值");
    return DataResult(
      code: code ?? this.code,
      msg: msg ?? this.msg,
      data: data ?? callData?.call(this.data) ?? this.data,
    );
  }
}

enum ResultStatus {
  success,
  error,
}

class FoodResult<T> {
  String msg;

  FoodResultStatus resultStatus;

  T? data;

  FoodResult.success(this.data)
      : resultStatus = FoodResultStatus.success,
        msg = "Ok";

  FoodResult.error({String? msg})
      : resultStatus = FoodResultStatus.error,
        this.msg = msg ?? "Error";
}

enum FoodResultStatus {
  success,
  error,
}

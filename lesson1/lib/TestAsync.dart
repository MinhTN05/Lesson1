Future<void> main() async {
  print("Lấy dữ liệu...");

  var kp = await taoOrder();
  print(kp);
}

taoOrder() async {
  var noidungOrder = await laythongtinOrderServer();

  return noidungOrder;
}

Future<String> laythongtinOrderServer() {
  Future<String> sNoidungOrder =
      Future.delayed(Duration(seconds: 3), () => "01 nuoc cam");
  return sNoidungOrder;
}

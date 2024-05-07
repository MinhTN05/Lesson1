import 'Bicyle.dart';

void main() {
  const number = 1;

  var mess = 'Hello Coder $number ${doSomeThings()}';

  print(mess);

  var list = [1, 2, 3];
  List<int> list2 = [1, 2, 3];
  list.add(4);
  list2[0] = 0;

  List<String> list3 = [];
  list3.add('value1');
  list3.add('value2');
  list3.add('value3');
  list3.removeAt(1);

  print("Giá trị list1: $list");
  print("Giá trị list2: $list2");
  print("Giá trị list3: $list3");

  // này là kiểu dữ liệu sets(là danh sách đặc biệt) add nào đã có thì nó không thêm vào nữa
  var list4 = {'value1', 'value2', 'value3', 'value4'};
  // còn khai báo chuẩn đầy đử thì như sau:
  // Set<String> list4 = {'value1', 'value2', 'value3', 'value4'};
  list4.add('value5');

  print("Giá trị list4: $list4");

  var bike = Bicyle(1, 2);

  bike.cadence = 10;
  // bike._speed = 15;

  bike.speedUp(10);

  print(bike);

}

String doSomeThings() {
  return "Giá trị của hàm";
}

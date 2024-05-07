void main () {
  int? a;
  a = null;

  String? mess = null;
  mess = 'value2';

  print('a is $a \nmess is $mess');

  var score = getScore('101', null);
  
  print('Điểm số là: $score');

  List<String> aListOfStrings = ['one', 'two', 'three'];
  List<String>? aNullableListOfStrings;
  List<String?> aListOfNullableStrings = ['one', null, 'three'];

  print('aListOfNullableStrings is $aListOfNullableStrings');
  print('aListOfNullableStrings is $aNullableListOfStrings');
  print('aListOfNullableStrings is $aListOfNullableStrings');
  
  print('Độ dài String null là: ${getLength(null)}');
  print('Độ dài String MinhTN là: ${getLength('MinhTN')}');

  String? text;

  print(text ?? 'text bị null');
  print(text?.length ?? 0);

}

int getLength(String? str) {
  // hãy thử ném một ngoại lệ vào đây nếu 'str' là null

  // Cách thứ 1
  if (str == null) {
    return 0;
  }
  else
    return str.length;

  // Cách thứ 2
  // return str?.length ?? 0;
}

int getScore (String userId, int? lastScore) {

  // Cách thứ nhất
  if (lastScore!=null)
    return lastScore;
  else
    return 0;

  // Cách thứ hai
  // return lastScore!;

}
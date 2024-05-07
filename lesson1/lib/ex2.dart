int _computeValue() {
  print('In _computeValue...');
  return 3;
}

class CachedValueProvider {
  late final _cache = _computeValue();

  int number = 100;
  String version = '1.0.0';
  
  int get value => _cache;
}

void main () {
  print('Calling constructor...');
  var provider = CachedValueProvider();
  
  print(provider.number);
  print(provider.version);
  
  print('Getting value...');
  print('The value is ${provider.value}!');
}
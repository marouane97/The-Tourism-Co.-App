import 'package:hello_world/models/mocks/mock_location.dart';
import 'package:test_api/test_api.dart';

void main() {
  test('test fetchAny', (){
    final mockLocation = MockLocation.fetchAny();
    expect(mockLocation, isNotNull);
    expect(mockLocation.name, isNotEmpty);
  });

  test('test fetchAll', (){
    final mockLocation = MockLocation.fetchAll();
    expect(mockLocation.length, greaterThan(0));
    expect(mockLocation[0].name, isNotEmpty);
  });
  test('test fetch', (){
    final mockLocation = MockLocation.fetch(0);
    expect(mockLocation, isNotNull);
    expect(mockLocation.name, isNotEmpty);
  });
  
}
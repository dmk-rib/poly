import 'package:poly/poly.dart';

main() {
  int correct_count = 0;
  // Because of Error that List<dynamic> isn't subtype of List<int> :
  // Either use List<num> or cast it to List<num> while passing to respective function
  List<num> c1 = [1, 2];
  List<List<num>> c2 = [
    [1, 2],
    [3, 4],
    [5, 6]
  ];
  List<List<num>> c3 = []
    ..addAll(c2)
    ..addAll([
      [7, 8]
    ]);
// Or use -
//  List<List<num>> c3 = [
//    c2,
//    [
//      [7, 8]
//    ]
//  ].expand((x) => x).toList();

//Example of `toPoint()`
//* `toPoint()` converts `List<num>` to `Point<num>`
  Point pointFromC1 = toPoint(c1);
  print(
      "${++correct_count}. toPoint(c1 = [1,2])= ${pointFromC1} with type:${pointFromC1.runtimeType}");

//Example of `toListOfPoint()`
//* `toListOfPoint()` converts `List<List<num>>` to `List<Point<num>>`
  List<Point> pointsFromC2 = toListOfPoint(c2);
  print(
      "${++correct_count}. toListOfPoint(c2 = [ [1,2], [3,4], [5,6] ])= ${pointsFromC2} with type:${pointsFromC2.runtimeType}");

//Example of `toPolyFromListOfList()`
//* `toPolyFromListOfList()` converts `List<List<num>>` to `Polygon`
//* Print status of List of List if they are inside our Polygon using `getList_IsListOfListInside`
//* Print if All points in List of List inside Polygon using
  Polygon polygonC2 = toPolyFromListOfList(c2);
  print(
      "${++correct_count}. Is C3= [ C2, [7,8] ] inside Polygon C2 = ${polygonC2.getList_IsListOfListInside(c3)}");
  print(
      "${++correct_count}. Are All Points in C3= [ C2, [7,8] ] present inside C2 = ${polygonC2.areAllPointsInsidePolygon_List(c3)}");
}


import 'package:tuple/tuple.dart';

class Shoe_Stock{
  final int id;
  final List<Tuple2<int,int>> size_stock;

  Shoe_Stock({
    this.id = 0,
    this.size_stock = const [
      Tuple2(0, 0)
    ]
    
  });
}
    
List<Shoe_Stock> stocks = [
  Shoe_Stock(
    id: 1,
    size_stock: [
      Tuple2(37, 0),
      Tuple2(38, 0),
      Tuple2(39, 3),
      Tuple2(40, 3),
      Tuple2(41, 3),
      Tuple2(42, 3),
      Tuple2(43, 3),
      Tuple2(44, 3),
      Tuple2(45, 3),
      Tuple2(46, 3),
      Tuple2(47, 3),
    ]
  ),
  Shoe_Stock(
    id: 2,
    size_stock: [
      Tuple2(37, 0),
      Tuple2(38, 0),
      Tuple2(39, 3),
      Tuple2(40, 3),
      Tuple2(41, 3),
      Tuple2(42, 3),
      Tuple2(43, 3),
      Tuple2(44, 3),
      Tuple2(45, 3),
      Tuple2(46, 3),
      Tuple2(47, 3),
    ]
  )
];

void prt(){
  print(stocks[1].size_stock[0].item1);
}
  

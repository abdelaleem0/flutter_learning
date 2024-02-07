abstract class SortManger{
  List<int> sortIntegers(List<int> list);
}
class ClassicSort implements SortManger{
  @override
  List<int> sortIntegers(List<int> list) {
    var n = list.length;
    var sortedList = List<int>.from(list); // Create a copy to sort
    bool didSwap;
    do {
      didSwap = false;
      for (var i = 1; i < n; i++) {
        if (sortedList[i - 1] > sortedList[i]) {
          var temp = sortedList[i - 1];
          sortedList[i - 1] = sortedList[i];
          sortedList[i] = temp;
          didSwap = true;
        }
      }
      n--;
    } while (didSwap);
    return sortedList;

  }

}
class SortUseCase {
  final SortManger manger;
  SortUseCase({required this.manger});
  List<int> sortIntegers(List<int> list){
    return manger.sortIntegers(list);
  }


}
main(){
  final uscCase=SortUseCase(manger:ClassicSort());
 final list= uscCase.sortIntegers([2,3,1,7,6,10,9]);
  print('list=${list}');
}
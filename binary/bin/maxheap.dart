
class MaxHeap {
  List<int> array = [];
  MaxHeap() {
    array = [];
  }
  MaxHeap.array(this.array) {
    buildHeap();
  }
  buildHeap(){
    int lastParent = parent(array.length-1);
    for(int i=lastParent;i>=0;i--){
      shiftDown(i);
    }
  }

  shiftDown(int current){
    int endIdx=array.length-1;
    int leftIdx = leftChild(current);
    while(leftIdx <= endIdx){
      int rightIdx = rightChild(current);
      int idxToShift;
      if(rightIdx <= endIdx && array[rightIdx] > array[leftIdx]){
        idxToShift = rightIdx;
      }
      else{
        idxToShift = leftIdx;
      }
      if(array[current] < array[idxToShift]){
        swap(current, idxToShift);
        current=idxToShift;
        leftIdx=leftChild(current);
      }
      else{
        break;
      }
    }
  }

  shiftUp(int current){
    int parentIdx= parent(current);
    while(current > 0 ){
      if(array[current] > array[parentIdx]){
        swap(current, parentIdx);
        current=parentIdx;
        parentIdx=parent(current);
      }
      else{
        break;
      }
    }
  }

  add(int data){
    array.add(data);
    print(array[array.length-1]);
    shiftUp(array.length-1);
  }

  remove(){
    array[0]=array[array.length-1];
    array.removeAt(array.length-1);
    shiftDown(0); 
  }


 swap(int i,int j){
  int temp = array[i];
  array[i] = array[j];
  array[j] = temp;
 }

 display(){
  print(array);
 }


  parent(int i){
    return (i-1)~/2;
  }
  leftChild(int i){
    return i*2+1;
  }
  rightChild(int i){
    return i*2+2;
  }
}

void main(List<String> args) {
  List<int> array = [4,7,55,2,8,12,54];
  MaxHeap obj = MaxHeap.array(array);
  obj.add(30);
  obj.remove();

obj.display();
}
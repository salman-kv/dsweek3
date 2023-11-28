
import 'dart:ffi';

class MinHeap{

List<int> array=[];

MinHeap(){
  array=[];
}

MinHeap.array(this.array){
buildHeap();
}

buildHeap(){
  
  for(int i=parent(array.length-1);i>=0;i--){
    shiftDown(i);
  }

}

shiftDown(int current){
  int endIdx = array.length-1;
  int leftIdx = leftChild(current);
  while(leftIdx <= endIdx){
    int rightIdx = rightChild(current);
    int idxToShift;
    if(rightIdx <= endIdx && array[leftIdx] > array[rightIdx]){
      idxToShift=rightIdx;
    }
    else{
      idxToShift=leftIdx;
    }
    if(array[current] > array[idxToShift]){
      swap(idxToShift, current);
      current=idxToShift;
      leftIdx=leftChild(current);
    }
    else{
      break;
    }
  }
}

display(){
  for(int i=0;i<array.length;i++){
    print(array[i]);
  }
}

swap(int i, int j){
  int temp=array[i];
  array[i]=array[j];
  array[j]=temp;
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
  List<int> array=[4,7,55,2,8,12,54];
  MinHeap obj = MinHeap.array(array);
  obj.display();
}
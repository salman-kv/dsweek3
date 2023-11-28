class MinHeap{

  List<int> array =[];

MinHeap(){
array=[];
}

MinHeap.array(this.array){
  buildHeap();
}

buildHeap(){
  int parentIdx=parent(array.length-1);
  for(int i=parentIdx;i>=0;i--){
    shiftDown(i);
  }
}

shiftDown(int parentIdx){
  int endIdx=array.length-1;
  int leftIdx = leftChild(parentIdx);
  while(leftIdx <= endIdx){
    int rightIdx = rightChild(parentIdx);
    int idxToShift;
    if(rightIdx <= endIdx && array[rightIdx] < array[leftIdx]){
      idxToShift=rightIdx;
    }
    else{
      idxToShift=leftIdx;
    }
    if(array[parentIdx] > array[idxToShift]){
      swap( parentIdx, idxToShift);
      parentIdx=idxToShift;
      leftIdx=leftChild(parentIdx);
    }
    else{
      break;
    }
  }

}

shiftUp(int currentIdx){
  int parentIdx = parent(currentIdx);
  while(currentIdx > 0  && array[parentIdx] > array[currentIdx]){
    swap(currentIdx, parentIdx);
    currentIdx=parentIdx;
    parentIdx=parent(currentIdx);
  }
    
}

add(int data){
  array.add(data);
  shiftUp(array.length-1);
}

remove(){
  if(array.isEmpty){
    return;
  }
  array[0]=array[array.length-1];
  array.removeAt(array.length-1);
  shiftDown(0);
}

swap( int i , int j){
  int temp=array[i];
  array[i]=array[j];
  array[j]=temp;
}

display(){
  for(int i=0;i<array.length;i++){
    print(array[i]);
  }
}



parent(int i){
  return (i-1)~/2;
}

leftChild(int i){
  return 2*i+1;
}

rightChild(int i){
  return 2*i+2;
}

}

void main(List<String> args) {
  List<int> array = [4,7,55,2,8,12,54];
  // print(array);
  // MinHeap obj =MinHeap();
  //    print(array);
  // obj.remove();
  //   print(array);

  MinHeap obj =MinHeap.array(array);
  print(obj.array);
  obj.add(4);
  obj.add(7);
  obj.add(55);
  obj.add(2);
  obj.add(8);
  obj.add(12);
  obj.add(54);
  // obj.remove();
  // obj.remove();
  print(obj.array);

}
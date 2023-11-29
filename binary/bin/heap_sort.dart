class MaxHeap{
  heapSort(List<int> array){
    for(int i=0;i<array.length;i++){
      buildHeap(array, array.length-1-i);
      swap(array, 0, array.length-1-i);
    }
    print(array);
    buildHeap(array, array.length-1);
    print(array);
  }

  buildHeap(List<int> array,int end){
    for(int i=parent(end);i>=0;i--){
      shiftDown(i,end, array);
    }

  }

  shiftDown(int currrentIdx, int end , List<int> array){
    int leftIdx = leftChild(currrentIdx);
    int endIdx = end;
    while(leftIdx <= endIdx){
      int rightIdx = rightChild(currrentIdx);
      int idxToShift;
      if(rightIdx <= endIdx && array[rightIdx] > array[leftIdx]){
        idxToShift = rightIdx;
      }
      else{
        idxToShift = leftIdx;
      }
      if(array[currrentIdx] < array[idxToShift]){
        swap(array, currrentIdx, idxToShift);
        currrentIdx=idxToShift;
        leftIdx=leftChild(currrentIdx);
      }
      else{
        break;
      }
    }
  }

  swap(List<int> array , int i , int j){
    int temp = array[i];
    array[i] = array[j];
    array[j] = temp;
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
  List<int> array = [4,7,55,2,8,12,54,9];
  MaxHeap obj = MaxHeap();
  obj.heapSort(array);
}
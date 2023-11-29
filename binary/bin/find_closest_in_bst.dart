
class Node{
  int data;
  Node? left,right;
  Node({required this.data});
}

Node? root;

insert(int data){
  Node? newnode=Node(data: data);
  if(root == null){
    root = newnode;
  }
  else{
    Node? current = root;
    while(true){
      if(data < current!.data){
        if(current.left == null){
          current.left=newnode;
          break;
        }else{
          current=current.left;
          
        }
      }
      else{
        if(current.right == null){
          current.right=newnode;
          break;
        }else{
          current=current.right;
          
        }
      }
    }
  }
}

remove(int data){
 removeHelper(data, root , null);
}

removeHelper(int data , Node? current , Node? parent){
  while(current != null){
    if(data < current.data){
      parent=current;
      current=current.left;
    }
    else if(data > current.data){
      parent=current;
      current=current.right;
    }
   else{
     if(current.left != null && current.right != null ){
      current.data=getMin(current.right);
      removeHelper(current.data, current.right, current);
    }
    else{
      if(parent == null){
        if(current.right==null){
          root=current.left;
        }
        else{
          root=current.right;
        }
      }
      else{
        if(parent.left == current){
          if(current.right==null){
            parent.left=current.left;
          }
          else{
            parent.left=current.right;
          }
        }
        else{
          if(current.right==null){
            parent.right=current.left;
          }
          else{
            parent.right=current.right;
          }
        }
      }
    }
    break;
   }
  }

}

getNearest(int target){
  if(root==null){
    return;
  }
  int nearest=root!.data;
  Node? current=root;
  while(current != null){
    if((target - nearest).abs() > (target - current.data).abs() ){
      nearest=current.data;
    }
    if(target < current.data){
      current=current.left;
    }
    else if(target > current.data){
      current=current.right;
    }
    else{
      return target;
    }
  }

  return nearest;

}

getMin(Node? current){
  if(current?.left == null){
    return current?.data;
  }
  return getMin(current?.left);
}

contain(int data){
  Node? current = root;
  int count=0;
  while(current != null){
    count++;
    if(data < current.data){
      current=current.left;
    }
    else if(data > current.data){
      current=current.right;
    }
    else{
      return count;
    }
  }
  return false;
}

void main(){
  insert(10);
  insert(40);
  insert(6);
  insert(7);
  insert(20);
  insert(25);
  insert(15);
  
  print(getNearest(7));
  // remove(10);
  // print(contain(15));
  // remove(10);

}
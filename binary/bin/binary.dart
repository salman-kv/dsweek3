
class Node{
  int data;
  Node? left,right;
  Node({required this.data});
}

Node? root;

insert(int data){
  Node? newNode=Node(data: data);
  if(root == null){
    root = newNode;
  }
  else{
    Node? current = root;
    while(true){
      if(data < current!.data){
        if(current.left == null){
          current.left=newNode;
          break;
        }
        else{
          current = current.left;
        }
      }
      else{
        if(current.right == null){
          current.right=newNode;
          break;
        }
        else{
          current = current.right;
        }
      }
    }
  }
}

contain(int data){
  Node? current = root;
  int count=0;
  while(current != null){
    count++;
    if(data < current.data){
      current = current.left;
    }
    else if(data > current.data){
      current = current.right;
    }
    else{
      return count;
    }
  }
  return false;
}


remove(int data){
removeHelper(data, root, null);
}

removeHelper(int data , Node? current , Node? parent){
  print('keri');

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
      if(current.left != null && current.right != null){
        current.data= getMin(current.right!);
        removeHelper(current.data, current.right, current);
        // current.data= getMax(current.left!);
        // print(current.data);
        // removeHelper(current.data, current.left, current);
      }
      else{
        if(parent == null){
          if(current.left == null){
            root = current.right;
          }
          else{
            root = current.left;
          }
        }
        else{
          if(parent.left == current){
            if(current.left == null){
              parent.left = current.right;
            }
            else{
              parent.left=current.left;
            }
          }
          else{
            if(current.left == null){
              parent.right = current.right;
            }
            else{
              parent.right=current.left;
            }
          }
        }
      }
      break;
    }
  }
}

getMin(Node current){
  if(current.left == null){
    return current.data;
  }
  else{
    return getMin(current.left!);
  }
}

// getMax(Node current){
//   if(current.right == null){
//     return current.data;
//   }
//   else{
//     return getMax(current.right!);
//   }
// }



// inorder traversal


inoder(){
inorderHelper(root);
}

inorderHelper(Node? current){

if(current != null){
  inorderHelper(current.left);
  print(current.data);
  inorderHelper(current.right);
}

}



// pre order




preoder(){
preorderHelper(root);
}

preorderHelper(Node? current){

if(current != null){
    print(current.data);
  preorderHelper(current.left);
  preorderHelper(current.right);
}

}


// post order


postorder(){
postorderHelper(root);
}

postorderHelper(Node? current){

if(current != null){
  postorderHelper(current.left);
  postorderHelper(current.right);
    print(current.data);
}

}






void main(List<String> args) {
  insert(10);
  insert(5);
  insert(9);
  insert(17);
  insert(6);
  insert(16);
  // inoder();
  // preoder();
  postorder();
}

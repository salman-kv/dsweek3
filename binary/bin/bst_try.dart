class Node{
  int data;
  Node? left,right;
  Node({required this.data});
}

Node? root;

add(int data){
  Node? newNode=Node(data: data);
  if(root == null){
    root=newNode;
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
          current=current.left;
        }
      }
      else{
        if(current.right == null){
          current.right=newNode;
          break;
        }
        else{
          current=current.right;
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



remove(int data){
  removeHelper(data, root, null);

}

removeHelper(int data , Node? current, Node? parent){
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
      if(current.left != null && current.right !=null){
        current.data=getMin(current.right);
        removeHelper(current.data, current.right, current);
      }
      else{
        if(parent == null){
          if(current.left == null){
            root = current.right;
          }
          else{
            root=current.left;
          }
        }
        else{
          if(parent.left == current){
            if(current.right == null){
              parent.left=current.left;
            }
            else{
              parent.left=current.right;
            }
          }
          else{
            if(current.right == null){
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


// inorder(){
// inorderHelper(root);
// }

inorderHelper(Node? current){

  if(current != null){
    inorderHelper(current.left);
    print(current.data);
    inorderHelper(current.right);
  }

}

preOrder(Node? current){
  if(current != null){
    print(current.data);
    preOrder(current.left);
    preOrder(current.right);

  }
}


postOrder(Node? current){
  if(current != null){
    postOrder(current.left);
    postOrder(current.right);
    print(current.data);
  }
}



getMin(Node? current){
  if(current?.left == null){
    return current?.data;
  }
  else{
    return getMin(current?.left);
  }
}


main(){
  add(10);
  add(5);
  add(17);
  add(9);
  add(16);
  add(6);
  add(4);
  postOrder(root);
}
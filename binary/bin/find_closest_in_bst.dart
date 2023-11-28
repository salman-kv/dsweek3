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
          
        }
      }
    }
  }
}

void main(){

}
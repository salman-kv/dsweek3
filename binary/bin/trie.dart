class TrieNode{
  Map<String , TrieNode?> children={};
}

TrieNode root=TrieNode();
String endSymbal='*';

trie(String str){
populateSufixTrie(str);
}

populateSufixTrie(String str){
  for(int i=0;i<str.length;i++){
    insertSubString(i, str);
  }
}

insertSubString(int startIdx , String str){
  TrieNode node=root;
  for(int i=startIdx;i<str.length;i++){
    if(!node.children.containsKey(str[i])){
      TrieNode newNode = TrieNode();
      node.children[str[i]]=newNode;
    }
    node=node.children[str[i]]!;
  }
  node.children[endSymbal]=null;
}

contain(String target){
  TrieNode node = root;
  for(int i=0;i<target.length;i++){
    if(!node.children.containsKey(target[i])){
      return;
    }
    node=node.children[target[i]]!;
  }
  return node.children.containsKey(endSymbal);
}


remove(String target){
  TrieNode node=root;
  for(int i=0;i<target.length;i++){
    if(!node.children.containsKey(target[i])){
      return false;
    }
    node=node.children[target[i]]!;
  }
  if(node.children.containsKey(endSymbal)){
    deleting(node,target);
  }
  else{
    return false;
  }
}

deleting(TrieNode node,String target){
   TrieNode node=root;
  deletingHelper(TrieNode? currentNode,int i){
   if(currentNode!.children.containsKey(endSymbal) && currentNode.children.length ==1){
    currentNode.children.remove(endSymbal);
    return;
   }
   deletingHelper(currentNode.children[target[i]], i+1);
  if(currentNode.children[target[i]] == {}){
   currentNode.children.remove(target[i]);
  }
  }
     deletingHelper(node,0);
}


void main(List<String> args) {
  trie('salman');
  trie('sam');
  trie('sa');

  print(root.children['s']!.children['a']!.children);
  remove('salman');
    print(contain('vn'));
}
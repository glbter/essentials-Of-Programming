       
class Tree:
    def __init__(self):
        self.root = None
    
    def add(self, elem):
        
        newNode = Tree.TreeNode(elem)
        if self.root == None:
            self.root =  newNode
        else :
            current = self.root
            prev = current
            while current != None :
                prev = current
                
                if len(elem) < current.value: 
                    current = current.left
                elif len(elem) > current.value :
                    current = current = current.right
                elif len(elem) == current.value  :
                    current.innerList.add(elem)
                    return
                
            current = prev
            if len(elem) < current.value  : 
                current.left = newNode
            else :
                current.right = newNode
    
    def remove(self, elem):
        if self.root == None:
            return
        else:
            current = self.root
            while current != None :
                
                if len(elem) < current.value  : 
                    current = current.left
                elif len(elem) > current.value :
                    current = current = current.right
                elif len(elem) == current.value:
                    current.innerList.remove(elem)
                    return
                
    def find(self, elem)  :
        if self.root == None:
           print("not found")
           return None
        else :
            current = self.root
           
            while current != None :
                if len(elem) < current.value: 
                    current = current.left
                elif len(elem) > current.value :
                    current = current = current.right
                elif len(elem) == current.value  :
                    return current.innerList.find(elem)
            print("not found")
            return None
    
        
    def inOrderTraversal(self, root):
        if root != None:
            self.inOrderTraversal(root.left)
            root.innerList.listTraversal()  
            self.inOrderTraversal(root.right)
            
    def strucktureTraverse(self):
        self.inOrderTraversal(self.root)      
    
    class TreeNode:
        def __init__(self, value):
            self.value = len(value)
            self.innerList = Tree.LinkedList()
            self.innerList.add(value)
            self.right = None
            self.left = None
    
    class LinkedList:
        def __init__(self):
            self.first = None
            
        class LLNode():
            def __init__(self, value):
                self.value = value
                self.next = None
       
        def listTraversal(self):
            current = self.first
            while current :
                print(current.value)
                current = current.next
                
                
        def add(self, elem):
            #elem -> new value of list
            newNode = Tree.LinkedList.LLNode(elem)
            if self.first == None :
               self.first = newNode
            elif elem < self.first.value :
                tmp = self.first
                self.first = newNode
                self.first.next = tmp
            else :
               current = self.first
               prev = current
               
               while elem > current.value and current.next != None :
                   prev = current
                   current = current.next
               if elem <= current.value :
                   oldNext = prev.next
                   prev.next = newNode
                   newNode.next = oldNext
                   
               elif current.next == None :
                   current.next = newNode

               
        def find(self,elem):
            current = self.first
            while elem != current.value and current.next != None :
                current = current.next
            if current == None : 
                print("not found")
                return None
            elif  elem == current.value :
                return current
            
        def remove(self,elem):
            current = self.first
            if current == None :
                return
            if elem == current.value : 
                self.first = current.next
            else :
                while elem != current.next.value \
                    and current.next.next != None :
                    current = current.next
                if  elem == current.value :
                    current.next = current.next.next
                if  elem == current.next.value :
                    current.next = None
            
      
def test():            
    tree = Tree()
    tree.add("wow") 
    tree.add("hel") 
    tree.add("hello world") 
    tree.add("tree works")
    tree.add("list works too")  
    tree.add("lol") 
    tree.add("kek") 
    tree.strucktureTraverse()      
    tree.remove("wow")  
    tree.remove("hello world") 
    tree.remove("hel")
    print("")       
    tree.strucktureTraverse() 
    print(tree.find("kek"))   
    tree.add("ab") 
    tree.add("aa")
    tree.add("ae")
    tree.add("ad")
    tree.add("ac")
    tree.strucktureTraverse()  
    print("")
    print(tree.find("kek").value)  
    print(tree.find("aa").value)   
test()

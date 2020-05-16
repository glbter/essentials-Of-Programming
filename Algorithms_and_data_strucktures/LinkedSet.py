class LinkedList:
    
    
    def __init__(self):
        self._length = 0
        self._first = None
        
        
    def getLength(self):
        return self._length
     
        
    def iterLength(self):
        self._length += 1
        
        
    def add(self, node):
        
        if self.getLength() == 0:
            this = LinkedList._Node(node)
            self._first = this
            self.iterLength()
        else :   
            counter = 0
            for iterable in self.Iterator():
                counter += 1
                elem = iterable
                
                if node == elem.getValue(): 
                    return
                elif node < elem.getValue() :
                    break
                
            if (counter != self.getLength()):    
                this = LinkedList._Node(node)
                
                if (isinstance(elem.getPrev(), LinkedList._Node)):
                    this.setPrev(elem.getPrev())
                    elem.getPrev().setNext(this)
                else:
                    self._first = this
                this.setNext(elem)    
                elem.setPrev(this)
                
            elif (counter == self.getLength()):
                this = LinkedList._Node(node)
                
                if (node > elem.getValue()):
                    this.setPrev(elem)
                    elem.setNext(this)
                else :
                    if (self._first == elem):
                        self._first = this
                    else :
                        elem.getPrev().setNext(this)
                        this.setPrev(elem.getPrev())
                    this.setNext(elem)
                    elem.setPrev(this) 
                      
            self.iterLength();
        
        
    def Iterator(self):
        elem = self._first
        while (True):
            yield elem
            if elem.hasNext() == False:
                break
            else:
                elem = elem.getNext()
        
        
    def valueIterator(self):
        elem = self._first
        while (isinstance(elem, LinkedList._Node)):            
            yield elem.getValue();
            elem = elem.getNext()
        
        
    def remove(self,elem):
        length = self.getLength()
        if length == 0:
            print("nothing to remove")
        else:
            iterator = 0
            if elem == self._first : #if it is first
                Next = self.first.getNext()
                if isinstance(Next, LinkedList._Node):
                    self._first = Next;
                    Next.setPrev(None)
                else:
                    self._first = None
             #if it is not first   
            for iterable in self.Iterator():
                if (iterable.getValue() == elem) :
                    Prev = iterable.getPrev()
                    Next = iterable.getNext()
                    iterable.setNext(None)
                    iterable.setPrev(None)
                    if isinstance(Prev, LinkedList._Node) :
                        Prev.setNext(Next)
                    if isinstance(Next, LinkedList._Node) :
                        if (elem == self._first.getValue()):
                            self._first = Next
                        Next.setPrev(Prev)
                    self._length -= 1
                else:
                    iterator += 1
                    pass
            if iterator == length :
                print("no such element")
           
            
    class _Node:
        
        def __init__(self, this):
            self._next = None
            self._prev = None
            self._this = this
         
            
        def getValue(self):
            return self._this
        
        def setValue(self, val):
            self._this = val 
            
        def getNext(self):
            return self._next
        
        def getPrev(self):
            return self._prev
        
        def setNext(self, Next):
            self._next = Next
            
        def setPrev(self, Prev):
            self._prev = Prev
            
        def hasNext(self):
            return True if self.getNext() != None else False
        
        def hasPrev(self):
            return True if self.getPrev() != None else False


class SetOperations :
    
    @staticmethod
    def Union(set1, set2):
        List = LinkedList()
        if (SetOperations._validate(set1, set2)):
            for i in set1.valueIterator():
                List.add(i)
            for i in set2.valueIterator():
                List.add(i)
        return List

                
    @staticmethod
    def Intersection (set1, set2):
        List = LinkedList()
        if (SetOperations._validate(set1, set2)):
            arr1 = []
            arr2 = []
            arr3 = []
            for i in set1.valueIterator():
                arr1.append(i)
            for i in set2.valueIterator():
                arr2.append(i)   
            for elem in arr1:
                if (elem in arr1) and (elem in arr2):
                    arr3.append(elem)
                    
            List = LinkedList()
            for elem in arr3:
                List.add(elem)
        return List

    @staticmethod    
    def Difference (set1, set2):
        result = LinkedList()
        if (SetOperations._validate(set1, set2)):
            inter = SetOperations.Intersection(set1, set2)
            arr1 = []
            arrInter = []
            for elem in set1.valueIterator():
                arr1.append(elem)
            for elem in inter.valueIterator():
                arrInter.append(elem)
            for elem in arr1:
                if elem not in arrInter:
                    result.add(elem)
        return result    
 
    
    @staticmethod         
    def SymetricalDifference(set1, set2):
        result = LinkedList()
        SO = SetOperations
        if (SO._validate(set1, set2)):
            list1 = SO.Difference(set1, set2)
            list2 = SO.Difference(set2, set1)
            result = SO.Union(list1, list2)         
        return result


    @staticmethod   
    def Complement(set1, univ):
        result = LinkedList()
        if (SetOperations._validate(set1, univ)):
            result = SetOperations.Difference(set1, univ)
        return result 
    
    
    @staticmethod 
    def IsEqual(set1,set2):
        
        if (SetOperations._validate(set1,set2)):
            
            if (set1.getLength() == set2.getLength()):
                iter1 = set1.valueIterator()
                iter2 = set2.valueIterator()
                counter = 0
        
                while(counter < set1.getLength()):
                    counter += 1
                    
                    if (iter1.__next__() != iter2.__next__()):
                        return False
                    
                return True
        return False
     
    
    @staticmethod
    def IsSubset(subset, Set):
        SO = SetOperations
        union = SO.Union(subset, Set)
        union = SO.IsEqual(union, Set)
        inter = SO.Intersection(subset, Set)
        inter = SO.IsEqual(inter, subset)
        return union and inter
    
        
    @staticmethod
    def _validate(set1, set2) -> bool:
        if (isinstance(set1, LinkedList) 
        and isinstance(set2, LinkedList)):
            return True
        else:
            print("needed lists")    
            return False
  
    
if __name__ == "__main__":
    x = LinkedList()  
    x.add(1)
    x.add(2)
    x.add(3)
    x.add(4)
    x.add(5)
    x.add(6)
#    x.add(1)    
#    x.add(9) 
#    x.add(1)
#    x.add(2)
#    x.add(5)
#    x.add(11)
    #x.add(3)
    #x.add(10)
    #x.add(7)
    #x.add(21)
    #x.add(17)
    #x.add(16)
    #x.add(18)
    #x.remove(1)
    #x.add(29)
    #x.add(26)
    print("")
    
    y = LinkedList()
    y.add(1)
    y.add(2)
    y.add(3)
    y.add(4)
    y.add(5)
    y.add(6)
    SO = SetOperations
    union = SO.Union(x, y)
    inter = SO.Intersection(x,y)
    differ = SO.Difference(x, y)
    differ2 = SO.Difference(y, x)
    symetr = SO.SymetricalDifference(x, y)
    
    
    for elem in symetr.valueIterator():
        print(elem)
    
    print(" ")
    print(SO.IsEqual(x, y))
    print(SO.IsSubset(x,y))
#    for elem in y.valueIterator():
#        print(elem)
#    print(" ")   

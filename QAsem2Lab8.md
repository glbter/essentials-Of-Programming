# Вкладені та внутрішні класи
### 1. Для чого потрібні вкладені класи (nested classes)?
  - They enable you to logically group classes that are only used in one place, thus this increases the use of encapsulation, and create more readable and maintainable code.
  - They allow you to take logic out of the parent class and objectify it. This removes functionality from where it doesn't belong and puts it into its own class. But what if this new object is only needed for a short time, only for the duration of a single block of code? Well, that's where a local class fits in.
### 2. В чому полягає відмінність між статичними вкладеними (static) та нестатичними внутрішніми (non-static inner) класами? 
  - As with class methods and variables, a static nested class is associated with its outer class. And like static class methods, a static nested class cannot refer directly to instance variables or methods defined in its enclosing class: it can use them only through an object reference.
  - Static nested classes do not directly have access to other members(non-static variables and methods) of the enclosing class because as it is static, it must access the non-static members of its enclosing class through an object. That is, it cannot refer to non-static members of its enclosing class directly. Because of this restriction, static nested classes are seldom used.
  - Non-static nested classes (inner classes) has access to all members(static and non-static variables and methods, including private) of its outer class and may refer to them directly in the same way that other non-static members of the outer class do.
  - static :
  ```java
  OuterClass.StaticNestedClass nestedObject = new OuterClass.StaticNestedClass();
  ```
  - non-static : 
  ```java
   OuterClass outerObject = new OuterClass(); 
        OuterClass.InnerClass innerObject = outerObject.new InnerClass(); 
  ```
### 3. В яких випадках краще використовувати статичні вкладені (static nested), в яких внутрішні (non-static inner), а в яких звичайні класи?
  - You use static nested classes if you just want to keep your classes together if they belong topically together or if the nested class is exclusively used in the enclosing class. There is no semantic difference between a static nested class and every other class.
  - You would define a static inner class when you know that it does not have any relationship with the instance of the enclosing class/top class. If your inner class doesn't use methods or fields of the outer class, it's just a waste of space, so make it static.
  - Non-static nested classes are a different beast. Similar to anonymous inner classes, such nested classes are actually closures. That means they capture their surrounding scope and their enclosing instance and make that accessible. 
### 4. Чи можна (і якщо «так», то яким чином) з середини об’єкту внутрішнього класу звернутися до «this» цього об’єкту або до об’єкту зовнішнього класу? 
```java
  //to outer (parent) object
  OuterClassName.this.var
  //to object of this class
  this.var
```
### 5. Наведіть фрагмент коду для створення:
  - **об’єкту вкладеного статичного класу з середини зовнішнього класу;**
  ```java
   Comparator myComparator = new myComparator();
  ```
  - **об’єкту вкладеного статичного класу ззовні зовнішнього класу;**
```java
 OuterClass.ComparatorClass myComparator = new OuterClass.ComparatorClass();
  ```
  - **об’єкту внутрішнього нестатичного класу з середини зовнішнього класу;**
  ```java
  InnerClass innerObject = new InnerClass();
  ```
  - **об’єкту внутрішнього нестатичного класу ззовні зовнішнього класу.**
  ```java
  OuterClass outerObject = new OuterClass(); 
        OuterClass.InnerClass innerObject = outerObject.new InnerClass(); 
  ```
### 6. В чому полягає різниця між локальними та анонімними класами?
  - A normal class can implement any number of interfaces but anonymous inner class can implement only one interface at a time.
  - A regular class can extend a class and implement any number of interface simultaneously. But anonymous Inner class can extend a class or can implement an interface but not both at a time.
  - For regular/normal class, we can write any number of constructors but we cant write any constructor for anonymous Inner class because anonymous class does not have any name and while defining constructor class name and constructor name must be same.
  - We cannot declare static initializers or member interfaces in an anonymous class.
  - It is an inner class without a name and for which only a single object is created. An anonymous inner class can be useful when making an instance of an object with certain “extras” such as overloading methods of a class or interface, without having to actually subclass a class.
  - Anonymous inner classes are useful in writing implementation classes for listener interfaces in graphics programming. 
  
### 7. Що таке захват змінних (variable capture)?
- A captured variable is one that has been copied so it can be used in a nested class. The reason it has to be copied is the object may out live the current context. It has to be final (or effectively final in Java 8) so there is no confusion about whether changes to the variable will be seen (because they won't)
```java
final int numberLength = 10;  // in JDK7 and earlier must be final...

class PhoneNumber {
   // you can refer to numberLength here...  it has been "captured"
}
```
### 8. Чому з локальних та анонімних класів неможна звертатись до локальних змінних, що змінюють свої значення?
  - Об'єкти локальних класів можуть жити довше, ніж локальні змінні. Тому єдиний спосіб забезпечити виконання коду, коли об'єкт звертається до локальної змінної - це скопіювати цю змінну в об'єкт. Але тоді можлива інша проблема: копія та оригінал можуть мати різни значення. Щоб такого ефекту не було, змінні, до яких звертаються з локальних класів (або лямбд)  мають бути final або effectively final.
  
### 9. В чому полягає різниця між поняттями «final» та «effectively final»?
  - A variable or parameter whose value is never changed after it is initialized is effectively final.
  - This variable below is final, so we can't change it's value once initialised. If we try to we'll get a compilation error...
  - final видасть помилку одразу в змінюваному коді, а effectively final помилку у місці виклику методу, лямбди.

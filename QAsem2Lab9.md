# Лямбда-вирази та компаратори
### 1. В чому полягають відмінності, переваги та недоліки лямбда-виразів у порівнянні з анонімними класами?
  + Більш висока швидкість
  + Легше читати
  + Менше писати :)
  - Працюють лише на базі інтерфейсів
  неможливо створити із абстрактного класу
  - Працюють лише для інтерфейсів з одним абстрактним
  методом
  функціональні інтерфейси
  - У лямбд нема свого this, полів для зберігання стану,
  конструкторів, блоків ініціалізації, ...

### 2. Що таке функціональний інтерфейс?
  - Functional interfaces provide target types for lambda expressions and method references. Each functional interface has a single abstract method, called the functional method for that functional interface, to which the lambda expression's parameter and return types are matched or adapted. Functional interfaces can provide a target type in multiple contexts, such as assignment context, method invocation, or cast context:
  ```java
  // Assignment context
     Predicate<String> p = String::isEmpty;

     // Method invocation context
     stream.filter(e -> e.getSize() > 10)...

     // Cast context
     stream.map((ToIntFunction) e -> e.getSize())...
  ```
  - All functional interfaces are recommended to have an informative @FunctionalInterface annotation. This not only clearly communicates the purpose of this interface, but also allows a compiler to generate an error if the annotated interface does not satisfy the conditions.
**Any interface with a Single Abstract Method is a functional interface**, and its implementation may be treated as lambda expressions.

### 3. Що таке статичні та дефолтні методи? Чим вони відрізняються від звичайних методів в інтерфейсах?
  - дефолтні методи ітерфейсу мають реалізацію у цьому інтерфейсі за замовчуванням
  - Статичні методи можна використовувати для створення допоміжних методів. Працюють МАЙЖЕ як для класів:
    - Неможна перевизначити (override) при наслідуванні/імплементації
    - Відповідно, не працює поліморфізм
    - Відсутній this
    - Заборонено використовувати ім’я статичного
    методу без імені інтерфейсу (див. приклад)
   ```java
     interface A {
        static void staticMethod() {}
     }
     interface B extends A {
        static void someMethod() {
          A.staticMethod(); // OK
          staticMethod(); // compile error
       }
      }
      class C implements A {
        void someMethod() {
          A.staticMethod(); // OK
          staticMethod(); // compile error
          this.staticMethod(); // compile error
        }
}
```


### 4. Чому з лямбда-виразів неможна звертатись до локальних змінних, що змінюють свої значення?
  - ![why you cant do it](https://github.com/nicknema/essentials-Of-Programming/blob/master/QAsem2Lab8.md#8-%D1%87%D0%BE%D0%BC%D1%83-%D0%B7-%D0%BB%D0%BE%D0%BA%D0%B0%D0%BB%D1%8C%D0%BD%D0%B8%D1%85-%D1%82%D0%B0-%D0%B0%D0%BD%D0%BE%D0%BD%D1%96%D0%BC%D0%BD%D0%B8%D1%85-%D0%BA%D0%BB%D0%B0%D1%81%D1%96%D0%B2-%D0%BD%D0%B5%D0%BC%D0%BE%D0%B6%D0%BD%D0%B0-%D0%B7%D0%B2%D0%B5%D1%80%D1%82%D0%B0%D1%82%D0%B8%D1%81%D1%8C-%D0%B4%D0%BE-%D0%BB%D0%BE%D0%BA%D0%B0%D0%BB%D1%8C%D0%BD%D0%B8%D1%85-%D0%B7%D0%BC%D1%96%D0%BD%D0%BD%D0%B8%D1%85-%D1%89%D0%BE-%D0%B7%D0%BC%D1%96%D0%BD%D1%8E%D1%8E%D1%82%D1%8C-%D1%81%D0%B2%D0%BE%D1%97-%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%BD%D1%8F)
### 5. В чому полягає різниця між поняттями «final» та «effectively final»?
  - ![difference bitween final and effectively final](https://github.com/nicknema/essentials-Of-Programming/blob/master/QAsem2Lab8.md#9-%D0%B2-%D1%87%D0%BE%D0%BC%D1%83-%D0%BF%D0%BE%D0%BB%D1%8F%D0%B3%D0%B0%D1%94-%D1%80%D1%96%D0%B7%D0%BD%D0%B8%D1%86%D1%8F-%D0%BC%D1%96%D0%B6-%D0%BF%D0%BE%D0%BD%D1%8F%D1%82%D1%82%D1%8F%D0%BC%D0%B8-final-%D1%82%D0%B0-effectively-final)

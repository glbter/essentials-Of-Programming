## Основи програмування - 2 

###  1. Multithreading: основні поняття (Process, Thread, Instance, Scheduler). Кооперативна та витискальна багатозадачність. 
 - [кооперативна та витискальна](https://github.com/nicknema/essentials-Of-Programming/blob/master/QAsem2Lab6.md#2-%D0%B2-%D1%87%D0%BE%D0%BC%D1%83-%D0%BF%D0%BE%D0%BB%D1%8F%D0%B3%D0%B0%D1%94-%D1%80%D1%96%D0%B7%D0%BD%D0%B8%D1%86%D1%8F-%D0%BC%D1%96%D0%B6-%D0%BA%D0%BE%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%82%D0%B8%D0%B2%D0%BD%D0%BE%D1%8E-%D1%82%D0%B0-%D0%B2%D0%B8%D1%82%D0%B8%D1%81%D0%BA%D0%B0%D0%BB%D1%8C%D0%BD%D0%BE%D1%8E-%D0%B1%D0%B0%D0%B3%D0%B0%D1%82%D0%BE%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D0%BD%D1%96%D1%81%D1%82%D1%8E-%D1%8F%D0%BA%D0%B0-%D0%B7-%D1%86%D0%B8%D1%85-%D0%BC%D0%BE%D0%B4%D0%B5%D0%BB%D0%B5%D0%B9-%D1%80%D0%B5%D0%B0%D0%BB%D1%96%D0%B7%D0%BE%D0%B2%D0%B0%D0%BD%D0%B0-%D1%83-java)
###  2. Інтерфейс Runnable та клас Thread. Діаграма станів об’єктів класу Thread.
 -  [diagram of states](https://github.com/nicknema/essentials-Of-Programming/blob/master/QAsem2Lab6.md#3-%D0%BF%D0%BE%D1%8F%D1%81%D0%BD%D0%B8%D1%82%D0%B8-%D0%B4%D1%96%D0%B0%D0%B3%D1%80%D0%B0%D0%BC%D1%83-%D1%81%D1%82%D0%B0%D0%BD%D1%96%D0%B2-%D0%BE%D0%B1%D1%94%D0%BA%D1%82%D0%B0-%D0%BA%D0%BB%D0%B0%D1%81%D1%83-thread-%D1%87%D0%B8%D0%BC-%D1%81%D1%82%D0%B0%D0%BD-running-%D0%B2%D1%96%D0%B4%D1%80%D1%96%D0%B7%D0%BD%D1%8F%D1%94%D1%82%D1%8C%D1%81%D1%8F-%D0%B2%D1%96%D0%B4-%D1%81%D1%82%D0%B0%D0%BD%D1%83-runnable)
 - Runnable - має один метод run, даний метод викликається в об'єкта якщо його запхати в тред
усі дії які об'єкт в треді має виконувати слід прописувати в даному методі
- Thread - клас яки позначає собою треди в конструкторі терба вказати об'єкт яки імплементує Runnuble запуск методом старт
- runnable - готовий працювати
- running - виконує роботу 
- sheduler - перемикає об'єкт між даними двома станами
- blocked - потік заблокований певною подією(івентом)
- dead - тред закінчив роботу
###  3. Стан гонитви. Проблеми, які можуть бути ним спричинені, та способи їх уникнення.
  - race condition - ситуація коли два потоки одночасно звертаються до однієї змінної або об'єкта
проблема: невірне виконання завдання, виникнення помилкових даних

вирішення :
- 1 зробити так щоб не було можливості 2 або більше тредам мати одночасно доступ до певних даних
- 2 синхронізувати змінну
- 3 синзронізувати секцію
- 4 якщо це колекція то отримати синхронізовану колекцію
###  4. Критична секція. Явне та неявне блокування – переваги та недоліки.
  - [критична секція, м'ютекс, монітор](https://github.com/nicknema/essentials-Of-Programming/blob/master/QAsem2Lab7.md#4-%D1%89%D0%BE-%D1%82%D0%B0%D0%BA%D0%B5-%D0%BA%D1%80%D0%B8%D1%82%D0%B8%D1%87%D0%BD%D0%B0-%D1%81%D0%B5%D0%BA%D1%86%D1%96%D1%8F-%D0%BC%D1%8E%D1%82%D0%B5%D0%BA%D1%81-%D0%BC%D0%BE%D0%BD%D1%96%D1%82%D0%BE%D1%80)
 -  [явне та неявне блокування](https://github.com/nicknema/essentials-Of-Programming/blob/master/QAsem2Lab7.md#5-%D1%8F%D0%BA%D1%96-%D1%94-%D0%BF%D0%B5%D1%80%D0%B5%D0%B2%D0%B0%D0%B3%D0%B8%D0%BD%D0%B5%D0%B4%D0%BE%D0%BB%D1%96%D0%BA%D0%B8-%D1%8F%D0%B2%D0%BD%D0%BE%D0%B3%D0%BE-%D0%B1%D0%BB%D0%BE%D0%BA%D1%83%D0%B2%D0%B0%D0%BD%D0%BD%D1%8F-%D1%83-%D0%BF%D0%BE%D1%80%D1%96%D0%B2%D0%BD%D1%8F%D0%BD%D0%BD%D1%96-%D0%B2%D0%B8%D0%BA%D0%BE%D1%80%D0%B8%D1%81%D1%82%D0%B0%D0%BD%D0%BD%D1%8F%D0%BC-%D1%81%D0%B8%D0%BD%D1%85%D1%80%D0%BE%D0%BD%D0%BD%D0%B8%D1%85-%D1%81%D0%B5%D0%BA%D1%86%D1%96%D0%B9)
###  5. Робота з колекціями у паралельних тредах.
  - [fail-fast and thread-safe collections](https://github.com/nicknema/essentials-Of-Programming/blob/master/QAsem2Lab7.md#6-%D1%89%D0%BE-%D0%BE%D0%B7%D0%BD%D0%B0%D1%87%D0%B0%D1%8E%D1%82%D1%8C-%D1%82%D0%B5%D1%80%D0%BC%D1%96%D0%BD%D0%B8-thread-safe-%D1%82%D0%B0-fail-fast-%D0%B4%D0%BB%D1%8F-%D0%BA%D0%BE%D0%BB%D0%B5%D0%BA%D1%86%D1%96%D0%B9)
  - [work with collection in paralell threads](https://github.com/nicknema/essentials-Of-Programming/blob/master/QAsem2Lab7.md#2-%D0%B2-%D1%8F%D0%BA%D0%B8%D1%85-%D0%B2%D0%B8%D0%BF%D0%B0%D0%B4%D0%BA%D0%B0%D1%85-%D1%82%D0%B0-%D1%8F%D0%BA%D0%B8%D0%BC-%D1%87%D0%B8%D0%BD%D0%BE%D0%BC-%D1%81%D0%BB%D1%96%D0%B4-%D1%81%D0%B8%D0%BD%D1%85%D1%80%D0%BE%D0%BD%D1%96%D0%B7%D0%BE%D0%B2%D1%83%D0%B2%D0%B0%D1%82%D0%B8-%D0%BF%D0%BE%D1%82%D0%BE%D0%BA%D0%B8-%D0%B2%D0%B8%D0%BA%D0%BE%D0%BD%D0%B0%D0%BD%D0%BD%D1%8F-%D0%BF%D1%80%D0%B8-%D0%B4%D0%BE%D1%81%D1%82%D1%83%D0%BF%D1%96-%D0%B4%D0%BE-%D1%81%D0%BF%D1%96%D0%BB%D1%8C%D0%BD%D0%B8%D1%85-%D1%80%D0%B5%D1%81%D1%83%D1%80%D1%81%D1%96%D0%B2)
###   6. Організація взаємодії між тредами: join, wait-notify.
 -  [join](https://github.com/nicknema/essentials-Of-Programming/blob/master/QAsem2Lab6.md#6-%D0%B4%D0%BB%D1%8F-%D1%87%D0%BE%D0%B3%D0%BE-%D0%BF%D0%BE%D1%82%D1%80%D1%96%D0%B1%D0%B5%D0%BD-%D0%BC%D0%B5%D1%82%D0%BE%D0%B4-join)
 - join програма не буде виконувати подальші команди поки тред для якого був викликаний даний метод
не закінчить свою роботу
- wait - змушує всі потоки які звертаються до даного об'єкта зачекати
- notify - дає дозвіл треду на роботу з об'єктом 
- для попередніх двох операції необхідно щоб у об'єкта був лок
###  7. Треди-демони. Volatile-змінні.
- Daemon threads - низько пріорітетні треди які запускаються в кінці для виконання завдан.
- Properties:
   - якщо не залишилось потоків не демонів то JVM відключиться 
   - якщо при вимкненні JVM знайде тред демон вона вимкне його а коли вимкне усі подібні треди то сама виключиться. 
   - це низько- пріорітетні треди того на них ресурси будуть виділятись в останню чергу
- volatile  ставиться перед змінною, позаначає що дана зміння тепер зберігається в пам'яті а не в кеші, тепер будь-який запис цієї змінної буде атомарним 
- атомарний - проміжних результатів немає приклад не атомарності double i long в 32 бітних системах
###  8. Web-застосунки: основні поняття (HTML, form, HTTP, GET, POST). Статичні та динамічні сторінки. Переваги та недоліки CGI-застосунків у порівнянні з Java web-застосунками.
- HTML - hyper text market language мова розмітки
- HTTP - hyper text transfer protocol протокол передачі даних
- form - структура в html сторынцы призанчена для того шоб передати на сервлет певний набір даних
- GET - запита на отримання певної інфи з сервера надсилається через UML 
- POST - надсилання великої кількості даних на сервер не використовує UML
- статичні сторінки - HTML сторінки які не змінються замість зміни сторінки сервер просто відправляє нову
- динамічні сторінки - сторінки змінюються в залежності від того які дані приходять з сервера

недоліки 
- для кожного користувача створюється окремий екземпляр програми який з ним взаємодіє а це 
в свою чергу займає доволі багато ресурсів сервлет створює одни об'єкт який взаємодіє зі всіма 
користувачами 
###  9. Servlet API: основні класи та інтерфейси (Servlet, GenericServlet, HttpServlet, Servlet Request, Servlet Response, HttpServletRequest, HttpServletResponse, HttpSession, Cookie).
- Servlet - інтерфейс який позначає основні методі необхідні для сервлет
- Request - інтерфейс який позначає об'єкт для отриманя інфи з сторінок
- Response - ынтерфейс який позначає об'єкт для передачі інфи користувачу
- Якщо до усього що зверху додати Http то вийдуть класи які імплеметують дані інтерфейс і призначені для роботи з протоколом Http 
- Cookie - клас який позначає об'єкти які зберігаються в користувача
- GenericServlet - абстрактний клас який позначає сервлет який працює з вебом і не залежить
від протоколу передачі даних
### 10.  Структура web-застосунку (структура папок проекту, файл web.xml).
- web inf - папка до якої користувач не може звернутись через URL строку
- meta-inf папка для збереження конфігурації для застосунку
- web.xml - для опису вмісту застосунку зберігає конфігурацію застосунку та дані необхідні для 
запуску
###  11.  JSP: призначення, переваги/недоліки у порівнянні з сервлетами. Життєвий цикл JSP-сторінки.
- JSP - java server page
    - призначення - створення динамічних сторінок
    - переваги - легше читати менше писати 

- життєвий цикл JSP 
    - 1 Трансляція 
      - JSP контейнер первіряє код JSP сторінки і парсить її для створення сервлета
   -  2 Компіляція
      - контейнер компілює вихідний код JSP класу і створює новий клас
   -  3 контейнер загружає класи в пам'ять
   -  4 інсталяція
      - впровадження конструкторів без параметрів створених класів для ініціалізації в пам'яті класу
    - 5 Ініціалізація 
      -  в контейнері викликається init метод об'єкта JSP класу і ініціалізується конфігурація сервлета з init параметрами які вказані у web.xml після цієї фази JSP здатен обробляти запити клієнта
    - 6 обробка запитів клієнта
      -  для кожного сервлета створюється окремий тред створюються обєкти реквест і респонс і проходить впровадження сервіс-методів JSP
    - 7 Видалення 
      - остання фаза об'єкт сервлета видаляється з пам'яті
###  12.  JSP-елементи: scripting-, directive- та action- елементи.
- scripting 
   - для написання коду в JSP сторінці
      - `<%=  %>` - виведення даних
      - `<% %>`-  код
      - `<%!  %>` -  декларація змінних на рівні класу
- directive
  - для встановлення параметрів JSP сторінки наприклад
      - import 
      - session
      - isThreadSafe
      - info
      - errorPage
      - isErrorPage
      - contentType
      - pageEncoding
- action 
  - include включення іншої JSP сторінки
  - forward перенаправлення на іншу JSP сторінку
  - useBean для роботи з класами в JSP
  
###  13.  JavaBean. Використання JavaBean в сервлетах та JSP. Області видимості.
- javaBean утиліта для використання класів в jsp та їх об'єктів збереження в пам'яті

```<jsp:useBean id=" userA "class" com.example.User" scope="session" />
<jsp:setProperty name="userA" property="id" value="1234" />

<jsp:setProperty name="userA" property="surname" value="Smith">
```

``` page 2: find bean userA , get h1

<jsp:useBean id="userA" class="com.example.User" scope="session" />

id:<jsp:getProperty name="userA" property="id"

surname:<jsp:getProperty name=" userA " property="surname"
```
- page - в межах сторінки, Thread-safe
- request - в межах запиту, Thread-safe
- session - в межах сесії
- application - в межах застосунку 
###  14.  Expression Language: призначення, переваги/недоліки, основні конструкції.
- EL - Expresion Language cтворений для легшого користування класами і об'єктами
- переваги
  - менше писати лекше читати
- Deffered EL #{
  - Syntax: expression
  - Framework evaluate the expression later during the
page’s lifecycle
  - Can be RValue or LValue
- Immediate EL ${
  - Syntax: expression
  - expression is evaluated and the result returned as
  - soon as the page is rendered
  - Can be only RValue
  
### 15.  JSTL: призначення, переваги/недоліки, основні конструкції.
- JSTL - Java Server Page Standart Tag Library
- можна писати JSP без коду на java лише на XML
  - `<c:set>` встановлення змінних
  - `<c:if> </c:if>`	умова
  - `<c:forEach> </c:forEach>` перерахунок
  - `<c:out/>` вивід
###  16.  Патерн MVC.
 - MVC Model View Controller
   -  вюшка відповідає за вигляд
   -  модель за логіку
   - контроллер за передачачу даних на потрібні точки
- 1 дані ідуть на сервер
- 2 сервер перекидає їх на контроллер
- 3 контроллер кидає їх на модень
- 4 модель взаємодіючи з базами даних формує відповідь
- 5 контроллент перкидає відповідь на вюшку
- 6 вюшка оформлює вигляд і перекидає відповідь на сервер
- 7 сервер кидає відповідь користувачеві
###  17.  Вкладені класи. Призначення вкладених класів. Різновиди вкладених класів (статичні, внутрішні, локальні, анонімні). Захват локальних змінних. Final та effectively final змінні.
  - [усе про вкладені класи](https://github.com/nicknema/essentials-Of-Programming/blob/master/QAsem2Lab8.md#%D0%B2%D0%BA%D0%BB%D0%B0%D0%B4%D0%B5%D0%BD%D1%96-%D1%82%D0%B0-%D0%B2%D0%BD%D1%83%D1%82%D1%80%D1%96%D1%88%D0%BD%D1%96-%D0%BA%D0%BB%D0%B0%D1%81%D0%B8)
###  18.  Інтерфейси у Java 8. Статичні методи, методи за замовченням. Проблема ромба.
  - [static and default methods](https://github.com/nicknema/essentials-Of-Programming/blob/master/QAsem2Lab9.md#3-%D1%89%D0%BE-%D1%82%D0%B0%D0%BA%D0%B5-%D1%81%D1%82%D0%B0%D1%82%D0%B8%D1%87%D0%BD%D1%96-%D1%82%D0%B0-%D0%B4%D0%B5%D1%84%D0%BE%D0%BB%D1%82%D0%BD%D1%96-%D0%BC%D0%B5%D1%82%D0%BE%D0%B4%D0%B8-%D1%87%D0%B8%D0%BC-%D0%B2%D0%BE%D0%BD%D0%B8-%D0%B2%D1%96%D0%B4%D1%80%D1%96%D0%B7%D0%BD%D1%8F%D1%8E%D1%82%D1%8C%D1%81%D1%8F-%D0%B2%D1%96%D0%B4-%D0%B7%D0%B2%D0%B8%D1%87%D0%B0%D0%B9%D0%BD%D0%B8%D1%85-%D0%BC%D0%B5%D1%82%D0%BE%D0%B4%D1%96%D0%B2-%D0%B2-%D1%96%D0%BD%D1%82%D0%B5%D1%80%D1%84%D0%B5%D0%B9%D1%81%D0%B0%D1%85)
- проблема ромба 
  - є 3 інтерфейса два з них наслідують один в кожному з них є один і той сами преписаний дефолтний метод в результаті якщо ми зробим клас який імплементує два інтерфейса наслідника то отримаємо помилку, щоб уникнути достатньо переписати даний метод в класі, а ось так звертатись до реалізацій в інтерфейсах
```java
B1.super.someMethod ();
B2.super.someMethod ();
```
###  19.  Лямбда-вирази. Синтаксис. Переваги та недоліки у порівнянні з анонімними класами.
 - [lambdas or anonimous](https://github.com/nicknema/essentials-Of-Programming/blob/master/QAsem2Lab9.md#1-%D0%B2-%D1%87%D0%BE%D0%BC%D1%83-%D0%BF%D0%BE%D0%BB%D1%8F%D0%B3%D0%B0%D1%8E%D1%82%D1%8C-%D0%B2%D1%96%D0%B4%D0%BC%D1%96%D0%BD%D0%BD%D0%BE%D1%81%D1%82%D1%96-%D0%BF%D0%B5%D1%80%D0%B5%D0%B2%D0%B0%D0%B3%D0%B8-%D1%82%D0%B0-%D0%BD%D0%B5%D0%B4%D0%BE%D0%BB%D1%96%D0%BA%D0%B8-%D0%BB%D1%8F%D0%BC%D0%B1%D0%B4%D0%B0-%D0%B2%D0%B8%D1%80%D0%B0%D0%B7%D1%96%D0%B2-%D1%83-%D0%BF%D0%BE%D1%80%D1%96%D0%B2%D0%BD%D1%8F%D0%BD%D0%BD%D1%96-%D0%B7-%D0%B0%D0%BD%D0%BE%D0%BD%D1%96%D0%BC%D0%BD%D0%B8%D0%BC%D0%B8-%D0%BA%D0%BB%D0%B0%D1%81%D0%B0%D0%BC%D0%B8)
  ###  20.  Функціональний інтерфейс. Стандартні функціональні інтерфейси з пакету java.util.function.
 - [functional interface](https://github.com/nicknema/essentials-Of-Programming/blob/master/QAsem2Lab9.md#2-%D1%89%D0%BE-%D1%82%D0%B0%D0%BA%D0%B5-%D1%84%D1%83%D0%BD%D0%BA%D1%86%D1%96%D0%BE%D0%BD%D0%B0%D0%BB%D1%8C%D0%BD%D0%B8%D0%B9-%D1%96%D0%BD%D1%82%D0%B5%D1%80%D1%84%D0%B5%D0%B9%D1%81)
 - [consumer](https://github.com/nicknema/essentials-Of-Programming/blob/master/QAsem2Lab10.md#6-%D0%B2-%D1%8F%D0%BA%D0%B8%D1%85-%D0%B2%D0%B8%D0%BF%D0%B0%D0%B4%D0%BA%D0%B0%D1%85-%D0%B2%D0%B8%D0%BA%D0%BE%D1%80%D0%B8%D1%81%D1%82%D0%BE%D0%B2%D1%83%D1%94%D1%82%D1%8C%D1%81%D1%8F-%D1%96%D0%BD%D1%82%D0%B5%D1%80%D1%84%D0%B5%D0%B9%D1%81-consumer)
- Function
`xxx -> <R>`
- Function
`yyy -> xxx`
- Predicate
`ххх -> boolean`
- Unary operator
`xxx -> xxx`
- Binary Operator
`xxx, xxx -> xxx`
- Supplier
`void -> xxx`
- Consumer
`xxx -> void`
###  21.  Інтерфейс Function<T,R>. Його основні методи: 
- **R apply(T t),**
    - Applies this function to the given argument.
-   **default <V> Function<T,V> andThen(Function<? super R,? extends V> after),**
    - Returns a composed function that first applies this function to its input, and then applies the after function to the result.
-   **default <V> Function<V,R> compose(Function<? super V,? extends T> before),**
    - Returns a composed function that first applies the before function to its input, and then applies this function to the result.
-   **static <T> Function<T,T> identity().**
    - Returns a function that always returns its input argument.

###  22.  Посилання на методи. Різновиди.
 - [method refference](https://github.com/nicknema/essentials-Of-Programming/blob/master/QAsem2Lab11.md#%D0%BF%D0%BE%D1%81%D0%B8%D0%BB%D0%B0%D0%BD%D0%BD%D1%8F-%D0%BD%D0%B0-%D0%BC%D0%B5%D1%82%D0%BE%D0%B4%D0%B8-method-references)
### 23.  Stream API. Призначення стрімів, властивості, відмінності від колекцій. 
- ![streams and collections](https://github.com/nicknema/essentials-Of-Programming/blob/master/QAsem2Lab12.md#1-%D0%B2-%D1%87%D0%BE%D0%BC%D1%83-%D0%BF%D0%BE%D0%BB%D1%8F%D0%B3%D0%B0%D1%8E%D1%82%D1%8C-%D0%B2%D1%96%D0%B4%D0%BC%D1%96%D0%BD%D0%BD%D0%BE%D1%81%D1%82%D1%96-%D0%BC%D1%96%D0%B6-%D0%BA%D0%BE%D0%BB%D0%B5%D0%BA%D1%86%D1%96%D1%8F%D0%BC%D0%B8-%D1%82%D0%B0-%D1%81%D1%82%D1%80%D1%96%D0%BC%D0%B0%D0%BC%D0%B8)
###  24.  Проміжні та термінальні операції зі стрімами. Pipeline. Типи операцій (eager/lazy, stateless/stateful).
- ![terminal and non-terminal operations](https://github.com/nicknema/essentials-Of-Programming/blob/master/QAsem2Lab12.md#2-%D1%89%D0%BE-%D1%82%D0%B0%D0%BA%D0%B5-%D1%82%D0%B5%D1%80%D0%BC%D1%96%D0%BD%D0%B0%D0%BB%D1%8C%D0%BD%D1%96-%D1%82%D0%B0-%D0%BD%D0%B5%D1%82%D0%B5%D1%80%D0%BC%D1%96%D0%BD%D0%B0%D0%BB%D1%8C%D0%BD%D1%96-%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D1%96%D1%97)
- ![stateless and stateful](https://github.com/nicknema/essentials-Of-Programming/blob/master/QAsem2Lab12.md#3-%D1%89%D0%BE-%D1%82%D0%B0%D0%BA%D0%B5-stateless--%D1%82%D0%B0-stateful--%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D1%96%D1%97-%D0%BD%D0%B0%D0%B2%D0%B5%D0%B4%D1%96%D1%82%D1%8C-%D0%BA%D1%96%D0%BB%D1%8C%D0%BA%D0%B0-%D0%BF%D1%80%D0%B8%D0%BA%D0%BB%D0%B0%D0%B4%D1%96%D0%B2-%D0%BA%D0%BE%D0%B6%D0%BD%D0%BE%D1%97-%D0%B7-%D0%BD%D0%B8%D1%85)
- Pipeline
    - джерело(колекція) -> проміжні операції -> термінальна операція
- ліниві ті які не запускають стрім, нетерплячі ті які його запускають
###  25.  Послідовні та паралельні стріми. Впорядковані та невпорядковані стріми.
- ![sequential, parallel, unordered](https://github.com/nicknema/essentials-Of-Programming/blob/master/QAsem2Lab12.md#12-що-таке-reduction-в-чому-полягає-різниця-між-mutable-reduction-та-immutable-reduction)
###   26.  Операції зі стрімами: filter, map, flatMap.
- ![map and flatMap](https://github.com/nicknema/essentials-Of-Programming/blob/master/QAsem2Lab12.md#6-%D0%B2-%D1%87%D0%BE%D0%BC%D1%83-%D0%BF%D0%BE%D0%BB%D1%8F%D0%B3%D0%B0%D1%94-%D1%80%D1%96%D0%B7%D0%BD%D0%B8%D1%86%D1%8F-%D0%BC%D1%96%D0%B6-%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D1%96%D1%8F%D0%BC%D0%B8-map-%D1%82%D0%B0-flatmap-)
- filter() filters the stream with the given predicate
###   27.  Операції зі стрімами: sorted, distinct, limit, skip, peek, forEach, forEachOrdered.
- ![forEach and forEachOrdered](https://github.com/nicknema/essentials-Of-Programming/blob/master/QAsem2Lab12.md#10-%D0%B2-%D1%8F%D0%BA%D0%B8%D1%85-%D0%B2%D0%B8%D0%BF%D0%B0%D0%B4%D0%BA%D0%B0%D1%85-%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D1%96%D1%97-foreach-%D1%82%D0%B0-foreachordered-%D0%BC%D0%BE%D0%B6%D1%83%D1%82%D1%8C-%D0%BF%D1%80%D0%B8%D0%B7%D0%B2%D0%B5%D1%81%D1%82%D0%B8-%D0%B4%D0%BE-%D1%80%D1%96%D0%B7%D0%BD%D0%B8%D1%85-%D1%80%D0%B5%D0%B7%D1%83%D0%BB%D1%8C%D1%82%D0%B0%D1%82%D1%96%D0%B2)
- ![peek and forEach](https://github.com/nicknema/essentials-Of-Programming/blob/master/QAsem2Lab12.md#7-%D0%B2-%D1%87%D0%BE%D0%BC%D1%83-%D0%BF%D0%BE%D0%BB%D1%8F%D0%B3%D0%B0%D1%94-%D1%80%D1%96%D0%B7%D0%BD%D0%B8%D1%86%D1%8F-%D0%BC%D1%96%D0%B6-%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D1%96%D1%8F%D0%BC%D0%B8-peek-%D1%82%D0%B0-foreach-)
- sorted вказуємо компаратор або метод для порівняння і отримуємо відсортований стрім
- distinct() прибирає копії Returns a stream consisting of the distinct elements (according to Object.equals(Object)) of this stream.
- limit обмежує кількість елементів
###   28.  Операції зі стрімами: min, max, count, average, sum, allMatch, anyMatch, findAny, findFirst.
- ![findAny and findFirst](https://github.com/nicknema/essentials-Of-Programming/blob/master/QAsem2Lab12.md#12-що-таке-reduction-в-чому-полягає-різниця-між-mutable-reduction-та-immutable-reduction)
-  	min(Comparator<? super T> comparator)
- max(Comparator<? super T> comparator)
- count підраховує кількість елементів
- avarage знаходить середнє значення
- anyMatch(Predicate<? super T> predicate)
- allMatch(Predicate<? super T> predicate)
###   29.  Операції зі стрімами: 
- **Optional<T> reduce(BinaryOperator<T> accumulator),**
  - Performs a reduction on the elements of this stream, using an associative accumulation function, and returns an Optional describing the reduced value, if any. This is equivalent to:
  ```java 
      boolean foundAny = false;
         T result = null;
         for (T element : this stream) {
             if (!foundAny) {
                 foundAny = true;
                 result = element;
             }
             else
                 result = accumulator.apply(result, element);
         }
         return foundAny ? Optional.of(result) : Optional.empty();
     ```
  - but is not constrained to execute sequentially.
  - **accumulator** - an associative, non-interfering, stateless function for combining two values
 -  an Optional describing the result of the reduction
  - This is a terminal operation.
- **T reduce(T identity, BinaryOperator<T> accumulator),**
  - Performs a reduction on the elements of this stream, using the provided identity value and an associative accumulation function, and returns the reduced value. This is equivalent to:
    ```java
       T result = identity;
       for (T element : this stream)
           result = accumulator.apply(result, element)
       return result;
   ```
- but is not constrained to execute sequentially.
- **The identity** value must be an identity for the accumulator function. This means that for all t, accumulator.apply(identity, t) is equal to t. The accumulator function must be an associative function.
- This is a terminal operation.
- API Note:
   - Sum, min, max, average, and string concatenation are all special cases of reduction. Summing a stream of numbers can be expressed as:
 ```java
    Integer sum = integers.reduce(0, (a, b) -> a+b);
 ``` 
    or : 
```java
   Integer sum = integers.reduce(0, Integer::sum);
 ```
  - While this may seem a more roundabout way to perform an aggregation compared to simply mutating a running total in a loop, reduction operations parallelize more gracefully, without needing additional synchronization and with greatly reduced risk of data races.
  
- **<U> U reduce(U identity, BiFunction<U,? super T,U> accumulator, BinaryOperator<U> combiner)**.
   - Performs a reduction on the elements of this stream, using the provided identity, accumulation and combining functions. This is equivalent to:
      ```java
         U result = identity;
         for (T element : this stream)
             result = accumulator.apply(result, element)
         return result;
     ```
  - but is not constrained to execute sequentially.
  - The identity value must be an identity for the combiner function. This means that for all u, combiner(identity, u) is equal to u. Additionally, the combiner function must be compatible with the accumulator function; for all u and t, the following must hold:
   ```java
  combiner.apply(u, accumulator.apply(identity, t)) == accumulator.apply(u, t)
  ```
  - This is a terminal operation.
  - identity - the identity value for the combiner function
  - accumulator - an associative, non-interfering, stateless function for incorporating an additional element into a result
  - **combiner** - an associative, non-interfering, stateless function for combining two values, which must be compatible with the accumulator function
  - API Note:
      - Many reductions using this form can be represented more simply by an explicit combination of map and reduce operations. The accumulator function acts as a fused mapper and accumulator, which can sometimes be more efficient than separate mapping and reduction, such as when knowing the previously reduced value allows you to avoid some computation.
 
 ### 30.  Операції зі стрімами: 
  - **<R> R collect(Supplier<R> supplier, BiConsumer<R,? super T> accumulator, BiConsumer<R,R> combiner).**
    - Performs a mutable reduction operation on the elements of this stream. A mutable reduction is one in which the reduced value is a mutable result container, such as an ArrayList, and elements are incorporated by updating the state of the result rather than by replacing the result. This produces a result equivalent to:
  ```java
         R result = supplier.get();
         for (T element : this stream)
             accumulator.accept(result, element);
         return result;
  ```

  - Like reduce(Object, BinaryOperator), collect operations can be parallelized without requiring additional synchronization.
  - This is a terminal operation.
  - API Note:
      - There are many existing classes in the JDK whose signatures are well-suited for use with method references as arguments to collect(). For example, the following will accumulate strings into an ArrayList:
  ```java
    List<String> asList = stringStream.collect(ArrayList::new, ArrayList::add,
                                                              ArrayList::addAll);
  ```
- The following will take a stream of strings and concatenates them into a single string:

```java
    String concat = stringStream.collect(StringBuilder::new, StringBuilder::append,
                                                            StringBuilder::append)
                                                                        .toString();
```
  - **supplier** - a function that creates a new result container. For a parallel execution, this function may be called multiple times and must return a fresh value each time.
- ![reduction and colllect](https://github.com/nicknema/essentials-Of-Programming/blob/master/QAsem2Lab12.md#12-%D1%89%D0%BE-%D1%82%D0%B0%D0%BA%D0%B5-reduction-%D0%B2-%D1%87%D0%BE%D0%BC%D1%83-%D0%BF%D0%BE%D0%BB%D1%8F%D0%B3%D0%B0%D1%94-%D1%80%D1%96%D0%B7%D0%BD%D0%B8%D1%86%D1%8F-%D0%BC%D1%96%D0%B6-mutable-reduction-%D1%82%D0%B0-immutable-reduction)
  
 ### 31.  Optional: призначення, переваги використання, основні операції.
- ![optional](https://github.com/nicknema/essentials-Of-Programming/blob/master/QAsem2Lab12.md#12-що-таке-reduction-в-чому-полягає-різниця-між-mutable-reduction-та-immutable-reduction)
 ###    32.  Пакет java.time. Основні інтерфейси та класи. Переваги у порівнянні з java.util.Date та java.util.Calendar. 
- **The main API for dates, times, instants, and durations.**
- ***Package java.time Description***
  - The classes defined here represent the principle date-time concepts, including instants, durations, dates, times, time-zones and periods. They are based on the ISO calendar system, which is the de facto world calendar following the proleptic Gregorian rules. All the classes are immutable and thread-safe.
 -  Each date time instance is composed of fields that are conveniently made available by the APIs. For lower level access to the fields refer to the java.time.temporal package. Each class includes support for printing and parsing all manner of dates and times. Refer to the java.time.format package for customization options.
  -  The java.time.chrono package contains the calendar neutral API ChronoLocalDate, ChronoLocalDateTime, ChronoZonedDateTime and Era. This is intended for use by applications that need to use localized calendars. It is recommended that applications use the ISO-8601 date and time classes from this package across system boundaries, such as to the database or across the network. The calendar neutral API should be reserved for interactions with users.
  - ***Dates and Times***
    - Instant is essentially a numeric timestamp. The current Instant can be retrieved from a Clock. This is useful for logging and persistence of a point in time and has in the past been associated with storing the result from System.currentTimeMillis().
    - **LocalDate** stores a date without a time. This stores a date like '2010-12-03' and could be used to store a birthday.
   -  **LocalTime** stores a time without a date. This stores a time like '11:30' and could be used to store an opening or closing time.
    - **LocalDateTime** stores a date and time. This stores a date-time like '2010-12-03T11:30'.
    - **ZonedDateTime** stores a date and time with a time-zone. This is useful if you want to perform accurate calculations of dates and times taking into account the ZoneId, such as 'Europe/Paris'. Where possible, it is recommended to use a simpler class without a time-zone. The widespread use of time-zones tends to add considerable complexity to an application.
  - ***Duration and Period***
     - Beyond dates and times, the API also allows the storage of periods and durations of time. A Duration is a simple measure of time along the time-line in nanoseconds. A Period expresses an amount of time in units meaningful to humans, such as years or days.
    - Additional value types
    -  **Month** stores a month on its own. This stores a single month-of-year in isolation, such as 'DECEMBER'.
     - **DayOfWeek** stores a day-of-week on its own. This stores a single day-of-week in isolation, such as 'TUESDAY'.
      -  **Year** stores a year on its own. This stores a single year in isolation, such as '2010'.
       - **YearMonth** stores a year and month without a day or time. This stores a year and month, such as '2010-12' and could be used for a credit card expiry.
     -  **MonthDay** stores a month and day without a year or time. This stores a month and day-of-month, such as '--12-03' and could be used to store an annual event like a birthday without storing the year.
     -  **OffsetTime** stores a time and offset from UTC without a date. This stores a date like '11:30+01:00'. The ZoneOffset is of the form '+01:00'.
     -  **OffsetDateTime** stores a date and time and offset from UTC. This stores a date-time like '2010-12-03T11:30+01:00'. This is sometimes found in XML messages and other forms of persistence, but contains less information than a full time-zone.
  - ***Design notes (non normative)***
    - The API is designed to be type-safe where reasonable in the main high-level API. Thus, there are separate classes for the distinct concepts of date, time and date-time, plus variants for offset and time-zone. This can seem like a lot of classes, but most applications can begin with just five date/time types.
        - **Instant** - a timestamp
       -  **LocalDate** - a date without a time, or any reference to an offset or time-zone
       -  **LocalTime** - a time without a date, or any reference to an offset or time-zone
        - **LocalDateTime** - combines date and time, but still without any offset or time-zone
       -  **ZonedDateTime** - a "full" date-time with time-zone and resolved offset from UTC/Greenwich
     -  **Instant** is the closest equivalent class to java.util.Date. **ZonedDateTime** is the closest equivalent class to java.util.GregorianCalendar.
      - **Where possible, applications should use** **LocalDate**, **LocalTime** and **LocalDateTime** to better model the domain. For example, a birthday should be stored in a code LocalDate. Bear in mind that any use of a time-zone, such as 'Europe/Paris', adds considerable complexity to a calculation. Many applications can be written only using LocalDate, LocalTime and Instant, with the time-zone added at the user interface (UI) layer.
      - The offset-based date-time types **OffsetTime** and **OffsetDateTime**, are intended primarily **for use with network protocols and database access.** For example, most databases cannot automatically store a time-zone like 'Europe/Paris', but they can store an offset like '+02:00'.
     -  Classes are also provided for the most important sub-parts of a date, including **Month, DayOfWeek, Year, YearMonth and MonthDay. These can be used to model more complex date-time concepts**. For example, YearMonth is useful for representing a credit card expiry.
     -   Note that while there are a large number of classes representing different aspects of dates, there are relatively few dealing with different aspects of time. Following type-safety to its logical conclusion would have resulted in classes for hour-minute, hour-minute-second and hour-minute-second-nanosecond. While logically pure, this was not a practical option as it would have almost tripled the number of classes due to the combinations of date and time. Thus, LocalTime is used for all precisions of time, with zeroes used to imply lower precision.
      - Following full type-safety to its ultimate conclusion might also argue for a separate class for each field in date-time, such as a class for HourOfDay and another for DayOfMonth. This approach was tried, but was excessively complicated in the Java language, lacking usability. A similar problem occurs with periods. There is a case for a separate class for each period unit, such as a type for Years and a type for Minutes. However, this yields a lot of classes and a problem of type conversion. Thus, the set of date-time types provided is a compromise between purity and practicality.
      - The API has a relatively large surface area in terms of number of methods. This is made manageable through the use of consistent method prefixes.
         -  *of*  static factory method
           -  *parse*  static factory method focussed on parsing
           -  *get*   gets the value of something
           -  *is*   checks if something is true
           -  *with*   the immutable equivalent of a setter
           -  *plus*   adds an amount to an object
           -  *minus*   subtracts an amount from an object
           -  *to*   converts this object to another type
           -  *at*   combines this object with another, such as date.atTime(time)

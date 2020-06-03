## Основи програмування - 2 ##

  ###  1. Multithreading: основні поняття (Process, Thread, Instance, Scheduler). Кооперативна та витискальна багатозадачність. 
  ###  2. Інтерфейс Runnable та клас Thread. Діаграма станів об’єктів класу Thread.
  ###  3. Стан гонитви. Проблеми, які можуть бути ним спричинені, та способи їх уникнення.
  ###  4. Критична секція. Явне та неявне блокування – переваги та недоліки.
  ###  5. Робота з колекціями у паралельних тредах.
  ###   6. Організація взаємодії між тредами: join, wait-notify.
  ###  7. Треди-демони. Volatile-змінні.
  ###  8. Web-застосунки: основні поняття (HTML, form, HTTP, GET, POST). Статичні та динамічні сторінки. Переваги та недоліки CGI-застосунків у порівнянні з Java web-застосунками.
  ###  9. Servlet API: основні класи та інтерфейси (Servlet, GenericServlet, HttpServlet, Servlet Request, Servlet Response, HttpServletRequest, HttpServletResponse, HttpSession, Cookie).
  ### 10.  Структура web-застосунку (структура папок проекту, файл web.xml).
  ###  11.  JSP: призначення, переваги/недоліки у порівнянні з сервлетами. Життєвий цикл JSP-сторінки.
  ###  12.  JSP-елементи: scripting-, directive- та action- елементи.
  ###  13.  JavaBean. Використання JavaBean в сервлетах та JSP. Області видимості.
  ###  14.  Expression Language: призначення, переваги/недоліки, основні конструкції.
  ### 15.  JSTL: призначення, переваги/недоліки, основні конструкції.
  ###  16.  Патерн MVC.
  ###  17.  Вкладені класи. Призначення вкладених класів. Різновиди вкладених класів (статичні, внутрішні, локальні, анонімні). Захват локальних змінних. Final та effectively final змінні.
  ###  18.  Інтерфейси у Java 8. Статичні методи, методи за замовченням. Проблема ромба.
  ###  19.  Лямбда-вирази. Синтаксис. Переваги та недоліки у порівнянні з анонімними класами.
  ###  20.  Функціональний інтерфейс. Стандартні функціональні інтерфейси з пакету java.util.function.
  ###  21.  Інтерфейс Function<T,R>. Його основні методи: 
  -   **R apply(T t),**
  -   **default <V> Function<T,V> andThen(Function<? super R,? extends V> after),**
  -   **default <V> Function<V,R> compose(Function<? super V,? extends T> before),**
  -   **static <T> Function<T,T> identity().**
  ###  22.  Посилання на методи. Різновиди.
  ### 23.  Stream API. Призначення стрімів, властивості, відмінності від колекцій. 
![streams and collections](https://github.com/nicknema/essentials-Of-Programming/blob/master/QAsem2Lab12.md#1-%D0%B2-%D1%87%D0%BE%D0%BC%D1%83-%D0%BF%D0%BE%D0%BB%D1%8F%D0%B3%D0%B0%D1%8E%D1%82%D1%8C-%D0%B2%D1%96%D0%B4%D0%BC%D1%96%D0%BD%D0%BD%D0%BE%D1%81%D1%82%D1%96-%D0%BC%D1%96%D0%B6-%D0%BA%D0%BE%D0%BB%D0%B5%D0%BA%D1%86%D1%96%D1%8F%D0%BC%D0%B8-%D1%82%D0%B0-%D1%81%D1%82%D1%80%D1%96%D0%BC%D0%B0%D0%BC%D0%B8)
  ###  24.  Проміжні та термінальні операції зі стрімами. Pipeline. Типи операцій (eager/lazy, stateless/stateful).
- ![terminal and non-terminal operations](https://github.com/nicknema/essentials-Of-Programming/blob/master/QAsem2Lab12.md#2-%D1%89%D0%BE-%D1%82%D0%B0%D0%BA%D0%B5-%D1%82%D0%B5%D1%80%D0%BC%D1%96%D0%BD%D0%B0%D0%BB%D1%8C%D0%BD%D1%96-%D1%82%D0%B0-%D0%BD%D0%B5%D1%82%D0%B5%D1%80%D0%BC%D1%96%D0%BD%D0%B0%D0%BB%D1%8C%D0%BD%D1%96-%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D1%96%D1%97)
- ![stateless and stateful](https://github.com/nicknema/essentials-Of-Programming/blob/master/QAsem2Lab12.md#3-%D1%89%D0%BE-%D1%82%D0%B0%D0%BA%D0%B5-stateless--%D1%82%D0%B0-stateful--%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D1%96%D1%97-%D0%BD%D0%B0%D0%B2%D0%B5%D0%B4%D1%96%D1%82%D1%8C-%D0%BA%D1%96%D0%BB%D1%8C%D0%BA%D0%B0-%D0%BF%D1%80%D0%B8%D0%BA%D0%BB%D0%B0%D0%B4%D1%96%D0%B2-%D0%BA%D0%BE%D0%B6%D0%BD%D0%BE%D1%97-%D0%B7-%D0%BD%D0%B8%D1%85)

  ###   25.  Послідовні та паралельні стріми. Впорядковані та невпорядковані стріми.
![sequential, parallel, unordered](https://github.com/nicknema/essentials-Of-Programming/blob/master/QAsem2Lab12.md#12-що-таке-reduction-в-чому-полягає-різниця-між-mutable-reduction-та-immutable-reduction)
  ###   26.  Операції зі стрімами: filter, map, flatMap.
![map and flatMap](https://github.com/nicknema/essentials-Of-Programming/blob/master/QAsem2Lab12.md#6-%D0%B2-%D1%87%D0%BE%D0%BC%D1%83-%D0%BF%D0%BE%D0%BB%D1%8F%D0%B3%D0%B0%D1%94-%D1%80%D1%96%D0%B7%D0%BD%D0%B8%D1%86%D1%8F-%D0%BC%D1%96%D0%B6-%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D1%96%D1%8F%D0%BC%D0%B8-map-%D1%82%D0%B0-flatmap-)
  ###   27.  Операції зі стрімами: sorted, distinct, limit, skip, peek, forEach, forEachOrdered.
- ![forEach and forEachOrdered](https://github.com/nicknema/essentials-Of-Programming/blob/master/QAsem2Lab12.md#10-%D0%B2-%D1%8F%D0%BA%D0%B8%D1%85-%D0%B2%D0%B8%D0%BF%D0%B0%D0%B4%D0%BA%D0%B0%D1%85-%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D1%96%D1%97-foreach-%D1%82%D0%B0-foreachordered-%D0%BC%D0%BE%D0%B6%D1%83%D1%82%D1%8C-%D0%BF%D1%80%D0%B8%D0%B7%D0%B2%D0%B5%D1%81%D1%82%D0%B8-%D0%B4%D0%BE-%D1%80%D1%96%D0%B7%D0%BD%D0%B8%D1%85-%D1%80%D0%B5%D0%B7%D1%83%D0%BB%D1%8C%D1%82%D0%B0%D1%82%D1%96%D0%B2)
- ![peek and forEach](https://github.com/nicknema/essentials-Of-Programming/blob/master/QAsem2Lab12.md#7-%D0%B2-%D1%87%D0%BE%D0%BC%D1%83-%D0%BF%D0%BE%D0%BB%D1%8F%D0%B3%D0%B0%D1%94-%D1%80%D1%96%D0%B7%D0%BD%D0%B8%D1%86%D1%8F-%D0%BC%D1%96%D0%B6-%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D1%96%D1%8F%D0%BC%D0%B8-peek-%D1%82%D0%B0-foreach-)
  ###   28.  Операції зі стрімами: min, max, count, average, sum, allMatch, anyMatch, findAny, findFirst.
![findAny and findFirst](https://github.com/nicknema/essentials-Of-Programming/blob/master/QAsem2Lab12.md#12-що-таке-reduction-в-чому-полягає-різниця-між-mutable-reduction-та-immutable-reduction)
  ###   29.  Операції зі стрімами: 
- **Optional<T> reduce(BinaryOperator<T> accumulator),**
- **T reduce(T identity, BinaryOperator<T> accumulator),**
- **<U> U reduce(U identity, BiFunction<U,? super T,U> accumulator, BinaryOperator<U> combiner)**.
 ###    30.  Операції зі стрімами: <R> R collect(Supplier<R> supplier, BiConsumer<R,? super T> accumulator, BiConsumer<R,R> combiner).
![reduction and colllect](https://github.com/nicknema/essentials-Of-Programming/blob/master/QAsem2Lab12.md#12-%D1%89%D0%BE-%D1%82%D0%B0%D0%BA%D0%B5-reduction-%D0%B2-%D1%87%D0%BE%D0%BC%D1%83-%D0%BF%D0%BE%D0%BB%D1%8F%D0%B3%D0%B0%D1%94-%D1%80%D1%96%D0%B7%D0%BD%D0%B8%D1%86%D1%8F-%D0%BC%D1%96%D0%B6-mutable-reduction-%D1%82%D0%B0-immutable-reduction)
 ###    31.  Optional: призначення, переваги використання, основні операції.
![optional](https://github.com/nicknema/essentials-Of-Programming/blob/master/QAsem2Lab12.md#12-що-таке-reduction-в-чому-полягає-різниця-між-mutable-reduction-та-immutable-reduction)
 ###    32.  Пакет java.time. Основні інтерфейси та класи. Переваги у порівнянні з java.util.Date та java.util.Calendar. 

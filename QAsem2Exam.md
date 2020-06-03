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
  ###  24.  Проміжні та термінальні операції зі стрімами. Pipeline. Типи операцій (eager/lazy, stateless/stateful).
  ###   25.  Послідовні та паралельні стріми. Впорядковані та невпорядковані стріми.
  ###   26.  Операції зі стрімами: filter, map, flatMap.
  ###   27.  Операції зі стрімами: sorted, distinct, limit, skip, peek, forEach, forEachOrdered.
  ###   28.  Операції зі стрімами: min, max, count, average, sum, allMatch, anyMatch, findAny, findFirst.
  ###   29.  Операції зі стрімами: 
- **Optional<T> reduce(BinaryOperator<T> accumulator),**
- **T reduce(T identity, BinaryOperator<T> accumulator),**
- **<U> U reduce(U identity, BiFunction<U,? super T,U> accumulator, BinaryOperator<U> combiner)**.
 ###    30.  Операції зі стрімами: <R> R collect(Supplier<R> supplier, BiConsumer<R,? super T> accumulator, BiConsumer<R,R> combiner).
 ###    31.  Optional: призначення, переваги використання, основні операції.
 ###    32.  Пакет java.time. Основні інтерфейси та класи. Переваги у порівнянні з java.util.Date та java.util.Calendar. 

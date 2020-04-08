
  1. Чим потік вводу-виводу відрізняється від потоку виконання?
     - поток вводу-виводу створений для обміну данними, їх отримання та відправлення
     - поток виконання це певна робота (задача) яку треба виконати, за можливості паралельно із іншою задачею
     - Перший дійсно є потоком (Stream), а другий - насправді Thread (нитка), але колись дуже давно його переклали як потік.Потік (англ. thread) або повніше потік виконання (англ. thread of execution), часто застосовуються назви нитка, нитка виконання та англіцизм тред — в інформатиці так називається спосіб програми розділити себе на дві чи більше паралельні задачі.
     
  2. В яких випадках та яким чином слід синхронізовувати потоки виконання при доступі до спільних ресурсів?
    
      ```java
      Collections.synchronizedSet(mySet);
      public synchronized void myMethod(){
        //some method code
      }
      synchronized (mySet) {
              //some logic
          } 
      ```
  3. Що таке блокуючий і неблокуючий ввід-вивід? 
      -  Blocking - Linear programming, easier to code, less control.
      -  Non-blocking - Parallel programming, more difficult to code, more control.
      
      - Well blocking IO means that a given thread cannot do anything more until the IO is fully received (in the case of sockets this wait could be a long time).
      - Non-blocking IO means an IO request is queued straight away and the function returns. The actual IO is then processed at some later point by the kernel.
      - For blocking IO you either need to accept that you are going to wait for every IO request or you are going to need to fire off a thread per request (Which will get very complicated very quickly).
      - For non-blocking IO you can send off multiple requests but you need to bear in mind that the data will not be available until some "later" point. This checking that the data has actually arrived is probably the most complicated part.
      - Блокирующий ввод-вывод так называется, потому что поток, который его использует блокируется и переходит в режим ожидания, пока ввод-вывод не будет завершен.
Идея неблокирующего ввода-вывода заключается в том, что когда программа делает вызов на чтение файла, ОС вернет ей либо готовые данные либо инфу о том, что ввод-вывод еще не закончен.
  
  4. Що таке критична секція, м’ютекс, монітор?
      - Monitor - высокоуровневый механизм взаимодействия и синхронизации процессов, обеспечивающий доступ к неразделяемым ресурсам.
        При многозадачности, основанной на мониторах, компилятор или интерпретатор прозрачно для программиста вставляет код блокировки-разблокировки в оформленные соответствующим образом процедуры, избавляя программиста от явного обращения к примитивам синхронизации.
      - Mutex - двоичный простейший семафор, который может находиться в одном из двух состояний: отмеченном или неотмеченном. Он отличается от семафора тем, что только владеющий им поток может его освободить, т.е. перевести в отмеченное состояние.
        Задача мьютекса — защита объекта от доступа к нему других потоков, отличных от того, который завладел мьютексом.
        В каждый конкретный момент только один поток может владеть объектом, защищённым мьютексом.
        Если другому потоку будет нужен доступ к переменной, защищённой мьютексом, то этот поток блокируется до тех пор, пока мьютекс не будет освобождён.
      - Critical section - участок кода, в котором производится доступ к общему ресурсу, который не должен быть одновременно использован более чем одним потоком.
        Мьютекс является процедурой входа/выхода из критической секции.
      - Мьютекс обеспечивает механизм, при котором доступ к объекту в определенное время был только у одного потока.
Монитор – это специальный механизм (кусок кода) – надстройка над мютексом, который обеспечивает правильную работу с ним.В Java монитор реализован с помощью ключевого слова synchronized.
Критическая секция — участок исполняемого кода программы, в котором производится доступ к общему ресурсу (данным или устройству), который не должен быть одновременно использован более чем одним потоком выполнения.

  5. Які є переваги/недоліки явного блокування у порівнянні використанням синхронних секцій?
    ![screenshoot](https://github.com/nicknema/essentials-Of-Programming/blob/master/QAsem2Lab7Screenshoot.jpg)
Parameters | Lock Framework |  Synchronized
--------------------- | ----------------------------------------- | -----------------------
Across Methods |	Yes, Locks can be implemented across the methods, you can invoke lock() in method1 and invoke unlock() in method2. |	Not possible
try to acquire lock |	yes, trylock(timeout) method is supported by Lock framework, which will get the lock on the resource if it is available, else it returns false and Thread wont get blocked. |	Not possible with synchronized
Fair lock management |	Yes, Fair lock management is available in case of lock framework. It hands over the lock to long waiting thread. Even in fairness mode set to true, if trylock is coded, it is served first. |	Not possible with synchronized
List of waiting threads | Yes, List of waiting threads can be seen using Lock framework |	Not possible with synchronized
Release of lock in exceptions |	`Lock.lock(); myMethod();Lock.unlock();` unlock() cant be executed in this code if any exception being thrown from myMethod(). |
Synchronized works clearly in this case. It releases the lock

Lock implementations provide more extensive locking operations than can be obtained using synchronized methods and statements. They allow more flexible structuring, may have quite different properties, and may support multiple associated Condition objects.

The use of synchronized methods or statements provides access to the implicit monitor lock associated with every object, but forces all lock acquisition and release to occur in a block-structured way: when multiple locks are acquired they must be released in the opposite order, and all locks must be released in the same lexical scope in which they were acquired.

While the scoping mechanism for synchronized methods and statements makes it much easier to program with monitor locks, and helps avoid many common programming errors involving locks, there are occasions where you need to work with locks in a more flexible way. For example, **some algorithms* for traversing concurrently accessed data structures require the use of "hand-over-hand" or "chain locking": you acquire the lock of node A, then node B, then release A and acquire C, then release B and acquire D and so on. Implementations of the Lock interface enable the use of such techniques by allowing a lock to be acquired and released in different scopes, and allowing multiple locks to be acquired and released in any order.

With this increased flexibility comes additional responsibility. The absence of block-structured locking removes the automatic release of locks that occurs with synchronized methods and statements. In most cases, the following idiom should be used:

When locking and unlocking occur in different scopes, care must be taken to ensure that all code that is executed while the lock is held is protected by try-finally or try-catch to ensure that the lock is released when necessary.

Lock implementations provide additional functionality over the use of synchronized methods and statements by providing a non-blocking attempt to acquire a lock (tryLock()), an attempt to acquire the lock that can be interrupted (lockInterruptibly(), and an attempt to acquire the lock that can timeout (tryLock(long, TimeUnit)).

  6. Що означають терміни thread-safe та fail-fast для колекцій?
    - Thread-safe коллекция - та, которую безопасно использовать в многопоточности.
Fail-fast итератор генерирует исключение ConcurrentModificationException, если коллекция меняется во время итерации

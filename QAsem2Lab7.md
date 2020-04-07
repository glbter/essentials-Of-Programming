
  1. Чим потік вводу-виводу відрізняється від потоку виконання?
     - поток вводу-виводу створений для обміну данними, їх отримання та відправлення
     - поток виконання це певна робота (задача) яку треба виконати, за можливості паралельно із іншою задачею
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
  
  4. Що таке критична секція, м’ютекс, монітор?
      - Monitor - высокоуровневый механизм взаимодействия и синхронизации процессов, обеспечивающий доступ к неразделяемым ресурсам.
        При многозадачности, основанной на мониторах, компилятор или интерпретатор прозрачно для программиста вставляет код блокировки-разблокировки в оформленные соответствующим образом процедуры, избавляя программиста от явного обращения к примитивам синхронизации.
      - Mutex - двоичный простейший семафор, который может находиться в одном из двух состояний: отмеченном или неотмеченном. Он отличается от семафора тем, что только владеющий им поток может его освободить, т.е. перевести в отмеченное состояние.
        Задача мьютекса — защита объекта от доступа к нему других потоков, отличных от того, который завладел мьютексом.
        В каждый конкретный момент только один поток может владеть объектом, защищённым мьютексом.
        Если другому потоку будет нужен доступ к переменной, защищённой мьютексом, то этот поток блокируется до тех пор, пока мьютекс не будет освобождён.
      - Critical section - участок кода, в котором производится доступ к общему ресурсу, который не должен быть одновременно использован более чем одним потоком.
        Мьютекс является процедурой входа/выхода из критической секции.

  5. Які є переваги/недоліки явного блокування у порівнянні використанням синхронних секцій?

  6. Що означають терміни thread-safe та fail-fast для колекцій?

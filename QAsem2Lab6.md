  # MultiThreading
  1. Чим процес відрізняється від треда?

     Процесс (задача) - программа, находящаяся в режиме выполнения.
С каждым процессом связывается его адресное пространство, из которого он может читать
и в которое он может писать данные.
Адресное пространство содержит:
  - саму программу
  - данные к программе
  - стек программы

С каждым процессом связывается набор регистров,например:
  - счетчика команд (в процессоре) - регистр в котором содержится адрес следующей,
  стоящей в очереди на выполнение команды. После того как команда выбрана из памяти, 
  счетчик команд корректируется и указатель переходит к следующей команде.
  - указатель стека

     С каждым потоком связывается:
  - Счетчик выполнения команд
  - Регистры для текущих переменных
  - Стек
  - Состояние 

Потоки делят между собой элементы своего процесса:
  - Адресное пространство
  - Глобальные переменные
  - Открытые файлы
  - Таймеры
  - Семафоры
  - Статистическую информацию.



  Process - процесс обладает автономной средой выполнения.

  Каждый процесс, в частности, имеет собственную область памяти.
  Процесс обычно воспринимается, как синоним выполнению программы или приложения. 
  Однако бывает, что одна приложения занимает несколько процессов.
  Большинство реализаций JVM запускаются в едином процессе.
  Java приложение может создать дополнительный процесс с помощью ProcessBuilder объекта.

  Thread - потоки иногда называют легковесными процессами (lightweight processes). 
  Потоки существуют внутри процесса - каждый процесс обладает хотя бы одним потоком.

  Потоки делят ресурсы процесса, включая память и открытые файлы.
  Приложение может быть как однопоточным, так и многопоточным, но всегда существует 
  единственный "главный" поток, с которого запускается приложение.

• 1 Running program (instance) = 1..N processes
• 1 process = 1..N threads


  2. В чому полягає різниця між кооперативною та витискальною багатозадачністю? 
  Яка з цих моделей реалізована у Java?

  - Вытесняющая многозадачность дословно прерывающая/замещающая  — это вид многозадачности, 
   при которой операционная система принимает решение о переключении между задачами по истечении
   некоего кванта времени
  Решение принимается в соответствии с приоритетами задач. В отличие от кооперативной многозадачности,
  управление операционной системе передаётся вне зависимости от состояния работающих приложений, 
  благодаря чему, в частности, зависшие (к примеру — зациклившиеся) приложения, как правило,
  не «подвешивают» операционную систему. За счёт регулярного переключения задач также улучшается
  отзывчивость системы, оперативность освобождения ресурсов системы, которые больше не используются задачей
  - Совместная или кооперативная многозадачность - Тип многозадачности, при котором следующая задача
  выполняется только после того, как текущая задача явно объявит себя готовой отдать процессорное время
  другим задачам. Как частный случай такое объявление подразумевается при попытке захвата уже занятого
  объекта мьютекс (ядро Linux), а также при ожидании поступления следующего сообщения от подсистемы пользовательского
  интерфейса (Windows версий до 3.x включительно, а также 16-битные приложения в Windows 9x). 
  - витісняюча
  3. Пояснити діаграму станів об’єкта класу Thread. Чим стан «Running» відрізняється від стану «Runnable»?
  ![diaghram](https://github.com/nicknema/essentials-Of-Programming/blob/master/dia1QAsem2lab6.png)
  ![diaghram2](https://javarush.ru/images/article/b4eed106-d52b-448d-92c9-285eb8e82163/original.jpeg)
  4. Коли і як слід використовувати методи run() та start() класу Thread?    
  - start() - запускает данный поток из текущего потока.
      Этот метод вызывает run() метод этого же потока.
  - run() - наследники Thread должны перегружать данный метод. Он вызывается при старте потока.

    Thread.run() or Runnable.run()
    – override
    – never call
    Thread.start()
    – call
    – never override


  5. Чому не слід використовувати deprecated-методи класу Thread?
   Deprecated (в переводе с англ. осужденный) — означает, что функционал устарел (метод, функция) и его лучше не использовать.
   
1. int 	countStackFrames()
Deprecated. 
The definition of this call depends on suspend(), which is deprecated. Further, the results of this call were never well-defined.

2. void 	destroy()
Deprecated. 
This method was originally designed to destroy this thread without any cleanup. Any monitors it held would have remained locked. However, the method was never implemented. If if were to be implemented, it would be deadlock-prone in much the manner of suspend(). If the target thread held a lock protecting a critical system resource when it was destroyed, no thread could ever access this resource again. If another thread ever attempted to lock this resource, deadlock would result. Such deadlocks typically manifest themselves as "frozen" processes. For more information, see Why are Thread.stop, Thread.suspend and Thread.resume Deprecated?.

3. void 	resume()
Deprecated. 
This method exists solely for use with suspend(), which has been deprecated because it is deadlock-prone. For more information, see Why are Thread.stop, Thread.suspend and Thread.resume Deprecated?.

4. void 	stop()
Deprecated. 
This method is inherently unsafe. Stopping a thread with Thread.stop causes it to unlock all of the monitors that it has locked (as a natural consequence of the unchecked ThreadDeath exception propagating up the stack). If any of the objects previously protected by these monitors were in an inconsistent state, the damaged objects become visible to other threads, potentially resulting in arbitrary behavior. Many uses of stop should be replaced by code that simply modifies some variable to indicate that the target thread should stop running. The target thread should check this variable regularly, and return from its run method in an orderly fashion if the variable indicates that it is to stop running. If the target thread waits for long periods (on a condition variable, for example), the interrupt method should be used to interrupt the wait. For more information, see Why are Thread.stop, Thread.suspend and Thread.resume Deprecated?.

5. void 	stop(Throwable obj)
Deprecated. 
This method was originally designed to force a thread to stop and throw a given Throwable as an exception. It was inherently unsafe (see stop() for details), and furthermore could be used to generate exceptions that the target thread was not prepared to handle. For more information, see Why are Thread.stop, Thread.suspend and Thread.resume Deprecated?.

6. void 	suspend()
Deprecated. 
This method has been deprecated, as it is inherently deadlock-prone. If the target thread holds a lock on the monitor protecting a critical system resource when it is suspended, no thread can access this resource until the target thread is resumed. If the thread that would resume the target thread attempts to lock this monitor prior to calling resume, deadlock results. Such deadlocks typically manifest themselves as "frozen" processes. For more information, see Why are Thread.stop, Thread.suspend and Thread.resume Deprecated?.



Разрабочики помечают устаревший метод deprecated. При этом, как правило, добавляется альтернативный новый метод, который рекомендуется к использованию вместо старого. Это нужно для обратной совместимости. Т.е. чтобы с выходом новых версий старый код продолжал работать, как и раньше. Затем, через определенное время или определённое количество версий от deprecated отказываются совсем.

Если появилась новая улучшенная реализация каких то возможностей, то вводится новый функционал, а старый функционал помечается deprecated.

  6. Для чого потрібен метод join()?
  Join - позволяет одному потоку ждать окончание выполнения другого потока.
  join() - заставляет поток ждать не более чем указанное время, чтобы завершиться.
    Реализация данного метода использует цикл с вызовом wait(), который вызывается пока isAlive. 
    После завершения потока вызывается notifyAll() метод.
    Он создан для того, чтобы приложения не использовали методы wait(),notify,notifyAll методы
    из Thread сущностей, так как это не рекомендованно.
    Если не указывать время или указать 0, то поток будет ждать вечно чтобы умереть... пичаль.


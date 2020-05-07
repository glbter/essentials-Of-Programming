   # Stream API
### 1. В чому полягають відмінності між колекціями та стрімами?
- Collections are used to store and group the data in a particular data structure like List, Set or Map. But, streams are used to perform complex data processing operations like filtering, matching, mapping etc on stored data such as arrays, collections or I/O resources. That means, collections are mainly about data and streams are mainly about operations on data.
- You can add to or remove elements from collections. But, you can’t add to or remove elements from streams. Stream consumes a source, performs operations on it and returns a result. They don’t modify even the source also.
- The main specialty of Java 8 Streams is that you need not to worry about iteration while using streams. Streams perform iteration internally behind the scene for you. You just have to mention the operations to be performed on a source.
- Streams are traversable only once. If you traverse the stream once, it is said to be consumed. To traverse it again, you have to get new stream from the source again. But, collections can be traversed multiple times.
- Collections are eagerly constructed i.e all the elements are computed at the beginning itself. But, streams are lazily constructed i.e intermediate operations are not evaluated until terminal operation is invoked.

**JavaDoc**

- No storage. A stream is not a data structure that stores elements; instead, it conveys elements from a source such as a data structure, an array, a generator function, or an I/O channel, through a pipeline of computational operations.
- Functional in nature. An operation on a stream produces a result, but does not modify its source. For example, filtering a Stream obtained from a collection produces a new Stream without the filtered elements, rather than removing elements from the source collection.
- Laziness-seeking. Many stream operations, such as filtering, mapping, or duplicate removal, can be implemented lazily, exposing opportunities for optimization. For example, "find the first String with three consecutive vowels" need not examine all the input strings. Stream operations are divided into intermediate (Stream-producing) operations and terminal (value- or side-effect-producing) operations. Intermediate operations are always lazy.
- Possibly unbounded. While collections have a finite size, streams need not. Short-circuiting operations such as limit(n) or findFirst() can allow computations on infinite streams to complete in finite time.
- Consumable. The elements of a stream are only visited once during the life of a stream. Like an Iterator, a new stream must be generated to revisit the same elements of the source.

### 2. Що таке термінальні та нетермінальні операції?
- Intermediate operations return a new stream. They are always lazy; executing an intermediate operation such as `filter()` does not actually perform any filtering, but instead creates a new stream that, when traversed, contains the elements of the initial stream that match the given predicate. Traversal of the pipeline source does not begin until the terminal operation of the pipeline is executed.
- Terminal operations, such as `Stream.forEach` or `IntStream.sum`, may traverse the stream to produce a result or a side-effect. After the terminal operation is performed, the stream pipeline is considered consumed, and can no longer be used; if you need to traverse the same data source again, you must return to the data source to get a new stream. In almost all cases, terminal operations are eager, completing their traversal of the data source and processing of the pipeline before returning. Only the terminal operations `iterator()` and `spliterator()` are not; these are provided as an "escape hatch" to enable arbitrary client-controlled pipeline traversals in the event that the existing operations are not sufficient to the task. 
### 3. Що таке *stateless-* та *stateful-* операції? Наведіть кілька прикладів кожної з них.
Intermediate operations are further divided into stateless and stateful operations. 
- Stateless operations, such as `filter` and `map`, retain no state from previously seen element when processing a new element -- each element can be processed independently of operations on other elements. Stateful operations, such as distinct and sorted, may incorporate state from previously seen elements when processing new elements.
- Stateful operations may need to process the entire input before producing a result. For example, one cannot produce any results from sorting a stream until one has seen all elements of the stream. As a result, under parallel computation, some pipelines containing stateful intermediate operations may require multiple passes on the data or may need to buffer significant data. Pipelines containing exclusively stateless intermediate operations can be processed in a single pass, whether sequential or parallel, with minimal data buffering. 
### 4. Що таке короткозамкнуті (short-circuiting) операції? Наведіть кілька прикладів кожної з них.
- Some operations are deemed short-circuiting operations. An intermediate operation is short-circuiting if, when presented with infinite input, it may produce a finite stream as a result. A terminal operation is short-circuiting if, when presented with infinite input, it may terminate in finite time. Having a short-circuiting operation in the pipeline is a necessary, but not sufficient, condition for the processing of an infinite stream to terminate normally in finite time. 
### 5. Що означають слова `super` та `extends` у декларації методу `map` класу `Stream`?   `<R> Stream<R> map(Function<? super T,? extends R> mapper)` Чому вони стоять саме так, а не навпаки?
### 6. В чому полягає різниця між операціями `map()` та `flatMap()` ? 
### 7. В чому полягає різниця між операціями `peek()` та `forEach()` ? 
### 8. В чому полягає різниця між операціями `findAny()` та `findFirst()` ? 
### 9. Як і на що впливають проміжні операції `sequential()`, `parallel()` та `unordered()`?
### 10. В яких випадках операції `forEach()` та `forEachOrdered()` можуть призвести до різних результатів?
### 11. Чому деякі методи класу `IntStream` повертають `OptionalInt` (наприклад: `min()`, `max()`, `sum()`), а деякі – примітивний *int* (наприклад: `count()`)?
### 12. Що таке *reduction*? В чому полягає різниця між *mutable reduction* та *immutable reduction*?

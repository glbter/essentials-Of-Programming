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
- `super` => суперклас, предок
- `extends`=> розширює, нащадок
- ![Covariance, contravariance, invariance](https://github.com/nicknema/essentials-Of-Programming/blob/master/QAsem2Lab10.md#7-%D0%BF%D0%BE%D1%8F%D1%81%D0%BD%D1%96%D1%82%D1%8C-%D1%80%D1%96%D0%B7%D0%BD%D0%B8%D1%86%D1%8E-%D0%BC%D1%96%D0%B6-supert-%D1%82%D0%B0-extendst-%D0%B2-%D1%8F%D0%BA%D0%B8%D1%85-%D0%B2%D0%B8%D0%BF%D0%B0%D0%B4%D0%BA%D0%B0%D1%85-%D1%81%D0%BB%D1%96%D0%B4-%D0%B7%D0%B0%D1%81%D1%82%D0%BE%D1%81%D0%BE%D0%B2%D1%83%D0%B2%D0%B0%D1%82%D0%B8-supert-extendst-%D0%B0-%D0%B2-%D1%8F%D0%BA%D0%B8%D1%85-%D0%BF%D1%80%D0%BE%D1%81%D1%82%D0%BE--%D0%B1%D0%B5%D0%B7-super-%D0%B0%D0%B1%D0%BE-extends)
### 6. В чому полягає різниця між операціями `map()` та `flatMap()` ? 
- `flatmap()`
   - Returns a stream consisting of the results of replacing each element of this stream with the contents of a mapped stream produced by applying the provided mapping function to each element. Each mapped stream is closed after its contents have been placed into this stream. (If a mapped stream is null an empty stream is used, instead.
   - The 'flatMap()' operation has the effect of applying a one-to-many transformation to the elements of the stream, and then flattening the resulting elements into a new stream. 
- `map()`
   - returns a stream consisting of the results of applying the given function to the elements of this stream.
   - R - The element type of the new stream
### 7. В чому полягає різниця між операціями `peek()` та `forEach()` ? 
- `peek()`
   - Returns a stream consisting of the elements of this stream, additionally performing the provided action on each element as elements are consumed from the resulting stream. 
   - This is an intermediate operation. 
   - For parallel stream pipelines, the action may be called at whatever time and in whatever thread the element is made available by the upstream operation. If the action modifies shared state, it is responsible for providing the required synchronization.
   - This method exists mainly to support debugging, where you want to see the elements as they flow past a certain point in a pipeline
- `forEach()`
   - Performs an action for each element of this stream.
   - This is a terminal operation.
   - The behavior of this operation is explicitly nondeterministic. For parallel stream pipelines, this operation does not guarantee to respect the encounter order of the stream, as doing so would sacrifice the benefit of parallelism. For any given element, the action may be performed at whatever time and in whatever thread the library chooses. If the action accesses shared state, it is responsible for providing the required synchronization.
### 8. В чому полягає різниця між операціями `findAny()` та `findFirst()` ? 
- `findAny()`
   - The behavior of this operation is explicitly nondeterministic; it is free to select any element in the stream. This is to allow for maximal performance in parallel operations; the cost is that multiple invocations on the same source may not return the same result. (If a stable result is desired, use `findFirst()` instead.)
- `findFirst()` returns an Optional describing the first element of this stream, or an empty Optional if the stream is empty
### 9. Як і на що впливають проміжні операції `sequential()`, `parallel()` та `unordered()`?
-  As nouns the difference between sequence and order is that sequence is a set of things next to each other in a set order; a series while order is (uncountable) arrangement, disposition, sequence.
- As verbs the difference between sequence and order is that sequence is to arrange in an order while order is to set in some sort of order. 
- sequence - последовательность
- order - порядок
- `unordered()` Returns an equivalent stream that is unordered. May return itself, either because the stream was already unordered, or because the underlying stream state was modified to be unordered. 
- `sequential()` Returns an equivalent stream that is sequential. May return itself, either because the stream was already sequential, or because the underlying stream state was modified to be sequential.
- `parallel()` Returns an equivalent stream that is parallel. May return itself, either because the stream was already parallel, or because the underlying stream state was modified to be parallel. 
### 10. В яких випадках операції `forEach()` та `forEachOrdered()` можуть призвести до різних результатів?
- В паралельних потоках виконання (threads) `forEach()` буде виконуватися для перших елементів, яким пощастить потрапити в перший поток.
- `forEachOrdered()` зберігатиме порядок потоку, який існував би без багатопоточності.
### 11. Чому деякі методи класу `IntStream` повертають `OptionalInt` (наприклад: `min()`, `max()`, `sum()`), а деякі – примітивний *int* (наприклад: `count()`)?
```java
public final class Optional<T>
extends Object
```
- A container object which may or may not contain a non-null value. If a value is present, `isPresent()` will return true and `get()` will return the value.
- Additional methods that depend on the presence or absence of a contained value are provided, such as `orElse()` (return a default value if value not present) and `ifPresent()` (execute a block of code if the value is present).
- This is a value-based class; use of identity-sensitive operations (including reference equality (==), identity hash code, or synchronization) on instances of Optional may have unpredictable results and should be avoided.
- у випадку, якщо потік пустий `min()` та `max()` елемент не буде присутнім у потоці (він просто не може існувати). але `count()` буде визначеним, оскільки кількість рівна нулю.
### 12. Що таке *reduction*? В чому полягає різниця між *mutable reduction* та *immutable reduction*?
- A **reduction operation** (also called a fold) takes a sequence of input elements and combines them into a single summary result by repeated application of a combining operation, such as finding the sum or maximum of a set of numbers, or accumulating elements into a list. The streams classes have multiple forms of general reduction operations, called `reduce()` and `collect()`, as well as multiple specialized reduction forms such as `sum()`, `max()`, or `count()`.
- A **mutable reduction operation** accumulates input elements into a mutable result container, such as a Collection or StringBuilder, as it processes the elements in the stream. 
If we wanted to take a stream of strings and concatenate them into a single long string, we could achieve this with ordinary reduction:
   ```java
      String concatenated = strings.reduce("", String::concat)
   ```
   We would get the desired result, and it would even work in parallel. However, we might not be happy about the performance! Such an implementation would do a great deal of string copying, and the run time would be O(n^2) in the number of characters. A more performant approach would be to accumulate the results into a StringBuilder, which is a mutable container for accumulating strings. We can use the same technique to parallelize mutable reduction as we do with ordinary reduction.

   The mutable reduction operation is called collect(), as it collects together the desired results into a result container such as a Collection. A collect operation requires three functions: a supplier function to construct new instances of the result container, an accumulator function to incorporate an input element into a result container, and a combining function to merge the contents of one result container into another. The form of this is very similar to the general form of ordinary reduction:
```java
 <R> R collect(Supplier<R> supplier,
               BiConsumer<R, ? super T> accumulator,
               BiConsumer<R, R> combiner);
``` 

   As with reduce(), a benefit of expressing collect in this abstract way is that it is directly amenable to parallelization: we can accumulate partial results in parallel and then combine them, so long as the accumulation and combining functions satisfy the appropriate requirements. For example, to collect the String representations of the elements in a stream into an ArrayList, we could write the obvious sequential for-each form:
   ```java
     ArrayList<String> strings = new ArrayList<>();
     for (T element : stream) {
         strings.add(element.toString());
     }
  ```
  Or we could use a parallelizable collect form:
```java
     ArrayList<String> strings = stream.collect(() -> new ArrayList<>(),
                                                (c, e) -> c.add(e.toString()),
                                                (c1, c2) -> c1.addAll(c2));
 ```

or, pulling the mapping operation out of the accumulator function, we could express it more succinctly as:
```java
     List<String> strings = stream.map(Object::toString)
                                  .collect(ArrayList::new, ArrayList::add, ArrayList::addAll);
 ```

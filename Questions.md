
  

# Questions

  
1. [x] 1. What are the build modes in flutter?

2. [x] 2.Which types of tests are commonly used with Flutter apps?

3.  [x] What’s the difference between stateful and stateless widget?

4. [x] 4. What is BuildContext?

  

5.  [x] 5. Which data structure does Flutter use to represent all of it’s widgets?

  

6. [ ] 6.Explain the BLoC pattern and what is it

  

7. [x] 7.What is null-safety?

  

8. [x] 8.What is the late modifier in Dart?

  

9. [x] 9.Explain async and await

  

10. [x] 10.What is const in Dart, when can it be used?

  

11. [x] 11.What are Keys in Flutter? Explain the difference between them

  

12. [x] 12.What is navigator in Flutter?

  

13. [x] 13.When to use var and when to use final?

  

14. [ ]  14. What would happen if the BLoC package wasn’t used in conjunction with the Equatable package for state classes (extending state classes with Equatable)? Nudge if no answer: you updated state, but BLoC state class doesn’t extend Equatable, what’s the consequence on the UI?

  

15. [x] 15. Got any other experience with reactive programming?

  

16. [x] 16. Got any other experience with state management libraries?

  

17. [x] 17. Explain SOLID principles

  

  

# Answers

  

  

1. There is three build modes in flutter;

  

-**Debug**: This mode is for developing purpuse only this mode is optimized for hot reload and hot refresh also provides debugging tools and information about the app

-**Profile**: I never used this mode but this mode is for analyzing performance of the application  

-**Realase**: This mode is for production in this mode project optimised for end users of the application. Debug features are disabled in this option.

>There is also headless mode of flutter but it is for testing purposes.

2. There is three test types commonly used in flutter;
* Unit Test
* UI Test
* Integration Test

3. Stateful widgets are immutable objects but they have states in order the track changes and re-render the UI. On the other hand, stateless widgets are also immutable but they can’t change there is state we can call them dumb components. Whenever values change they get destroyed and recreated. Unlike stateful widgets when the state is marked for change when the next frame comes they stay the same but their state and all of their children widgets get replaced with new ones with the new state.

4. Flutter is a framework and ui build with widgets. Those widgets are rendered type of a tree order and widget are placed inside this tree. About the build context every widget has a build function and with this function they can reach build context and build context contain the information such as position of the widget inside the tree etc.

5. As i previously mentioned Flutter uses binary tree for managing widgets position inside application.

  

6. Explain the BLoC pattern and what is it

  

7. By default dart assumes every variable is not null. We can’t define a null variable without explicitly saying we want to use null variable and syntax for this is **?** sign for example;

	```dart:
	String? catName;
	```

	So why is it like that? Because if dart lets you define a null variable fordur down the road you can try to render data inside that variable and the application may crash. To avoid such events dart has Sound Null Safety so dart doesn’t have runtime checks for it. That’s having this features it is performant 

  

8. When we don't initilize a variable compiler will complain and show errors. If we want to initlize a variable later we use ``late `` modifier to say to compiler this variable is not initilized but for sure it is going to be initilized. If we don't initilized the variable and try to use it application will crash. 

  

9. It is used for asynchronous programming. Code is usually interpreted top to bottom and doesn't wait for the previous line to finish execution, which helps for programs to not freeze and program flows if there is no infinite loop or etc. But there is a problem when we need the result of previous code. There are some options like callbacks when code finishes execution. Triggering a function to run this helps with asynchronous programming but increases the complexity of the code so async and await syntax helps. We can declare a function with async so the compiler knows there are some operations inside the function to wait. We should use await keyword for functions which are expensive and time consuming such as getting data from an API.  Compiler waits until the result is resolved then continues with the rest of the function.

  

10. Just like the name suggests const is for constant variables that are immutable variables. There is also another type called **final**. The main difference between finaland const is that you can’t define an object that has a constructor function with const and the creator of the object class should also be const.

  

11. Other than global key, I never used keys they usually work within the framework. Keys maintain the state of the widget. There are global keys and local keys. Local keys must be unique in the same element tree of a parent but the global key should be unique in the entire app. We usually use keys when the widget changes position inside tree update order or delete a widget. One example for the global key is when we use it with form state

  

12. Every application is based on screens or pages to control the current page or page history. There is a stack of pages and we can push or pop pages through the Navigator Widget. This is also compatible with device back buttons. So navigation is controlled by Navigator. Also, we could send parameters to pages with RouteSettings inside Navigator.

  

13. We usually declare our variables with distinct types. Instead of declaring our variables with the types like string, we could use them like this;
	```
	var name = “volkan”;
	```
	This way dart knows that name is the string we don’t need to declare it with a string keyword. We can use this when we don’t know the first value type is going to be but after that dart will throw an error if we set another value type to a variable. 
	The final keyword is the same as var; it can detect variable type when it is initialized. But the difference is that the value is read-only and we can't change the value of the variable. It is like const but const is compiled time constant but final is runtime constant. That means the const variable will always have the same value when the program runs. But final can have different values on runtime. 

14. What would happen if the BLoC package wasn’t used in conjunction with the Equatable package for state classes (extending state classes with Equatable)? Nudge if no answer: you updated state, but BLoC state class doesn’t extend Equatable, what’s the consequence on the UI?

  

15. Yes, I have experience with reactive programming for example I have used react framework. Literally, names come from reactive programming. There are hooks for instance if you use useEffect hook and pass state arrays as a second parameter useEffect hook will observe the passed states and get called when passed states have been changed. Components get re-rendered when states change.

  

16. Yes, I used get package. It is an extremely fast and lightweight package for state management, dependency injection and route management. There is very little boilerplate code. It uses a reactive(Obx) observer model for tracking changing states. Also implements an MVC pattern for the structure of the app.

  

17. SOLID is a group of design principles for OOP;
- **S:** Single-responsibility principle (One class can only be changed for one purpose, which is the responsibility placed on that class.)
- **O:** Open-closed principle (One class or function should preserve existing properties and not allow changes.)
- **L:** Liskov substitution principle (Subclasses can be used in place of (super)classes without making any changes.)
- **I:** Interface segregation principle (More customized multiple interfaces instead of consolidating all responsibilities into a single interface)
- **D:** Dependency Inversion Principle (Dependencies between classes should be as low as possible, especially high-level classes should not depend on lower-level classes)
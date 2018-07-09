# Fruit App

## Developer Prerequisites

### macOS High Sierra

10.13.4 (17E202)

### Xcode

Xcode Version  9.4.1 (9F2000)

### Swift

Apple Swift version 4.1.2 (swiftlang-902.0.54 clang-902.0.39.2)

### Deployment Target 

iOS 10.0

### Cocoapods

Pod Version 1.5.3


### Quick Start Guide 

```git clone https://keran-marinov@bitbucket.org/keran-marinov/fruit-app.git```

```cd fruit-app```

```pod install (In the fruit-app directory where the Podfile is located, Once pod install is completed, It will generate FruitApp.xcworkspace file)```

```open FruitApp.xcworkspace```

```CMD + R```


## Analytics implementation

• Every api request load time is logged in the **ApiClient** class

• Every api request error is tracked in the **ApiClient** class

• Display load is tracked in the **FruitsViewController** class - (delta time between the view did load and view did appear)

• Display load is tracked in the **FruitDetailViewController** class - (delta time between the view did load and view did appear)

• All analytics tracker class is fully unit tested.

### Important

• Regarding the measurement of display load - It is not possible to measure the total time of the api request and screen appearing, since the api request is completed asyncronously, screen is loaded beforehand, with the current implementation there is no screen that is being loaded after the api request completion. I am not sure if the current display load measurement meets the test requirement.

## TEST COVERAGE

70% of the classes are tested, including all the resources, services, view models and view controllers.
There are also http stub tests by using OHTTPStubs library which also enable classes to be tested in integration. Below the service level api requests are tested with http stubbing. At View model level mock service responses are used.


## App Architecture

**MVVM** with Routers and layered service architecture. Dependency injection with Component creator for services and routers.

Main components of MVVM with Routers and Services architecture are

• Router - Navigation

• ViewController - Views

• ViewModel - Model for view controller/Views

• ComponentCreator - Dependency injection for view model, services, routers

• Service - Handle business logic, make api request, read write to disk

• Remote  - Makes api request, convert response into different types

• Dao  -  protocol or class for reading, writing from local storage (if needed)

• Request - api request that has the http request,response and resource 

• Response - it holds the success logic for the request

• Resource - equivalent dto of json object

## Libraries


**RxSwift / RxCocoa**

• Concurrency 

• Binding ui 

• Functional reactive programming style

• Allows easy testing capabilities 

• It enables developer to write more immutable style of coding

**OHTTPStubs**

• For stubbing your network requests

• It enables complex scenarios to be tested in isolation.

• Useful for testing your service layer.

# 

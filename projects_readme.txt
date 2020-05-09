1. i_am_rich:
Learn how to work with MaterialApp, Scaffold, Centre, Image.Network, Image.asset, AppBar, Setting App Icon

2. column_row:
Flutter SafeArea,  Column and Row properties i.e MainAxisAlignment, CrossAxisAlignment, Containers
SizedBox

3. mi_card_flutter :
    - How to import projects from github and run them
    - Column, Adding Circular Image, font properties, ctrl+j for Widget Documentation,
    - Working with Google Fonts
    - Small Icons: (Better than using images for icons because they can be customised)
        https://api.flutter.dev/flutter/material/Icons-class.html
        https://material.io/resources/icons/?style=baseline
        for color choosing & font seraching provided by Flutter:
            https://www.materialpalette.com/
    - Container margin(external to Container) and padding(internal to Container), EdgeInsets
    - How Containers and rows can be replaced by Card and ListTiles to achieve better look
    - Padding can be added as parent class for widgets that doesn't have padding property
    - Divider class used inside SizedBox for adding horizontal line

4. dicee_flutter
    - How to prevent large images from overfitting the screen using expanded Widget i.e expanded widget for flexible layouts
    - flex property of expanded widget for adjusting how much to expand across the main axis
    - How to wrap a widget with a center,row,column widget using flutter inspector and delete parent widget without deleting
        the child widget using the yellow light bulb.
    - Working with flat button which already has a padding for its child widget so if its child was already padded then remove 
        the pading for it
    - Flat Button has on pressed property which is defined by a void callback fucntion which has a syntax (){//your code}
        i.e. it is an anonymous function, function without name
    - Print message in the run window using print();
    - Hot reload accomodate the changes only under the build() function and not outside it
    - Dart data types
        String, int, double and bool
        Dart variables are dynamic (like python and js) when not initialized but static when initialized(like java and cpp)
                eg. var a; //any data type value can be assigned to a
                    var a = 2 //only int values can be assigned to a;
        Data types of dart varibales also can be explicitly declared : 
            String s;
            int a;
            dynamic b; //any data type value can be assigned to b
    - avoid var and dynamic datatypes to prevent code error
    - the body of a Scaffold widget can be a user defined stateless widget class
    - stateful class requires the changing variable value which change the state of the app to be declared under a separate 
        function called setState(){//your code}

5. magic-8-ball-flutter:
    - Using stateful widget inside stateless widget

6. xylophone-flutter:
    - sounds, texts etc are added the same way images are added i.e creating a folder and then updating the assets section
        in the .yaml file
    - how to use already developed flutter packages to reduce work and save development time
    - if floder name is assets then to need to mention folder name while using the images, audio etc. in the assets folder
    - Flutter function : for using kwargs equivalent named arguments, we must enclosed the keywords inside {} .Eg
            print(add(n1:1, n2:11));

            int  add( {int n2,int n1} ){
                return n1+n2;
            }
    - free sound website : https://freesound.org/

7. quizzler-flutter
    - working with List<widgets> or List<Icon>
    - to mark that a typo is not wrong word but a unique word for you, right click the word and on spelling
        set it accordingly
    - dart classes and objects, abstraction, encapsulation, inheritance, polymorphism
    - abstraction : dividing a huge class into smaller and simpler classes for easy use and scalability
    - encapsulation : making class properties(variable, list etc) private by just starting the name by an underscore "_"
    - inheritance : class a inherits class b by typing, class a extends b
    - polymorphism : child class a of parent class b overrides a method by typing @overrride above it.
            eg. class Parent{
                void printAge(){
                    print('I am 55');
                }
            }
                
                class Child extends Parent{
                    @override
                    void printAge(
                        print('I am 20');
                    )
                }
            a child class can also carry on the method of parent and also add some new things to it by :
                classes SecondChild extends Parent{
                    @overrride
                    void printAge(){
                        super.printAge();
                        print('Tommorow is my birthday');  
                    }
                }
                on calling it, the console will print :
                I am 55
                Tommorow is my birthday
    - RFlutter Alert is super customizable and easy-to-use alert/popup dialogs for Flutter.
    - class constructor shortcut => ClassName({this.property1,this.property2});

8. destini
    - adding image to Container using decoration property: 
        https://github.com/londonappbrewery/destini-challenge-completed/commit/75dc146209227fe80020115498156363fad50d69
        https://stackoverflow.com/questions/52211283/inserting-image-into-a-container-flutter-app
    - visibility widget to make button disappear when they are not needed

9. bmi-calculator
    - browser app for knowing the hex code of any color present in an image 
        https://www.colorzilla.com/ [get the color of any pixel or area on the page]
    - using custom color Color(0xFF"hex value of your color") ->FF means the opacity is 100%
    - how to have curve edged borders
    - if a child and a parent has a common property, it must be declared in the child otherwise the app will crash. Eg.
        while using decoration BoxDecoration inside Container for adding curve edges to the conatiner, the color of the conatiner
        must be specified inside the BoxDecoration.
    - Expanded widget is used so that child widgets don't go out of shape when changing screen sizes or oreintations,
        it should replace height and width property of the child container.
    - if a set of hierarchical widgets are repetitive u can develop a new widget out of this, by
        1. selecting the top-most parent widget
        2. Go to flutter outline
        3. Right click on the selected widget 
        4. Select Extract Widget
        5. Give a name for ur custom widget
        6. Now u can use it just by calling its name
    - to make an argument compulsory put @required infront of it. For eg when declaring class constructor
    - const vs final:
        - variables of both types are immutable i.e they can't be reassigned any value once initialized
        - both are similar, but const variables can't be assigned to some functions that returns an output at runtime like
            DateTime.now(). I.e its scope is only upto compile time.
        - const should be used for numbers or explicitly hardcoded values. And final must be assigned values that have indirect
            or implicit assignment
        - font awesome flutter package used that have onPressed functionality on icons -- INCORRECT
        - the problem with flat button is that it overrides the design inside the child widget. So instead use
            GestureDetector widget which has many other functions like onTap and other gestures and it don't impact the design
            in the child widget
        - Dart enums useful when a varibale can take finite values. Eg carTypes
        - Dart Ternary Operators (used in place of if and else for one line code like =>)
        - Dart functions are first order objects meaning they can be pass as arguments in other function as well like:
            int calculator(int a,int b, Function functionName){
                return functionName(a,b);
            }
            or even
            Function calculator = (int a,int b, Function functionName){return functionName(a,b);}
        - Functions are called when () is put after their name or else they are like a varibale which can be assigned some values
            or can be passed as parameters to other function.
        - Its a convention to name all constants starting with 'k' like 'const kHeight=...' so that whenever u type k android
            studio will list out all the constants for you.
        - Making Text() of different font size align to the same baseline provided these widgets are under the same row:
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic, //this line is important, without this your app will crash
        - IMP : HOW TO CHANGE ONLY SPECIFIC VALUES OUT OF ALL REQUIRED VALUES for a property OF a Widget : 
                property = ParentWidget.of(context).copyWith(
                    specific_values[....]
                )
        - navigation between screens(routes) in flutter is like stack push and pop
        - context is the BuildContext of current widget and it determines the location of it
        - learn how to toggle between android and ios platform using the same device.
        - home and initialRoute property can never exist together because they conflict with each other
        - use named routes when there are 3 screens or more other wise use the simpler route method for navigation
        - dart map data structure:
            Map<KeyType, ValueType> mapName{
                Key : Value,
            }
        - Expanded can't be a direct child of scaffold widget
        - passing values between two screens using class constructors

10. Clima weather app
    - packages used:
        geolocator: ^5.3.1
        http: ^0.12.1
        flutter_spinkit: ^4.1.2
    - permissions for android - android/app/src/main/AndroidManifest.xml
        permissions for ios - ios/Runner/Info.plist
    - for using location of the ios simulator enable location to apple in the features menu of the simulator
    - synchronous -> code executes line by line no matter how much a code line has to wait for the previous line to finish.
    - asynchronous -> if a line is taking more time then next line gets executed while the current line is executing on 
                        background.
    - how to use async await and Future
    - lifecycle of widgets:
        stateless : only build method. They are created and destroyed but can't be modified i.e their state can't be changed
        stateful : init, build and deactivate. Their state can change
                    init : put your code here if u want it to run when the stateful widget is created and added to the tree
                    build : put your code here if u want it to run again and again whenever the stateful is build and rebuild
                    deactivate : put your code here if u want it to run when the stateful widget gets destroyed
    - dart exception handling, try{}, catch(e){} and throw '';
    - ?? in dart i.e Null aware operator
       int x = y ?? 2;
       if y!=null x=y else x=2. i.e 2 is the default value for x
    - we can use await only infront of functions that has Future<> return value
    - while using an api always check the status code first. If it is 200 then proceed else print the error statys code.
    - use of dart alias -> 'as' eg.
        import 'package:http/http.dart';
        void getData() async {
            Response response = await get('https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=439d4b804bc8187953eb36d2a8c26a02');
            if (response.statusCode == 200) {
                print(response.body);
            } else
                print(response.statusCode);
        }
        using as to make the code clearer because get is not actually defined by the user.
        import 'package:http/http.dart' as http;
        void getData() async {
            http.Response response = await http.get('https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=439d4b804bc8187953eb36d2a8c26a02');
            if (response.statusCode == 200) {
                print(response.body);
            } else
                print(response.statusCode);
        }
    - dart package for working with json 
        import 'dart:convert';
        and then jsonDecode(json)[path to key][path to key]...
    - api and api keys for openweathermap.org to get weather information from any lat and long. Otherwise u have to work with
        sample json data only
    - learn how to pass data from another class to a class and then to its state object by using widget.dataName
    - how to use string interpolation for objects that are connected by . :
        '${kadum.perme}'
    - emojis are String and can be used as text in Text() widget
    - learn about TextField() for taking input from users.
    - rounding TextField's border. Inside the InputDecoration():
        border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
    - taking input from TextField(). Poperty is:
        onChanged: (value) {
                    print(value);
                  },
    - learn how to pass back data from current screen to previous screen.

11. Bitcoin-Ticker
    - learned about DropdownButton<T>();
    - using loop to add list of DropdownMenuItem to the DropdownButton.
    - how to use cupertino ios widgets like the rotating dropdown menu i.e CupertinoPicker.
    - you can't add into a list until you have initialized i.e
        List<T> listName = [];    otherwise app will crash. 
    - learned how to build platform specific [ios or android] using the same project.
    - dart show and hide to import specific libraries.
    - how to make list of widgets for column and return the column as a child of another parent widget:
        ////For bonus points, create a method that loops through the cryptoList and generates a CryptoCard for each. 
        Call makeCards() in the build() method instead of the Column with 3 CryptoCards.
                Column makeCards() {
                    List<CryptoCard> cryptoCards = [];
                    for (String crypto in cryptoList) {
                    cryptoCards.add(
                        CryptoCard(
                        cryptoCurrency: crypto,
                        selectedCurrency: selectedCurrency,
                        value: isWaiting ? '?' : coinValues[crypto],
                        ),
                    );
                    }
                    return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: cryptoCards,
                    );
                }
12. flash-chat
    - packages used:
        modal_progress_hud: ^0.1.3 //for adding a spinning wheel while user is logging in or registering.
    - learn about static Modifier. Use to define variables and metgods for a class that can be accessed without 
        using object of that class.
        For eg:
        class Abc{ 
            String id = 'abc'; 
            static String uid='ABC'; 
        }
        print(Abc().id); // out: abc
        print(Abc.uid); // out : ABC ... no class object created and used which is more efficient
    - whenever u declare a const var inside a class it has to static otherwise there will be error. Because a const property 
        should be equal and static i.e not dynamic for every object.
    - use staic const String for every named routes.
    - Learned about flutter animations:
        - Hero Animation
        - Custom Animation
            - AnimationController [vsync,ticker,controller.value] -> for linear animations
                controller.forward();
                controller.reverse(from:1.0) //means start from 1.0 to 0
            - Animation -> [applied on top of animation controller]for curved animations
                - expects a double value with upperbound of 1.0 otherwise the app will crash if upperbound > 1.0
                - CurvedAnimation()
                - Tween()
                    - Eg:ColorTween() //for smooth animation of colors
                    - Other are also there like for border,etc.
                    - All they do is take a begin and an end value and animate between them.
        - Flutter animation packages by developers
    - with Modifier adds more capability to a class
    - addListerner class for seeing how an animation works or listening to a function, specially its changing values.
    - learn about default dispose method. Here u can put your code which will run when a screen is exited or disposed.
        Its optimal to dispose animation in dispose method otherwise they will run in the background forever.
    - Dart 'mixin' : (they are like classes)
        We can only 'extend' a single parent class but we can add multiple capabalities to a class 'with' multiple 'mixins'
        Eg.
        mixin CanWrite{void write(){print('I can write');}}
        mixin CanRead{void read(){print('I can read');}}
        class Kadum with CanWrite,CanRead{}
        void main(){
            Kadum().write();
            Kadum.read();
        }
    - .coyWith() used to edit only some of the properties of a widget.
    - TextField() IMP properties for login and registration:
        keyboardType: TextInputType.emailAddress, //for using keyboard specially for emails.
        obscureText: true, //for making text not readable ie replacing chars with dots.
    - firebase stream for listening(more specially subscribing) to changes made in the database 
    - Dart Streams:
                  Already available           Need to wait
        Singular        String                  Future<String>
        Plural       List<String>               Stream<String>
    - how to convert snapshots of stream datas to widget using StreamBuilder<T> class or widget.
    - CircularProgressIndicator() is the spinner our modal_progress_hud was based. It can be used until the app is
        receiving data in the background
    - how to use flutter ListView() which is much simpler than the native ones.
        -IMP: wrap it with expanded widget otherwise nothing will be visible on the screen.
    - how to create custom text bubbles like most in chat apps.
    - property for adding shadow:
        elevation:
    - TextEditingController() for removing text from a TextField() after the user input is completed and the 
        confirmation button is pessed.
    - fixing hero animation to adapt different screen aspect ratios using Flexible() widget wrap over it.

13. todoey
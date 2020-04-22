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
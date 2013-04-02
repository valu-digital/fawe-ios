iOS Font Awesome Library
========

FAWE is a library (or XCode project actually) that provides new UI controls and extensions to 
native UI controls that both leverage the excellent Font Awesome icon font.

Instead of creating an image for each icon in your application, you can now start using 
Font Awesome icons, even with the default controls, such as UIButton.

Currently FAWE contains:
- extension to NSString (thanks to [Alex Usbergo](https://github.com/alexdrone/ios-fontawesome) )
- extension to UIFont (thanks to [Alex Usbergo](https://github.com/alexdrone/ios-fontawesome) )
- extension to UIButton
- FAWEIconView

<img src="https://github.com/mediacabinet/fawe-ios/blob/master/FAWE/example.png?raw=true" width="470" height="310" style="border: 1px solid #7e8394" />

Using FAWE
-------------------

Requirements:
- FAWE requires iOS 6.0 or greater (not tested on previous versions)
- ARC (Automatic Reference Counting) must be enabled


Step by step:

1. Drag & drop the .h and .m classes to your project (you may omit the FAWEAppDelegate files)
2. Drag & drop FontAwesome.ttf to your project
3. Find your **ProjectNameGoesHere-Info.plist** file and add property **Fonts provided by application** (unless it already exists)
4. Add new item under **Fonts provided by application** and set its value to **FontAwesome.ttf**

FAWEIconView
-------------------

FAWEIconView is the basis of any iconic UI control. It can be used as a standalone component or, 
thanks to UIButton+FAWE, with standard UIButton. 

Besides of simply rendering the icon with desired size and color, FAWEIconView also supports
inner shadow and gradient color. These features make it easy to create stunning icons
that scale perfectly.

Example of initializing FAWEIconView with icon size 20 and a linear gradient color from white to black:
```objectivec
FAWEIconView *gradientIcon = [[FAWEIconView alloc] initWithIcon:FAWEIconAmbulance
                                                       withSize:20
                                                      andOrigin:CGPointZero];

[gradientIcon setGradientWithColors:[NSArray arrayWithObjects:
                                     [UIColor whiteColor],
                                     [UIColor blackColor],
                                     nil]
                       andLocations:nil];
```
        
More examples
-------------------

For more examples, see **FAWEAppDelegate.m**. To see the icons in action, simply clone the repository, open the project in your XCode and run in the device or simulator.

License
-------------------

The source code of this project is licensed under BSD-3.

Related projects and their licenses:
 - [Font Awesome](http://fortawesome.github.com/Font-Awesome/#license)
 - [Font Awesome fix for iOS](https://github.com/leberwurstsaft/FontAwesome-for-iOS)
 - [Alex Usbergo's ios-fontawesome](https://github.com/alexdrone/ios-fontawesome)


iOS Font Awesome Library
========

FAWE is a library (or XCode project actually) that provides new UI controls and extensions to 
native UI controls that both leverage the excellent Font Awesome icon font.

Instead of creating an image for each icon in your application, you can now start using 
Font Awesome icons, even with the default controls, such as UIButton.

Currently FAWE provides you
- extension to NSString (thanks to [Alex Usbergo](https://github.com/alexdrone/ios-fontawesome) )
- extension to UIFont (thanks to [Alex Usbergo](https://github.com/alexdrone/ios-fontawesome) )
- extension to UIButton
- FAWEIconView

FAWEIconView
-------------------

FAWEIconView is the basis of any iconic UI control. It can be used as a standalone component or, 
thanks to UIButton+FAWE, as a part of standard UIButton. 

Besides of simply rendering the icon with desired size and color, FAWEIconView also supports
inner shadow and gradient color. These features make it easy to easily create stunning icons
that scale perfectly.

Example of creating FAWEIconView with gradient color:
```objectivec
FAWEIconView *gradientIcon = [[FAWEIconView alloc] initWithIcon:FAWEIconAmbulance withSize:20.0f andOrigin:CGPointZero];
[gradientIcon setGradientWithColors:[NSArray arrayWithObjects:[UIColor whiteColor], [UIColor blackColor], nil] andLocations:nil];
[view addSubview:gradientIcon];
```
        

License
-------------------

The source code of this project is licensed under BSD-3.

Related projects and their licenses:
 - [Font Awesome](http://fortawesome.github.com/Font-Awesome/#license)
 - [Font Awesome fix for iOS](https://github.com/leberwurstsaft/FontAwesome-for-iOS)
 - [Alex Usbergo's ios-fontawesome](https://github.com/alexdrone/ios-fontawesome)


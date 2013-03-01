YKTabBarController
==========

YKTabBarController is a customizable tabbar controller for iOS.

# Features #

- Customization of design(foreground/background image, title and color).
- Receiving notification of 'change selected index' and 'pop to top'.
- Simple implementation.

# ARC #

YKTabBarController uses ARC.

# Installation #

- Copy the YKTabBarController/ subfolder into your project.
- Import "YKTabBarController.h" wherever you need it.

# Usage #

`
YKTabBarController *c = [[YKTabBarController alloc] init];
[c setViewControllers:[NSArray arrayWithObjects:vc0, vc1, nil]];

// normarl image
[c.tabBar setImage:normalImage0 atIndex:0 forState:UIControlStateNormal];
[c.tabBar setImage:normalImage1 atIndex:1 forState:UIControlStateNormal];

// selected image
[c.tabBar setImage:selectedImage0 atIndex:0 forState:UIControlStateSelected];
[c.tabBar setImage:selectedImage1 atIndex:1 forState:UIControlStateSelected];

// normal background image
[c.tabBar setBackgroundImage:bgImage0 atIndex:0 forState:UIControlStateNormal];
[c.tabBar setBackgroundImage:bgImage1 atIndex:1 forState:UIControlStateNormal];

// selected background image
[c.tabBar setBackgroundImage:selectedBgImage0 atIndex:0 forState:UIControlStateSelected];
[c.tabBar setBackgroundImage:selectedBgImage1 atIndex:1 forState:UIControlStateSelected];

// tab title
[c.tabBar setTitle:@"Tab0" atIndex:0 forState:UIControlStateNormal];
[c.tabBar setTitle:@"Tab1" atIndex:1 forState:UIControlStateNormal];

// tab title normal color
[c.tabBar setTitleColor:UIColorFromRGBA(0xa7a7a7ff) atIndex:0 forState:UIControlStateNormal];
[c.tabBar setTitleColor:UIColorFromRGBA(0xa7a7a7ff) atIndex:1 forState:UIControlStateNormal];

// tab title selected color
[c.tabBar setTitleColor:UIColorFromRGBA(0xffbe07ff) atIndex:0 forState:UIControlStateSelected];
[c.tabBar setTitleColor:UIColorFromRGBA(0xffbe07ff) atIndex:1 forState:UIControlStateSelected];

// select first tab
[c.tabBar setSelectedItem:[c.tabBar itemAtIndex:0]];
`

# License #

YKTabBarController is available under the MIT License.

Copyright (c) 2013 Yoshiki Kurihara

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

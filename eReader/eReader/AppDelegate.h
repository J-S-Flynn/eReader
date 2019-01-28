//
//  AppDelegate.h
//  eReader
//
//  Created by J.S.Flynn on 13/05/2016.
//  Copyright © 2016 J.S.Flynn. All rights reserved.
//  Student ID: 201037312

//import header files.
#import <Cocoa/Cocoa.h>

//declare objects and methods in interface

@interface AppDelegate : NSObject <NSApplicationDelegate>

//object declaration
@property (weak) IBOutlet NSButton *prePage ; // Previous Page Button

@property (weak) IBOutlet NSButton *nePage ; // next Page Button

@property (weak) IBOutlet NSTextField *thePage ; // Page Container for text

@property (weak) IBOutlet NSTextField *pageNumber ; // displays page number

@property (weak) IBOutlet NSTextField *setPage ; // text field for entering the desired page

@property (weak) IBOutlet NSSlider *pageSlider ; // page selection slider

@property (weak) IBOutlet NSImageView *coverPage; // image container for cover pictuer


//declaration of methods

- (IBAction)loadBook:(id)sender; // Loads A New Book

- (IBAction)searchPageSlider:(id)sender; // Sets Page Number And Page By Slider

- (IBAction)nextPage:(id)sender; // Navagates To Next Page

- (IBAction)previousPage:(id)sender; // Navagates To The Previous Page

- (IBAction)enterPage:(id)sender; // Takes User Input To Select Page

- (void)updateAction ; // Updates The Infromation On The Page

@end


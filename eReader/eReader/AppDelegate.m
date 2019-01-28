//
//  AppDelegate.m
//  eReader
//
//  Created by J.S.Flynn on 13/05/2016.
//  Copyright © 2016 J.S.Flynn. All rights reserved.
//  Student ID : 201037312

/*
* This programme was finished on time and would have been submitted on time but there where a number of small issues that I could
* notresolvein the end i found that this was actualy a problen with the txt file. there where only nine splits ( #NS# ) in the code
* rather than ten. once i added this all of the issues that where there dissapered. I mention this as it may have been an issue for
* others.
*/


// import header files
#import "AppDelegate.h"

// define appDelagate methods, variabls and objects
@interface AppDelegate ()



@property (weak) IBOutlet NSWindow *window; // the main view window
@end

// implaments appDelagate and defines non inherated variables
@implementation AppDelegate{
    
    int pageNum ; // declars a veriable to hold the value for page number
    int slideVal ; // declares a veriable to hold the value of slide bar
    
    NSString * file ; // declars a new NSString
    NSArray * page ; //declares a new NSArray
    NSImage * cover ; // declares a new NSImage
    NSOpenPanel * loadPanel ; //declares a new NSOpenPanel
    NSURL * bookURL ; //declars a new NSURL
    NSURL * coverURL ; //declares a new NSURL
    
}

//sets the scean for how the aplication should act on open
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [self.pageNumber setIntValue:0] ; // sets the page number to 0
    [self.pageSlider setIntValue:0] ; // sets the slider to the o position
    [self.prePage setHidden:true] ; // sets the previous page button to hidden
}

//sets how the aplication shold act on closure
- (void)applicationWillTerminate:(NSNotification *)aNotification{

}

// responcible for updating the information in the programe after button clicks
// depending on the value of page number (pageNum)
-(void) updateAction{
    
    
    if(pageNum == 0){
        [self.prePage setHidden:true] ; // hides previous page button
        [self.coverPage setHidden:false] ; // shows cover page
    }
    if (pageNum > 0) {
        [self.prePage setHidden:false] ; // shows previous page button
        [self.coverPage setHidden:true] ; // hides cover image
    }
    if (pageNum < 10) {
        [self.nePage setHidden:false] ; // shows next page button
    }
    if (pageNum == 10) {
        [self.nePage setHidden:true] ; // hides next page button
    }
    
}

//loads a new book into the sytem
- (IBAction)loadBook:(id)sender{
    
    loadPanel = [NSOpenPanel openPanel] ; // initalises loadPanal
    
    //if load panel has been pressed open the finder window to select a file
    if ([loadPanel runModal] == NSFileHandlingPanelOKButton) {
        
        bookURL = [loadPanel URL] ; // sets the book url to the url of the selected .txt file
        
        // sets the contents of the book to NSString (file) then file is split into the NSArray (page) where it comes acrose
        // the user defines string #NS#
        file = [NSString stringWithContentsOfURL: bookURL encoding: NSASCIIStringEncoding error: NULL] ;
        page = [file componentsSeparatedByString:@"#NP#"] ;
        
        // cover image is selected by appending .jpg  to the exstention of the book eg. crybaby.txt.jpg
        // assines the cover to NSImage
        coverURL = [bookURL URLByAppendingPathExtension:@"jpg"] ;
        cover = [[NSImage alloc] initWithContentsOfURL: coverURL] ;
        
        [self.coverPage setImage:cover] ; // sets the image in NSImage cover to the NSImageView coverPage
        
        [self updateAction] ; // calls the update method to update all objects
    }
}

//sets the pageSlider
- (IBAction)searchPageSlider:(id)sender {
    
    [self.pageNumber setIntValue:[self.pageSlider intValue]]; // sets the page number to the int value selected by the slider
    pageNum = [self.pageSlider intValue] ; // updates the pageNum variable
    [self.thePage setStringValue:[page objectAtIndex:pageNum]] ; // sets the text in the textFild to the NSArray[pageNum]
    
    [self updateAction] ; // updates the view
}

// sets the next page button
- (IBAction)nextPage:(id)sender {
    
    [self.pageNumber setIntValue: ++pageNum] ; // incraments pageNum with each click
    [self.pageSlider setIntValue:pageNum] ; // sets the slider value to pagNum
    [self.thePage setStringValue:[page objectAtIndex:pageNum]] ; // sets the text in the main textField to NSArray[pageNum]
   
    [self updateAction] ; // updates the view

}

//sets previous button
- (IBAction)previousPage:(id)sender {

    [self.pageNumber setIntValue:--pageNum] ; // decraments pageNum with each click
    [self.pageSlider setIntValue:pageNum] ; // sets the slider value to pageNum
    [self.thePage setStringValue:[page objectAtIndex:pageNum]] ; // sets the text in the main textField to NSArray[pageNum]
   
    [self updateAction] ; // updates the view
}

// sets the input field for the page entry
- (IBAction)enterPage:(id)sender {
    
    [self.pageNumber setIntValue:[self.setPage intValue]] ; // sets the page number to the the entered value
    [self.pageSlider setIntValue:[self.setPage intValue]] ; // sets the value of the pageSlider to the entered value
    pageNum = [self.setPage intValue] ; // updates the pageNum variable
    [self.thePage setStringValue:[page objectAtIndex:pageNum]] ; // sets the text in the main TextField to NSArray[pageNum]
    
    [self updateAction] ; // updates the view 
}
@end

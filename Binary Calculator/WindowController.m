//
//  WindowController.m
//  Binary Calculator
//
//  Created by Marco Albera on 12/08/16.
//  Copyright © 2016 Edge Apps. All rights reserved.
//

#import "WindowController.h"

@interface WindowController ()

@end

@implementation WindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    [self hideTitleBar];
}

- (void)hideTitleBar {
    [[self window] setTitleVisibility:NSWindowTitleHidden];
    [[self window] setTitlebarAppearsTransparent:true];
    [[self window] setStyleMask:[[self window] styleMask]|NSFullSizeContentViewWindowMask];
}

@end

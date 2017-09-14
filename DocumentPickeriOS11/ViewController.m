//
//  ViewController.m
//  DocumentPickeriOS11
//
//  Created by Stéphano TELOLAHY on 14/09/2017.
//  Copyright © 2017 Stéphano TELOLAHY. All rights reserved.
//

#import "ViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController ()<UIDocumentPickerDelegate>

@end

@implementation ViewController

#pragma mark - IBAction

- (IBAction)importItemAction:(id)sender {
    
    NSArray *documentTypes = @[(NSString*)kUTTypePDF,(NSString*)kUTTypePNG,(NSString*)kUTTypeJPEG];
    UIDocumentPickerViewController *controller = [[UIDocumentPickerViewController alloc] initWithDocumentTypes:documentTypes inMode:UIDocumentPickerModeImport];
    controller.delegate = self;
    
    //[self updateiCloudBarButtonStyle];
    
    [self presentViewController:controller animated:YES completion:^{
        
        // Try to hack internal viewcontroller style
        if (@available(iOS 11.0, *)) {
            assert(controller.childViewControllers);
            UIDocumentBrowserViewController *browserController = (UIDocumentBrowserViewController *)controller.childViewControllers[0];
            assert(browserController);
            browserController.browserUserInterfaceStyle = UIDocumentBrowserUserInterfaceStyleDark;
        }
    }];
}


#pragma mark - UIDocumentPickerDelegate

- (void)documentPicker:(UIDocumentPickerViewController *)controller didPickDocumentsAtURLs:(NSArray <NSURL *>*)urls {
    //[self updateDefaultBarButtonStyle];
}

- (void)documentPickerWasCancelled:(UIDocumentPickerViewController *)controller {
    //[self updateDefaultBarButtonStyle];
}


#pragma mark - UIBarButtonStyles

- (void)updateiCloudBarButtonStyle {
    [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UINavigationBar class]]] setTintColor:[UIColor redColor]];
}

- (void)updateDefaultBarButtonStyle {
    [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UINavigationBar class]]] setTintColor:[UIColor whiteColor]];
}

@end

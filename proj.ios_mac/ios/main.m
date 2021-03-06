#import <UIKit/UIKit.h>
#include "Platform.h"

int main(int argc, char *argv[]) {
    // Set the bank base path
    NSString* bankPath = [NSString stringWithFormat:@"%@/iOS/", [[NSBundle mainBundle] resourcePath]];
    strncpy(g_szBasePath, [bankPath UTF8String], AK_IOS_MAX_BANK_PATH);
    g_szBasePath[AK_IOS_MAX_BANK_PATH-1] = '\0';
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    strncpy(g_szDocumentsPath, [documentsPath UTF8String], AK_IOS_MAX_DOCUMENTS_PATH);
    g_szDocumentsPath[AK_IOS_MAX_DOCUMENTS_PATH-1] = '\0';
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, @"AppController");
    [pool release];
    return retVal;
}

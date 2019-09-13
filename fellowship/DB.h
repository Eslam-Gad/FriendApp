
#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "User.h"


@interface DB : NSObject

@property   NSString *databasePath;
@property   sqlite3 *contactDB;

-(void)createDB;
-(void)NewUser:(User*)newUser;
-(NSString*)getPass:(NSString*)email;
-(NSString*)getName:(NSString*)email;
-(NSString*)getPhone:(NSString*)email;
-(NSString *)getImg:(NSString *)email;
-(float)getLon:(NSString*)email;
-(float)getLat:(NSString *)email;
-(NSString *)getCity:(NSString *)email;
-(void)updateDate:(NSString *)email:(User*)udatedUser;
-(NSMutableArray*)getImgs;
-(NSMutableArray*)getNames;

@end

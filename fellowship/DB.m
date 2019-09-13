
#import "DB.h"

@implementation DB



-(void)createDB{

    
    NSString *docsDir;
    NSArray *dirPaths;
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(
    NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = dirPaths[0];
    
    // Build the path to the database file
    _databasePath = [[NSString alloc]
                     initWithString: [docsDir stringByAppendingPathComponent:
                                      @"FreiendUS.db"]];
    
    const char *dbpath = [_databasePath UTF8String];
    if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK)
    {
        char *errMsg1;
        char *errMsg2;

        const char *sql_stmt1 =
    "CREATE TABLE IF NOT EXISTS USER(email TEXT PRIMARY KEY , NAME TEXT, PASSWORD TEXT , PHONE TEXT,CITY TEXT, LON TEXT, LAT TEXT ,image TEXT,favorite TEXT)";
        
        
        
        if (sqlite3_exec(_contactDB, sql_stmt1, NULL, NULL, &errMsg1) != SQLITE_OK)
        {
            printf("Error create");
        }
        sqlite3_close(_contactDB);
    } else {
        printf("Error db");
    }
    
     sqlite3_close(_contactDB);

}





-(void)NewUser:(User *)newUser{

    
    
    
    [self createDB];
    
    sqlite3_stmt  *statement;
    const char *dbpath = [_databasePath UTF8String];
    
    if (sqlite3_open(dbpath,&_contactDB) == SQLITE_OK)
    {
        
        NSString *insertSQL = [NSString stringWithFormat:
    @"INSERT INTO USER (NAME, PASSWORD, email, PHONE,  CITY, LON, LAT,image,favorite) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\")",
                               newUser.name,newUser.password
                               ,newUser.email,newUser.phone,
                               newUser.city , newUser.lon,newUser.lat,newUser.img,@"0"];
        
        const char *insert_stmt = [insertSQL UTF8String];
        
        sqlite3_prepare_v2(_contactDB, insert_stmt,-1, &statement, NULL);
        
        if (sqlite3_step(statement) != SQLITE_DONE)
        {
            
          printf("error Insert");
            
        }

    }else{printf("erroe open DB");}
    
    
    sqlite3_finalize(statement);
    sqlite3_close(_contactDB);
    
}

-(NSString *)getPass:(NSString *)email{

    [self createDB];

    NSString *docsDir;
    NSArray *dirPaths;
    NSString *pass;
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(
    NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = dirPaths[0];
    
    const char *dbpath = [_databasePath UTF8String];
    sqlite3_stmt    *statement;
    
    
    if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK)
    {
        
        NSString *querySQL = [NSString stringWithFormat:
                    @"SELECT PASSWORD FROM USER where email=\"%@\"",email];
        
        const char *query_stmt = [querySQL UTF8String];
        
        sqlite3_prepare_v2(_contactDB,
                           query_stmt, -1, &statement, NULL);
        
        if (sqlite3_prepare_v2(_contactDB,
                               query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            
            if(sqlite3_step(statement) == SQLITE_ROW)
            {
                
                pass = [[NSString alloc]
                                       initWithUTF8String:
                                       (const char *) sqlite3_column_text(statement, 0)];}
        else{
            printf("null value");
        }
        
    }else{
    
        printf("Error query");

    }
    
    }else
    {
        printf("Error DB");

    }
    
    sqlite3_finalize(statement);
    sqlite3_close(_contactDB);
    

    return pass;

}


-(NSString *)getName:(NSString *)email{
    
    [self createDB];
    
    NSString *docsDir;
    NSArray *dirPaths;
    NSString *name;
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(
                                                   NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = dirPaths[0];
    
    const char *dbpath = [_databasePath UTF8String];
    sqlite3_stmt    *statement;
    
    
    if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK)
    {
        
        NSString *querySQL = [NSString stringWithFormat:
                              @"SELECT NAME FROM USER where email=\"%@\"",email];
        
        const char *query_stmt = [querySQL UTF8String];
        
        sqlite3_prepare_v2(_contactDB,
                           query_stmt, -1, &statement, NULL);
        
        if (sqlite3_prepare_v2(_contactDB,
                               query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            
            if(sqlite3_step(statement) == SQLITE_ROW)
            {
                
                name = [[NSString alloc]
                        initWithUTF8String:
                        (const char *) sqlite3_column_text(statement, 0)];}
            else{
                printf("null value");
            }
            
        }else{
            
            printf("Error query");
            
        }
        
    }else
    {
        printf("Error DB");
        
    }
    
    sqlite3_finalize(statement);
    sqlite3_close(_contactDB);
    
    
    return name;
    
}

-(NSString *)getPhone:(NSString *)email{
    
    [self createDB];
    
    NSString *docsDir;
    NSArray *dirPaths;
    NSString *phone;
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(
                                                   NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = dirPaths[0];
    
    const char *dbpath = [_databasePath UTF8String];
    sqlite3_stmt    *statement;
    
    
    if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK)
    {
        
        NSString *querySQL = [NSString stringWithFormat:
                              @"SELECT PHONE FROM USER where email=\"%@\"",email];
        
        const char *query_stmt = [querySQL UTF8String];
        
        sqlite3_prepare_v2(_contactDB,
                           query_stmt, -1, &statement, NULL);
        
        if (sqlite3_prepare_v2(_contactDB,
                               query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            
            if(sqlite3_step(statement) == SQLITE_ROW)
            {
                
                phone = [[NSString alloc]
                        initWithUTF8String:
                        (const char *) sqlite3_column_text(statement, 0)];}
            else{
                printf("null value");
            }
            
        }else{
            
            printf("Error query");
            
        }
        
    }else
    {
        printf("Error DB");
        
    }
    
    sqlite3_finalize(statement);
    sqlite3_close(_contactDB);
    
    
    return phone;
    
}

-(NSString *)getImg:(NSString *)email{
    
    [self createDB];
    
    NSString *docsDir;
    NSArray *dirPaths;
    NSString *img;
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(
                                                   NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = dirPaths[0];
    
    const char *dbpath = [_databasePath UTF8String];
    sqlite3_stmt    *statement;
    
    
    if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK)
    {
        
        NSString *querySQL = [NSString stringWithFormat:
                              @"SELECT image FROM USER where email=\"%@\"",email];
        
        const char *query_stmt = [querySQL UTF8String];
        
        sqlite3_prepare_v2(_contactDB,
                           query_stmt, -1, &statement, NULL);
        
        if (sqlite3_prepare_v2(_contactDB,
                               query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            
            if(sqlite3_step(statement) == SQLITE_ROW)
            {
                
                img = [[NSString alloc]
                         initWithUTF8String:
                         (const char *) sqlite3_column_text(statement, 0)];}
            else{
                printf("null value");
            }
            
        }else{
            
            printf("Error query");
            
        }
        
    }else
    {
        printf("Error DB");
        
    }
    
    sqlite3_finalize(statement);
    sqlite3_close(_contactDB);
    
    
    return img;
    
}

-(float)getLon:(NSString *)email{
    
    [self createDB];
    
    NSString *docsDir;
    NSArray *dirPaths;
    NSString *lon;
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(
                                                   NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = dirPaths[0];
    
    const char *dbpath = [_databasePath UTF8String];
    sqlite3_stmt    *statement;
    
    
    if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK)
    {
        
        NSString *querySQL = [NSString stringWithFormat:
                              @"SELECT LON FROM USER where email=\"%@\"",email];
        
        const char *query_stmt = [querySQL UTF8String];
        
        sqlite3_prepare_v2(_contactDB,
                           query_stmt, -1, &statement, NULL);
        
        if (sqlite3_prepare_v2(_contactDB,
                               query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            
            if(sqlite3_step(statement) == SQLITE_ROW)
            {
                
                lon = [[NSString alloc]
                       initWithUTF8String:
                       (const char *) sqlite3_column_text(statement, 0)];}
            else{
                printf("null value");
            }
            
        }else{
            
            printf("Error query");
            
        }
        
    }else
    {
        printf("Error DB");
        
    }
    
    sqlite3_finalize(statement);
    sqlite3_close(_contactDB);
    
    
    return [lon floatValue];
    
}

-(float)getLat:(NSString *)email{
    
    [self createDB];
    
    NSString *docsDir;
    NSArray *dirPaths;
    NSString *lat;
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(
                                                   NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = dirPaths[0];
    
    const char *dbpath = [_databasePath UTF8String];
    sqlite3_stmt    *statement;
    
    
    if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK)
    {
        
        NSString *querySQL = [NSString stringWithFormat:
                              @"SELECT LAT FROM USER where email=\"%@\"",email];
        
        const char *query_stmt = [querySQL UTF8String];
        
        sqlite3_prepare_v2(_contactDB,
                           query_stmt, -1, &statement, NULL);
        
        if (sqlite3_prepare_v2(_contactDB,
                               query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            
            if(sqlite3_step(statement) == SQLITE_ROW)
            {
                
                lat = [[NSString alloc]
                       initWithUTF8String:
                       (const char *) sqlite3_column_text(statement, 0)];}
            else{
                printf("null value");
            }
            
        }else{
            
            printf("Error query");
            
        }
        
    }else
    {
        printf("Error DB");
        
    }
    
    sqlite3_finalize(statement);
    sqlite3_close(_contactDB);
    
    
    return [lat floatValue];
    
}

-(NSString *)getCity:(NSString *)email{
    
    [self createDB];
    
    NSString *docsDir;
    NSArray *dirPaths;
    NSString *city;
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(
                                                   NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = dirPaths[0];
    
    const char *dbpath = [_databasePath UTF8String];
    sqlite3_stmt    *statement;
    
    
    if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK)
    {
        
        NSString *querySQL = [NSString stringWithFormat:
                              @"SELECT CITY FROM USER where email=\"%@\"",email];
        
        const char *query_stmt = [querySQL UTF8String];
        
        sqlite3_prepare_v2(_contactDB,
                           query_stmt, -1, &statement, NULL);
        
        if (sqlite3_prepare_v2(_contactDB,
                               query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            
            if(sqlite3_step(statement) == SQLITE_ROW)
            {
                
                city = [[NSString alloc]
                       initWithUTF8String:
                       (const char *) sqlite3_column_text(statement, 0)];}
            else{
                printf("null value");
            }
            
        }else{
            
            printf("Error query");
            
        }
        
    }else
    {
        printf("Error DB");
        
    }
    
    sqlite3_finalize(statement);
    sqlite3_close(_contactDB);
    
    
    return city;
    
}

-(void)updateDate:(NSString *)email :(User *)udatedUser{

    
    
    [self createDB];
    
    sqlite3_stmt  *statement;
    const char *dbpath = [_databasePath UTF8String];
    
    if (sqlite3_open(dbpath,&_contactDB) == SQLITE_OK)
    {
        
        NSString *insertSQL = [NSString stringWithFormat:
            @"UPDATE USER SET NAME=\"%@\", PASSWORD=\"%@\", email=\"%@\", PHONE=\"%@\",  CITY=\"%@\", LON=\"%@\", LAT=\"%@\",image=\"%@\" WHERE email LIKE \"%@\" ",
                    udatedUser.name,udatedUser.password
                    ,udatedUser.email,udatedUser.phone,
                    udatedUser.city , udatedUser.lon,udatedUser.lat,udatedUser.img,email];
        
        const char *insert_stmt = [insertSQL UTF8String];
        
        sqlite3_prepare_v2(_contactDB, insert_stmt,-1, &statement, NULL);
        
        if (sqlite3_step(statement) != SQLITE_DONE)
        {
            
            printf("error ubdate");
            
        }
        
    }else{printf("erroe open DB");}
    
    
    sqlite3_finalize(statement);
    sqlite3_close(_contactDB);
}

-(NSMutableArray *)getImgs{

    [self createDB];
    
    NSString *docsDir;
    NSArray *dirPaths;
    NSMutableArray *ig = [NSMutableArray new];
    NSString *img;
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(
                                                   NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = dirPaths[0];
    
    const char *dbpath = [_databasePath UTF8String];
    sqlite3_stmt    *statement;
    
    
    if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK)
    {
        
        NSString *querySQL = [NSString stringWithFormat:
                              @"SELECT image FROM USER"];
        
        const char *query_stmt = [querySQL UTF8String];
        
        sqlite3_prepare_v2(_contactDB,
                           query_stmt, -1, &statement, NULL);
        
        if (sqlite3_prepare_v2(_contactDB,
                               query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            
            while(sqlite3_step(statement) == SQLITE_ROW)
            {
                
                img = [[NSString alloc]
                       initWithUTF8String:
                       (const char *) sqlite3_column_text(statement, 0)];
            
                [ig addObject:img];
                printf("%s",[img UTF8String]);
                
            }
            
            
        }else{
            
            printf("Error query");
            
        }
        
    }else
    {
        printf("Error DB");
        
    }
    
    sqlite3_finalize(statement);
    sqlite3_close(_contactDB);
    
    
    return ig;
}



-(NSMutableArray *)getNames{

    [self createDB];
    
    NSString *docsDir;
    NSArray *dirPaths;
    NSMutableArray *ig = [NSMutableArray new];
    NSString *img;
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(
                                                   NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = dirPaths[0];
    
    const char *dbpath = [_databasePath UTF8String];
    sqlite3_stmt    *statement;
    
    
    if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK)
    {
        
        NSString *querySQL = [NSString stringWithFormat:
                              @"SELECT NAME FROM USER"];
        
        const char *query_stmt = [querySQL UTF8String];
        
        sqlite3_prepare_v2(_contactDB,
                           query_stmt, -1, &statement, NULL);
        
        if (sqlite3_prepare_v2(_contactDB,
                               query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            
            while(sqlite3_step(statement) == SQLITE_ROW)
            {
                
                img = [[NSString alloc]
                       initWithUTF8String:
                       (const char *) sqlite3_column_text(statement, 0)];
                
                [ig addObject:img];
                
            }
            
            
        }else{
            
            printf("Error query");
            
        }
        
    }else
    {
        printf("Error DB");
        
    }
    
    sqlite3_finalize(statement);
    sqlite3_close(_contactDB);
    
    
    return ig;
    
}

@end

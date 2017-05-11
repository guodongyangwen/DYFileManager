# DYFileManager
这是一个强大的文件操作开源库，提供了很多静态方法用来操作文件和目录。包括创建、删除、复制、移动、重命名、读写等基本操作，也包含获取文件属性、大小、是否可读等辅助方法。

##功能
* 构建路径： 支持获取并操作沙盒内所有系统目录（document，tmp，library等）。
* 创建文件/目录
* 删除文件/目录
* 复制文件/目录
* 移动文件/目录
* 重命名文件/目录
* 文件列表： 获取目录下所有文件列表
* 文件/目录属性
* 读写文件

## 案例

####构建路径

```
//document目录下 构建一个DEMO目录
[DYFileManager documentDirPathWithPath:@"DEMO"]
//document目录下构建一个demo.txt文件
[DYFileManager documentDirPathWithPath:@"demo.txt"]
    
```

####创建文件/目录

```
//创建文件
NSString* filePath = [[DYFileManager documentDirPathWithPath:@"DEMO"] stringByAppendingPathComponent:@"demo.log"];
NSError* error = nil;
[DYFileManager createFileWithPath:filePath content:@[@"world",@"hello"]];
    
//创建目录
NSString * demoDir = [DYFileManager documentDirPathWithPath:@"DEMO"];
NSError * error = nil;
[DYFileManager createDirectoryWithDirPath:demoDir];

```


####删除文件/目录

```
//删除单个文件
NSString* demoDir = [DYFileManager documentDirPathWithPath:@"DEMO"];
NSString* filePath = [demoDir stringByAppendingPathComponent:@"demo.log"];
 NSError* error = nil;
[DYFileManager removeFileWithPath:filePath error:&error];

//批量删除文件
NSString* demoDir = [DYFileManager documentDirPathWithPath:@"DEMO"];
NSError* error = nil;
[DYFileManager removeFilesInDirectoryWithPath:demoDir error:&error];
    
//删除目录
NSString* demoDir = [DYFileManager documentDirPathWithPath:@"DEMO"];
[DYFileManager removeDirectoryWithPath:demoDir]

```

####复制文件/目录

```
 NSString* demoDir = [DYFileManager documentDirPathWithPath:@"DEMO"];
NSString* fromPath = [demoDir stringByAppendingPathComponent:@"demo.log"];
NSString* toPath = [demoDir stringByAppendingPathComponent:@"demo2.log"];
NSError* error = nil;
[DYFileManager copyFileFromPath:fromPath toPath:toPath error:&error];

```

####移动文件/目录

```
NSString* demoDir = [DYFileManager documentDirPathWithPath:@"DEMO"];
NSString* testDir = [DYFileManager documentDirPathWithPath:@"TEST"];
NSString* fromPath = [demoDir stringByAppendingPathComponent:@"demo.log"];
NSString* toPath = [testDir stringByAppendingPathComponent:@"demo.log"];
NSError* error = nil;
[DYFileManager moveFileFromPath:fromPath toPath:toPath overwrite:YES error:&error];

```


####重命名文件

```
NSString* demoDir = [DYFileManager documentDirPathWithPath:@"DEMO"];
    NSError* error = nil;
    [DYFileManager renameFileWithPath:[demoDir stringByAppendingPathComponent:@"demo.log"] withName:@"demo.txt" error:&error];

```


####文件列表

```
NSString* demoDir = [DYFileManager documentDirPathWithPath:@"DEMO"];
/*prefix
    NSArray* files = [DYFileManager filesInDirectoryWithPath:demoDir withPrefix:@"fil"];
*/
/* suffix
    NSArray* files = [DYFileManager filesInDirectoryWithPath:demoDir withSuffix:@"le"];
*/
/*extension
    NSArray* files = [DYFileManager filesInDirectoryWithPath:demoDir withExtension:@"txt"];
*/
/*deep:是否获取文件下所有文件（包括子目录下）*/
    NSArray* files = [DYFileManager filesInDirectoryWithPath:gdyDir deep:YES];

```

####文件/目录属性

```
NSString* demoDir = [DYFileManager documentDirPathWithPath:@"DEMO"];
/*文件属性
    NSDictionary* dicAttr = [DYFileManager attributesOfItemWithPath:[demoDir stringByAppendingPathComponent:@"demo.log"]];
    NSLog(@"attributes :%@",dicAttr);
*/
    
/*  文件某一特定属性
    NSNumber* fileSize = (NSNumber*)[DYFileManager attributeOfItemWithPath:[demoDir stringByAppendingPathComponent:@"demo.log"] forKey:NSFileSize];
    NSLog(@"filesize:%@    formatSize:%@",fileSize,[DYFileManager sizeFormatted:(NSNumber*)fileSize]);
*/


```
   
   
   ####写文件
   
   ```
   /*字典、数组、字符串、nsdata，json，自定义model*/
    People* p = [[People alloc]init];
    p.name = @"***";
    p.sex = @"man";
    p.height = @"1.87";

    NSArray* arrContent = @[@{@"key1":@"value1",@"key2":@"value2"},@[@"value1",@"value2",@"value3"],@"string1",[@"string2" dataUsingEncoding:NSUTF8StringEncoding],p];
    
    for (int i=0; i<5; i++) {
        
        NSObject*  obj = arrContent[i];
        NSString* filePath = [demoDir stringByAppendingPathComponent:[NSString stringWithFormat:@"file%d.txt",i+1]];
        if(![DYFileManager writeContent:obj path:filePath]){
            [DYFileManager DYLog:@"往文件中写入内容错误"];
        }
    }

   
   
   ```
   
   
   ####读取文件
   
   ```
   NSString * demoDir = [DYFileManager documentDirPathWithPath:@"DEMO"];
    //dictionary
    NSString* filePath1 = [demoDir stringByAppendingPathComponent:@"file1"];
    NSDictionary* dic = [DYFileManager readContentAsNSDictionaryWithPath:filePath1];
    [DYFileManager DYLog:[NSString stringWithFormat:@"file1:%@",dic]];
    
    //array
    NSString* filePath2 = [demoDir stringByAppendingPathComponent:@"file2"];
    NSArray* array = [DYFileManager readContentAsNSArrayWithPath:filePath2];
    [DYFileManager DYLog:[NSString stringWithFormat:@"file2:%@",array]];
    
    //string
    NSString* filePath3 = [demoDir stringByAppendingPathComponent:@"file3"];
    NSString* tempStr = [DYFileManager readContentAsStringWithPath:filePath3];
    [DYFileManager DYLog:[NSString stringWithFormat:@"file3:%@",tempStr]];
    
    //NSData
    NSString* filePath4 = [demoDir stringByAppendingPathComponent:@"file4"];
    NSData* data = [DYFileManager readContentAsNSDataWithPath:filePath4];
    [DYFileManager DYLog:[NSString stringWithFormat:@"file4:%@",data]];
    
    //custom object
    NSString* filePath6 = [demoDir stringByAppendingPathComponent:@"file5"];
    People* p = (People*)[DYFileManager readContentAsCustomModelWithPath:filePath6];
    [DYFileManager DYLog:[NSString stringWithFormat:@"file6:%@",p]];
   
   
   ```







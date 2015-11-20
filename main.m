//
//  main.m
//  String_Date_Calender
//
//  Created by lister on 15/11/20.
//  Copyright (c) 2015年 hongwing.com. All rights reserved.
//

#import <Foundation/Foundation.h>

void CalenderTesting()
{
    // 获得一个公历
    // NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    // 获取当前日期
    NSDate *date = [NSDate date];
    // 定义旗标
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday;
    // 获取不同字段的信息
    NSDateComponents *comp = [gregorian components:unitFlags fromDate:date];
    // 获取个字段数值
    NSLog(@"==>现在是%ld年",comp.year);
    NSLog(@"==>现在是%ld月",comp.month);
    NSLog(@"==>现在是%ld日",comp.day);
    NSLog(@"==>现在是%ld时",comp.hour);
    NSLog(@"==>现在是%ld分",comp.minute);
    NSLog(@"==>现在是%ld秒",comp.second);
    NSLog(@"==>星期%ld",comp.weekday);
    // 通过compones自己设置日期
    NSDateComponents *comp2 = [[NSDateComponents alloc]init];
    // 设置个字段数值
    comp2.year = 2022;
    comp2.month = 7;
    comp2.day = 22;
    comp2.hour = 9;
    comp2.minute = 14;
    comp2.second = 44;
    NSDate *dt = [gregorian dateFromComponents:comp2];
    NSLog(@"++++>%@",dt);
    
}

void DateFormatter()
{
    // 获取其之后50年时间
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:20 * 366 * 24 * 3600];
    // 建立两个时区Locale
    NSLocale *loc1 = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];// china
    NSLocale *loc2 = [[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];// America
    NSLocale *locales[2] = {loc1,loc2};
    //NSDateFormatter数组
    NSDateFormatter *df[8];
    
    for (int i = 0; i < 2; i++) {
        df[i * 4] = [[NSDateFormatter alloc]init];
        // 设置NSDateFormatter的日期时间风格
        [df[i * 4] setDateStyle:NSDateFormatterShortStyle];
        [df[i * 4] setTimeStyle:NSDateFormatterShortStyle];
        [df[i * 4] setLocale:locales[i]];
        // 设置NSDateFormatter的日期时间风格
        df[i * 4 + 1] = [[NSDateFormatter alloc]init];
        [df[i * 4 + 1] setDateStyle:NSDateFormatterMediumStyle];
        [df[i * 4 + 1] setTimeStyle:NSDateFormatterMediumStyle];
        [df[i * 4 + 1] setLocale:locales[i]];
        // 设置NSDateFormatter的日期时间风格
        df[i * 4 + 2] = [[NSDateFormatter alloc]init];
        [df[i * 4 + 2] setDateStyle:NSDateFormatterLongStyle];
        [df[i * 4 + 2] setTimeStyle:NSDateFormatterLongStyle];
         // 设置NSDateFormatter的NSLocale
        [df[i * 4 + 2] setLocale:locales[i]];
        // 设置NSDateFormatter的日期时间风格
        df[i * 4 + 3] = [[NSDateFormatter alloc]init];
        [df[i * 4 + 3] setDateStyle:NSDateFormatterFullStyle];
        [df[i * 4 + 3] setTimeStyle:NSDateFormatterFullStyle];
        // 设置NSDateFormatter的NSLocale
        [df[i * 4 + 3] setLocale:locales[i]];
    }
    
    for (int i = 0; i < 2 ; i++) {
        switch (i)
        {
            case 0:
                NSLog(@"<============China style================>");
                break;
            case 1:
                NSLog(@"<============America style================>");
                break;
        }
        NSLog(@"%@",[df[i * 4] class]);
        NSLog(@"SHORT 格式日期显示: %@",[df[i * 4] stringFromDate:date]);
        NSLog(@"MEDIUM 格式日期显示: %@",[df[i * 4 + 1] stringFromDate:date]);
        NSLog(@"LONG 格式日期显示: %@",[df[i * 4 + 2] stringFromDate:date]);
        NSLog(@"FULL 格式日期显示: %@",[df[i * 4 + 3] stringFromDate:date]);
    }
        NSDateFormatter *df1 = [[NSDateFormatter alloc]init];
        // 自定义风格
        [df1 setDateFormat:@"公元yyyy年MM月DD日HH时mm分"];
        // df1 产生日期
        NSLog(@"new format:%@",[df1 stringFromDate:date]);
        NSString *s = @"2015-11-22";
        NSDateFormatter *df2 = [[NSDateFormatter alloc] init];
        [df2 setDateFormat:@"yyyy-MM-dd"];
        NSLog(@"new format:%@",[df2 dateFromString:s]);
}

void DateTesting()
{
    // 获取当前日期
    NSDate *date1 = [NSDate date];
    NSLog(@"%@",date1);
    // 当前日期前一天
    NSDate *date2 = [[NSDate alloc]initWithTimeInterval:-1 * 3600 * 24
                                              sinceDate:date1];
    NSLog(@"%@",date2);
    // 当前日期后两天
    NSDate *date3 = [[NSDate alloc] initWithTimeInterval:2 * 3600 * 24
                                               sinceDate:date1];
    NSLog(@"%@",date3);
    // 获取自1970年1月1日开始，50年之后的日期
    NSDate *date4 = [NSDate dateWithTimeIntervalSince1970:50 * 366 * 24 * 3600];
    NSLog(@"%@",date4);
    // 获取系统当期的NSLocale
    NSLocale *cn = [NSLocale currentLocale];
    //获取在当前NSLocal下时间字符串
    NSString *str = [date1 descriptionWithLocale:cn];
    NSLog(@"%@",str);
    /*
     日期比较
     */
    // 获取较早
    NSDate *earlier = [date1 earlierDate:date2];
    NSLog(@"%@",earlier);
    // 获取较迟
    NSDate *later = [date1 laterDate:date3];
    NSLog(@"%@",later);
    // compare 返回枚举值
    switch ([date1 compare:date3]) {
        case NSOrderedSame:
            NSLog(@"%@ 相同 %@",date1,date3);
            break;
        case NSOrderedAscending:
            NSLog(@"%@ 早于 %@",date1,date3);
            break;
        case NSOrderedDescending:
            NSLog(@"%@ 晚于 %@",date1,date3);
            break;
    }
    // 获取时间差
    NSLog(@"======>%g",[date1 timeIntervalSinceDate:date3]);
    NSLog(@"======>%g",[date1 timeIntervalSinceNow]);
    NSLog(@"======>%g",[date1 timeIntervalSince1970]);

}

int main(int argc, const char * argv[]) {
    @autoreleasepool
    {
        CalenderTesting();
        DateFormatter();
        DateTesting();
        unichar data[6] = {97,98,99,100,101,102};
        NSString *str = [[NSString alloc] initWithCharacters:data
                                                     length:6];
        NSLog(@"%@",str);
        
        char *cstr = "this is a new world.你好"; // c style
        NSString *str2 = [NSString stringWithUTF8String:cstr];
        NSString *t1 = [str2 substringWithRange:NSMakeRange(3, 8)];
        NSLog(@"%@",str2);
        NSLog(@"%@",t1);
        NSRange pos = [str2 rangeOfString:@"new"];
        NSLog(@"new 的位置：%ld,长度%ld",pos.location,pos.length);
        NSLog(@"UTF-8解码：%lu",[str2 lengthOfBytesUsingEncoding:NSUTF8StringEncoding]);
        
        // 字符串写入文件
        [str2 writeToFile:@"myfile.txt"
               atomically:YES
                 encoding:NSUTF8StringEncoding
                    error:nil];
        
        // 文件读取字符串
        NSString *s = [NSString stringWithContentsOfFile:@"main.m"
                                                encoding:NSUTF8StringEncoding
                                                   error:nil];
        /*
        NSString *str3 = [[NSString alloc]initWithContentsOfFile:@"myfile.txt"
                                                        encoding:NSUTF8StringEncoding
                                                           error:nil];
        */
        // 字符串写入文件
        [s writeToFile:@"myfile.txt"
               atomically:YES
                 encoding:NSUTF8StringEncoding
                    error:nil];                                                   
        NSLog(@"%@",s);
        
    }
    return 0;
}

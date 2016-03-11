//
//  LCModel.m
//  LCModel
//
//  Created by LLC on 16/3/10.
//  Copyright © 2016年 LLC. All rights reserved.
//

#import "LCModel.h"
#import <objc/runtime.h>

#pragma mark - LCRuntimeParser

@implementation LCRuntimeParser

static NSMutableDictionary *propertiesOfClassCache; //缓存已经查过的类的属性数组


+ (NSArray *)propertyNamesOfClass:(Class)aClass
{
    if (aClass == [LCModel class]) {
        return [NSArray array];
    }
    NSString *className = NSStringFromClass(aClass);//添加缓存 类名字作为key
    if (!propertiesOfClassCache)
    {
        propertiesOfClassCache = [[NSMutableDictionary alloc] init];
    }
    //先查找缓存
    NSArray * cachedPropertiesOfClass = [propertiesOfClassCache objectForKey:className];
    if ([cachedPropertiesOfClass count])
    {
        return cachedPropertiesOfClass;
    }
    
    NSMutableArray *propertyNamesArray = [NSMutableArray array];
    unsigned int propertyCount = 0;
    //遍历类的属性
    objc_property_t * properties = class_copyPropertyList(aClass, &propertyCount);
    
    for (unsigned int i = 0; i < propertyCount; ++i) {
        
        objc_property_t property = properties[i];
        const char * name = property_getName(property);
        
        [propertyNamesArray addObject:[NSString stringWithUTF8String:name]];
    }
    free(properties);
    
    [propertiesOfClassCache setObject:propertyNamesArray forKey:className];
    
    //查找父类的属性
    NSArray* arr = [LCRuntimeParser propertyNamesOfClass:class_getSuperclass(aClass)];
    [propertyNamesArray addObjectsFromArray:arr];
    return propertyNamesArray;
}

+ (BOOL)isProperty:(NSString *)propertyName readOnlyOfClass:(Class)aClass
{
    //首先判断 属性是否是未定义的
    BOOL isPropertyUndefined = YES;
    for (NSString * key in [LCRuntimeParser propertyNamesOfClass:aClass]) {
        if ([key isEqualToString:propertyName]) {
            isPropertyUndefined = NO;
            break;
        }
    }
    if (isPropertyUndefined) {
        return NO;
    }
    
    const char * type =  property_getAttributes(class_getProperty(aClass, [propertyName UTF8String]));
    NSString * typeString = [NSString stringWithUTF8String:type];
    NSArray * attributes = [typeString componentsSeparatedByString:@","];
    NSLog(@"attributes = %@",attributes);
    if ([attributes count]>=2) {
        
        NSString * typeAttribute = [attributes objectAtIndex:1];
        return [typeAttribute rangeOfString:@"R"].length > 0;
    }
    return NO;
}

@end


#pragma mark - LCModel


@implementation LCModel

@synthesize objectId;
@synthesize objectDescription;

static NSString *idPropertyName = @"id";
static NSString *idPropertyNameOnObject = @"objectId";
static NSString *descriptionPropertyName = @"description";
static NSString *descriptionPropertyNameOnObject = @"objectDescription";

- (void)setValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues
{
    [super setValuesForKeysWithDictionary:keyedValues];
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    //去除属性空值 赋值操作
    if (value == [NSNull null] || value == nil) {
        return;
    }
    //去除只读属性 赋值操作
    if ([LCRuntimeParser isProperty:key readOnlyOfClass:[self class]]) {
        return;
    }
    
    //特殊属性转化 id -> objectId; description -> objectDescription
    if ([key isEqualToString:idPropertyName]){
        
        [self setValue:value forKey:idPropertyNameOnObject];
        
    }else if([key isEqualToString:descriptionPropertyName]){
        
        [self setValue:value forKey:descriptionPropertyNameOnObject];
    }
    else{
        [super setValue:value forKey:key];
    }

}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    //如果设置 未定义的属性 暂时不做扩展
}

- (id)valueForKey:(NSString *)key
{
    return  [super valueForKey:key];
}

- (NSDictionary *)propertyDictionary
{
    NSMutableDictionary * propertyDictionary = [NSMutableDictionary dictionaryWithCapacity:0];
    
    //特殊属性反转化 id <- objectId; description <- objectDescription

    if (self.objectId) {
        [propertyDictionary setObject:self.objectId forKey:idPropertyName];
    }
    if (self.objectDescription) {
        [propertyDictionary setObject:self.objectDescription forKey:descriptionPropertyName];
    }
    for (NSString * key in [LCRuntimeParser propertyNamesOfClass:[self class]])
    {
        id value = [self valueForKey:key];
        if (value)
        {
            [propertyDictionary setObject:value forKey:key];
        }
    }
    return propertyDictionary;
}


#pragma mark -
- (void)encodeWithCoder:(NSCoder*)encoder {
    [encoder encodeObject:self.objectId forKey:idPropertyNameOnObject];
    [encoder encodeObject:self.objectDescription forKey:descriptionPropertyNameOnObject];
    for (NSString *key in [LCRuntimeParser propertyNamesOfClass:[self class]]) {
        [encoder encodeObject:[self valueForKey:key] forKey:key];
    }
}
- (id)initWithCoder:(NSCoder *)decoder {
    if ((self = [super init])) {
        [self setValue:[decoder decodeObjectForKey:idPropertyNameOnObject] forKey:idPropertyNameOnObject];
        [self setValue:[decoder decodeObjectForKey:descriptionPropertyNameOnObject] forKey:descriptionPropertyNameOnObject];

        for (NSString *key in [LCRuntimeParser propertyNamesOfClass:[self class]]) {
            
            if ([LCRuntimeParser isProperty:key readOnlyOfClass:[self class]]) {
                continue;
            }

            id value = [decoder decodeObjectForKey:key];
            if (value != [NSNull null] && value != nil) {
                [self setValue:value forKey:key];
            }
        }
    }
    return self;
}

#pragma mark -

- (NSString *)description
{
    NSMutableDictionary * propertiesDict  =  [NSMutableDictionary dictionaryWithDictionary: [self propertyDictionary] ];
    return [NSString stringWithFormat:@"【LC（Model）】<%@: id = %@ %@>", [self class], self.objectId, [propertiesDict description]];
}

@end




//
//  LCModel.h
//  LCModel
//
//  Created by LLC on 16/3/10.
//  Copyright © 2016年 LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - LCRuntimeParser

/**
 *  运行时 属性操作工具类
 */
@interface LCRuntimeParser : NSObject

/**
 *  获取类包含所有属性（必须是 LCModel子类 包括父类但截止于LCModel）
 *
 *  @param aClass 类
 *
 *  @return 属性名数组
 */
+ (NSArray *)propertyNamesOfClass:(Class)aClass;

/**
 *  判断类中属性 是否 是只读
 *
 *  @param propertyName 属性名
 *  @param aClass       类
 *
 *  @return 是否 是只读
 */
+ (BOOL)isProperty:(NSString*)propertyName readOnlyOfClass:(Class)aClass;
@end


#pragma mark - LCModel

/**
 *  基础数据模型
 * 【字典->模型】* 系统方法 - setValuesForKeysWithDictionary
 * 【模型->字典】* - propertyDictionary
 * 【Attention】
 *              * 1、 未定义的属性不会自动生成属性进行赋值
 *              * 2、 只读属性不可赋值
 *              * 3、特殊关键字属性名转化 ： id -> objectId; description -> objectDescription
 *              * 4、序列化 但只读属性不进行序列化操作
 */
@interface LCModel : NSObject <NSCoding>

/**
 * 特殊属性转化 关键字 转换
 */
@property (nonatomic, copy) NSString * objectId;
@property (nonatomic, copy) NSString * objectDescription;

/**
 *  属性字典  模型 -转化- 字典
 */
- (NSDictionary *)propertyDictionary;

@end


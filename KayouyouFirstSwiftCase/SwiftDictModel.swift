
//
//  SwiftDictModel.swift
//  KayouyouFirstSwiftCase
//
//  Created by 叶杨杨 on 16/3/26.
//  Copyright © 2016年 叶杨杨. All rights reserved.
//

import Foundation
/**
 *  @objc 定义成oc的协议接口  如果optional加在 func前面 就是可选实现 否则必须实现
 */
@objc public protocol DictModelProtocol {
    
    static func customClassMapping() ->[String : String]?
}

public class DictModelManager
{
    /// swift的单例写法
    private  static  let  instance = DictModelManager()
    
    public class var sharedManager:DictModelManager {
        
        return instance
     
    }
    
    /**
    *  字典转模型
    */
    
    public func  objectWithDictionary(dict:NSDictionary,cls :AnyClass)-> AnyObject?{
        
        //动态获取命名空间
//        let  ns = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"]as!String
        
        //模型信息
       // let infoDict =
        
        
        
        
    }
    
    /**
    *  记载完整类信息
    */
    func wholeModelInfo(cls:AnyClass) -> [String:String] {
       
        //检测缓冲池
        if  let  cache = modelCache["\(cls)"]
        {
            
            return cache
        }
        var currentCls:AnyClass = cls
        var infoDict = [String:String]()
        while  let parent:AnyClass = currentCls.superclass(){
            
           infoDict.merge(modelInfo(currentCls))
            currentCls = parent
        }
        
        //写入缓存
        modelCache["\(cls)"] = infoDict
        
        return infoDict
    }
    
    
    /**
    *  加载类信息
    */
    func  modelInfo(cls: AnyClass) -> [String:String] {
        
        //检测缓冲池
        if let cache = modelCache["\(cls)"]{
            
            return cache
        }
        
        //拷贝属性列表
        var  count:UInt32 = 0
        let properties = class_copyPropertyList(cls, &count)
        
        //检查类是否实现协议
        
        var mappingDict:[String: String]?
        if cls.respondsToSelector("customClassMapping"){
            
            mappingDict = cls.customClassMapping()
        }

        var infoDict = [String:String]()
        for i in 0..<count {
            
            let property = properties[Int(i)]

            //属性的名称
            let  cname = property_getName(property)
            let name = String.fromCString(cname)!
            
            let type = mappingDict?[name] ?? ""
            infoDict[name] = type
        }
        
        free(properties)
        
        //写入缓冲池
        modelCache["\(cls)"] = infoDict
        
        return  infoDict
        
    }
    
    //模型缓冲
    var modelCache = [String :[String: String]]()
    
}

extension Dictionary {
    
    /**
    *  将字典合并到当前的字典，泛型函数
    */
    
    mutating func merge<K,V>(dict :[K:V])
    {
        
        for (k,v) in dict {
            
            self.updateValue(v as!Value, forKey: k as!Key)
            
        }
    }
    
    
    
}





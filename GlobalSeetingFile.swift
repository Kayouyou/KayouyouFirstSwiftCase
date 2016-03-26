//
//  GlobalSeetingFile.swift
//  KayouyouFirstSwiftCase
//
//  Created by 叶杨杨 on 16/3/26.
//  Copyright © 2016年 叶杨杨. All rights reserved.
//

import Foundation
import UIKit

 /// 全局属性设置
public let ScreenBounds = UIScreen.mainScreen().bounds
public let ScreenWidth = UIScreen.mainScreen().bounds.size.width
public let ScreenHeight = UIScreen.mainScreen().bounds.size.height

public let UD = NSUserDefaults.standardUserDefaults()

 /// 常用的颜色

public let  KYYGlobalBackgroundColor = UIColor.colorWithCustom(239, g: 239, b: 239)

public let  WelcomeViewControllerDidFinished = "WelcomeViewControllerDidFinished"
 /// 广告播放的通知name
public let ADImageLoadSuccessed = "ADImageLoadSuccessed"
public let ADImageLoadFailed = "ADImageLoadFailed"


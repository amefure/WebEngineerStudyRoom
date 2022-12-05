//
//  Article.swift
//  WebEngineerStudyRoom
//
//  Created by t&a on 2022/11/11.
//

import UIKit

// カテゴリ
// 0 main
// 1 php
// 2 js
// 3 web
// 4 WordPress
// 5 swift
// 6 aws

struct Article:Identifiable,Codable,Equatable {
    var id:Int
    var title:String
    var descri:String
    var file:String
    var category:Int
    var imgPath:String
    var entryDate:Date
}

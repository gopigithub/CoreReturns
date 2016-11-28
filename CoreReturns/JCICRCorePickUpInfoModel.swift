//
//  JCICRCorePickUpInfoModel.swift
//  CoreReturns
//
//  Created by Mobility on 23/11/16.
//  Copyright © 2016 Mobility. All rights reserved.
//

import UIKit
enum textFieldKeyBoardType : Int {
    case editableWithButton = 0
    case editableWithoutButton = 1
    case popOver = 2
    
}

class JCICRCorePickUpInfoModel: NSObject {
    
    var sections : String!
    var keyBoardType : textFieldKeyBoardType!
    var leftDataSource : String!
    var rightDataSource : String!

}

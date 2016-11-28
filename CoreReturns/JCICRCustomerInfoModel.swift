//
//  JCICRCustomerInfoModel.swift
//  CoreReturns
//
//  Created by Mobility on 28/11/16.
//  Copyright © 2016 Mobility. All rights reserved.
//

import UIKit

enum textFieldRightView : Int {
    case editable = 0
    case nonEditable = 1
}

class JCICRCustomerInfoModel: NSObject {
    
    var leftDataSource : String!
    var textFieldRightButton : textFieldRightView!
    var rightDataSource : String!

}

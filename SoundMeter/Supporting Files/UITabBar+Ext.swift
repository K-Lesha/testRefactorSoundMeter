//
//  UITabBar+Ext.swift
//  radiomini
//
//  Created by Iurii Dolotov on 11.05.2020.
//  Copyright © 2020 Iurii Dolotov. All rights reserved.
//

import UIKit

extension UITabBar {
    
    static func deflectPressFair() {
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().shadowImage     = UIImage()
        UITabBar.appearance().clipsToBounds   = true
    }
}

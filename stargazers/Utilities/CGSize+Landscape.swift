//
//  CGSize+Landscape.swift
//  stargazers
//
//  Created by Daniel Santoso on 06/08/21.
//

import Foundation

import SwiftUI

extension CGSize {
    /** Returns the landscape-size of the current device screen.
    - Returns: CGSize with width > height

    Use this function as follows.
    
    let size = UIScreen.main.bounds.size.landscape()
 
     */
    func landscape() -> Self {
        width > height ? self : CGSize(width: self.height, height: self.width)
    }
}

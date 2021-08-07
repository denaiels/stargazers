//
//  CGSize+Landscape.swift
//  stargazers
//
//  Created by Fabio Sim on 02/08/21.
//

import SwiftUI

extension CGSize {
    /** Returns the landscape-size of the current device screen.
    - Returns: CGSize with width > height

    Use this function as follows.
     
     ```
     let size = UIScreen.main.bounds.size.landscape()
     ```
     */
    func landscape() -> Self {
        width > height ? self : CGSize(width: self.height, height: self.width)
    }
}

//
//  Post.swift
//  Lost&Found
//
//  Created by Agnesa  on 31.5.23.
//

import Foundation
import UIKit

struct Post{
    var id: Int
    let image: UIImage
    let title: String
    let location: String
  //  let descriptionPost: String
    let date: String
    let postDescription: String
    var isItemFound: Bool? = false
    var bookMarked: Bool? = false
    }

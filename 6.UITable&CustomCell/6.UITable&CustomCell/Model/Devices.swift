//
//  Devices.swift
//  6.UITable&CustomCell
//
//  Created by matias on 18/12/2023.
//

import Foundation

struct Devices{
    let title: String
    let imageName: String
}

let house = [
    Devices(title: "iPhone", imageName: "iphone"),
    Devices(title: "iPad", imageName: "ipad"),
    Devices(title: "Macbook", imageName: "macbook")
]

let work = [
    Devices(title: "Macbook", imageName: "macbook")
]

let allDevices = [house, work]

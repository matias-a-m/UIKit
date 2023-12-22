//
//  Devide.swift
//  12.UICollectionView_diffabledatasource_compisitionallayout
//
//  Created by matias on 21/12/2023.
//

import Foundation
import UIKit

struct Device: Hashable{
    let id: UUID = UUID()
    let title: String
    let imageName: String
}

let home: [Device] = [
    Device(title: "iPhone", imageName: "iphone"),
    Device(title: "iPad", imageName: "ipad"),
    Device(title: "MacBook", imageName: "macbook"),
    Device(title: "Apple Watch", imageName: "applewatch"),
    Device(title: "AirPods", imageName: "airpods"),
    Device(title: "Apple TV", imageName: "appletv"),
    Device(title: "Mac Mini", imageName: "macmini"),
    Device(title: "HomePod Mini", imageName: "homepodmini")
]

let office: [Device] = [
    Device(title: "iPhone", imageName: "iphone"),
    Device(title: "iPad", imageName: "ipad"),
    Device(title: "MacBook", imageName: "macbook"),
    Device(title: "Apple Watch", imageName: "applewatch"),
    Device(title: "AirPods", imageName: "airpods"),
    Device(title: "Apple TV", imageName: "appletv"),
]

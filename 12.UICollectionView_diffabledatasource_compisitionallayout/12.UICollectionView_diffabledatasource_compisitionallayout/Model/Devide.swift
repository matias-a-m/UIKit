//
//  Devide.swift
//  12.UICollectionView_diffabledatasource_compisitionallayout
//
//  Created by matias on 21/12/2023.
//

import Foundation
import UIKit

struct Device: Hashable, Equatable{
    let id: UUID = UUID()
    let title: String
    let imageName: String
}


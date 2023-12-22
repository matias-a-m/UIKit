//
//  DeviceCellViewModel.swift
//  12.UICollectionView_diffabledatasource_compisitionallayout
//
//  Created by matias on 21/12/2023.
//
import UIKit

class DeviceCellViewModel: Hashable {
    let device: Device

    init(device: Device) {
        self.device = device
    }

    var imageName: String {
        return device.imageName
    }

    var title: String {
        return device.title
    }

    static func == (lhs: DeviceCellViewModel, rhs: DeviceCellViewModel) -> Bool {
        return lhs.device == rhs.device
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(device)
    }
}

class DeviceViewModel {
    var homeDevices: [Device]
    var officeDevices: [Device]

    init(homeDevices: [Device], officeDevices: [Device]) {
        self.homeDevices = homeDevices
        self.officeDevices = officeDevices
    }
}


//
//  Delegate.swift
//  6.UITable&CustomCell
//
//  Created by matias on 18/12/2023.
//

import Foundation
import UIKit

final class ViewControllerDelegate: NSObject,UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = house[indexPath.row]
        print("Cell:\(model.title)")
    }
}



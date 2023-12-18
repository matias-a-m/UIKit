//
//  DataSource.swift
//  6.UITable&CustomCell
//
//  Created by matias on 18/12/2023.
//

import Foundation
import UIKit

final class ViewControllerDataSource: NSObject,UITableViewDataSource{
    
    private let dataSource: [Devices]
    
    init(dataSource: [Devices]) {
        self.dataSource = dataSource
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "custom-cell", for: indexPath) as! TableViewCustomCell
        
        let model = dataSource[indexPath.row]
        
        cell.configure(model: model)
        
        return cell
    }
    
    
}


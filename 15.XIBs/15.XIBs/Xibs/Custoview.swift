//
//  Custoview.swift
//  15.XIBs
//
//  Created by matias on 24/12/2023.
//

import UIKit

class Custoview: UIView {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup(){
        let nib = UINib(nibName: "CustomView", bundle: nil)
        guard let customView = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("Error instantiating CustomView")
        }
        addSubview(customView)
    }
}

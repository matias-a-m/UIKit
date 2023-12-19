//
//  ViewController.swift
//  7.UIStackView
//
//  Created by matias on 19/12/2023.
//
import UIKit

class ViewController: UIViewController {
    
    override func loadView() {
        self.view = StackView()
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

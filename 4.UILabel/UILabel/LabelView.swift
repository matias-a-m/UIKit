//
//  LabelView.swift
//  UILabel
//
//  Created by matias on 18/12/2023.
//

import Foundation
import UIKit

final class LabelView: UIView{
    
    private let label1: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "hello world!"
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 26)
        label.textAlignment = .left
        label.textColor = .darkGray
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let label2: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "En el reino digital de códigos mágicos, el Arquimago Algorítmico pronunció <Hello, World!> como el encantamiento inaugural. Estas palabras místicas se esparcieron por cada lenguaje de programación, trascendiendo los reinos virtuales y convirtiéndose en un vínculo universal para los aprendices de hechiceros de la programación. Así, esta frase legendaria se arraigó como el rito de paso que da vida a un nuevo plano de existencia, conectando a los creadores digitales con el vasto universo de la creación, donde los códigos danzan como hechizos en un mágico ballet binario."
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .left
        label.textColor = .black
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let label3: UILabel = {
        
        let text = "hello-world"
        let attributedText: [NSAttributedString.Key: Any] = [
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .underlineColor: UIColor.white,
            .foregroundColor: UIColor.white,
            .backgroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 20)
        ]
        
        let attributedString = NSAttributedString(string: text, attributes: attributedText)
        
        let label = UILabel()
        label.numberOfLines = 0
        label.attributedText = attributedString
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(){
        addSubview()
        configureLayout()
    }
    
    private func addSubview(){
        [label1, label2, label3].forEach(addSubview)
    }
    
    private func configureLayout(){
        NSLayoutConstraint.activate([
            label1.centerXAnchor.constraint(equalTo: centerXAnchor),
            label1.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            
            label2.centerXAnchor.constraint(equalTo: centerXAnchor),
            label2.topAnchor.constraint(equalTo: label1.layoutMarginsGuide.bottomAnchor, constant: 20),
            label2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            label2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            label3.centerXAnchor.constraint(equalTo: centerXAnchor),
            label3.topAnchor.constraint(equalTo: label2.layoutMarginsGuide.bottomAnchor, constant: 20),
            
        ])
    }
    
}

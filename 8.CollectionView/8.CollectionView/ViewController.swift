//
//  ViewController.swift
//  8.CollectionView
//
//  Created by matias on 19/12/2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 60) / 2, height: (UIScreen.main.bounds.width - 60) / 2)
        
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
         collection.translatesAutoresizingMaskIntoConstraints = false

         return collection
     }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .blue
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        house.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        
        cell.backgroundColor = .white
        
        let model = house[indexPath.row]
        
        var listContentConf = UIListContentConfiguration.cell()
        listContentConf.text = model.title
        listContentConf.image = UIImage(systemName: model.imageName)
        cell.backgroundColor = .lightGray
        
        cell.contentConfiguration = listContentConf
        
        return cell
    }
    
    
}

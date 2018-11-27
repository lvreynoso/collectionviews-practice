//
//  ViewController.swift
//  collections
//
//  Created by Adriana González Martínez on 11/26/18.
//  Copyright © 2018 Adriana González Martínez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var collectionView: UICollectionView = {
        
        // Instantiating the UICollectionView, using the default flow layout
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Setting the datasource & delegate
   
        
        // Customization
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = .white
        
        //Registering the cell
        
        return collectionView
    }()
    
    var data: [Int] = Array(0..<10)
    
    
    override func loadView() {
        super.loadView()
        view.addSubview(collectionView)
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Update", style: .done, target: self, action: #selector(showOptions(controller:)))

    }

    @objc func showOptions(controller: UIViewController) {
        let alert = UIAlertController(title: "Options", message: "Choose an update", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Example", style: .default, handler: { (_) in
            self.collectionView.performBatchUpdates({
                
                 self.data[3] = 808080
                 let updated = self.data[3]
                 self.data.remove(at: 3)
                 self.data.remove(at: 2)
                 self.data.insert(updated, at: 0)
                 
                 self.collectionView.reloadItems(at: [IndexPath(item: 3, section: 0)])
                 self.collectionView.deleteItems(at: [IndexPath(item: 2, section: 0)])
                 self.collectionView.moveItem(at: IndexPath(item: 3, section: 0), to:  IndexPath(item: 0, section: 0))
                
            }, completion: nil)
        
        }))
        
        alert.addAction(UIAlertAction(title: "Insert 3 at the beginning", style: .default, handler: { (_) in
        }))
        
        alert.addAction(UIAlertAction(title: "Update value at 5", style: .default, handler: { (_) in
        }))
        
        alert.addAction(UIAlertAction(title: "Delete first 2, insert 3 more at the end", style: .default, handler: { (_) in
        }))
        
        alert.addAction(UIAlertAction(title: "Insert 3 more at the end, delete first 2", style: .default, handler: { (_) in
        }))
        
        alert.addAction(UIAlertAction(title: "Delete 3 at the beginning, insert 1 at the beginning", style: .default, handler: { (_) in
        }))
        
        alert.addAction(UIAlertAction(title: "Delete 3 at the beginning, insert 1 at end", style: .default, handler: { (_) in
        }))
        
        alert.addAction(UIAlertAction(title: "Insert 3 at the beginning, delete the first one", style: .default, handler: { (_) in
        }))
        
        alert.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in
            self.data = Array(0..<10)
            self.collectionView.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
        }))
        
        self.present(alert, animated: true, completion:nil)
    }
    
}


extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.identifier, for: indexPath) as! Cell
        let data = self.data[indexPath.item]
        cell.textLabel.text = String(data)
        cell.textLabel.textColor = UIColor.white
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 20, height: 20)
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}


//
//  CollectionViewCellReuseProtocol.swift
//  TvingCloneCoding
//
//  Created by uiskim on 2023/05/04.
//

import UIKit

public protocol CollectionViewCellReuseProtocol where Self: UICollectionViewCell {
    static func register(collectionView: UICollectionView)
    static func dequeueReusableCell(collectionView: UICollectionView, indexPath: IndexPath) -> Self
    static var reuseIdentifier: String { get }
}


extension CollectionViewCellReuseProtocol {
    public static func register(collectionView: UICollectionView) {
        collectionView.register(self, forCellWithReuseIdentifier: self.reuseIdentifier)
    }
    
    public static func dequeueReusableCell(collectionView: UICollectionView, indexPath: IndexPath) -> Self {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier, for: indexPath) as? Self else { fatalError()}
        return cell
    }
    
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}

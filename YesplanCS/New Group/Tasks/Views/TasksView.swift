//
//  TasksView.swift
//  YesplanCS
//
//  Created by Techcc - FOH - Video on 29/03/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//


import UIKit

class TasksView: UIView {
    
    // MARK:- Properties:
    var tasksCollectionView: UICollectionView
    let spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray) // UIActivityIndicatorView(activityIndicatorStyle: .gray)
    
    // MARK:- Initializers:
    init() {
        // tasksCollectionView
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        tasksCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        super.init(frame: CGRect.zero)
        setupComponents()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- Setup components
    private func setupComponents() {
        // self
        backgroundColor = UIColor.white
        
        // spinner
        addSubview(spinner)
        
        // dogsCollectionView
        tasksCollectionView.backgroundColor = UIColor.clear
        tasksCollectionView.showsVerticalScrollIndicator = false
        tasksCollectionView.showsHorizontalScrollIndicator = false
        tasksCollectionView.bounces = true
        tasksCollectionView.decelerationRate = UIScrollViewDecelerationRateNormal
        addSubview(tasksCollectionView)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            // spinner
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            // tasksCollectionView
            tasksCollectionView.topAnchor.constraint(equalTo: topAnchor),
            tasksCollectionView.leftAnchor.constraint(equalTo: leftAnchor),
            tasksCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tasksCollectionView.rightAnchor.constraint(equalTo: rightAnchor)
            ])
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        tasksCollectionView.translatesAutoresizingMaskIntoConstraints = false
    }
}

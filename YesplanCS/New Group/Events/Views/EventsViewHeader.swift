//
//  EventsViewHeader.swift
//  YesplanCS
//
//  Created by Techcc - FOH - Video on 5/05/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import UIKit

class EventsViewHeader: UICollectionViewCell {
    
    var EventsViewHeaderLabel: UILabel
        = {
            var label = UILabel()
            label.textColor = UIColor.black
            label.textAlignment = .center
            //        label.font = UIFont(name: "Montserrat", size: 30)
            return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(EventsViewHeaderLabel)
        
        EventsViewHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        EventsViewHeaderLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 32.5).isActive = true
        EventsViewHeaderLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -32.5).isActive = true
        EventsViewHeaderLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        EventsViewHeaderLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

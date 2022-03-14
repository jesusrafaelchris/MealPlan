//
//  WeekCell.swift
//  MealPlan
//
//  Created by Christian Grinling on 28/10/2021.
//

import UIKit

class WeekCell: UICollectionViewCell {
    
    lazy var dayView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 0.93, green: 0.95, blue: 1.00, alpha: 1.00)
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var dayLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .gray, size: 15, text: "day", bold: false)
        return text
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var heightConstraint: NSLayoutConstraint?
    var heightmult: NSLayoutConstraint?
    
    
    func setupView() {
        addSubview(dayView)
        addSubview(dayLabel)
        
        dayView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        dayView.bottomAnchor.constraint(equalTo: dayLabel.topAnchor,constant: -20).isActive = true
        //dayView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        heightConstraint = dayView.heightAnchor.constraint(equalToConstant: 30)
        heightConstraint?.isActive = true
        dayView.widthAnchor.constraint(equalToConstant: 35).isActive = true

        
        dayLabel.anchor(top: nil, paddingTop: 20, bottom: bottomAnchor, paddingBottom: 5, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, width: 0, height: 0)
        dayLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
}

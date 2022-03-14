//
//  ViewController.swift
//  MealPlan
//
//  Created by Christian Grinling on 28/10/2021.
//

import UIKit

class MainWeekView: UIViewController {
    
    lazy var MealPlanText: UILabel = {
        let text = UILabel()
        text.layout(colour: .black, size: 28, text: "MealPlan", bold: true)
        return text
    }()
    
    lazy var dateLabel: UILabel = {
        let text = UILabel()
        let date = getDate()
        text.layout(colour: .black, size: 15, text: "This Week \(date)", bold: false)
        return text
    }()
    
    lazy var weekCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionview = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionview.register(WeekCell.self, forCellWithReuseIdentifier: "cell")
        collectionview.delegate = self
        collectionview.dataSource = self
        collectionview.backgroundColor = .white
        //collectionview.isScrollEnabled = false
        return collectionview
    }()
    
    lazy var lunchButton: UIButton = {
        let button = UIButton()
        button.layout(textcolour: .black, backgroundColour: .clear, size: 20, text: "Lunch", image: nil, cornerRadius: nil)
        return button
    }()
    
    lazy var dinnerButton: UIButton = {
        let button = UIButton()
        button.layout(textcolour: .black, backgroundColour: .clear, size: 20, text: "Dinner", image: nil, cornerRadius: nil)
        return button
    }()
    
    lazy var mealView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 0.31, green: 0.50, blue: 0.99, alpha: 1.00)
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupView()
        //print(getDayOfWeek())
    }

    
    func setupView() {
        view.addSubview(MealPlanText)
        view.addSubview(dateLabel)
        view.addSubview(weekCollectionView)
        view.addSubview(lunchButton)
        view.addSubview(dinnerButton)
        view.addSubview(mealView)
        
        MealPlanText.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 20, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 15, right: nil, paddingRight: 0, width: 0, height: 0)
        
        dateLabel.anchor(top: MealPlanText.bottomAnchor, paddingTop: 50, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 15, right: nil, paddingRight: 0, width: 0, height: 0)
        
        weekCollectionView.anchor(top: dateLabel.bottomAnchor, paddingTop: 0, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 20, right: view.rightAnchor, paddingRight: 20, width: 0, height: 0)
        weekCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        
        lunchButton.anchor(top: weekCollectionView.bottomAnchor, paddingTop: 0, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 15, right: nil, paddingRight: 0, width: 0, height: 0)
        
        dinnerButton.anchor(top: weekCollectionView.bottomAnchor, paddingTop: 0, bottom: nil, paddingBottom: 0, left: lunchButton.rightAnchor, paddingLeft: 15, right: nil, paddingRight: 0, width: 0, height: 0)
        
        mealView.anchor(top: lunchButton.bottomAnchor, paddingTop: 5, bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 10, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, width: 0, height: 0)
        mealView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mealView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true

    }
    
    let sectionInsets = UIEdgeInsets(top: 10.0, left: 10, bottom: 10.0, right: 10)
    let numberOfItemsPerRow: CGFloat = 7
    let spacingBetweenCells: CGFloat = 5


}


extension MainWeekView:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! WeekCell
        let sizes = [75,100,75,50,100,30,100]
        let days = ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]
        
        UIView.animate(withDuration: 1.5, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: UIView.AnimationOptions.curveEaseInOut,
            animations: ({
            cell.heightConstraint?.constant = CGFloat(sizes[indexPath.item])
            cell.dayView.layoutIfNeeded()
        }), completion: nil)


        if days[indexPath.item] == getDayName() {
            cell.dayView.backgroundColor = UIColor(red: 0.04, green: 0.25, blue: 0.71, alpha: 1.00)
        }
        cell.dayLabel.text = days[indexPath.item]
        cell.backgroundColor = .white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalSpacing = (2 * sectionInsets.left) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
        let width = (weekCollectionView.bounds.width - totalSpacing)/numberOfItemsPerRow
        let height = weekCollectionView.bounds.height / 1.5
            return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 5

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         return spacingBetweenCells
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
        }
    
    
}

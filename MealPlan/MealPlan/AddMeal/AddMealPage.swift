//
//  AddMealPage.swift
//  MealPlan
//
//  Created by Christian Grinling on 29/10/2021.
//

import UIKit

class AddMealPage: UIViewController {
    
    lazy var myMealsText: UILabel = {
        let text = UILabel()
        text.layout(colour: .black, size: 28, text: "My Meals", bold: true)
        return text
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.setsizedImage(symbol: "magnifyingglass", size: 15, colour: .black)
        return button
    }()
    
    lazy var categoryStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.layout(axis: .horizontal, distribution: .equalCentering, alignment: .center, spacing: 10)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var buttonSize:CGFloat = CGFloat(15)
    
    lazy var breakfastButton: UIButton = {
        let button = UIButton()
        button.layout(textcolour: .black, backgroundColour: .clear, size: buttonSize, text: "Breakfast", image: nil, cornerRadius: 0)
        return button
    }()
    
    lazy var lunchButton: UIButton = {
        let button = UIButton()
        button.layout(textcolour: .black, backgroundColour: .clear, size: buttonSize, text: "Lunch", image: nil, cornerRadius: 0)
        return button
    }()
    
    lazy var dinnerButton: UIButton = {
        let button = UIButton()
        button.layout(textcolour: .black, backgroundColour: .clear, size: buttonSize, text: "Dinner", image: nil, cornerRadius: 0)
        return button
    }()
    
    lazy var mealCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionview = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionview.register(mealCell.self, forCellWithReuseIdentifier: "mealcell")
        collectionview.delegate = self
        collectionview.dataSource = self
        collectionview.backgroundColor = .white
        //collectionview.isScrollEnabled = false
        return collectionview
    }()
    
    lazy var addMealButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.04, green: 0.25, blue: 0.71, alpha: 1.00)
        button.setsizedImage(symbol: "plus", size: 15, colour: .white)
        button.layer.cornerRadius = 30
        button.layer.masksToBounds = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        addMealButton.addTarget(self, action: #selector(goToAddMeal), for: .touchUpInside)
    }
    
    @objc func goToAddMeal() {
        let gotomeal = addmeal()
        gotomeal.modalPresentationStyle = .overCurrentContext
        gotomeal.modalTransitionStyle = .coverVertical
        navigationController?.present(gotomeal, animated: true, completion: nil)
    }

    
    func setupView() {
        view.addSubview(myMealsText)
        view.addSubview(searchButton)
        view.addSubview(categoryStackView)
        categoryStackView.addArrangedSubview(breakfastButton)
        categoryStackView.addArrangedSubview(lunchButton)
        categoryStackView.addArrangedSubview(dinnerButton)
        view.addSubview(mealCollectionView)
        view.addSubview(addMealButton)
        
        myMealsText.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 0, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 15, right: nil, paddingRight: 0, width: 0, height: 0)
        
        searchButton.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 15, right: view.rightAnchor, paddingRight: 10, width: 30, height: 30)
        searchButton.centerYAnchor.constraint(equalTo: myMealsText.centerYAnchor).isActive = true
        
        categoryStackView.anchor(top: myMealsText.bottomAnchor, paddingTop: 0, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, width: 0, height: 0)
        categoryStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        categoryStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        categoryStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        
        mealCollectionView.anchor(top: categoryStackView.bottomAnchor, paddingTop: 0, bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 10, right: view.rightAnchor, paddingRight: 10, width: 0, height: 0)
        mealCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        addMealButton.anchor(top: nil, paddingTop: 0, bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 0, left: nil, paddingLeft: 0, right: view.rightAnchor, paddingRight: 10, width: 60, height: 60)
    }
    
    let sectionInsets = UIEdgeInsets(top: 10.0, left: 10, bottom: 10.0, right: 10)
    let numberOfItemsPerRow: CGFloat = 2
    let spacingBetweenCells: CGFloat = 10

}

extension AddMealPage:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mealcell", for: indexPath) as! mealCell
        cell.backgroundColor = UIColor(red: 0.98, green: 0.64, blue: 0.33, alpha: 1.00)
        cell.layer.cornerRadius = 20
        cell.layer.masksToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalSpacing = (2 * sectionInsets.left) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
        let width = (mealCollectionView.bounds.width - totalSpacing)/numberOfItemsPerRow
        //let height = mealCollectionView.bounds.height / 1.5
            return CGSize(width: width, height: width)
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

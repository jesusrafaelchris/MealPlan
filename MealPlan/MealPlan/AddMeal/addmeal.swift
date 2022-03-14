//
//  addmeal.swift
//  MealPlan
//
//  Created by Christian Grinling on 29/10/2021.
//

import UIKit

class addmeal: UIViewController {
    
    lazy var containerView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var addMealText: UILabel = {
        let text = UILabel()
        text.layout(colour: .black, size: 28, text: "New Meal", bold: true)
        return text
    }()
    
    lazy var nameText: UILabel = {
        let text = UILabel()
        text.layout(colour: UIColor(red: 0.52, green: 0.52, blue: 0.57, alpha: 1.00), size: 18, text: "Name", bold: true)
        return text
    }()
    
    lazy var mealNamelTextField: UITextField = {
        let text = UITextField()
        text.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont.boldSystemFont(ofSize: 15)
        ])
        text.addPadding()
        text.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.98, alpha: 1.00)
        text.layer.cornerRadius = 20
        text.layer.masksToBounds = true
        text.isUserInteractionEnabled = true
        return text
    }()
    
    lazy var mealImage: UIImageView = {
        let imageview = UIImageView()
        imageview.backgroundColor = .lightGray
        imageview.contentMode = .scaleAspectFit
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.isUserInteractionEnabled = true
        imageview.layer.cornerRadius = 15
        imageview.layer.masksToBounds = true
        return imageview
    }()
    
    lazy var categoryText: UILabel = {
        let text = UILabel()
        text.layout(colour: UIColor(red: 0.52, green: 0.52, blue: 0.57, alpha: 1.00), size: 18, text: "Category", bold: true)
        return text
    }()
    
    lazy var categoryStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.layout(axis: .horizontal, distribution: .fillEqually, alignment: .center, spacing: 10)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var buttonSize:CGFloat = CGFloat(18)
    var buttonBackground = UIColor(red: 0.97, green: 0.97, blue: 0.98, alpha: 1.00)
    var buttontextcolour:UIColor = .black
    
    lazy var breakfastButton: UIButton = {
        let button = UIButton()
        button.layout(textcolour: buttontextcolour, backgroundColour: buttonBackground, size: buttonSize, text: "Breakfast", image: nil, cornerRadius: 10)
        return button
    }()
    
    lazy var lunchButton: UIButton = {
        let button = UIButton()
        button.layout(textcolour: buttontextcolour, backgroundColour: buttonBackground, size: buttonSize, text: "Lunch", image: nil, cornerRadius: 10)
        return button
    }()
    
    lazy var dinnerButton: UIButton = {
        let button = UIButton()
        button.layout(textcolour: buttontextcolour, backgroundColour: buttonBackground, size: buttonSize, text: "Dinner", image: nil, cornerRadius: 10)
        return button
    }()
    
    lazy var doneButton: UIButton = {
        let button = UIButton()
        button.layout(textcolour: .white, backgroundColour: UIColor(red: 0.04, green: 0.25, blue: 0.71, alpha: 1.00), size: buttonSize, text: "Done", image: nil, cornerRadius: 10)
        return button
    }()
    
    lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.setsizedImage(symbol: "xmark.app", size: 30, colour: UIColor(red: 0.04, green: 0.25, blue: 0.71, alpha: 1.00))
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        setupView()
        dismissButton.addTarget(self, action: #selector(dismissPage), for: .touchUpInside)
        doneButton.addTarget(self, action: #selector(dismissPage), for: .touchUpInside)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        dismissPage()
    }
    
    @objc func dismissPage() {
        self.dismiss(animated: true)
    }
    
    func setupView() {
        view.addSubview(containerView)
        view.addSubview(dismissButton)
        view.addSubview(addMealText)
        view.addSubview(nameText)
        view.addSubview(mealNamelTextField)
        view.addSubview(mealImage)
        view.addSubview(categoryText)
        view.addSubview(categoryStackView)
        categoryStackView.addArrangedSubview(breakfastButton)
        categoryStackView.addArrangedSubview(lunchButton)
        categoryStackView.addArrangedSubview(dinnerButton)
        view.addSubview(doneButton)
        
        containerView.anchor(top: view.centerYAnchor, paddingTop: 20, bottom: view.bottomAnchor, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 0, right: view.rightAnchor, paddingRight: 0, width: 0, height: 0)
        
        dismissButton.anchor(top: containerView.topAnchor, paddingTop: 0, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: view.rightAnchor, paddingRight: 0, width: 50, height: 50)

        
        addMealText.anchor(top: containerView.topAnchor, paddingTop: 20, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 15, right: nil, paddingRight: 0, width: 0, height: 0)
        
        nameText.anchor(top: addMealText.bottomAnchor, paddingTop: 20, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 15, right: nil, paddingRight: 0, width: 0, height: 0)
        
        mealNamelTextField.anchor(top: nameText.bottomAnchor, paddingTop: 10, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 15, right: nil, paddingRight: 0, width: 0, height: 0)
        mealNamelTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        mealNamelTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        
        mealImage.anchor(top: nil, paddingTop: 0, bottom: mealNamelTextField.bottomAnchor, paddingBottom: 0, left: mealNamelTextField.rightAnchor, paddingLeft: 40, right: nil, paddingRight: 0, width: 80, height: 80)
        
        categoryText.anchor(top: mealNamelTextField.bottomAnchor, paddingTop: 20, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 15, right: nil, paddingRight: 0, width: 0, height: 0)
        
        categoryStackView.anchor(top: categoryText.bottomAnchor, paddingTop: 15, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, width: 0, height: 0)
        categoryStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        categoryStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        categoryStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        
        doneButton.anchor(top: nil, paddingTop: 0, bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 15, right: view.rightAnchor, paddingRight: 15, width: 0, height: 50)
        
    }

}

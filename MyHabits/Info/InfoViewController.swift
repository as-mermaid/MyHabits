//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Anastasia Smorodinova on 10.02.2023.
//

import UIKit

private enum Constants : Int {
   
    case offset = 12
    case sideOffset = 16
    case topOffset = 22
}

let texts = InfoText.make()

class InfoViewController: UIViewController {
    
    // MARK: - Subviews
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Привычка за 21 день"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    for i in 0..<texts.count {
//
//    }
    
    private lazy var textLabel0: UILabel = {
        let label = UILabel()
        label.text = texts[0].text
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textLabel1: UILabel = {
        let label = UILabel()
        label.text = texts[1].text
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textLabel2: UILabel = {
        let label = UILabel()
        label.text = texts[2].text
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textLabel3: UILabel = {
        let label = UILabel()
        label.text = texts[3].text
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textLabel4: UILabel = {
        let label = UILabel()
        label.text = texts[4].text
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textLabel5: UILabel = {
        let label = UILabel()
        label.text = texts[5].text
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textLabel6: UILabel = {
        let label = UILabel()
        label.text = texts[6].text
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackView: UIStackView = { [unowned self] in
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .vertical
//        stackView.distribution = .fillEqually
//        stackView.alignment = .fill
        stackView.spacing = CGFloat(Constants.offset.rawValue)
            
        stackView.addArrangedSubview(self.textLabel0)
        stackView.addArrangedSubview(self.textLabel1)
        stackView.addArrangedSubview(self.textLabel2)
        stackView.addArrangedSubview(self.textLabel3)
        stackView.addArrangedSubview(self.textLabel4)
        stackView.addArrangedSubview(self.textLabel5)
        stackView.addArrangedSubview(self.textLabel6)
        
        return stackView
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        addSubviews()
        setupConstraints()
        
    }
    

    // MARK: - Private
    
    private func setupView() {
        title = "Информация"
        view.backgroundColor = .systemBackground
        
        tabBarItem = UITabBarItem(
            title: "Информация",
            image: UIImage(systemName: "info.circle.fill"),
            tag: 1
        )
    }
    
    private func addSubviews () {
        
        view.addSubview(scrollView)
        scrollView.addSubview(headerLabel)
        scrollView.addSubview(stackView)
        
    }
    
    private func setupConstraints(){
        
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            headerLabel.leadingAnchor.constraint(
                equalTo: scrollView.leadingAnchor,
                constant: CGFloat(Constants.sideOffset.rawValue)
            ),
            headerLabel.trailingAnchor.constraint(
                equalTo: scrollView.trailingAnchor,
                constant: -CGFloat(Constants.sideOffset.rawValue)
            ),
            headerLabel.topAnchor.constraint(
                equalTo: scrollView.topAnchor,
                constant: CGFloat(Constants.topOffset.rawValue)
            )
        ])
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(
                equalTo: scrollView.leadingAnchor,
                constant: CGFloat(Constants.sideOffset.rawValue)
            ),
            stackView.widthAnchor.constraint(
                equalToConstant: UIScreen.main.bounds.width
                - 2 * CGFloat(Constants.sideOffset.rawValue)
            ),
            stackView.topAnchor.constraint(
                equalTo: headerLabel.bottomAnchor,
                constant: CGFloat(Constants.sideOffset.rawValue)
            ),
            stackView.bottomAnchor.constraint(
                equalTo: scrollView.bottomAnchor,
                constant: -CGFloat(Constants.sideOffset.rawValue)
            )
        ])
        
    }
}

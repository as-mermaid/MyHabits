//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Anastasia Smorodinova on 10.02.2023.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        
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
    

}

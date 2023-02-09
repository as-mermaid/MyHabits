//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Anastasia Smorodinova on 10.02.2023.
//

import UIKit

class HabitsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        
    }
    

    // MARK: - Private
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        
        tabBarItem = UITabBarItem(
            title: "Привычки",
            image: UIImage(named: "habits_tab_icon"),
            tag: 0
        )
    }

}

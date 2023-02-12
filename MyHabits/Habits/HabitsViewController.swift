//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Anastasia Smorodinova on 10.02.2023.
//

import UIKit

class HabitsViewController: UIViewController {

    // MARK: - Lifecycle
    
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
        
        let barButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addHabit))
        navigationItem.rightBarButtonItem = barButton
    }

    @objc func addHabit() {
        let addHabitViewController = HabitViewController()

        addHabitViewController.modalTransitionStyle = .crossDissolve
        addHabitViewController.modalPresentationStyle = .currentContext

        navigationController?.pushViewController(addHabitViewController, animated: true)
        
    }
}

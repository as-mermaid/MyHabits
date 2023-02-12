//
//  HabitViewController.swift
//  MyHabits
//
//  Created by Anastasia Smorodinova on 12.02.2023.
//

import UIKit

private enum Constants : Int {
   
    case headingOffset = 7
    case offset = 15
    case sideOffset = 16
    case topOffset = 21
    case colorDiametr = 30
}

private struct NewHabit {
    var habitName: String
    var habitColor: UIColor
    var habitDate: Date
}

private var newHabit = NewHabit(
    habitName: "",
    habitColor: UIColor(named: "Orange Color") ?? .systemBackground,
    habitDate: Date ()
)

class HabitViewController: UIViewController {

    // MARK: - Subviews
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "НАЗВАНИЕ"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameTextField: UITextField = {
        let field = UITextField()
        field.text = newHabit.habitName
        field.placeholder = "Бегать по утрам, спать 8 часов и т.п."
        field.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        field.textColor = UIColor(named: "Blue Color")
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private lazy var colorLabel: UILabel = {
        let label = UILabel()
        label.text = "ЦВЕТ"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var colorView: UIView = {
        let view = UIView ()
        view.backgroundColor = newHabit.habitColor
        view.layer.cornerRadius = CGFloat (Constants.colorDiametr.rawValue) / 2
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
  
        view.isUserInteractionEnabled = true
        let tapColor = UITapGestureRecognizer (
            target: self,
            action: #selector(didTapColor)
        )
        view.addGestureRecognizer(tapColor)
        
        return view
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "ВРЕМЯ"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var timeSelect: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .time
        datePicker.tintColor = UIColor(named: "Purple Color")
        datePicker.date = newHabit.habitDate
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        addSubviews()
        setupConstraints()
        
    }
    // MARK: - Actions
    
    @objc func didTapColor(_ sender: UIView) {
        
    }
    
    @objc func saveHabit() {
        
        let newHabit = Habit(name: "Выпить стакан воды перед завтраком",
                             date: Date(),
                             color: .systemRed)
        
        let store = HabitsStore.shared
        store.habits.append(newHabit)
    }
   
    @objc func cancelAddingHabit() {

    }
    
    @objc func nameHabitChanged(_ sender: UITextField) {
        newHabit.habitName = nameTextField.text ?? ""
    }
    
    @objc func dateHabitChanged(_ sender: UIDatePicker) {
        newHabit.habitDate = timeSelect.date
    }
    
    // MARK: - Private
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        title = "Создать"
        
        
        let saveBarButton = UIBarButtonItem (title: "Сохранить", style: .plain, target: self, action: #selector(saveHabit))
        navigationItem.rightBarButtonItem = saveBarButton
        
        let cancelBarButton = UIBarButtonItem (title: "Отменить", style: .plain, target: self, action: #selector(cancelAddingHabit))
        navigationItem.leftBarButtonItem = cancelBarButton
    }
    
    private func addSubviews() {
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(colorLabel)
        view.addSubview(colorView)
        view.addSubview(timeLabel)
        view.addSubview(timeSelect)
    }
    
    private func setupConstraints(){
        
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(
                equalTo: safeAreaGuide.leadingAnchor,
                constant: CGFloat(Constants.sideOffset.rawValue)
            ),
            nameLabel.trailingAnchor.constraint(
                equalTo: safeAreaGuide.trailingAnchor,
                constant: -CGFloat(Constants.sideOffset.rawValue)
            ),
            nameLabel.topAnchor.constraint(
                equalTo: safeAreaGuide.topAnchor,
                constant: CGFloat(Constants.topOffset.rawValue)
            )
        ])
        
        NSLayoutConstraint.activate([
            nameTextField.leadingAnchor.constraint(
                equalTo: safeAreaGuide.leadingAnchor,
                constant: CGFloat(Constants.sideOffset.rawValue)
            ),
            nameTextField.trailingAnchor.constraint(
                equalTo: safeAreaGuide.trailingAnchor,
                constant: -CGFloat(Constants.sideOffset.rawValue)
            ),
            nameTextField.topAnchor.constraint(
                equalTo: nameLabel.bottomAnchor,
                constant: CGFloat(Constants.headingOffset.rawValue)
            )
        ])
        
        NSLayoutConstraint.activate([
            colorLabel.leadingAnchor.constraint(
                equalTo: safeAreaGuide.leadingAnchor,
                constant: CGFloat(Constants.sideOffset.rawValue)
            ),
            colorLabel.trailingAnchor.constraint(
                equalTo: safeAreaGuide.trailingAnchor,
                constant: -CGFloat(Constants.sideOffset.rawValue)
            ),
            colorLabel.topAnchor.constraint(
                equalTo: nameTextField.bottomAnchor,
                constant: CGFloat(Constants.offset.rawValue)
            )
        ])
        
        NSLayoutConstraint.activate([
            colorView.leadingAnchor.constraint(
                equalTo: safeAreaGuide.leadingAnchor,
                constant: CGFloat(Constants.sideOffset.rawValue)
            ),
            colorView.heightAnchor.constraint(
                equalToConstant: CGFloat(Constants.colorDiametr.rawValue)
            ),
            colorView.widthAnchor.constraint(
                equalToConstant: CGFloat(Constants.colorDiametr.rawValue)
            ),
            colorView.topAnchor.constraint(
                equalTo: colorLabel.bottomAnchor,
                constant: CGFloat(Constants.headingOffset.rawValue)
            )
        ])
        
        NSLayoutConstraint.activate([
            timeLabel.leadingAnchor.constraint(
                equalTo: safeAreaGuide.leadingAnchor,
                constant: CGFloat(Constants.sideOffset.rawValue)
            ),
            timeLabel.trailingAnchor.constraint(
                equalTo: safeAreaGuide.trailingAnchor,
                constant: -CGFloat(Constants.sideOffset.rawValue)
            ),
            timeLabel.topAnchor.constraint(
                equalTo: colorView.bottomAnchor,
                constant: CGFloat(Constants.offset.rawValue)
            )
        ])
        
        NSLayoutConstraint.activate([
            timeSelect.leadingAnchor.constraint(
                equalTo: safeAreaGuide.leadingAnchor,
                constant: CGFloat(Constants.sideOffset.rawValue)
            ),
            timeSelect.trailingAnchor.constraint(
                equalTo: safeAreaGuide.trailingAnchor,
                constant: -CGFloat(Constants.sideOffset.rawValue)
            ),
            timeSelect.topAnchor.constraint(
                equalTo: timeLabel.bottomAnchor,
                constant: CGFloat(Constants.headingOffset.rawValue)
            )
        ])
        
    }
    
}

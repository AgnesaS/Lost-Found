//
//  PostViewController.swift
//  Lost&Found
//
//  Created by Agnesa  on 26.5.23.
//

import UIKit

protocol PostViewControllerDelegate: AnyObject {
    func didCreatePost(_ post: Post, category: String)
}
class PostViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var categoryTypeTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    
    weak var delegate: PostViewControllerDelegate?
    let datePicker = UIDatePicker()
    let dateFormatter = DateFormatter()
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryPicker()
        dateAndTimePicker()
    }
    //MARK: Functions
    func categoryPicker(){
        let pickerView = UIPickerView()
        pickerView.delegate = self
        categoryTypeTextField.inputView = pickerView
        pickerView.backgroundColor = .white
        pickerView.tintColor = .black
        pickerView.setValue(UIColor.black, forKey: "textColor")
        categoryTypeTextField.font = UIFont.systemFont(ofSize: 16)
    }
    func dateAndTimePicker(){
        datePicker.datePickerMode = .dateAndTime
        datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
        datePicker.tintColor = .black
        datePicker.setValue(UIColor.black, forKey: "textColor")
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showDatePickerAlert(_:)))
        dateTextField.addGestureRecognizer(tapGesture)
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        dateTextField.text = dateFormatter.string(from: sender.date)
        self.dismiss(animated: true, completion: nil)
    }
    @objc func showDatePickerAlert(_ gesture: UITapGestureRecognizer) {
        let alert = UIAlertController(title: "Select Date", message: "\n\n\n\n", preferredStyle: .alert)
        
        // Add the date picker as a subview of the alert's view
        let container = UIView(frame: CGRect(x: 0, y: 0, width: 270, height: 200))
        
        // Add tap gesture recognizer to the container view
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleContainerViewTap(_:)))
        container.addGestureRecognizer(tapGesture)
        
        // Add the date picker to the container view
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(datePicker)
        
        // Add constraints to center the date picker within the container view
        datePicker.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        datePicker.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
        
        alert.view.addSubview(container)
        
        present(alert, animated: true, completion: nil)
    }
    @objc func handleContainerViewTap(_ gesture: UITapGestureRecognizer) {
    }
    func navigateToHome() {
        let homeViewController = storyboard?.instantiateViewController(withIdentifier: "TabBaarViewController") as! TabBaarViewController
        homeViewController.modalPresentationStyle = .fullScreen
        homeViewController.modalTransitionStyle = .flipHorizontal
        self.present(homeViewController, animated: true, completion: nil)
    }
    //MARK: IBActions
    @IBAction func postButtonTapped(_ sender: Any) {
        print("button clicked")
        guard let category = categoryTypeTextField.text else {
            return
        }
        let title = titleTextField.text ?? ""
        let description = descriptionTextField.text ?? ""
        let location = locationTextField.text ?? ""
        let date = dateTextField.text ?? ""
        
        let post = Post(image: UIImage(named: "1")!, title: title, location: location, date: date, postDescription: description)
        
        delegate?.didCreatePost(post, category: category)
        
        let alertController = UIAlertController(title: "Alert", message: "Your post has been created", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            self?.navigateToHome()
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
extension PostViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if row == 0 {
            return "Found"
        }
        else if row == 1 {
            return "Lost"
        }
        return nil
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 0 {
            categoryTypeTextField.text = "Found"
        }else if row == 1 {
            categoryTypeTextField.text = "Lost"
        }
    }
}
extension PostViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
}

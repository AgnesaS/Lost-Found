//
//  PostViewController.swift
//  Lost&Found
//
//  Created by Agnesa  on 26.5.23.
//

import UIKit
import CoreLocation
import Photos

class PostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //MARK: IBOutlets
    
    @IBOutlet weak var postOwnerTextField: UITextField!
    @IBOutlet weak var categoryTypeTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var conactTextField: UITextField!
    
    var imagePicker: UIImagePickerController?
    let datePicker = UIDatePicker()
    let dateFormatter = DateFormatter()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImagePicker()
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
    func validateFields() -> Bool{
        guard let postOwner = postOwnerTextField.text, !postOwner.isEmpty else{
            self.postOwnerTextField.becomeFirstResponder()
            self.showAlertWith(title: "Lost & Found", message: "Please write your first name and last name".localizableString())
            return false
        }
        guard let categoryType = categoryTypeTextField.text, !categoryType.isEmpty else{
            self.categoryTypeTextField.becomeFirstResponder()
            self.showAlertWith(title: "Lost & Found", message: "Please select your category".localizableString())
            return false
        }
        guard let title = titleTextField.text, !title.isEmpty else{
            self.titleTextField.becomeFirstResponder()
            self.showAlertWith(title: "Lost & Found", message: "Please enter your title".localizableString())
            return false
        }
        guard let description = descriptionTextField.text, !description.isEmpty else{
            self.descriptionTextField.becomeFirstResponder()
            self.showAlertWith(title: "Lost & Found", message: "Please enter your description".localizableString())
            return false
        }
        guard let location = locationTextField.text, !location.isEmpty else{
            self.locationTextField.becomeFirstResponder()
            self.showAlertWith(title: "Lost & Found", message: "Please enter your location".localizableString())
            return false
        }
        guard let dateAndTime = dateTextField.text, !dateAndTime.isEmpty else{
            self.dateTextField.becomeFirstResponder()
            self.showAlertWith(title: "Lost & Found", message: "Please enter date and time".localizableString())
            return false
        }
        guard let contactInfo = conactTextField.text, !contactInfo.isEmpty else{
            self.conactTextField.becomeFirstResponder()
            self.showAlertWith(title: "Lost & Found", message: "Please enter contact information".localizableString())
            return false
        }
        return true
    }
    func setupImagePicker(){
        imagePicker = UIImagePickerController()
        imagePicker?.sourceType = .photoLibrary
        imagePicker?.delegate = self
        PHPhotoLibrary.requestAuthorization { status in
            print("request autherization status: \(status)")
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        postImageView.image = selectedImage
        imagePicker?.dismiss(animated: true)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePicker?.dismiss(animated: true)
    }
    //MARK: IBActions
    @IBAction func addPostImageButtonTapped(_ sender: Any) {
        if PHPhotoLibrary.authorizationStatus() == .authorized{
            if let imagePic = imagePicker{
                present(imagePic, animated: true)
            }
        }
    }
    
    @IBAction func postButtonTapped(_ sender: Any) {
        print("button clicked")
        if validateFields(){
            guard let category = categoryTypeTextField.text else {
                return
            }
            let title = titleTextField.text ?? ""
            let description = descriptionTextField.text ?? ""
            let location = locationTextField.text ?? ""
            let date = dateTextField.text ?? ""
            let postImage = postImageView.image
            let postOwner = "Posted by: \(postOwnerTextField.text ?? "")"
            let contactInfo = conactTextField.text ?? ""
            
            let post = Post(id: 1, image: postImage!, title: title, location: location, date: date,postOwner: postOwner, postDescription: description, contactInfo: contactInfo)
            
//            delegate?.didCreatePost(post, category: category)
            var postObj: [String: Any] = ["post": post, "category": category]
            NotificationCenter.default.post(name: Notification.Name("refreshHome"), object: nil, userInfo: postObj)

            
            let alertController = UIAlertController(title: "Alert", message: "Your post has been created", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
                        // Clear the text fields
                        self?.categoryTypeTextField.text = nil
                        self?.titleTextField.text = nil
                        self?.descriptionTextField.text = nil
                        self?.locationTextField.text = nil
                        self?.dateTextField.text = nil
                        self?.postOwnerTextField.text = nil
                        self?.conactTextField.text = nil
                        
                        // Clear the image view
                        self?.postImageView.image = nil
                        
                        // Clear the post object (if needed)
                     postObj.removeValue(forKey: "post")
                    }
                    alertController.addAction(okAction)
                    present(alertController, animated: true, completion: nil)
                }
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

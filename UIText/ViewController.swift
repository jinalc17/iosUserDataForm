//
//  ViewController.swift
//  UIText
//
//  Created by user239775 on 1/26/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    
    @IBOutlet weak var countryNameTextField: UITextField!
    
    
    @IBOutlet weak var ageTextField: UITextField!
    
    
    @IBOutlet weak var resultTextView: UITextView!
    
    @IBOutlet weak var successLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var addButton: UIButton!
    
    
    @IBOutlet weak var clearButton: UIButton!
    
    
    @IBOutlet weak var stackViewForm: UIStackView!
    
    @IBOutlet weak var stackViewDisplay: UIStackView!
    
    @IBOutlet weak var stackViewButtons: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the delegate for each text field
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        countryNameTextField.delegate = self
        ageTextField.delegate = self
        successLabel.numberOfLines = 0
        successLabel.lineBreakMode = .byWordWrapping
        // Call showUserInformation to initialize resultTextView
        showUserInformation()
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        // Implement logic to display user information in resultTextView
        showAddButtonuserInformation()
    }
    @IBAction func submitButtonTapped(_ sender: Any) {
        // Implement logic to check if all information is provided, then show success message or missing info message
        submitUserData()
    }
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        // Implement logic to clear all text fields and resultTextView
        clearForm()
    }
    
    // Function to display user information in resultTextView
    func showUserInformation() {
        guard let firstName = firstNameTextField.text, !firstName.isEmpty,
              let lastName = lastNameTextField.text, !lastName.isEmpty,
              let country = countryNameTextField.text, !country.isEmpty,
              let age = ageTextField.text, !age.isEmpty else {
            return
        }
        
        // Combine user input and display in resultTextView
        let userInformation = """
                First Name: \(firstName)
                Last Name: \(lastName)
                Country: \(country)
                Age: \(age)
            """
        resultTextView.text = userInformation
    }
    
    func showAddButtonuserInformation(){
        resultTextView.text = ""
        guard let firstName = firstNameTextField.text, !firstName.isEmpty,
              let lastName = lastNameTextField.text, !lastName.isEmpty,
              let country = countryNameTextField.text, !country.isEmpty,
              let age = ageTextField.text, !age.isEmpty else {
            return
        }
        
        let fullName = "\(firstName) \(lastName)"
        
        let userInformation = """
                Full Name: \(fullName)
                Country: \(country)
                Age: \(age)
            """
        resultTextView.text = userInformation
    }
    
    // UITextFieldDelegate method to respond to editingDidEnd event
    func textFieldDidEndEditing(_ textField: UITextField) {
        showUserInformation()
    }
    
    // Function to submit user data and show success or missing info message
    func submitUserData() {
        if allInformationProvided() {
            successLabel.text = "Successfully submitted!\n"
            successLabel.text! += """
                First Name: \(firstNameTextField.text ?? "")
                Last Name: \(lastNameTextField.text ?? "")
                Country: \(countryNameTextField.text ?? "")
                Age: \(ageTextField.text ?? "")
            """
        } else {
            successLabel.text = "Complete the missing Info!"
        }
        successLabel.isHidden = false
    }
    
    // Function to check if all information is provided
    func allInformationProvided() -> Bool {
        return !(firstNameTextField.text?.isEmpty ?? true) &&
        !(lastNameTextField.text?.isEmpty ?? true) &&
        !(countryNameTextField.text?.isEmpty ?? true) &&
        !(ageTextField.text?.isEmpty ?? true)
    }
    
    // Function to clear all text fields and resultTextView
    func clearForm() {
        firstNameTextField.text = ""
        lastNameTextField.text = ""
        countryNameTextField.text = ""
        ageTextField.text = ""
        resultTextView.text = ""
        successLabel.isHidden = true
    }
}



//
//  SearchVC.swift
//  GHFollowers
//
//  Created by Giorgi Mekvabishvili on 15.03.26.
//

import UIKit

class SearchVC: UIViewController {
    
    let logoImageView = UIImageView()
    let usernameTextField =  GFTextField()
    let callToActionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    var isUsernameEntered: Bool {
        guard let username = usernameTextField.text else {
            return false
        }

        return !username.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    let usernameCharacterLimit = 39
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        Imageconstraints()
        configureTextField()
        configureCallToActionButton()
        createDismissKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usernameTextField.text = ""
    }
    
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }
    
   @objc func pushFollowerListVC() {
       guard isUsernameEntered else {
           presentGFAlertOnMainThread(title: "Empty Username", message: "Please enter a username", buttonTitle: "Ok")
           return }
       
       usernameTextField.resignFirstResponder()
       
        let followerListVC = FollowerListVC()
       followerListVC.username = usernameTextField.text
       followerListVC.title = usernameTextField.text
       navigationController?.pushViewController(followerListVC, animated: true)
    }
    
    func configureLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")
    }
    
    func Imageconstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    func configureTextField() {
        view.addSubview(usernameTextField)
        usernameTextField.delegate = self
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureCallToActionButton() {
        view.addSubview(callToActionButton)
        callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }}
    
    extension SearchVC: UITextFieldDelegate {
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            guard let currentText = textField.text,
                  let textRange = Range(range, in: currentText) else {
                print("SearchVC: failed to read current text for limit check")
                return true
            }

            let updatedText = currentText.replacingCharacters(in: textRange, with: string)
            let isAllowed = updatedText.count <= usernameCharacterLimit


            return isAllowed
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            pushFollowerListVC()
            return true
        }
    }


//
//  SearchVC.swift
//  GithubFollowers
//
//  Created by Travis W. Stanifer on 12/29/19.
//  Copyright © 2019 Travis Stanifer. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    
    let logoImageView = UIImageView()
    let usernameField = GFTextfield()
    let actionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    var logoImageViewTopConstraint: NSLayoutConstraint!
    
    var isUsernameEntered: Bool {
        return !usernameField.text!.isEmpty
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogo()
        configureTextfield()
        configureActionButton()
    }
    
    
    @objc func pushFollowerListVC() {
        guard isUsernameEntered else {
            presentGFAlertOnMainThread(alertTitle: "Oops!", message: "Please enter a username so know who to look for 😊", buttonTitle: "Got it")
            return
        }
        
        let vc = FollowerListVC()
        vc.username = usernameField.text
        vc.title = usernameField.text
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    func configureLogo() {
        logoImageView.image = UIImage(named: "gh-logo")!
        view.addSubview(logoImageView)
        
        logoImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: nil, right: nil, bottom: nil, paddingTop: 80, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 200, height: 200)
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    
    func configureTextfield() {
        view.addSubview(usernameField)
        usernameField.delegate = self
        
        usernameField.anchor(top: logoImageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, paddingTop: 80, paddingLeft: 40, paddingRight: 40, paddingBottom: 0, width: 0, height: 50)
    }
    
    
    func configureActionButton() {
        view.addSubview(actionButton)
        actionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        actionButton.anchor(top: nil, left: view.leftAnchor, right: view.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingTop: 0, paddingLeft: 40, paddingRight: 40, paddingBottom: 80, width: 0, height: 50)
    }
    
    
}


extension SearchVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
}

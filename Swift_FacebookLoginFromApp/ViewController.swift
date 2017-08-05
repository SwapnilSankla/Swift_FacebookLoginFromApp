//
//  ViewController.swift
//  Swift_FacebookLoginFromApp
//
//  Created by Swapnil Sankla on 05/08/17.
//  Copyright © 2017 Swapnil Sankla. All rights reserved.
//

import UIKit

import FacebookCore
import FacebookLogin
import Foundation
import UIKit

class ViewController: UIViewController {
    var loginEventsListener: LoginEventsListener?
    var loginPresenter: LoginPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        loginEventsListener = LoginEventsListener(viewController: self)
        loginPresenter = LoginPresenter(viewController: self)
        view.addSubview(initializeLoginButton())
    }

    public func showDialog(with message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default))
        present(alert, animated: true, completion: nil)
    }

    @IBAction func whoAmIButtonTapped(_ sender: Any) {
        loginPresenter?.handleWhoAmIUserAction()
    }

    @IBAction func amIloggedInButtonTapped(_ sender: Any) {
        loginPresenter?.handleAmILoggedInUserAction()
    }

    private func initializeLoginButton() -> LoginButton {
        let loginButton = LoginButton(readPermissions: [.userFriends, .publicProfile, .email])
        loginButton.center = view.center
        loginButton.delegate =  loginEventsListener
        return loginButton
    }
}


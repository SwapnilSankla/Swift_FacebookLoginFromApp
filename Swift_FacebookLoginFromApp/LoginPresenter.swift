//
//  LoginPresenter.swift
//  FBLogin
//
//  Created by Swapnil Sankla on 05/08/17.
//  Copyright © 2017 Swapnil Sankla. All rights reserved.
//

import Foundation
import UIKit
import FacebookCore

class LoginPresenter {
    weak var viewController: ViewController?

    init(viewController: ViewController) {
        self.viewController = viewController
    }

    func handleAmILoggedInUserAction() {
        var message = "No"
        if let _ = AccessToken.current {
            message = "Yes"
        }
        viewController?.showDialog(with: message)
    }

    func handleWhoAmIUserAction() {
        let graphRequestConnection = GraphRequestConnection()
        graphRequestConnection.add(FacebookProfileRequest(), completion: { [weak self] (response, result) in
            switch(result) {
            case .success(let response):
                if let name = response.dictionaryValue?["name"] as? String {
                    self?.viewController?.showDialog(with: name)
                }
            default: self?.viewController?.showDialog(with: "I don't know")
            }
        })
        graphRequestConnection.start()
    }
}

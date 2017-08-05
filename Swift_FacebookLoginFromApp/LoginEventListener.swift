import UIKit
import FacebookLogin

class LoginEventsListener: LoginButtonDelegate {
    weak var viewController: ViewController?

    init(viewController: ViewController) {
        self.viewController = viewController
    }

    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
        var message = ""
        switch result {
        case .success(_, _, let token):
            message = "\(token.userId!) is logged in"
            break
        case .failed(let error) :
            message = error.localizedDescription
            break
        default: break
        }
        viewController?.showDialog(with: message)
    }

    func loginButtonDidLogOut(_ loginButton: LoginButton) {
        
    }
}

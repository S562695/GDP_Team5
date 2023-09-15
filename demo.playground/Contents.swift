import UIKit
import PlaygroundSupport

class LoginViewController: UIViewController {
    
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // Create a UIButton
let submitButton = UIButton(type: .system)
submitButton.setTitle("Submit", for: .normal)
submitButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
submitButton.tintColor = .white
submitButton.backgroundColor = .blue
submitButton.layer.cornerRadius = 5
submitButton.translatesAutoresizingMaskIntoConstraints = false

// Add the submitButton to the view
view.addSubview(submitButton)

// Define constraints for the submitButton
NSLayoutConstraint.activate([
    submitButton.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
    submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
    submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
    submitButton.heightAnchor.constraint(equalToConstant: 40)
])

// Add a target action for the button
submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)

// Function to handle button tap
@objc func submitButtonTapped() {
    // Add your code here to handle the button tap
    print("Submit button tapped!")
}

        
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .blue
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 5
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        view.addSubview(loginButton)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
   @objc func loginButtonTapped() {
    guard let username = usernameTextField.text, let password = passwordTextField.text else {
        print("Invalid input")
        return
    }
    if isValidCredentials(username: username, password: password) {
        print("Login successful")
    } else {
        print("Login failed")
    }
}
func isValidCredentials(username: String, password: String) -> Bool {
    return username == "your_username" && password == "your_password"
}
}

let loginViewController = LoginViewController()
PlaygroundPage.current.liveView = loginViewController

//adding register button to login page
import UIKit

class LoginViewController: UIViewController {

    // Other code for your login view controller
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        // Perform the segue to the registration view controller
        performSegue(withIdentifier: "RegisterSegue", sender: self)
    }
    
    // Other methods and properties for your login view controller
}


        
        
        
    




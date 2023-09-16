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
submitButton.backgroundColor = .black
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

@IBAction func resetPasswordButtonTapped(_ sender: UIButton) {
    // Validate user input (e.g., check if email is valid)
    guard let emailAddress = emailTextField.text, !emailAddress.isEmpty else {
        // Show an error message to the user indicating invalid input
        return
    }
    
    // Generate a unique reset token or code (e.g., a UUID)
    let resetToken = UUID().uuidString

    // Send a reset email or SMS to the user (implement this part using your email/SMS service)
    sendResetEmail(to: emailAddress, withToken: resetToken)
    
    // Display a confirmation message
    let confirmationAlert = UIAlertController(title: "Password Reset", message: "An email has been sent with instructions to reset your password.", preferredStyle: .alert)
    confirmationAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    present(confirmationAlert, animated: true, completion: nil)
}

func sendResetEmail(to email: String, withToken token: String) {
    // Implement this method to send a reset email to the user using your email service
    // You'll need to construct the email content and send it to the user's email address.
}
class DonateBloodViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red // You can set the background color or customize this view controller as needed for the "Donate Blood" tab.
        
        // Add your UI elements and layout constraints for this view controller here.
    }
}


        
        
        
    




import UIKit
import PlaygroundSupport

class LoginViewController: UIViewController {
    
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        
        // Create a UIButton
let submitButton = UIButton(type: .system)
submitButton.setTitle("Submit", for: .normal)
submitButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
submitButton.tintColor = .green
submitButton.backgroundColor = .orange
submitButton.layer.cornerRadius = 6
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
        loginButton.layer.cornerRadius = 6
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
    func sendResetEmail(to email: String, withToken token: String) {
    // Configure your email service (Replace placeholders with actual values)
    let smtpServer = "your-smtp-server.com"
    let smtpPort = 587
    let smtpUsername = "your-username"
    let smtpPassword = "your-password"
    
    // Compose the email message
    let subject = "Password Reset Request"
    let body = "To reset your password, click on the following link: https://example.com/reset?token=\(token)"
    
    // Create an instance of the SMTP client (You need to implement this part)
    let smtpClient = SMTPClient(server: smtpServer, port: smtpPort, username: smtpUsername, password: smtpPassword)
    
    // Send the email
    do {
        try smtpClient.sendEmail(to: email, subject: subject, body: body)
        print("Password reset email sent successfully.")
    } catch {
        print("Error sending password reset email: \(error)")
    }
}

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
let settingsButton = UIButton()
settingsButton.setTitle("Settings", for: .normal)
settingsButton.backgroundColor = UIColor.blue
settingsButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
settingsButton.translatesAutoresizingMaskIntoConstraints = false

let loginViewController = LoginViewController()
let donateBloodViewController = DonateBloodViewController()

let tabBarController = UITabBarController()
tabBarController.viewControllers = [loginViewController, donateBloodViewController]

let loginTabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0) // Customize the icon and title as needed.
let donateBloodTabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1) // Customize the icon and title as needed.

loginViewController.tabBarItem = loginTabBarItem
donateBloodViewController.tabBarItem = donateBloodTabBarItem

let navigationController = UINavigationController(rootViewController: tabBarController)

// Present the tab bar controller as the root view controller
PlaygroundPage.current.liveView = navigationController


struct ContentView: View {
    var body: some View {
        Button(action: {
        }) {
            Text("Register")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//Added some text with LEARN MORE Button
    @IBOutlet weak var infoLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Customize the label text
        infoLabel.text = "We need volunteers to help donate blood.\nVolunteer opportunities include supporting blood donations and providing much-needed services to your community."

        infoLabel.font = UIFont.systemFont(ofSize: 16)
        infoLabel.textColor = UIColor.darkText
        infoLabel.numberOfLines = 0 // Allow multiple lines

        let learnMoreButton = UIButton(type: .system)
        learnMoreButton.setTitle("Learn More", for: .normal)
        learnMoreButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        learnMoreButton.tintColor = UIColor.blue

        learnMoreButton.addTarget(self, action: #selector(learnMoreButtonTapped), for: .touchUpInside)

        view.addSubview(learnMoreButton)
        learnMoreButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            learnMoreButton.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 20),
            learnMoreButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc func learnMoreButtonTapped() {
        // Implement what happens when the "Learn More" button is tapped
        // For example, you can open a web page or navigate to another view controller.
        print("Learn More button tapped!")
    }
}

        
    




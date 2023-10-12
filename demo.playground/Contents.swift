import UIKit
import PlaygroundSupport

class LoginViewController: UIViewController {
    
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        shareButton.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)

        
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
    }
}

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

class RegistrationSuccessViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let successLabel = UILabel()
                successLabel.text = "Registration Successful!"
                successLabel.textAlignment = .center
                successLabel.font = UIFont.boldSystemFont(ofSize: 20)
                successLabel.textColor = .white
                successLabel.translatesAutoresizingMaskIntoConstraints = false
                
                view.addSubview(successLabel)
                
                // Define constraints for the successLabel
                NSLayoutConstraint.activate([
                    successLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    successLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
                ])
    }
 // Added new "Donate Now" button which can navigate to the other page
override func viewDidLoad() {
        super.viewDidLoad()
        createButton()
    }
    func createButton() {
        let button = UIButton(type: .system)
        button.setTitle("Donate Now", for: .normal)
        button.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        view.addSubview(button)
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "YourSegueIdentifier", sender: self)
    }
}

// // Adding  the back button tap
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Main Screen"
        
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonTapped))
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func backButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}


//UI for "Forgot Password" View:
let forgotPasswordButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Forgot Password?", for: .normal)
    button.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
    return button
}()


@objc func shareButtonTapped() {
    // Content to be shared (e.g., a message, URL, or image)
    let textToShare = "Check out this amazing Blood Bank app!"
    let appURL = URL(string: "https://www.yourappwebsite.com") // Replace with your app's website URL
    
    // Create an array of items to share
    var itemsToShare: [Any] = [textToShare]
    
    // Add the app URL if available
    if let appURL = appURL {
        itemsToShare.append(appURL)
    }
    
    // Create the activity view controller
    let activityViewController = UIActivityViewController(
        activityItems: itemsToShare,
        applicationActivities: nil
    )
    
    // Exclude specific sharing options if needed
    activityViewController.excludedActivityTypes = [
        .addToReadingList,
        .assignToContact,
        .print,
        .saveToCameraRoll,
    ]
    
    // Present the activity view controller
    if let popoverController = activityViewController.popoverPresentationController {
        popoverController.sourceView = self.view
        popoverController.sourceRect = CGRect(x: shareButton.bounds.midX, y: shareButton.bounds.maxY, width: 0, height: 0)
        popoverController.permittedArrowDirections = []
    }
    
    self.present(activityViewController, animated: true, completion: nil)

    @IBAction func clearButtonTapped(_ sender: UIButton) {
    // Clear the username and password text fields
    usernameTextField.text = ""
    passwordTextField.text = ""
    
    // You can also resign the first responder to dismiss the keyboard
    usernameTextField.resignFirstResponder()
    passwordTextField.resignFirstResponder()
}
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    // Add outlets for other elements as needed
    func resetUI() {
      textField1.text = ""
      textField2.text = ""
    // Reset other UI elements as needed
}
    @IBAction func resetButtonTapped(_ sender: UIButton) {
     resetUI()
}

}
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a navigation bar
        let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 44))
        navigationBar.backgroundColor = UIColor.blue // Set the background color
        let navigationItem = UINavigationItem()
        navigationItem.title = "My App"
        let leftButton = UIBarButtonItem(title: "Left", style: .plain, target: self, action: #selector(leftButtonTapped))
        navigationItem.leftBarButtonItem = leftButton
      
        let rightButton = UIBarButtonItem(title: "Right", style: .plain, target: self, action: #selector(rightButtonTapped))
        navigationItem.rightBarButtonItem = rightButton
    
        navigationBar.items = [navigationItem]
        
        view.addSubview(navigationBar)
    }
    
}


// Create a UILabel
let titleLabel = UILabel()
        
        // Set label properties
        titleLabel.text = "Welcome to Blood Bank"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textColor = .black

        // Add constraints to position the label at the top of the view
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20), 
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16), 
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    // save button    
  @IBOutlet weak var donorNameTextField: UITextField!
  @IBOutlet weak var bloodTypeTextField: UITextField!
  // Add outlets for other elements as needed
  struct BloodBankData {
    var donorName: String = ""
    var bloodType: String = ""
    // Add other properties as needed
}
  var bloodBankData = BloodBankData()
  @IBAction func saveButtonTapped(_ sender: UIButton) {
    bloodBankData.donorName = donorNameTextField.text ?? ""
    bloodBankData.bloodType = bloodTypeTextField.text ?? ""
    // Update other properties of bloodBankData as needed
}

@IBOutlet weak var dropdownButton: UIButton!
@IBOutlet weak var tableView: UITableView!
var isDropdownVisible = false
override func viewDidLoad() {
    super.viewDidLoad()
        
        // Initialize your table view data source and delegate if needed
    tableView.isHidden = true
}
    
@IBAction func toggleDropdown(_ sender: UIButton) {
    isDropdownVisible.toggle()
    tableView.isHidden = !isDropdownVisible


    import UIKit

class BloodBankViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    // Data source, replace this with your own data structure
    var bloodDonors: [BloodDonor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set up your table view data source and delegate
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // Implement UITableViewDataSource methods here
    
    // Action method for the delete button
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        // Find the index of the cell containing the delete button
        let point = sender.convert(CGPoint.zero, to: tableView)
        if let indexPath = tableView.indexPathForRow(at: point) {
            // Remove the corresponding record from your data source
            bloodDonors.remove(at: indexPath.row)
            
            // Reload the table view to reflect the changes
            tableView.reloadData()
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Create a UIImageView
        let imageView = UIImageView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))

        if let bloodBagImage = UIImage(named: "blood_bag_icon") {
            imageView.image = bloodBagImage
        } else {
            print("Error: Blood bag icon image not found.")
        }
        view.addSubview(imageView)
    }


    
    //Donor profile picture
    @IBOutlet weak var profileImageView: UIImageView!
    if let imageUrl = URL(string: "https://example.com/donor_profile_image.jpg") {
    DispatchQueue.global().async {
        if let data = try? Data(contentsOf: imageUrl) {
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                self.profileImageView.image = image
            }
        }
    }
}
     let placeholderImage = UIImage(named: "placeholder_image")
     self.profileImageView.image = placeholderImage


    

}

class BloodTypeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create and display blood type icons
        
        let bloodTypeAImage = UIImage(systemName: "heart.fill")
        let bloodTypeBImage = UIImage(systemName: "heart.fill")
        let bloodTypeABImage = UIImage(systemName: "heart.fill")
        let bloodTypeOImage = UIImage(systemName: "heart.fill")
        
        // Create UIImageViews to display the icons
        
        let bloodTypeAImageView = UIImageView(image: bloodTypeAImage)
        let bloodTypeBImageView = UIImageView(image: bloodTypeBImage)
        let bloodTypeABImageView = UIImageView(image: bloodTypeABImage)
        let bloodTypeOImageView = UIImageView(image: bloodTypeOImage)
        
        // Position and add the image views to the view
        
        let iconSize: CGFloat = 64.0
        let spacing: CGFloat = 20.0
        
        bloodTypeAImageView.frame = CGRect(x: 20, y: 100, width: iconSize, height: iconSize)
        bloodTypeBImageView.frame = CGRect(x: 20 + iconSize + spacing, y: 100, width: iconSize, height: iconSize)
        bloodTypeABImageView.frame = CGRect(x: 20 + 2 * (iconSize + spacing), y: 100, width: iconSize, height: iconSize)
        bloodTypeOImageView.frame = CGRect(x: 20 + 3 * (iconSize + spacing), y: 100, width: iconSize, height: iconSize)
        
        view.addSubview(bloodTypeAImageView)
        view.addSubview(bloodTypeBImageView)
        view.addSubview(bloodTypeABImageView)
        view.addSubview(bloodTypeOImageView)
    }
}

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create a UIButton
        let scheduleAppointmentButton = UIButton(type: .system)
        
        scheduleAppointmentButton.setTitle("Schedule Appointment", for: .normal)
        scheduleAppointmentButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        scheduleAppointmentButton.setTitleColor(.white, for: .normal)
        scheduleAppointmentButton.backgroundColor = UIColor.blue
        
        scheduleAppointmentButton.addTarget(self, action: #selector(scheduleAppointmentButtonTapped), for: .touchUpInside)
        scheduleAppointmentButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scheduleAppointmentButton)
        
        NSLayoutConstraint.activate([
            scheduleAppointmentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scheduleAppointmentButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            scheduleAppointmentButton.widthAnchor.constraint(equalToConstant: 200),
            scheduleAppointmentButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc func scheduleAppointmentButtonTapped() {
    }
}

    
    //App logo 
    if UIApplication.shared.supportsAlternateIcons {
    UIApplication.shared.setAlternateIconName("AlternateIconName") { error in
        if let error = error {
            print("Error setting app icon: \(error.localizedDescription)")
        } else {
            print("App icon changed successfully")
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    // Return the number of items in your collection view
    return dataCount
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCollectionViewCell
    
    // Configure the cell with data
    let item = data[indexPath.item]
    cell.titleLabel.text = item.title
    cell.imageView.image = UIImage(named: item.imageName)
    
    return cell
}
        //Error Label
        let errorLabel = UILabel()
errorLabel.text = "Invalid username or password. Please try again."
errorLabel.font = UIFont.systemFont(ofSize: 14)
errorLabel.textColor = UIColor.red
errorLabel.textAlignment = .center
errorLabel.isHidden = true // Initially hide it; show it when there's an error

        
    //subtitle label
let subtitleLabel = UILabel()
subtitleLabel.text = "Find donors near you"
subtitleLabel.font = UIFont.systemFont(ofSize: 16)
subtitleLabel.textAlignment = .center
subtitleLabel.textColor = UIColor.gray

}
// login form
let loginFormView = UIView()
loginFormView.addSubview(titleLabel)
loginFormView.addSubview(errorLabel)
}

// Assuming you have a UIView for your registration form
let registrationFormView = UIView()

// Add a title label
registrationFormView.addSubview(titleLabel)

// Add subtitle labels
registrationFormView.addSubview(subtitleLabel)

// Add body text labels for various fields
registrationFormView.addSubview(bodyTextLabel1)
registrationFormView.addSubview(bodyTextLabel2)

// Add error label for validation feedback
registrationFormView.addSubview(errorLabel)

let homePageView = UIView()

homePageView.addSubview(titleLabel)

homePageView.addSubview(bodyTextLabel1)
homePageView.addSubview(bodyTextLabel2)

let bodyTextLabel = UILabel()
bodyTextLabel.text = "Donor ID: 12345\nBlood Type: O+"
bodyTextLabel.font = UIFont.systemFont(ofSize: 14)
bodyTextLabel.numberOfLines = 0 // Allow multiple lines for detailed information
bodyTextLabel.textAlignment = .left

@IBOutlet weak var acceptorLBL: UILabel! 
@IBAction func donorImage(_ sender: Any) {
    imageViewOL.image = UIImage(named:"donor")
}

@IBAction func acceptorImage(_sender: Any){
    imageViewOL.image = UIImage(named:"acceptor")
}
@IBOutlet weak var homePageLabel: UILabel! //title to home page
 @IBOutlet weak var donorLBL: UILabel!
@IBOutlet weak var headerLBL: UILabel!
@IBOutlet weak var usernameTF: UITextField! //creating username textfield in login page
@IBOutlet var loginInBtn: [UIButton]!
@IBOutlet var cancelBtn: [UIButton]!


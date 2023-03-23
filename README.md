crud-demo-MScoots 
=======================================================================================



About
-----


Remaining Tasks Before Submission
=================================
### MScootsApp.main
---------------------------------------------------------------------------------------------
### LoadingScreenView


### LandingPageView

---------------------------------------------------------------------------------------------
### LoginView


### ResetPasswordView


### RegistrationView

---------------------------------------------------------------------------------------------
### UserHomeView


### UserSettings_Profile
    Both Users
	      [ ] change email/password, non-functional reqs(I.e. change light and dark mode),sign out, contact support, 
    Admin-TBD
     User
        [ ] Add, edit, and remove user data in storage,


### MyScootsView


### WalletView
	      [ ] Add, edit, and remove payment methods
	      [ ] Add, edit, and remove user data in storage


### ScanQRView
	      [ ] Scan QR code to rent/return scooter(Fake representation of camera)


### ScooterListView
    Admin
		    [ ] Add, edit, and remove Scooters
    User
        [ ] Rent,Return,report scooter issue,


### ScootMapView
    Admin-
        [ ] Add, edit, and remove Scooter object pins on image/map(Show 2 different images with scooters missing)
    User-
        [ ] UI - just a view to see where scooters are located until further notice
    
### AdminUserHomeView
    [ ] Add, edit, and remove user

---------------------------------------------------------------------------------------------
### ViewStyling

---------------------------------------------------------------------------------------------
### ProfileImageSaver
### User
### FirebaseManager
### DB_Authorization
### DB_Firestore
### MScootsTest


##  Folder Hierarchy
--------------------------
### MScoots
#### Main
#### Models
#### Utilities
#### View Models
#### Views
## --------------------------------------THINGS TO DO -----------------------------------
| STATUS    | ITEM            | SUB ITEM | DESCRIPTION                                                                                                          |
|-----------|----------------|----------|---------------------------------------------------------------------------------------------------------------------|
| COMPLETED | Working on the custom login page | added CWC custom login swift files |                                                      |
| COMPLETED | items added:       2/22/23              |  Custom login import |                                                     |
| xxxxxxxxx | App Delegate | need to implement all checks for FatalErrors and crashing |                                                 |
| REMOVED   | get to later... | function | Called when the app is about to terminate. Save data if appropriate. See applicationDidEnterBackground            |
|           |                | applicationWillTerminate                                                     |                                                     |
| \/        | function    application(_ app: UIApp...,configurationForConnection) | called when a new scene session is being created |
| \/        | function    application(_ app: UIApp..., didDiscardSceneSessions)   | called when user dsicards a scene session          |
|           | App Delegate.SceneDelegate | functions (scene,...) |                                                     |
| \/        | functions (sceneDidDisconnect... )                                     |                                                            |
| \/        | functions (sceneDidBecomeActive...)                                     |                                                            |
| \/        | functions (sceneWillResignActive...)                                    |                                                            |
| \/        | functions (sceneWillEnterForeground...)|                                                             |
| \/        | functions (sceneDidEnterBackground...)                                  |                                                            |
|           |                |            |                                                                                                                     |
|           | LoginViewController |          |                                                                                                                     |
| DONE      | @IBOutlet: emailTextField, passwordTextField, loginButton             |                                                            |
|           |                |            |                                                                                                                     |
|           |                |            | override func viewDidLoad: do any additional setup after loading the view                                          |
| DONE      |                | setupElements                                             | hide a custom error label used on the UI:styleTextFields in Utilities                                               |
|           |                |            |                                                                                                                     |
|           | ViewControllers |          |                                                                                                                     |
| defunct   |                | HomeViewController                                        | UIViewController                                       |
| xxxxx     | override func viewDidLoad(): Do any additional setup after loading the view ...In a storyboard-based app, do a little prep before navigation |         |
| xxxxx     | override func prepare(for segue: UIStoryboardSegue,...)            | get new view controller using segue destination & pass selected object to the new view                              |
|           |                |            |                                                                                                                     |
| REMOVED & DONE | SignUpViewController | UIViewController | DB_Manager is the consolidated version and does all that's necessary for Database AUTH                       |
| DONE      | IBOutlet: firstnameTextField, lastnameTextField, emailTextField, passwordTextField, signUpButton, errorLabel |                                                            |
| xxxxx     | override func viewDidLoad                                              |                                                            |
| xxxxx     | func setUpElements                                                     |                                                            |
| xxxxx     | func validateFields()                                                  | Check fields and validate data for IBOutlet data                                                                     |
| COMPLETED | IBAction func signUpTapped                                             | FIREBASE AUTHORIZATION                                                                                              |
| DONE      | --Validate fields, format/cleanup login user text if inconsistent       |                                                                                                                     |
|           | --Create the user, Write, and Store the user to the database             |                                                                                                                     |
| DONE      | -----view declaration:   transition to homescreen                        |                                                                                                                     |
| DONE      | func showError                                                        | update ErrorLabelUI                                                                                                 |
| DONE      | func transitionToHome                                                  | STORYBOARD                                                                                                          |
|           |                |            |                                                                                                                     |
|           | ViewController |          |                                                                                                                     |
| not started and may not need | video UI: funcs: ViewDidLoad, ViewWillAppear, SetupElement, setUp


#.
#.
#.

##-----------------------------------------------------GitHub Updates-------------------------------------------------------------
|   Date    |    Location git was used     |  Interactions with the server    |     Notes/Changes     |  Updates to the README  |
| ------    | ------                       | ------                           | ------                | ----                    |
| 2/22/23 |  XCode: Github repository | Fetched changes |  |  Yes |
| | | Stashed things a few times - not sure what that did yet | Had issues with the local repository being out of date | |
| | | Pulled and pushed | last was astash and Committed all the changes | changes made in commit message and README | Yes |
| 3/18/23 | XCode: Github repository | Stash and Pull changes | I wanted to commit my changes to the directory and it showed an error message telliong me that i needed to stash changes first. stash and pull was the next option | unsuccessful commit to GitHub on website | | |
| | | |Noticed changes to the files on GitHub and realize there is an extra folder named views in the root project path and in the Main path which has the current...not sure why| | |
| ------ | ------ | ------ | ------ | ---- |
| |  | | | | |


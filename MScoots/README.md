MScoots 
=======================================================================================



About
-----
MScoots is a scooter rental application with the intent of creating a platform for the students of Montclair State University. 




##  Folder Hierarchy
--------------------------
### MScoots
#### Main
##### Models
##### ViewModels
##### Utilities
#### Views
#### Preview Content
#### Sources


## --------------------------------------THINGS TO DO -----------------------------------
|       ITEM       |        SUB ITEM     |         ....................DESCRIPTION....................       |
| :-----------:    | :-------------:     |                               :-----                              |
|                  |    Directories      |                                                                   |   
|                  |    Utilities        |                                                                   |
|                  |                     |                              DB CRUD                              |   
|                  |                     |                     UI custom styler structs                      |   
|                  |                     |                     Sign-In Auth                                  |
|                  |                     |                     Empty Field Validation                        | 
|                  |                     |                     ViewTranstion                                 |  
|                  | Models: Clss/Strcts |                                                                   |   
|                  |                     |                                                                   |  Constants - instantiate ViewController - [Sign-in with Firebase - CWChris](https://www.youtube.com/watch?app=desktop&v=1HN7usMROt8&feature=youtu.be "Firebase Auth Signin - CWChris") |    
|                  |     ViewModels      |                                                                   |   
|                  |    Storyboards      |                                                                   |   



-----------------------------------UPDATES TO PROJECT--------------------------------------
| ITEM | SUB ITEM   | ....................DESCRIPTION.................... |
| :-----------:    | :-------------: | :----- |
| Working on the custom login page | added CWC custom login swift files |  |
| items added:       2/22/23              |  Custom login import | |
| | App Delegate  | | 
|           | function    applicationWillTerminate | Called when the app is about to terminate. Save data if appropriate. See applicationDidEnterBackground |
|             | function    application(_ app: UIApp...,configurationForConnection) | called when a new scene session is being created
|             | function    application(_ app: UIApp..., didDiscardSceneSessions)   | called when user dsicards a scene session
| App Delegate.SceneDelegate | functions (scene,...)
|             |  functions (sceneDidDisconnect... ) ||
|             |  functions (sceneDidBecomeActive...) ||
|             |  functions (sceneWillResignActive...) ||
|             |  functions (sceneWillEnterForeground...)| |
|             |  functions (sceneDidEnterBackground...) || 
| | | |
| LoginViewController| | |
| | @IBOutlet: emailTextField, passwordTextField, loginButton,| |
| | override func viewDidLoad| do any additional setup after loading the view |
| | override func setupElements| hide a custom error label used on the UI:styleTextFields in Utilities |
| | | |
| ViewControllers | | |
|            | HomeViewController| UIViewController|
|   |  override func viewDidLoad(): Do any additional setup after loading the view ...In a storyboard-based app, do a little prep before navigation | |
| | override func prepare(for segue: UIStoryboardSegue,...) | get new view controller using segue destination & pass selected object to the new view |
| | | |
| SignUpViewController| UIViewController| |
| | IBOutlet: firstnameTextField, lastnameTextField, emailTextField, passwordTextField, signUpButton, errorLabel | |
| | override function viewDidLoad | |
| | func setUpElements | |
| | func validateFields() | Check fields and validate data for IBOutlet data |
| | IBAction func signUpTapped | FIREBASE AUTHORIZATION |
| | --Validate fields, format/cleanup login user text if inconsistent | |
| | --Create the user, Write, and Store the user to the database | |
| | -----view declaration:   transition to homescreen | |
| | func showError | update ErrorLabelUI |
| | func transitionToHome | STORYBOARD |
| | | |
| ViewController| | |
| | video UI: funcs: ViewDidLoad, ViewWillAppear, SetupElement, setUpVideo | provides the uiscreen with a video to play in the background |

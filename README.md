# SWAPI
Swift Project using SWAPI

Notes:

• Pods are already included in the project.

• Fetching is done on ViewController DidLoad Method. So please don't click all the view controller to avoid API Overload while the app is still in beta stage.

Information:
Star Wars API is fetch with the help of GCD (Grand Central Dispatch) and used NSNotificationCenter when all jobs are done to execute a function which reloads the TableView

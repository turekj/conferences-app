import UIKit

let Current = Environment()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
            |> root(Current.navigation.controller)
            <> { $0.makeKeyAndVisible() }

        if let controller = makeController(.login) {
            Current.navigation.controller.setViewControllers([controller], animated: false)
        }

        return true
    }

}

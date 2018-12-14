import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
            |> root(Environment.shared.navigationController)
            <> { $0.makeKeyAndVisible() }

        if let controller = makeController(.login) {
            Environment.shared.navigationController.setViewControllers([controller], animated: false)
        }

        return true
    }

}

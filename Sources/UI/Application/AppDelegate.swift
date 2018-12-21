import UIKit

let Current = Environment()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
            |> root(Current.navigation.controller)
            <> { $0.makeKeyAndVisible() }

        Current.navigation.perform(action: .start)

        return true
    }

}

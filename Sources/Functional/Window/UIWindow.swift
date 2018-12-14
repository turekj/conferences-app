import UIKit

func root(_ rootViewController: UIViewController) -> (UIWindow) -> Void {
    return { window in
        window.rootViewController = rootViewController
    }
}

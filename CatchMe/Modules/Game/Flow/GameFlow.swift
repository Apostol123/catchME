import UIKit


class GameFlow: Flow {
    private let navigator: UINavigationController
    
    init(on navigator: UINavigationController) {
        self.navigator = navigator
    }
    
    func pushRout(to viewController: UIViewController) {
        navigator.pushViewController(viewController, animated: true)
    }
    
    func presentRout(viewController: UIViewController) {
        navigator.present(viewController, animated: true)
    }
    
}

extension GameFlow: GameOutput {
    
}

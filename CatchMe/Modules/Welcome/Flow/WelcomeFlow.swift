import UIKit

class WelcomeFlow: Flow {
    private let navigationController: UINavigationController
    private var gameFlow: GameFlow
    
    init(on navigator: UINavigationController) {
        navigationController = navigator
        gameFlow = GameFlow(on: navigationController)
    }
    
    func pushRout(to viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func presentRout(viewController: UIViewController) {
        navigationController.present(viewController, animated: true)
    }
}

extension WelcomeFlow: WelcomeOutput {
    func goToGameFlow() {
        gameFlow.pushRout(to: GameBuilder(coordinnatorOutput: gameFlow).build())
    }
}


protocol Flow {
    func pushRout(to viewController: UIViewController)
    func presentRout(viewController: UIViewController)
}



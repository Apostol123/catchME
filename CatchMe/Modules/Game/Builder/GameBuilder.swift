import UIKit

class GameBuilder: Builder {
    private var coordinatorOutput: GameOutput
    
    init(coordinnatorOutput: GameOutput) {
        self.coordinatorOutput = coordinnatorOutput
    }
    
    func build() -> UIViewController {
        let presenter = GamePresenter(coordinnatorOutput: coordinatorOutput)
        let view = GameViewController(presenter: presenter)
        presenter.view = view
        return view
    }
}

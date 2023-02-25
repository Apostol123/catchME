import Foundation

class GamePresenter {
    weak var view: GameViewProtocol?
    private var coordinatorOutput: GameOutput

    init(coordinnatorOutput: GameOutput) {
        self.coordinatorOutput = coordinnatorOutput
    }
}

extension GamePresenter: GamePresenterProtocol {
}

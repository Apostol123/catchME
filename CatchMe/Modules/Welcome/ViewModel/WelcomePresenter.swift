import Foundation

class WelcomePresenter {
    weak var view: WelcomeViewProtocol?
    private var welcomeOutput: WelcomeOutput

    init(welcomeOutout: WelcomeOutput) {
        self.welcomeOutput = welcomeOutout
    }
}

extension WelcomePresenter: WelcomePresenterProtocol {
}

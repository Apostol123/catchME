import UIKit

class WelcomeBuilder: Builder {
    private var welcomeOutout: WelcomeOutput
    
    init(welcomeOutout: WelcomeOutput) {
        self.welcomeOutout = welcomeOutout
    }
    
    func build() -> UIViewController {
        let presenter = WelcomePresenter(welcomeOutout: welcomeOutout)
        let view = WelcomeViewController(presenter: presenter)
        presenter.view = view
        return view
    }
}

protocol Builder {
    func build() -> UIViewController
}

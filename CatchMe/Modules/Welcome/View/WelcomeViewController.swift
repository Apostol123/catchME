import UIKit

class WelcomeViewController: UIViewController {
    private let presenter: WelcomePresenterProtocol
    
    
    init (presenter: WelcomePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
}

extension WelcomeViewController: WelcomeViewProtocol {
}

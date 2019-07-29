import Foundation
import WebKit

protocol AuthViewControllerDelegate: class {
    func handleTokenChanged(token: String)
}

final class AuthViewController: UIViewController {

    weak var delegate: AuthViewControllerDelegate?

    private let webView = WKWebView()
    private let clientId = "" // здесь должен быть ID вашего зарегистрированного приложения

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()

        guard let request = tokenGetRequest else { return }
        webView.load(request)
        webView.navigationDelegate = self
    }

    // MARK: Private
    private func setupViews() {
        view.backgroundColor = .white

        webView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(webView)
        NSLayoutConstraint.activate([
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private var tokenGetRequest: URLRequest? {
        guard var urlComponents = URLComponents(string: "https://oauth.yandex.ru/authorize") else { return nil }

        urlComponents.queryItems = [
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "client_id", value: "\(clientId)")
        ]

        guard let url = urlComponents.url else { return nil }

        return URLRequest(url: url)
    }
}

extension AuthViewController: WKNavigationDelegate {

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let url = navigationAction.request.url, url.scheme == scheme {
            let targetString = url.absoluteString.replacingOccurrences(of: "#", with: "?")
            guard let components = URLComponents(string: targetString) else { return }

            if let token = components.queryItems?.first(where: { $0.name == "access_token" })?.value {
                delegate?.handleTokenChanged(token: token)
            }
            dismiss(animated: true, completion: nil)
        }
        defer {
            decisionHandler(.allow)
        }
    }
}

private let scheme = "myphotos" // схема для callback

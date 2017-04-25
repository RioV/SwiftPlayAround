import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

class Worker: NSObject {
    private let server: ServerConnection = ServerConnection()
    func getData(url: String, completion: @escaping (String?) -> ()) {
        print("Worker - getData")
        server.getDataFromServer(url: url, completion: completion)        
    }
}

class ServerConnection: NSObject {
    let defaultSession = URLSession(configuration: URLSessionConfiguration.default)
    var dataTask: URLSessionDataTask?
    
    func getDataFromServer(url: String, completion: @escaping (String?) -> ()) {
        // Get API from server
        let url: URL = URL(string: "http://0.0.0.0:8080/test")!
        
        dataTask = defaultSession.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    print("AAAAAA lang nhang")
                    completion("Vapor")
                } else {
                    print("BBBBBB lang nhang \(httpResponse.statusCode)")
                }
            }
        }
        // 8
        dataTask?.resume()
    }
}

let worker: Worker = Worker()
worker.getData(url: "url") { (response: String?) in
    if let response = response {
        print("Get Data response = \(response)")
    } else {
        print("Get Data failed")
    }
}

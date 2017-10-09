import UIKit

public typealias CompletionClosure = (_ hello: Data) -> Void

class APIManager: NSObject {
    class func goForIt(Closure: @escaping CompletionClosure) {
        let urlString = "https://jsonblob.com/api/jsonBlob/be981f20-acc3-11e7-894a-c9a7a170b204"
        
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        //request.addValue("json", forHTTPHeaderField: "Content: application/json")
        request.httpBody = Data()
        
        request.httpMethod = "GET"
        let session = Foundation.URLSession.shared
        
        let task = session.dataTask(with: url!) { data, response, error -> Void in
            if let jsonData = data{
                if let jsonString = String(data: jsonData, encoding: .utf8){
                    print(jsonString)
                }
                DispatchQueue.main.async {
                    Closure(jsonData)
                }
            }
            else if let requestError = error{
                print("\(requestError) error")
            }
            else{
                print("Unexpected error")
            }
        }
        task.resume()
    }
}

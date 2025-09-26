import Foundation

class NetworkService {
    func fetchUsers() {
        
        let scheme = "https"
        let host = "reqres.in"
        let path = "/api/users"
        let query = URLQueryItem(name: "page", value: "2")
        
        let method = "GET"
        let header = [
            "x-api-key": "reqres-free-v1"
        ]
        
        var component = URLComponents()
        component.scheme = scheme
        component.host = host
        component.path = path
        component.queryItems = [query]
        
        guard let url = component.url else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.allHTTPHeaderFields = header
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {return}
            
            do {
                let model = try JSONDecoder().decode(UsersPageModel.self, from: data)
                print(model.data)
            } catch {
                print(error)
            }
        }
        
        task.resume()
        
    }
    
}

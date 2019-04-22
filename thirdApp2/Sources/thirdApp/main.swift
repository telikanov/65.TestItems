import Foundation
import Alamofire

struct Repo {
    var name: String
}

var keepAlive = true

print("Запрашиваю никнейм\n")
print("Введите, пожалуйста, никнейм от github:")

let nikname:String = readLine()!
if (nikname.count == 0) {
    print("Никнейм пуст")
} else {
    let urlString  = "https://api.github.com/users/\(nikname)/repos"
    Alamofire.request(urlString).validate().responseJSON { response in
        switch response.result {
        case .success(let value):
            guard let jsonArray = value as? Array<[String: Any]> else { return }
            var repos: [String] = []
            for jsonObject in jsonArray {
                guard
                    let name = jsonObject["name"] as? String
                    else {return}
                let repo = Repo(name: name)
                repos.append(repo.name)
            }
            print("Список репозиториев:")
            dump(repos)
        case .failure(let error):
            print(error.localizedDescription)
        }
        keepAlive = false
    }
    
    let runLoop = RunLoop.current
    while keepAlive && runLoop.run(mode: RunLoop.Mode.default, before: Date(timeIntervalSinceNow: 0.1)) {
        // Run, run, run
    }
}

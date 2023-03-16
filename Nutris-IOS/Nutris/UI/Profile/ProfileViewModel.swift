import Foundation
import Combine

enum profileStatus {
    case done, none
}

class ProfileViewModel: ObservableObject {
    @Published var status: profileStatus = .none
    @Published var userName: String = ""
    @Published var userPhoto: String = ""
    var suscriptors = Set<AnyCancellable>()
    
    func getUserProfile() {
        //TODO: Llamada a API
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionProfile())
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: UserModel.UserProfileModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    self.status = .done
                case .failure(_):
                    print("Error: User Profile failed")
                }
            } receiveValue: { data in
                self.userName = data.fullname
                self.userPhoto = data.photo
            }
            .store(in: &suscriptors)
    }
}

import Foundation
import Combine

class SavedRecipeViewModel: ObservableObject {
    
    func getTempData3() -> SavedRecipeModel.Public {
        return SavedRecipeModel.Public(image: "Profile_Image", userName: "Chris Evans", photo: "recipe", desc: "Grilling fruit will bring out its juicy sweetness, and while you can always go the sweet route with your grilled peaches", title: "Noodles & Vegs")
    }
    
    func getTempData2() -> SavedRecipeModel.Public {
        return SavedRecipeModel.Public(image: "Profile_Image", userName: "Robert Downey Jr", photo: "recipe1", desc: "Prosciutto and burrata were already a match made in heaven, but the addition of sweet spring peas takes this pairing to the next level.", title: "Burrata, Pea, & Prosciutto Tortellini")
    }
    
    func getTempData1() -> SavedRecipeModel.Public {
        return SavedRecipeModel.Public(image: "Profile_Image", userName: "George Clooney", photo: "recipe4", desc: "Here we’re filling them with beefy tomato rice and shredded Monterey Jack cheese", title: "Classic Stuffed Peppers")
    }
    
}

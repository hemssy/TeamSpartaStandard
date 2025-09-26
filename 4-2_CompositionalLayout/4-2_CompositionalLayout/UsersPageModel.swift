import Foundation

// MARK: - Welcome
struct UsersPageModel: Decodable {
    let page, perPage, total, totalPages: Int
    let data: [User]
    let support: Support

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data, support
    }
}

extension UsersPageModel {
    // MARK: - Datum
    struct User: Decodable {
        let id: Int
        let email, firstName, lastName: String
        let avatar: String

        enum CodingKeys: String, CodingKey {
            case id, email
            case firstName = "first_name"
            case lastName = "last_name"
            case avatar
        }
    }

    // MARK: - Support
    struct Support: Decodable {
        let url: String
        let text: String
    }
}

import Foundation

class PasswordValidator {
    let password: String = "password"
    
    private func passwordCheck(with input: String) throws -> Bool {
        if input == password { return true }
        throw PasswordError.wrongInput
    }
    
    func validate(with input: String) throws -> Bool {
        if input.isEmpty { //빈 문자열일때
            throw PasswordError.emptyInput
        }
        if input.count > 8 { //8자 초과일때
            throw PasswordError.tooLongInput
        }
        return try passwordCheck(with: input)
    }
}


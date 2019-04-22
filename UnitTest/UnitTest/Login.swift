//
//  Login.swift
//  UnitTest
//
//  Created by Алексей Теликанов on 19/04/2019.
//  Copyright © 2019 Алексей Теликанов. All rights reserved.
//

import Foundation

/*
 Напишите код, проверяющий, соответствует ли логин следующим правилам:
 логин может быть как email-ом так и обычной строкой (никнейм).
 Минимальная длина логина - 3 символа,
 максимальная - 32.
 Логин может состоять из латинских букв,
 цифр,
 минуса и
 точки.
 Логин не может начинаться на цифру, точку, минус. Код должен быть покрыт Unit-тестами.
 
 *Про Валидацию Email ничего не было сказано, сколько может быть символов в домене. Так что не на него не будет ставится ограничения по длине
 */

class Login {
    func isValidEmail(login:String) -> Bool {
        let allowedCharacterSet = CharacterSet.init(charactersIn: "0123456789.-")
        let textCharacterSet = CharacterSet.init(charactersIn: login)
        if ((allowedCharacterSet.isSuperset(of: textCharacterSet)) || login.count == 0) {
            return false
        }
//        guard (login.count != 0 allowedCharacterSet.isSuperset(of: textCharacterSet)) else { return false }
        if (login.contains("@")){
            let emailRegEx = "[A-Z0-9a-z.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{3,32}"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: login)
        } else {
            let lognRegEx = "[A-Z0-9a-z.-]{3,32}"
            let lognTest = NSPredicate(format:"SELF MATCHES %@", lognRegEx)
            return lognTest.evaluate(with: login)
        }
    }
}

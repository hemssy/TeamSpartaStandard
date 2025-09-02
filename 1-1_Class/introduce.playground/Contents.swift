class Person {
    var name: String
    var age: Int
    
    init(name: String,  age: Int) {
        self.name = name
        self.age = age
    }
    
    func talk() {
        print("안녕하세요. 저는 \(age)살이고, 이름은 \(name) 입니다. ")
    }
}

let p1 = Person(name: "사람1", age: 10)
p1.talk()

let p2 = Person(name:"사람2",  age:  20)
p2.talk()

let p3 = Person(name: "사람3", age: 30)
p3.talk()

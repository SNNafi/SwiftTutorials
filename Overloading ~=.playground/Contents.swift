
// Author: Shahriar Nasim Nafi
// Post lInk: https://snnafi.com/2020/08/14/swift-overloading/


let names = ["Karim","Rahim","Jalal","Kamal"]

let name = "Karim"

//if case names = name{ //Expression pattern of type '[String]' cannot match values of type 'String'
//    print("In There")
//}

// Normal ways
for i in names where i == name{
    print("In There")
}

for case name in names{
    print("In There")
}

var isContain = names.contains(name)

//Using ~= overloading

func ~=(pattern: [String], lookUp: String) -> Bool{
    for i in pattern where i == lookUp {
        return true
    }
    return false
}

if case names = name{
    print("In There")
}

isContain = (names ~= name)

//Generic ~= overloading & T conforms Equatable protocol

func ~=<T: Equatable>(pattern: [T], lookUp: T) -> Bool{
    for i in pattern where i == lookUp {
        return true
    }
    return false
}

let numbers = [1.5,2,4,5,6]
let number: Double = 5

let isNumberThere =  (numbers ~= number)

if case numbers = number{
    print("In There")
}

// Conform Equatable protocol

struct Person: Equatable{
    let name: String
    let age: Int
    init(name: String,age: Int) {
        self.name = name
        self.age = age
    }
}

let persons = [Person(name: "Kalam",age:20),Person(name: "Rahim",age:21),Person(name: "Jamal",age:24)]

let person = Person(name: "Kalam",age:4)


let isPersonHere =  (persons ~= person)

if case persons = person{
    print("In There")
}

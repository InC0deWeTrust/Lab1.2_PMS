
import Foundation

// Частина 1

// Дано рядок у форматі "Student1 - Group1; Student2 - Group2; ..."

let studentsStr = "Дмитренко Олександр - ІП-84; Матвійчук Андрій - ІВ-83; Лесик Сергій - ІО-82; Ткаченко Ярослав - ІВ-83; Аверкова Анастасія - ІО-83; Соловйов Даніїл - ІО-83; Рахуба Вероніка - ІО-81; Кочерук Давид - ІВ-83; Лихацька Юлія - ІВ-82; Головенець Руслан - ІВ-83; Ющенко Андрій - ІО-82; Мінченко Володимир - ІП-83; Мартинюк Назар - ІО-82; Базова Лідія - ІВ-81; Снігурець Олег - ІВ-81; Роман Олександр - ІО-82; Дудка Максим - ІО-81; Кулініч Віталій - ІВ-81; Жуков Михайло - ІП-83; Грабко Михайло - ІВ-81; Іванов Володимир - ІО-81; Востриков Нікіта - ІО-82; Бондаренко Максим - ІВ-83; Скрипченко Володимир - ІВ-82; Кобук Назар - ІО-81; Дровнін Павло - ІВ-83; Тарасенко Юлія - ІО-82; Дрозд Світлана - ІВ-81; Фещенко Кирил - ІО-82; Крамар Віктор - ІО-83; Іванов Дмитро - ІВ-82"

// Завдання 1
// Заповніть словник, де:
// - ключ – назва групи
// - значення – відсортований масив студентів, які відносяться до відповідної групи

var studentsGroups: [String: [String]] = [:]

// Ваш код починається тут
/**var studentInfo = studentsStr.components(separatedBy: "; ")
studentInfo.sort()
var studentInfoSortList = studentInfo.joined(separator: " - ")
var studentSeparatedList = studentInfoSortList.components(separatedBy: " - ")
var studentNamesList: [String] = []
var studentGroupsList: [String] = []
for i in 0..<(studentSeparatedList.count) where i % 2 == 0{
    studentNamesList.append(studentSeparatedList[i])
}
for i in 0..<(studentSeparatedList.count) where i % 2 != 0{
    studentGroupsList.append(studentSeparatedList[i])
}

let groups = studentGroupsList
let names = studentNamesList

studentsGroups[groups] == nil ? studentsGroups[groups] = [names] :
    studentsGroups[groups]!.append(names)
print("Unseccesful try 1!")*/
var newStudentArray = studentsStr.components(separatedBy: "; ")
for everyStudent in newStudentArray {
    let newStudentNames = everyStudent.components(separatedBy: " - ")
    let groupValue = newStudentNames[1]
    let nameValue = newStudentNames[0]
    studentsGroups[groupValue] == nil ? studentsGroups[groupValue] = [nameValue] :
        studentsGroups[groupValue]!.append(nameValue)
}

for groupValue in studentsGroups.keys {
    studentsGroups[groupValue]!.sort()
}
// Ваш код закінчується тут

print("Завдання 1")
print(studentsGroups)
print()

// Дано масив з максимально можливими оцінками

let points: [Int] = [12, 12, 12, 12, 12, 12, 12, 16]

// Завдання 2
// Заповніть словник, де:
// - ключ – назва групи
// - значення – словник, де:
//   - ключ – студент, який відносяться до відповідної групи
//   - значення – масив з оцінками студента (заповніть масив випадковими значеннями, використовуючи функцію `randomValue(maxValue: Int) -> Int`)

func randomValue(maxValue: Int) -> Int {
    switch(arc4random_uniform(6)) {
    case 1:
        return Int(ceil(Float(maxValue) * 0.7))
    case 2:
        return Int(ceil(Float(maxValue) * 0.9))
    case 3, 4, 5:
        return maxValue
    default:
        return 0
    }
}

var studentPoints: [String: [String: [Int]]] = [:]

// Ваш код починається тут
for(key, value) in studentsGroups {
    var newDictionary: [String : [Int]] = [:]
    value.forEach { name in
        let gradesValue = points.map {randomValue(maxValue: $0)}
        newDictionary[name] = gradesValue
    }
    studentPoints[key] = newDictionary
}
// Ваш код закінчується тут

print("Завдання 2")
print(studentPoints)
print()

// Завдання 3
// Заповніть словник, де:
// - ключ – назва групи
// - значення – словник, де:
//   - ключ – студент, який відносяться до відповідної групи
//   - значення – сума оцінок студента

var sumPoints: [String: [String: Int]] = [:]

// Ваш код починається тут
for (key, value) in studentPoints {
    var newDictionarySum: [String : Int] = [:]
    value.forEach {name, points in
        let sum = points.reduce(0, {x, y in x + y})
        newDictionarySum[name] = sum
    }
    sumPoints[key] = newDictionarySum
}
// Ваш код закінчується тут

print("Завдання 3")
print(sumPoints)
print()

// Завдання 4
// Заповніть словник, де:
// - ключ – назва групи
// - значення – середня оцінка всіх студентів групи

var groupAvg: [String: Float] = [:]

// Ваш код починається тут
for(key, value) in sumPoints{
    var sum: Float = 0;
    value.forEach {_, points in
        sum += Float(points)
    }
    groupAvg[key] = sum/Float(value.count)
}
// Ваш код закінчується тут

print("Завдання 4")
print(groupAvg)
print()

// Завдання 5
// Заповніть словник, де:
// - ключ – назва групи
// - значення – масив студентів, які мають >= 60 балів

var passedPerGroup: [String: [String]] = [:]

// Ваш код починається тут
for (key, value) in sumPoints {
    let newFilter = value.filter {$0.1 >= 60}
    passedPerGroup[key] = Array(newFilter.keys)
}
// Ваш код закінчується тут

print("Завдання 5")
print(passedPerGroup)

// Приклад виведення. Ваш результат буде відрізнятися від прикладу через використання функції random для заповнення масиву оцінок та через інші вхідні дані.
//
//Завдання 1
//["ІВ-73": ["Гончар Юрій", "Давиденко Костянтин", "Капінус Артем", "Науменко Павло", "Чередніченко Владислав"], "ІВ-72": ["Бортнік Василь", "Киба Олег", "Овчарова Юстіна", "Тимко Андрій"], "ІВ-71": ["Андрющенко Данило", "Гуменюк Олександр", "Корнійчук Ольга", "Музика Олександр", "Трудов Антон", "Феофанов Іван"]]
//
//Завдання 2
//["ІВ-73": ["Давиденко Костянтин": [5, 8, 9, 12, 11, 12, 0, 0, 14], "Капінус Артем": [5, 8, 12, 12, 0, 12, 12, 12, 11], "Науменко Павло": [4, 8, 0, 12, 12, 11, 12, 12, 15], "Чередніченко Владислав": [5, 8, 12, 12, 11, 12, 12, 12, 15], "Гончар Юрій": [5, 6, 0, 12, 0, 11, 12, 11, 14]], "ІВ-71": ["Корнійчук Ольга": [0, 0, 12, 9, 11, 11, 9, 12, 15], "Музика Олександр": [5, 8, 12, 0, 11, 12, 0, 9, 15], "Гуменюк Олександр": [5, 8, 12, 9, 12, 12, 11, 12, 15], "Трудов Антон": [5, 0, 0, 11, 11, 0, 12, 12, 15], "Андрющенко Данило": [5, 6, 0, 12, 12, 12, 0, 9, 15], "Феофанов Іван": [5, 8, 12, 9, 12, 9, 11, 12, 14]], "ІВ-72": ["Киба Олег": [5, 8, 12, 12, 11, 12, 0, 0, 11], "Овчарова Юстіна": [5, 8, 12, 0, 11, 12, 12, 12, 15], "Бортнік Василь": [4, 8, 12, 12, 0, 12, 9, 12, 15], "Тимко Андрій": [0, 8, 11, 0, 12, 12, 9, 12, 15]]]
//
//Завдання 3
//["ІВ-72": ["Бортнік Василь": 84, "Тимко Андрій": 79, "Овчарова Юстіна": 87, "Киба Олег": 71], "ІВ-73": ["Капінус Артем": 84, "Науменко Павло": 86, "Чередніченко Владислав": 99, "Гончар Юрій": 71, "Давиденко Костянтин": 71], "ІВ-71": ["Корнійчук Ольга": 79, "Трудов Антон": 66, "Андрющенко Данило": 71, "Гуменюк Олександр": 96, "Феофанов Іван": 92, "Музика Олександр": 72]]
//
//Завдання 4
//["ІВ-71": 79.333336, "ІВ-72": 80.25, "ІВ-73": 82.2]
//
//Завдання 5
//["ІВ-72": ["Бортнік Василь", "Киба Олег", "Овчарова Юстіна", "Тимко Андрій"], "ІВ-73": ["Давиденко Костянтин", "Капінус Артем", "Чередніченко Владислав", "Гончар Юрій", "Науменко Павло"], "ІВ-71": ["Музика Олександр", "Трудов Антон", "Гуменюк Олександр", "Феофанов Іван", "Андрющенко Данило", "Корнійчук Ольга"]]


class TimeAM {
    var hour: UInt
    var minute: UInt
    var second: UInt
    
    init() {
        self.hour = 0
        self.minute = 0
        self.second = 0
    }
    
    init?(h: UInt, m: UInt, s: UInt) {
        if(h > 23 || m > 59 || s > 59) {
            return nil
        }
        self.hour = h
        self.minute = m
        self.second = s
    }
    
    init(date: Date) {
        self.hour = UInt(Calendar.current.component(.hour, from: date))
        self.minute = UInt(Calendar.current.component(.minute, from: date))
        self.second = UInt(Calendar.current.component(.second, from: date))
    }
    
    func getFullTime() -> String {
        return "\(hour < 10 ? "0" : "")\(hour):\(minute < 10 ? "0" : "")\(minute):\(second < 10 ? "0" : "")\(second)"
    }
}
extension TimeAM {
    func getTimeString() -> String {
        if(hour >= 12) {
            let stringTime = String(hour == 12 ? 12 : (hour - 12))
            return "\(stringTime.count == 1 ? "0" : "")\(stringTime):\(minute < 10 ? "0" : "")\(minute):\(second < 10 ? "0" : "")\(second) PM"
        } else{
            let stringTime = String(hour == 0 ? 12 : hour)
            return "\(stringTime.count < 1 ? "0" : "")\(stringTime):\(minute < 10 ? "0" : "")\(minute):\(second < 10 ? "0" : "")\(second) AM"
        }
    }
    func getTimeSum(secondObject: TimeAM) -> TimeAM {
        var secondsSum = self.second + secondObject.second
        var minutesSum = (secondsSum >= 60 ? 1 : 0) + self.minute + secondObject.minute
        let hoursSum = ((minutesSum >= 60 ? 1 : 0) + self.hour + secondObject.hour) % 24
        minutesSum = minutesSum % 60
        secondsSum = secondsSum % 60
        
        let res = TimeAM(h: hoursSum, m: minutesSum, s: secondsSum)
        return res!
    }
    
    func getTimeDifference(secondObject: TimeAM) -> TimeAM {
        var secondsDiff = Int(self.second) - Int(secondObject.second)
        var minutesDiff = Int(self.minute) - Int(secondObject.minute) - (secondsDiff < 0 ? 1 : 0)
        var hoursDiff = Int(self.hour) - Int(secondObject.hour) - (minutesDiff < 0 ? 1 : 0)
        secondsDiff = (secondsDiff < 0 ? (60 + secondsDiff) : secondsDiff)
        minutesDiff = (minutesDiff < 0 ? (60 + minutesDiff) : minutesDiff)
        hoursDiff = (hoursDiff < 0 ? (24 + hoursDiff) : hoursDiff)
        
        let res = TimeAM(h: UInt(hoursDiff), m: UInt(minutesDiff), s: UInt(secondsDiff))
        return res!
    }
}

extension TimeAM {
    static func getSumFor2(firstObject: TimeAM, secondObject: TimeAM) -> TimeAM {
        return firstObject.getTimeSum(secondObject: secondObject)
    }
    
    static func getDiffFor2(firstObject: TimeAM, secondObject: TimeAM) -> TimeAM {
        return firstObject.getTimeDifference(secondObject: secondObject)
    }
}

print("Task 1")
var time1 = TimeAM(h: 20, m: 58, s: 59)
var time2 = TimeAM(h: 15, m: 02, s: 01)
var time3 = TimeAM(h: 19, m: 01, s: 00)

var time4 = TimeAM(h: 23, m: 59, s: 59)
var time5 = TimeAM(h: 12, m: 0, s: 1)
var time6 = TimeAM(h: 0, m: 0, s: 1)
    
var timeWithNoArgs = TimeAM()
var timeWithDate = TimeAM(date: Date())

print("Task 6a-6c check")
print(time3!.getTimeString())
print(time1!.getTimeSum(secondObject: timeWithNoArgs).getFullTime())
print(time2!.getTimeDifference(secondObject: time3!).getFullTime())

print("Task 7a-7b check")
print(TimeAM.getSumFor2(firstObject: time1!, secondObject: time2!).getTimeString())
print(TimeAM.getDiffFor2(firstObject: timeWithDate, secondObject: time2!).getTimeString())

print("Task 10a-10b check")
print(time4!.getTimeSum(secondObject: time5!).getFullTime())
print(timeWithNoArgs.getTimeDifference(secondObject: time6!).getFullTime())

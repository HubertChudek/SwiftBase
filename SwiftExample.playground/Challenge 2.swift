class Engine {
  let horsePower: Int
  var isOperating: Bool

  init(power: Int) {
    self.horsePower = power
    self.isOperating = true
    print("Utworzono silnik o mocy \(horsePower) i wlaczono go")
  }

  func turnOn(){
    if isOperating == true {
      print("Silnik jest juz wlaczony")
    }
    else {
      self.isOperating = true
      print("Wlaczono silnik")
    }
  }
  func turnOff(){
    if isOperating == false {
      print("Silnik jest juz wylaczony")
    }
    else {
      self.isOperating = false
      print("Wylaczono silnik")
    }
  }
}

class Person {
  let status: String
  let name: String
  let age: Int
  var place: String = ""

  init(name: String, status: String, age: Int) {
    self.age = age
    self.status = status
    self.name = name
  }

  func introduceYourself() {
    print("Nazywam sie \(name), mam \(age) lat")
  }
}

class Restaurant {
  let maxCapacity: Int
  var currentCapacity = 0

  init(max: Int ) {
    self.maxCapacity = max
  }
}

class Bar {
  let maxCapacity: Int
  var currentCapacity = 0

  init(max: Int ) {
    self.maxCapacity = max
  }

  func checkAge(person: Person)
  {
    if person.age < 18 {
      print("Jestes za mlody, nie mozesz wejsc")
    }
  }
}

class Cabin {
  let beds: Int
  var tenants: [Person]?

  init(beds: Int, tenants: Array<Person>) {
    self.beds = beds
    if tenants.count > beds {
      print("Za malo lozek")
      self.tenants = nil
    }
    else {
      self.tenants = tenants
      print("Utworzono kabine z \(self.beds) miejscami")
    }
  }
}

class Ship {
  let totalPassengers: Int
  let totalCrew: Int
  let engines: [Engine]

  let restaurants: [Restaurant]
  let bars: [Bar]
  let cabins: [Cabin]

  init(totalPassengers: Int, totalCrew: Int, engines: Int..., 
  restaurants: [Restaurant], bars: [Bar], cabins: [Cabin]) {
    self.totalPassengers = totalPassengers
    self.totalCrew = totalCrew

    var tempArray = [Engine]()
    for i in 0...(engines.count-1) {
      var tempEngine = Engine(power: engines[i])
      tempArray.append(tempEngine)
    }
    self.engines = tempArray

    self.restaurants = restaurants
    self.bars = bars
    self.cabins = cabins
  }
}


var somePeople = [Person]()
somePeople.append(Person(name: "Max", status: "tourist", age: 17))
somePeople.append(Person(name: "Ellie", status: "tourist", age: 51))
somePeople.append(Person(name: "Steven", status: "crew", age: 33))
somePeople.append(Person(name: "Hubi", status: "crew", age: 25))

var tourists = [Person]()
tourists.append(somePeople[0])
tourists.append(somePeople[1])

somePeople[2].introduceYourself()

var restaurants = [Restaurant]()
restaurants.append(Restaurant(max: 300))

var bars = [Bar]()
bars.append(Bar(max: 50))
bars.append(Bar(max: 50))

var cabins = [Cabin]()
cabins.append(Cabin(beds: 2,tenants: tourists))


let ship = Ship(totalPassengers: 400, totalCrew: 50, engines: 2, 4, restaurants: restaurants, bars: bars, cabins: cabins)

ship.engines[0].turnOn()
ship.engines[0].turnOff()
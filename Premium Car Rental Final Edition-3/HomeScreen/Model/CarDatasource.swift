//
//  CarDatasource.swift
//  HomeScreen
//
//  Created by EltonR on 1.10.22.
//

import Foundation

class CarDatasource {
    // MARK: CARS MODEL
    private let allCars: [CarModel] = [
        CarModel(category: .suv, rating: 4.7,
                 name1: "Lamborghini",
                 name2: "Urus",
                 smallPhoto: "urus",
                 bigPhoto: "URUS",
                 rentalPrice: "$550",
                 carColor: .carWhiteColor,
                 horsepower: "735HP",
                 acceleration: "03.4",
                 aditionalImages: ["urus1", "urus2", "urus3", "urus4"],
                 description: "Lamborghini Urus is the first Super Sport Utility Vehicle in the world, merging the soul of a super sports car with the practical functionality of an SUV. Powered by Lamborghini’s 4.0-liter twin-turbo V8 engine, the Urus is all about a performance mindset that brings together fun-to-drive and astounding vehicle capabilities.",
                 engineType: "4.0 V8",
                 topSpeed: "290KMH",
                 interiorColor: "Red",
                 numberOfSeats: 4,
                 interiorMaterial: "Full-Leather"),
        CarModel(category: .suv, rating: 4.1,
                 name1: "Bentley",
                 name2: "Bentayga",
                 smallPhoto: "bentayga",
                 bigPhoto: "BENTAYGA",
                 rentalPrice: "$550",
                 carColor: .carBlackColor,
                 horsepower: "666HP",
                 acceleration: "03.2",
                 aditionalImages: ["Bentayga1", "Bentayga2", "Bentayga3", "Bentayga4"],
                 description: "No other SUV can compete with the Bentayga when it comes to craftsmanship, comfort or sheer exhilaration. Available with a 4.0 litre V8 petrol engine, a 6.0 litre W12 petrol engine or a 3.0 litre hybrid, it is a luxury SUV without compare.",
                 engineType: "5.0 V8",
                 topSpeed: "305KMH",
                 interiorColor: "White",
                 numberOfSeats: 5,
                 interiorMaterial: "Full-Leather"),
        CarModel(category: .suv, rating: 4.7,
                 name1: "Mercedes", name2: "Brabus 900",
                 smallPhoto: "g900", bigPhoto: "G900",
                 rentalPrice: "$500",
                 carColor: .carBlackColor,
                 horsepower: "875HP",
                 acceleration: "03.3",
                 aditionalImages: ["g9001", "g9002", "g9003", "g9004"],
                 description: "The BRABUS 900 is the third addition to the monochrome design series of highly exclusive BRABUS signature supercars, defined at its core by the apex of uncompromising rocket ship power and an extravagant BRABUS 1-Second-Wow Character.",
                 engineType: "4.4 V8",
                 topSpeed: "335KMH",
                 interiorColor: "Red",
                 numberOfSeats: 4,
                 interiorMaterial: "Full-Leather"),
        CarModel(category: .suv, rating: 4.9,
                 name1: "Rolls-Royce", name2: "Cullinan",
                 smallPhoto: "cullinan", bigPhoto: "CULLINAN",
                 rentalPrice: "$600",
                 carColor: .carWhiteColor,
                 horsepower: "675HP",
                 acceleration: "03.9",
                 aditionalImages: ["Cullinan1", "Cullinan2", "Cullinan3", "cullinan4"],
                 description: "Cullinan is an all-terrain, all-season SUV. Drivers journey in confidence, knowing that Cullinan’s limitless performance capability underpins every excursion. Within Cullinan’s generous cabin, passengers are safe, secure, and supremely comfortable.",
                 engineType: "6.7 V12",
                 topSpeed: "280KMH",
                 interiorColor: "Black",
                 numberOfSeats: 4,
                 interiorMaterial: "Full-Leather"),
        CarModel(category: .sedan, rating: 4.9,
                 name1: "BMW",
                 name2: "M5 cs",
                 smallPhoto: "m5cs",
                 bigPhoto: "M5cs",
                 rentalPrice: "$400",
                 carColor: .carDarkGreen,
                 horsepower: "635HP",
                 acceleration: "02.8",
                 aditionalImages: ["M5cs1", "M5cs2", "M5cs3", "M5cs4"],
                 description: "The twin-turbocharged 4.4-liter V-8 in the M5 CS makes 10 more horsepower than the M5 Competition. The powerplant is now rated at 627 horsepower and this—in conjunction with the weight savings—leads to tangible benefits. The sprint to 60 mph takes a claimed 2.9 seconds, which is 0.2 seconds quicker than the company's claim for the M5 Competition.",
                 engineType: "4.4 V8",
                 topSpeed: "333KMH",
                 interiorColor: "White",
                 numberOfSeats: 4,
                 interiorMaterial: "Full-Leather"),
        CarModel(category: .sedan, rating: 4.3,
                 name1: "BMW",
                 name2: "M4 Competition",
                 smallPhoto: "m4",
                 bigPhoto: "M4",
                 rentalPrice: "$300",
                 carColor: .carBabyBlue,
                 horsepower: "578HP",
                 acceleration: "03.4",
                 aditionalImages: ["M4cs1", "M4cs2", "M4cs3", "M4cs4"],
                 description: "The M4 CS has the lower and stiffer springs, dampers and anti-roll bars from the M4 Competition Pack. The only other hardware change made to the M4 CS is the fitment of 265/35x19s front and 285/30x20s rear Michelin Pilot Sport Cup 2 tyres on lightweight forged wheels. ",
                 engineType: "3.0 Inline 6",
                 topSpeed: "318KMH",
                 interiorColor: "White",
                 numberOfSeats: 2,
                 interiorMaterial: "Alcantara"),
        CarModel(category: .sedan, rating: 4.6,
                 name1: "Tesla",
                 name2: "Model S",
                 smallPhoto: "models",
                 bigPhoto: "MODELS",
                 rentalPrice: "$400",
                 carColor: .carRedColor,
                 horsepower: "999HP",
                 acceleration: "01.9",
                 aditionalImages: ["models1", "models2", "models3"],
                 description: "All new Tesla Model S Plaid+. Fastest producted car in the world, with a 1.9 sec 0 - 60mph time.",
                 engineType: "Electric",
                 topSpeed: "260KM",
                 interiorColor: "White",
                 numberOfSeats: 4,
                 interiorMaterial: "Full-Leather"),
        CarModel(category: .sedan, rating: 4.5,
                 name1: "Mercedes", name2: "GT63s 4d",
                 smallPhoto: "gt63", bigPhoto: "GT63",
                 rentalPrice: "$400",
                 carColor: .carBlackColor,
                 horsepower: "755HP",
                 acceleration: "03.3",
                 aditionalImages: ["Gt63s1", "Gt63s2", "Gt63s3", "Gt63s4"],
                 description: "Merces Benz GT63s 4Door with a magnificant bodykit by Brabus and tuned by Gintani.",
                 engineType: "4.4 V8",
                 topSpeed: "335KMH",
                 interiorColor: "Black",
                 numberOfSeats: 5,
                 interiorMaterial: "Full-Leather"),
        CarModel(category: .sedan, rating: 4.4,
                 name1: "Audi", name2: "RS7",
                 smallPhoto: "rs7", bigPhoto: "RS7",
                 rentalPrice: "$400",
                 carColor: .carBlackColor,
                 horsepower: "720HP",
                 acceleration: "03.1",
                 aditionalImages: ["Rs7r1", "Rs7r2", "Rs7r3", "Rs7r4"],
                 description: "Meet the RS7-R. Its twin-turbo 4.0-liter V8 now pushes out a healthy 730 hp and 920 Newton-meters (679 pound-feet) of torque. ABT did more than just tweak the engine as the car now rides on a new set of 22-inch wheels and has a quad exhaust system replacing the dual oval tips of the standard RS7.",
                 engineType: "4.0 V8", topSpeed: "299KMH",
                 interiorColor: "Black",
                 numberOfSeats: 5,
                 interiorMaterial: "Leather - Alcantara"),
        CarModel(category: .luxury, rating: 4.5,
                 name1: "Bentley", name2: "Flying Spur",
                 smallPhoto: "flying", bigPhoto: "FLYING",
                 rentalPrice: "$600",
                 carColor: .carRedColor,
                 horsepower: "650HP",
                 acceleration: "03.8",
                 aditionalImages: ["spur1", "spur2", "spur3", "spur4"],
                 description: "The Flying Spur is the world's finest, luxury four-door Grand Tourer, one that offers a sublime, driver-focused experience. Purposeful yet elegant, the saloon is available in both four and five-seat configurations, with a class-leading portfolio of intelligent and intuitive equipment for driver and passengers alike.",
                 engineType: "6.0 W12",
                 topSpeed: "333KMH",
                 interiorColor: "Brown - Black",
                 numberOfSeats: 5,
                 interiorMaterial: "Full-Leather"),
        CarModel(category: .luxury, rating: 5.0,
                 name1: "Rolls Royce", name2: "Ghost",
                 smallPhoto: "ghost", bigPhoto: "GHOST",
                 rentalPrice: "$650",
                 carColor: .carGrayColor,
                 horsepower: "563HP",
                 acceleration: "4.2",
                 aditionalImages: ["Ghost1", "Ghost2", "Ghost3", "Ghost4"],
                 description: "The car has a 6.6 litre V12 engine which delivers a maximum Power of 603 hp (450 kW) @ 5,250 rpm and a maximum Torque of 620 lb⋅ft (841 N⋅m) @ 1,650 – 5,000 rpm. The car can accelerate from 0 to 100 km/h (62 mph) in 4.8 s and has a top speed of 250 km/h (155 mph). Its power to weight ratio is 176.3 W/kg.",
                 engineType: "6.7 V12",
                 topSpeed: "300KMH",
                 interiorColor: "White",
                 numberOfSeats: 4,
                 interiorMaterial: "Full-Leather"),
        CarModel(category: .luxury, rating: 4.7,
                 name1: "BMW", name2: "M 760li",
                 smallPhoto: "m760", bigPhoto: "M760",
                 rentalPrice: "$500",
                 carColor: .carGrayColor,
                 horsepower: "600HP",
                 acceleration: "03.9",
                 aditionalImages: ["M7601", "M7602", "M7603", "M7604"],
                 description: "BMW’s full-size sedan gets some styling tweaks as well as more technology and the addition of semi-autonomous driving. Powertrain choices range from a plug-in hybrid with 389 horsepower to a twin-turbo, 6.0-litre V12 engine producing 600 hp, and all-wheel drive is included with every one. The lavish cockpit relies on a rich selection of wood veneers, leathers and accenting, that we can upgrade nicely by choosing the Individual package.",
                 engineType: "6.0 V12",
                 topSpeed: "304 KMP",
                 interiorColor: "Black",
                 numberOfSeats: 4,
                 interiorMaterial: "Full-Leather"),
        CarModel(category: .luxury,
                 rating: 4.9,
                 name1: "Rolls-Royce", name2: "Wraith",
                 smallPhoto: "wraith", bigPhoto: "WRAITH",
                 rentalPrice: "$550",
                 carColor: .carDarkBlue,
                 horsepower: "620HP",
                 acceleration: "04.3",
                 aditionalImages: ["Wraith1", "Wraith2", "Wraith3", "Wraith4"],
                 description: "Out of darkness, rises Black Badge. The most thrilling incarnation of Rolls-Royce delivers a driving experience that is alive with potential. Enhanced in expression. Beyond this world. Black Badge Wraith presents an intoxicating manifestation of the world’s most powerful Rolls-Royce. The athletic prowess of the luxury Grand Tourer meets an irresistible dynamism, sculpted for those who dare to defy convention.",
                 engineType: "6.0 V12",
                 topSpeed: "310KMH",
                 interiorColor: "Black",
                 numberOfSeats: 4,
                 interiorMaterial: "Full-Lether"),
        CarModel(category: .luxury, rating: 4.7,
                 name1: "Mercedes", name2: "S580",
                 smallPhoto: "s580", bigPhoto: "S580",
                 rentalPrice: "$500",
                 carColor: .carBlackColor,
                 horsepower: "495HP",
                 acceleration: "04.4",
                 aditionalImages: ["S5801", "S5802", "S5803", "S5804"],
                 description: "The 2022 S-Class is thoughtfully equipped, carefully crafted, and groundbreaking from personalization to protection. The 496-hp, electrically boosted S 580 4MATIC Sedan is here to inspire drivers and automakers the world over.",
                 engineType: "4.0 V8",
                 topSpeed: "250KMH",
                 interiorColor: "Black",
                 numberOfSeats: 4,
                 interiorMaterial: "Full-Leather"),
        CarModel(category: .supercars, rating: 4.9,
                 name1: "Lamborghini", name2: "Aventador SVJ",
                 smallPhoto: "svj", bigPhoto: "SVJ",
                 rentalPrice: "$650",
                 carColor: .carGreenColor,
                 horsepower: "785HP",
                 acceleration: "2.3",
                 aditionalImages: ["svj1", "svj2", "svj3", "svj4"],
                 description: "If you need the ultimate Raging Bull, the new Lamborghini Aventador SVJ is the most capable car in their history. We already knew they achieved the fastest lap of the Nürburgring, and this is how they did it. Taking inspiration from the patented ALA system on the Huracan Performante, the latest Aventador has 4-corner active aerodynamics. Inlets behind the front spoiler can direct air to extractors ahead of the hood for maximum downforce",
                 engineType: "6.5 V12",
                 topSpeed: "333KMH",
                 interiorColor: "Black",
                 numberOfSeats: 2,
                 interiorMaterial: "Leather"),
        CarModel(category: .supercars, rating: 4.8,
                 name1: "Lamborghini", name2: "Huracan STO",
                 smallPhoto: "sto", bigPhoto: "STO",
                 rentalPrice: "$550",
                 carColor: .carBabyBlue,
                 horsepower: "670HP",
                 acceleration: "02.7",
                 aditionalImages: ["STO1", "STO2", "STO3", "STO4"],
                 description: "A super-sports car created with a singular purpose, the Huracán STO delivers all the feel and technology of a genuine race car in a road-legal model. Lamborghini’s years-long motorsport know-how, intensified by a winning heritage, is concentrated in the new Huracán STO. ",
                 engineType: "5.2 V10",
                 topSpeed: "325KMH",
                 interiorColor: "Black",
                 numberOfSeats: 2,
                 interiorMaterial: "Alcantara"),
        CarModel(category: .supercars, rating: 4.8,
                 name1: "Ferrari", name2: "SF90",
                 smallPhoto: "sf90", bigPhoto: "SF90",
                 rentalPrice: "$650",
                 carColor: .carRedColor,
                 horsepower: "985HP",
                 acceleration: "02.1",
                 aditionalImages: ["SF901", "SF902", "SF903", "SF904"],
                 description: "",
                 engineType: "4.0 V8 + Electirc",
                 topSpeed: "319KMH",
                 interiorColor: "Red",
                 numberOfSeats: 2,
                 interiorMaterial: "Leather"),
        CarModel(category: .supercars, rating: 4.9,
                 name1: "Porsche", name2: "911 GT3",
                 smallPhoto: "gt3", bigPhoto: "GT3",
                 rentalPrice: "$550",
                 carColor: .carPurpleColor,
                 horsepower: "525HP",
                 acceleration: "02.7",
                 aditionalImages: ["911gt31", "911gt32", "911gt33", "911gt34"],
                 description: "With the SF90, power comes from a massive V-8 and three electric motors. The 4.0-liter twin-turbocharged V-8 generates a mighty 769 horsepower on its own, and the trio of electric motors provide an additional 217 horsepower. In the end, the gas/electric powertrain generates a net output of 986 horsepower and 590 lb-ft of torque. Power is sent to all four wheels, making this the first mid-engine Ferrari with all-wheel drive.",
                 engineType: "4.0 V6",
                 topSpeed: "333KMH",
                 interiorColor: "Black",
                 numberOfSeats: 2,
                 interiorMaterial: "Leather - Alcantara"),
        CarModel(category: .supercars, rating: 4.8,
                 name1: "McLaren", name2: "765LT",
                 smallPhoto: "765lt", bigPhoto: "765LT",
                 rentalPrice: "$600",
                 carColor: .carOrangeColor,
                 horsepower: "765HP",
                 acceleration: "2.5",
                 aditionalImages: ["765lt1", "765lt2", "765lt3"],
                 description: "The McLaren 765LT is a supercar that makes track performance a priority and lets most creature comforts fall by the wayside. With a 755-horsepower twin-turbocharged V-8 mounted amidships, it’s wickedly quick, and its lightweight construction makes it a missile around the racetrack. Its “LT” name refers to the fact that it’s a “longtail” version of the 720S, with which it shares many components.",
                 engineType: "4.0 V8",
                 topSpeed: "335KMH",
                 interiorColor: "Black",
                 numberOfSeats: 2,
                 interiorMaterial: "Alcantara")
    ]
    
    // MARK: PROMOTION MODEL
    var promotionModel: [PromotionModel] = [
        PromotionModel(photo: "fleet", text: "Take a look at our amazing fully loaded fleet."),
        PromotionModel(photo: "gt3-promotion", text: "Have the best moments of life. GT3 now for only $350 / 3 hours."),
        PromotionModel(photo: "m5cs-promotion", text: "Get to enjoy what speed, handling, having fun is with the all new BMW M5cs. Now only for 300$ for 3h."),
        PromotionModel(photo: "s580-promotion", text: "Come get the Mercedes Brabus S580 only for 220$ / 3h and get 1 free hour.")]
    
    // MARK: MENU  MODEL
    var menuModel: [MenuOptions] = [
        MenuOptions(title: "Home", segue: "HomeSegue"),
        MenuOptions(title: "FAQ", segue: "FaqSegue"),
        MenuOptions(title: "PROFILE", segue: "HomeSegue"),
        MenuOptions(title: "ABOUT US", segue: "AboutUs")
    ]
    
    // MARK: FAQ MODEL
    var faqModel: [FAQ] = [
        FAQ(id: 0, question: "What are the payment methods?", answer: "You can to the payment with Credit Card, Crypto or even Cash.", isOpen: false),
        FAQ(id: 1, question: "How long does it take for a refund?", answer: "It takes 3-5 working days for a refund", isOpen: false),
        FAQ(id: 2, question: "How to edit my payment details?", answer: "To edit your card you just have to go to profile screen and there you have the option to change or even add new card", isOpen: false),
        FAQ(id: 3, question: "What is the reservation cost?", answer: "The reservation will be free for you, but incase of canceling ur reservation less than 3 days before the date will be an extra charge of 25$.", isOpen: false),
        FAQ(id: 4, question: "What are the pickup locations?", answer: "We have 3 different pickup locations, 'Pristina International Airport', 'Pristina Parking - Qendër' Yes you also have the option to do custom pickup location, that will be an extra charge of $25", isOpen: false),
        FAQ(id: 5, question: "Can I pick a different pickup location?", answer: "Yes you also have the option to do custom pickup location, that will be an extra charge of $25", isOpen: false),
        FAQ(id: 6, question: "What is the reservation cost?", answer: "The reservation will be free for you, but incase of canceling ur reservation less than 3 days before the date will be an extra charge of 25$.", isOpen: false),
        FAQ(id: 7, question: "How much is the insurance participation?", answer: "This depends in the car that u choose, but it is from 10% to 25% for supercars. It depends on the scratch or dent. For scratched wheels on most of the cars it will be an 100$ fee.", isOpen: false)
    ]
    
    func getCars(category: CarCategory) -> [CarModel] {
        return allCars.filter { carModel in
            carModel.category == category
        }
    }
    
    func getPopularCars() -> [CarModel] {
        return allCars.pick(6)
    }
}

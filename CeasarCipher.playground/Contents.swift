import Foundation

extension String {
    var asciiArray: [UInt32] {
        return unicodeScalars.filter{$0.isASCII}.map{$0.value}
    }
}
extension Character {
    var asciiValue: UInt32? {
        return String(self).unicodeScalars.filter{$0.isASCII}.first?.value
    }
}

_ = readLine()

var ceasarString: String = readLine()!
let rotate: UInt32 = UInt32(readLine()!)! % 26

var cipherString = ""
var limit = "AZaz".asciiArray
for index in ceasarString.indices[ceasarString.startIndex..<ceasarString.endIndex] {
    let character = ceasarString[index]
    guard let index = character.asciiValue else {
        break
    }
    var rotateIndex = index
    if (index >= limit[0] && index <= limit[1]){
        rotateIndex = limit[0]  + ((index - limit[0] ) + rotate) % 26
    }
    else if (index <= limit[3] && index >= limit[2]) {
        rotateIndex = limit[2]  + ((index - limit[2] ) + rotate) % 26
    }
    let cipherCharcter = String(describing:UnicodeScalar(UInt32(rotateIndex))!)
    cipherString += cipherCharcter
}
print(cipherString)

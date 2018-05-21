import Foundation

// Complete the isBalanced function below.
func isBalanced(s: String) -> String {
    var stack: [Character] = []
    
    for i in 0...s.count-1 {
        let index = s.index(s.startIndex, offsetBy: i)
        switch s[index] {
            case "{":
                fallthrough;
            case "[":
                fallthrough;
            case "(":
                stack.append(s[index])
            
            case "}":
                if stack.isEmpty || stack.last != "{" {
                    return "NO" 
                } else {
                    stack.removeLast()
                }
            case "]":
                if stack.isEmpty || stack.last != "[" {
                    return "NO" 
                } else {
                    stack.removeLast()
                }
            case ")":
                if stack.isEmpty || stack.last != "(" {
                    return "NO" 
                } else {
                    stack.removeLast()
                }
            
            default:
                print("input error")
        }

    }
    if stack.isEmpty {
        return "YES"
    } else {
        return "NO"
    }
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let t = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for tItr in 1...t {
    guard let s = readLine() else { fatalError("Bad input") }

    let result = isBalanced(s: s)

    fileHandle.write(result.data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}



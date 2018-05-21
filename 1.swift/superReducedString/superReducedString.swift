import Foundation

let target = "aaabccddd"

func super_reduced_string(s: String) -> String {
  var stack: [Character] = []
  
  for c in s {
    guard !stack.isEmpty else {
      stack.append(c)
      continue;
    }
    
    if stack.last == c {
      stack.removeLast()
    } else {
      stack.append(c)
    }
  }
  
  if stack.isEmpty {
    return "Empty String"
  } else {
    let answer = String(stack)
    return answer
  }
}

super_reduced_string(s: target)


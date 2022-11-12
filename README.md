# CodeFields: UIKit + SwiftUI


# Installation

Use SPM

File -> Add Packages -> search https://github.com/Nanodroop/CodeFields -> Add Package

Then import CodeFields in your projects:

Example
_______
```
AuthCodeCellsView(
                    text: $code,
                    showKeyboardNow: true,
                    length: 6,
                    errorMessage: errorMessage,
                    isActive: isActive,
                    onCommit: { _ in checkCode() },
                    onTap: { showKeyboardNow = true }
                )
```

When

@State var code = ""

@State var showKeyboardNow = false

@State var codeLength = 6

@State var errorMessage = ""

@State var showingAlert = false

@State var isActive = false

Also you can use modifiers for settings Custom UI of Texfield:

<img width="609" alt="image" src="https://user-images.githubusercontent.com/83034148/201475262-5ef48844-0f31-49fe-9d66-e6a81798282a.png">


#  Different condition:
<img width="176" alt="image" src="https://user-images.githubusercontent.com/83034148/200137043-c8e2c726-5152-47bb-8c36-f97cb38524da.png">

#  It works:
![CustomCodeField](https://user-images.githubusercontent.com/83034148/200137704-1a5107db-c379-4661-84b5-f8f96c6fd736.gif)


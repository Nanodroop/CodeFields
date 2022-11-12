# CodeFields: UIKit + SwiftUI


# Installation

Use SPM

File -> Add Packages -> search https://github.com/Nanodroop/CodeFields -> Add Package

Then import CodeFields in your projects:

Example
_______
```
AuthCodeCellsView(
                    text: $code, // text of TextField
                    showKeyboardNow: true, // show or hide keyboard
                    length: 6, // number of cells
                    errorMessage: errorMessage, // shows a text error
                    isActive: isActive, // activity status 
                    onCommit: { _ in checkCode() }, // your method for check code 
                    onTap: { showKeyboardNow = true } // show or hide keyboard
                )
```

When
```
@State var code = ""
@State var showKeyboardNow = false
@State var codeLength = 6
@State var errorMessage = ""
@State var showingAlert = false
@State var isActive = false
```

Also you can use modifiers for settings Custom UI of Texfield:

```
.alert("The right code", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) { }
} // or NavigationLink
.onChange(of: code) { _ in
  withAnimation(.easeInOut(duration: 0.2)) {
      clearCodeError()
  }
}
.onAppear {
  isActive = true
  showKeyboardNow = true
}
.onDisappear {
  isActive = false
  showKeyboardNow = false
}
```

#  Different condition:
<img width="176" alt="image" src="https://user-images.githubusercontent.com/83034148/200137043-c8e2c726-5152-47bb-8c36-f97cb38524da.png">

#  It works:
![CustomCodeField](https://user-images.githubusercontent.com/83034148/200137704-1a5107db-c379-4661-84b5-f8f96c6fd736.gif)


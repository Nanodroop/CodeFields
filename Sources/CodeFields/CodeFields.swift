import SwiftUI

@available(macOS 10.15, *)
@available(iOS 13.0, *)
struct CustomCodeField: UIViewRepresentable {
  @Binding var text: String
  let codeCount: Int
  let isFirstResponder: Bool
  let onCommit: (String) -> Void

  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }

  func makeUIView(context: Context) -> UITextField {
    let textField = UITextField()
    textField.delegate = context.coordinator
    textField.keyboardType = .numberPad
    textField.textContentType = .oneTimeCode
    textField.font = .preferredFont(forTextStyle: .largeTitle)
    textField.tintColor = .clear
    textField.textColor = .clear

    return textField
  }

  func updateUIView(_ uiView: UITextField, context: Context) {
    uiView.text = text
    if isFirstResponder && !uiView.isFirstResponder {
      uiView.becomeFirstResponder()
    }
  }

  final class Coordinator: NSObject, UITextFieldDelegate {
    let parent: CustomCodeField

    init(_ uiTextField: CustomCodeField) {
      parent = uiTextField
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
      let textFieldText = textField.text ?? ""
      parent.text = textFieldText
      if textFieldText.count == parent.codeCount
        && textField.isFirstResponder {
        parent.onCommit(textFieldText)
      }
    }

    func textField(
      _ textField: UITextField,
      shouldChangeCharactersIn range: NSRange,
      replacementString string: String
    ) -> Bool {
      if let text = textField.text, text.count >= parent.codeCount,
        let char = string.cString(using: .utf8) {
        return strcmp(char, "\\b") == -92
      } else {
        return true
      }
    }
  }
}


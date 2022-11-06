import SwiftUI

@available(iOS 13.0, *)
@available(macOS 10.15, *)
public struct AuthCodeCellsView: View {
    @Binding public var code: String
    public let showKeyboardNow: Bool
    public let cornerRadius: CGFloat = 5
    public let height: CGFloat = 50
    public let length: Int
    public let errorMessage: String
    public let isActive: Bool
    public let onCommit: (String) -> Void
    public let onTapGesture: () -> Void
    
    public init(
        text: Binding<String>,
        showKeyboardNow: Bool,
        length: Int,
        errorMessage: String = "",
        isActive: Bool = true,
        onCommit: @escaping (String) -> Void,
        onTap: @escaping () -> Void
    ) {
        self._code = text
        self.showKeyboardNow = showKeyboardNow
        self.length = length
        self.errorMessage = errorMessage
        self.isActive = isActive
        self.onCommit = onCommit
        self.onTapGesture = onTap
    }
    
    public var body: some View {
        ZStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 8) {
                    ForEach(0..<length, id: \.self) {
                        rows(for: codeLetter(with: $0))
                    }
                }
                if hasError {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.footnote)
                }
            }
            CustomCodeField(
                text: $code,
                codeCount: length,
                isFirstResponder: showKeyboardNow,
                onCommit: onCommit
            )
            .frame(height: height)
            .onTapGesture(perform: onTapGesture)
        }
        .padding(.bottom, 20)
        .animation(.easeInOut(duration: 0.2), value: showKeyboardNow)
    }
}

@available(iOS 13.0, *)
public extension AuthCodeCellsView {
    var hasError: Bool {
        !errorMessage.isEmpty
    }
    
    func rows(for text: String) -> some View {
        Text(text)
            .foregroundColor(Color.black)
            .font(.system(.headline))
            .frame(width: 50, height: height)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius).stroke(
                    hasError ? Color(.red).opacity(0.8) : Color(.blue).opacity(0.8),
                    lineWidth: isActive ? 1 : .zero
                )
                .background(backgroundColor)
            )
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
    
    var backgroundColor: Color {
        if isActive {
            return hasError ? .init(.red).opacity(0.2) : .init(.blue).opacity(0.2)
        } else {
            return .init(.gray).opacity(0.2)
        }
    }
    
    func codeLetter(with index: Int) -> String {
        if code.count > index {
            let start = code.startIndex
            let current = code.index(start, offsetBy: index)
            return .init(code[current])
        } else {
            return ""
        }
    }
}





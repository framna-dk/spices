import SwiftUI

struct MenuItemListView: View {
    @EnvironmentObject private var userInteraction: UserInteraction
    private let title: String
    private let menuItems: [MenuItem]
    private let dismiss: () -> Void

    init(items menuItems: [MenuItem], title: String, dismiss: @escaping () -> Void) {
        self.title = title
        self.menuItems = menuItems
        self.dismiss = dismiss
    }

    var body: some View {
        Form {
            MenuItemListContent(menuItems: menuItems, dismiss: dismiss)
        }
        .disabled(!userInteraction.isEnabled)
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                if #available(iOS 26.0, *) {
                    Button(role: .close, action: dismiss)
                } else {
                    Button {
                        dismiss()
                    } label: {
                        Text("Done").fontWeight(.bold)
                    }
                }
            }
        }
    }
}

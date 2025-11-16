# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**SDP-Ejercicios-SwiftUI** is an educational project from the Swift Developer Program (SDP) at Apple Coding Academy, consisting of SwiftUI exercise implementations.

- **Platform**: iOS Native Development
- **Language**: Swift
- **UI Framework**: SwiftUI
- **Current iOS Version**: iOS 26 (primary development target with Liquid Glass features)
- **Supported iOS Versions**: iOS 26, iOS 18, iOS 17 (with fallbacks when necessary)
- **Code Language**: English (all code, comments, and documentation)
- **Project Type**: Single Xcode project with multiple exercise modules

## Building and Running

### Opening the Project
```bash
# Open the Xcode project
open SDP-Ejercicios-SwiftUI.xcodeproj
```

### Running the App
- Select a simulator or physical device as the target
- Press Run or use `⌘ + R`
- The app launches `MainMenuView` which provides a menu to navigate between all exercises and tasks

### Common Commands
- **Build**: `⌘ + B`
- **Clean Build**: `⌘ + Shift + K`
- **Clean Derived Data**: Use Xcode menu if needed for troubleshooting

## Project Structure

This project is organized into independent exercise modules, each in its own subdirectory:

```
SDP-Ejercicios-SwiftUI/
├── SDP_Ejercicios_SwiftUIApp.swift  # App entry point
├── PlaceholderView.swift             # Generic placeholder for upcoming features
├── Menu/                             # Main navigation menu
│   ├── Data/                        # Menu data models
│   │   ├── MenuItem.swift           # Menu item data structure
│   │   └── MenuData.swift           # Menu items definitions (exercises & tasks)
│   └── Views/                       # Menu UI components
│       ├── MainMenuView.swift       # Main menu container
│       └── Components/
│           ├── MenuSection.swift    # Menu section component
│           └── MenuItemRow.swift    # Menu item row component
├── MusicApp/                         # Exercise 1: Music player UI
│   ├── MusicApp.swift               # Main view
│   ├── CirclesView.swift            # Component
│   ├── GridView.swift               # Component
│   ├── CustomSlider.swift           # Reusable slider component
│   └── Font+Extensions.swift        # Typography extensions
└── WeatherApp/                       # Exercise 2: Weather app UI
    ├── Models/                       # Data models
    │   ├── WeatherDate.swift
    │   └── WeatherDateOption.swift
    ├── Repository/                   # Data layer
    │   ├── WeatherRespositoryProtocol.swift
    │   └── WeatherRespository.swift
    ├── ViewModel/                    # Business logic
    │   └── WeatherViewModel.swift
    └── Views/                        # UI components
        ├── WeatherApp.swift
        ├── WeatherByHourRow.swift
        ├── WeatherByWeekdayRow.swift
        └── WeatherHeaderView.swift
```

### Main Navigation

The app uses `MainMenuView.swift` as the entry point, providing a sectioned list to navigate between Exercises and Tasks.

#### Menu Navigation System

The menu system is data-driven and extensible:

- **MenuItem**: Data structure defining menu items with `id`, `title`, `subtitle`, `icon`, and `destination`
- **MenuDestination**: Enum-based navigation using SwiftUI's `NavigationStack` and `.navigationDestination(for:)`
- **MenuData.swift**: Centralized definitions for `exercises` and `tasks` arrays
- **MenuSection**: Component for rendering sections (Exercises, Tasks)
- **MenuItemRow**: Component for individual menu items

To add a new exercise or task:
1. Add a new case to `MenuDestination` enum in `MenuItem.swift`
2. Create a new `MenuItem` in `MenuData.swift` (in `exercises` or `tasks` array)
3. Add the navigation destination case in `MainMenuView.swift`'s `.navigationDestination(for:)` modifier

### Exercise Modules

#### MusicApp (Exercise 1)
- **Purpose**: UI-only exercise emulating a music player interface
- **Architecture**: Simple view-based, no ViewModel (UI practice focus)
- **Key Features**: Custom slider component, gradients, SF Symbols

#### WeatherApp (Exercise 2)
- **Purpose**: Weather app UI with MVVM architecture
- **Architecture**: Clean Architecture with Model-Repository-ViewModel-View layers
- **Key Features**: Protocol-based repository, date-based data handling, segmented picker

## Architecture Pattern

### Clean Architecture (4 Layers)

The project follows Clean Architecture with four distinct layers:

1. **Model Layer**
   - Pure Swift data structures
   - No dependencies on other layers
   - Codable conformance when needed for data persistence/networking

2. **Interactor/Repository Layer**
   - Protocol-Oriented Programming approach
   - Separate protocols for data sources (local and remote persistence)
   - Dependency Injection ready
   - Two implementations per protocol:
     - Production implementation
     - Testing/Mock implementation
   - Example:
     ```swift
     protocol UserRepositoryProtocol {
         func fetchUsers() async throws -> [User]
     }
     
     final class UserRepository: UserRepositoryProtocol {
         // Production implementation
     }
     
     final class MockUserRepository: UserRepositoryProtocol {
         // Testing implementation
     }
     ```

3. **Interface Adapter Layer (ViewModel)**
   - Conforms to `ObservableObject` protocol
   - Uses `@Published` properties for state management
   - Handles business logic and data transformation
   - Communicates with Interactor/Repository through protocols
   - Dependency injection through initializer

4. **View Layer**
   - SwiftUI views
   - Highly componentized architecture
   - Each component in its own file
   - State passed through `@Binding` when needed

## Code Organization

### MARK Comments Structure

All Swift files MUST follow this MARK organization order:

```swift
// MARK: - Private Properties

// MARK: - States (or Bindings)

// MARK: - Properties

// MARK: - Private Functions

// MARK: - Functions

// MARK: - Extensions

// MARK: - Previews
```

### Example Structure:

```swift
import SwiftUI

struct ExampleView: View {
    
    // MARK: - Private Properties
    
    @StateObject private var viewModel: ExampleViewModel
    
    // MARK: - States
    
    @State private var isLoading = false
    @State private var errorMessage: String?
    
    // MARK: - Properties
    
    let itemId: String
    
    // MARK: - Body
    
    var body: some View {
        // View implementation
    }
    
    // MARK: - Private Functions
    
    private func handleError(_ error: Error) {
        // Error handling
    }
    
    // MARK: - Functions
    
    func refreshData() {
        // Public function
    }
}

// MARK: - Extensions

extension ExampleView {
    // Extensions if needed
}

// MARK: - Previews

#Preview {
    ExampleView(itemId: "123")
}
```

## View Componentization

### Mandatory Component Separation

Views MUST be componentized into separate files:

- **Main View**: Container with main structure (NavigationStack, TabView, etc.)
- **Row/Cell Components**: Separate files for list items
- **Subviews**: Any reusable or complex view section

### Example List Structure:

**UserListView.swift**
```swift
struct UserListView: View {
    
    // MARK: - Private Properties
    
    @StateObject private var viewModel: UserListViewModel
    
    // MARK: - Body
    
    var body: some View {
        List {
            ForEach(viewModel.users) { user in
                UserRowView(user: user, onTap: viewModel.selectUser)
            }
        }
    }
}
```

**UserRowView.swift**
```swift
struct UserRowView: View {
    
    // MARK: - Properties
    
    let user: User
    let onTap: (User) -> Void
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            // Row content
        }
        .onTapGesture {
            onTap(user)
        }
    }
}
```

### State Management in Components

- Use `@Binding` for two-way state synchronization
- Pass closures for actions/callbacks
- Keep components as stateless as possible

**Example with @Binding:**
```swift
struct SettingsToggleRow: View {
    
    // MARK: - Bindings
    
    @Binding var isEnabled: Bool
    
    // MARK: - Properties
    
    let title: String
    
    // MARK: - Body
    
    var body: some View {
        Toggle(title, isOn: $isEnabled)
    }
}
```

## iOS Version Compatibility

### Fallback Strategy

When using iOS 26 features, always provide fallbacks for iOS 18 and iOS 17:

```swift
// iOS 26 feature with fallback
if #available(iOS 26.0, *) {
    // Use iOS 26 API (Liquid Glass, Foundation Models, etc.)
    ScrollView {
        // New iOS 26 API
    }
    .liquidGlassEffect() // Example of new iOS 26 API
} else if #available(iOS 18.0, *) {
    // iOS 18 fallback
    ScrollView {
        // iOS 18 implementation
    }
} else {
    // iOS 17 fallback
    ScrollView {
        // iOS 17 implementation
    }
}
```

### Common Compatibility Patterns:

```swift
// ViewModifier availability
.onAppear {
    if #available(iOS 26.0, *) {
        // iOS 26 code (Liquid Glass, Foundation Models)
    } else if #available(iOS 18.0, *) {
        // iOS 18 code
    } else {
        // iOS 17 fallback
    }
}

// Alternative View components
@ViewBuilder
var contentView: some View {
    if #available(iOS 26.0, *) {
        ModernView() // Using iOS 26 features
    } else if #available(iOS 18.0, *) {
        iOS18View() // Using iOS 18 features
    } else {
        LegacyView() // iOS 17 compatible
    }
}
```

## Protocol-Oriented Programming & Dependency Injection

### Repository Pattern with Protocols

```swift
// Protocol definition
protocol ProductRepositoryProtocol {
    func fetchProducts() async throws -> [Product]
    func saveProduct(_ product: Product) async throws
}

// Production implementation
final class ProductRepository: ProductRepositoryProtocol {
    
    // MARK: - Private Properties
    
    private let networkService: NetworkServiceProtocol
    private let localStorage: LocalStorageProtocol
    
    // MARK: - Properties
    
    init(networkService: NetworkServiceProtocol, 
         localStorage: LocalStorageProtocol) {
        self.networkService = networkService
        self.localStorage = localStorage
    }
    
    // MARK: - Functions
    
    func fetchProducts() async throws -> [Product] {
        // Implementation
    }
    
    func saveProduct(_ product: Product) async throws {
        // Implementation
    }
}

// Mock implementation for testing
final class MockProductRepository: ProductRepositoryProtocol {
    
    // MARK: - Properties
    
    var mockProducts: [Product] = []
    var shouldThrowError = false
    
    // MARK: - Functions
    
    func fetchProducts() async throws -> [Product] {
        if shouldThrowError {
            throw MockError.genericError
        }
        return mockProducts
    }
    
    func saveProduct(_ product: Product) async throws {
        if shouldThrowError {
            throw MockError.genericError
        }
        mockProducts.append(product)
    }
}
```

### ViewModel with Dependency Injection

```swift
final class ProductListViewModel: ObservableObject {
    
    // MARK: - Private Properties
    
    private let repository: ProductRepositoryProtocol
    
    // MARK: - Published Properties
    
    @Published var products: [Product] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    // MARK: - Properties
    
    init(repository: ProductRepositoryProtocol) {
        self.repository = repository
    }
    
    // MARK: - Functions
    
    func loadProducts() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            products = try await repository.fetchProducts()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
```

## File Structure Best Practices

### Recommended Project Organization:

```
ProjectName/
├── Models/
│   └── User.swift
├── Data/
│   ├── Repositories/
│   │   ├── Protocols/
│   │   │   └── UserRepositoryProtocol.swift
│   │   ├── UserRepository.swift
│   │   └── MockUserRepository.swift
│   └── Services/
│       └── NetworkService.swift
├── ViewModels/
│   └── UserListViewModel.swift
└── Views/
    ├── UserListView.swift
    └── Components/
        └── UserRowView.swift
```

## SwiftUI Best Practices

### Property Wrappers Usage

- `@StateObject`: For ViewModel creation and ownership
- `@ObservedObject`: For ViewModel passed from parent
- `@State`: For local view state
- `@Binding`: For two-way state synchronization with parent
- `@Environment`: For accessing environment values

### Preview Configuration

Always provide previews with sample data.

**For component views (rows, cells, subviews):**
```swift
// MARK: - Previews

#Preview(
    "User Row View",
    traits: .sizeThatFitsLayout
) {
    UserRowView(user: sampleUser)
        .padding()
}
```

**For main/container views:**
```swift
// MARK: - Previews

#Preview {
    NavigationStack {
        UserListView(
            viewModel: UserListViewModel(
                repository: MockUserRepository()
            )
        )
    }
}

#Preview("Dark Mode") {
    NavigationStack {
        UserListView(
            viewModel: UserListViewModel(
                repository: MockUserRepository()
            )
        )
    }
    .preferredColorScheme(.dark)
}
```

**Preview naming convention:**
- Component views: Use descriptive name matching the view (e.g., "User Row View" for `UserRowView`)
- Component views: Use `traits: .sizeThatFitsLayout` and add `.padding()` to the view instance
- Main views: Can omit the name parameter or use descriptive names for variants (e.g., "Dark Mode")

## Naming Conventions

- **Files**: PascalCase matching the main type (e.g., `UserListView.swift`)
- **Types**: PascalCase (e.g., `UserRepository`)
- **Protocols**: PascalCase with "Protocol" suffix (e.g., `UserRepositoryProtocol`)
- **Variables/Functions**: camelCase (e.g., `fetchUsers`)
- **Private properties**: camelCase with underscore prefix when needed for clarity

## Error Handling

Use Swift's structured concurrency error handling:

```swift
// MARK: - Functions

func loadData() async {
    do {
        let data = try await repository.fetchData()
        self.data = data
    } catch {
        handleError(error)
    }
}

// MARK: - Private Functions

private func handleError(_ error: Error) {
    if let customError = error as? CustomError {
        errorMessage = customError.userMessage
    } else {
        errorMessage = error.localizedDescription
    }
}
```

## Code Generation Instructions

When generating code:

1. ✅ Always use English for all code elements
2. ✅ Follow the MARK organization structure strictly
3. ✅ Create separate files for each component
4. ✅ Use Protocol-Oriented Programming for repositories
5. ✅ Provide both production and mock implementations
6. ✅ Target iOS 26 as primary version with fallbacks for iOS 18 and iOS 17
7. ✅ Componentize views into separate files
8. ✅ Use @Binding for state passing between components
9. ✅ Include comprehensive previews
10. ✅ Follow Clean Architecture layers strictly
11. ✅ Leverage iOS 26 features when appropriate (Liquid Glass, Foundation Models, App Intents enhancements)

## Example Complete Implementation

See the structure below for a complete feature implementation:

**Model (User.swift)**
```swift
import Foundation

struct User: Identifiable, Codable {
    let id: UUID
    let name: String
    let email: String
}
```

**Protocol (UserRepositoryProtocol.swift)**
```swift
import Foundation

protocol UserRepositoryProtocol {
    func fetchUsers() async throws -> [User]
    func createUser(_ user: User) async throws
}
```

**Repository (UserRepository.swift)**
```swift
import Foundation

final class UserRepository: UserRepositoryProtocol {
    
    // MARK: - Private Properties
    
    private let networkService: NetworkServiceProtocol
    
    // MARK: - Properties
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    // MARK: - Functions
    
    func fetchUsers() async throws -> [User] {
        try await networkService.get(endpoint: "/users")
    }
    
    func createUser(_ user: User) async throws {
        try await networkService.post(endpoint: "/users", body: user)
    }
}
```

**Mock Repository (MockUserRepository.swift)**
```swift
import Foundation

final class MockUserRepository: UserRepositoryProtocol {
    
    // MARK: - Properties
    
    var users: [User] = []
    var shouldThrowError = false
    
    // MARK: - Functions
    
    func fetchUsers() async throws -> [User] {
        if shouldThrowError {
            throw URLError(.badServerResponse)
        }
        return users
    }
    
    func createUser(_ user: User) async throws {
        if shouldThrowError {
            throw URLError(.badServerResponse)
        }
        users.append(user)
    }
}
```

**ViewModel (UserListViewModel.swift)**
```swift
import Foundation

final class UserListViewModel: ObservableObject {
    
    // MARK: - Private Properties
    
    private let repository: UserRepositoryProtocol
    
    // MARK: - Published Properties
    
    @Published var users: [User] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    // MARK: - Properties
    
    init(repository: UserRepositoryProtocol) {
        self.repository = repository
    }
    
    // MARK: - Functions
    
    func loadUsers() async {
        isLoading = true
        errorMessage = nil
        
        do {
            users = try await repository.fetchUsers()
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}
```

**Main View (UserListView.swift)**
```swift
import SwiftUI

struct UserListView: View {
    
    // MARK: - Private Properties
    
    @StateObject private var viewModel: UserListViewModel
    
    // MARK: - Properties
    
    init(repository: UserRepositoryProtocol = UserRepository(networkService: NetworkService())) {
        _viewModel = StateObject(wrappedValue: UserListViewModel(repository: repository))
    }
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.users) { user in
                    UserRowView(user: user)
                }
            }
            .navigationTitle("Users")
            .overlay {
                if viewModel.isLoading {
                    ProgressView()
                }
            }
            .task {
                await viewModel.loadUsers()
            }
        }
    }
}

// MARK: - Previews

#Preview {
    let mockRepo = MockUserRepository()
    mockRepo.users = [
        User(id: UUID(), name: "John Doe", email: "john@example.com"),
        User(id: UUID(), name: "Jane Smith", email: "jane@example.com")
    ]
    
    return UserListView(repository: mockRepo)
}
```

**Component (UserRowView.swift)**
```swift
import SwiftUI

struct UserRowView: View {

    // MARK: - Properties

    let user: User

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(user.name)
                .font(.headline)
            Text(user.email)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding(.vertical, 4)
    }
}

// MARK: - Previews

#Preview(
    "User Row View",
    traits: .sizeThatFitsLayout
) {
    UserRowView(
        user: User(
            id: UUID(),
            name: "John Doe",
            email: "john@example.com"
        )
    )
    .padding()
}
```

---

**Remember**: This configuration ensures clean, maintainable, and testable iOS code following industry best practices and your specific development standards.
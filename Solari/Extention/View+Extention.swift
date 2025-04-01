import Foundation
import SwiftUI

struct RouterViewModifier: ViewModifier {
    @State private var router: Route = Router()
    
    private func routeNav(for route: Route) -> some View {
        Group {
            switch route {
            case .home:
                HomeScreen()
            case .startPoint:
                RouteStartPointScreen()
            case .runProgress:
                RunProgressScreen()
            case .summary:
                SummaryScreen()
            }
        }
        .environment(route)
    }
    
    func body(content: Content) -> some View {
        NavigationStack(path: $router.path) {
            content
                .environment(router)
                .navigationDestination(for: Route.self, destination: { route in
                    routeNav(for: route)
                })
        }
    }
}

extension View {
    func bindRouter() -> some View {
        modifier(RouterViewModifier())
    }
}

import ComposableArchitecture
import Foundation
import Model

public struct TimetableDetailState: Equatable {
    public var timetable: AnyTimetableItem
    public var showingURL: URL?

    var isSheetPresented: Bool {
        showingURL != nil
    }

    public init(
        timetable: AnyTimetableItem,
        showingURL: URL? = nil
    ) {
        self.timetable = timetable
        self.showingURL = showingURL
    }
}

public enum TimetableDetailAction {
    case tapLink(URL)
    case hideSheet
}

public let timetableDetailReducer = Reducer<TimetableDetailState, TimetableDetailAction, Void> { state, action, _ in
    switch action {
    case .tapLink(let link):
        state.showingURL = link
        return .none
    case .hideSheet:
        state.showingURL = nil
        return .none
    }
}
//
//  BaseCoordinator.swift
//  my_messenger
//
//  Created by Kirill Titov on 03.12.2022.
//

/// Base class for coordinator
//open class BaseCoordinator {
//	public let router: Routable
//	private weak var parentCoordinator: BaseCoordinator?
//	private let listener = DefaultLifeCycleListener()
//	private var childCoordinators: [BaseCoordinator] = []
//	
//	public private(set) var countUnits: Int = 0 {
//		didSet {
//			assert(countUnits >= 0, "Что-то пошло не так!")
//			if countUnits == 0 { parentCoordinator?.removeChild(self) }
//		}
//	}
//	
//	public init(router: Routable, parent: BaseCoordinator? = nil) {
//		self.parentCoordinator = parent
//		self.router = router
//		self.router.subscribe(listener)
//		self.listener.recieveEvent = { ... }
//	}
//}

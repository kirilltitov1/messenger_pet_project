import Foundation

public protocol ServiceProtocol {
	static var service: Self { get }

	func clear()
	func remove()
}

public protocol ServiceLocatorProtocol {
	func service<T>() -> T?
}

public final class ServiceLocator: ServiceLocatorProtocol {

	private static let instance = ServiceLocator()

	private lazy var services: [String: Any] = [:]

	public init() {}

	// MARK: - Public static methods
	public class func service<T>() -> T? {
		return instance.service()
	}

	public class func addService<T>(_ service: T) {
		return instance.addService(service)
	}

	public class func clear() {
		instance.services.removeAll()
	}

	public class func removeService<T>(_ service: T) {
		instance.removeService(service)
	}

	public func service<T>() -> T? {
		let key = typeName(T.self)
		return services[key] as? T
	}

	// MARK: - Private methods
	private func addService<T>(_ service: T) {
		let key = typeName(T.self)
		services[key] = service
	}

	private func removeService<T>(_ service: T) {
		let key = typeName(T.self)
		services.removeValue(forKey: key)
	}

	private func typeName(_ some: Any) -> String {
		return (some is Any.Type) ? "\(some)" : "\(type(of: some))"
	}
}

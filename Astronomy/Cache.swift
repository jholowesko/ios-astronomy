import Foundation

class Cache<Key: Hashable, Value> {
    
    private var dictionary: [Key : Value] = [:]
    private let queue = DispatchQueue.init(label: "SerialCacheQueue")
    
    /// Add to Cache
    func cache(value: Value, for key: Key) {
        queue.async {
            self.dictionary[key] = value
        }
    }
    
    /// Retrieve Value
    func value(for key: Key) -> Value? {
        queue.sync {
            return dictionary[key]
        }
    }
}

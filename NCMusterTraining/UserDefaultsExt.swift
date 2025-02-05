import Foundation

public extension UserDefaults {
    // MARK: Encode And Set
    /// Encodes the value to JSON and sets it to the given key.
    func encodeAndSet<T: Encodable, Key: UserDefaultsSaveKey>(_ value: T, forKey key: Key) throws {
        let encodedValue = try JSONEncoder().encode(value)
        
        setValue(encodedValue, forKey: key.rawValue)
    }
    
    // MARK: Load And Decode
    /// Loads the data (which should be JSON) from the key, decodes it and returns the decoded value.
    func loadAndDecode<T: Decodable, Key: UserDefaultsSaveKey>(fromKey key: Key) throws -> T {
        guard let loadedValue = data(forKey: key.rawValue) else {
            throw UserDefaultsDecodingError.noValueForKey
        }
        
        return try JSONDecoder().decode(T.self, from: loadedValue)
    }
    
    /// Loads the data (which should be JSON) from the key and returns the decoded value. If there is an error, the default value gets returned instead.
    func loadAndDecode<T: Decodable, Key: UserDefaultsSaveKey>(fromKey key: Key, withDefault defaultValue: T) -> T {
        (try? loadAndDecode(fromKey: key) as T) ?? defaultValue
    }
    
    // MARK: Decoding Error
    enum UserDefaultsDecodingError: Error, LocalizedError {
        case noValueForKey
        
        public var errorDescription: String? {
            switch self {
            case .noValueForKey:
                return "There is no value with the given key."
            }
        }
    }
}


// MARK: - UserDefaults Save Key
/// A protocol to which the enum storing the save keys has to conform.
public protocol UserDefaultsSaveKey: RawRepresentable where RawValue == String { }

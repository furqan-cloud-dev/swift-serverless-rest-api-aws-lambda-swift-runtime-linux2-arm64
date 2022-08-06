

import Foundation
import AWSLambdaRuntime
import AWSLambdaEvents


struct SwiftServer: AsyncLambdaHandler {
    
    typealias In = APIGateway.V2.Request
    typealias Out = APIGateway.V2.Response
   
    struct Welcome: Encodable {
        var message: String
    }
    
    init(context: Lambda.InitializationContext) async throws {
        print("initializations....")
//        let dbSetup = DBManager.shared.isSetUpCompletedSuccessfully()
//        print("db-setup-completed: ", dbSetup)
    }
    
    
    func handle(event: In, context: Lambda.Context) async throws -> Out {
        if event.context.http.path == "/welcome" && event.context.http.method == .GET {
            let bodyOutput = try JSONEncoder().encodeAsString(Welcome(message: "swift rest-api server is running"))
            let output = Out(statusCode: .ok, headers: ["content-type": "application/json"], body: bodyOutput)
            return output
        }
        else {
            return Out(statusCode: .notFound)
            /*
            do {
                let output = try await processRequest(request: event)
                return output
            }
            catch let error as JWTAuthorizationError {
                return try errorResponse(statusCode: .unauthorized, message: error.errorDescription)
            }
            catch let error as RequestBodyValidationError {
                return try errorResponse(statusCode: .badRequest, message: error.errorDescription)
            }
            catch let error as EntityValidationError {
                return try errorResponse(statusCode: .badRequest, message: error.errorDescription)
            }
            catch let error as LoginError {
                return try errorResponse(statusCode: .unauthorized, message: error.errorDescription)
            }
            catch {
                var message = error.localizedDescription
                if let errorDescription = (error as? LocalizedError)?.errorDescription {
                    message = errorDescription
                }
                
                return try errorResponse(statusCode: .internalServerError, message: message)
            }
             */
        }
    }
    

    
    func errorResponse(statusCode: HTTPResponseStatus, message: String?) throws -> Out {
        let errorResponse = ["error": message]
        let bodyOutput = try JSONEncoder().encodeAsString(errorResponse)
        let output = Out(statusCode: statusCode, headers: ["content-type": "application/json"], body: bodyOutput)
        return output
    }
    
}


SwiftServer.main()


extension JSONEncoder {
    func encodeAsString<T: Encodable>(_ value: T) throws -> String {
        try String(decoding: self.encode(value), as: Unicode.UTF8.self)
    }
}

extension JSONDecoder {
    func decode<T: Decodable>(_ type: T.Type, from string: String) throws -> T {
        try self.decode(type, from: Data(string.utf8))
    }
}

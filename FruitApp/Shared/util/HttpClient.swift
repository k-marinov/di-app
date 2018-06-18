import RxSwift

class HttpClient {

    func request(urlRequest: URLRequest) -> Observable<HttpResponse> {
        return Observable.create { observer in
            let session = URLSession(configuration: URLSessionConfiguration.default)
            let task: URLSessionDataTask = session.dataTask(
                with: urlRequest,
                completionHandler: { data, response, error in
                    let httpResponse: HttpResponse = HttpResponse(
                        response: response as? HTTPURLResponse,
                        data: data,
                        error: error)
                    observer.onNext(httpResponse)
                    observer.onCompleted()
            })
            task.resume()
            return Disposables.create {
                task.cancel()
            }
        }
    }

}

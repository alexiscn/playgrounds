1. declare a `DispatchSemaphore` with an initail value that counts semaphore

```
let semaphore = DispatchSemaphore(value: 0)
```

2. run the async tasks before wait

```
let url: URL = URL(string: "https://www.baidu.com")!
let session = URLSession(configuration: .default)
session.dataTask(with: url, completionHandler: { (data, response, error) in
    print("data task finsh")
}).resume()
```

3. call `wait()` function to decrease the counting semaphore. If the resulting value is less than zero, it waits for a signal to occur before returning.

```
semaphore.wait()
```

4. when async function completed, call `signal()`, which increase the counting semaphore. If the previous value was less than zero, it wakes a waiting thread before returning.

```
semaphore.signal()
```

## the completed codes:


```
let semaphore = DispatchSemaphore(value: 0)

let url: URL = URL(string: "https://www.baidu.com")!
let session = URLSession(configuration: .default)

for i in 0...9 {
    session.dataTask(with: url, completionHandler: { (data, response, error) in
        print(i)
        semaphore.signal()
    }).resume()
    semaphore.wait()
}
```
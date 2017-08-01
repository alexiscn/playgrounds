## declare a `DispatchSemaphore` with an initail value that counts seamphore

```
let seamphore = DispatchSemaphore(value: 0)
```

## do the async tasks before wait

```
let url: URL = URL(string: "https://www.baidu.com")!
let session = URLSession(configuration: .default)
session.dataTask(with: url, completionHandler: { (data, response, error) in
    print("data task finsh")
}).resume()
```

## call `wait()` function to decrease the counting seamphore. If the resulting value is less than zero, it waits for a signal to occur before returning.

seamphore.wait()

# when async function completed, call `signal()`, which increase the counting seamphore. If the previous value was less than zero, it wakes a waiting thread before returning.

```
seamphore.signal()
```

## the completed codes:


```
let seamphore = DispatchSemaphore(value: 0)

let url: URL = URL(string: "https://www.baidu.com")!
let session = URLSession(configuration: .default)

for i in 0...9 {
    session.dataTask(with: url, completionHandler: { (data, response, error) in
        print(i)
        seamphore.signal()
    }).resume()
    seamphore.wait()
}
```
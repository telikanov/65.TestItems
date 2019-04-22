# 65.TestItems

2. Объясните почему блок "Work 2" не выполняется? 

let serialQueue = DispatchQueue(label: "com.foo.bar") 
serialQueue.async { 
  print("Work 1") 
  serialQueue.sync { 
    print("Work 2") 
  } 
} 

Потому что эппл так сделал :)

Нельзя вызывать функцию dispatch_sync из задачи, которая выполняется в той же очереди,
которую мы передаем в вызов функции. Это заблокирует очередь.
Если нужно отправить в текущую очередь, сделайте это нужно асинхронно, используя функцию dispatch_async.

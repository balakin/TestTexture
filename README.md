# Тестовое задание

### AsyncDisplayKit(Texture)

![](https://github.com/msfrms/TestTexture/blob/master/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202018-06-23%20%D0%B2%2016.42.07.png)

Требуется расположить `Node` как показано на рисунке, в классе `TestTaskNode`

```objective-c
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize
{
    // Код нужно писать здесь
}
```

### ReactiveCocoa
`signal1...signal5` демонстрируют сетевые запросы, нужно сделать так

`signal1, signal2` выполняются параллельно, после того как они завершатся, выполнить `signal3`, после того как он завершится выполнить параллельно `signal4, signal5`

Это нужно сделать в классе `ViewController`, в методе `viewDidLoad`

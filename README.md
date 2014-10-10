# QBaseViewController (KeyboardObserver)

在编写为QBaseViewController编写监听键盘展示高度的监听回调时，遇到了一些设计上的分歧，做一个笔记。

## QBaseViewController的实现方式

### 通过 QBaseKeyboardManager 实现控制器的监听功能

在一开始的编写时，带着撰写一个对象，然后做监控回调来完成监听功能。于是就撰写了QBaseKeyboardManager。  

首先，QBaseKeyboardManager的监听事件是依靠代理**Delegate**以及**代码块Block**来实现。

然后，在通用的QBaseViewController中，使用了QBaseKeyboardManager来监听事件。 （ 即继承QBaseViewController的对象内部均要初始化一个KeyboaedManager对象, 然后需要的通过代理来获取回调 ）

### 通过 类别Category 实现视图控制器的监听功能

通过Category，对QBaseViewControlller对象进行了扩展了直接的监听方法，直接就可以进行事件的监听功能。

## 比较两种用法

| 实现方式     | 监听对象              | 监听流程传递次数 | 必要条件                   |
|-------------|---------------------|---------------| --------------------------|
| 协议Protocol | KeyboardManager对象  | 2次           | 必须持有keyboardManager对象 |
| 类别Category | QBaseViewController | 1次           | 引用扩展就可以使用           |

从上述表格的比较可以发现，通过KeyboardManager在代码实现上虽然没有任何问题，但是相比类别扩展，在某种意义上使得整个流程变得更加复杂化。

## 关于耦合性 coupling

耦合性也叫块间联系。指软件系统结构中各模块间相互联系紧密程度的一种度量。模块之间联系越紧密，其耦合性就越强，模块的独立性则越差，模块间耦合的高低取决于模块间接口的复杂性，调用的方式以及传递的信息。

从概念上理解，在能完成相同功能的情况下，我们会发现想要使得代码组件之间分离的越开，代码的使用上会更加简单。因此有必要的降低代码的耦合性，使得每个组件都相互独立。

在上述两种设计上，很明显的发现QBaseViewController过度依赖KeyboaedManager，虽然在完成了指定功能，但是耦合性高于扩展类别。



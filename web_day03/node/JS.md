# ○ JavaScript

### 1.主要实现：ECMA + DOM + BOM

### 2.ECMA - js核心基础

#### 1）JS变量

##### 	a 特点

​		① js中的变量是弱类型，类型可以随意转换
​		② 可以不用声明变量，不声明时是全局变量
​	

##### 	b 声明变量：var + 变量名

##### 	c typeof运算符：类型

​		值：number - 数值类型

​				boolean - 布尔类型

​				String - 字符串类型

​				object - 引用或者null类型

​				undefined - 没有定义类型

#### 2）逻辑控制语句

​	注意：java中额类型全部变成var即可

#### 3）运算符

​	== 和 ===的区别：

​		== : 判断的是内容，而不是类型

​		=== : 比较内容 + 类型

#### 4）数组 - Array对象

​	a 定义格式

​		① var 变量名 = new Array(元素列表);

​		② var 变量名 = [元素列表];

#### 5）函数 - function

##### 	特点：

​		a. 没有访问修饰符、返回值类型

​		b. 没有重载概念，是直接进行覆盖

​		c. 调用时，参数给多了，不影响；参数给少了 - NaN

### 3.BOM对象 - 浏览器对象模型

#### 1）作用

#### 2）BOM中包含的对象

​	a. **Window**：浏览器窗口对象

​	b. **History**：历史记录对象

​	c. **Location**：地址栏对象

​	d. Navigator *：浏览器对象

​	e. Screen *：屏幕对象

### 4.DOM对象 - 文档对象模型

#### 1）作用：将HTML文档的各个部分封装成对象

#### 2）DOM中包含的对象

​	a. **Document**：文档对象

​	b. **Element**：元素对象

​	c. **Attribute**：属性对象

​	d. **Text**：文本对象

#### 3）获取Element对象

​	a. **getElementById()**：根据id属性值获取，返回单个对象

​	b. **getElementByTagName()**：根据标签名获取，返回对象数组

​	c. **getElementByName()**：根据name属性值获取，返回对象数组

​	d. **getElementByClassname()**：根据class属性获取值，返回对象数组

### 5.事件绑定

#### 1）常用事件

​	a. **onblur** - 元素失去焦点，通常用于input标签

​	b. **onfocus** - 元素获取焦点，通常用于input标签

​	c. **onchange** - 内容改变，通常用于select标签

​	d. **onkeydown** - 当用户按下/按住某个键时,通常用于input标签

​	e. **onmouseover**/**onmouseout** - 当鼠标经过一个元素时,用于所有标签

##### 	onclick - 单击按钮时，用于所有标签

##### 	onload - 某个页面或图像被加载完成，通常用于body标签

##### 	onsubmit - 当用户点击提交按钮，用于form标签

#### 2）事件的绑定方式


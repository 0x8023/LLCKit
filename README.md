# LLCKit

### LCDefine

* 你可以这样判断IOS系统 

   ```
   if(IOS7_OR_LATER) {...}
   ``` 
* 你可以这样获取屏幕的尺寸
	
	```	
	NSLog(@"屏幕宽度 ：%f", LC_DEVICE_WIDTH);
    
    NSLog(@"屏幕高度 ：%f", LC_DEVICE_HEIGHT);
	```	
  
* 获取 AppDelegate 单例 ：`LC_APPDELEGATE`

* 获取 keyWindow ：`LC_KEYWINDOW`

* 设置你可以这样创造RGB颜色 `LC_RGB(R,G,B)` ,还不够 `LC_RGBA(R,G,B,A)` 不用除以 255.0 了

* 快速创建弱引用的self 只要写上 `LC_WEAK_SELF;` 你用可以在需要的代码块里使用 `weakSelf` 了

* 判断字符串 非空、非空类型、长度非零，使用它就够了  `LC_NSSTRING_IS_INVALID(s)`

* 字体使用 `DEFAULT_FONT(sizeint)` 和 `DEFAULT_BUTTON_FONT(sizeint)` 这样如果你导入字体包的时候想替换字体就容易多了。

### LCFoundation

* BaseViewController 基类（可不是鸡肋）可以做统一的处理。再看看 `BaseViewController+ImagePicker.h` 你可以直接在子类中

	```	
    [self showImagePickerViewWithTitle:@"选择照片" complateBlock:^(UIImage *image) {
       //直接都到选择的照片了。很快吧，至少不用再用很多的代码写一些代理...
    }];
	```

* 同样的 `UIViewController+NavigationExtension.h`这个扩展就可以让你快捷的添加和删除导航栏上的按钮了。

* 这样说来一些扩展真的很方便：看看 `LCExtension.h`里边的东东，全是一些扩展
	
	1. 快速定义单例: `[[self class] LCInstance];` 的类方法
	
	2. 验证字符串的实例方法 `[self isTelephone]` 
	
	3. 重要的是还有一个常用的计算字符串的宽度或高度的一干方法：`sizeWithFont` 看看里面根据不同的IOS系统版本用不同的方法不会出现烦人的警告哦


* `LCObject.h` 这里边写了一些有用的对象。

	* LCDateFormatter 字符串和时间戳的转化不用写一个实例，规定导出时间戳的格式。不仅减少了内存的占用（因为使用了单例）还很方便
	
	* LCUserDefaults 同样单例的类方法直接 根据key 存取，`STANDAR_USER_DEFAULTS`
	
	* LCFileManager 文件的操作
	
	* LCSanbox 沙河目录的使用更方便，如果你不知道沙盒里目录都存哪些东西，看看就知道了
	
	* LCLog 从写了 `NSLog` 添加了 `INFO` `ERROR` 的打印. 放心使用只要在Release时修改 #define LC_LOG_ENABLE (1) 就不会打印了
	
* `LCView` 这里面只做了扩展
	
	* UIColor+Extension 中可以用Hex值生成color ,你也知道MarkMan等软件标注的色值一般都是十六进制的。
	  
	* UIImage+Extension 里面都是图片的处理 ，注意一下这个,如果一些简单的色值转化成图片很方便，少用，因为它会在绘制的时候占用的你的内存。
	
		```
		 +(UIImage *) imageWithColor:(UIColor *)color size:(CGSize)size;
		  
		```

	* UIView+Extension 这里边你可以用一些x、y、width、height等属性直接取到view的frame的值。`natureForm`让一些控件属性设置不那么啰嗦 
	
	* UIView+LCGesture 让View可以用一个方法就添加手势，注意 UIImageView 的 `userInteractionEnabled`属性添加手势时需要是YES。

	

	
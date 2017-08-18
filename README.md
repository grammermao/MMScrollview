# MMScrollview

> 白天在cocoachina上面看到有人写一个仿滴滴的轮播图，下载到代码，看着很不舒服，各种不理解，索性亲自动手写个简单的轮播图供大家使用，闲话不说直接上效果图，希望你们会喜欢

![2017-08-19 02.33.50](https://ws3.sinaimg.cn/large/006tNc79gy1fiog11l5fmg30fg0tax6r.gif)

**使用详解：**

第一步：使用cocoapods编写podfile文件，`pod 'MMScrollview'`

第二步：在你需要的地方直接导入头文件 `import "MMScrollView.h"`

第三步：调用方法如下

```
    MMScrollView *scroll_v =[[MMScrollView alloc]init];
    [self presentViewController:scroll_v animated:YES completion:nil];
```

ps:如果需要更改数据源，直接在源文件里面修改，代码的话很简单，看看就会明白的



> 如有疑问Email : grammermao@gmail.com
>
> **最后还是欢迎您的star(☆☆☆☆☆)，您的支持是我继续写demo的无限动力**




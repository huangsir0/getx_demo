## GetX 框架学习

GetX 语法相对简洁，它还摆脱了 context 的依赖。

### GetX 入口的简单配置

- GetMaterialApp

```dart

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // 返回所有注册过的别名路由
      getPages: AppPages.pages,
      // 初始路由
      initialRoute: AppPages.INITIAL,
      // 设置应用中未配置的路由
      unknownRoute: AppPages.unknownPage,
      // 路由动画设置
      defaultTransition: Transition.native,

      // 主题
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
```

GetMaterialApp 除了以上配置，还可以配置国际化，主题，应用级悬浮窗等等。

### 路由

- 普通的路由导航

```dart
Get.to(() => const Route1Screen());
```

此种路由导航方式不用申明注册，可以直接跳转。

- 别名路由导航

```dart

abstract class Routes {
  static const Route2 = _Paths.Route2;
}

abstract class _Paths {
  static const Route2 = '/route2';
}

Get.toNamed(Routes.Route2);

```

此种方法需要先在 AppPages.pages 中声明注册，让把 pages 传给 GetMaterialApp，声明方式如下：

```dart

  static final List<GetPage<dynamic>> pages = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.Route2,//路由名
      page: () => const Route2Screen(),// 路由页面
      transition: Transition.fadeIn,//对应路由页面的动画
    ),

  ];

```

#### 其他的路由调用

- Get.offNamed();

```dart
 Get.offNamed(Routes.Route3);
```

导航到下一个页面并删除前一个页面,此种调用适合那种从 dialog 跳转的路由，顺便关闭 Dialog。

- Get.offAllNamed();

```dart
 Get.offAllNamed(Routes.Route3);
```

导航到下一个页面并删除以前所有的页面，适合由导航闪屏页跳转到主界面。

#### 路由的返回

- 不带参数的返回

```dart
Get.back();
```

- 带参数的返回

```dart

Get.back(result: 'success');

```

### GetX 参数的传值与获取

#### 通过 arguments 字段传值

```dart

Get.toNamed(Routes.PassWay1Screen, arguments: {"age": 27, "phone": 1234567897});

```

#### 接收

```dart

Get.arguments["age"];

Get.arguments["phone"];

```

调用 Get.arguments["phone"]，取值后再次调用，取到的值为空。

#### Url 形式传值

```dart
Get.offAllNamed("/NextScreen?device=phone&id=354&name=Enzo");
```

获取

```dart
int id = Get.parameters['id'];
// out: 354
String name=Get.parameters['name'];
```

- 定义路由别名的方式

```dart
   /// Url 形式传值
    GetPage(
      name: Routes.PassWay2Screen + "/:user",
      page: () => const PassWay2Screen(),
      transition: Transition.rightToLeft,
    ),
```

传值：

```dart
 Get.toNamed(Routes.PassWay2Screen + "/hcl?age=27&phone=1234567897");
```

取值：

```dart
Get.parameters["user"];// hcl
Get.parameters["age"];// 27
Get.parameters["phone"];//1234567897

```

### 状态管理

#### GetBuilder

GetBuilder 的简单用法。

- Controller

``` dart
///  控制器
class ManageWay1Controller extends GetxController {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;

    // 调用update 刷新界面
    update();
  }
}

```
- GetBuilder 

``` dart

 GetBuilder<ManageWay1Controller>(
              init: ManageWay1Controller(),
              builder: (controller) {
                return Text(
                  controller.counter.toString(),
                  style: const TextStyle(fontSize: 30),
                );
              })
RaisedButton(
           onPressed: () {
              //controller.increment();
              Get.find<ManageWay1Controller>().increment();
            },
            child: Text("Add"),
        )

```

用GetBuilder这个 Widget 包裹需要更新的控件，在 init初始化ManageWay1Controller,然后每次点击，都会更新builder对应的 Widget ，GetxController通过update()更新GetBuilder。GetBuilder 的包裹应该遵循最小原则，即需要更新哪个控件，就只用包裹那个控件，可以通过 Get.find<ManageWay1Controller>()，找到对应实例。

#### 响应式刷新

简单的响应式使用：

- 变量申明

``` dart
var name = 'hello'.obs;

var user= User().obs;
```

变量名后面直接加.obs,加了.obs后变量不在是int ,User 类型，而是RxInt,Rx<User> 类型。

- 控件刷新

```dart
Obx (() => Text (controller.name));
``` 

- 简单例子

``` dart


class ManageWay2Screen extends StatelessWidget {
  ManageWay2Screen({Key? key}) : super(key: key);

  ManageWay2Controller controller = Get.put(ManageWay2Controller());

  @override
  Widget build(BuildContext context) {
    print("-----ManageWay2Screen   build ");
    return Scaffold(
      appBar: AppBar(
        title: const Text("响应式"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                controller.counter.toString(),
                style: const TextStyle(fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {
                controller.increment();
              },
              child: Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}

///  控制器
class ManageWay2Controller extends GetxController {
  final _counter = 0.obs;

  int get counter => _counter.value;

  void increment() {
    _counter.value++;
  }
}

```
响应式刷新就不用每次需要刷新数据都调用update方法了，依然遵循最小刷新原则。


### 依赖注入

#### 简单的依赖注入

- 注入依赖

``` dart
Get.put<InjectionExController>(InjectionExController());
```

- 获取依赖

``` dart
InjectionExController controller = Get.find<InjectionExController>();
```

实例获取就变得很简单，也方便测试。

#### Get.put()

``` dart
Get.put<S>(
  // 必备：要注入的类。
  // 注：" S "意味着它可以是任何类型的类。
  S dependency

  // 可选：想要注入多个相同类型的类时，可以用这个方法。
  // 比如有两个购物车实例，就需要使用标签区分不同的实例。
  // 必须是唯一的字符串。
  String tag,

  // 可选：默认情况下，get会在实例不再使用后进行销毁
  // （例如：一个已经销毁的视图的Controller)
  // 如果需要这个实例在整个应用生命周期中都存在，就像一个sharedPreferences的实例。
  // 默认值为false
  bool permanent = false,

  // 可选：允许你在测试中使用一个抽象类后，用另一个抽象类代替它，然后再进行测试。
  // 默认为false
  bool overrideAbstract = false,

  // 可选：允许你使用函数而不是依赖（dependency）本身来创建依赖。
  // 这个不常用
  InstanceBuilderCallback<S> builder,
)
```

#### Get.lazyPut()

```dart
Get.lazyPut<InjectionExController>(() => InjectionExController());
```

懒加载一个依赖，只有在使用时才会被实例化。适用于不确定是否会被使用的依赖或者计算高昂的依赖,
lazyPut 不会像put 一样直接返回controller的实例，InjectionExController 懒加载的时候并不会被创建，而是等到你使用的时候才会被 initialized，也就是执行下面这句话的时候才 initialized。

``` dart
Get.find<InjectionExController>();
```

- 参数说明

``` dart
Get.lazyPut<S>(
  // 必须：当你的类第一次被调用时，将被执行的方法。
  InstanceBuilderCallback builder,
  
  // 可选：和Get.put()一样，当你想让同一个类有多个不同的实例时，就会用到它。
  // 必须是唯一的
  String tag,

  // 可选：下次使用时是否重建，
  // 当不使用时，实例会被丢弃，但当再次需要使用时，Get会重新创建实例，
  // 就像 bindings api 中的 "SmartManagement.keepFactory "一样。
  // 默认值为false
  bool fenix = false
  
)

```

#### 其他一些API

- Get.putAsync 注入一个异步创建的实例

```dart
  Get.putAsync<SharedPreferences>(() async {
    final sp = await SharedPreferences.getInstance();
    return sp;
  });
```

- Get.create  类似Get.put

都不是很常用。

### Bindings

Bindings，顾名思义就是绑定，约束View 和 Controller的粘合剂，实现自动注入，获取注入实例的功能，其实现如下:

``` dart
class ExBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    //Get.put(BindingExController());
      Get.lazyPut(() => BindingExController());
  }
}
```
继承Bindings，并实现dependencies()方法。

#### 建立关联，我们要使用该 Binding 来建立路由管理器、依赖关系和状态之间的连接。

- page 依赖

``` dart
    /// Binding
    GetPage(
      name: Routes.BindingExScreen,
      page: () => const BindingExScreen(),
      //绑定
      binding: ExBinding(),
      transition: Transition.rightToLeft,
    ),

```

- 直接跳转

``` dart
Get.to(BindingExScreen(), binding: ExBinding());
```

或者不用定义Binding类,直接用builder.

```dart
  GetPage(
    name: '/BindingExScreen',
    page: () => BindingExScreen(),
    binding: BindingsBuilder(() => {
      Get.lazyPut<BindingExController>(() => BindingExController());
    }),
```



绑定之后，BindingExScreen 我们可以这样写，

``` dart
class BindingExScreen extends GetView<BindingExController> {
  const BindingExScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("==========BindingExScreen=====build");
    //print("${controller.counter.toString()}");
    return Scaffold(
      appBar: AppBar(
        title: const Text("绑定的例子"),
      ),
      body: const AddWidget(),
    );
  }
}

```
 继承GetView<>后，我们就不用调用Get.find 去找controller 了，GetView<>帮我们封装好了。
 
``` dart
abstract class GetView<T> extends StatelessWidget {
  const GetView({Key key}) : super(key: key);

  final String tag = null;

  T get controller => GetInstance().find<T>(tag: tag);

  @override
  Widget build(BuildContext context);
}

```
看AddWidget(),可以看到GetWidget<> 的用法。

``` dart

class AddWidget extends GetWidget<BindingExController> {
  const AddWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => Text(
              controller.counter.toString(),
              style: const TextStyle(fontSize: 30),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          RaisedButton(
            onPressed: () {
              controller.increment();
            },
            child: Text("Add"),
          ),
        ],
      ),
    );
  }
}

```
用法是很简单。


###  Controller 资源的释放


#### Controller 的生命周期

``` dart

I/flutter (28839): ==========InjectionExController=====onInit
[GETX] Instance "InjectionExController" has been initialized
I/flutter (28839): ==========InjectionExScreen=====build
I/flutter (28839): ==========InjectionExController=====onReady
```

顺序依次是 onInit-> 到组件的build -> 到onReady。

一些初始化，可以放到onInit，一些需要组件准备好的操作逻辑可以放到onReady里面。


#### controller 无法释放的场景

GetX 有自带的一套回收机制，释放条件：

- GetPage+Get.toName配套使用，可释放
- 直接使用Get.to，可释放


除此之外，需要我们自己手动清除controller，之前我是在 StatefulWidget 控件销毁时手动调用Get.delete销毁，这样每次都需要手写一次，后来我找到一个封装好了自动销毁类.


#### 封装类

``` dart
class GetBindWidget extends StatefulWidget {
  const GetBindWidget({
    Key? key,
    this.bind,
    this.tag,
    this.binds,
    this.tags,
    required this.child,
  })  : assert(
  binds == null || tags == null || binds.length == tags.length,
  'The binds and tags arrays length should be equal\n'
      'and the elements in the two arrays correspond one-to-one',
  ),
        super(key: key);

  final GetxController? bind;
  final String? tag;

  final List<GetxController>? binds;
  final List<String>? tags;

  final Widget child;

  @override
  _GetBindWidgetState createState() => _GetBindWidgetState();
}

class _GetBindWidgetState extends State<GetBindWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    _closeGetXController();
    _closeGetXControllers();

    super.dispose();
  }

  ///Close GetxController bound to the current page
  void _closeGetXController() {
    if (widget.bind == null) {
      return;
    }

    var key = widget.bind.runtimeType.toString() + (widget.tag ?? '');
    GetInstance().delete(key: key);
  }

  ///Batch close GetxController bound to the current page
  void _closeGetXControllers() {
    if (widget.binds == null) {
      return;
    }

    for (var i = 0; i < widget.binds!.length; i++) {
      var type = widget.binds![i].runtimeType.toString();

      if (widget.tags == null) {
        GetInstance().delete(key: type);
      } else {
        var key = type + (widget.tags?[i] ?? '');
        GetInstance().delete(key: key);
      }
    }
  }
}

```

#### 用法

``` dart
class ExamPage extends StatelessWidget {
   ExamPage({Key? key}) : super(key: key);


  final controller =  Get.put(ExamController(),tag: "ExamController");

  @override
  Widget build(BuildContext context) {
    return GetBindWidget(
        bind: controller,
        tag: "ExamController",
        child: Scaffold(
          appBar: AppBar(
            title: const Text("自动销毁"),
          ),
          body: const Center(
              child: Center(
            child: Text(
              "Test",
              style: TextStyle(fontSize: 26),
            ),
          )),
        ));
  }
}

```

```
I/flutter ( 8754): ==========ExamController=====onInit
[GETX] Instance "ExamController" has been created with tag "ExamController"
[GETX] Instance "ExamController" with tag "ExamController" has been initialized
I/flutter ( 8754): ==========ExamController=====onReady
V/AudioManager( 8754): querySoundEffectsEnabled...
I/flutter ( 8754): ==========ExamController=====onClose
[GETX] "ExamControllerExamController" onDelete() called
[GETX] "ExamControllerExamController" deleted from memory

```

这样就方便很多，还有一种方式，看一下GetX源码可以看看他是怎么自动销毁的，我们也可以照着他的来，这里就不看源码了。

### GetX  提供的一些小组件

- SnackBars

``` dart
 Get.snackbar('Hi', 'Hello', snackPosition: SnackPosition.BOTTOM);
```

- Dialogs

``` dart

  Get.defaultDialog(
                      onConfirm: () {
                        Get.back();
                      },
                      title: "dialog",
                      middleText: "我是默认dialog");

```

- 自定义dialog

```dart

     Get.dialog(
                      AlertDialog(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        content: Container(
                          height: 200,
                          width: 200,
                          color: Colors.white,
                          alignment: Alignment.center,
                          child: Text("Hello 自定义Dialog"),
                        ),
                      ),
                      barrierDismissible: true);
```

- BottomSheets


``` dart
   Get.bottomSheet(
                    Container(
                      color: Colors.white,
                      height: 240,
                      alignment: Alignment.center,
                      child: const Text(
                        'title',
                        style: TextStyle(
                          color: Color(0xff333333),
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );

```


### 其他

- GetService
- GetStore
- GetX 一些工具方法

有的也不常用，就看一眼，了解一下。

``` dart

// 给出当前页面的args。
Get.arguments

//给出以前的路由名称
Get.previousRoute

// 给出要访问的原始路由，例如，rawRoute.isFirst()
Get.rawRoute

// 允许从GetObserver访问Rounting API。
Get.routing

// 检查 snackbar 是否打开
Get.isSnackbarOpen

// 检查 dialog 是否打开
Get.isDialogOpen

// 检查 bottomsheet 是否打开
Get.isBottomSheetOpen

// 删除一个路由。
Get.removeRoute()

//反复返回，直到表达式返回真。
Get.until()

// 转到下一条路由，并删除所有之前的路由，直到表达式返回true。
Get.offUntil()

// 转到下一个命名的路由，并删除所有之前的路由，直到表达式返回true。
Get.offNamedUntil()

//检查应用程序在哪个平台上运行。
GetPlatform.isAndroid
GetPlatform.isIOS
GetPlatform.isMacOS
GetPlatform.isWindows
GetPlatform.isLinux
GetPlatform.isFuchsia

//检查设备类型
GetPlatform.isMobile
GetPlatform.isDesktop
//所有平台都是独立支持web的!
//你可以知道你是否在浏览器内运行。
//在Windows、iOS、OSX、Android等系统上。
GetPlatform.isWeb


// 相当于.MediaQuery.of(context).size.height,
//但不可改变。
Get.height
Get.width

// 提供当前上下文。
Get.context

// 在你的代码中的任何地方，在前台提供 snackbar/dialog/bottomsheet 的上下文。
Get.contextOverlay

// 注意：以下方法是对上下文的扩展。
// 因为在你的UI的任何地方都可以访问上下文，你可以在UI代码的任何地方使用它。

// 如果你需要一个可改变的高度/宽度（如桌面或浏览器窗口可以缩放），你将需要使用上下文。
context.width
context.height

// 让您可以定义一半的页面、三分之一的页面等。
// 对响应式应用很有用。
// 参数： dividedBy (double) 可选 - 默认值：1
// 参数： reducedBy (double) 可选 - 默认值：0。
context.heightTransformer()
context.widthTransformer()

/// 类似于 MediaQuery.of(context).size。
context.mediaQuerySize()

/// 类似于 MediaQuery.of(context).padding。
context.mediaQueryPadding()

/// 类似于 MediaQuery.of(context).viewPadding。
context.mediaQueryViewPadding()

/// 类似于 MediaQuery.of(context).viewInsets。
context.mediaQueryViewInsets()

/// 类似于 MediaQuery.of(context).orientation;
context.orientation()

///检查设备是否处于横向模式
context.isLandscape()

///检查设备是否处于纵向模式。
context.isPortrait()

///类似于MediaQuery.of(context).devicePixelRatio。
context.devicePixelRatio()

///类似于MediaQuery.of(context).textScaleFactor。
context.textScaleFactor()

///查询设备最短边。
context.mediaQueryShortestSide()

///如果宽度大于800，则为真。
context.showNavbar()

///如果最短边小于600p，则为真。
context.isPhone()

///如果最短边大于600p，则为真。
context.isSmallTablet()

///如果最短边大于720p，则为真。
context.isLargeTablet()

///如果当前设备是平板电脑，则为真
context.isTablet()

///根据页面大小返回一个值<T>。
///可以给值为：
///watch：如果最短边小于300
///mobile：如果最短边小于600
///tablet：如果最短边（shortestSide）小于1200
///desktop：如果宽度大于1200
context.responsiveValue<T>()
```

关于应用全级的一些处理，用法大同小异，目前用的少，暂时先不说了。
import 'package:flutter/material.dart';
class AppbarMany extends StatefulWidget {
  @override
  _AppbarManyState createState() => _AppbarManyState();
}

class _AppbarManyState extends State<AppbarMany>  with SingleTickerProviderStateMixin  {
  TabController _controller;

  List<Tab> tabs = [
    Tab(text: 'tab1'),
    Tab(text: 'tab2'),
    Tab(text: 'tab3'),
    Tab(text: 'tab5'),
    Tab(text: 'tab6'),
    Tab(text: 'tab7'),
    Tab(text: 'tab8'),
    Tab(text: 'tab9'),
  ];

  @override
  void initState() {
    super.initState();

    _controller = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

            /// AppBar是否显示在任务栏顶部
            primary: true,

            /// 标题
            title: Text('My appBar'),

            /// 可以用这种方式设置渐变的AppBar
            flexibleSpace: GradualChangeView(
                rotation: Rotation.LR,
                colors: [Colors.cyan, Colors.blue, Colors.blueAccent]),

            /// 应用程序栏的工具栏部分是多么不透明。值1.0是完全不透明的，值0.0是完全透明的。
            toolbarOpacity: 1,

            /// AppBar底部透明度，设置方式同toolbarOpacity
            bottomOpacity: 0.5,

            /// bottom 一般就是TabBar，也可以是别的
            bottom: TabBar(
                tabs: tabs, isScrollable: true, controller: _controller)),
        body: ListView(children: <Widget>[
          /// App bar with background color
          Container(
              child: AppBar(
                title: Text("Title"),

                /// 导航栏的颜色 默认是 ThemeData 的颜色
                backgroundColor: Colors.orange,

                /// Z轴高度，也就是阴影 默认是4.0 默认就是有高度 阴影的
                elevation: 4.0,

                /// 应用栏材质的亮度。
                brightness: Brightness.dark,
              ),
              margin: EdgeInsets.only(top: 16.0, bottom: 16.0)),

          /// App bar with Action items
          Container(
              margin: EdgeInsets.only(bottom: 16.0),
              child: AppBar(title: Text("Appbar actions"),

                  /// 右边的icon， 一般的是icon 或者是文字
                  actions: <Widget>[
                    IconButton(icon: Icon(Icons.search), onPressed: () {}),
                    IconButton(icon: Icon(Icons.settings), onPressed: () {})
                  ])),

          /// Center text
          Container(
              margin: EdgeInsets.only(bottom: 16.0),
              child: AppBar(
                  title: Text("Center"),

                  /// title是否居中
                  centerTitle: true)),

          /// IconTheme for the app bar
          Container(
            margin: EdgeInsets.only(bottom: 16.0),
            child: AppBar(
                title: Text("Appbar Icon and Text Theme"),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.settings, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
                iconTheme: IconThemeData(color: Colors.black),
                textTheme: TextTheme(title: TextStyle(color: Colors.black))),
          ),

          /// App bar with the title and subtitle
          Container(
              margin: EdgeInsets.only(bottom: 16.0),
              child: AppBar(
                title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("Title", style: TextStyle(fontSize: 18.0)),
                      Text("subtitle", style: TextStyle(fontSize: 14.0))
                    ]),
              )),

          /// App bar with the title and and icon/image at start
          Container(
              margin: EdgeInsets.only(bottom: 16.0),
              child: AppBar(
                /// 是否显示返回按钮
                automaticallyImplyLeading: false,
                backgroundColor: Colors.orangeAccent,
                title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      FlutterLogo(),
                      Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text("Title with image")),
                    ]),
              )),

          /// App Bar with transparent background
          Container(
            margin: EdgeInsets.only(bottom: 16.0),
            child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                title: Text("Transparent AppBar"),
                actions: <Widget>[
                  IconButton(icon: Icon(Icons.search), onPressed: () {})
                ],
                iconTheme: IconThemeData(color: Colors.black),
                textTheme: TextTheme(title: TextStyle(color: Colors.black))),
          ),

          Container(
              margin: EdgeInsets.only(bottom: 16.0),
              child: AppBar(
                  title: Text('AppBar leading'),
                  elevation: 0.0,
                  leading: IconButton(
                      icon: Icon(Icons.chevron_left),
                      onPressed: () => Navigator.of(context).pop()))),
        ]));
  }
}


enum Rotation { LR, RL, TB, BT, TL2BR, BL2TR, TR2BL, BR2TL }
////////
class GradualChangeView extends StatelessWidget {
  final List<Color> colors;
  final double width;
  final double height;
  final Rotation rotation;
  final Widget child;
  final EdgeInsetsGeometry padding;
  final AlignmentGeometry alignment;

  // 包括三个状态：clamp 为默认方式，自动延伸；repeated 重复效果;mirror 镜面效果，即对称效果
  final TileMode tileMode;
  final List<double> stops;

  GradualChangeView({
    Key key,
    @required this.colors,
    this.width,
    this.height,
    this.stops,
    this.rotation = Rotation.TB,
    this.tileMode = TileMode.clamp,
    this.child,
    this.padding,
    this.alignment,
  })  : assert(tileMode != null),
        assert(rotation != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    AlignmentGeometry begin;
    AlignmentGeometry end;

    if (rotation == Rotation.TB) {
      begin = Alignment.topCenter;
      end = Alignment.bottomCenter;
    } else if (rotation == Rotation.BT) {
      begin = Alignment.bottomCenter;
      end = Alignment.topCenter;
    } else if (rotation == Rotation.LR) {
      begin = Alignment.centerLeft;
      end = Alignment.centerRight;
    } else if (rotation == Rotation.RL) {
      begin = Alignment.centerRight;
      end = Alignment.centerLeft;
    } else if (rotation == Rotation.TL2BR) {
      begin = Alignment.topLeft;
      end = Alignment.bottomRight;
    } else if (rotation == Rotation.TR2BL) {
      begin = Alignment.topRight;
      end = Alignment.bottomLeft;
    } else if (rotation == Rotation.BL2TR) {
      begin = Alignment.bottomLeft;
      end = Alignment.topRight;
    } else if (rotation == Rotation.BR2TL) {
      begin = Alignment.bottomRight;
      end = Alignment.topLeft;
    } else {
      begin = Alignment.topCenter;
      end = Alignment.bottomCenter;
    }

    return Container(
      width: width == null ? double.infinity : width,
      height: height == null ? double.infinity : height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: colors,
            begin: begin,
            end: end,
            stops: stops,
            tileMode: tileMode),
      ),
      child: child,
      padding: padding ?? EdgeInsets.all(10),
      alignment: alignment,
    );
  }
}

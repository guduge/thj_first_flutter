
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PushAnimateTestPage extends StatefulWidget {
  @override
  _PushAnimateTestPageState createState() => _PushAnimateTestPageState();
}



class _PushAnimateTestPageState extends State<PushAnimateTestPage> {


  static SlideTransition createTransition(
      Animation<double> animation, Widget child) {
    return new SlideTransition(
      position: new Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: const Offset(0.0, 0.0),
      ).animate(animation),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PushAnimateTestPage"),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: (){
//                Navigator.push(context, CustomRouteSlide(PushAnimateSecondPage())).then((res){
//                  print(res);
//                });
                Navigator.push(
                  context,
                  new CupertinoPageRoute(builder: (context) => new PushAnimateSecondPage()),
                ).then((res){

                });
//              Navigator.push<String>(
//                  context,
//                  new PageRouteBuilder(pageBuilder: (BuildContext context,
//                      Animation<double> animation,
//                      Animation<double> secondaryAnimation) {
//                    // 跳转的路由对象
//                    return new PushAnimateSecondPage();
//                  }, transitionsBuilder: (
//                      BuildContext context,
//                      Animation<double> animation,
//                      Animation<double> secondaryAnimation,
//                      Widget child,
//                      ) {
//                    return _PushAnimateTestPageState
//                        .createTransition(animation, child);
//                  }));

              Navigator.push(context, FadeRoute(builder: (context) {
                return PushAnimateSecondPage();
              }));


            },
            child: Container(
              color: Colors.yellow,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(child: Text("toNext")),
              ),
            ),
          )
        ],
      ),
    );
  }
}
class PushAnimateSecondPage extends StatefulWidget {
  @override
  _PushAnimateSecondPageState createState() => _PushAnimateSecondPageState();
}

class _PushAnimateSecondPageState extends State<PushAnimateSecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PushAnimateSecondPage"),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: (){
                Navigator.pop(context,"xxxxxxx");
            },
            child: Container(
              color: Colors.yellow,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(child: Text("toNext")),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class NLMaterialPageRoute<T> extends PageRoute<T> {
  /// Construct a MaterialPageRoute whose contents are defined by [builder].
  ///
  /// The values of [builder], [maintainState], and [fullScreenDialog] must not
  /// be null.
  NLMaterialPageRoute({
    @required this.builder,
    RouteSettings settings,
    this.maintainState = true,
    bool fullscreenDialog = false,
  }) : assert(builder != null),
        assert(maintainState != null),
        assert(fullscreenDialog != null),
        assert(opaque),
        super(settings: settings, fullscreenDialog: fullscreenDialog);

  /// Builds the primary contents of the route.
  final WidgetBuilder builder;

  @override
  final bool maintainState;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  Color get barrierColor => null;

  @override
  String get barrierLabel => null;

  @override
  bool canTransitionFrom(TransitionRoute<dynamic> previousRoute) {
    return previousRoute is MaterialPageRoute || previousRoute is CupertinoPageRoute;
  }

  @override
  bool canTransitionTo(TransitionRoute<dynamic> nextRoute) {
    // Don't perform outgoing animation if the next route is a fullscreen dialog.
    return (nextRoute is MaterialPageRoute && !nextRoute.fullscreenDialog)
        || (nextRoute is CupertinoPageRoute && !nextRoute.fullscreenDialog);
  }

  @override
  Widget buildPage(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      ) {
    final Widget result = builder(context);
    assert(() {
      if (result == null) {
        throw FlutterError(
            'The builder for route "${settings.name}" returned null.\n'
                'Route builders must never return null.'
        );
      }
      return true;
    }());
    return Semantics(
      scopesRoute: true,
      explicitChildNodes: true,
      child: result,
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    final PageTransitionsTheme theme = Theme.of(context).pageTransitionsTheme;
    return theme.buildTransitions<T>(this, context, animation, secondaryAnimation, child);
  }

  @override
  String get debugLabel => '${super.debugLabel}(${settings.name})';
}


class FadeRoute extends PageRoute {
  FadeRoute({
    @required this.builder,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
  });

  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color barrierColor;

  @override
  final String barrierLabel;

  @override
  final bool maintainState;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) => builder(context);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: builder(context),
    );
  }
}




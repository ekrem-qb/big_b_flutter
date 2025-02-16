import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// The curve and initial scale values were mostly eyeballed from iOS, however
// they reuse the same animation curve that was modeled after native page
// transitions.
final Animatable<double> _dialogScaleTween = Tween<double>(
  begin: 1.3,
  end: 1,
).chain(CurveTween(curve: Curves.linearToEaseOut));
const _transitionDuration = Durations.medium1;
const Color kCupertinoModalBarrierColor = CupertinoDynamicColor.withBrightness(
  color: Color(0x33000000),
  darkColor: Color(0x7A000000),
);

Widget _buildCupertinoDialogTransitions(
  final BuildContext context,
  final Animation<double> animation,
  final Animation<double> secondaryAnimation,
  final Widget child,
) {
  final fadeAnimation = CurvedAnimation(
    parent: animation,
    curve: Curves.easeInOut,
  );
  if (animation.status == AnimationStatus.reverse) {
    return FadeTransition(opacity: fadeAnimation, child: child);
  }
  return FadeTransition(
    opacity: fadeAnimation,
    child: ScaleTransition(
      scale: animation.drive(_dialogScaleTween),
      child: child,
    ),
  );
}

class DialogRouter extends StatefulWidget {
  const DialogRouter({super.key});

  @override
  State<DialogRouter> createState() => _DialogRouterState();
}

class _DialogRouterState extends State<DialogRouter> {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: _transitionDuration,
      reverseDuration: _transitionDuration,
      vsync: Navigator.of(context),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return AutoRouter(
      builder: (final context, final child) {
        final isOpen = context.router.hasEntries;

        if (isOpen) {
          _animationController.forward();
        }

        return ListenableProvider.value(
          value: _animationController,
          child: ListenableBuilder(
            listenable: _animationController,
            builder: (final context, final _) {
              return isOpen || _animationController.isAnimating
                  ? _buildCupertinoDialogTransitions(
                    context,
                    _animationController.view,
                    kAlwaysDismissedAnimation,
                    child,
                  )
                  : const SizedBox.shrink();
            },
          ),
        );
      },
    );
  }
}

class DialogRoute<T> extends CustomRoute<T> {
  DialogRoute({
    required super.page,
    super.fullscreenDialog,
    super.maintainState,
    super.fullMatch,
    super.guards,
    super.usesPathAsKey,
    super.children,
    super.meta,
    super.title,
    super.path,
    super.keepHistory,
    super.initial,
    super.allowSnapshotting,
    super.transitionsBuilder,
    super.durationInMilliseconds,
    super.reverseDurationInMilliseconds,
    super.opaque,
    super.barrierDismissible,
    super.barrierLabel,
    super.restorationId,
    super.barrierColor,
  }) : super(
         customRouteBuilder:
             <T>(
               final BuildContext context,
               final Widget child,
               final AutoRoutePage<T> page,
             ) => DialogRouteBuilder<T>(
               page: page,
               routeType: CustomRouteType(
                 barrierDismissible: barrierDismissible,
                 barrierLabel: barrierLabel,
                 barrierColor:
                     barrierColor ??
                     CupertinoDynamicColor.resolve(
                       kCupertinoModalBarrierColor,
                       context,
                     ),
               ),
             ),
       );
}

class DialogRouteBuilder<T> extends PageRoute<T>
    with DialogRouteTransitionMixin<T> {
  DialogRouteBuilder({
    required final AutoRoutePage<T> page,
    required this.routeType,
  }) : super(settings: page);

  @override
  final CustomRouteType routeType;

  @override
  Widget buildContent(final BuildContext context) => _page.buildPage(context);

  @override
  bool get maintainState => _page.maintainState;

  @override
  bool get fullscreenDialog => _page.fullscreenDialog;

  @override
  bool get allowSnapshotting => _page.allowSnapshotting;

  @override
  String get debugLabel => '${super.debugLabel}(${_page.name})';
}

mixin DialogRouteTransitionMixin<T> on PageRoute<T> {
  /// Builds the primary contents of the route.
  AutoRoutePage<T> get _page => settings as AutoRoutePage<T>;

  CustomRouteType get routeType;

  @protected
  Widget buildContent(final BuildContext context);

  @override
  Duration get transitionDuration =>
      Duration(milliseconds: routeType.durationInMilliseconds ?? 300);

  @override
  Duration get reverseTransitionDuration =>
      Duration(milliseconds: routeType.reverseDurationInMilliseconds ?? 300);

  @override
  bool get barrierDismissible => routeType.barrierDismissible;

  @override
  Color? get barrierColor => routeType.barrierColor;

  @override
  String? get barrierLabel => routeType.barrierLabel;

  @override
  bool get opaque => routeType.opaque;

  @override
  Widget buildPage(
    final BuildContext context,
    final Animation<double> animation,
    final Animation<double> secondaryAnimation,
  ) {
    final animationController = context.read<AnimationController?>();

    return PopScope(
      canPop: false,
      onPopInvokedWithResult:
          (final didPop, final result) =>
              animationController?.reverse().then((final _) {
                if (context.mounted) {
                  context.router.removeLast();
                }
              }),
      child: Semantics(
        scopesRoute: true,
        explicitChildNodes: true,
        child: buildContent(context),
      ),
    );
  }
}

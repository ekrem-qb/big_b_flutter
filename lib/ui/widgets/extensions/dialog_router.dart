import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

// The curve and initial scale values were mostly eyeballed from iOS, however
// they reuse the same animation curve that was modeled after native page
// transitions.
final Animatable<double> _dialogScaleTween = Tween<double>(begin: 1.3, end: 1).chain(CurveTween(curve: Curves.linearToEaseOut));
const _transitionDuration = Duration(milliseconds: 250);

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
    return FadeTransition(
      opacity: fadeAnimation,
      child: child,
    );
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
  const DialogRouter({
    super.key,
  });

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
          customRouteBuilder: <T>(
            final BuildContext context,
            final Widget child,
            final AutoRoutePage<T> page,
          ) =>
              dialogRouteBuilder<T>(
            context: context,
            child: child,
            page: page,
            barrierDismissible: barrierDismissible,
            barrierLabel: barrierLabel,
            barrierColor: barrierColor,
          ),
        );

  static Route<T> dialogRouteBuilder<T>({
    required final BuildContext context,
    required final Widget child,
    required final AutoRoutePage<T> page,
    required final bool barrierDismissible,
    final String? barrierLabel,
    final Color? barrierColor,
  }) {
    return CupertinoDialogRoute<T>(
      context: context,
      settings: page,
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel,
      barrierColor: barrierColor,
      builder: (final BuildContext context) {
        final animationController = context.read<AnimationController?>();

        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (final didPop, final result) => animationController?.reverse().then((final _) {
            if (context.mounted) {
              context.router.removeLast();
            }
          }),
          child: child,
        );
      },
    );
  }
}

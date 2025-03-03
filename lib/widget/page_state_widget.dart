import 'package:expiry_mate/gen/l10n.dart';
import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';

class PageStateWidget extends StatelessWidget {
  final Widget? child;
  final PageState? state;
  final Function()? onRetry;
  final Widget Function()? buildChild;

  const PageStateWidget({
    super.key,
    this.child,
    this.buildChild,
    this.state,
    this.onRetry,
  }) : assert(child == null || buildChild == null, "child和buildChild不能同时存在");

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      child: _getView(),
    );
  }

  Widget _getView() {
    return switch (state) {
      null => child ?? buildChild?.call() ?? Container(),
      PageState.loading => _LoadingWidget(),
      PageState.empty => _EmptyWidget(),
      PageState.error => _ErrorWidget(onRetry: onRetry),
    };
  }
}

enum PageState {
  loading,
  empty,
  error,
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget() : super(key: const ValueKey('_LoadingWidget'));

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}

class _EmptyWidget extends StatelessWidget {
  const _EmptyWidget() : super(key: const ValueKey('_EmptyWidget'));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.images.iconEmpty.path,
            height: 100,
            width: 100,
            color: Theme.of(context).iconTheme.color,
          ),
          Text(
            Language.current.statePageEmpty,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  final Function()? onRetry;

  const _ErrorWidget({super.key, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 24,
        children: [
          Icon(
            Icons.error_outline,
            size: 50,
            color: Theme.of(context).colorScheme.error,
          ),
          ElevatedButton(onPressed: onRetry, child: Text(Language.current.statePageRetry)),
        ],
      ),
    );
  }
}

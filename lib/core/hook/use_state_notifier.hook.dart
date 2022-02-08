import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:state_notifier/state_notifier.dart';

/// Subscribes to a [StateNotifier] and mark the widget as needing build
/// whenever the state is changed.
T useStateNotifier<T>(StateNotifier<T> stateNotifier) {
  return use(_StateNotifierHook<T>(stateNotifier));
}

class _StateNotifierHook<T> extends Hook<T> {
  const _StateNotifierHook(this.stateNotifier);

  final StateNotifier<T> stateNotifier;

  @override
  _ListenableStateHook<T> createState() => _ListenableStateHook<T>();
}

class _ListenableStateHook<T> extends HookState<T, _StateNotifierHook<T>> {
  RemoveListener? _removeListenerCallback;
  late T _currentState;

  @override
  void initHook() {
    super.initHook();
    _addListener();
  }

  @override
  void didUpdateHook(_StateNotifierHook<T> oldHook) {
    super.didUpdateHook(oldHook);
    if (hook.stateNotifier != oldHook.stateNotifier) {
      _removeListener();
      _addListener();
    }
  }

  @override
  T build(BuildContext context) => _currentState;

  void _listener(state) {
    setState(() {
      _currentState = state;
    });
  }

  void _addListener() {
    _removeListenerCallback = hook.stateNotifier.addListener(
      _listener,
      fireImmediately: true, // ensures that [_currentState] will be initialized
    );
  }

  void _removeListener() {
    _removeListenerCallback?.call();
  }

  @override
  void dispose() {
    _removeListener();
  }

  @override
  String get debugLabel => 'useStateNotifier<$T>';

  @override
  Object? get debugValue => hook.stateNotifier;
}

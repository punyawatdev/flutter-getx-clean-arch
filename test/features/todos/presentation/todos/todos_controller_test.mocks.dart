// Mocks generated by Mockito 5.4.4 from annotations
// in flutter_getx_clean_arch/test/features/todos/presentation/todos/todos_controller_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes

// Dart imports:
import 'dart:async' as _i7;
import 'dart:ui' as _i13;

// Flutter imports:
import 'package:flutter/foundation.dart' as _i4;
import 'package:flutter/material.dart' as _i3;
import 'package:flutter/scheduler.dart' as _i5;

// Package imports:
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i11;
import 'package:uuid/data.dart' as _i10;
import 'package:uuid/uuid.dart' as _i9;
import 'package:uuid/uuid_value.dart' as _i2;

import 'package:flutter_getx_clean_arch/features/todos/domain/entities/todo.dart'
    as _i8;
import 'package:flutter_getx_clean_arch/features/todos/domain/usecases/todos_usecase.dart'
    as _i6;
import 'package:flutter_getx_clean_arch/features/todos/presentation/todos/utils/snack_bar.dart'
    as _i12;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeUuidValue_0 extends _i1.SmartFake implements _i2.UuidValue {
  _FakeUuidValue_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeScaffoldMessenger_1 extends _i1.SmartFake
    implements _i3.ScaffoldMessenger {
  _FakeScaffoldMessenger_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({_i3.DiagnosticLevel? minLevel = _i3.DiagnosticLevel.info}) =>
      super.toString();
}

class _FakeBuildContext_2 extends _i1.SmartFake implements _i3.BuildContext {
  _FakeBuildContext_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeScaffoldFeatureController_3<T extends _i3.Widget, U>
    extends _i1.SmartFake implements _i3.ScaffoldFeatureController<T, U> {
  _FakeScaffoldFeatureController_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWidget_4 extends _i1.SmartFake implements _i3.Widget {
  _FakeWidget_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({_i3.DiagnosticLevel? minLevel = _i3.DiagnosticLevel.info}) =>
      super.toString();
}

class _FakeDiagnosticsNode_5 extends _i1.SmartFake
    implements _i3.DiagnosticsNode {
  _FakeDiagnosticsNode_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({
    _i4.TextTreeConfiguration? parentConfiguration,
    _i3.DiagnosticLevel? minLevel = _i3.DiagnosticLevel.info,
  }) =>
      super.toString();
}

class _FakeTicker_6 extends _i1.SmartFake implements _i5.Ticker {
  _FakeTicker_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({bool? debugIncludeStack = false}) => super.toString();
}

/// A class which mocks [TodosUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodosUseCase extends _i1.Mock implements _i6.TodosUseCase {
  MockTodosUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<List<_i8.Todo>> getTodos() => (super.noSuchMethod(
        Invocation.method(
          #getTodos,
          [],
        ),
        returnValue: _i7.Future<List<_i8.Todo>>.value(<_i8.Todo>[]),
      ) as _i7.Future<List<_i8.Todo>>);

  @override
  _i7.Future<void> addTodo(_i8.Todo? todo) => (super.noSuchMethod(
        Invocation.method(
          #addTodo,
          [todo],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> updateTodo(_i8.Todo? todo) => (super.noSuchMethod(
        Invocation.method(
          #updateTodo,
          [todo],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> updateTodoStatus(
    String? todoId,
    bool? isCompleted,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateTodoStatus,
          [
            todoId,
            isCompleted,
          ],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> deleteTodo(String? todoId) => (super.noSuchMethod(
        Invocation.method(
          #deleteTodo,
          [todoId],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<int> toggleCompletedAll() => (super.noSuchMethod(
        Invocation.method(
          #toggleCompletedAll,
          [],
        ),
        returnValue: _i7.Future<int>.value(0),
      ) as _i7.Future<int>);

  @override
  _i7.Future<int> clearCompleted() => (super.noSuchMethod(
        Invocation.method(
          #clearCompleted,
          [],
        ),
        returnValue: _i7.Future<int>.value(0),
      ) as _i7.Future<int>);
}

/// A class which mocks [Uuid].
///
/// See the documentation for Mockito's code generation for more information.
class MockUuid extends _i1.Mock implements _i9.Uuid {
  MockUuid() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String v1({
    Map<String, dynamic>? options,
    _i10.V1Options? config,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #v1,
          [],
          {
            #options: options,
            #config: config,
          },
        ),
        returnValue: _i11.dummyValue<String>(
          this,
          Invocation.method(
            #v1,
            [],
            {
              #options: options,
              #config: config,
            },
          ),
        ),
      ) as String);

  @override
  List<int> v1buffer(
    List<int>? buffer, {
    Map<String, dynamic>? options,
    _i10.V1Options? config,
    int? offset = 0,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #v1buffer,
          [buffer],
          {
            #options: options,
            #config: config,
            #offset: offset,
          },
        ),
        returnValue: <int>[],
      ) as List<int>);

  @override
  _i2.UuidValue v1obj({
    Map<String, dynamic>? options,
    _i10.V1Options? config,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #v1obj,
          [],
          {
            #options: options,
            #config: config,
          },
        ),
        returnValue: _FakeUuidValue_0(
          this,
          Invocation.method(
            #v1obj,
            [],
            {
              #options: options,
              #config: config,
            },
          ),
        ),
      ) as _i2.UuidValue);

  @override
  String v4({
    Map<String, dynamic>? options,
    _i10.V4Options? config,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #v4,
          [],
          {
            #options: options,
            #config: config,
          },
        ),
        returnValue: _i11.dummyValue<String>(
          this,
          Invocation.method(
            #v4,
            [],
            {
              #options: options,
              #config: config,
            },
          ),
        ),
      ) as String);

  @override
  List<int> v4buffer(
    List<int>? buffer, {
    Map<String, dynamic>? options,
    _i10.V4Options? config,
    int? offset = 0,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #v4buffer,
          [buffer],
          {
            #options: options,
            #config: config,
            #offset: offset,
          },
        ),
        returnValue: <int>[],
      ) as List<int>);

  @override
  _i2.UuidValue v4obj({
    Map<String, dynamic>? options,
    _i10.V4Options? config,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #v4obj,
          [],
          {
            #options: options,
            #config: config,
          },
        ),
        returnValue: _FakeUuidValue_0(
          this,
          Invocation.method(
            #v4obj,
            [],
            {
              #options: options,
              #config: config,
            },
          ),
        ),
      ) as _i2.UuidValue);

  @override
  String v5(
    String? namespace,
    String? name, {
    Map<String, dynamic>? options,
    _i10.V5Options? config,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #v5,
          [
            namespace,
            name,
          ],
          {
            #options: options,
            #config: config,
          },
        ),
        returnValue: _i11.dummyValue<String>(
          this,
          Invocation.method(
            #v5,
            [
              namespace,
              name,
            ],
            {
              #options: options,
              #config: config,
            },
          ),
        ),
      ) as String);

  @override
  List<int> v5buffer(
    String? namespace,
    String? name,
    List<int>? buffer, {
    Map<String, dynamic>? options,
    _i10.V5Options? config,
    int? offset = 0,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #v5buffer,
          [
            namespace,
            name,
            buffer,
          ],
          {
            #options: options,
            #config: config,
            #offset: offset,
          },
        ),
        returnValue: <int>[],
      ) as List<int>);

  @override
  _i2.UuidValue v5obj(
    String? namespace,
    String? name, {
    Map<String, dynamic>? options,
    _i10.V5Options? config,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #v5obj,
          [
            namespace,
            name,
          ],
          {
            #options: options,
            #config: config,
          },
        ),
        returnValue: _FakeUuidValue_0(
          this,
          Invocation.method(
            #v5obj,
            [
              namespace,
              name,
            ],
            {
              #options: options,
              #config: config,
            },
          ),
        ),
      ) as _i2.UuidValue);

  @override
  String v6({_i10.V6Options? config}) => (super.noSuchMethod(
        Invocation.method(
          #v6,
          [],
          {#config: config},
        ),
        returnValue: _i11.dummyValue<String>(
          this,
          Invocation.method(
            #v6,
            [],
            {#config: config},
          ),
        ),
      ) as String);

  @override
  List<int> v6buffer(
    List<int>? buffer, {
    _i10.V6Options? config,
    int? offset = 0,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #v6buffer,
          [buffer],
          {
            #config: config,
            #offset: offset,
          },
        ),
        returnValue: <int>[],
      ) as List<int>);

  @override
  _i2.UuidValue v6obj({_i10.V6Options? config}) => (super.noSuchMethod(
        Invocation.method(
          #v6obj,
          [],
          {#config: config},
        ),
        returnValue: _FakeUuidValue_0(
          this,
          Invocation.method(
            #v6obj,
            [],
            {#config: config},
          ),
        ),
      ) as _i2.UuidValue);

  @override
  String v7({_i10.V7Options? config}) => (super.noSuchMethod(
        Invocation.method(
          #v7,
          [],
          {#config: config},
        ),
        returnValue: _i11.dummyValue<String>(
          this,
          Invocation.method(
            #v7,
            [],
            {#config: config},
          ),
        ),
      ) as String);

  @override
  List<int> v7buffer(
    List<int>? buffer, {
    _i10.V7Options? config,
    int? offset = 0,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #v7buffer,
          [buffer],
          {
            #config: config,
            #offset: offset,
          },
        ),
        returnValue: <int>[],
      ) as List<int>);

  @override
  _i2.UuidValue v7obj({_i10.V7Options? config}) => (super.noSuchMethod(
        Invocation.method(
          #v7obj,
          [],
          {#config: config},
        ),
        returnValue: _FakeUuidValue_0(
          this,
          Invocation.method(
            #v7obj,
            [],
            {#config: config},
          ),
        ),
      ) as _i2.UuidValue);

  @override
  String v8({_i10.V8Options? config}) => (super.noSuchMethod(
        Invocation.method(
          #v8,
          [],
          {#config: config},
        ),
        returnValue: _i11.dummyValue<String>(
          this,
          Invocation.method(
            #v8,
            [],
            {#config: config},
          ),
        ),
      ) as String);

  @override
  List<int> v8buffer(
    List<int>? buffer, {
    _i10.V8Options? config,
    int? offset = 0,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #v8buffer,
          [buffer],
          {
            #config: config,
            #offset: offset,
          },
        ),
        returnValue: <int>[],
      ) as List<int>);

  @override
  _i2.UuidValue v8obj({_i10.V8Options? config}) => (super.noSuchMethod(
        Invocation.method(
          #v8obj,
          [],
          {#config: config},
        ),
        returnValue: _FakeUuidValue_0(
          this,
          Invocation.method(
            #v8obj,
            [],
            {#config: config},
          ),
        ),
      ) as _i2.UuidValue);

  @override
  String v8g({_i10.V8GenericOptions? config}) => (super.noSuchMethod(
        Invocation.method(
          #v8g,
          [],
          {#config: config},
        ),
        returnValue: _i11.dummyValue<String>(
          this,
          Invocation.method(
            #v8g,
            [],
            {#config: config},
          ),
        ),
      ) as String);

  @override
  List<int> v8gbuffer(
    List<int>? buffer, {
    _i10.V8GenericOptions? config,
    int? offset = 0,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #v8gbuffer,
          [buffer],
          {
            #config: config,
            #offset: offset,
          },
        ),
        returnValue: <int>[],
      ) as List<int>);

  @override
  _i2.UuidValue v8gobj({_i10.V8GenericOptions? config}) => (super.noSuchMethod(
        Invocation.method(
          #v8gobj,
          [],
          {#config: config},
        ),
        returnValue: _FakeUuidValue_0(
          this,
          Invocation.method(
            #v8gobj,
            [],
            {#config: config},
          ),
        ),
      ) as _i2.UuidValue);
}

/// A class which mocks [SnackBarMessenger].
///
/// See the documentation for Mockito's code generation for more information.
class MockSnackBarMessenger extends _i1.Mock implements _i12.SnackBarMessenger {
  MockSnackBarMessenger() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.ScaffoldMessenger get widget => (super.noSuchMethod(
        Invocation.getter(#widget),
        returnValue: _FakeScaffoldMessenger_1(
          this,
          Invocation.getter(#widget),
        ),
      ) as _i3.ScaffoldMessenger);

  @override
  _i3.BuildContext get context => (super.noSuchMethod(
        Invocation.getter(#context),
        returnValue: _FakeBuildContext_2(
          this,
          Invocation.getter(#context),
        ),
      ) as _i3.BuildContext);

  @override
  bool get mounted => (super.noSuchMethod(
        Invocation.getter(#mounted),
        returnValue: false,
      ) as bool);

  @override
  void showDeletedMessage({
    required String? message,
    _i13.VoidCallback? undo,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #showDeletedMessage,
          [],
          {
            #message: message,
            #undo: undo,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  void didChangeDependencies() => super.noSuchMethod(
        Invocation.method(
          #didChangeDependencies,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i3.ScaffoldFeatureController<_i3.SnackBar, _i3.SnackBarClosedReason>
      showSnackBar(
    _i3.SnackBar? snackBar, {
    _i3.AnimationStyle? snackBarAnimationStyle,
  }) =>
          (super.noSuchMethod(
            Invocation.method(
              #showSnackBar,
              [snackBar],
              {#snackBarAnimationStyle: snackBarAnimationStyle},
            ),
            returnValue: _FakeScaffoldFeatureController_3<_i3.SnackBar,
                _i3.SnackBarClosedReason>(
              this,
              Invocation.method(
                #showSnackBar,
                [snackBar],
                {#snackBarAnimationStyle: snackBarAnimationStyle},
              ),
            ),
          ) as _i3.ScaffoldFeatureController<_i3.SnackBar,
              _i3.SnackBarClosedReason>);

  @override
  void removeCurrentSnackBar(
          {_i3.SnackBarClosedReason? reason =
              _i3.SnackBarClosedReason.remove}) =>
      super.noSuchMethod(
        Invocation.method(
          #removeCurrentSnackBar,
          [],
          {#reason: reason},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void hideCurrentSnackBar(
          {_i3.SnackBarClosedReason? reason = _i3.SnackBarClosedReason.hide}) =>
      super.noSuchMethod(
        Invocation.method(
          #hideCurrentSnackBar,
          [],
          {#reason: reason},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void clearSnackBars() => super.noSuchMethod(
        Invocation.method(
          #clearSnackBars,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i3.ScaffoldFeatureController<_i3.MaterialBanner,
      _i3.MaterialBannerClosedReason> showMaterialBanner(
          _i3.MaterialBanner? materialBanner) =>
      (super.noSuchMethod(
        Invocation.method(
          #showMaterialBanner,
          [materialBanner],
        ),
        returnValue: _FakeScaffoldFeatureController_3<_i3.MaterialBanner,
            _i3.MaterialBannerClosedReason>(
          this,
          Invocation.method(
            #showMaterialBanner,
            [materialBanner],
          ),
        ),
      ) as _i3.ScaffoldFeatureController<_i3.MaterialBanner,
          _i3.MaterialBannerClosedReason>);

  @override
  void removeCurrentMaterialBanner(
          {_i3.MaterialBannerClosedReason? reason =
              _i3.MaterialBannerClosedReason.remove}) =>
      super.noSuchMethod(
        Invocation.method(
          #removeCurrentMaterialBanner,
          [],
          {#reason: reason},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void hideCurrentMaterialBanner(
          {_i3.MaterialBannerClosedReason? reason =
              _i3.MaterialBannerClosedReason.hide}) =>
      super.noSuchMethod(
        Invocation.method(
          #hideCurrentMaterialBanner,
          [],
          {#reason: reason},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void clearMaterialBanners() => super.noSuchMethod(
        Invocation.method(
          #clearMaterialBanners,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i3.Widget build(_i3.BuildContext? context) => (super.noSuchMethod(
        Invocation.method(
          #build,
          [context],
        ),
        returnValue: _FakeWidget_4(
          this,
          Invocation.method(
            #build,
            [context],
          ),
        ),
      ) as _i3.Widget);

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void initState() => super.noSuchMethod(
        Invocation.method(
          #initState,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void didUpdateWidget(_i3.ScaffoldMessenger? oldWidget) => super.noSuchMethod(
        Invocation.method(
          #didUpdateWidget,
          [oldWidget],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void reassemble() => super.noSuchMethod(
        Invocation.method(
          #reassemble,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setState(_i13.VoidCallback? fn) => super.noSuchMethod(
        Invocation.method(
          #setState,
          [fn],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void deactivate() => super.noSuchMethod(
        Invocation.method(
          #deactivate,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void activate() => super.noSuchMethod(
        Invocation.method(
          #activate,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void debugFillProperties(_i4.DiagnosticPropertiesBuilder? properties) =>
      super.noSuchMethod(
        Invocation.method(
          #debugFillProperties,
          [properties],
        ),
        returnValueForMissingStub: null,
      );

  @override
  String toString({_i3.DiagnosticLevel? minLevel = _i3.DiagnosticLevel.info}) =>
      super.toString();

  @override
  String toStringShort() => (super.noSuchMethod(
        Invocation.method(
          #toStringShort,
          [],
        ),
        returnValue: _i11.dummyValue<String>(
          this,
          Invocation.method(
            #toStringShort,
            [],
          ),
        ),
      ) as String);

  @override
  _i3.DiagnosticsNode toDiagnosticsNode({
    String? name,
    _i4.DiagnosticsTreeStyle? style,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #toDiagnosticsNode,
          [],
          {
            #name: name,
            #style: style,
          },
        ),
        returnValue: _FakeDiagnosticsNode_5(
          this,
          Invocation.method(
            #toDiagnosticsNode,
            [],
            {
              #name: name,
              #style: style,
            },
          ),
        ),
      ) as _i3.DiagnosticsNode);

  @override
  _i5.Ticker createTicker(_i5.TickerCallback? onTick) => (super.noSuchMethod(
        Invocation.method(
          #createTicker,
          [onTick],
        ),
        returnValue: _FakeTicker_6(
          this,
          Invocation.method(
            #createTicker,
            [onTick],
          ),
        ),
      ) as _i5.Ticker);
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BoardState {
  IratusGame get game => throw _privateConstructorUsedError;
  Side get orientation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BoardStateCopyWith<BoardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardStateCopyWith<$Res> {
  factory $BoardStateCopyWith(
          BoardState value, $Res Function(BoardState) then) =
      _$BoardStateCopyWithImpl<$Res, BoardState>;
  @useResult
  $Res call({IratusGame game, Side orientation});
}

/// @nodoc
class _$BoardStateCopyWithImpl<$Res, $Val extends BoardState>
    implements $BoardStateCopyWith<$Res> {
  _$BoardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? game = null,
    Object? orientation = null,
  }) {
    return _then(_value.copyWith(
      game: null == game
          ? _value.game
          : game // ignore: cast_nullable_to_non_nullable
              as IratusGame,
      orientation: null == orientation
          ? _value.orientation
          : orientation // ignore: cast_nullable_to_non_nullable
              as Side,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BoardStateImplCopyWith<$Res>
    implements $BoardStateCopyWith<$Res> {
  factory _$$BoardStateImplCopyWith(
          _$BoardStateImpl value, $Res Function(_$BoardStateImpl) then) =
      __$$BoardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({IratusGame game, Side orientation});
}

/// @nodoc
class __$$BoardStateImplCopyWithImpl<$Res>
    extends _$BoardStateCopyWithImpl<$Res, _$BoardStateImpl>
    implements _$$BoardStateImplCopyWith<$Res> {
  __$$BoardStateImplCopyWithImpl(
      _$BoardStateImpl _value, $Res Function(_$BoardStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? game = null,
    Object? orientation = null,
  }) {
    return _then(_$BoardStateImpl(
      game: null == game
          ? _value.game
          : game // ignore: cast_nullable_to_non_nullable
              as IratusGame,
      orientation: null == orientation
          ? _value.orientation
          : orientation // ignore: cast_nullable_to_non_nullable
              as Side,
    ));
  }
}

/// @nodoc

class _$BoardStateImpl implements _BoardState {
  _$BoardStateImpl({required this.game, required this.orientation});

  @override
  final IratusGame game;
  @override
  final Side orientation;

  @override
  String toString() {
    return 'BoardState(game: $game, orientation: $orientation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoardStateImpl &&
            (identical(other.game, game) || other.game == game) &&
            (identical(other.orientation, orientation) ||
                other.orientation == orientation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, game, orientation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BoardStateImplCopyWith<_$BoardStateImpl> get copyWith =>
      __$$BoardStateImplCopyWithImpl<_$BoardStateImpl>(this, _$identity);
}

abstract class _BoardState implements BoardState {
  factory _BoardState(
      {required final IratusGame game,
      required final Side orientation}) = _$BoardStateImpl;

  @override
  IratusGame get game;
  @override
  Side get orientation;
  @override
  @JsonKey(ignore: true)
  _$$BoardStateImplCopyWith<_$BoardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

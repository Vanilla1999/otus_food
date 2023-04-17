// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_description_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecipeDescriptionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Recipe recipe, List<Ingredient> ingredients,
            List<CookingStep> cookingSteps)
        success,
    required TResult Function(Object? error) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Recipe recipe, List<Ingredient> ingredients,
            List<CookingStep> cookingSteps)?
        success,
    TResult? Function(Object? error)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Recipe recipe, List<Ingredient> ingredients,
            List<CookingStep> cookingSteps)?
        success,
    TResult Function(Object? error)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Succsess value) success,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Succsess value)? success,
    TResult? Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Succsess value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeDescriptionStateCopyWith<$Res> {
  factory $RecipeDescriptionStateCopyWith(RecipeDescriptionState value,
          $Res Function(RecipeDescriptionState) then) =
      _$RecipeDescriptionStateCopyWithImpl<$Res, RecipeDescriptionState>;
}

/// @nodoc
class _$RecipeDescriptionStateCopyWithImpl<$Res,
        $Val extends RecipeDescriptionState>
    implements $RecipeDescriptionStateCopyWith<$Res> {
  _$RecipeDescriptionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$RecipeDescriptionStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'RecipeDescriptionState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Recipe recipe, List<Ingredient> ingredients,
            List<CookingStep> cookingSteps)
        success,
    required TResult Function(Object? error) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Recipe recipe, List<Ingredient> ingredients,
            List<CookingStep> cookingSteps)?
        success,
    TResult? Function(Object? error)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Recipe recipe, List<Ingredient> ingredients,
            List<CookingStep> cookingSteps)?
        success,
    TResult Function(Object? error)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Succsess value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Succsess value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Succsess value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements RecipeDescriptionState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_SuccsessCopyWith<$Res> {
  factory _$$_SuccsessCopyWith(
          _$_Succsess value, $Res Function(_$_Succsess) then) =
      __$$_SuccsessCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Recipe recipe,
      List<Ingredient> ingredients,
      List<CookingStep> cookingSteps});

  $RecipeCopyWith<$Res> get recipe;
}

/// @nodoc
class __$$_SuccsessCopyWithImpl<$Res>
    extends _$RecipeDescriptionStateCopyWithImpl<$Res, _$_Succsess>
    implements _$$_SuccsessCopyWith<$Res> {
  __$$_SuccsessCopyWithImpl(
      _$_Succsess _value, $Res Function(_$_Succsess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipe = null,
    Object? ingredients = null,
    Object? cookingSteps = null,
  }) {
    return _then(_$_Succsess(
      recipe: null == recipe
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as Recipe,
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      cookingSteps: null == cookingSteps
          ? _value._cookingSteps
          : cookingSteps // ignore: cast_nullable_to_non_nullable
              as List<CookingStep>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $RecipeCopyWith<$Res> get recipe {
    return $RecipeCopyWith<$Res>(_value.recipe, (value) {
      return _then(_value.copyWith(recipe: value));
    });
  }
}

/// @nodoc

class _$_Succsess implements _Succsess {
  const _$_Succsess(
      {required this.recipe,
      required final List<Ingredient> ingredients,
      required final List<CookingStep> cookingSteps})
      : _ingredients = ingredients,
        _cookingSteps = cookingSteps;

  @override
  final Recipe recipe;
  final List<Ingredient> _ingredients;
  @override
  List<Ingredient> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  final List<CookingStep> _cookingSteps;
  @override
  List<CookingStep> get cookingSteps {
    if (_cookingSteps is EqualUnmodifiableListView) return _cookingSteps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cookingSteps);
  }

  @override
  String toString() {
    return 'RecipeDescriptionState.success(recipe: $recipe, ingredients: $ingredients, cookingSteps: $cookingSteps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Succsess &&
            (identical(other.recipe, recipe) || other.recipe == recipe) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients) &&
            const DeepCollectionEquality()
                .equals(other._cookingSteps, _cookingSteps));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      recipe,
      const DeepCollectionEquality().hash(_ingredients),
      const DeepCollectionEquality().hash(_cookingSteps));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuccsessCopyWith<_$_Succsess> get copyWith =>
      __$$_SuccsessCopyWithImpl<_$_Succsess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Recipe recipe, List<Ingredient> ingredients,
            List<CookingStep> cookingSteps)
        success,
    required TResult Function(Object? error) failure,
  }) {
    return success(recipe, ingredients, cookingSteps);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Recipe recipe, List<Ingredient> ingredients,
            List<CookingStep> cookingSteps)?
        success,
    TResult? Function(Object? error)? failure,
  }) {
    return success?.call(recipe, ingredients, cookingSteps);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Recipe recipe, List<Ingredient> ingredients,
            List<CookingStep> cookingSteps)?
        success,
    TResult Function(Object? error)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(recipe, ingredients, cookingSteps);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Succsess value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Succsess value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Succsess value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Succsess implements RecipeDescriptionState {
  const factory _Succsess(
      {required final Recipe recipe,
      required final List<Ingredient> ingredients,
      required final List<CookingStep> cookingSteps}) = _$_Succsess;

  Recipe get recipe;
  List<Ingredient> get ingredients;
  List<CookingStep> get cookingSteps;
  @JsonKey(ignore: true)
  _$$_SuccsessCopyWith<_$_Succsess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FailureCopyWith<$Res> {
  factory _$$_FailureCopyWith(
          _$_Failure value, $Res Function(_$_Failure) then) =
      __$$_FailureCopyWithImpl<$Res>;
  @useResult
  $Res call({Object? error});
}

/// @nodoc
class __$$_FailureCopyWithImpl<$Res>
    extends _$RecipeDescriptionStateCopyWithImpl<$Res, _$_Failure>
    implements _$$_FailureCopyWith<$Res> {
  __$$_FailureCopyWithImpl(_$_Failure _value, $Res Function(_$_Failure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$_Failure(
      error: freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$_Failure implements _Failure {
  const _$_Failure({this.error});

  @override
  final Object? error;

  @override
  String toString() {
    return 'RecipeDescriptionState.failure(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Failure &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FailureCopyWith<_$_Failure> get copyWith =>
      __$$_FailureCopyWithImpl<_$_Failure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Recipe recipe, List<Ingredient> ingredients,
            List<CookingStep> cookingSteps)
        success,
    required TResult Function(Object? error) failure,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Recipe recipe, List<Ingredient> ingredients,
            List<CookingStep> cookingSteps)?
        success,
    TResult? Function(Object? error)? failure,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Recipe recipe, List<Ingredient> ingredients,
            List<CookingStep> cookingSteps)?
        success,
    TResult Function(Object? error)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Succsess value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Succsess value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Succsess value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements RecipeDescriptionState {
  const factory _Failure({final Object? error}) = _$_Failure;

  Object? get error;
  @JsonKey(ignore: true)
  _$$_FailureCopyWith<_$_Failure> get copyWith =>
      throw _privateConstructorUsedError;
}

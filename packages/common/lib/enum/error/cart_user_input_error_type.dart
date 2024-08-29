part of common;

enum CartUserInputErrorType {
  @JsonValue('CART_ID_INVALID')
  cartIdInvalid,
  @JsonValue('PRODUCT_NOT_FOUND')
  productNotFound,
  @JsonValue('NOT_SALABLE')
  notSalable,
  @JsonValue('INSUFFICIENT_STOCK')
  insufficientStock,
  @JsonValue('UNDEFINED')
  undefined;

  // TODO(oat): Need to clarify error message later
  String errorMsg(BuildContext context) => switch (this) {
        CartUserInputErrorType.cartIdInvalid =>
          context.localizations('cart.errorCartIdInvalid'),
        CartUserInputErrorType.productNotFound =>
          context.localizations('cart.errorProductNotFound'),
        CartUserInputErrorType.notSalable =>
          context.localizations('cart.errorNotSalable'),
        CartUserInputErrorType.insufficientStock =>
          context.localizations('cart.errorInsufficientStock'),
        CartUserInputErrorType.undefined =>
          context.localizations('cart.errorUndefined'),
      };

  String get errorCode => switch (this) {
        CartUserInputErrorType.cartIdInvalid => 'CART_ID_INVALID',
        CartUserInputErrorType.productNotFound => 'PRODUCT_NOT_FOUND',
        CartUserInputErrorType.notSalable => 'NOT_SALABLE',
        CartUserInputErrorType.insufficientStock => 'INSUFFICIENT_STOCK',
        CartUserInputErrorType.undefined => 'UNDEFINED',
      };
}

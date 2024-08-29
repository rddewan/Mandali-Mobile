part of common;

enum StockStatus {
  @JsonValue('IN_STOCK')
  inStock,
  @JsonValue('OUT_OF_STOCK')
  outOfStock,
}

part of common;

enum ProductType {
  @JsonValue('simple')
  simpleProduct,
  @JsonValue('configurable')
  configurableProduct,
  @JsonValue('virtual')
  virtualProduct,
  @JsonValue('downloadable')
  downloadableProduct,
  @JsonValue('bundle')
  bundleProduct,
  @JsonValue('grouped')
  groupedProduct,
}

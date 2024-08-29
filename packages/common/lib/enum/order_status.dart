part of common;

enum OrderStatus {
  @JsonValue('Pending')
  pending,
  @JsonValue('Pending Invoice')
  pendingInvoice,
  @JsonValue('Pending Pay')
  pendingPay,
  @JsonValue('Invoiced')
  invoiced,
  @JsonValue('Paid')
  paid,
  @JsonValue('Processing')
  processing,
  @JsonValue('Ready to Ship')
  readyToShip,
  @JsonValue('Shipped')
  shipped,
  @JsonValue('Fail to Delivery')
  failToDelivery,
  @JsonValue('Delivered')
  delivered,
  @JsonValue('Canceled')
  canceled,
  @JsonValue('Complete')
  complete;

  Widget get statusWidget => switch (this) {
        OrderStatus.pending => const OrderStatusWidget(
            backgroundColor: Color(0xFFFDF5E8),
            statusText: 'Pending',
            textColor: Color(0xFFE8AF01),
          ),
        OrderStatus.pendingInvoice => const OrderStatusWidget(
            backgroundColor: Color(0xFFFDF5E8),
            statusText: 'Pending Invoice',
            textColor: Color(0xFFE8AF01),
          ),
        OrderStatus.pendingPay => const OrderStatusWidget(
            backgroundColor: Color(0xFFFDF5E8),
            statusText: 'Pending Pay',
            textColor: Color(0xFFE8AF01),
          ),
        OrderStatus.invoiced => const OrderStatusWidget(
            backgroundColor: Color(0xFFD6ECFF),
            statusText: 'Invoiced',
            textColor: Color(0xFF00467F),
          ),
        OrderStatus.paid => const OrderStatusWidget(
            backgroundColor: Color(0xFFD6ECFF),
            statusText: 'Paid',
            textColor: Color(0xFF00467F),
          ),
        OrderStatus.processing => const OrderStatusWidget(
            backgroundColor: Color(0xFFD6ECFF),
            statusText: 'Processing',
            textColor: Color(0xFF00467F),
          ),
        OrderStatus.readyToShip => const OrderStatusWidget(
            backgroundColor: Color(0xFFE5BEEC),
            statusText: 'Ready to Ship',
            textColor: Color(0xFF2A2F4F),
          ),
        OrderStatus.shipped => const OrderStatusWidget(
            backgroundColor: Color(0xFFE5BEEC),
            statusText: 'Shipped',
            textColor: Color(0xFF2A2F4F),
          ),
        OrderStatus.delivered => const OrderStatusWidget(
            backgroundColor: Color(0xFFEBFDF8),
            statusText: 'Delivered',
            textColor: Color(0xFF008055),
          ),
        OrderStatus.complete => const OrderStatusWidget(
            backgroundColor: Color(0xFFEBFDF8),
            statusText: 'Complete',
            textColor: Color(0xFF008055),
          ),
        OrderStatus.failToDelivery => const OrderStatusWidget(
            backgroundColor: Color(0xFFFCE8EB),
            statusText: 'Delivery Failed',
            textColor: Color(0xFF9F1329),
          ),
        OrderStatus.canceled => const OrderStatusWidget(
            backgroundColor: Color(0xFFFCE8EB),
            statusText: 'Canceled',
            textColor: Color(0xFF9F1329),
          ), //Default value
      };
}

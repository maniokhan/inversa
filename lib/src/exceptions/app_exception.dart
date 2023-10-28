//sealed
class AppException implements Exception {
  AppException(this.code, this.message);
  final String code;
  final String message;

  @override
  String toString() => message;
}

class EmailAlreadyInUseException extends AppException {
  EmailAlreadyInUseException()
      : super('email-already-in-use', 'Email already in use');
}

class WeakPasswordException extends AppException {
  WeakPasswordException() : super('weak-password', 'Password is too weak');
}

class WrongPasswordException extends AppException {
  WrongPasswordException() : super('wrong-password', 'Wrong password');
}

class UserNotFoundException extends AppException {
  UserNotFoundException() : super('user-not-found', 'User not found');
}

class CartSyncFailedException extends AppException {
  CartSyncFailedException()
      : super('cart-sync-failed',
            'An error has occurred while updating the shopping cart');
}

class PaymentFailureEmptyCartException extends AppException {
  PaymentFailureEmptyCartException()
      : super('payment-failure-empty-cart',
            'Can\'t place an order if the cart is empty');
}

class ParseOrderFailureException extends AppException {
  ParseOrderFailureException(this.status)
      : super('parse-order-failure', 'Could not parse order status: $status');
  final String status;
}

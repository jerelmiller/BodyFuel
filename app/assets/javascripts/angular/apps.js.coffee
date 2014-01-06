# Carts app
angular.module('cartsApp', ['carts_controller', 'carts_service', 'cart_shirts_service', 'application_services', 'alert_directives', 'application_directives', 'application_filters', 'shirts_service'])
angular.module('shirtsApp', ['shirts_controller', 'colors_controller', 'sizes_controller', 'shirts_service', 'colors_service', 'sizes_service', 'application_services', 'alert_directives', 'application_directives', 'application_filters'])
angular.module('mealsApp', ['meals_controller', 'meals_service', 'application_directives', 'application_services', 'application_filters'])
angular.module('cartShirtsApp', ['cart_shirts_controller', 'cart_shirts_service', 'application_services', 'alert_directives', 'application_directives', 'application_filters'])
angular.module('cartCheckoutApp', ['cart_checkout_controller', 'cart_shirts_service', 'customers_service', 'application_services', 'alert_directives', 'application_directives', 'application_filters'])
angular.module('cartPaymentApp', ['cart_payment_controller', 'application_filters', 'application_services', 'orders_service', 'application_directives'])
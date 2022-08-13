import 'package:motchi/models/payment_method.dart';

class SSUser {
  const SSUser({
    required this.uid,
    required this.displayName,
    required this.paymentMethods,
  });

  SSUser.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        displayName = json['displayName'],
        paymentMethods = (json['paymentMethods'] as List<dynamic>)
            .map((e) => PaymentMethod.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => <String, dynamic>{
        'uid': uid,
        'displayName': displayName,
        'paymentMethods': paymentMethods?.map((e) => e.toJson()).toList(),
      };

  final String? uid;
  final String displayName;
  final List<PaymentMethod>? paymentMethods;
}

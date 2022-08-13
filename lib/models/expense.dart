import 'package:motchi/models/ss_user.dart';

class Expense {
  const Expense({
    required this.title,
    required this.description,
    required this.amount,
    required this.initialPayer,
    required this.payers,
  });

  Expense.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        description = json['description'],
        amount = json['amount'],
        initialPayer = json['initialPayer'],
        payers = (json['payers'] as List<SSUser>).map((e) => e).toList();

  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'description': description,
        'amount': amount,
        'initialPayer': initialPayer,
        'payers': payers,
      };

  final String title;
  final String? description;
  final int amount;
  final SSUser initialPayer;
  final List<SSUser>? payers;
}

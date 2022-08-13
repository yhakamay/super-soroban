import 'package:motchi/models/ss_user.dart';

import 'expense.dart';

class Party {
  const Party({
    required this.id,
    required this.title,
    required this.members,
    required this.expenses,
  });

  Party.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        members = (json['members'] as List<dynamic>)
            .map((e) => SSUser.fromJson(e as Map<String, dynamic>))
            .toList(),
        expenses = (json['expenses'] as List<dynamic>)
            .map((e) => Expense.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'title': title,
        'members': members?.map((e) => e.toJson()).toList(),
        'expenses': expenses?.map((e) => e.toJson()).toList(),
      };

  final String? id;
  final String title;
  final List<SSUser>? members;
  final List<Expense>? expenses;
}

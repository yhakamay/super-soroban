import 'package:flutter/material.dart';

import '../atoms/member_chip.dart';
import '../models/ss_user.dart';

class MemberChipsListView extends StatelessWidget {
  const MemberChipsListView({
    Key? key,
    required this.members,
    this.onDeleted,
  }) : super(key: key);

  final List<SSUser>? members;
  final void Function(SSUser)? onDeleted;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        const SizedBox(width: 16.0),
        for (final member in members ?? [])
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: MemberChip(member: member, onDeleted: onDeleted),
          ),
      ],
    );
  }
}

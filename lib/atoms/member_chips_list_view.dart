import 'package:flutter/material.dart';

import '../models/ss_user.dart';

class MemberChipsListView extends StatelessWidget {
  const MemberChipsListView({
    Key? key,
    required this.members,
    required this.onDeleted,
  }) : super(key: key);

  final List<SSUser> members;
  final void Function(SSUser) onDeleted;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        const SizedBox(width: 40.0),
        for (final member in members)
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Chip(
              label: Text(member.displayName),
              deleteIcon: const Icon(
                Icons.cancel,
                size: 18.0,
              ),
              onDeleted: () => onDeleted(member),
            ),
          ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../models/ss_user.dart';

class MemberChip extends StatelessWidget {
  const MemberChip({
    Key? key,
    required this.member,
    this.onDeleted,
  }) : super(key: key);

  final SSUser member;
  final void Function(SSUser)? onDeleted;

  @override
  Widget build(BuildContext context) {
    final assigned = member.uid != null;

    return Chip(
      label: Text(member.displayName),
      avatar: assigned ? const Icon(Icons.check) : null,
      shape: StadiumBorder(
        side: BorderSide(
          color: assigned
              ? Theme.of(context).colorScheme.primaryContainer
              : Colors.grey,
          width: assigned ? 2.0 : 1.0,
        ),
      ),
      backgroundColor: assigned
          ? Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5)
          : null,
      deleteIcon: onDeleted == null
          ? null
          : const Icon(
              Icons.cancel,
              size: 18.0,
            ),
      onDeleted: onDeleted == null ? null : () => onDeleted!(member),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:motchi/molecules/member_chips_list_view.dart';

import '../models/ss_user.dart';

class PartyCard extends StatefulWidget {
  const PartyCard(
    this.id, {
    Key? key,
  }) : super(key: key);

  final String id;

  @override
  State<PartyCard> createState() => _PartyCardState();
}

class _PartyCardState extends State<PartyCard> {
  final parties = FirebaseFirestore.instance.collection('parties');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: parties.doc(widget.id).get(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        final title = snapshot.data?.data()['title'] ?? '(No title)';
        final membersData = snapshot.data?.data()['members'] as List<dynamic>?;
        final members = membersData
            ?.map((member) => SSUser.fromJson(member as Map<String, dynamic>))
            .toList();

        return GestureDetector(
          onTap: () {
            // TODO: Implement on #12
          },
          child: Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16.0,
                    left: 16.0,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                SizedBox(
                  height: 80.0,
                  child: MemberChipsListView(members: members),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

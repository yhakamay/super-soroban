import 'package:flutter/material.dart';
import 'package:motchi/models/party.dart';

import '../atoms/create_party_fab.dart';
import '../atoms/member_chips_list_view.dart';
import '../atoms/new_party_form_field.dart';
import '../models/ss_user.dart';
import '../utils.dart';

class CreatePartyPage extends StatefulWidget {
  const CreatePartyPage({Key? key}) : super(key: key);

  @override
  State<CreatePartyPage> createState() => _CreatePartyPageState();
}

class _CreatePartyPageState extends State<CreatePartyPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _membersController = TextEditingController();
  String _title = '';
  final List<SSUser> _members = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Party'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NewPartyFormField(
                controller: _titleController,
                onPressed: _saveTitle,
                labelText: 'Title',
                iconData: Icons.wine_bar,
                suffixIconData: Icons.check,
                validator: _emptyValidator,
              ),
              const SizedBox(height: 16.0),
              NewPartyFormField(
                controller: _membersController,
                onPressed: _addMember,
                labelText: 'Add members',
                iconData: Icons.people,
                suffixIconData: Icons.add,
              ),
              SizedBox(
                height: 80,
                child: MemberChipsListView(
                  members: _members,
                  onDeleted: _removeMember,
                ),
              ),
              const SizedBox(height: 16.0),
              CreatePartyFAB(
                formKey: _formKey,
                party: Party(
                  // Will be assigned by Firestore
                  id: null,
                  title: _title,
                  members: _members,
                  expenses: null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveTitle() {
    setState(() {
      _title = _titleController.text;
    });

    Utils.showSnackBar(context, 'Title saved!');
  }

  void _addMember() {
    setState(() {
      _members.add(
        SSUser(
          uid: null,
          displayName: _membersController.text,
          paymentMethods: null,
        ),
      );
    });

    Utils.showSnackBar(context, 'Member added!');
  }

  void _removeMember(SSUser member) {
    setState(() {
      _members.remove(member);
    });
  }

  String? _emptyValidator(value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }
}

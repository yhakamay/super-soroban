import 'package:flutter/material.dart';

import '../atoms/create_party_fab.dart';
import '../models/ss_user.dart';

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
              TextFormField(
                maxLength: 24,
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  icon: const Icon(Icons.wine_bar),
                  suffix: IconButton(
                    onPressed: _saveTitle,
                    icon: const Icon(Icons.check),
                  ),
                ),
                validator: _emptyValidator,
                onSaved: (_) => _saveTitle(),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                maxLength: 24,
                controller: _membersController,
                decoration: InputDecoration(
                  labelText: 'Members',
                  icon: const Icon(Icons.people),
                  suffix: IconButton(
                    onPressed: _addMember,
                    icon: const Icon(Icons.add),
                  ),
                ),
                validator: _emptyValidator,
                onSaved: (_) => _addMember(),
              ),
              SizedBox(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    const SizedBox(width: 40.0),
                    for (final member in _members)
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Chip(
                          label: Text(member.displayName),
                          deleteIcon: const Icon(
                            Icons.cancel,
                            size: 18.0,
                          ),
                          onDeleted: () => _removeMember(member),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              CreatePartyFAB(formKey: _formKey),
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

    _showSnackBar('Title saved!');
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

    _showSnackBar('Member added!');
  }

  _removeMember(SSUser member) {
    setState(() {
      _members.remove(member);
    });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  String? _emptyValidator(value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }
}

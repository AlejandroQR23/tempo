import 'package:flutter/material.dart';
import 'package:tempo/models/label.dart';

class LabelsDialogForm extends StatefulWidget {
  const LabelsDialogForm({super.key, this.label});

  final Label? label;

  @override
  State<LabelsDialogForm> createState() => _LabelsDialogFormState();
}

class _LabelsDialogFormState extends State<LabelsDialogForm> {
  final _formKey = GlobalKey<FormState>();
  final _labelNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _labelNameController.text = widget.label?.name ?? '';
  }

  @override
  void dispose() {
    _labelNameController.dispose();
    super.dispose();
  }

  void _saveLabel(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;

    final labelName = _labelNameController.text;

    if (widget.label != null) {
      final updatedLabel = widget.label!.copyWith(name: labelName);
      Navigator.of(context).pop(updatedLabel);
      return;
    }

    Navigator.of(context).pop(Label(name: labelName));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      constraints: const BoxConstraints(maxWidth: 720, minWidth: 300),
      title: Text(widget.label != null ? 'Edit Label' : 'Add Label'),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _labelNameController,
          decoration: const InputDecoration(
            labelText: 'Label Name',
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a label name';
            }
            return null;
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () => _saveLabel(context),
          child: Text(widget.label != null ? 'Save' : 'Add'),
        ),
      ],
    );
  }
}

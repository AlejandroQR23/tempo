import 'package:flutter/material.dart';
import 'package:tempo/models/tracked_app_group.dart';

class AddAppGroupDialog extends StatefulWidget {
  const AddAppGroupDialog({super.key, this.trackedAppGroup});

  final TrackedAppGroup? trackedAppGroup;

  @override
  State<AddAppGroupDialog> createState() => _AddAppGroupDialogState();
}

class _AddAppGroupDialogState extends State<AddAppGroupDialog> {
  final _formKey = GlobalKey<FormState>();

  final _groupNameController = TextEditingController();
  final _appsController = TextEditingController();

  @override
  void dispose() {
    _groupNameController.dispose();
    _appsController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _groupNameController.text = widget.trackedAppGroup?.name ?? '';
    _appsController.text = widget.trackedAppGroup?.apps.join(', ') ?? '';
  }

  List<String> _splitApps(String rawText) {
    final apps = rawText
        .split(',')
        .map((app) => app.trim())
        .where((app) => app.isNotEmpty)
        .toList();

    return apps;
  }

  void _addAppGroup(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;

    final apps = _splitApps(_appsController.text);
    final groupName = _groupNameController.text;

    if (widget.trackedAppGroup != null) {
      final updatedGroup = widget.trackedAppGroup!.copyWith(
        name: groupName,
        apps: apps,
      );
      Navigator.of(context).pop(updatedGroup);
      return;
    }

    Navigator.of(context).pop(TrackedAppGroup(name: groupName, apps: apps));
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      constraints: const BoxConstraints(maxWidth: 600, minHeight: 280),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.trackedAppGroup != null
                        ? 'Edit App Group'
                        : 'Add App Group',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Group Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a group name';
                      }
                      return null;
                    },
                    controller: _groupNameController,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Apps (comma-separated)',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter at least one app';
                      }
                      final apps = _splitApps(value);
                      if (apps.isEmpty) {
                        return 'Please enter at least one app';
                      }
                      return null;
                    },
                    controller: _appsController,
                  ),
                  const SizedBox(height: 24),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 8),
                  FilledButton(
                    onPressed: () => _addAppGroup(context),
                    child: Text(
                      widget.trackedAppGroup != null ? 'Save' : 'Add',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

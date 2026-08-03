import 'package:flutter/material.dart';
import 'package:tempo/models/tracked_app_group.dart';
import 'package:tempo/theme/app_theme.dart';
import 'package:tempo/widgets/app_group_dialog_form.dart';

class AppGroup extends StatefulWidget {
  const AppGroup({super.key});

  @override
  State<AppGroup> createState() => _AppGroupState();
}

class _AppGroupState extends State<AppGroup> {
  final List<TrackedAppGroup> _appGroups = [
    TrackedAppGroup(
      name: 'Social Media',
      apps: ['Facebook', 'Twitter', 'Instagram'],
    ),
    TrackedAppGroup(name: 'Productivity', apps: ['Slack', 'Trello', 'Notion']),
  ];

  Future<void> _saveAppGroup(TrackedAppGroup? trackedAppGroup) async {
    final result = await showDialog<TrackedAppGroup>(
      context: context,
      builder: (context) => AddAppGroupDialog(trackedAppGroup: trackedAppGroup),
    );

    if (result == null) return;

    setState(() {
      if (trackedAppGroup != null) {
        final index = _appGroups.indexWhere(
          (group) => group.id == trackedAppGroup.id,
        );
        if (index != -1) {
          _appGroups[index] = result;
        }
      } else {
        _appGroups.add(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('App Groups')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('App Groups', style: TextStyle(fontSize: 24)),
                IconButton(
                  icon: const Icon(Icons.add),
                  tooltip: 'Add App Group',
                  onPressed: () => _saveAppGroup(null),
                ),
              ],
            ),
            Expanded(
              child: _appGroups.isEmpty
                  ? const Center(child: Text('No app groups found.'))
                  : ListView.builder(
                      itemCount: _appGroups.length,
                      itemBuilder: (context, index) {
                        final group = _appGroups[index];
                        return Card(
                          key: ValueKey(group.id),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              AppTheme.listRowCardRadius,
                            ),
                          ),
                          child: ListTile(
                            title: Text(group.name),
                            subtitle: Text(group.apps.join(', ')),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  tooltip: 'Edit App Group',
                                  onPressed: () => _saveAppGroup(group),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  tooltip: 'Delete App Group',
                                  onPressed: () {
                                    setState(() {
                                      _appGroups.removeAt(index);
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

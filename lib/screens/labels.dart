import 'package:flutter/material.dart';
import 'package:tempo/models/label.dart';
import 'package:tempo/theme/app_theme.dart';
import 'package:tempo/widgets/labels_dialog_form.dart';

class Labels extends StatefulWidget {
  const Labels({super.key});

  @override
  State<Labels> createState() => _LabelsState();
}

class _LabelsState extends State<Labels> {
  final List<Label> _labels = [
    for (var name in ['Work', 'Personal', 'Urgent']) Label(name: name),
  ];

  Future<void> _saveLabel(Label? label) async {
    final result = await showDialog<Label>(
      context: context,
      builder: (context) => LabelsDialogForm(label: label),
    );

    if (result == null) return;

    setState(() {
      if (label != null) {
        final index = _labels.indexWhere((l) => l.id == label.id);
        if (index != -1) {
          _labels[index] = result;
        }
      } else {
        _labels.add(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Labels')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Labels', style: TextStyle(fontSize: 24)),
                IconButton(
                  icon: const Icon(Icons.add),
                  tooltip: 'Add Label',
                  onPressed: () {
                    _saveLabel(null);
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _labels.isEmpty
                  ? const Center(child: Text('No labels available.'))
                  : ListView.builder(
                      itemCount: _labels.length,
                      itemBuilder: (context, index) {
                        final label = _labels[index];
                        return Card(
                          key: ValueKey(label.id),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              AppTheme.listRowCardRadius,
                            ),
                          ),
                          child: ListTile(
                            title: Text(label.name),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  tooltip: 'Edit Label',
                                  onPressed: () {
                                    _saveLabel(label);
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  tooltip: 'Delete Label',
                                  onPressed: () {
                                    setState(() {
                                      _labels.removeAt(index);
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

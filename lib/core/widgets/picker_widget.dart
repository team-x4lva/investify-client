import 'package:flutter/material.dart';

class PickerWidget extends StatefulWidget {
  final List<String> elements;
  final Color color;

  const PickerWidget({
    super.key,
    required this.elements,
    required this.color,
    required this.pickedItems,
  });
  final List<String> pickedItems;
  @override
  // ignore: library_private_types_in_public_api
  _PickerWidgetState createState() => _PickerWidgetState();
}

class _PickerWidgetState extends State<PickerWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Wrap(
      children: widget.elements.map((item) {
        return GestureDetector(
          onTap: () {
            setState(() {
              if (widget.pickedItems.contains(item)) {
                widget.pickedItems.remove(item);
              } else {
                widget.pickedItems.add(item);
              }
            });
          },
          child: FittedBox(
            fit: BoxFit.cover,
            child: AnimatedContainer(
              width: MediaQuery.of(context).size.width * 0.4,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: BoxDecoration(
                color: widget.pickedItems.contains(item)
                    ? widget.color
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: widget.pickedItems.contains(item)
                      ? widget.color
                      : theme.hintColor,
                  width: 2.0,
                ),
              ),
              child: Center(
                child: Text(
                  item,
                  style: TextStyle(
                      color: widget.pickedItems.contains(item)
                          ? theme.colorScheme.onSurface
                          : theme.hintColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

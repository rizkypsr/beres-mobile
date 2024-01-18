import 'dart:io';

import 'package:flutter/material.dart';

class ImagePickerField extends StatelessWidget {
  const ImagePickerField({
    Key? key,
    required this.label,
    required this.selectedFiles,
    this.onPressed,
    required this.onDelete,
  }) : super(key: key);

  final List<File> selectedFiles;
  final String label;
  final Function()? onPressed;
  final Function(File) onDelete;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Text(label),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          children: selectedFiles
              .map((file) => Container(
                    margin: EdgeInsets.only(bottom: 12.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 190,
                          width: 190,
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Image.file(
                            file,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: 190,
                          width: 190,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3), // Gray overlay
                            // borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => onDelete(file),
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}

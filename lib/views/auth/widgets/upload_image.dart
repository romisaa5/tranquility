import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tranquility/core/utils/common_imports.dart';
import 'package:tranquility/views/auth/widgets/bottom_sheet_option_tile.dart';
import 'package:tranquility/views/auth/widgets/custom_bottom_sheet.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key, required this.onImageSelected});
  final Function(String?) onImageSelected;

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? selectedImage;
  bool _isPickingImage = false;
  final ImagePicker picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    if (_isPickingImage) return;

    _isPickingImage = true;

    try {
      final XFile? image = await picker.pickImage(
        source: source,
        imageQuality: 70,
      );

      if (image != null) {
        final file = File(image.path);

        if (!mounted) return;

        setState(() {
          selectedImage = file;
        });

        widget.onImageSelected(image.path);
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      _isPickingImage = false;

      if (mounted) {
        Navigator.pop(context);
      }
    }
  }

  void _showImagePickerSheet() {
    final options = [
      BottomSheetOptionTile(
        icon: 'camera.svg',
        title: 'Take a Photo',
        onTap: () => _pickImage(ImageSource.camera),
      ),
      BottomSheetOptionTile(
        icon: 'gallery-add.svg',
        title: 'Choose from Gallery',
        onTap: () => _pickImage(ImageSource.gallery),
      ),
      if (selectedImage != null)
        BottomSheetOptionTile(
          icon: 'trash.svg',
          title: 'Remove Image',
          isDestructive: true,
          onTap: () {
            setState(() => selectedImage = null);
            widget.onImageSelected(null);
            Navigator.pop(context);
          },
        ),
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return CustomBottomSheet(
          title: 'Profile Image',
          children: [
            for (int i = 0; i < options.length; i++)
              FadeInUp(
                duration: Duration(milliseconds: 400 + i * 150),
                child: options[i],
              ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: _showImagePickerSheet,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 80.r,
            backgroundColor: LightAppColors.grey200,
            child: selectedImage != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(80.r),
                    child: Image.file(
                      selectedImage!,
                      width: 160.w,
                      height: 160.h,
                      fit: BoxFit.cover,
                    ),
                  )
                : AppImages(imagePath: 'pick_image.svg'),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              radius: 20.r,
              backgroundColor: LightAppColors.primary800,
              child: const Icon(Icons.add, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}

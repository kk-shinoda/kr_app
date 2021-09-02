import 'package:flutter/material.dart';
import 'package:kr_app/common/constants.dart';
import 'package:provider/provider.dart';
import 'image_setting_model.dart';

class ImageSettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ImageSettingModel>(
      create: (_) => ImageSettingModel(),
      child: Consumer<ImageSettingModel>(builder: (context, model, child) {
        return Scaffold(
          appBar: commonAppBar('画像設定'),
          backgroundColor: Colors.orange.shade50,
          body: SafeArea(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: kBackgroundDecoration,
              child: SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: GestureDetector(
                      onTap: () async {
                        // アイコン設定
                        await model.showImagePicker();
                      },
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: ClipOval(
                                child: model.imageFile == null
                                    ? model.imageURL == ""
                                        ? Image.asset(
                                            "assets/images/placeholder.jpg",
                                            height: 120,
                                            width: 120,
                                            fit: BoxFit.cover,
                                          )
                                        : Image.network(
                                            model.imageURL,
                                            height: 120,
                                            width: 120,
                                            fit: BoxFit.cover,
                                          )
                                    : Image.file(
                                        model.imageFile!,
                                        height: 120,
                                        width: 120,
                                        fit: BoxFit.cover,
                                      )),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: cameraIcon(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: ElevatedButton(
                        style: kButtonStyleForm,
                        onPressed: () async {
                          model.updateImage(context);
                        },
                        child: Container(
                            color: Colors.brown.shade400,
                            child: Text(
                              '登録',
                              style: TextStyle(color: Colors.white),
                            ))),
                  )
                ]),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget cameraIcon() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
        shape: BoxShape.circle,
      ),
      child: const SizedBox(
        height: 30,
        child: CircleAvatar(
          backgroundColor: Colors.blueGrey,
          child: Icon(
            Icons.photo_camera_outlined,
            size: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

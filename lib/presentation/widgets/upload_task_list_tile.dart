import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class UploadTaskListTile extends StatelessWidget {
  // ignore: public_member_api_docs
  const UploadTaskListTile({
    super.key,
    required this.url,
    required this.onDownloadLink,
    required this.onDelete,
  });

  /// The [UploadTask].
  final String /*!*/ url;

  /// Triggered when the user presses the "link" button on a completed upload task.
  final VoidCallback /*!*/ onDownloadLink;

  /// Triggered when the user presses the "delete" button on a completed upload task.
  final VoidCallback /*!*/ onDelete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: MaterialButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FullScreenImageView(imageUrl: url),
              ),
            );
          },
          child: Image.network(
            url,
            width: 60,
            height: 60,
          )),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.link),
            onPressed: onDownloadLink,
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}

class FullScreenImageView extends StatelessWidget {
  final String imageUrl;

  const FullScreenImageView({Key? key, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Full Screen Image'),
      ),
      body: InteractiveViewer(
        panEnabled: true,
        minScale: 0.5,
        maxScale: 2,
        child: Center(
          child: Image.network(
            imageUrl,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

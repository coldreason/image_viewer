import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/upload_task_list_tile.dart';
import 'manage_image_info_view_model.dart';

class ManageImageInfoPage extends StatelessWidget {
  const ManageImageInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    void callSnackBar(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    }

    return Consumer(builder: (BuildContext context,
        ManageImageInfoViewModel viewModel, Widget? child) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('ImageViewer'),
            actions: [
              IconButton(
                  onPressed: viewModel.uploadImage, icon: const Icon(Icons.add))
            ],
          ),
          body: viewModel.imageInfoList.isEmpty
              ? const Center(
                  child: Text("Press the '+' button to add a new file."))
              : ListView.builder(
                  itemCount: viewModel.imageInfoList.length,
                  itemBuilder: (context, index) => UploadTaskListTile(
                    onDownloadLink: () async {
                      await viewModel.downloadLink(index);
                      callSnackBar('Link copied to clipboard');
                    },
                    onDelete: () async {
                      await viewModel.removeTaskAtIndex(index);
                      callSnackBar('Deleted successfully');
                    },
                    url: viewModel.imageInfoList[index].url,
                  ),
                ));
    });
  }
}

/// Displays the current state of a single UploadTask.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_sheets/smooth_sheets.dart';

void showCustomBottomSheet(BuildContext context,Widget? child) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(10),
          topStart: Radius.circular(10),
        ),
      ),
      builder: (context) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SizedBox(
            height: 300,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SheetContentScaffold(
                backgroundColor: CupertinoColors.systemGroupedBackground,
                body: Column(
                  children: [
                    const _TopBar(
                      pageTitle: '수정하기',
                      displayUrl: '수정 사항은 즉시 영구히 반영됩니다.',
                      faviconUrl: 'https://www.apple.com/favicon.ico',
                    ),
                    const Divider(
                        height: 1, color: CupertinoColors.systemGrey5),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 150,
                      child: child,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      isScrollControlled: true);
}

class _CloseButton extends StatelessWidget {
  const _CloseButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Navigator.pop(context);
        FocusScope.of(context).unfocus();
      },
      child: Container(
        width: 36,
        height: 36,
        decoration: const ShapeDecoration(
          shape: CircleBorder(),
          color: CupertinoColors.systemGrey5,
        ),
        child: const Center(
          child: Icon(
            CupertinoIcons.xmark,
            size: 18,
            color: CupertinoColors.black,
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({
    required this.pageTitle,
    required this.displayUrl,
    required this.faviconUrl,
  });

  final String pageTitle;
  final String displayUrl;
  final String faviconUrl;

  @override
  Widget build(BuildContext context) {
    final pageTitle = Text(
      this.pageTitle,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.titleMedium,
    );
    final displayUrl = Text(
      this.displayUrl,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(color: CupertinoColors.secondaryLabel),
    );

    return SheetDraggable(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [pageTitle, displayUrl],
              ),
            ),
            const SizedBox(width: 16),
            const _CloseButton(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:social_media_app/core/components/base_components/app_shimmer.dart';

class HomePaginateLoading extends StatelessWidget {
  const HomePaginateLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        mainAxisExtent: 152,
      ),
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (ctx, pos) => const _HomeItem(),
    );
  }
}

class _HomeItem extends StatelessWidget {
  const _HomeItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      color: Colors.white,
      child: AppShimmer(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
              child: Container(
                width: double.infinity,
                height: 88,
                color: Colors.white,
              ),
            ),
            Container(
              width: 120,
              height: 16,
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
          ],
        ),
      ),
    );
  }
}

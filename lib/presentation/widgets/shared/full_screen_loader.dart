import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final loadingMessages = <String>[
      'Loading films...',
      'Buying popcorn',
      'Maybe some candy too',
      'Finding your seat',
      'Film starting',
      'Ads are taking way too long :(',
    ];
    return Stream.periodic(
      const Duration(milliseconds: 1200),
      (computationCount) {
        return loadingMessages[computationCount];
      },
    ).take(loadingMessages.length);
  }

  @override
  Widget build(BuildContext context) {
    final themes = Theme.of(context).textTheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Wait please',
            style: themes.titleLarge,
          ),
          const SizedBox(height: 20),
          const CircularProgressIndicator(strokeWidth: 2),
          const SizedBox(height: 20),
          StreamBuilder(
            stream: getLoadingMessages(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Loading...');
              return Text(
                snapshot.data!,
                style: themes.bodyLarge,
              );
            },
          ),
        ],
      ),
    );
  }
}

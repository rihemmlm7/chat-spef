import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class GroupMediaWidget extends StatefulWidget {
  const GroupMediaWidget({super.key});

  @override
  State<GroupMediaWidget> createState() => _GroupMediaWidgetState();
}

class _GroupMediaWidgetState extends State<GroupMediaWidget>
    with SingleTickerProviderStateMixin {
  // Liste des images
  final List<String> imagePaths = [
    'https://firebasestorage.googleapis.com/v0/b/easylifear-ea8de.appspot.com/o/images%2Fpexels-pixabay-158827.jpg?alt=media&token=1b267a63-52d9-4f66-b634-4792ae7d612c',
    'https://firebasestorage.googleapis.com/v0/b/easylifear-ea8de.appspot.com/o/images%2Fpexels-carsten-ruthemann-8804932-19957887.jpg?alt=media&token=9561ba87-1df8-4b86-a5f3-1d6ce6e7b749',
    'https://firebasestorage.googleapis.com/v0/b/easylifear-ea8de.appspot.com/o/images%2Fpexels-bertellifotografia-19923057.jpg?alt=media&token=42158bfd-2a64-4d83-b18a-a86d608cc906',
  ];

  // Liste des vidéos
  final List<String> videoPaths = [
    'https://samplelib.com/lib/preview/mp4/sample-5s.mp4',
    'https://samplelib.com/lib/preview/mp4/sample-10s.mp4',
    'https://samplelib.com/lib/preview/mp4/sample-20s.mp4',
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16.0),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.grey[200],
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                labelColor: Colors.black,
                tabs: const [
                  Tab(text: 'Images'),
                  Tab(text: 'Vidéos'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  buildImageCardList(),
                  buildVideoCardList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImageCardList() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Wrap(
        spacing: 8.0, // gap entre les éléments
        runSpacing: 8.0, // gap entre les lignes
        children: List<Widget>.generate(imagePaths.length, (int index) {
          return _buildImageCard(imagePaths[index]);
        }),
      ),
    );
  }

  Widget buildVideoCardList() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Wrap(
        spacing: 8.0, // gap entre les éléments
        runSpacing: 8.0, // gap entre les lignes
        children: List<Widget>.generate(videoPaths.length, (int index) {
          return _buildVideoCard(videoPaths[index]);
        }),
      ),
    );
  }

  Widget _buildImageCard(String path) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FullScreenImagePage(imageUrl: path),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            path,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 100,
                height: 100,
                color: Colors.grey[200],
                child: const Icon(Icons.broken_image),
              );
            },
          ),
        ),
      );

  Widget _buildVideoCard(String path) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VideoViewerPage(videoUrl: path),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: VideoPlayerPreview(path),
              ),
              const Icon(Icons.play_circle_outline,
                  color: Colors.white, size: 30),
            ],
          ),
        ),
      );
}

class FullScreenImagePage extends StatelessWidget {
  final String imageUrl;

  const FullScreenImagePage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            Expanded(
              child: Center(
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.broken_image,
                        color: Colors.white, size: 100);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoViewerPage extends StatefulWidget {
  final String videoUrl;

  const VideoViewerPage({super.key, required this.videoUrl});

  @override
  _VideoViewerPageState createState() => _VideoViewerPageState();
}

class _VideoViewerPageState extends State<VideoViewerPage> {
  late VideoPlayerController _controller;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
          _isLoading = false;
        });
        _controller.play();
      }).catchError((error) {
        setState(() {
          _isLoading = false;
          _errorMessage = 'Erreur lors du chargement de la vidéo';
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            Expanded(
              child: Center(
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : _errorMessage != null
                        ? Text(_errorMessage!,
                            style: const TextStyle(color: Colors.white))
                        : AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: _errorMessage == null
          ? FloatingActionButton(
              onPressed: () {
                setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                });
              },
              child: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            )
          : null,
    );
  }
}

class VideoPlayerPreview extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerPreview(this.videoUrl, {super.key});

  @override
  _VideoPlayerPreviewState createState() => _VideoPlayerPreviewState();
}

class _VideoPlayerPreviewState extends State<VideoPlayerPreview> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
        });
      }).catchError((error) {
        setState(() {
          _isInitialized = false;
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : Container(
            width: 100,
            height: 100,
            color: Colors.grey[200],
            child: const Center(child: CircularProgressIndicator()),
          );
  }
}

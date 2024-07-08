import 'package:flutter/material.dart';

class MediaItem extends StatelessWidget {
  final String title;
  final DateTime date;
  final String mediaUrl;
  final bool isVideo;

  MediaItem({
    required this.title,
    required this.date,
    required this.mediaUrl,
    required this.isVideo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: isVideo
                ? VideoWidget(mediaUrl)
                : Image.network(mediaUrl, fit: BoxFit.cover),
          ),
          SizedBox(height: 8.0),
          Text(
            '${date.day}/${date.month}/${date.year}',
          ),
        ],
      ),
    );
  }
}

class VideoWidget extends StatelessWidget {
  final String videoUrl;

  VideoWidget(this.videoUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Text(
          'Video Placeholder',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

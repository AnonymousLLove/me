import 'package:flutter/material.dart';

class CommentSection extends StatefulWidget {
  @override
  _CommentSectionState createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  final TextEditingController _commentController = TextEditingController();
  final List<Comment> _comments = [];
  Comment? _replyingTo;

  @override
  Widget build(BuildContext context) {
    // Get the height of the keyboard if it's visible
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 4.0,
            width: 40.0,
            color: Colors.grey[300],
            margin: const EdgeInsets.only(bottom: 8.0),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: _comments
                    .map((comment) => _buildCommentItem(comment))
                    .toList(),
              ),
            ),
          ),
          SizedBox(height: 16), // Space before the text input
          AnimatedPadding(
            padding: EdgeInsets.only(bottom: keyboardHeight),
            duration: Duration(milliseconds: 300),
            curve: Curves.easeOut,
            child: _buildCommentInput(),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/homeImage.png'),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 4), // Adjust padding for compact size
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color.fromRGBO(54, 40, 221, 1.0),
                  width: 1,
                ),
              ),
              child: SizedBox(
                height: 30, // Define a fixed height for a compact appearance
                child: TextField(
                  controller: _commentController,
                  decoration: InputDecoration(
                    hintText: _replyingTo == null
                        ? 'Add a comment...'
                        : 'Replying to ${_replyingTo!.username}',
                    border: InputBorder.none,
                    hintStyle:
                        TextStyle(fontSize: 12), // Adjust hint text font size
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 8), // Reduce vertical padding
                  ),
                  style: TextStyle(fontSize: 12), // Adjust text font size
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              if (_commentController.text.isNotEmpty) {
                setState(() {
                  if (_replyingTo == null) {
                    _comments.add(Comment(
                        username: 'current_user',
                        content: _commentController.text,
                        timeAgo: '1s',
                        userAvatar: 'assets/images/homeImage.png'));
                  } else {
                    _replyingTo!.replies.add(Comment(
                      username: 'current_user',
                      content: _commentController.text,
                      timeAgo: '1s',
                      userAvatar: 'assets/images/homeImage.png',
                      isReply: true,
                    ));
                  }
                });
                _commentController.clear();
                _replyingTo = null;
              }
            },
            child: Text('Post'),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentItem(Comment comment) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(comment.userAvatar),
          ),
          title: Row(
            children: [
              RichText(
                text: TextSpan(
                  text: comment.username,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                  children: [
                    TextSpan(
                      text:
                          '  ${comment.timeAgo}', // Adds comma and space before time
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        comment.isLiked = !comment.isLiked;
                        // Increase or decrease like count based on like status
                        if (comment.isLiked) {
                          comment.likeCount++;
                        } else {
                          comment.likeCount--;
                        }
                      });
                    },
                    child: Icon(
                      comment.isLiked ? Icons.favorite : Icons.favorite_border,
                      color: comment.isLiked ? Colors.red : Colors.grey,
                      size: 16,
                    ),
                  ),
                  SizedBox(height: 2), // Space between icon and like count
                  Text(
                    '${comment.likeCount}', // Display like count
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ],
              ),
            ],
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    width: screenSize.width * 0.6,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(217, 217, 217, 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      " ${comment.content}",
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(width: 8),
                ],
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _replyingTo = comment;
                  });
                },
                child: Text(
                  "Reply",
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              ),
              SizedBox(width: 8),
              if (comment.replies.isNotEmpty)
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          comment.areRepliesVisible =
                              !comment.areRepliesVisible;
                        });
                      },
                      child: Text(
                        comment.areRepliesVisible
                            ? "Hide Replies"
                            : "View Replies",
                        style: TextStyle(
                            color: Color.fromRGBO(54, 40, 221, 1.0),
                            fontSize: 12),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
        if (comment.areRepliesVisible && comment.replies.isNotEmpty)
          Column(
            children: comment.replies
                .map((reply) => _buildCommentItem(reply))
                .toList(),
          ),
      ],
    );
  }
}

class Comment {
  final String username;
  final String content;
  final String timeAgo;
  final String userAvatar;
  bool isLiked;
  bool isReply;
  bool areRepliesVisible;
  List<Comment> replies;
  int likeCount;

  Comment({
    required this.username,
    required this.content,
    required this.timeAgo,
    required this.userAvatar,
    this.isLiked = false,
    this.isReply = false,
    this.areRepliesVisible = true,
    List<Comment>? replies,
    this.likeCount = 0,
  }) : replies = replies ?? [];
}

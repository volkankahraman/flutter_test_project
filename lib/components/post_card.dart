import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/components/icon_text_button.dart';
import 'package:flutter_test_project/models/post.dart';

class PostCard extends StatefulWidget {
  const PostCard({Key? key, required this.post, required this.onDelete})
      : super(key: key);
  final Post post;
  final VoidCallback onDelete;
  final int _textLimit = 120;

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool readMore = false, readMoreDisabled = true;
  String? longBody, shortBody;

  @override
  Widget build(BuildContext context) {
    if (widget.post.body.length > widget._textLimit) {
      shortBody = widget.post.body.substring(0, widget._textLimit) + "...";
      longBody = widget.post.body;
    } else {
      shortBody = widget.post.body;
      readMoreDisabled = false;
    }
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  "${widget.post.image}${widget.post.id.toString()}"),
            ),
            title: Text("${widget.post.firstName} ${widget.post.lastName}"),
            subtitle: Text(widget.post.created),
            trailing: Padding(
              padding: const EdgeInsets.only(bottom: 26.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    constraints:
                        const BoxConstraints(maxHeight: 16, maxWidth: 30),
                    padding: const EdgeInsets.all(0.0),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit_outlined,
                      size: 16,
                    ),
                  ),
                  IconButton(
                    constraints:
                        const BoxConstraints(maxHeight: 16, maxWidth: 30),
                    onPressed: widget.onDelete,
                    padding: const EdgeInsets.all(0.0),
                    icon: const Icon(
                      Icons.delete_forever_outlined,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.5,
              horizontal: 17.5,
            ),
            child: RichText(
              text: TextSpan(
                text: readMore ? longBody : shortBody,
                style: const TextStyle(color: Colors.black),
                children: [
                  if (readMoreDisabled)
                    TextSpan(
                      text: readMore ? " Read Less" : " Read More",
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          setState(() {
                            readMore = !readMore;
                          });
                        },
                    ),
                ],
              ),
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.only(
                top: 11.0, bottom: 7.0, left: 18.0, right: 16.0),
            child: Row(
              children: <Widget>[
                IconTextButton(
                  text: "439",
                  icon: const Icon(
                    Icons.favorite,
                    size: 15.0,
                    color: Color(0xFFF8838A),
                  ),
                  onPress: () {},
                ),
                const SizedBox(width: 15.0),
                IconTextButton(
                  text: "24",
                  icon: const Icon(
                    Icons.comment,
                    size: 15.0,
                    color: Color(0xFFD8D8D8),
                  ),
                  onPress: () {},
                ),
                const SizedBox(width: 15.0),
                IconTextButton(
                  text: "78",
                  icon: const Icon(
                    Icons.reply,
                    size: 15.0,
                    color: Color(0xFFD8D8D8),
                  ),
                  onPress: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

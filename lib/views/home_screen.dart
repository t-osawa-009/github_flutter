import 'package:flutter/material.dart';
import 'package:github_flutter/views/home_state.dart';
import 'package:provider/provider.dart';
import "package:github_flutter/model/github_repo.dart";
import 'package:github_flutter/views/web/web_screen.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _controller = new TextEditingController();
  final _listViewKey = new Key('ListView');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("state_notifier"),
      ),
      body: Center(
        child: new ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          children: <Widget>[
            new TextField(
              decoration: const InputDecoration(
                hintText: 'Flutter',
                labelText: 'Query',
              ),
              maxLines: 1,
              controller: _controller,
            ),
            new Container(
              padding: const EdgeInsets.all(20.0),
              child: new RaisedButton(
                child: const Text('Search'),
                onPressed: () => context
                    .read<HomeStateNotifier>()
                    .fetchGithubRepos(_controller.text),
              ),
            ),
           new Container(
          height: 450.0,
          child: new ListView(
            key: _listViewKey,
            itemExtent: 50.0,
            children: _createWidgets(context, context.select<HomeState, List<GithubRepo>>((state) => state.githubRepos)),
          ),
        ),
          ],
        ),
      ),
    );
  }

  Iterable<Widget> _createWidgets(BuildContext context, List<GithubRepo> items) {
    var ret = new List<Widget>();
    if (items == null) {
      return ret;
    }
    items.forEach((item) {
      ret.add(new ListTile(
        leading: new CircleAvatar(
          backgroundImage: new NetworkImage(item.avatarURL),
        ),
        title: new Text('${item.name} / ⭐ ${item.starCount}'),
         onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WebScreen(url: item.htmlUrl)),
              );
         }
      ));
    });
    return ret;
  }
}

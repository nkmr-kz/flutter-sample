import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SliverAppBarPage extends StatefulWidget {
  const SliverAppBarPage({super.key});

  @override
  State<SliverAppBarPage> createState() => _SliverAppBarPageState();
}

class _SliverAppBarPageState extends State<SliverAppBarPage> {
  double _textScale = 1.0;
  bool _isLarge = false;
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: _textScale),
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.blueAccent.withOpacity(0.3),
                floating: true,
                pinned: true,
                snap: false,
                expandedHeight: 180,
                toolbarHeight: 60,
                flexibleSpace: FlexibleSpaceBar(
                    title: const Text('記事カテゴリ'),
                    background: Stack(children: [
                      Container(
                        width: double.infinity,
                        child: Image.network(
                            'https://images.pexels.com/photos/267392/pexels-photo-267392.jpeg?auto=compress& cs=tinysrgb&dpr=2&h=650&w=940',
                            fit: BoxFit.cover),
                      ),
                      Container(
                        width: double.infinity,
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ])),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>[
                    Container(
                      color: Colors.grey[200],
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 8),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                      child: Text(
                                    "Sep. 29, 2020",
                                    style: GoogleFonts.lato(),
                                  )),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.share,
                                    ),
                                    onPressed: () {},
                                  ),
                                ]),
                            const Text(
                              "記事タイトル",
                            ),
                            const Divider(
                              height: 30,
                              thickness: 1,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "https://images.pexels.com/photos/267392/pexels-photo-267392.jpeg?auto=compress& cs=tinysrgb&dpr=2&h=650&w=940"),
                                  radius: 26,
                                  backgroundColor: Colors.grey[200],
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("山田"),
                                    Text('ITジャーナリスト'),
                                  ],
                                ),
                                const Expanded(child: SizedBox()),
                                const Icon(
                                  Icons.favorite_border,
                                  color: Colors.blueAccent,
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                const Text(
                                  '350',
                                ),
                                const SizedBox(
                                  width: 16.0,
                                ),
                                const Icon(
                                  Icons.comment,
                                  color: Colors.blueAccent,
                                ),
                                const SizedBox(width: 5.0),
                                const Text(
                                  '25',
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              '私は場合おもにその周旋めという事の所を受けですな。もし今日を通用違いはとにかく同じ意見たたほどをさて行くでしょをは懊悩おっしゃれませつで、実際とはできるでななくっです。釣に申し上げたら事はすでに前をち ょうどないたた。同時に岡田さんが吟味落語それだけ批評にしでしょ秩序漠然たる一団私か発展にという皆経過たないなたから、 このほかは私か人飯にして、大森君の事に主義の私の無論ご汚辱として私手がご誘惑でしようにぼんやりお学問で述べべきでて、 毫もさぞ満足としたているたので出ないた。もしくはまたはお主義の向いのはこう馬鹿としたて、その賞には見えですでという辞 令にいうておきました。(省略)',
                              style: GoogleFonts.notoSans(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _changeTextScale,
            child: const Icon(Icons.text_fields),
          ),
        ));
  }

  void _changeTextScale() {
    setState(() {
      _isLarge = !_isLarge;
      _textScale = _isLarge ? 1.2 : 1.0;
    });
  }
}

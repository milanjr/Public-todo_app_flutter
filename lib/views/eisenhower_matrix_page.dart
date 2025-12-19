import 'package:flutter/material.dart';

class EisenhowerMatrixPage extends StatelessWidget {
  const EisenhowerMatrixPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisCount: 2,
          childAspectRatio: 1/1.7,
          children: [
            MatrixCardView(title: "Vert Urgent", color: Color(0xFFFF7777),),
            MatrixCardView(title: "Urgent", color: Color(0xFF77FFBB),),
            MatrixCardView(title: "Important", color: Color(0xFFFFFFAA),),
            MatrixCardView(title: "Low Priority", color: Color(0xFF77AAFF),),
        ]
      ),
    );
  }
}

class MatrixCardView extends StatelessWidget {
  final String title;
  final Color color;

  const MatrixCardView({
    super.key, required this.title, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Column(
        children: [
          TitleRowView(title: title, color: color, alpha: 250,),
          TodoTaskRowView(title: "One", color: Colors.white, alpha: 50,),
          TodoTaskRowView(title: "Two", color: Colors.white, alpha: 50,),
          TodoTaskRowView(title: "Three", color: Colors.white, alpha: 50,),
          TodoTaskRowView(title: "Four", color: Colors.white, alpha: 50,),
        ],
      ),
    );
  }
}

class TitleRowView extends StatelessWidget {
  const TitleRowView({
    super.key,
    required this.title, required this.color, required this.alpha,
  });

  final String title;
  final int alpha;
  final Color color;


  @override
  Widget build(BuildContext context) {
    return Card(
      color: color.withAlpha(alpha),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(title,
              style: TextStyle(
                fontSize: 18,
                color: Colors.blue[900],
                fontWeight: FontWeight.bold,
              ),),
            Spacer()
          ],
        ),
      ),
    );
  }
}

class TodoTaskRowView extends StatelessWidget {
  const TodoTaskRowView({
    super.key,
    required this.title, required this.color, required this.alpha,
  });

  final String title;
  final int alpha;
  final Color color;


  @override
  Widget build(BuildContext context) {
    return Card(
      color: color.withAlpha(alpha),
      margin: EdgeInsets.only(
        top: 2,
        bottom: 0,
        left: 5,
        right: 5,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(title),
            Spacer()
          ],
        ),
      ),
    );
  }
}

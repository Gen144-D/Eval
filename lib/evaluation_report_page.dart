import 'package:flutter/material.dart';

class EvaluationReportPage extends StatelessWidget {
  const EvaluationReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Evaluation Report"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Evaluation Report Module",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              "This module is a placeholder based on the EvalTrack System Architecture.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // BUTTON 1
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const DummyPage(title: "View Evaluation Results"),
                  ),
                );
              },
              child: const Text("View Evaluation Results"),
            ),

            const SizedBox(height: 10),

            // BUTTON 2
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const DummyPage(title: "Recommended Subjects"),
                  ),
                );
              },
              child: const Text("View Recommended Subjects"),
            ),

            const SizedBox(height: 10),

            // BUTTON 3
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const DummyPage(title: "Export PDF"),
                  ),
                );
              },
              child: const Text("Export Evaluation Report (PDF)"),
            ),
          ],
        ),
      ),
    );
  }
}

// 🔹 DUMMY PAGE FOR PLACEHOLDER NAVIGATION
class DummyPage extends StatelessWidget {
  final String title;

  const DummyPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          "$title Page (Placeholder)",
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

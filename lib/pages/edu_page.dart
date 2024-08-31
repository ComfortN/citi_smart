import 'package:citi_smart/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Citi Smart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green, // Set primary color to green
        hintColor: Colors.blue, // Set accent color to blue
        scaffoldBackgroundColor: Colors.white, // Light background for contrast
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'Roboto',
          ),
          bodyLarge: TextStyle(
            fontSize: 18.0,
            color: Colors.black54,
            fontFamily: 'Roboto',
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue, // Use blue for buttons
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
            textStyle: const TextStyle(fontSize: 18.0),
          ),
        ),
      ),
      home: const MyHomePage(title: 'Citi Smart Home'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor:
            Theme.of(context).hintColor, // Use accent color for AppBar
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Theme.of(context).primaryColor,
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
            textStyle: const TextStyle(fontSize: 18.0),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const EducationalPage()),
            );
          },
          child: const Text('Go to Educational Page'),
        ),
      ),
    );
  }
}

class EducationalPage extends StatelessWidget {
  const EducationalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Educational Page'),
        backgroundColor: Theme.of(context).primaryColor, // Blue AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.green[700],
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4.0,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: const Column(
                children: <Widget>[
                  Text(
                    'Importance of Keeping the Community Clean',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Imagine a community where parks sparkle,streets are litter-free, and wildlife thrives. This vision can become reality with your help! Our app empowers you to take action and make a positive impact on your environment. By learning about proper waste disposal, recycling, and reducing litter, you will contribute to a cleaner, healthier community. The app provides educational resources, connects you to local clean-up events, and helps you find convenient recycling locations. Together, let us build a vibrant future where environmental health and a safe community go hand-in-hand. Keeping the community clean is essential for maintaining a healthy anrevent pollution, protect wildlife, and enhance the quality of life for everyone.',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4.0,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: const Text(
                'Fun Fact: Did you know that a single banana peel can take up to a year to decompose in a landfill!  However, by composting food scraps like banana peels, you can turn them into nutrient-rich soil in a matter of weeks.Using the app,you can learn more about composting and other ways to reduce waste!',
                style: TextStyle(
                  fontSize: 18.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
                textStyle: const TextStyle(fontSize: 18.0),
              ),
              child: const Text('Start Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Map<String, dynamic>> questions = [
    {
      'question': 'Which of the following is a renewable source of energy?',
      'options': ['Coal', 'Solar', 'Natural Gas', 'Oil'],
      'correctAnswer': 'Solar',
    },
    {
      'question': 'What is the primary cause of global warming?',
      'options': [
        'Deforestation',
        'Burning fossil fuels',
        'Plastic pollution',
        'Overpopulation'
      ],
      'correctAnswer': 'Burning fossil fuels',
    },
    {
      'question': 'Which of these materials is biodegradable?',
      'options': ['Plastic', 'Glass', 'Paper', 'Metal'],
      'correctAnswer': 'Paper',
    },
    {
      'question': 'What can be done to reduce plastic waste?',
      'options': [
        'Recycle plastics',
        'Throw plastics in the ocean',
        'Burn plastics',
        'Bury plastics'
      ],
      'correctAnswer': 'Recycle plastics',
    },
    {
      'question':
          'Which gas is primarily responsible for the greenhouse effect?',
      'options': ['Oxygen', 'Nitrogen', 'Carbon Dioxide', 'Hydrogen'],
      'correctAnswer': 'Carbon Dioxide',
    },
    {
      'question': 'What is a common practice to conserve water?',
      'options': [
        'Leave taps running',
        'Fix leaks promptly',
        'Water lawns at noon',
        'Use sprinklers often'
      ],
      'correctAnswer': 'Fix leaks promptly',
    },
    {
      'question': 'How can communities manage waste effectively?',
      'options': [
        'Dump waste in rivers',
        'Implement recycling programs',
        'Burn waste in open areas',
        'Ignore waste management'
      ],
      'correctAnswer': 'Implement recycling programs',
    },
    {
      'question': 'Which of the following is an effect of deforestation?',
      'options': [
        'Increase in biodiversity',
        'Soil erosion',
        'Climate stabilization',
        'Increase in oxygen levels'
      ],
      'correctAnswer': 'Soil erosion',
    },
    {
      'question': 'What is composting?',
      'options': [
        'Burning organic waste',
        'Burying plastic waste',
        'Recycling metals',
        'Decomposing organic matter'
      ],
      'correctAnswer': 'Decomposing organic matter',
    },
    {
      'question': 'Why is it important to keep our environment clean?',
      'options': [
        'To increase pollution',
        'To promote a healthy community',
        'To attract pests',
        'To harm wildlife'
      ],
      'correctAnswer': 'To promote a healthy community',
    },
  ];

  int currentQuestionIndex = 0;
  bool answered = false;
  String selectedAnswer = '';
  int score = 0;

  void checkAnswer(String answer) {
    if (!answered) {
      setState(() {
        answered = true;
        selectedAnswer = answer;
        if (answer == questions[currentQuestionIndex]['correctAnswer']) {
          score++;
        }
      });
    }
  }

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        answered = false;
        selectedAnswer = '';
        currentQuestionIndex++;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ResultScreen(score: score, totalQuestions: questions.length),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Environmental Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Question ${currentQuestionIndex + 1}:',
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Text(
              questions[currentQuestionIndex]['question'],
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ...((questions[currentQuestionIndex]['options'] as List<String>)
                    .map((option) {
                  return Card(
                    elevation: 2.0,
                    color: answered &&
                            option ==
                                questions[currentQuestionIndex]['correctAnswer']
                        ? Colors.green
                        : answered &&
                                option == selectedAnswer &&
                                option !=
                                    questions[currentQuestionIndex]
                                        ['correctAnswer']
                            ? Colors.red
                            : Colors.white,
                    child: ListTile(
                      onTap: () => checkAnswer(option),
                      title: Text(option),
                    ),
                  );
                })),
              ],
            ),
            const SizedBox(height: 20.0),
            answered
                ? ElevatedButton(
                    onPressed: nextQuestion,
                    child: const Text('Next Question'),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;

  ResultScreen({required this.score, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    int pointsEarned;
    if (score <= 5) {
      pointsEarned = 10;
    } else {
      pointsEarned = 25;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your score is: $score/$totalQuestions',
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            Text(
              'You earned $pointsEarned points!',
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                  (route) => false, 
                );
              },
              child: const Text('Back to Homepage'),
            ),
          ],
        ),
      ),
    );
  }
}

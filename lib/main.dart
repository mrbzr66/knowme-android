import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

void main() => runApp(const KnowMeApp());

class KnowMeApp extends StatelessWidget {
  const KnowMeApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'رفیق‌سنج',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF7057E8)),
      scaffoldBackgroundColor: const Color(0xFFF8F7FC),
      cardTheme: CardThemeData(
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      ),
    ),
    home: const Directionality(textDirection: TextDirection.rtl, child: HomePage()),
  );
}

class QuizQuestion {
  const QuizQuestion(this.text, this.options);
  final String text;
  final List<String> options;
}

const questionBank = <QuizQuestion>[
  QuizQuestion('برای یک روز آزاد کدام را انتخاب می‌کنم؟', ['بیرون رفتن با دوست‌ها', 'خانه و فیلم', 'یک ماجراجویی تازه']),
  QuizQuestion('کدام خوراکی را بیشتر دوست دارم؟', ['پیتزا', 'برگر', 'غذای خانگی']),
  QuizQuestion('سفر رؤیایی من کجاست؟', ['کنار دریا', 'یک شهر بزرگ', 'طبیعت و کوهستان']),
  QuizQuestion('وقتی حالم خوب نیست چه چیزی کمکم می‌کند؟', ['حرف زدن', 'کمی تنهایی', 'موسیقی و فیلم']),
  QuizQuestion('کدام ویژگی بیشتر شبیه من است؟', ['برنامه‌ریز', 'بداهه‌پرداز', 'ترکیبی از هر دو']),
  QuizQuestion('برای هدیه کدام را ترجیح می‌دهم؟', ['یک تجربه خاص', 'چیزی کاربردی', 'یک یادگاری شخصی']),
  QuizQuestion('در گروه دوستان معمولاً من…', ['شوخی می‌کنم', 'به حرف‌ها گوش می‌دهم', 'برنامه می‌چینم']),
  QuizQuestion('کدام زمان روز را بیشتر دوست دارم؟', ['صبح', 'عصر', 'شب']),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(22, 18, 22, 28),
        children: [
          Row(children: [
            Container(
              width: 52, height: 52,
              decoration: BoxDecoration(color: const Color(0xFFEAE5FF), borderRadius: BorderRadius.circular(18)),
              child: const Icon(Icons.bolt_rounded, color: Color(0xFF7057E8), size: 30),
            ),
            const SizedBox(width: 12),
            const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('رفیق‌سنج', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
              Text('ببین کی واقعاً تو رو می‌شناسه!', style: TextStyle(color: Colors.black54)),
            ])),
            const Chip(label: Text('نسخه ۱.۰')),
          ]),
          const SizedBox(height: 28),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFF7057E8), Color(0xFFAA78F0)], begin: Alignment.topRight, end: Alignment.bottomLeft),
              borderRadius: BorderRadius.circular(28),
            ),
            child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('🎯 چالش دوستی', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w700)),
              SizedBox(height: 12),
              Text('دوستات چقدر\nتو رو می‌شناسن؟', style: TextStyle(color: Colors.white, fontSize: 30, height: 1.25, fontWeight: FontWeight.w900)),
              SizedBox(height: 10),
              Text('یه آزمون کوتاه بساز، جواب درست رو انتخاب کن و نتیجه رو با دوستات به اشتراک بذار.', style: TextStyle(color: Colors.white, height: 1.7)),
            ]),
          ),
          const SizedBox(height: 22),
          const _FeatureTile(icon: Icons.edit_note_rounded, color: Color(0xFFEAE5FF), title: '۱. آزمون خودت رو بساز', subtitle: 'از سؤال‌های آماده انتخاب کن و جواب واقعی خودت رو مشخص کن.'),
          const SizedBox(height: 12),
          const _FeatureTile(icon: Icons.people_alt_rounded, color: Color(0xFFFFEBD8), title: '۲. دوستات رو به چالش بکش', subtitle: 'ببین چند درصد جواب‌ها رو درست حدس می‌زنن.'),
          const SizedBox(height: 12),
          const _FeatureTile(icon: Icons.ios_share_rounded, color: Color(0xFFDDF6E8), title: '۳. نتیجه رو به اشتراک بذار', subtitle: 'با یک پیام آماده، بقیه رو هم وارد بازی کن.'),
          const SizedBox(height: 24),
          FilledButton.icon(
            style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(58), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CreateQuizPage())),
            icon: const Icon(Icons.add_circle_outline_rounded),
            label: const Text('ساخت آزمون من', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 12),
          const Text('نسخه آزمایشی: فعلاً بازی روی همین گوشی اجرا می‌شود. لینک آزمون آنلاین و رقابت از راه دور در مرحله بعد اضافه می‌شود.', textAlign: TextAlign.center, style: TextStyle(color: Colors.black54, height: 1.6, fontSize: 12)),
        ],
      ),
    ),
  );
}

class _FeatureTile extends StatelessWidget {
  const _FeatureTile({required this.icon, required this.color, required this.title, required this.subtitle});
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
    child: Row(children: [
      Container(width: 46, height: 46, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)), child: Icon(icon, size: 25)),
      const SizedBox(width: 13),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),
        const SizedBox(height: 4),
        Text(subtitle, style: const TextStyle(color: Colors.black54, height: 1.5, fontSize: 12)),
      ])),
    ]),
  );
}

class CreateQuizPage extends StatefulWidget {
  const CreateQuizPage({super.key});
  @override
  State<CreateQuizPage> createState() => _CreateQuizPageState();
}

class _CreateQuizPageState extends State<CreateQuizPage> {
  final nameController = TextEditingController();
  final selectedQuestions = <int>[0, 1, 2, 3, 4];
  final answers = <int, int>{};

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ready = nameController.text.trim().isNotEmpty &&
      selectedQuestions.length == 5 && selectedQuestions.every(answers.containsKey);
    return Scaffold(
      appBar: AppBar(title: const Text('ساخت آزمون شخصی')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('اول خودت رو معرفی کن', style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900)),
          const SizedBox(height: 8),
          const Text('اسم یا لقب کوتاهت رو بنویس و برای هر سؤال جواب واقعی خودت رو انتخاب کن.', style: TextStyle(color: Colors.black54, height: 1.7)),
          const SizedBox(height: 18),
          TextField(controller: nameController, maxLength: 24, onChanged: (_) => setState(() {}), decoration: const InputDecoration(filled: true, labelText: 'اسم یا لقب من', hintText: 'مثلاً امین')),
          const SizedBox(height: 10),
          ...selectedQuestions.asMap().entries.map((entry) {
            final slot = entry.key;
            final questionIndex = entry.value;
            final question = questionBank[questionIndex];
            return Card(
              margin: const EdgeInsets.only(bottom: 14),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('سؤال ${slot + 1} از ۵', style: const TextStyle(color: Color(0xFF7057E8), fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(question.text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 8),
                  ...List.generate(question.options.length, (optionIndex) => RadioListTile<int>(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    title: Text(question.options[optionIndex]),
                    value: optionIndex,
                    groupValue: answers[questionIndex],
                    onChanged: (value) => setState(() => answers[questionIndex] = value!),
                  )),
                  if (slot == 4) Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton.icon(
                      onPressed: () => setState(() {
                        final unused = List.generate(questionBank.length, (i) => i).where((i) => !selectedQuestions.contains(i)).toList();
                        if (unused.isNotEmpty) selectedQuestions[slot] = unused.first;
                      }),
                      icon: const Icon(Icons.refresh_rounded),
                      label: const Text('عوض کردن سؤال پنجم'),
                    ),
                  ),
                ]),
              ),
            );
          }),
          const SizedBox(height: 8),
          FilledButton(
            onPressed: ready ? () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => PlayQuizPage(
              ownerName: nameController.text.trim(),
              questionIds: List<int>.from(selectedQuestions),
              correctAnswers: Map<int, int>.from(answers),
            ))) : null,
            style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(56)),
            child: const Text('آماده‌ام؛ شروع چالش', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 12),
          const Text('در نسخه فعلی، جواب‌ها فقط در جریان همین بازی استفاده می‌شوند و به سرور ارسال نمی‌شوند.', textAlign: TextAlign.center, style: TextStyle(color: Colors.black54, fontSize: 12)),
        ],
      ),
    );
  }
}

class PlayQuizPage extends StatefulWidget {
  const PlayQuizPage({super.key, required this.ownerName, required this.questionIds, required this.correctAnswers});
  final String ownerName;
  final List<int> questionIds;
  final Map<int, int> correctAnswers;
  @override
  State<PlayQuizPage> createState() => _PlayQuizPageState();
}

class _PlayQuizPageState extends State<PlayQuizPage> {
  int current = 0;
  final picked = <int, int>{};
  bool finished = false;
  int get score => widget.questionIds.where((id) => picked[id] == widget.correctAnswers[id]).length;

  Future<void> shareResult() async {
    final percent = (score / widget.questionIds.length * 100).round();
    await Share.share(
      'من در رفیق‌سنج آزمون ${widget.ownerName} رو انجام دادم و $percent٪ جواب‌ها رو درست زدم! 😎\nحالا نوبت توئه که امتحان کنی.\nنسخه آزمایشی رفیق‌سنج — به‌زودی با لینک آنلاین!',
      subject: 'چالش رفیق‌سنج',
    );
  }

  @override
  Widget build(BuildContext context) {
    if (finished) {
      final percent = (score / widget.questionIds.length * 100).round();
      return Scaffold(
        appBar: AppBar(title: const Text('نتیجه چالش')),
        body: Center(child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text('🎉', style: TextStyle(fontSize: 64)),
            const SizedBox(height: 12),
            const Text('نتیجه تو', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
            const SizedBox(height: 8),
            Text('$percent٪', style: const TextStyle(fontSize: 54, fontWeight: FontWeight.w900, color: Color(0xFF7057E8))),
            Text('از ${widget.questionIds.length} سؤال، $score جواب درست بود.', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 24),
            FilledButton.icon(onPressed: shareResult, icon: const Icon(Icons.share_rounded), label: const Text('اشتراک‌گذاری نتیجه'), style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(54))),
            const SizedBox(height: 10),
            OutlinedButton(onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst), child: const Text('بازگشت به خانه')),
          ]),
        )),
      );
    }

    final id = widget.questionIds[current];
    final question = questionBank[id];
    return Scaffold(
      appBar: AppBar(title: Text('چالش ${widget.ownerName}')),
      body: ListView(padding: const EdgeInsets.all(20), children: [
        ClipRRect(borderRadius: BorderRadius.circular(10), child: LinearProgressIndicator(value: (current + 1) / widget.questionIds.length, minHeight: 8)),
        const SizedBox(height: 18),
        Text('سؤال ${current + 1} از ${widget.questionIds.length}', style: const TextStyle(color: Color(0xFF7057E8), fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Text(question.text, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900, height: 1.5)),
        const SizedBox(height: 18),
        ...List.generate(question.options.length, (optionIndex) {
          final isSelected = picked[id] == optionIndex;
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => setState(() => picked[id] = optionIndex),
              child: Container(
                padding: const EdgeInsets.all(17),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFFEAE5FF) : Colors.white,
                  border: Border.all(color: isSelected ? const Color(0xFF7057E8) : Colors.transparent, width: 1.5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(children: [
                  Expanded(child: Text(question.options[optionIndex], style: const TextStyle(fontWeight: FontWeight.w600))),
                  if (isSelected) const Icon(Icons.check_circle_rounded, color: Color(0xFF7057E8)),
                ]),
              ),
            ),
          );
        }),
        const SizedBox(height: 16),
        FilledButton(
          onPressed: picked.containsKey(id) ? () {
            if (current + 1 == widget.questionIds.length) {
              setState(() => finished = true);
            } else {
              setState(() => current++);
            }
          } : null,
          style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(54)),
          child: Text(current + 1 == widget.questionIds.length ? 'دیدن نتیجه' : 'سؤال بعدی'),
        ),
      ]),
    );
  }
}

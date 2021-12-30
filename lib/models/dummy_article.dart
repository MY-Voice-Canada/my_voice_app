import 'package:flutter/material.dart';

enum ArticleCategory {
  creativeWriting,
  faith,
  foodForThought,
  inspiringIndividuals,
  lifeStyleAndEntertainment,
  newsAndSocialIssues,
}

class TempArticleData {
  static const ArticleCategory category = ArticleCategory.foodForThought;
  static const String title =
      "IT COULD’VE BEEN WORSE: THE PROBLEM WITH RATING HARDSHIPS";
  static const String author = "Aamna Idrees";
  static const String content =
      """ A lost job. A failed test. A dead pet. These are everyday hardships people face. Then, in the wake of the pandemic, ‘everyday’ expanded its list. Missing graduations. Not meeting friends and family. Constant Zoom calls followed by fatigue. 
One initial reaction is to tell ourselves, “it’s not so bad.” We complain at first, but people will quickly correct us regarding ‘first world dilemmas’: at least your family is alive. At least you’re not in a war. At least you have food and shelter. 

  It could always be worse. We should worry about others who have real problems. Right? 

  Hardship rating is comparing your difficulties against those who experience more severe hardship. The principle is not a bad one; after all, our Prophet Muhammad PBUH1 advised us to compare ourselves with those lower rather than above us.2 However, the problem is when we treat certain stressors as less valid.

  Counterarguing someone’s problem with a worse case scenario does not help alleviate grievances or spread positivity. Overlooking a personal situation can make someone feel hurt, invisible, or misunderstood. Imagine responding to an elementary schooler’s question on what BEDMAS is with a reference to quantum physics and how much worse post-secondary students have it. The approach leads to zero productivity in terms of addressing the problem at hand. 

  Dismissing worries by waving them off as insignificant is damaging to people’s mental health. It invites feelings of shame or self hatred because of the implication that you are weak or petty for feeling upset over something ‘minor’. But the reality is that everyone’s trials are dictated by Allah SWT3, whether it be war or school. Just as no two souls are meant to be the same, neither are trials. We struggle through the hardships on our path in order to reach realizations. Brushing over perceived smaller trials takes away from the learning experience that might have helped us face bigger troubles in the future. 

  A healthier approach is listening and accepting troubles that others face. If possible, validate them through words of comfort and work towards solutions to the difficulty. Ask yourself what the sufferer needs and try to deliver, whether it’s relatable advice or just a friend who can listen. Once the hardship and its associated feelings are acknowledged, then you can bring up varying troubles. This way, more severe examples will help promote gratitude because the individual may appreciate how much better they may have it once they are not focused on their own negative predicament. 

  Next time you or someone is facing anything less than an apocalypse, refrain from the ‘get over it’ attitude. Treating all problems that come your way with the same respect will make you that much more prepared to accept the presence or absence of bigger struggles. """;
}

class TempArticle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          TempArticleData.title,
          style: TextStyle(fontSize: 36),
        ),
        Text("Author: " + TempArticleData.author),
        SizedBox(
          height: 30.0,
        ),
        Text(TempArticleData.content),
        SizedBox(
          height: 10.0,
        ),
        Text("(" + TempArticleData.category.toString() + ")"),
      ],
    );
  }
}

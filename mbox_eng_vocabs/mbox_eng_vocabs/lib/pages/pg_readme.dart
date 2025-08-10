import 'package:flutter/material.dart';

class PgReadMe extends StatelessWidget {
  const PgReadMe({super.key});   
  @override
  Widget build(BuildContext context) {
    var strMsg = 'This application is aimed to provide some help in recalling or learning some English words.'
    'This project was started as a learning project to try out Mobile Application development.'
    'The source code is shared below as well so it can serve any suitable purpose.\n'
    'ဒီ Appကို ကိုယ်သိဖူးတဲ့ စကားလုံးတွေ ပြန်နွှေးဖို့ ဒါမှမဟုတ်လည်း စကားလုံးအသစ်တွေလေ့လာဖို့ အထောက်အကူအဖြစ် ရေးပါတယ်။'
    'Mobile Application ရေးတာကို သင်ယူဖို့အတွက် စတင်ခဲ့တာပါ။ စိတ်ဝင်စားတဲ့သူတွေ လိုအပ်သလို သုံးနိုင်ဖို့ source code ကိုလည်း အောက်မှာ မျှဝေထားပါတယ်။\n\n'
    'Kindly take note that, despite my best effort, there might be typo or mistakes due to my lack of knowledge.'
    'In that case, you can send email to me to the address given below.\n'
    'ကျွန်တော် တတ်စွမ်းသမျှ စိစစ်ထားပေမယ့် စာရိုက်တာမှားတာ၊ ဒါမှမဟုတ် ကျွန်တော့်ရဲ့ အသိပညာလိုအပ်ချက်ကြောင့် မှားယွင်းတာတွေ ပါနိုင်ပါတယ်။'
    'အဲလို မှားတာတွေတွေ့ခဲ့ရင် အောက်မှာပေးထားတဲ့ email လိပ်စာဆီ email ပို့နိုင်ပါတယ်။\n\n'
    'Entries cannot be as complete as the ones in the standard dictionary.'
    'For example, the word \'loot\' can have more meanings than the ones shown in this application.'
    'I strongly recommend to use the standard dictionaries for better learning.\n'
    'ဒီ application မှာ ပါတဲ့ အဓိပ္ပါယ်သတ်မှတ်ချက်တွေဟာ တကယ့် စံအဘိဓါန်တွေမှာ ပါသလောက် ပြည့်စုံမှာ မဟုတ်ပါဘူး။'
    'ဥပမာ \'loot\' ဆိုတဲ့ စကားလုံးဆို ဒီ application မှာ တမျိုးတည်းပဲ ပါပါတယ်။'
    'တကယ့် အဘိဓါန်မှာဆို သူ့ရဲ့ ဖြစ်နိုင်ချေအဓိပ္ပါယ်တွေ အကုန်လုံးကို စာရင်းပြုပေးထားကြပါတယ်။'
    'ဒါကြောင့် ဒီ application ကို အခြေခံလေ့လာမှုအတွက်လောက်ပဲ သုံးပြီး ပိုပြီးပုံစံတကျလေ့လာမှုအတွက်တော့ တကယ့်အဘိဓါန်တွေကို သုံးဖို့ တိုက်တွန်းပါတယ်။';
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('MinBox: English Vocabularies'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'To Dear Users',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(strMsg,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 10),
              Container(
                    width: double.infinity, 
                    color: Colors.white,   
                    padding: const EdgeInsets.symmetric(vertical: 8.0), // Vertical padding
                    child: Text(
                      'Source code:',
                      style: const TextStyle(
                        fontSize: 15.0,
                        color: Colors.black
                      ),
                      textAlign: TextAlign.left, // Center the text within the container
                    ),
                  ),
              Container(
                    width: double.infinity, 
                    color: Colors.white,   
                    padding: const EdgeInsets.symmetric(vertical: 8.0), // Vertical padding
                    child: Text(
                      'https://github.com/MinBoxApps/standalone_apps',
                      style: const TextStyle(
                        fontSize: 15.0,
                        color: Colors.black
                      ),
                      textAlign: TextAlign.left, // Center the text within the container
                    ),
                  ),
              SizedBox(height: 10),
              Container(
                    width: double.infinity, 
                    color: Colors.white,   
                    padding: const EdgeInsets.symmetric(vertical: 8.0), // Vertical padding
                    child: Text(
                      'Email:',
                      style: const TextStyle(
                        fontSize: 15.0,
                        color: Colors.black
                      ),
                      textAlign: TextAlign.left, // Center the text within the container
                    ),
                  ),
              Container(
                    width: double.infinity, 
                    color: Colors.white,   
                    padding: const EdgeInsets.symmetric(vertical: 8.0), // Vertical padding
                    child: Text(
                      'min-box-apps-25@gmail.com',
                      style: const TextStyle(
                        fontSize: 15.0,
                        color: Colors.black
                      ),
                      textAlign: TextAlign.left, // Center the text within the container
                    ),
                  ),
                SizedBox(height: 30),
              ],              
            ),
        ),
      ),
    );
  }
}
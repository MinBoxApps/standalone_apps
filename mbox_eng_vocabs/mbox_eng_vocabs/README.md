# mbox_eng_vocabs


# Initial set up

1: All the codes here are generated with "flutter create mbox_eng_vocabs"

2: The following are added into the generated .gitignore
/android/build/
/android/app/build/
/ios
/web
/linux
/macos
/windows

3: After this, running with 'flutter run' should bring app the generated sample app (using Android device plugged into the computer with Developer Options and USB Debugging turned ON)

4: After doing  the additional changes, the following info is amended in build.gradle.kts in "android/app"
ndkVersion = "27.0.12077973"
... pubspec.yaml is appended with the following lines to link up the json file to the application
  assets:
    - lib/assets/vocabularies.json

#README in Chinese：

[中文文档](https://github.com/zjutkz/ModularizationTemplate/blob/master/README-Chinese.md)

#Android Studio templates' location

Mac: Android Studio.app/Contents/plugins/android/lib/templates

Win: Android Studio.app/plugins/android/lib/templates



#Attention

Before you copy the files,please backup the Android Studio templates' file.

If you new a project rather than creating a module,some errors may occur in your build.gradle,it could be Android Studio's bug.

It is the correct code(When you creating a new module,it is what you get):

```groovy
sourceSets {
    main {
        if (isDebug.toBoolean()) {
            manifest.srcFile 'src/main/debug/AndroidManifest.xml'
        } else {
            manifest.srcFile 'src/main/release/AndroidManifest.xml'
            java {
                exclude 'debug/**'
            }
        }
    }
}
```

And it is the wrong code when you creating a new project:

```groovy
sourceSets {
    main if (isDebug.toBoolean()) {
        manifest.srcFile 'src/main/debug/AndroidManifest.xml'
    } else {
        manifest.srcFile 'src/main/release/AndroidManifest.xml'
        java {
            exclude 'debug/**'
        }
    }
}
```

It is obviously missing a brace.So just correcting it.

#usage

Step1. Copy activities/Modularization to Android Studio.app/Contents/plugins/android/lib/templates/activities

step2. Copy activities/EmptyActivity/recipe.xml.ftl & activities/EmptyActivity/template.xml to Android Studio.app/Contents/plugins/android/lib/templates/activities/EmptyActivity

step3. Copy ModularizationModule/build.gradle.ftl to Android Studio.app/Contents/plugins/android/lib/templates/gradle-projects/NewAndroidModule/root

step4. Copy ModularizationModule/recipe.xml.ftl to Android Studio.app/Contents/plugins/android/lib/templates/gradle-projects/NewAndroidModule

step5. Copy NewAndroidProjects/gradle.properties.ftl to Android Studio.app/Contents/plugins/android/lib/templates/gradle-projects/NewAndroidProject/root

step6. Restart Android Studio

step7. When you new a project or a module,please choose EmptyActivity and check the "Generate modularization file structure":

 ![screenshot](https://github.com/zjutkz/ModularizationTemplate/blob/master/pic/screenshot.png)

#License

```
Copyright 2016 zjutkz

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```


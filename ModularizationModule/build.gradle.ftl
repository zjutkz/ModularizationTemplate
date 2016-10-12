<#if !(perModuleRepositories??) || perModuleRepositories>
buildscript {
    repositories {
        jcenter()
<#if mavenUrl != "mavenCentral">
        maven {
            url '${mavenUrl}'
        }
</#if>
    }
    dependencies {
        classpath 'com.android.tools.build:gradle:${gradlePluginVersion}'
    }
}
</#if>
<#if modularization>
    if (isDebug.toBoolean()) {
        apply plugin: 'com.android.application'
    } else {
        apply plugin: 'com.android.library'
    }
</#if>

<#if !modularization>
    <#if isLibraryProject?? && isLibraryProject>
        apply plugin: 'com.android.library'
    <#else>
        apply plugin: 'com.android.application'
    </#if>
</#if>

<#if !(perModuleRepositories??) || perModuleRepositories>

repositories {
        jcenter()
<#if mavenUrl != "mavenCentral">
        maven {
            url '${mavenUrl}'
        }
</#if>
}
</#if>

android {
    compileSdkVersion <#if buildApiString?matches("^\\d+$")>${buildApiString}<#else>'${buildApiString}'</#if>
    buildToolsVersion "${buildToolsVersion}"

    defaultConfig {
        <#if modularization>
            if (isDebug.toBoolean()) {
                applicationId "${packageName}"
            }
        </#if>

        <#if !modularization>
            <#if isLibraryProject?? && isLibraryProject>
            <#else>
            applicationId "${packageName}"
            </#if>
        </#if>
        minSdkVersion <#if minApi?matches("^\\d+$")>${minApi}<#else>'${minApi}'</#if>
        targetSdkVersion <#if targetApiString?matches("^\\d+$")>${targetApiString}<#else>'${targetApiString}'</#if>
        versionCode 1
        versionName "1.0"
    }
<#if javaVersion?? && (javaVersion != "1.6" && buildApi lt 21 || javaVersion != "1.7")>

    compileOptions {
        sourceCompatibility JavaVersion.VERSION_${javaVersion?replace('.','_','i')}
        targetCompatibility JavaVersion.VERSION_${javaVersion?replace('.','_','i')}
    }
</#if>
<#if enableProGuard>
    buildTypes {
        release {
            minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
        }
    }
</#if>
<#if modularization>
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
    android {
        lintOptions {
            abortOnError false
        }
    }
</#if>
}

dependencies {
    <#if dependencyList?? >
    <#list dependencyList as dependency>
    compile '${dependency}'
    </#list>
    </#if>
    compile fileTree(dir: 'libs', include: ['*.jar'])
<#if WearprojectName?has_content && NumberOfEnabledFormFactors?has_content && NumberOfEnabledFormFactors gt 1 && Wearincluded>
    wearApp project(':${WearprojectName}')
    compile 'com.google.android.gms:play-services:+'
</#if>
<#if unitTestsSupported>
    testCompile 'junit:junit:${junitVersion}'
</#if>
}

plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

import java.util.Properties
import java.io.FileInputStream
import org.gradle.api.GradleException

// -------------------------------
// Load keystore properties
// -------------------------------
val keystoreProperties = Properties()

// Since key.properties is now in android/app/, use this path
val keystorePropertiesFile = file("key.properties")
if (!keystorePropertiesFile.exists()) {
    throw GradleException("key.properties file not found at ${keystorePropertiesFile.absolutePath}")
}
keystoreProperties.load(FileInputStream(keystorePropertiesFile))

android {
    namespace = "com.satmath.sat_math"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.satmath.sat_math"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    // -------------------------------
    // Signing configuration for release
    // -------------------------------
    signingConfigs {
        create("release") {
            val storeFilePath = keystoreProperties["storeFile"] as String?
                ?: throw GradleException("storeFile path is missing in key.properties")

            // Make storeFile path relative to android/app folder
            val storeFileRef = file(storeFilePath)
            if (!storeFileRef.exists()) {
                throw GradleException("Keystore file not found at ${storeFileRef.absolutePath}")
            }

            keyAlias = keystoreProperties["keyAlias"] as String?
                ?: throw GradleException("keyAlias is missing in key.properties")
            keyPassword = keystoreProperties["keyPassword"] as String?
                ?: throw GradleException("keyPassword is missing in key.properties")
            storeFile = storeFileRef
            storePassword = keystoreProperties["storePassword"] as String?
                ?: throw GradleException("storePassword is missing in key.properties")
        }
    }

    buildTypes {
        debug {
            // Default debug signing (no keystore needed)
        }

        release {
            signingConfig = signingConfigs.getByName("release")
            isMinifyEnabled = false
            isShrinkResources = false
        }
    }
}

flutter {
    source = "../.."
}

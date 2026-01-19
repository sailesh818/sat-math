import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AppOpenAdManager with WidgetsBindingObserver {
  // Singleton instance
  static final AppOpenAdManager _instance = AppOpenAdManager._internal();
  static AppOpenAdManager get instance => _instance;
  AppOpenAdManager._internal();

  AppOpenAd? _appOpenAd;
  bool _isShowingAd = false;

  // google real App Open ad unit ID
  final String adUnitId = "ca-app-pub-6704136477020125/5897362267";

  // ✅ Google test App Open Ad Unit ID
  //final String adUnitId = "ca-app-pub-3940256099942544/3419835294";

  // Public getter to access ad safely
  AppOpenAd? get appOpenAd => _appOpenAd;

  // Callback to notify UI or other listeners
  VoidCallback? onAdLoadedCallback;

  /// Initialize App Open Ad manager
  void initialize() {
    WidgetsBinding.instance.addObserver(this);

    // No test devices configured; production-ready
    // Load first ad after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadAd();
    });
  }

  /// Load App Open Ad
  void loadAd() {
    AppOpenAd.load(
      adUnitId: adUnitId,
      request: const AdRequest(),
      //orientation: AppOpenAdOrientation.portrait,
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          _appOpenAd = ad;
          debugPrint("✅ App Open Ad loaded successfully");

          // Notify listener (UI can show ad if needed)
          onAdLoadedCallback?.call();

          // Auto-show if app just launched
          showAdIfAvailable();
        },
        onAdFailedToLoad: (error) {
          debugPrint("❌ Failed to load App Open Ad: $error");
          _appOpenAd = null;

          // Notify UI to hide spinner if any
          onAdLoadedCallback?.call();
        },
      ),
    );
  }

  /// Show ad if available
  void showAdIfAvailable() {
    if (_appOpenAd == null || _isShowingAd) return;

    _appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        _isShowingAd = true;
        debugPrint("App Open Ad is showing...");
      },
      onAdDismissedFullScreenContent: (ad) {
        _isShowingAd = false;
        ad.dispose();
        _appOpenAd = null;
        debugPrint("App Open Ad dismissed. Loading next ad...");
        loadAd();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        _isShowingAd = false;
        ad.dispose();
        _appOpenAd = null;
        debugPrint("Failed to show App Open Ad: $error. Loading next ad...");
        loadAd();
      },
    );

    _appOpenAd!.show();
  }

  /// Show ad when app resumes from background
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      debugPrint("App resumed. Attempting to show App Open Ad...");
      showAdIfAvailable();
    }
  }
}

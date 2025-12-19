import 'package:befit_code_testing/modules/onboarding/domain/entities/onboarding_content.dart';
import 'package:befit_code_testing/modules/onboarding/domain/entities/onboarding_content_type.dart';

class OnboardingHeaderContent implements OnboardingContent {
  @override
  OnboardingContentType get type => OnboardingContentType.headerContent;

  final String title;
  final String? subtitle;
  OnboardingHeaderContent({required this.title, this.subtitle});
}

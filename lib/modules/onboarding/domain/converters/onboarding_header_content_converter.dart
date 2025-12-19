import 'package:befit_code_testing/modules/onboarding/data/models/contents/onboarding_header_content_model.dart';
import 'package:befit_code_testing/modules/onboarding/domain/entities/contents/onboarding_header_content.dart';

class OnboardingHeaderContentConverter {
  OnboardingHeaderContent toEntity(OnboardingHeaderContentModel model) {
    return OnboardingHeaderContent(
      title: model.title,
      subtitle: model.subtitle,
    );
  }

  OnboardingHeaderContentModel toModel(OnboardingHeaderContent entity) {
    return OnboardingHeaderContentModel(
      title: entity.title,
      subtitle: entity.subtitle,
    );
  }
}

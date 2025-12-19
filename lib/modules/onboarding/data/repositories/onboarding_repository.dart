import 'package:befit_code_testing/core/utils/result.dart';
import 'package:befit_code_testing/modules/onboarding/data/models/onboarding_step_model.dart';

abstract class OnboardingRepositoryInterface {
  AsyncResult<List<OnboardingStepModel>> getOnboardingFlow();
}

class OnboardingRepository implements OnboardingRepositoryInterface {
  @override
  AsyncResult<List<OnboardingStepModel>> getOnboardingFlow() async {
    return Result.success([]);
  }
}

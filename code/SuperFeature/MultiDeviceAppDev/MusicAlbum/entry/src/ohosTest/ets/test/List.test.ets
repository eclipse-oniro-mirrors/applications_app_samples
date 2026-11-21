/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import abilityTest from './Ability.test';
import albumOperationsSuite from './Core/AlbumOperations.test';
import albumStressSuite from './Core/AlbumStress.test';
import albumAppVersionSuite from './Validation/AlbumAppVersion.test';
import albumBoundaryErrorTestingSuite from './Validation/AlbumBoundaryErrorTesting.test';
import albumSongSourceValidationSuite from './Validation/AlbumSongSourceValidation.test';
import albumFocusRingBehaviorSuite from './Interaction/AlbumFocusRingBehavior.test';
import albumUserScenariosSuite from './Integration/AlbumUserScenarios.test';
import albumErrorRecoverySuite from './LifecycleState/AlbumErrorRecovery.test';
import albumLongTermStabilitySuite from './PerformanceStability/AlbumLongTermStability.test';
import albumExtensionSuite from './AlbumExtension.test';

export default function testsuite() {
  abilityTest();
  albumOperationsSuite();
  albumStressSuite();
  albumAppVersionSuite();
  albumBoundaryErrorTestingSuite();
  albumSongSourceValidationSuite();
  albumFocusRingBehaviorSuite();
  albumUserScenariosSuite();
  albumErrorRecoverySuite();
  albumLongTermStabilitySuite();
  albumExtensionSuite();
}

/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import abilityTest from './Ability.test'
import breakpointClassificationSuite from './Core/BreakpointClassification.test'
import layoutMetricsSuite from './Core/LayoutMetrics.test'
import gridPartitionValidationSuite from './Validation/GridPartitionValidation.test'
import resourceQualifierSuite from './Validation/ResourceQualifier.test'
import navigationStackSuite from './Interaction/NavigationStack.test'
import crossModuleConsistencySuite from './Integration/CrossModuleConsistency.test'
import breakpointStateRestoreSuite from './LifecycleState/BreakpointStateRestore.test'
import repeatedLayoutStabilitySuite from './PerformanceStability/RepeatedLayoutStability.test'
import routeSanitizationSuite from './Security/RouteSanitization.test'
import inputBoundaryCodeSuite from './Validation/InputBoundaryCode.test'
import densityConversionSuite from './Core/DensityConversion.test'
import textMetricsSuite from './Core/TextMetrics.test'
import colorBlendingSuite from './Validation/ColorBlending.test'
import gestureThresholdSuite from './Interaction/GestureThreshold.test'
import transitionProgressSuite from './Interaction/TransitionProgress.test'
import themeMappingSuite from './Integration/ThemeMapping.test'
import lruCacheWindowSuite from './PerformanceStability/LruCacheWindow.test'
import pathSafetySuite from './Security/PathSafety.test'
import pathSegmentSuite from './Validation/PathSegment.test'
import stateHistoryWindowSuite from './LifecycleState/StateHistoryWindow.test'

export default function testsuite() {
  abilityTest()
  breakpointClassificationSuite()
  layoutMetricsSuite()
  gridPartitionValidationSuite()
  resourceQualifierSuite()
  navigationStackSuite()
  crossModuleConsistencySuite()
  breakpointStateRestoreSuite()
  repeatedLayoutStabilitySuite()
  routeSanitizationSuite()
  inputBoundaryCodeSuite()
  densityConversionSuite()
  textMetricsSuite()
  colorBlendingSuite()
  gestureThresholdSuite()
  transitionProgressSuite()
  themeMappingSuite()
  lruCacheWindowSuite()
  pathSafetySuite()
  pathSegmentSuite()
  stateHistoryWindowSuite()
}

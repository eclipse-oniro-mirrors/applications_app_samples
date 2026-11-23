'use static';
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

// Suites in Tabs
import tTabConcurrency from './Tabs/TabConcurrency.test';
import tTabConsistency from './Tabs/TabConsistency.test';
import tTabEndToEnd from './Tabs/TabEndToEnd.test';
import tTabErrorRecovery from './Tabs/TabErrorRecovery.test';
import tTabInputInteraction from './Tabs/TabInputInteraction.test';
import tTabItemInfoModel from './Tabs/TabItemInfoModel.test';
import tTabLifecycle from './Tabs/TabLifecycle.test';
import tTabMenuConfiguration from './Tabs/TabMenuConfiguration.test';
import tTabModelDeep from './Tabs/TabModelDeep.test';
import tTabOperationCatalog from './Tabs/TabOperationCatalog.test';
import tTabOperationFlow from './Tabs/TabOperationFlow.test';
import tTabOperations from './Tabs/TabOperations.test';
import tTabOperationWorkflow from './Tabs/TabOperationWorkflow.test';
import tTabStateManagement from './Tabs/TabStateManagement.test';
import tTabStress from './Tabs/TabStress.test';
import tTabSurfaceModel from './Tabs/TabSurfaceModel.test';

// Suites in TabValidation
import tTabAppVersion from './TabValidation/TabAppVersion.test';
import tTabAuthSession from './TabValidation/TabAuthSession.test';
import tTabDataSourceValidation from './TabValidation/TabDataSourceValidation.test';
import tTabEventToolValidation from './TabValidation/TabEventToolValidation.test';
import tTabInterruptionRecovery from './TabValidation/TabInterruptionRecovery.test';
import tTabNotification from './TabValidation/TabNotification.test';
import tTabOfflineNetwork from './TabValidation/TabOfflineNetwork.test';
import tTabSessionValidation from './TabValidation/TabSessionValidation.test';

// Suites in SkeletonValidation
import sSkeletonAnimationControllerValidation from './SkeletonValidation/SkeletonAnimationControllerValidation.test';
import sSkeletonBoundaryErrorTesting from './SkeletonValidation/SkeletonBoundaryErrorTesting.test';
import sSkeletonCommonEventValidation from './SkeletonValidation/SkeletonCommonEventValidation.test';
import sSkeletonConfigurationManagerValidation from './SkeletonValidation/SkeletonConfigurationManagerValidation.test';
import sSkeletonFocusManagerValidation from './SkeletonValidation/SkeletonFocusManagerValidation.test';
import sSkeletonInputValidation from './SkeletonValidation/SkeletonInputValidation.test';
import sSkeletonKeyCodeValidation from './SkeletonValidation/SkeletonKeyCodeValidation.test';
import sSkeletonLoggerValidation from './SkeletonValidation/SkeletonLoggerValidation.test';
import sSkeletonPointerValidation from './SkeletonValidation/SkeletonPointerValidation.test';
import sSkeletonResourceLoaderValidation from './SkeletonValidation/SkeletonResourceLoaderValidation.test';
import sSkeletonStateManagerValidation from './SkeletonValidation/SkeletonStateManagerValidation.test';

// Suites in Interaction
import iTabAccessibilityNavigation from './Interaction/TabAccessibilityNavigation.test';
import iTabButtonInteraction from './Interaction/TabButtonInteraction.test';
import iTabComponentRendering from './Interaction/TabComponentRendering.test';
import iTabContentScaling from './Interaction/TabContentScaling.test';
import iTabDataBinding from './Interaction/TabDataBinding.test';
import iTabEventHandling from './Interaction/TabEventHandling.test';
import iTabEventPropagation from './Interaction/TabEventPropagation.test';
import iTabFocusNavigation from './Interaction/TabFocusNavigation.test';
import iTabFocusRingBehavior from './Interaction/TabFocusRingBehavior.test';
import iTabGestureRecognition from './Interaction/TabGestureRecognition.test';
import iTabPositioning from './Interaction/TabPositioning.test';
import iTabThemeVariation from './Interaction/TabThemeVariation.test';
import iTabTouchInteraction from './Interaction/TabTouchInteraction.test';
import iTabVisualEffects from './Interaction/TabVisualEffects.test';

// Suites in LifecycleState
import lTabConfigurationChanges from './LifecycleState/TabConfigurationChanges.test';
import lTabExceptionHandling from './LifecycleState/TabExceptionHandling.test';
import lTabExtensionLifecycle from './LifecycleState/TabExtensionLifecycle.test';
import lTabIndicatorLifecycle from './LifecycleState/TabIndicatorLifecycle.test';
import lTabResourceManagement from './LifecycleState/TabResourceManagement.test';
import lTabSessionManagement from './LifecycleState/TabSessionManagement.test';
import lTabStateErrorRecovery from './LifecycleState/TabStateErrorRecovery.test';
import lTabStatePersistence from './LifecycleState/TabStatePersistence.test';
import lTabStateRecovery from './LifecycleState/TabStateRecovery.test';
import lTabStateTransitions from './LifecycleState/TabStateTransitions.test';

// Suites in PerformanceStability
import pTabAnimationPerformance from './PerformanceStability/TabAnimationPerformance.test';
import pTabConcurrencyControl from './PerformanceStability/TabConcurrencyControl.test';
import pTabLongTermStability from './PerformanceStability/TabLongTermStability.test';
import pTabMemoryStability from './PerformanceStability/TabMemoryStability.test';
import pTabPerformanceStress from './PerformanceStability/TabPerformanceStress.test';
import pTabPowerConsumption from './PerformanceStability/TabPowerConsumption.test';
import pTabPowerPerformance from './PerformanceStability/TabPowerPerformance.test';

// Suites in Integration
import iResourceContract from './Integration/ResourceContract.test';
import iTabAdvancedScenarios from './Integration/TabAdvancedScenarios.test';
import iTabComprehensiveRegression from './Integration/TabComprehensiveRegression.test';
import iTabDeviceCompatibility from './Integration/TabDeviceCompatibility.test';
import iTabIntegrationTesting from './Integration/TabIntegrationTesting.test';
import iTabLocalizationTesting from './Integration/TabLocalizationTesting.test';
import iTabNetworkConnectivity from './Integration/TabNetworkConnectivity.test';
import iTabPlatformCompatibility from './Integration/TabPlatformCompatibility.test';
import iTabSystemIntegration from './Integration/TabSystemIntegration.test';
import iTabUserScenarios from './Integration/TabUserScenarios.test';

// Suites in Security
import sTabSecurity from './Security/TabSecurity.test';
import sTabSecurityAccessibility from './Security/TabSecurityAccessibility.test';
import sTabSecurityValidation from './Security/TabSecurityValidation.test';

export default function testsuite(): void {
  abilityTest();
  tTabConcurrency();
  tTabConsistency();
  tTabEndToEnd();
  tTabErrorRecovery();
  tTabInputInteraction();
  tTabItemInfoModel();
  tTabLifecycle();
  tTabMenuConfiguration();
  tTabModelDeep();
  tTabOperationCatalog();
  tTabOperationFlow();
  tTabOperations();
  tTabOperationWorkflow();
  tTabStateManagement();
  tTabStress();
  tTabSurfaceModel();
  tTabAppVersion();
  tTabAuthSession();
  tTabDataSourceValidation();
  tTabEventToolValidation();
  tTabInterruptionRecovery();
  tTabNotification();
  tTabOfflineNetwork();
  tTabSessionValidation();
  sSkeletonAnimationControllerValidation();
  sSkeletonBoundaryErrorTesting();
  sSkeletonCommonEventValidation();
  sSkeletonConfigurationManagerValidation();
  sSkeletonFocusManagerValidation();
  sSkeletonInputValidation();
  sSkeletonKeyCodeValidation();
  sSkeletonLoggerValidation();
  sSkeletonPointerValidation();
  sSkeletonResourceLoaderValidation();
  sSkeletonStateManagerValidation();
  iTabAccessibilityNavigation();
  iTabButtonInteraction();
  iTabComponentRendering();
  iTabContentScaling();
  iTabDataBinding();
  iTabEventHandling();
  iTabEventPropagation();
  iTabFocusNavigation();
  iTabFocusRingBehavior();
  iTabGestureRecognition();
  iTabPositioning();
  iTabThemeVariation();
  iTabTouchInteraction();
  iTabVisualEffects();
  lTabConfigurationChanges();
  lTabExceptionHandling();
  lTabExtensionLifecycle();
  lTabIndicatorLifecycle();
  lTabResourceManagement();
  lTabSessionManagement();
  lTabStateErrorRecovery();
  lTabStatePersistence();
  lTabStateRecovery();
  lTabStateTransitions();
  pTabAnimationPerformance();
  pTabConcurrencyControl();
  pTabLongTermStability();
  pTabMemoryStability();
  pTabPerformanceStress();
  pTabPowerConsumption();
  pTabPowerPerformance();
  iResourceContract();
  iTabAdvancedScenarios();
  iTabComprehensiveRegression();
  iTabDeviceCompatibility();
  iTabIntegrationTesting();
  iTabLocalizationTesting();
  iTabNetworkConnectivity();
  iTabPlatformCompatibility();
  iTabSystemIntegration();
  iTabUserScenarios();
  sTabSecurity();
  sTabSecurityAccessibility();
  sTabSecurityValidation();
}

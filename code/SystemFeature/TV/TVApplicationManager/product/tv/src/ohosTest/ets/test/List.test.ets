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

import appManagerHomeUITest from './appManagement/AppManagerHomeUI.test';
import appUninstallOperationTest from './appManagement/AppUninstallOperation.test';
import abilityLifecycleTest from './lifecycle/AbilityLifecycle.test';
import eventHandlingTest from './uiInteraction/EventHandling.test';
import performanceStressTest from './performance/PerformanceStress.test';
import integrationTestingTest from './integration/IntegrationTesting.test';
import boundaryErrorTestingTest from './errorHandling/BoundaryErrorTesting.test';
import securityScreenReaderTest from './security/SecurityScreenReader.test';
import comprehensiveRegressionTest from './performance/ComprehensiveRegression.test';
import advancedScenariosTest from './integration/AdvancedScenarios.test';
import appListItemModelTest from './appList/AppListItemModel.test';
import keyCodeValidationTest from './uiInteraction/KeyCodeValidation.test';
import loggerValidationTest from './logging/LoggerValidation.test';
import cursorPointerValidationTest from './uiInteraction/CursorPointerValidation.test';
import shortcutCommonEventValidationTest from './appManagement/ShortcutCommonEventValidation.test';
import configurationManagerValidationTest from './configuration/ConfigurationManagerValidation.test';
import gridFocusManagerValidationTest from './uiInteraction/GridFocusManagerValidation.test';
import menuDialogStateManagerValidationTest from './menuDialog/MenuDialogStateManagerValidation.test';
import appIconResourceLoaderValidationTest from './appManagement/AppIconResourceLoaderValidation.test';
import animationControllerValidationTest from './animationVisual/AnimationControllerValidation.test';
import gridFocusNavigationTest from './uiInteraction/GridFocusNavigation.test';
import touchInteractionTest from './uiInteraction/TouchInteraction.test';
import menuDialogStateManagementTest from './menuDialog/MenuDialogStateManagement.test';
import appOperationFlowTest from './appManagement/AppOperationFlow.test';
import appGridRenderingTest from './appList/AppGridRendering.test';
import abilitySessionManagementTest from './lifecycle/AbilitySessionManagement.test';
import errorRecoveryTest from './errorHandling/ErrorRecovery.test';
import screenReaderNavigationTest from './security/ScreenReaderNavigation.test';
import visualEffectsTest from './animationVisual/VisualEffects.test';
import dataBindingTest from './integration/DataBinding.test';
import concurrencyControlTest from './concurrency/ConcurrencyControl.test';
import appIconNameResourceManagementTest from './appManagement/AppIconNameResourceManagement.test';
import configurationChangesTest from './configuration/ConfigurationChanges.test';
import userScenariosTest from './integration/UserScenarios.test';
import memoryLeakDetectionTest from './performance/MemoryLeakDetection.test';
import longTermStabilityTest from './performance/LongTermStability.test';
import systemIntegrationTest from './integration/SystemIntegration.test';
import appCacheConnectivityTest from './network/AppCacheConnectivity.test';
import deviceCompatibilityTest from './configuration/DeviceCompatibility.test';
import appListPerformanceTest from './appList/AppListPerformance.test';
import appPermissionValidationTest from './security/AppPermissionValidation.test';
import animationPerformanceTest from './performance/AnimationPerformance.test';
import appListPersistenceTest from './appList/AppListPersistence.test';
import inputValidationTest from './uiInteraction/InputValidation.test';
import exceptionHandlingTest from './errorHandling/ExceptionHandling.test';
import localizationTestingTest from './configuration/LocalizationTesting.test';
import themeVariationTest from './configuration/ThemeVariation.test';
import gestureRecognitionTest from './uiInteraction/GestureRecognition.test';
import menuDialogPositioningTest from './menuDialog/MenuDialogPositioning.test';
import contentScalingTest from './configuration/ContentScaling.test';
import appFocusHighlightTest from './uiInteraction/AppFocusHighlight.test';
import buttonInteractionTest from './uiInteraction/ButtonInteraction.test';
import menuDialogLifecycleTest from './menuDialog/MenuDialogLifecycle.test';
import eventPropagationTest from './uiInteraction/EventPropagation.test';
import appListRecoveryTest from './appList/AppListRecovery.test';
import appListLoadingTest from './appList/AppListLoading.test';
import appLaunchTest from './appManagement/AppLaunch.test';
import appUninstallTest from './appManagement/AppUninstall.test';
import appMoveTest from './appManagement/AppMove.test';
import appShortcutTest from './appManagement/AppShortcut.test';
import gridInteractionTest from './uiInteraction/GridInteraction.test';
import uiVisualTest from './animationVisual/UIVisual.test';
import compatibilityTest from './configuration/Compatibility.test';
import performanceStabilityTest from './performance/PerformanceStability.test';
import securityPermissionTest from './security/SecurityPermission.test';
import interruptNetworkTest from './network/InterruptNetwork.test';
import appListDataSourceTest from './appList/AppListDataSource.test';
import appItemBeanTest from './appList/AppItemBean.test';
import appOperationMenuTest from './appManagement/AppOperationMenu.test';
import appOperationCatalogTest from './appManagement/AppOperationCatalog.test';
import appNavigationTest from './appManagement/AppNavigation.test';
import appConcurrencyTest from './concurrency/AppConcurrency.test';
import appPermissionTest from './security/AppPermission.test';
import appUtilToolsTest from './appList/AppUtilTools.test';
import realModuleTest from './integration/RealModule.test';

export default function testsuite(): void {
  appManagerHomeUITest();
  appUninstallOperationTest();
  abilityLifecycleTest();
  eventHandlingTest();
  performanceStressTest();
  integrationTestingTest();
  boundaryErrorTestingTest();
  securityScreenReaderTest();
  comprehensiveRegressionTest();
  advancedScenariosTest();
  appListItemModelTest();
  keyCodeValidationTest();
  loggerValidationTest();
  cursorPointerValidationTest();
  shortcutCommonEventValidationTest();
  configurationManagerValidationTest();
  gridFocusManagerValidationTest();
  menuDialogStateManagerValidationTest();
  appIconResourceLoaderValidationTest();
  animationControllerValidationTest();
  gridFocusNavigationTest();
  touchInteractionTest();
  menuDialogStateManagementTest();
  appOperationFlowTest();
  appGridRenderingTest();
  abilitySessionManagementTest();
  errorRecoveryTest();
  screenReaderNavigationTest();
  visualEffectsTest();
  dataBindingTest();
  concurrencyControlTest();
  appIconNameResourceManagementTest();
  configurationChangesTest();
  userScenariosTest();
  memoryLeakDetectionTest();
  longTermStabilityTest();
  systemIntegrationTest();
  appCacheConnectivityTest();
  deviceCompatibilityTest();
  appListPerformanceTest();
  appPermissionValidationTest();
  animationPerformanceTest();
  appListPersistenceTest();
  inputValidationTest();
  exceptionHandlingTest();
  localizationTestingTest();
  themeVariationTest();
  gestureRecognitionTest();
  menuDialogPositioningTest();
  contentScalingTest();
  appFocusHighlightTest();
  buttonInteractionTest();
  menuDialogLifecycleTest();
  eventPropagationTest();
  appListRecoveryTest();
  appListLoadingTest();
  appLaunchTest();
  appUninstallTest();
  appMoveTest();
  appShortcutTest();
  gridInteractionTest();
  uiVisualTest();
  compatibilityTest();
  performanceStabilityTest();
  securityPermissionTest();
  interruptNetworkTest();
  appListDataSourceTest();
  appItemBeanTest();
  appOperationMenuTest();
  appOperationCatalogTest();
  appNavigationTest();
  appConcurrencyTest();
  appPermissionTest();
  appUtilToolsTest();
  realModuleTest();
}


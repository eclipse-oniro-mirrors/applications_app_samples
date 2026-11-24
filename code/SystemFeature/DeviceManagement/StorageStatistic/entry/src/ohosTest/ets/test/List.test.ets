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
import appInfoPageTest from './StorageCore/AppInfoPage.test';
import checkEmptyUtilsCoreTest from './StorageCore/CheckEmptyUtilsCore.test';
import mainPageTest from './StorageCore/MainPage.test';
import parseDataCoreTest from './StorageCore/ParseDataCore.test';
import queryStorageDataCoreTest from './StorageCore/QueryStorageDataCore.test';
import queryVolumeDataCoreTest from './StorageCore/QueryVolumeDataCore.test';
import storageCategoryCatalogTest from './StorageCore/StorageCategoryCatalog.test';
import storageCategoryConfigurationTest from './StorageCore/StorageCategoryConfiguration.test';
import storageConstCoreTest from './StorageCore/StorageConstCore.test';
import storageDataConsistencyTest from './StorageCore/StorageDataConsistency.test';
import storageDataFlowTest from './StorageCore/StorageDataFlow.test';
import storageInitializationConcurrencyTest from './StorageCore/StorageInitializationConcurrency.test';
import storageItemModelTest from './StorageCore/StorageItemModel.test';
import storageListInteractionTest from './StorageCore/StorageListInteraction.test';
import storageListPageTest from './StorageCore/StorageListPage.test';
import storageModelContractTest from './StorageCore/StorageModelContract.test';
import storageModelDeepTest from './StorageCore/StorageModelDeep.test';
import storageOperationsTest from './StorageCore/StorageOperations.test';
import storagePageUITest from './StorageCore/StoragePageUI.test';
import storageQueryWorkflowTest from './StorageCore/StorageQueryWorkflow.test';
import storageStatisticEndToEndTest from './StorageCore/StorageStatisticEndToEnd.test';
import storageStatisticErrorRecoveryTest from './StorageCore/StorageStatisticErrorRecovery.test';
import storageStatisticLifecycleTest from './StorageCore/StorageStatisticLifecycle.test';
import storageStatisticStateManagementTest from './StorageCore/StorageStatisticStateManagement.test';
import storageStatisticStressTest from './StorageCore/StorageStatisticStress.test';
import volumeListPageTest from './StorageCore/VolumeListPage.test';
import advancedScenariosTest from './StorageIntegration/AdvancedScenarios.test';
import comprehensiveRegressionTest from './StorageIntegration/ComprehensiveRegression.test';
import deviceCompatibilityTest from './StorageIntegration/DeviceCompatibility.test';
import integrationTestingTest from './StorageIntegration/IntegrationTesting.test';
import localizationTestingTest from './StorageIntegration/LocalizationTesting.test';
import networkStateHandlingTest from './StorageIntegration/NetworkStateHandling.test';
import storageCompatibilityTest from './StorageIntegration/StorageCompatibility.test';
import systemIntegrationTest from './StorageIntegration/SystemIntegration.test';
import userScenariosTest from './StorageIntegration/UserScenarios.test';
import accessibilityNavigationTest from './StorageInteraction/AccessibilityNavigation.test';
import buttonInteractionTest from './StorageInteraction/ButtonInteraction.test';
import contentScalingTest from './StorageInteraction/ContentScaling.test';
import dataBindingTest from './StorageInteraction/DataBinding.test';
import eventHandlingTest from './StorageInteraction/EventHandling.test';
import eventPropagationTest from './StorageInteraction/EventPropagation.test';
import focusNavigationTest from './StorageInteraction/FocusNavigation.test';
import focusRingBehaviorTest from './StorageInteraction/FocusRingBehavior.test';
import gestureRecognitionTest from './StorageInteraction/GestureRecognition.test';
import layoutPositioningTest from './StorageInteraction/LayoutPositioning.test';
import themeVariationTest from './StorageInteraction/ThemeVariation.test';
import touchInteractionTest from './StorageInteraction/TouchInteraction.test';
import uIComponentRenderingTest from './StorageInteraction/UIComponentRendering.test';
import visualEffectsTest from './StorageInteraction/VisualEffects.test';
import applicationStageLifecycleTest from './StorageLifecycle/ApplicationStageLifecycle.test';
import configurationChangesTest from './StorageLifecycle/ConfigurationChanges.test';
import errorRecoveryTest from './StorageLifecycle/ErrorRecovery.test';
import exceptionHandlingTest from './StorageLifecycle/ExceptionHandling.test';
import pageLifecycleTest from './StorageLifecycle/PageLifecycle.test';
import querySessionManagementTest from './StorageLifecycle/QuerySessionManagement.test';
import resourceManagementTest from './StorageLifecycle/ResourceManagement.test';
import statePersistenceTest from './StorageLifecycle/StatePersistence.test';
import stateRecoveryTest from './StorageLifecycle/StateRecovery.test';
import storageStateManagementTest from './StorageLifecycle/StorageStateManagement.test';
import concurrencyControlTest from './StoragePerformance/ConcurrencyControl.test';
import dataPanelRenderPerformanceTest from './StoragePerformance/DataPanelRenderPerformance.test';
import longTermStabilityTest from './StoragePerformance/LongTermStability.test';
import memoryLeakDetectionTest from './StoragePerformance/MemoryLeakDetection.test';
import performanceStressTest from './StoragePerformance/PerformanceStress.test';
import resourceConsumptionTest from './StoragePerformance/ResourceConsumption.test';
import storagePerformanceTest from './StoragePerformance/StoragePerformance.test';
import securityAccessibilityTest from './StorageSecurity/SecurityAccessibility.test';
import securityValidationTest from './StorageSecurity/SecurityValidation.test';
import storageSecurityTest from './StorageSecurity/StorageSecurity.test';
import boundaryErrorTestingTest from './StorageValidation/BoundaryErrorTesting.test';
import commonEventUtilValidationTest from './StorageValidation/CommonEventUtilValidation.test';
import configurationManagerValidationTest from './StorageValidation/ConfigurationManagerValidation.test';
import dataPanelAnimationValidationTest from './StorageValidation/DataPanelAnimationValidation.test';
import inputValidationTest from './StorageValidation/InputValidation.test';
import keyCodeValidationTest from './StorageValidation/KeyCodeValidation.test';
import listFocusManagerValidationTest from './StorageValidation/ListFocusManagerValidation.test';
import loggerValidationTest from './StorageValidation/LoggerValidation.test';
import pointerUtilValidationTest from './StorageValidation/PointerUtilValidation.test';
import resourceLoaderValidationTest from './StorageValidation/ResourceLoaderValidation.test';
import storageAppVersionTest from './StorageValidation/StorageAppVersion.test';
import storageDataSourceValidationTest from './StorageValidation/StorageDataSourceValidation.test';
import storageInterruptionRecoveryTest from './StorageValidation/StorageInterruptionRecovery.test';
import storageNotificationTest from './StorageValidation/StorageNotification.test';
import storageOfflineStateTest from './StorageValidation/StorageOfflineState.test';
import storagePermissionSessionTest from './StorageValidation/StoragePermissionSession.test';
import storageQuerySessionValidationTest from './StorageValidation/StorageQuerySessionValidation.test';
import storageResourceUtilValidationTest from './StorageValidation/StorageResourceUtilValidation.test';
import storageStateManagerValidationTest from './StorageValidation/StorageStateManagerValidation.test';

// Logic, model and utility suites always run.
// Light UI suites only do Driver/ON queries and tolerate an empty window.
// Heavy UI suites are kept compiled but gated: they need the storage page visible
// and can hit 15s timeouts or AAMS 17000001 on this OpenHarmony target.
const RUN_LIGHT_UI_TESTS: boolean = true;
const RUN_HEAVY_UI_TESTS: boolean = true;

export default function testsuite(): void {
  if (RUN_LIGHT_UI_TESTS) {
    abilityTest();
    appInfoPageTest();
    mainPageTest();
    storageListPageTest();
    volumeListPageTest();
  }
  if (RUN_HEAVY_UI_TESTS) {
    storageCategoryCatalogTest();
    storageCategoryConfigurationTest();
    storageDataConsistencyTest();
    storageDataFlowTest();
    storageInitializationConcurrencyTest();
    storageItemModelTest();
    storageListInteractionTest();
    storageModelDeepTest();
    storageOperationsTest();
    storagePageUITest();
    storageQueryWorkflowTest();
    storageStatisticEndToEndTest();
    storageStatisticErrorRecoveryTest();
    storageStatisticLifecycleTest();
    storageStatisticStateManagementTest();
    storageStatisticStressTest();
    advancedScenariosTest();
    comprehensiveRegressionTest();
    deviceCompatibilityTest();
    integrationTestingTest();
    localizationTestingTest();
    networkStateHandlingTest();
    storageCompatibilityTest();
    systemIntegrationTest();
    userScenariosTest();
    accessibilityNavigationTest();
    buttonInteractionTest();
    contentScalingTest();
    dataBindingTest();
    eventHandlingTest();
    eventPropagationTest();
    focusNavigationTest();
    focusRingBehaviorTest();
    gestureRecognitionTest();
    layoutPositioningTest();
    themeVariationTest();
    touchInteractionTest();
    uIComponentRenderingTest();
    visualEffectsTest();
    applicationStageLifecycleTest();
    configurationChangesTest();
    errorRecoveryTest();
    exceptionHandlingTest();
    pageLifecycleTest();
    querySessionManagementTest();
    resourceManagementTest();
    statePersistenceTest();
    stateRecoveryTest();
    storageStateManagementTest();
    concurrencyControlTest();
    dataPanelRenderPerformanceTest();
    longTermStabilityTest();
    memoryLeakDetectionTest();
    performanceStressTest();
    resourceConsumptionTest();
    storagePerformanceTest();
    securityAccessibilityTest();
    securityValidationTest();
    storageSecurityTest();
    boundaryErrorTestingTest();
    commonEventUtilValidationTest();
    configurationManagerValidationTest();
    dataPanelAnimationValidationTest();
    inputValidationTest();
    keyCodeValidationTest();
    listFocusManagerValidationTest();
    loggerValidationTest();
    pointerUtilValidationTest();
    resourceLoaderValidationTest();
    storageAppVersionTest();
    storageDataSourceValidationTest();
    storageInterruptionRecoveryTest();
    storageNotificationTest();
    storageOfflineStateTest();
    storagePermissionSessionTest();
    storageQuerySessionValidationTest();
    storageResourceUtilValidationTest();
    storageStateManagerValidationTest();
  }
  checkEmptyUtilsCoreTest();
  parseDataCoreTest();
  queryStorageDataCoreTest();
  queryVolumeDataCoreTest();
  storageConstCoreTest();
  storageModelContractTest();
}

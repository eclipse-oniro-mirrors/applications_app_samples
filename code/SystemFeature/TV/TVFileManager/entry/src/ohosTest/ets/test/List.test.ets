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
import accessibilityNavigationTest from './Interaction/AccessibilityNavigation.test';
import adaptersDialogsTest001 from './Adapters_Dialogs_Test_001.test';
import adaptersDialogsTest002 from './Adapters_Dialogs_Test_002.test';
import advancedScenariosTest from './Integration/AdvancedScenarios.test';
import animationPerformanceTest from './PerformanceStability/AnimationPerformance.test';
import boundaryEdgeTest001 from './Boundary_Edge_Test_001.test';
import buttonInteractionTest from './Interaction/ButtonInteraction.test';
import comprehensiveBoundaryTest from './Comprehensive_Boundary_Test.test';
import comprehensiveRegressionTest from './Integration/ComprehensiveRegression.test';
import comprehensiveStressTest from './Comprehensive_Stress_Test.test';
import comprehensiveUIStateTest from './Comprehensive_UI_State_Test.test';
import concurrencyControlTest from './PerformanceStability/ConcurrencyControl.test';
import configurationChangesTest from './LifecycleState/ConfigurationChanges.test';
import contentScalingTest from './Interaction/ContentScaling.test';
import dataBindingTest from './Interaction/DataBinding.test';
import dataModelsTest from './DataModels_Test.test';
import deviceCompatibilityTest from './Integration/DeviceCompatibility.test';
import dialogComponentTest from './Dialog_Component_Test.test';
import dialogLifecycleTest from './LifecycleState/DialogLifecycle.test';
import dialogPositioningTest from './Interaction/DialogPositioning.test';
import dialogStateManagementTest from './LifecycleState/DialogStateManagement.test';
import entryAbilityLifecycleTest from './EntryAbility_Lifecycle_Test.test';
import errorRecoveryTest from './LifecycleState/ErrorRecovery.test';
import eventHandlingTest from './Interaction/EventHandling.test';
import eventPropagationTest from './Interaction/EventPropagation.test';
import exceptionHandlingTest from './LifecycleState/ExceptionHandling.test';
import exhaustiveSuffixTest from './Exhaustive_Suffix_Test.test';
import extendedManagersTest from './Extended_Managers_Test.test';
import extensionLifecycleTest from './LifecycleState/ExtensionLifecycle.test';
import fileAccessManagerDeepTest from './FileAccessManager_Deep_Test.test';
import fileAppVersionTest from './FileValidation/FileAppVersion.test';
import fileAuthSessionTest from './FileValidation/FileAuthSession.test';
import fileBeanModelTest from './FileManager/FileBeanModel.test';
import fileCompatibilityTest from './Integration/FileCompatibility.test';
import fileConcurrencyTest from './FileManager/FileConcurrency.test';
import fileConsistencyTest from './FileManager/FileConsistency.test';
import fileDataSourceValidationTest from './FileValidation/FileDataSourceValidation.test';
import fileEndToEndTest from './FileManager/FileEndToEnd.test';
import fileErrorRecoveryTest from './FileManager/FileErrorRecovery.test';
import fileEventToolValidationTest from './FileValidation/FileEventToolValidation.test';
import fileInputInteractionTest from './FileManager/FileInputInteraction.test';
import fileInterruptionRecoveryTest from './FileValidation/FileInterruptionRecovery.test';
import fileListStateMachineTest from './FileList_StateMachine_Test.test';
import fileManagerUITest from './FileManager/FileManagerUI.test';
import fileMenuConfigurationTest from './FileManager/FileMenuConfiguration.test';
import fileModelDeepTest from './FileManager/FileModelDeep.test';
import fileNotificationTest from './FileValidation/FileNotification.test';
import fileOfflineNetworkTest from './FileValidation/FileOfflineNetwork.test';
import fileOperationCatalogTest from './FileManager/FileOperationCatalog.test';
import fileOperationFlowTest from './FileManager/FileOperationFlow.test';
import fileOperationWorkflowTest from './FileManager/FileOperationWorkflow.test';
import fileOperationsTest from './FileManager/FileOperations.test';
import filePageLifecycleTest from './FileManager/FilePageLifecycle.test';
import filePerformanceTest from './PerformanceStability/FilePerformance.test';
import fileSecurityTest from './Security/FileSecurity.test';
import fileSessionValidationTest from './FileValidation/FileSessionValidation.test';
import fileStateManagementTest from './FileManager/FileStateManagement.test';
import fileStressTest from './FileManager/FileStress.test';
import fileTaskPoolTest from './FileTaskPool_Test.test';
import fileUtilTest from './FileUtil_Test.test';
import focusNavigationTest from './Interaction/FocusNavigation.test';
import focusRingBehaviorTest from './Interaction/FocusRingBehavior.test';
import gestureRecognitionTest from './Interaction/GestureRecognition.test';
import indexLifecycleTest from './Index_Lifecycle_Test.test';
import integrationTestingTest from './Integration/IntegrationTesting.test';
import localizationTestingTest from './Integration/LocalizationTesting.test';
import longTermStabilityTest from './PerformanceStability/LongTermStability.test';
import managersAdvTest from './Managers_Adv_Test.test';
import managersCoreTest001 from './Managers_Core_Test_001.test';
import managersCoreTest002 from './Managers_Core_Test_002.test';
import memoryLeakDetectionTest from './PerformanceStability/MemoryLeakDetection.test';
import mockStubTest from './Mock_Stub_Test.test';
import navPathStackDeepTest from './NavPathStack_Deep_Test.test';
import networkConnectivityTest from './Integration/NetworkConnectivity.test';
import pageLifecycleTest from './LifecycleState/PageLifecycle.test';
import pageStateManagementTest from './LifecycleState/PageStateManagement.test';
import parameterizedDataDriveTest from './Parameterized_DataDrive_Test.test';
import performanceStressTest from './PerformanceStability/PerformanceStress.test';
import permissionGrantTest from './Interaction/PermissionGrant.test';
import permissionModelTest from './Permission_Model_Test.test';
import resourceManagementTest from './LifecycleState/ResourceManagement.test';
import securityAccessibilityTest from './Security/SecurityAccessibility.test';
import securityCompatTest from './Security_Compat_Test.test';
import securityValidationTest from './Security/SecurityValidation.test';
import sessionManagementTest from './LifecycleState/SessionManagement.test';
import shareWorkflowTest from './Share_Workflow_Test.test';
import statePersistenceTest from './LifecycleState/StatePersistence.test';
import stateRecoveryTest from './LifecycleState/StateRecovery.test';
import storagePerformanceTest from './PerformanceStability/StoragePerformance.test';
import stressMockTest001 from './Stress_Mock_Test_001.test';
import systemIntegrationTest from './Integration/SystemIntegration.test';
import themeVariationTest from './Interaction/ThemeVariation.test';
import touchInteractionTest from './Interaction/TouchInteraction.test';
import uIComponentRenderingTest from './Interaction/UIComponentRendering.test';
import userScenariosTest from './Integration/UserScenarios.test';
import utilsTest001 from './Utils_Test_001.test';
import utilsTest002 from './Utils_Test_002.test';
import visualEffectsTest from './Interaction/VisualEffects.test';

export const testsuiteGroups: Array<() => void> = [
  abilityTest,
  accessibilityNavigationTest,
  adaptersDialogsTest001,
  adaptersDialogsTest002,
  advancedScenariosTest,
  animationPerformanceTest,
  boundaryEdgeTest001,
  buttonInteractionTest,
  comprehensiveBoundaryTest,
  comprehensiveRegressionTest,
  comprehensiveStressTest,
  comprehensiveUIStateTest,
  concurrencyControlTest,
  configurationChangesTest,
  contentScalingTest,
  dataBindingTest,
  dataModelsTest,
  deviceCompatibilityTest,
  dialogComponentTest,
  dialogLifecycleTest,
  dialogPositioningTest,
  dialogStateManagementTest,
  entryAbilityLifecycleTest,
  errorRecoveryTest,
  eventHandlingTest,
  eventPropagationTest,
  exceptionHandlingTest,
  exhaustiveSuffixTest,
  extendedManagersTest,
  extensionLifecycleTest,
  fileAccessManagerDeepTest,
  fileAppVersionTest,
  fileAuthSessionTest,
  fileBeanModelTest,
  fileCompatibilityTest,
  fileConcurrencyTest,
  fileConsistencyTest,
  fileDataSourceValidationTest,
  fileEndToEndTest,
  fileErrorRecoveryTest,
  fileEventToolValidationTest,
  fileInputInteractionTest,
  fileInterruptionRecoveryTest,
  fileListStateMachineTest,
  fileManagerUITest,
  fileMenuConfigurationTest,
  fileModelDeepTest,
  fileNotificationTest,
  fileOfflineNetworkTest,
  fileOperationCatalogTest,
  fileOperationFlowTest,
  fileOperationWorkflowTest,
  fileOperationsTest,
  filePageLifecycleTest,
  filePerformanceTest,
  fileSecurityTest,
  fileSessionValidationTest,
  fileStateManagementTest,
  fileStressTest,
  fileTaskPoolTest,
  fileUtilTest,
  focusNavigationTest,
  focusRingBehaviorTest,
  gestureRecognitionTest,
  indexLifecycleTest,
  integrationTestingTest,
  localizationTestingTest,
  longTermStabilityTest,
  managersAdvTest,
  managersCoreTest001,
  managersCoreTest002,
  memoryLeakDetectionTest,
  mockStubTest,
  navPathStackDeepTest,
  networkConnectivityTest,
  pageLifecycleTest,
  pageStateManagementTest,
  parameterizedDataDriveTest,
  performanceStressTest,
  permissionGrantTest,
  permissionModelTest,
  resourceManagementTest,
  securityAccessibilityTest,
  securityCompatTest,
  securityValidationTest,
  sessionManagementTest,
  shareWorkflowTest,
  statePersistenceTest,
  stateRecoveryTest,
  storagePerformanceTest,
  stressMockTest001,
  systemIntegrationTest,
  themeVariationTest,
  touchInteractionTest,
  uIComponentRenderingTest,
  userScenariosTest,
  utilsTest001,
  utilsTest002,
  visualEffectsTest,
];

export default function testsuite(): void {
  abilityTest();
  accessibilityNavigationTest();
  adaptersDialogsTest001();
  adaptersDialogsTest002();
  advancedScenariosTest();
  animationPerformanceTest();
  boundaryEdgeTest001();
  buttonInteractionTest();
  comprehensiveBoundaryTest();
  comprehensiveRegressionTest();
  comprehensiveStressTest();
  comprehensiveUIStateTest();
  concurrencyControlTest();
  configurationChangesTest();
  contentScalingTest();
  dataBindingTest();
  dataModelsTest();
  deviceCompatibilityTest();
  dialogComponentTest();
  dialogLifecycleTest();
  dialogPositioningTest();
  dialogStateManagementTest();
  entryAbilityLifecycleTest();
  errorRecoveryTest();
  eventHandlingTest();
  eventPropagationTest();
  exceptionHandlingTest();
  exhaustiveSuffixTest();
  extendedManagersTest();
  extensionLifecycleTest();
  fileAccessManagerDeepTest();
  fileAppVersionTest();
  fileAuthSessionTest();
  fileBeanModelTest();
  fileCompatibilityTest();
  fileConcurrencyTest();
  fileConsistencyTest();
  fileDataSourceValidationTest();
  fileEndToEndTest();
  fileErrorRecoveryTest();
  fileEventToolValidationTest();
  fileInputInteractionTest();
  fileInterruptionRecoveryTest();
  fileListStateMachineTest();
  fileManagerUITest();
  fileMenuConfigurationTest();
  fileModelDeepTest();
  fileNotificationTest();
  fileOfflineNetworkTest();
  fileOperationCatalogTest();
  fileOperationFlowTest();
  fileOperationWorkflowTest();
  fileOperationsTest();
  filePageLifecycleTest();
  filePerformanceTest();
  fileSecurityTest();
  fileSessionValidationTest();
  fileStateManagementTest();
  fileStressTest();
  fileTaskPoolTest();
  fileUtilTest();
  focusNavigationTest();
  focusRingBehaviorTest();
  gestureRecognitionTest();
  indexLifecycleTest();
  integrationTestingTest();
  localizationTestingTest();
  longTermStabilityTest();
  managersAdvTest();
  managersCoreTest001();
  managersCoreTest002();
  memoryLeakDetectionTest();
  mockStubTest();
  navPathStackDeepTest();
  networkConnectivityTest();
  pageLifecycleTest();
  pageStateManagementTest();
  parameterizedDataDriveTest();
  performanceStressTest();
  permissionGrantTest();
  permissionModelTest();
  resourceManagementTest();
  securityAccessibilityTest();
  securityCompatTest();
  securityValidationTest();
  sessionManagementTest();
  shareWorkflowTest();
  statePersistenceTest();
  stateRecoveryTest();
  storagePerformanceTest();
  stressMockTest001();
  systemIntegrationTest();
  themeVariationTest();
  touchInteractionTest();
  uIComponentRenderingTest();
  userScenariosTest();
  utilsTest001();
  utilsTest002();
  visualEffectsTest();
}

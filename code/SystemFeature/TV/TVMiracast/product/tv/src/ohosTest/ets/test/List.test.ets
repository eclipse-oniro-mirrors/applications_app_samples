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

// ===== Miracast XTS suite registry =====
// Every *.test.ets file under ohosTest/ets/test is registered here and invoked
// from testsuite(). Shared helpers under test/Shared are intentionally excluded
// because they are driver utilities, not hypium test suites.

// ----- Ability: Ability identity and configuration logic suites -----
// Ability: TvAbility, ConfigData, PermissionType and ServiceExt request logic check
import abilitySuite from './Ability.test';

// ----- Miracast: Core cast session, mirror player and operation flow suites -----
// MiracastConcurrency: Miracast Concurrency check
import miracastConcurrencySuite from './Miracast/MiracastConcurrency.test';

// MiracastConsistency: Miracast Consistency check
import miracastConsistencySuite from './Miracast/MiracastConsistency.test';

// MiracastEndToEnd: Miracast End To End check
import miracastEndToEndSuite from './Miracast/MiracastEndToEnd.test';

// MiracastErrorRecovery: Miracast Error Recovery check
import miracastErrorRecoverySuite from './Miracast/MiracastErrorRecovery.test';

// MiracastInputInteraction: Miracast Input Interaction check
import miracastInputInteractionSuite from './Miracast/MiracastInputInteraction.test';

// MiracastItemInfoModel: Miracast Item Info Model check
import miracastItemInfoModelSuite from './Miracast/MiracastItemInfoModel.test';

// MiracastLifecycle: Miracast Lifecycle check
import miracastLifecycleSuite from './Miracast/MiracastLifecycle.test';

// MiracastMenuConfiguration: Miracast Menu Configuration check
import miracastMenuConfigurationSuite from './Miracast/MiracastMenuConfiguration.test';

// MiracastModelDeep: Miracast Model Deep check
import miracastModelDeepSuite from './Miracast/MiracastModelDeep.test';

// MiracastOperationCatalog: Miracast Operation Catalog check
import miracastOperationCatalogSuite from './Miracast/MiracastOperationCatalog.test';

// MiracastOperationFlow: Miracast Operation Flow check
import miracastOperationFlowSuite from './Miracast/MiracastOperationFlow.test';

// MiracastOperations: Miracast Operations check
import miracastOperationsSuite from './Miracast/MiracastOperations.test';

// MiracastOperationWorkflow: Miracast Operation Workflow check
import miracastOperationWorkflowSuite from './Miracast/MiracastOperationWorkflow.test';

// MiracastStateManagement: Miracast State Management check
import miracastStateManagementSuite from './Miracast/MiracastStateManagement.test';

// MiracastStress: Miracast Stress check
import miracastStressSuite from './Miracast/MiracastStress.test';

// MiracastUI: Miracast UI check
import miracastUISuite from './Miracast/MiracastUI.test';

// ----- MiracastValidation: Miracast payload, session and notification validation suites -----
// MiracastAppVersion: Miracast App Version check
import miracastAppVersionSuite from './MiracastValidation/MiracastAppVersion.test';

// MiracastAuthSession: Miracast Auth Session check
import miracastAuthSessionSuite from './MiracastValidation/MiracastAuthSession.test';

// MiracastDataSourceValidation: Miracast Data Source Validation check
import miracastDataSourceValidationSuite from './MiracastValidation/MiracastDataSourceValidation.test';

// MiracastEventToolValidation: Miracast Event Tool Validation check
import miracastEventToolValidationSuite from './MiracastValidation/MiracastEventToolValidation.test';

// MiracastInterruptionRecovery: Miracast Interruption Recovery check
import miracastInterruptionRecoverySuite from './MiracastValidation/MiracastInterruptionRecovery.test';

// MiracastNotification: Miracast Notification check
import miracastNotificationSuite from './MiracastValidation/MiracastNotification.test';

// MiracastOfflineNetwork: Miracast Offline Network check
import miracastOfflineNetworkSuite from './MiracastValidation/MiracastOfflineNetwork.test';

// MiracastSessionValidation: Miracast Session Validation check
import miracastSessionValidationSuite from './MiracastValidation/MiracastSessionValidation.test';

// ----- Integration: Cross capability integration and compatibility suites -----
// AdvancedScenarios: Advanced Scenarios check
import advancedScenariosSuite from './Integration/AdvancedScenarios.test';

// ComprehensiveRegression: Comprehensive Regression check
import comprehensiveRegressionSuite from './Integration/ComprehensiveRegression.test';

// DeviceCompatibility: Device Compatibility check
import deviceCompatibilitySuite from './Integration/DeviceCompatibility.test';

// IntegrationTesting: Integration Testing check
import integrationTestingSuite from './Integration/IntegrationTesting.test';

// LocalizationTesting: Localization Testing check
import localizationTestingSuite from './Integration/LocalizationTesting.test';

// MiracastCompatibility: Miracast Compatibility check
import miracastCompatibilitySuite from './Integration/MiracastCompatibility.test';

// NetworkConnectivity: Network Connectivity check
import networkConnectivitySuite from './Integration/NetworkConnectivity.test';

// SystemIntegration: System Integration check
import systemIntegrationSuite from './Integration/SystemIntegration.test';

// UserScenarios: User Scenarios check
import userScenariosSuite from './Integration/UserScenarios.test';

// ----- Interaction: Remote control, focus, touch and rendering interaction suites -----
// BarrierFreeNavigation: BarrierFree Navigation check
import barrierFreeNavigationSuite from './Interaction/BarrierFreeNavigation.test';

// ButtonInteraction: Button Interaction check
import buttonInteractionSuite from './Interaction/ButtonInteraction.test';

// ContentScaling: Content Scaling check
import contentScalingSuite from './Interaction/ContentScaling.test';

// DataBinding: Data Binding check
import dataBindingSuite from './Interaction/DataBinding.test';

// EventHandling: Event Handling check
import eventHandlingSuite from './Interaction/EventHandling.test';

// EventPropagation: Event Propagation check
import eventPropagationSuite from './Interaction/EventPropagation.test';

// FocusNavigation: Focus Navigation check
import focusNavigationSuite from './Interaction/FocusNavigation.test';

// FocusRingBehavior: Focus Ring Behavior check
import focusRingBehaviorSuite from './Interaction/FocusRingBehavior.test';

// GestureRecognition: Gesture Recognition check
import gestureRecognitionSuite from './Interaction/GestureRecognition.test';

// SessionPositioning: Session Positioning check
import sessionPositioningSuite from './Interaction/SessionPositioning.test';

// ThemeVariation: Theme Variation check
import themeVariationSuite from './Interaction/ThemeVariation.test';

// TouchInteraction: Touch Interaction check
import touchInteractionSuite from './Interaction/TouchInteraction.test';

// UIComponentRendering: UI Component Rendering check
import uiComponentRenderingSuite from './Interaction/UIComponentRendering.test';

// VisualEffects: Visual Effects check
import visualEffectsSuite from './Interaction/VisualEffects.test';

// ----- LifecycleState: Ability, service extension and session lifecycle suites -----
// ConfigurationChanges: Configuration Changes check
import configurationChangesSuite from './LifecycleState/ConfigurationChanges.test';

// ErrorRecovery: Error Recovery check
import errorRecoverySuite from './LifecycleState/ErrorRecovery.test';

// ExceptionHandling: Exception Handling check
import exceptionHandlingSuite from './LifecycleState/ExceptionHandling.test';

// ExtensionLifecycle: Extension Lifecycle check
import extensionLifecycleSuite from './LifecycleState/ExtensionLifecycle.test';

// ResourceManagement: Resource Management check
import resourceManagementSuite from './LifecycleState/ResourceManagement.test';

// SessionLifecycle: Session Lifecycle check
import sessionLifecycleSuite from './LifecycleState/SessionLifecycle.test';

// SessionManagement: Session Management check
import sessionManagementSuite from './LifecycleState/SessionManagement.test';

// SessionStateManagement: Session State Management check
import sessionStateManagementSuite from './LifecycleState/SessionStateManagement.test';

// StatePersistence: State Persistence check
import statePersistenceSuite from './LifecycleState/StatePersistence.test';

// StateRecovery: State Recovery check
import stateRecoverySuite from './LifecycleState/StateRecovery.test';

// ----- PerformanceStability: Performance, stress and long term stability suites -----
// AnimationPerformance: Animation Performance check
import animationPerformanceSuite from './PerformanceStability/AnimationPerformance.test';

// ConcurrencyControl: Concurrency Control check
import concurrencyControlSuite from './PerformanceStability/ConcurrencyControl.test';

// LongTermStability: Long Term Stability check
import longTermStabilitySuite from './PerformanceStability/LongTermStability.test';

// MemoryLeakDetection: Memory Leak Detection check
import memoryLeakDetectionSuite from './PerformanceStability/MemoryLeakDetection.test';

// MiracastConsumption: Miracast Consumption check
import miracastConsumptionSuite from './PerformanceStability/MiracastConsumption.test';

// MiracastPerformance: Miracast Performance check
import miracastPerformanceSuite from './PerformanceStability/MiracastPerformance.test';

// PerformanceStress: Performance Stress check
import performanceStressSuite from './PerformanceStability/PerformanceStress.test';

// ----- Security: Permission, trust device and security validation suites -----
// MiracastSecurity: Miracast Security check
import miracastSecuritySuite from './Security/MiracastSecurity.test';

// SecurityBarrierFree: Security BarrierFree check
import securityBarrierFreeSuite from './Security/SecurityBarrierFree.test';

// SecurityValidation: Security Validation check
import securityValidationSuite from './Security/SecurityValidation.test';

// ----- Validation: Utility and input validation suites -----
// AnimationControllerValidation: Animation Controller Validation check
import animationControllerValidationSuite from './Validation/AnimationControllerValidation.test';

// BoundaryErrorTesting: Boundary Error Testing check
import boundaryErrorTestingSuite from './Validation/BoundaryErrorTesting.test';

// CommonEventUtilValidation: Common Event Util Validation check
import commonEventUtilValidationSuite from './Validation/CommonEventUtilValidation.test';

// ConfigurationManagerValidation: Configuration Manager Validation check
import configurationManagerValidationSuite from './Validation/ConfigurationManagerValidation.test';

// FocusManagerValidation: Focus Manager Validation check
import focusManagerValidationSuite from './Validation/FocusManagerValidation.test';

// InputValidation: Input Validation check
import inputValidationSuite from './Validation/InputValidation.test';

// KeyCodeValidation: Key Code Validation check
import keyCodeValidationSuite from './Validation/KeyCodeValidation.test';

// LoggerValidation: Logger Validation check
import loggerValidationSuite from './Validation/LoggerValidation.test';

// PointerUtilValidation: Pointer Util Validation check
import pointerUtilValidationSuite from './Validation/PointerUtilValidation.test';

// ResourceLoaderValidation: Resource Loader Validation check
import resourceLoaderValidationSuite from './Validation/ResourceLoaderValidation.test';

// SessionStateManagerValidation: Session State Manager Validation check
import sessionStateManagerValidationSuite from './Validation/SessionStateManagerValidation.test';

export default function testsuite(): void {
  // ----- Ability -----
  abilitySuite();

  // ----- Miracast -----
  miracastConcurrencySuite();
  miracastConsistencySuite();
  miracastEndToEndSuite();
  miracastErrorRecoverySuite();
  miracastInputInteractionSuite();
  miracastItemInfoModelSuite();
  miracastLifecycleSuite();
  miracastMenuConfigurationSuite();
  miracastModelDeepSuite();
  miracastOperationCatalogSuite();
  miracastOperationFlowSuite();
  miracastOperationsSuite();
  miracastOperationWorkflowSuite();
  miracastStateManagementSuite();
  miracastStressSuite();
  miracastUISuite();

  // ----- MiracastValidation -----
  miracastAppVersionSuite();
  miracastAuthSessionSuite();
  miracastDataSourceValidationSuite();
  miracastEventToolValidationSuite();
  miracastInterruptionRecoverySuite();
  miracastNotificationSuite();
  miracastOfflineNetworkSuite();
  miracastSessionValidationSuite();

  // ----- Integration -----
  advancedScenariosSuite();
  comprehensiveRegressionSuite();
  deviceCompatibilitySuite();
  integrationTestingSuite();
  localizationTestingSuite();
  miracastCompatibilitySuite();
  networkConnectivitySuite();
  systemIntegrationSuite();
  userScenariosSuite();

  // ----- Interaction -----
  barrierFreeNavigationSuite();
  buttonInteractionSuite();
  contentScalingSuite();
  dataBindingSuite();
  eventHandlingSuite();
  eventPropagationSuite();
  focusNavigationSuite();
  focusRingBehaviorSuite();
  gestureRecognitionSuite();
  sessionPositioningSuite();
  themeVariationSuite();
  touchInteractionSuite();
  uiComponentRenderingSuite();
  visualEffectsSuite();

  // ----- LifecycleState -----
  configurationChangesSuite();
  errorRecoverySuite();
  exceptionHandlingSuite();
  extensionLifecycleSuite();
  resourceManagementSuite();
  sessionLifecycleSuite();
  sessionManagementSuite();
  sessionStateManagementSuite();
  statePersistenceSuite();
  stateRecoverySuite();

  // ----- PerformanceStability -----
  animationPerformanceSuite();
  concurrencyControlSuite();
  longTermStabilitySuite();
  memoryLeakDetectionSuite();
  miracastConsumptionSuite();
  miracastPerformanceSuite();
  performanceStressSuite();

  // ----- Security -----
  miracastSecuritySuite();
  securityBarrierFreeSuite();
  securityValidationSuite();

  // ----- Validation -----
  animationControllerValidationSuite();
  boundaryErrorTestingSuite();
  commonEventUtilValidationSuite();
  configurationManagerValidationSuite();
  focusManagerValidationSuite();
  inputValidationSuite();
  keyCodeValidationSuite();
  loggerValidationSuite();
  pointerUtilValidationSuite();
  resourceLoaderValidationSuite();
  sessionStateManagerValidationSuite();
}

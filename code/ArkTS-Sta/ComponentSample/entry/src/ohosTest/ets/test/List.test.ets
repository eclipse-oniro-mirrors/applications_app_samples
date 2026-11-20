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
import abilitySuite from './Ability.test.ets';
import calendarModelDeepSuite from './CalendarCore/CalendarModelDeep.test.ets';
import daySelectionSuite from './CalendarCore/DaySelection.test.ets';
import gridCatalogSuite from './CalendarCore/GridCatalog.test.ets';
import gridCellModelSuite from './CalendarCore/GridCellModel.test.ets';
import gridConcurrencySuite from './CalendarCore/GridConcurrency.test.ets';
import gridConsistencySuite from './CalendarCore/GridConsistency.test.ets';
import gridEndToEndSuite from './CalendarCore/GridEndToEnd.test.ets';
import gridErrorRecoverySuite from './CalendarCore/GridErrorRecovery.test.ets';
import gridFlowSuite from './CalendarCore/GridFlow.test.ets';
import gridLifecycleSuite from './CalendarCore/GridLifecycle.test.ets';
import gridOperationsSuite from './CalendarCore/GridOperations.test.ets';
import gridStateManagementSuite from './CalendarCore/GridStateManagement.test.ets';
import gridStressSuite from './CalendarCore/GridStress.test.ets';
import gridViewProjectionSuite from './CalendarCore/GridViewProjection.test.ets';
import gridWorkflowSuite from './CalendarCore/GridWorkflow.test.ets';
import monthPanelConfigSuite from './CalendarCore/MonthPanelConfig.test.ets';
import calendarCellValidationSuite from './CalendarValidation/CalendarCellValidation.test.ets';
import calendarGridValidationSuite from './CalendarValidation/CalendarGridValidation.test.ets';
import calendarLeapValidationSuite from './CalendarValidation/CalendarLeapValidation.test.ets';
import calendarRangeValidationSuite from './CalendarValidation/CalendarRangeValidation.test.ets';
import calendarRecoveryValidationSuite from './CalendarValidation/CalendarRecoveryValidation.test.ets';
import calendarSelectionValidationSuite from './CalendarValidation/CalendarSelectionValidation.test.ets';
import calendarTimezoneValidationSuite from './CalendarValidation/CalendarTimezoneValidation.test.ets';
import calendarYearBoundarySuite from './CalendarValidation/CalendarYearBoundary.test.ets';
import boundaryErrorTestingSuite from './DataSourceValidation/BoundaryErrorTesting.test.ets';
import cascadeDataValidationSuite from './DataSourceValidation/CascadeDataValidation.test.ets';
import cascadePointerValidationSuite from './DataSourceValidation/CascadePointerValidation.test.ets';
import dataResourceValidationSuite from './DataSourceValidation/DataResourceValidation.test.ets';
import indexInputValidationSuite from './DataSourceValidation/IndexInputValidation.test.ets';
import itemIndexValidationSuite from './DataSourceValidation/ItemIndexValidation.test.ets';
import listenerRegistryValidationSuite from './DataSourceValidation/ListenerRegistryValidation.test.ets';
import loggingPolicyValidationSuite from './DataSourceValidation/LoggingPolicyValidation.test.ets';
import monthDataSourceValidationSuite from './DataSourceValidation/MonthDataSourceValidation.test.ets';
import monthInterfaceValidationSuite from './DataSourceValidation/MonthInterfaceValidation.test.ets';
import stringSourceValidationSuite from './DataSourceValidation/StringSourceValidation.test.ets';
import advancedScenariosSuite from './Integration/AdvancedScenarios.test.ets';
import comprehensiveRegressionSuite from './Integration/ComprehensiveRegression.test.ets';
import deviceCompatibilitySuite from './Integration/DeviceCompatibility.test.ets';
import integrationTestingSuite from './Integration/IntegrationTesting.test.ets';
import localizationTestingSuite from './Integration/LocalizationTesting.test.ets';
import networkConnectivitySuite from './Integration/NetworkConnectivity.test.ets';
import powerCompatibilitySuite from './Integration/PowerCompatibility.test.ets';
import systemIntegrationSuite from './Integration/SystemIntegration.test.ets';
import userScenariosSuite from './Integration/UserScenarios.test.ets';
import accessibilityNavigationSuite from './Interaction/AccessibilityNavigation.test.ets';
import buttonInteractionSuite from './Interaction/ButtonInteraction.test.ets';
import contentScalingSuite from './Interaction/ContentScaling.test.ets';
import dataBindingSuite from './Interaction/DataBinding.test.ets';
import dialogPositioningSuite from './Interaction/DialogPositioning.test.ets';
import eventHandlingSuite from './Interaction/EventHandling.test.ets';
import eventPropagationSuite from './Interaction/EventPropagation.test.ets';
import focusNavigationSuite from './Interaction/FocusNavigation.test.ets';
import focusRingBehaviorSuite from './Interaction/FocusRingBehavior.test.ets';
import gestureRecognitionSuite from './Interaction/GestureRecognition.test.ets';
import themeVariationSuite from './Interaction/ThemeVariation.test.ets';
import touchInteractionSuite from './Interaction/TouchInteraction.test.ets';
import uIComponentRenderingSuite from './Interaction/UIComponentRendering.test.ets';
import visualEffectsSuite from './Interaction/VisualEffects.test.ets';
import configurationChangesSuite from './LifecycleState/ConfigurationChanges.test.ets';
import dialogLifecycleSuite from './LifecycleState/DialogLifecycle.test.ets';
import dialogStateManagementSuite from './LifecycleState/DialogStateManagement.test.ets';
import errorRecoverySuite from './LifecycleState/ErrorRecovery.test.ets';
import exceptionHandlingSuite from './LifecycleState/ExceptionHandling.test.ets';
import extensionLifecycleSuite from './LifecycleState/ExtensionLifecycle.test.ets';
import resourceManagementSuite from './LifecycleState/ResourceManagement.test.ets';
import sessionManagementSuite from './LifecycleState/SessionManagement.test.ets';
import statePersistenceSuite from './LifecycleState/StatePersistence.test.ets';
import stateRecoverySuite from './LifecycleState/StateRecovery.test.ets';
import animationPerformanceSuite from './PerformanceStability/AnimationPerformance.test.ets';
import concurrencyControlSuite from './PerformanceStability/ConcurrencyControl.test.ets';
import longTermStabilitySuite from './PerformanceStability/LongTermStability.test.ets';
import memoryLeakDetectionSuite from './PerformanceStability/MemoryLeakDetection.test.ets';
import performanceStressSuite from './PerformanceStability/PerformanceStress.test.ets';
import powerConsumptionSuite from './PerformanceStability/PowerConsumption.test.ets';
import powerPerformanceSuite from './PerformanceStability/PowerPerformance.test.ets';
import powerSecuritySuite from './Security/PowerSecurity.test.ets';
import securityAccessibilitySuite from './Security/SecurityAccessibility.test.ets';
import securityValidationSuite from './Security/SecurityValidation.test.ets';

export default function testsuite(): void {
  abilityTest();
  abilitySuite();
  calendarModelDeepSuite();
  daySelectionSuite();
  gridCatalogSuite();
  gridCellModelSuite();
  gridConcurrencySuite();
  gridConsistencySuite();
  gridEndToEndSuite();
  gridErrorRecoverySuite();
  gridFlowSuite();
  gridLifecycleSuite();
  gridOperationsSuite();
  gridStateManagementSuite();
  gridStressSuite();
  gridViewProjectionSuite();
  gridWorkflowSuite();
  monthPanelConfigSuite();
  calendarCellValidationSuite();
  calendarGridValidationSuite();
  calendarLeapValidationSuite();
  calendarRangeValidationSuite();
  calendarRecoveryValidationSuite();
  calendarSelectionValidationSuite();
  calendarTimezoneValidationSuite();
  calendarYearBoundarySuite();
  boundaryErrorTestingSuite();
  cascadeDataValidationSuite();
  cascadePointerValidationSuite();
  dataResourceValidationSuite();
  indexInputValidationSuite();
  itemIndexValidationSuite();
  listenerRegistryValidationSuite();
  loggingPolicyValidationSuite();
  monthDataSourceValidationSuite();
  monthInterfaceValidationSuite();
  stringSourceValidationSuite();
  advancedScenariosSuite();
  comprehensiveRegressionSuite();
  deviceCompatibilitySuite();
  integrationTestingSuite();
  localizationTestingSuite();
  networkConnectivitySuite();
  powerCompatibilitySuite();
  systemIntegrationSuite();
  userScenariosSuite();
  accessibilityNavigationSuite();
  buttonInteractionSuite();
  contentScalingSuite();
  dataBindingSuite();
  dialogPositioningSuite();
  eventHandlingSuite();
  eventPropagationSuite();
  focusNavigationSuite();
  focusRingBehaviorSuite();
  gestureRecognitionSuite();
  themeVariationSuite();
  touchInteractionSuite();
  uIComponentRenderingSuite();
  visualEffectsSuite();
  configurationChangesSuite();
  dialogLifecycleSuite();
  dialogStateManagementSuite();
  errorRecoverySuite();
  exceptionHandlingSuite();
  extensionLifecycleSuite();
  resourceManagementSuite();
  sessionManagementSuite();
  statePersistenceSuite();
  stateRecoverySuite();
  animationPerformanceSuite();
  concurrencyControlSuite();
  longTermStabilitySuite();
  memoryLeakDetectionSuite();
  performanceStressSuite();
  powerConsumptionSuite();
  powerPerformanceSuite();
  powerSecuritySuite();
  securityAccessibilitySuite();
  securityValidationSuite();
}

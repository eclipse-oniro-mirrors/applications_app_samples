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
/**
 * Reference inventory and adaptation map (text line counts before adaptation).
 * Paths on the left are relative to TVPowerDialog/entry/src/ohosTest.
 * Calculation suites replace TV-specific behavior with independent sensor inputs.
 * ets/test/Ability.test.ets (49 lines) -> ets/test/Ability.test.ets
 * ets/test/Integration/AdvancedScenarios.test.ets (230 lines) -> ets/test/Calculations/SensorFusionPipelines.test.ets
 * ets/test/Integration/ComprehensiveRegression.test.ets (497 lines) -> ets/test/Calculations/SensorCalculationRegression.test.ets
 * ets/test/Integration/DeviceCompatibility.test.ets (88 lines) -> ets/test/Calculations/SensorLayoutCompatibility.test.ets
 * ets/test/Integration/IntegrationTesting.test.ets (353 lines) -> ets/test/Calculations/SensorCalculationIntegration.test.ets
 * ets/test/Integration/LocalizationTesting.test.ets (690 lines) -> ets/test/Calculations/SensorCoordinateLocations.test.ets
 * ets/test/Integration/NetworkConnectivity.test.ets (109 lines) -> ets/test/Calculations/SensorOfflineCalculation.test.ets
 * ets/test/Integration/PowerCompatibility.test.ets (619 lines) -> ets/test/Calculations/SensorApiCompatibility.test.ets
 * ets/test/Integration/SystemIntegration.test.ets (374 lines) -> ets/test/Calculations/SensorCoordinateIntegration.test.ets
 * ets/test/Integration/UserScenarios.test.ets (751 lines) -> ets/test/Calculations/SensorCalculationUserFlows.test.ets
 * ets/test/Interaction/AccessibilityNavigation.test.ets (920 lines) -> ets/test/Calculations/SensorCoordinateNavigation.test.ets
 * ets/test/Interaction/ButtonInteraction.test.ets (870 lines) -> ets/test/Calculations/SensorCalculationCommands.test.ets
 * ets/test/Interaction/ContentScaling.test.ets (303 lines) -> ets/test/Calculations/SensorMatrixLayouts.test.ets
 * ets/test/Interaction/DataBinding.test.ets (408 lines) -> ets/test/Calculations/SensorQuaternionBinding.test.ets
 * ets/test/Interaction/DialogPositioning.test.ets (292 lines) -> ets/test/Calculations/SensorRotationCoordinates.test.ets
 * ets/test/Interaction/EventHandling.test.ets (897 lines) -> ets/test/Calculations/SensorAngleEvents.test.ets
 * ets/test/Interaction/EventPropagation.test.ets (839 lines) -> ets/test/Calculations/SensorFusionPropagation.test.ets
 * ets/test/Interaction/FocusNavigation.test.ets (1191 lines) -> ets/test/Calculations/SensorOrientationAxes.test.ets
 * ets/test/Interaction/FocusRingBehavior.test.ets (687 lines) -> ets/test/Calculations/SensorMatrixOrthogonality.test.ets
 * ets/test/Interaction/GestureRecognition.test.ets (861 lines) -> ets/test/Calculations/SensorVectorRecognition.test.ets
 * ets/test/Interaction/ThemeVariation.test.ets (297 lines) -> ets/test/Calculations/SensorGeomagneticLocations.test.ets
 * ets/test/Interaction/TouchInteraction.test.ets (933 lines) -> ets/test/Calculations/SensorRotationInputs.test.ets
 * ets/test/Interaction/UIComponentRendering.test.ets (760 lines) -> ets/test/Calculations/SensorCalculationResults.test.ets
 * ets/test/Interaction/VisualEffects.test.ets (669 lines) -> ets/test/Calculations/SensorQuaternionRepresentations.test.ets
 * ets/test/LifecycleState/ConfigurationChanges.test.ets (408 lines) -> ets/test/Calculations/SensorInputIsolation.test.ets
 * ets/test/LifecycleState/DialogLifecycle.test.ets (270 lines) -> ets/test/Calculations/SensorMatrixReentrancy.test.ets
 * ets/test/LifecycleState/DialogStateManagement.test.ets (1014 lines) -> ets/test/Calculations/SensorOrientationState.test.ets
 * ets/test/LifecycleState/ErrorRecovery.test.ets (1041 lines) -> ets/test/Calculations/SensorCalculationRecovery.test.ets
 * ets/test/LifecycleState/ExceptionHandling.test.ets (1024 lines) -> ets/test/Calculations/SensorInclinationReentrancy.test.ets
 * ets/test/LifecycleState/ExtensionLifecycle.test.ets (700 lines) -> ets/test/Calculations/SensorFusionReentrancy.test.ets
 * ets/test/LifecycleState/ResourceManagement.test.ets (379 lines) -> ets/test/Calculations/SensorQuaternionResources.test.ets
 * ets/test/LifecycleState/SessionManagement.test.ets (407 lines) -> ets/test/Calculations/SensorGeomagneticSessions.test.ets
 * ets/test/LifecycleState/StatePersistence.test.ets (294 lines) -> ets/test/Calculations/SensorCoordinatePersistence.test.ets
 * ets/test/LifecycleState/StateRecovery.test.ets (299 lines) -> ets/test/Calculations/SensorRotationRecovery.test.ets
 * ets/test/List.test.ets (174 lines) -> ets/test/List.test.ets
 * ets/test/PerformanceStability/AnimationPerformance.test.ets (845 lines) -> ets/test/Calculations/SensorRotationRepeatability.test.ets
 * ets/test/PerformanceStability/ConcurrencyControl.test.ets (168 lines) -> ets/test/Calculations/SensorCoordinateRepeatability.test.ets
 * ets/test/PerformanceStability/LongTermStability.test.ets (196 lines) -> ets/test/Calculations/SensorAltitudeRepeatability.test.ets
 * ets/test/PerformanceStability/MemoryLeakDetection.test.ets (212 lines) -> ets/test/Calculations/SensorQuaternionInputOwnership.test.ets
 * ets/test/PerformanceStability/PerformanceStress.test.ets (598 lines) -> ets/test/Calculations/SensorFusionRepeatedInputs.test.ets
 * ets/test/PerformanceStability/PowerConsumption.test.ets (834 lines) -> ets/test/Calculations/SensorGeomagneticRepeatability.test.ets
 * ets/test/PerformanceStability/PowerPerformance.test.ets (794 lines) -> ets/test/Calculations/SensorOrientationRepeatability.test.ets
 * ets/test/PowerDialog/PowerDialogConcurrency.test.ets (522 lines) -> ets/test/Calculations/SensorVariationConcurrencyInputs.test.ets
 * ets/test/PowerDialog/PowerDialogConsistency.test.ets (518 lines) -> ets/test/Calculations/SensorRotationConsistency.test.ets
 * ets/test/PowerDialog/PowerDialogEndToEnd.test.ets (490 lines) -> ets/test/Calculations/SensorFusionEndToEnd.test.ets
 * ets/test/PowerDialog/PowerDialogErrorRecovery.test.ets (551 lines) -> ets/test/Calculations/SensorInclinationRecovery.test.ets
 * ets/test/PowerDialog/PowerDialogLifecycle.test.ets (550 lines) -> ets/test/Calculations/SensorQuaternionLifecycle.test.ets
 * ets/test/PowerDialog/PowerDialogStateManagement.test.ets (521 lines) -> ets/test/Calculations/SensorOrientationStateTransitions.test.ets
 * ets/test/PowerDialog/PowerDialogStress.test.ets (126 lines) -> ets/test/Calculations/SensorAltitudeRepeatedCalls.test.ets
 * ets/test/PowerDialog/PowerDialogUI.test.ets (496 lines) -> ets/test/Calculations/SensorCoordinateResults.test.ets
 * ets/test/PowerDialog/PowerInputInteraction.test.ets (632 lines) -> ets/test/Calculations/SensorVariationInputInteraction.test.ets
 * ets/test/PowerDialog/PowerItemInfoModel.test.ets (949 lines) -> ets/test/Calculations/SensorQuaternionModel.test.ets
 * ets/test/PowerDialog/PowerMenuConfiguration.test.ets (940 lines) -> ets/test/Calculations/SensorRotationConfigurations.test.ets
 * ets/test/PowerDialog/PowerModelDeep.test.ets (1072 lines) -> ets/test/Calculations/SensorFusionModel.test.ets
 * ets/test/PowerDialog/PowerOperationCatalog.test.ets (1045 lines) -> ets/test/Calculations/SensorAltitudeCatalog.test.ets
 * ets/test/PowerDialog/PowerOperationFlow.test.ets (994 lines) -> ets/test/Calculations/SensorOrientationFlow.test.ets
 * ets/test/PowerDialog/PowerOperations.test.ets (694 lines) -> ets/test/Calculations/SensorInclinationOperations.test.ets
 * ets/test/PowerDialog/PowerOperationWorkflow.test.ets (654 lines) -> ets/test/Calculations/SensorTransformWorkflow.test.ets
 * ets/test/PowerValidation/PowerAppVersion.test.ets (915 lines) -> ets/test/Calculations/SensorApi20Calculations.test.ets
 * ets/test/PowerValidation/PowerAuthSession.test.ets (869 lines) -> ets/test/Calculations/SensorQuaternionIsolation.test.ets
 * ets/test/PowerValidation/PowerDataSourceValidation.test.ets (535 lines) -> ets/test/Calculations/SensorFusionDataValidation.test.ets
 * ets/test/PowerValidation/PowerEventToolValidation.test.ets (505 lines) -> ets/test/Calculations/SensorVariationEventValidation.test.ets
 * ets/test/PowerValidation/PowerInterruptionRecovery.test.ets (679 lines) -> ets/test/Calculations/SensorOrientationRecovery.test.ets
 * ets/test/PowerValidation/PowerNotification.test.ets (905 lines) -> ets/test/Calculations/SensorGeomagneticFieldValidation.test.ets
 * ets/test/PowerValidation/PowerOfflineNetwork.test.ets (884 lines) -> ets/test/Calculations/SensorOfflineGeomagnetic.test.ets
 * ets/test/PowerValidation/PowerSessionValidation.test.ets (580 lines) -> ets/test/Calculations/SensorCoordinateSessionValidation.test.ets
 * ets/test/Security/PowerSecurity.test.ets (628 lines) -> ets/test/Calculations/SensorAltitudeNumericBoundaries.test.ets
 * ets/test/Security/SecurityAccessibility.test.ets (366 lines) -> ets/test/Calculations/SensorCoordinateAxisValidation.test.ets
 * ets/test/Security/SecurityValidation.test.ets (331 lines) -> ets/test/Calculations/SensorInclinationNumericValidation.test.ets
 * ets/test/Shared/SharedDriver.ets (475 lines) -> ets/test/Shared/SharedDriver.ets
 * ets/test/Validation/AnimationControllerValidation.test.ets (1306 lines) -> ets/test/Calculations/SensorRotationMatrixValidation.test.ets
 * ets/test/Validation/BoundaryErrorTesting.test.ets (703 lines) -> ets/test/Calculations/SensorAltitudeBoundaryValidation.test.ets
 * ets/test/Validation/CommonEventUtilValidation.test.ets (1224 lines) -> ets/test/Calculations/SensorVariationValidation.test.ets
 * ets/test/Validation/ConfigurationManagerValidation.test.ets (564 lines) -> ets/test/Calculations/SensorFusionConfigurationValidation.test.ets
 * ets/test/Validation/DialogStateManagerValidation.test.ets (1128 lines) -> ets/test/Calculations/SensorOrientationValidation.test.ets
 * ets/test/Validation/FocusManagerValidation.test.ets (1178 lines) -> ets/test/Calculations/SensorCoordinateMappingValidation.test.ets
 * ets/test/Validation/InputValidation.test.ets (684 lines) -> ets/test/Calculations/SensorQuaternionInputValidation.test.ets
 * ets/test/Validation/KeyCodeValidation.test.ets (1353 lines) -> ets/test/Calculations/SensorAxisRotationValidation.test.ets
 * ets/test/Validation/LoggerValidation.test.ets (851 lines) -> ets/test/Calculations/SensorGeomagneticValidation.test.ets
 * ets/test/Validation/PointerUtilValidation.test.ets (1170 lines) -> ets/test/Calculations/SensorGravityVectorValidation.test.ets
 * ets/test/Validation/ResourceLoaderValidation.test.ets (520 lines) -> ets/test/Calculations/SensorInclinationMatrixValidation.test.ets
 * ets/testability/pages/Index.ets (31 lines) -> ets/testability/pages/Index.ets
 * ets/testability/TestAbility.ets (84 lines) -> ets/testability/TestAbility.ets
 * ets/testrunner/OpenHarmonyTestRunner.ets (61 lines) -> ets/testrunner/OpenHarmonyTestRunner.ets
 * module.json5 (37 lines) -> module.json5
 * resources/base/element/color.json (8 lines) -> resources/base/element/color.json
 * resources/base/element/string.json (16 lines) -> resources/base/element/string.json
 * resources/base/media/icon.png (6790 bytes) -> resources/base/media/icon.png
 * resources/base/profile/test_pages.json (5 lines) -> resources/base/profile/test_pages.json
 */

import sensorAltitudeBoundaryValidationTest from './Calculations/SensorAltitudeBoundaryValidation.test';
import sensorAltitudeCatalogTest from './Calculations/SensorAltitudeCatalog.test';
import sensorAltitudeNumericBoundariesTest from './Calculations/SensorAltitudeNumericBoundaries.test';
import sensorAltitudeRepeatabilityTest from './Calculations/SensorAltitudeRepeatability.test';
import sensorAltitudeRepeatedCallsTest from './Calculations/SensorAltitudeRepeatedCalls.test';
import sensorAngleEventsTest from './Calculations/SensorAngleEvents.test';
import sensorApi20CalculationsTest from './Calculations/SensorApi20Calculations.test';
import sensorApiCompatibilityTest from './Calculations/SensorApiCompatibility.test';
import sensorAxisRotationValidationTest from './Calculations/SensorAxisRotationValidation.test';
import sensorCalculationCommandsTest from './Calculations/SensorCalculationCommands.test';
import sensorCalculationIntegrationTest from './Calculations/SensorCalculationIntegration.test';
import sensorCalculationRecoveryTest from './Calculations/SensorCalculationRecovery.test';
import sensorCalculationRegressionTest from './Calculations/SensorCalculationRegression.test';
import sensorCalculationResultsTest from './Calculations/SensorCalculationResults.test';
import sensorCalculationUserFlowsTest from './Calculations/SensorCalculationUserFlows.test';
import sensorCoordinateAxisValidationTest from './Calculations/SensorCoordinateAxisValidation.test';
import sensorCoordinateIntegrationTest from './Calculations/SensorCoordinateIntegration.test';
import sensorCoordinateLocationsTest from './Calculations/SensorCoordinateLocations.test';
import sensorCoordinateMappingValidationTest from './Calculations/SensorCoordinateMappingValidation.test';
import sensorCoordinateNavigationTest from './Calculations/SensorCoordinateNavigation.test';
import sensorCoordinatePersistenceTest from './Calculations/SensorCoordinatePersistence.test';
import sensorCoordinateRepeatabilityTest from './Calculations/SensorCoordinateRepeatability.test';
import sensorCoordinateResultsTest from './Calculations/SensorCoordinateResults.test';
import sensorCoordinateSessionValidationTest from './Calculations/SensorCoordinateSessionValidation.test';
import sensorFusionConfigurationValidationTest from './Calculations/SensorFusionConfigurationValidation.test';
import sensorFusionDataValidationTest from './Calculations/SensorFusionDataValidation.test';
import sensorFusionEndToEndTest from './Calculations/SensorFusionEndToEnd.test';
import sensorFusionModelTest from './Calculations/SensorFusionModel.test';
import sensorFusionPipelinesTest from './Calculations/SensorFusionPipelines.test';
import sensorFusionPropagationTest from './Calculations/SensorFusionPropagation.test';
import sensorFusionReentrancyTest from './Calculations/SensorFusionReentrancy.test';
import sensorFusionRepeatedInputsTest from './Calculations/SensorFusionRepeatedInputs.test';
import sensorGeomagneticFieldValidationTest from './Calculations/SensorGeomagneticFieldValidation.test';
import sensorGeomagneticLocationsTest from './Calculations/SensorGeomagneticLocations.test';
import sensorGeomagneticRepeatabilityTest from './Calculations/SensorGeomagneticRepeatability.test';
import sensorGeomagneticSessionsTest from './Calculations/SensorGeomagneticSessions.test';
import sensorGeomagneticValidationTest from './Calculations/SensorGeomagneticValidation.test';
import sensorGravityVectorValidationTest from './Calculations/SensorGravityVectorValidation.test';
import sensorInclinationMatrixValidationTest from './Calculations/SensorInclinationMatrixValidation.test';
import sensorInclinationNumericValidationTest from './Calculations/SensorInclinationNumericValidation.test';
import sensorInclinationOperationsTest from './Calculations/SensorInclinationOperations.test';
import sensorInclinationRecoveryTest from './Calculations/SensorInclinationRecovery.test';
import sensorInclinationReentrancyTest from './Calculations/SensorInclinationReentrancy.test';
import sensorInputIsolationTest from './Calculations/SensorInputIsolation.test';
import sensorLayoutCompatibilityTest from './Calculations/SensorLayoutCompatibility.test';
import sensorMatrixLayoutsTest from './Calculations/SensorMatrixLayouts.test';
import sensorMatrixOrthogonalityTest from './Calculations/SensorMatrixOrthogonality.test';
import sensorMatrixReentrancyTest from './Calculations/SensorMatrixReentrancy.test';
import sensorOfflineCalculationTest from './Calculations/SensorOfflineCalculation.test';
import sensorOfflineGeomagneticTest from './Calculations/SensorOfflineGeomagnetic.test';
import sensorOrientationAxesTest from './Calculations/SensorOrientationAxes.test';
import sensorOrientationFlowTest from './Calculations/SensorOrientationFlow.test';
import sensorOrientationRecoveryTest from './Calculations/SensorOrientationRecovery.test';
import sensorOrientationRepeatabilityTest from './Calculations/SensorOrientationRepeatability.test';
import sensorOrientationStateTest from './Calculations/SensorOrientationState.test';
import sensorOrientationStateTransitionsTest from './Calculations/SensorOrientationStateTransitions.test';
import sensorOrientationValidationTest from './Calculations/SensorOrientationValidation.test';
import sensorQuaternionBindingTest from './Calculations/SensorQuaternionBinding.test';
import sensorQuaternionInputOwnershipTest from './Calculations/SensorQuaternionInputOwnership.test';
import sensorQuaternionInputValidationTest from './Calculations/SensorQuaternionInputValidation.test';
import sensorQuaternionIsolationTest from './Calculations/SensorQuaternionIsolation.test';
import sensorQuaternionLifecycleTest from './Calculations/SensorQuaternionLifecycle.test';
import sensorQuaternionModelTest from './Calculations/SensorQuaternionModel.test';
import sensorQuaternionRepresentationsTest from './Calculations/SensorQuaternionRepresentations.test';
import sensorQuaternionResourcesTest from './Calculations/SensorQuaternionResources.test';
import sensorRotationConfigurationsTest from './Calculations/SensorRotationConfigurations.test';
import sensorRotationConsistencyTest from './Calculations/SensorRotationConsistency.test';
import sensorRotationCoordinatesTest from './Calculations/SensorRotationCoordinates.test';
import sensorRotationInputsTest from './Calculations/SensorRotationInputs.test';
import sensorRotationMatrixValidationTest from './Calculations/SensorRotationMatrixValidation.test';
import sensorRotationRecoveryTest from './Calculations/SensorRotationRecovery.test';
import sensorRotationRepeatabilityTest from './Calculations/SensorRotationRepeatability.test';
import sensorTransformWorkflowTest from './Calculations/SensorTransformWorkflow.test';
import sensorVariationConcurrencyInputsTest from './Calculations/SensorVariationConcurrencyInputs.test';
import sensorVariationEventValidationTest from './Calculations/SensorVariationEventValidation.test';
import sensorVariationInputInteractionTest from './Calculations/SensorVariationInputInteraction.test';
import sensorVariationValidationTest from './Calculations/SensorVariationValidation.test';
import sensorVectorRecognitionTest from './Calculations/SensorVectorRecognition.test';

import sensorServicesTest from './SensorServices.test';
import abilityTest from './Ability.test';
import sensorSampleTest from './SensorSample.test';

/** Register every sensor calculation, discovery, subscription and UI suite. */
export default function testsuite(): void {
  sensorAltitudeBoundaryValidationTest();
  sensorAltitudeCatalogTest();
  sensorAltitudeNumericBoundariesTest();
  sensorAltitudeRepeatabilityTest();
  sensorAltitudeRepeatedCallsTest();
  sensorAngleEventsTest();
  sensorApi20CalculationsTest();
  sensorApiCompatibilityTest();
  sensorAxisRotationValidationTest();
  sensorCalculationCommandsTest();
  sensorCalculationIntegrationTest();
  sensorCalculationRecoveryTest();
  sensorCalculationRegressionTest();
  sensorCalculationResultsTest();
  sensorCalculationUserFlowsTest();
  sensorCoordinateAxisValidationTest();
  sensorCoordinateIntegrationTest();
  sensorCoordinateLocationsTest();
  sensorCoordinateMappingValidationTest();
  sensorCoordinateNavigationTest();
  sensorCoordinatePersistenceTest();
  sensorCoordinateRepeatabilityTest();
  sensorCoordinateResultsTest();
  sensorCoordinateSessionValidationTest();
  sensorFusionConfigurationValidationTest();
  sensorFusionDataValidationTest();
  sensorFusionEndToEndTest();
  sensorFusionModelTest();
  sensorFusionPipelinesTest();
  sensorFusionPropagationTest();
  sensorFusionReentrancyTest();
  sensorFusionRepeatedInputsTest();
  sensorGeomagneticFieldValidationTest();
  sensorGeomagneticLocationsTest();
  sensorGeomagneticRepeatabilityTest();
  sensorGeomagneticSessionsTest();
  sensorGeomagneticValidationTest();
  sensorGravityVectorValidationTest();
  sensorInclinationMatrixValidationTest();
  sensorInclinationNumericValidationTest();
  sensorInclinationOperationsTest();
  sensorInclinationRecoveryTest();
  sensorInclinationReentrancyTest();
  sensorInputIsolationTest();
  sensorLayoutCompatibilityTest();
  sensorMatrixLayoutsTest();
  sensorMatrixOrthogonalityTest();
  sensorMatrixReentrancyTest();
  sensorOfflineCalculationTest();
  sensorOfflineGeomagneticTest();
  sensorOrientationAxesTest();
  sensorOrientationFlowTest();
  sensorOrientationRecoveryTest();
  sensorOrientationRepeatabilityTest();
  sensorOrientationStateTest();
  sensorOrientationStateTransitionsTest();
  sensorOrientationValidationTest();
  sensorQuaternionBindingTest();
  sensorQuaternionInputOwnershipTest();
  sensorQuaternionInputValidationTest();
  sensorQuaternionIsolationTest();
  sensorQuaternionLifecycleTest();
  sensorQuaternionModelTest();
  sensorQuaternionRepresentationsTest();
  sensorQuaternionResourcesTest();
  sensorRotationConfigurationsTest();
  sensorRotationConsistencyTest();
  sensorRotationCoordinatesTest();
  sensorRotationInputsTest();
  sensorRotationMatrixValidationTest();
  sensorRotationRecoveryTest();
  sensorRotationRepeatabilityTest();
  sensorTransformWorkflowTest();
  sensorVariationConcurrencyInputsTest();
  sensorVariationEventValidationTest();
  sensorVariationInputInteractionTest();
  sensorVariationValidationTest();
  sensorVectorRecognitionTest();

  sensorServicesTest();
  abilityTest();
  sensorSampleTest();
}

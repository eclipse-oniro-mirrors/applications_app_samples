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
import abilityTest from './Ability.test.ets';
import PublishConcurrency from './Publish/PublishConcurrency.test.ets';
import PublishConsistency from './Publish/PublishConsistency.test.ets';
import PublishEndToEnd from './Publish/PublishEndToEnd.test.ets';
import PublishErrorRecovery from './Publish/PublishErrorRecovery.test.ets';
import PublishLifecycle from './Publish/PublishLifecycle.test.ets';
import PublishStateManagement from './Publish/PublishStateManagement.test.ets';
import PublishStress from './Publish/PublishStress.test.ets';
import PublishViewState from './Publish/PublishViewState.test.ets';
import PublishInputInteraction from './Publish/PublishInputInteraction.test.ets';
import CommentModelBasics from './Publish/CommentModelBasics.test.ets';
import PublishComposerConfiguration from './Publish/PublishComposerConfiguration.test.ets';
import CommentModelDeep from './Publish/CommentModelDeep.test.ets';
import PublishOperationCatalog from './Publish/PublishOperationCatalog.test.ets';
import PublishOperationFlow from './Publish/PublishOperationFlow.test.ets';
import PublishOperations from './Publish/PublishOperations.test.ets';
import PublishOperationWorkflow from './Publish/PublishOperationWorkflow.test.ets';
import DraftContentRules from './DraftValidation/DraftContentRules.test.ets';
import DraftWhitespacePolicy from './DraftValidation/DraftWhitespacePolicy.test.ets';
import DraftInputBinding from './DraftValidation/DraftInputBinding.test.ets';
import DraftTextNormalization from './DraftValidation/DraftTextNormalization.test.ets';
import DraftInterruptionRecovery from './DraftValidation/DraftInterruptionRecovery.test.ets';
import DraftPublishFeedback from './DraftValidation/DraftPublishFeedback.test.ets';
import DraftOfflineQueue from './DraftValidation/DraftOfflineQueue.test.ets';
import DraftSessionValidation from './DraftValidation/DraftSessionValidation.test.ets';
import ModelFieldTransmission from './ModelValidation/ModelFieldTransmission.test.ets';
import ModelBoundaryValues from './ModelValidation/ModelBoundaryValues.test.ets';
import ModelMutationTracking from './ModelValidation/ModelMutationTracking.test.ets';
import ModelDefaults from './ModelValidation/ModelDefaults.test.ets';
import ModelIdentity from './ModelValidation/ModelIdentity.test.ets';
import ModelEquality from './ModelValidation/ModelEquality.test.ets';
import ModelTextValidation from './ModelValidation/ModelTextValidation.test.ets';
import ModelUnicode from './ModelValidation/ModelUnicode.test.ets';
import ModelSerialization from './ModelValidation/ModelSerialization.test.ets';
import ModelCloning from './ModelValidation/ModelCloning.test.ets';
import ModelReplyFields from './ModelValidation/ModelReplyFields.test.ets';
import NavigationModel from './Interaction/NavigationModel.test.ets';
import ButtonStateModel from './Interaction/ButtonStateModel.test.ets';
import ContentScalingModel from './Interaction/ContentScalingModel.test.ets';
import DataBindingModel from './Interaction/DataBindingModel.test.ets';
import ComposerPositionModel from './Interaction/ComposerPositionModel.test.ets';
import EventHandlingModel from './Interaction/EventHandlingModel.test.ets';
import EventPropagationModel from './Interaction/EventPropagationModel.test.ets';
import FocusNavigationModel from './Interaction/FocusNavigationModel.test.ets';
import FocusRingModel from './Interaction/FocusRingModel.test.ets';
import GestureRecognitionModel from './Interaction/GestureRecognitionModel.test.ets';
import ThemeVariationModel from './Interaction/ThemeVariationModel.test.ets';
import TouchInteractionModel from './Interaction/TouchInteractionModel.test.ets';
import RenderPipelineModel from './Interaction/RenderPipelineModel.test.ets';
import VisualEffectsModel from './Interaction/VisualEffectsModel.test.ets';
import PageConfiguration from './LifecycleState/PageConfiguration.test.ets';
import ComposerLifecycle from './LifecycleState/ComposerLifecycle.test.ets';
import BoardStateManagement from './LifecycleState/BoardStateManagement.test.ets';
import BoardErrorRecovery from './LifecycleState/BoardErrorRecovery.test.ets';
import BoardExceptionHandling from './LifecycleState/BoardExceptionHandling.test.ets';
import AbilityLifecycle from './LifecycleState/AbilityLifecycle.test.ets';
import BoardResourceManagement from './LifecycleState/BoardResourceManagement.test.ets';
import BoardSessionManagement from './LifecycleState/BoardSessionManagement.test.ets';
import BoardStatePersistence from './LifecycleState/BoardStatePersistence.test.ets';
import BoardStateRecovery from './LifecycleState/BoardStateRecovery.test.ets';
import RenderLoopPerformance from './PerformanceStability/RenderLoopPerformance.test.ets';
import ConcurrencyControl from './PerformanceStability/ConcurrencyControl.test.ets';
import LongTermStability from './PerformanceStability/LongTermStability.test.ets';
import MemoryLeakDetection from './PerformanceStability/MemoryLeakDetection.test.ets';
import PerformanceStress from './PerformanceStability/PerformanceStress.test.ets';
import WorkloadBudget from './PerformanceStability/WorkloadBudget.test.ets';
import ThroughputProfile from './PerformanceStability/ThroughputProfile.test.ets';
import AdvancedScenarios from './Integration/AdvancedScenarios.test.ets';
import ComprehensiveRegression from './Integration/ComprehensiveRegression.test.ets';
import DeviceCompatibility from './Integration/DeviceCompatibility.test.ets';
import IntegrationTesting from './Integration/IntegrationTesting.test.ets';
import LocalizationTesting from './Integration/LocalizationTesting.test.ets';
import OfflineCommentSync from './Integration/OfflineCommentSync.test.ets';
import CompatibilityMatrix from './Integration/CompatibilityMatrix.test.ets';
import SystemIntegration from './Integration/SystemIntegration.test.ets';
import UserScenarios from './Integration/UserScenarios.test.ets';
import InputSanitization from './Security/InputSanitization.test.ets';
import DataExposure from './Security/DataExposure.test.ets';
import SecurityValidation from './Security/SecurityValidation.test.ets';

export default function testsuite(): void {
  abilityTest();

  PublishConcurrency();
  PublishConsistency();
  PublishEndToEnd();
  PublishErrorRecovery();
  PublishLifecycle();
  PublishStateManagement();
  PublishStress();
  PublishViewState();
  PublishInputInteraction();
  CommentModelBasics();
  PublishComposerConfiguration();
  CommentModelDeep();
  PublishOperationCatalog();
  PublishOperationFlow();
  PublishOperations();
  PublishOperationWorkflow();

  // Category: DraftValidation (8 suites)
  DraftContentRules();
  DraftWhitespacePolicy();
  DraftInputBinding();
  DraftTextNormalization();
  DraftInterruptionRecovery();
  DraftPublishFeedback();
  DraftOfflineQueue();
  DraftSessionValidation();

  // Category: ModelValidation (11 suites)
  ModelFieldTransmission();
  ModelBoundaryValues();
  ModelMutationTracking();
  ModelDefaults();
  ModelIdentity();
  ModelEquality();
  ModelTextValidation();
  ModelUnicode();
  ModelSerialization();
  ModelCloning();
  ModelReplyFields();

  // Category: Interaction (14 suites, pure logic models only)
  NavigationModel();
  ButtonStateModel();
  ContentScalingModel();
  DataBindingModel();
  ComposerPositionModel();
  EventHandlingModel();
  EventPropagationModel();
  FocusNavigationModel();
  FocusRingModel();
  GestureRecognitionModel();
  ThemeVariationModel();
  TouchInteractionModel();
  RenderPipelineModel();
  VisualEffectsModel();

  // Category: LifecycleState (10 suites)
  PageConfiguration();
  ComposerLifecycle();
  BoardStateManagement();
  BoardErrorRecovery();
  BoardExceptionHandling();
  AbilityLifecycle();
  BoardResourceManagement();
  BoardSessionManagement();
  BoardStatePersistence();
  BoardStateRecovery();

  // Category: PerformanceStability (7 suites)
  RenderLoopPerformance();
  ConcurrencyControl();
  LongTermStability();
  MemoryLeakDetection();
  PerformanceStress();
  WorkloadBudget();
  ThroughputProfile();

  // Category: Integration (9 suites)
  AdvancedScenarios();
  ComprehensiveRegression();
  DeviceCompatibility();
  IntegrationTesting();
  LocalizationTesting();
  OfflineCommentSync();
  CompatibilityMatrix();
  SystemIntegration();
  UserScenarios();

  // Category: Security (3 suites)
  InputSanitization();
  DataExposure();
  SecurityValidation();
}

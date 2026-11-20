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
import SelectionCrossField from './Integration/SelectionCrossField.test';
import SelectionFlowRegression from './Integration/SelectionFlowRegression.test';
import SelectionDisplayCoordinates from './Integration/SelectionDisplayCoordinates.test';
import SelectionServiceIntegration from './Integration/SelectionServiceIntegration.test';
import SelectionUnicodeContent from './Integration/SelectionUnicodeContent.test';
import SelectionLocalContent from './Integration/SelectionLocalContent.test';
import SelectionInputModes from './Integration/SelectionInputModes.test';
import SelectionContextIntegration from './Integration/SelectionContextIntegration.test';
import SelectionReplacementScenarios from './Integration/SelectionReplacementScenarios.test';
import MainPanelTextRendering from './Pages/MainPanelTextRendering.test';
import MenuPanelButtons from './Pages/MenuPanelButtons.test';
import MainPanelLongContent from './Pages/MainPanelLongContent.test';
import MainPanelSnapshotBinding from './Pages/MainPanelSnapshotBinding.test';
import MenuPanelPositioning from './Pages/MenuPanelPositioning.test';
import MenuPanelDestroyedEvent from './Pages/MenuPanelDestroyedEvent.test';
import MenuPanelReuse from './Pages/MenuPanelReuse.test';
import MenuPanelEntryLaunch from './Pages/MenuPanelEntryLaunch.test';
import MenuPanelMissingContext from './Pages/MenuPanelMissingContext.test';
import MainPanelDrag from './Pages/MainPanelDrag.test';
import MainPanelEmptyContent from './Pages/MainPanelEmptyContent.test';
import MenuPanelShowRecovery from './Pages/MenuPanelShowRecovery.test';
import MainPanelContentReplacement from './Pages/MainPanelContentReplacement.test';
import MenuPanelContentFailure from './Pages/MenuPanelContentFailure.test';
import SelectionContextReplacement from './Lifecycle/SelectionContextReplacement.test';
import SelectionPanelCreation from './Lifecycle/SelectionPanelCreation.test';
import SelectionPanelReferences from './Lifecycle/SelectionPanelReferences.test';
import SelectionContentRecovery from './Lifecycle/SelectionContentRecovery.test';
import SelectionMoveRecovery from './Lifecycle/SelectionMoveRecovery.test';
import SelectionExtensionConnection from './Lifecycle/SelectionExtensionConnection.test';
import SelectionDisconnect from './Lifecycle/SelectionDisconnect.test';
import SelectionEventDelivery from './Lifecycle/SelectionEventDelivery.test';
import SelectionInMemoryState from './Lifecycle/SelectionInMemoryState.test';
import SelectionShowRecovery from './Lifecycle/SelectionShowRecovery.test';
import SelectionRepeatedMovement from './Stability/SelectionRepeatedMovement.test';
import SelectionSequentialDelivery from './Stability/SelectionSequentialDelivery.test';
import SelectionRepeatedContent from './Stability/SelectionRepeatedContent.test';
import SelectionReferenceReplacement from './Stability/SelectionReferenceReplacement.test';
import SelectionBurstEvents from './Stability/SelectionBurstEvents.test';
import SelectionNoPanelReads from './Stability/SelectionNoPanelReads.test';
import SelectionPanelReuse from './Stability/SelectionPanelReuse.test';
import SelectionEventSequence from './Selection/SelectionEventSequence.test';
import SelectionSnapshotConsistency from './Selection/SelectionSnapshotConsistency.test';
import SelectionServiceFlow from './Selection/SelectionServiceFlow.test';
import SelectionCreateRecovery from './Selection/SelectionCreateRecovery.test';
import SelectionPanelLifecycle from './Selection/SelectionPanelLifecycle.test';
import SelectionModelState from './Selection/SelectionModelState.test';
import SelectionContentSequence from './Selection/SelectionContentSequence.test';
import SelectionMenuContentRoute from './Selection/SelectionMenuContentRoute.test';
import SelectionInputMetadata from './Selection/SelectionInputMetadata.test';
import SelectionInfoModel from './Selection/SelectionInfoModel.test';
import SelectionMenuPanelConfiguration from './Selection/SelectionMenuPanelConfiguration.test';
import SelectionModelIsolation from './Selection/SelectionModelIsolation.test';
import SelectionContentCatalog from './Selection/SelectionContentCatalog.test';
import SelectionOperationOrder from './Selection/SelectionOperationOrder.test';
import SelectionWithoutPanel from './Selection/SelectionWithoutPanel.test';
import SelectionRepeatedWorkflow from './Selection/SelectionRepeatedWorkflow.test';
import SelectionBundleMetadata from './Contracts/SelectionBundleMetadata.test';
import SelectionContextIdentity from './Contracts/SelectionContextIdentity.test';
import SelectionInfoIdentity from './Contracts/SelectionInfoIdentity.test';
import SelectionListenerRegistration from './Contracts/SelectionListenerRegistration.test';
import SelectionContentFailureState from './Contracts/SelectionContentFailureState.test';
import SelectionCompletedEvent from './Contracts/SelectionCompletedEvent.test';
import SelectionContentReadFailure from './Contracts/SelectionContentReadFailure.test';
import SelectionDisconnectIdentity from './Contracts/SelectionDisconnectIdentity.test';
import SelectionLiteralContent from './ContentSafety/SelectionLiteralContent.test';
import SelectionUnicodeIdentity from './ContentSafety/SelectionUnicodeIdentity.test';
import SelectionMarkupIdentity from './ContentSafety/SelectionMarkupIdentity.test';
import SelectionMoveFailure from './Validation/SelectionMoveFailure.test';
import SelectionCoordinateBoundaries from './Validation/SelectionCoordinateBoundaries.test';
import SelectionHiddenListenerFailure from './Validation/SelectionHiddenListenerFailure.test';
import SelectionCreateFailure from './Validation/SelectionCreateFailure.test';
import SelectionShowFailure from './Validation/SelectionShowFailure.test';
import SelectionPanelUiContentFailure from './Validation/SelectionPanelUiContentFailure.test';
import SelectionInputTypes from './Validation/SelectionInputTypes.test';
import SelectionCoordinateIdentity from './Validation/SelectionCoordinateIdentity.test';
import SelectionFailureContinuation from './Validation/SelectionFailureContinuation.test';
import SelectionPointerCoordinates from './Validation/SelectionPointerCoordinates.test';
import SelectionPageResourceFailure from './Validation/SelectionPageResourceFailure.test';

export default function testsuite(): void {
  abilityTest();
  SelectionCrossField();
  SelectionFlowRegression();
  SelectionDisplayCoordinates();
  SelectionServiceIntegration();
  SelectionUnicodeContent();
  SelectionLocalContent();
  SelectionInputModes();
  SelectionContextIntegration();
  SelectionReplacementScenarios();
  MainPanelTextRendering();
  MenuPanelButtons();
  MainPanelLongContent();
  MainPanelSnapshotBinding();
  MenuPanelPositioning();
  MenuPanelDestroyedEvent();
  MenuPanelReuse();
  MenuPanelEntryLaunch();
  MenuPanelMissingContext();
  MainPanelDrag();
  MainPanelEmptyContent();
  MenuPanelShowRecovery();
  MainPanelContentReplacement();
  MenuPanelContentFailure();
  SelectionContextReplacement();
  SelectionPanelCreation();
  SelectionPanelReferences();
  SelectionContentRecovery();
  SelectionMoveRecovery();
  SelectionExtensionConnection();
  SelectionDisconnect();
  SelectionEventDelivery();
  SelectionInMemoryState();
  SelectionShowRecovery();
  SelectionRepeatedMovement();
  SelectionSequentialDelivery();
  SelectionRepeatedContent();
  SelectionReferenceReplacement();
  SelectionBurstEvents();
  SelectionNoPanelReads();
  SelectionPanelReuse();
  SelectionEventSequence();
  SelectionSnapshotConsistency();
  SelectionServiceFlow();
  SelectionCreateRecovery();
  SelectionPanelLifecycle();
  SelectionModelState();
  SelectionContentSequence();
  SelectionMenuContentRoute();
  SelectionInputMetadata();
  SelectionInfoModel();
  SelectionMenuPanelConfiguration();
  SelectionModelIsolation();
  SelectionContentCatalog();
  SelectionOperationOrder();
  SelectionWithoutPanel();
  SelectionRepeatedWorkflow();
  SelectionBundleMetadata();
  SelectionContextIdentity();
  SelectionInfoIdentity();
  SelectionListenerRegistration();
  SelectionContentFailureState();
  SelectionCompletedEvent();
  SelectionContentReadFailure();
  SelectionDisconnectIdentity();
  SelectionLiteralContent();
  SelectionUnicodeIdentity();
  SelectionMarkupIdentity();
  SelectionMoveFailure();
  SelectionCoordinateBoundaries();
  SelectionHiddenListenerFailure();
  SelectionCreateFailure();
  SelectionShowFailure();
  SelectionPanelUiContentFailure();
  SelectionInputTypes();
  SelectionCoordinateIdentity();
  SelectionFailureContinuation();
  SelectionPointerCoordinates();
  SelectionPageResourceFailure();
}

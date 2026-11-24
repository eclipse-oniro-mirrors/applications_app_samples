/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { beforeEachIt } from '@ohos/hypium';
import resolutionWidthTest from './logic/ResolutionWidth.test';
import resolutionHeightTest from './logic/ResolutionHeight.test';
import resolutionLabelTest from './logic/ResolutionLabel.test';
import resolutionRatioTest from './logic/ResolutionRatio.test';
import resolutionFindTest from './logic/ResolutionFind.test';
import resolutionValidTest from './logic/ResolutionValid.test';
import resolutionChangeTest from './logic/ResolutionChange.test';
import profileFormatTest from './logic/ProfileFormat.test';
import videoFrameAllowedTest from './logic/VideoFrameAllowed.test';
import previewSelectTest from './logic/PreviewSelect.test';
import exactProfileTest from './logic/ExactProfile.test';
import selectCameraDeviceTest from './logic/SelectCameraDevice.test';
import sceneModeSupportTest from './logic/SceneModeSupport.test';
import deviceGuardsTest from './logic/DeviceGuards.test';
import configRatioSelectedTest from './logic/ConfigRatioSelected.test';
import dynamicConfigRatioTest from './logic/DynamicConfigRatio.test';
import angleDiffTest from './logic/AngleDiff.test';
import updateRotationAngleTest from './logic/UpdateRotationAngle.test';
import snapshotRotationTest from './logic/SnapshotRotation.test';
import saveRotationInfoTest from './logic/SaveRotationInfo.test';
import deviceDegreeTest from './logic/DeviceDegree.test';
import xComponentSizeTest from './logic/XComponentSize.test';
import switchCameraPositionTest from './logic/SwitchCameraPosition.test';
import modeSwitchNeedsTest from './logic/ModeSwitchNeeds.test';
import foldDeviceIndexTest from './logic/FoldDeviceIndex.test';
import foldFallbackTest from './logic/FoldFallback.test';
import foldStatusUpdateTest from './logic/FoldStatusUpdate.test';
import showResolutionSelectTest from './logic/ShowResolutionSelect.test';
import sliderRangeTest from './logic/SliderRange.test';
import sliderStepTest from './logic/SliderStep.test';
import zoomClampTest from './logic/ZoomClamp.test';
import zoomRoundLabelTest from './logic/ZoomRoundLabel.test';
import editSceneTest from './logic/EditScene.test';
import saveToastTest from './logic/SaveToast.test';
import recordingGuardTest from './logic/RecordingGuard.test';
import firstRecordingActionTest from './logic/FirstRecordingAction.test';
import pageReloadTest from './logic/PageReload.test';
import errorAndRouteTest from './logic/ErrorAndRoute.test';
import resolutionPageFlowTest from './logic/ResolutionPageFlow.test';
import resolutionChangeFlowTest from './logic/ResolutionChangeFlow.test';
import resolutionIndexFlowTest from './logic/ResolutionIndexFlow.test';
import cameraInit2FlowTest from './logic/CameraInit2Flow.test';
import cameraInit2SequenceTest from './logic/CameraInit2Sequence.test';
import profileSelectionFlowTest from './logic/ProfileSelectionFlow.test';
import eventNotifyFlowTest from './logic/EventNotifyFlow.test';
import editPageFlowTest from './logic/EditPageFlow.test';
import resolutionDecisionMatrixTest from './logic/ResolutionDecisionMatrix.test';
import resolutionProfileMatrixTest from './logic/ResolutionProfileMatrix.test';
import resolutionLifecycleMatrixTest from './logic/ResolutionLifecycleMatrix.test';
import resolutionConstantsCoreTest from './core/ResolutionConstantsCore.test';
import resolutionTableCoreTest from './core/ResolutionTableCore.test';
import profileContractCoreTest from './core/ProfileContractCore.test';

function yieldToEventLoop(): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, 1);
  });
}

export default function testsuite() {
  beforeEachIt(yieldToEventLoop);
  resolutionWidthTest();
  resolutionHeightTest();
  resolutionLabelTest();
  resolutionRatioTest();
  resolutionFindTest();
  resolutionValidTest();
  resolutionChangeTest();
  profileFormatTest();
  videoFrameAllowedTest();
  previewSelectTest();
  exactProfileTest();
  selectCameraDeviceTest();
  sceneModeSupportTest();
  deviceGuardsTest();
  configRatioSelectedTest();
  dynamicConfigRatioTest();
  angleDiffTest();
  updateRotationAngleTest();
  snapshotRotationTest();
  saveRotationInfoTest();
  deviceDegreeTest();
  xComponentSizeTest();
  switchCameraPositionTest();
  modeSwitchNeedsTest();
  foldDeviceIndexTest();
  foldFallbackTest();
  foldStatusUpdateTest();
  showResolutionSelectTest();
  sliderRangeTest();
  sliderStepTest();
  zoomClampTest();
  zoomRoundLabelTest();
  editSceneTest();
  saveToastTest();
  recordingGuardTest();
  firstRecordingActionTest();
  pageReloadTest();
  errorAndRouteTest();
  resolutionPageFlowTest();
  resolutionChangeFlowTest();
  resolutionIndexFlowTest();
  cameraInit2FlowTest();
  cameraInit2SequenceTest();
  profileSelectionFlowTest();
  eventNotifyFlowTest();
  editPageFlowTest();
  resolutionDecisionMatrixTest();
  resolutionProfileMatrixTest();
  resolutionLifecycleMatrixTest();
  resolutionConstantsCoreTest();
  resolutionTableCoreTest();
  profileContractCoreTest();
}

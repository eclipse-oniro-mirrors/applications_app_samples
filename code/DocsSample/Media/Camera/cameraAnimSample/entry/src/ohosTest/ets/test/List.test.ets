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

import { beforeEachIt } from '@ohos/hypium';
import fillTest from './logic/Fill.test';
import focusFrameOffsetTest from './logic/FocusFrameOffset.test';
import flashIconTest from './logic/FlashIcon.test';
import whiteBalanceTextTest from './logic/WhiteBalanceText.test';
import whiteBalanceValidTest from './logic/WhiteBalanceValid.test';
import switchCameraIndexTest from './logic/SwitchCameraIndex.test';
import captureMirrorTest from './logic/CaptureMirror.test';
import sliderSettingsTest from './logic/SliderSettings.test';
import zoomRoundTest from './logic/ZoomRound.test';
import zoomLabelTest from './logic/ZoomLabel.test';
import snapshotGuardTest from './logic/SnapshotGuard.test';
import videoUriTest from './logic/VideoUri.test';
import sceneModeTextTest from './logic/SceneModeText.test';
import nextFlagTest from './logic/NextFlag.test';
import concatDateTest from './logic/ConcatDate.test';
import concatTimeTest from './logic/ConcatTime.test';
import focusPointXTest from './logic/FocusPointX.test';
import focusPointYTest from './logic/FocusPointY.test';
import videoTimeTest from './logic/VideoTime.test';
import zoomClampTest from './logic/ZoomClamp.test';
import exposureBiasClampTest from './logic/ExposureBiasClamp.test';
import meteringPointTest from './logic/MeteringPoint.test';
import px2vpTest from './logic/Px2Vp.test';
import zoomCycleTest from './logic/ZoomCycle.test';
import deviceIndexValidTest from './logic/DeviceIndexValid.test';
import sceneModeSupportedTest from './logic/SceneModeSupported.test';
import videoFrameAllowedTest from './logic/VideoFrameAllowed.test';
import profileMatchTest from './logic/ProfileMatch.test';
import cameraPositionTest from './logic/CameraPosition.test';
import editSceneContractTest from './logic/EditSceneContract.test';
import cameraSessionInitTest from './logic/CameraSessionInit.test';
import cameraSessionReleaseTest from './logic/CameraSessionRelease.test';
import cameraSessionSwitchTest from './logic/CameraSessionSwitch.test';
import cameraSessionCaptureTest from './logic/CameraSessionCapture.test';
import cameraSessionVideoTest from './logic/CameraSessionVideo.test';
import cameraSessionFlashTest from './logic/CameraSessionFlash.test';
import cameraSessionFocusTest from './logic/CameraSessionFocus.test';
import cameraSessionZoomTest from './logic/CameraSessionZoom.test';
import animateStateTest from './logic/AnimateState.test';
import animateSequenceTest from './logic/AnimateSequence.test';
import animateModeSwitchTest from './logic/AnimateModeSwitch.test';
import animateSwitchCameraTest from './logic/AnimateSwitchCamera.test';
import animateCaptureTest from './logic/AnimateCapture.test';
import animateFrameStartTest from './logic/AnimateFrameStart.test';
import whiteBalanceModelFlowTest from './logic/WhiteBalanceModelFlow.test';
import flashingLightModelFlowTest from './logic/FlashingLightModelFlow.test';
import slideModelFlowTest from './logic/SlideModelFlow.test';
import editPageModelFlowTest from './logic/EditPageModelFlow.test';
import globalContextModelFlowTest from './logic/GlobalContextModelFlow.test';
import profileFindTest from './logic/ProfileFind.test';
import cameraPipelineTest from './logic/CameraPipeline.test';
import boundaryEnvelopeTest from './logic/BoundaryEnvelope.test';
import cameraEventNotifyTest from './logic/CameraEventNotify.test';
import cameraConstantsCoreTest from './core/CameraConstantsCore.test';
import cameraAnimationCoreTest from './core/CameraAnimationCore.test';
import cameraServiceCoreTest from './core/CameraServiceCore.test';

function yieldToEventLoop(): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, 1);
  });
}

export default function testsuite() {
  beforeEachIt(yieldToEventLoop);
  fillTest();
  focusFrameOffsetTest();
  flashIconTest();
  whiteBalanceTextTest();
  whiteBalanceValidTest();
  switchCameraIndexTest();
  captureMirrorTest();
  sliderSettingsTest();
  zoomRoundTest();
  zoomLabelTest();
  snapshotGuardTest();
  videoUriTest();
  sceneModeTextTest();
  nextFlagTest();
  concatDateTest();
  concatTimeTest();
  focusPointXTest();
  focusPointYTest();
  videoTimeTest();
  zoomClampTest();
  exposureBiasClampTest();
  meteringPointTest();
  px2vpTest();
  zoomCycleTest();
  deviceIndexValidTest();
  sceneModeSupportedTest();
  videoFrameAllowedTest();
  profileMatchTest();
  cameraPositionTest();
  editSceneContractTest();
  cameraSessionInitTest();
  cameraSessionReleaseTest();
  cameraSessionSwitchTest();
  cameraSessionCaptureTest();
  cameraSessionVideoTest();
  cameraSessionFlashTest();
  cameraSessionFocusTest();
  cameraSessionZoomTest();
  animateStateTest();
  animateSequenceTest();
  animateModeSwitchTest();
  animateSwitchCameraTest();
  animateCaptureTest();
  animateFrameStartTest();
  whiteBalanceModelFlowTest();
  flashingLightModelFlowTest();
  slideModelFlowTest();
  editPageModelFlowTest();
  globalContextModelFlowTest();
  profileFindTest();
  cameraPipelineTest();
  boundaryEnvelopeTest();
  cameraEventNotifyTest();
  cameraConstantsCoreTest();
  cameraAnimationCoreTest();
  cameraServiceCoreTest();
}

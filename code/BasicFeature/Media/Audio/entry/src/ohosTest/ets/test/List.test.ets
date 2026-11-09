/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import audioTest01 from './AudioTest01.test';
import audioTest02 from './AudioTest02.test';
import audioIndexNav from './AudioIndexNav.test';
import audioPresetSelect from './AudioPresetSelect.test';
import audioRecordStateMachine from './AudioRecordStateMachine.test';
import audioEffectMatrix from './AudioEffectMatrix.test';
import audioCaptureLifecycle from './AudioCaptureLifecycle.test';
import audioFocusInteraction from './AudioFocusInteraction.test';
import audioPageRoundTrip from './AudioPageRoundTrip.test';
import audioLifecycleResource from './AudioLifecycleResource.test';
import audioRecordingLifecycle from './AudioRecordingLifecycle.test';
import audioProbe from './AudioProbe.test';
import audioSpatialState from './AudioSpatialState.test';
import audioKaraokeState from './AudioKaraokeState.test';
import audioCaptureTabsTest from './AudioCaptureTabs.test';
import audioResourceWiringTest from './AudioResourceWiring.test';
import audioDevicePageTest from './AudioDevicePage.test';
import audioResourceExtraTest from './AudioResourceExtra.test';
import audioDriverLogicTest from './AudioDriverLogic.test';
import audioResourceContractTest from './AudioResourceContract.test';
import audioDriverLogicExtraTest from './AudioDriverLogicExtra.test';
import audioResourceAllKeysTest from './AudioResourceAllKeys.test';
import audioResourceTypesTest from './AudioResourceTypes.test';
import audioDriverLogicMoreTest from './AudioDriverLogicMore.test';

export default function testsuite() {
  audioEffectMatrix();
  audioTest01();
  audioTest02();
  audioIndexNav();
  audioPresetSelect();
  audioRecordStateMachine();
  audioCaptureLifecycle();
  audioFocusInteraction();
  audioPageRoundTrip();
  audioLifecycleResource();
  audioRecordingLifecycle();
  audioProbe();
  audioSpatialState();
  audioKaraokeState();
  audioCaptureTabsTest();
  audioResourceWiringTest();
  audioDevicePageTest();
  audioResourceExtraTest();
  audioDriverLogicTest();
  audioResourceContractTest();
  audioDriverLogicExtraTest();
  audioResourceAllKeysTest();
  audioResourceTypesTest();
  audioDriverLogicMoreTest();
}
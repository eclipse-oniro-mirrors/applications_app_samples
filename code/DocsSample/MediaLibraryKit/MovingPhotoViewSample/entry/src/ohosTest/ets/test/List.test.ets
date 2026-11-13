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

import abilityTest from './MovingPhotoView.test';
import movingPhotoViewExtendedTest from './MovingPhotoViewExtended.test';
import movingPhotoTextMatrixTest from './MovingPhotoTextMatrix.test';
import movingPhotoConfigMatrixTest from './MovingPhotoConfigMatrix.test';
import movingPhotoBundleLongMatrixTest from './MovingPhotoBundleLongMatrix.test';
import movingPhotoPlaybackControlTest from './MovingPhotoPlaybackControl.test';
import movingPhotoUiContractTest from './MovingPhotoUiContract.test';
import movingPhotoControllerContractTest from './MovingPhotoControllerContract.test';
import movingPhotoMediaDeepTest from './MovingPhotoMediaDeep.test';
import movingPhotoPlaybackSequenceTest from './MovingPhotoPlaybackSequence.test';
import movingPhotoUiElementsTest from './MovingPhotoUiElements.test';
import movingPhotoControllerInstancesTest from './MovingPhotoControllerInstances.test';

import movingPhotoPlusUiTest from './MovingPhotoPlusUi.test';
import movingPhotoPlusControllerTest from './MovingPhotoPlusController.test';
import movingPhotoPlusConfigDeepTest from './MovingPhotoPlusConfigDeep.test';
import movingPhotoPlusConfigTest from './MovingPhotoPlusConfig.test';
import movingPhotoPlusControllerDeepTest from './MovingPhotoPlusControllerDeep.test';
import movingPhotoPlusLifecycleDeepTest from './MovingPhotoPlusLifecycleDeep.test';
import movingPhotoPlusLifecycleTest from './MovingPhotoPlusLifecycle.test';
import movingPhotoPlaybackLongMatrixTest from './MovingPhotoPlaybackLongMatrix.test';
import movingPhotoPlusMediaDeepTest from './MovingPhotoPlusMediaDeep.test';
import movingPhotoPlusBundleTest from './MovingPhotoPlusBundle.test';
import movingPhotoPlusResourceTest from './MovingPhotoPlusResource.test';
import movingPhotoPlusBundleDeepTest from './MovingPhotoPlusBundleDeep.test';
import movingPhotoMuteLongMatrixTest from './MovingPhotoMuteLongMatrix.test';
import movingPhotoMuteMatrixTest from './MovingPhotoMuteMatrix.test';
import movingPhotoPlaybackMatrixTest from './MovingPhotoPlaybackMatrix.test';
export default function testsuite() {
  abilityTest();
  movingPhotoViewExtendedTest();
movingPhotoTextMatrixTest();
movingPhotoConfigMatrixTest();
movingPhotoBundleLongMatrixTest();
movingPhotoPlaybackControlTest();
  movingPhotoUiContractTest();
  movingPhotoControllerContractTest();
  movingPhotoMediaDeepTest();
  movingPhotoPlaybackSequenceTest();
  movingPhotoUiElementsTest();
  movingPhotoControllerInstancesTest();
movingPhotoPlusUiTest();
  movingPhotoPlusControllerTest();
  movingPhotoPlusConfigDeepTest();
  movingPhotoPlusConfigTest();
  movingPhotoPlusControllerDeepTest();
  movingPhotoPlusLifecycleDeepTest();
  movingPhotoPlusLifecycleTest();
  movingPhotoPlaybackLongMatrixTest();
  movingPhotoPlusMediaDeepTest();
  movingPhotoPlusBundleTest();
  movingPhotoPlusResourceTest();
  movingPhotoPlusBundleDeepTest();
  movingPhotoMuteLongMatrixTest();
  movingPhotoMuteMatrixTest();
  movingPhotoPlaybackMatrixTest();
}

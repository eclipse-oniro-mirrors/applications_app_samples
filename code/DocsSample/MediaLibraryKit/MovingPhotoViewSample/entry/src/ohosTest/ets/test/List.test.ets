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
import movingPhotoPlaybackMatrixTest from './MovingPhotoPlaybackMatrix.test';
import movingPhotoControllerMatrixTest from './MovingPhotoControllerMatrix.test';
import movingPhotoBundleMatrixTest from './MovingPhotoBundleMatrix.test';
import movingPhotoTextMatrixTest from './MovingPhotoTextMatrix.test';
import movingPhotoResourceMatrixTest from './MovingPhotoResourceMatrix.test';
import movingPhotoControllerStateMatrixTest from './MovingPhotoControllerStateMatrix.test';
import movingPhotoMuteMatrixTest from './MovingPhotoMuteMatrix.test';
import movingPhotoConfigMatrixTest from './MovingPhotoConfigMatrix.test';
import movingPhotoControllerApiMatrixTest from './MovingPhotoControllerApiMatrix.test';
import movingPhotoPlaybackLongMatrixTest from './MovingPhotoPlaybackLongMatrix.test';
import movingPhotoMuteLongMatrixTest from './MovingPhotoMuteLongMatrix.test';
import movingPhotoBundleLongMatrixTest from './MovingPhotoBundleLongMatrix.test';
import movingPhotoControllerLongMatrixTest from './MovingPhotoControllerLongMatrix.test';
import movingPhotoExtraMatrixTest from './MovingPhotoExtraMatrix.test';
import movingPhotoTailMatrixTest from './MovingPhotoTailMatrix.test';
import movingPhotoMediaAssetsTest from './MovingPhotoMediaAssets.test';
import movingPhotoPlaybackControlTest from './MovingPhotoPlaybackControl.test';
import movingPhotoUiContractTest from './MovingPhotoUiContract.test';
import movingPhotoControllerContractTest from './MovingPhotoControllerContract.test';
import movingPhotoMediaDeepTest from './MovingPhotoMediaDeep.test';
import movingPhotoPlaybackSequenceTest from './MovingPhotoPlaybackSequence.test';
import movingPhotoUiElementsTest from './MovingPhotoUiElements.test';
import movingPhotoControllerInstancesTest from './MovingPhotoControllerInstances.test';

export default function testsuite() {
  abilityTest();
  movingPhotoViewExtendedTest();
  movingPhotoPlaybackMatrixTest();
  movingPhotoControllerMatrixTest();
  movingPhotoBundleMatrixTest();
  movingPhotoTextMatrixTest();
  movingPhotoResourceMatrixTest();
  movingPhotoControllerStateMatrixTest();
  movingPhotoMuteMatrixTest();
  movingPhotoConfigMatrixTest();
  movingPhotoControllerApiMatrixTest();
  movingPhotoPlaybackLongMatrixTest();
  movingPhotoMuteLongMatrixTest();
  movingPhotoBundleLongMatrixTest();
  movingPhotoControllerLongMatrixTest();
  movingPhotoExtraMatrixTest();
  movingPhotoTailMatrixTest();
  movingPhotoMediaAssetsTest();
  movingPhotoPlaybackControlTest();
  movingPhotoUiContractTest();
  movingPhotoControllerContractTest();
  movingPhotoMediaDeepTest();
  movingPhotoPlaybackSequenceTest();
  movingPhotoUiElementsTest();
  movingPhotoControllerInstancesTest();
}

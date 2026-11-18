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
import KeyboardSoundTest from './KeyboardSound.test';
import KeyboardSoundSolutionTest from './KeyboardSoundSolutionTest.test';

import keyboardSoundConstantsCoreTest from './KeyboardSoundConstantsCore.test';
import keyboardSoundPcmMathTest from './KeyboardSoundPcmMath.test';
import keyboardSoundControllerContractTest from './KeyboardSoundControllerContract.test';
import keyboardSoundRendererOptionsTest from './KeyboardSoundRendererOptions.test';

import keyboardSoundPcmEdgeTest from './KeyboardSoundPcmEdge.test';
import keyboardSoundStrategyMatrixTest from './KeyboardSoundStrategyMatrix.test';
import keyboardSoundControllerStateTest from './KeyboardSoundControllerState.test';

import keyboardSoundFrameMatrixTest from './KeyboardSoundFrameMatrix.test';
import keyboardSoundUsageMatrixTest from './KeyboardSoundUsageMatrix.test';
import keyboardSoundControllerResetTest from './KeyboardSoundControllerReset.test';

import keyboardSoundSessionStrategyCoreTest from './KeyboardSoundSessionStrategyCore.test';
import keyboardSoundDurationEnvelopeCoreTest from './KeyboardSoundDurationEnvelopeCore.test';
import keyboardSoundControllerGuardMatrixTest from './KeyboardSoundControllerGuardMatrix.test';
import keyboardSoundUiCounterCoreTest from './KeyboardSoundUiCounterCore.test';

import keyboardSoundPcmWaveformCoreTest from './KeyboardSoundPcmWaveformCore.test';
import keyboardSoundSessionTransitionCoreTest from './KeyboardSoundSessionTransitionCore.test';
import keyboardSoundMultiKeyCoreTest from './KeyboardSoundMultiKeyCore.test';
import keyboardSoundPcmFrameEdgeTest from './KeyboardSoundPcmFrameEdge.test';
import keyboardSoundSceneGuardCoreTest from './KeyboardSoundSceneGuardCore.test';

export default function testsuite(): void {
  KeyboardSoundTest();
  KeyboardSoundSolutionTest();
  keyboardSoundConstantsCoreTest();
  keyboardSoundPcmMathTest();
  keyboardSoundControllerContractTest();
  keyboardSoundRendererOptionsTest();
  keyboardSoundPcmEdgeTest();
  keyboardSoundStrategyMatrixTest();
  keyboardSoundControllerStateTest();
  keyboardSoundFrameMatrixTest();
  keyboardSoundUsageMatrixTest();
  keyboardSoundControllerResetTest();
  keyboardSoundSessionStrategyCoreTest();
  keyboardSoundDurationEnvelopeCoreTest();
  keyboardSoundControllerGuardMatrixTest();
  keyboardSoundUiCounterCoreTest();
  keyboardSoundPcmWaveformCoreTest();
  keyboardSoundSessionTransitionCoreTest();
  keyboardSoundMultiKeyCoreTest();
  keyboardSoundPcmFrameEdgeTest();
  keyboardSoundSceneGuardCoreTest();
}

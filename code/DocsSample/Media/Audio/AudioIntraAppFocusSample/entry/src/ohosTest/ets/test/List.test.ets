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
import AbilityTest from './Ability.test';
import audioFocusConstantsCoreTest from './AudioFocusConstantsCore.test';
import audioFocusUsageMappingCoreTest from './AudioFocusUsageMappingCore.test';
import audioFocusStateContractTest from './AudioFocusStateContract.test';
import audioFocusControllerNegativeTest from './AudioFocusControllerNegative.test';
import audioFocusInterruptMatrixTest from './AudioFocusInterruptMatrix.test';
import audioFocusPcmMathTest from './AudioFocusPcmMath.test';
import audioFocusScenarioCoreTest from './AudioFocusScenarioCore.test';
import audioFocusEnumCoreTest from './AudioFocusEnumCore.test';
import audioFocusControllerStateTest from './AudioFocusControllerState.test';
import audioFocusRoutingCoreTest from './AudioFocusRoutingCore.test';
import audioFocusBufferContractTest from './AudioFocusBufferContract.test';
import audioFocusPageFlowCoreTest from './AudioFocusPageFlowCore.test';
import audioFocusPcmEdgeTest from './AudioFocusPcmEdge.test';
import audioFocusUiMatrixTest from './AudioFocusUiMatrix.test';
import audioFocusRendererContractTest from './AudioFocusRendererContract.test';
import audioFocusPlaybackUiTest from './AudioFocusPlaybackUi.test';
import audioFocusInterruptGuardCoreTest from './AudioFocusInterruptGuardCore.test';
import audioFocusRenderingPipelineCoreTest from './AudioFocusRenderingPipelineCore.test';
import audioFocusStrategySelectionCoreTest from './AudioFocusStrategySelectionCore.test';
import audioFocusPageControlCoreTest from './AudioFocusPageControlCore.test';
import audioFocusDuckingCoreTest from './AudioFocusDuckingCore.test';
import audioFocusBufferTimelineCoreTest from './AudioFocusBufferTimelineCore.test';
import audioFocusScenarioStateCoreTest from './AudioFocusScenarioStateCore.test';

export default function ListTest() {
  AbilityTest();
  audioFocusConstantsCoreTest();
  audioFocusUsageMappingCoreTest();
  audioFocusStateContractTest();
  audioFocusControllerNegativeTest();
  audioFocusInterruptMatrixTest();
  audioFocusPcmMathTest();
  audioFocusScenarioCoreTest();
  audioFocusEnumCoreTest();
  audioFocusControllerStateTest();
  audioFocusRoutingCoreTest();
  audioFocusBufferContractTest();
  audioFocusPageFlowCoreTest();
  audioFocusPcmEdgeTest();
  audioFocusUiMatrixTest();
  audioFocusRendererContractTest();
  audioFocusPlaybackUiTest();
  audioFocusInterruptGuardCoreTest();
  audioFocusRenderingPipelineCoreTest();
  audioFocusStrategySelectionCoreTest();
  audioFocusPageControlCoreTest();
  audioFocusDuckingCoreTest();
  audioFocusBufferTimelineCoreTest();
  audioFocusScenarioStateCoreTest();
}

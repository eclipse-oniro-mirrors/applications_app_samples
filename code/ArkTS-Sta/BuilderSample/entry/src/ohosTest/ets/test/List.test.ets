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

import abilityTest from './Ability.test';
import colorPaletteTest from './Colors/PaletteBasics.test';
import colorContrastTest from './Colors/ColorContrast.test';
import sizeMetricsTest from './Sizes/SizeMetrics.test';
import layoutDerivedTest from './Sizes/LayoutDerived.test';
import spacingPlanTest from './Sizes/SpacingPlan.test';
import uiCopyTest from './Strings/UiCopy.test';
import contractShapesTest from './Model/ContractShapes.test';
import pageCompositionTest from './Integration/PageComposition.test';
import relationsTest from './Integration/Relations.test';
import crossChecksTest from './Integration/CrossChecks.test';
import bindingContractTest from './Binding/BindingContract.test';
import initialStateTest from './State/InitialState.test';
import placeholderStateTest from './State/PlaceholderState.test';
import textPropagationTest from './State/TextPropagation.test';
import sequenceShortTest from './State/SequenceShort.test';
import sequenceFourTest from './State/SequenceFour.test';
import sequenceFiveUTest from './State/SequenceFiveU.test';
import sequenceFiveATest from './State/SequenceFiveA.test';
import sequenceFiveNTest from './State/SequenceFiveN.test';
import sequenceFiveCTest from './State/SequenceFiveC.test';

export default function testsuite(): void {
  abilityTest();
  colorPaletteTest();
  colorContrastTest();
  sizeMetricsTest();
  layoutDerivedTest();
  spacingPlanTest();
  uiCopyTest();
  contractShapesTest();
  pageCompositionTest();
  relationsTest();
  crossChecksTest();
  bindingContractTest();
  initialStateTest();
  placeholderStateTest();
  textPropagationTest();
  sequenceShortTest();
  sequenceFourTest();
  sequenceFiveUTest();
  sequenceFiveATest();
  sequenceFiveNTest();
  sequenceFiveCTest();
}

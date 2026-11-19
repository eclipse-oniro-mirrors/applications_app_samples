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
import abilityTest from './Ability.test';
import expansionConstantsCoreTest from './ExpansionConstantsCore.test';
import expansionConfigureCoreTest from './ExpansionConfigureCore.test';
import titleAttributeModelCoreTest from './TitleAttributeModelCore.test';
import animationAttributeModelCoreTest from './AnimationAttributeModelCore.test';
import memoDataModelCoreTest from './MemoDataModelCore.test';
import memoDataSourceCoreTest from './MemoDataSourceCore.test';
import indexUiStateTest from './IndexUiState.test';
import titleExpandUiStateTest from './TitleExpandUiState.test';
import titleMenuUiStateTest from './TitleMenuUiState.test';
import constantsValuesTest from './logic/ConstantsValues.test';
import animationAttributeCtorTest from './logic/AnimationAttributeCtor.test';
import animationAttributeCtor2Test from './logic/AnimationAttributeCtor2.test';
import configureValuesTest from './logic/ConfigureValues.test';
import memoDataSourceTotalCountTest from './logic/MemoDataSourceTotalCount.test';
import memoDataSourceGetDataTest from './logic/MemoDataSourceGetData.test';
import memoDataSourceGetData2Test from './logic/MemoDataSourceGetData2.test';
import memoInfoCtorTest from './logic/MemoInfoCtor.test';
import memoInfoCtor2Test from './logic/MemoInfoCtor2.test';
import thresholdOfTest from './logic/ThresholdOf.test';
import thresholdOf2Test from './logic/ThresholdOf2.test';
import thresholdOf3Test from './logic/ThresholdOf3.test';
import heightChangeOfTest from './logic/HeightChangeOf.test';
import heightChangeOf2Test from './logic/HeightChangeOf2.test';
import heightChangeOf3Test from './logic/HeightChangeOf3.test';
import scaleRatioOfTest from './logic/ScaleRatioOf.test';
import scaleRatioOf2Test from './logic/ScaleRatioOf2.test';
import scaleRatioOf3Test from './logic/ScaleRatioOf3.test';
import titleOpacityOfTest from './logic/TitleOpacityOf.test';
import titleOpacityOf2Test from './logic/TitleOpacityOf2.test';
import titleOpacityOf3Test from './logic/TitleOpacityOf3.test';
import translateYOfTest from './logic/TranslateYOf.test';
import translateYOf2Test from './logic/TranslateYOf2.test';
import listOffsetOfTest from './logic/ListOffsetOf.test';
import listOffsetOf2Test from './logic/ListOffsetOf2.test';
import listOffsetOf3Test from './logic/ListOffsetOf3.test';
import settleHeightOfTest from './logic/SettleHeightOf.test';
import defaultAttributeTest from './logic/DefaultAttribute.test';
import throttleGateCtorTest from './logic/ThrottleGateCtor.test';
import throttleGateRequestTest from './logic/ThrottleGateRequest.test';
import throttleGateRequest2Test from './logic/ThrottleGateRequest2.test';
import titleExpansionStateCtorTest from './logic/TitleExpansionStateCtor.test';
import titleExpansionStateDidScrollTest from './logic/TitleExpansionStateDidScroll.test';
import titleExpansionStateDidScroll2Test from './logic/TitleExpansionStateDidScroll2.test';
import titleExpansionStateFrameBeginTest from './logic/TitleExpansionStateFrameBegin.test';
import titleExpansionStateFrameBegin2Test from './logic/TitleExpansionStateFrameBegin2.test';
import titleExpansionStateStopTest from './logic/TitleExpansionStateStop.test';
import titleExpansionStateScaleTest from './logic/TitleExpansionStateScale.test';
import titleExpansionStateOpacityTest from './logic/TitleExpansionStateOpacity.test';
import titleExpansionStateFlowTest from './logic/TitleExpansionStateFlow.test';
import titleExpansionStateFlow2Test from './logic/TitleExpansionStateFlow2.test';
import titleExpansionStateFlow3Test from './logic/TitleExpansionStateFlow3.test';
import titleExpansionStateFlow4Test from './logic/TitleExpansionStateFlow4.test';
import titleExpansionStateFlow5Test from './logic/TitleExpansionStateFlow5.test';
import mockDataConstantsTest from './logic/MockDataConstants.test';
import titleExpansionLogicConstantsTest from './logic/TitleExpansionLogicConstants.test';

function yieldToEventLoop(): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => { resolve(); }, 1);
  });
}

export default function testsuite() {
  beforeEachIt(yieldToEventLoop);
  abilityTest();
  expansionConstantsCoreTest();
  expansionConfigureCoreTest();
  titleAttributeModelCoreTest();
  animationAttributeModelCoreTest();
  memoDataModelCoreTest();
  memoDataSourceCoreTest();
  indexUiStateTest();
  titleExpandUiStateTest();
  titleMenuUiStateTest();
  constantsValuesTest();
  animationAttributeCtorTest();
  animationAttributeCtor2Test();
  configureValuesTest();
  memoDataSourceTotalCountTest();
  memoDataSourceGetDataTest();
  memoDataSourceGetData2Test();
  memoInfoCtorTest();
  memoInfoCtor2Test();
  thresholdOfTest();
  thresholdOf2Test();
  thresholdOf3Test();
  heightChangeOfTest();
  heightChangeOf2Test();
  heightChangeOf3Test();
  scaleRatioOfTest();
  scaleRatioOf2Test();
  scaleRatioOf3Test();
  titleOpacityOfTest();
  titleOpacityOf2Test();
  titleOpacityOf3Test();
  translateYOfTest();
  translateYOf2Test();
  listOffsetOfTest();
  listOffsetOf2Test();
  listOffsetOf3Test();
  settleHeightOfTest();
  defaultAttributeTest();
  throttleGateCtorTest();
  throttleGateRequestTest();
  throttleGateRequest2Test();
  titleExpansionStateCtorTest();
  titleExpansionStateDidScrollTest();
  titleExpansionStateDidScroll2Test();
  titleExpansionStateFrameBeginTest();
  titleExpansionStateFrameBegin2Test();
  titleExpansionStateStopTest();
  titleExpansionStateScaleTest();
  titleExpansionStateOpacityTest();
  titleExpansionStateFlowTest();
  titleExpansionStateFlow2Test();
  titleExpansionStateFlow3Test();
  titleExpansionStateFlow4Test();
  titleExpansionStateFlow5Test();
  mockDataConstantsTest();
  titleExpansionLogicConstantsTest();
}

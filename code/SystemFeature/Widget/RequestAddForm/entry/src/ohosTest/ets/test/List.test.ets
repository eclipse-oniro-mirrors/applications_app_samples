/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import abilityTest from './Ability.test';
import formDimensionMappingCoreTest from './FormDimensionMappingCore.test';
import wantParamsModelCoreTest from './WantParamsModelCore.test';
import formBindingDataModelCoreTest from './FormBindingDataModelCore.test';
import loggerUtilityCoreTest from './LoggerUtilityCore.test';
import indexPageUiStateTest from './IndexPageUiState.test';
import formDimensionValueValuesTest from './logic/FormDimensionValueValues.test';
import publishWantOfTest from './logic/PublishWantOf.test';
import wantJsonOfTest from './logic/WantJsonOf.test';
import wantJsonOf2Test from './logic/WantJsonOf2.test';
import wantJsonOf3Test from './logic/WantJsonOf3.test';
import wantJsonOf4Test from './logic/WantJsonOf4.test';
import proxyCountOfTest from './logic/ProxyCountOf.test';
import proxyJsonOfTest from './logic/ProxyJsonOf.test';
import proxyJsonOf2Test from './logic/ProxyJsonOf2.test';
import publishLogOfTest from './logic/PublishLogOf.test';
import dimensionTextOfTest from './logic/DimensionTextOf.test';
import dimensionTextOf2Test from './logic/DimensionTextOf2.test';
import dimensionOfTextTest from './logic/DimensionOfText.test';
import dimensionOfText2Test from './logic/DimensionOfText2.test';
import isSupportedDimensionTest from './logic/IsSupportedDimension.test';
import cellCountOfTest from './logic/CellCountOf.test';
import cellCountOf2Test from './logic/CellCountOf2.test';
import updateIntervalMinutesOfTest from './logic/UpdateIntervalMinutesOf.test';
import updateIntervalMinutesOf2Test from './logic/UpdateIntervalMinutesOf2.test';
import updateIntervalMinutesOf3Test from './logic/UpdateIntervalMinutesOf3.test';
import minutesUntilScheduledTest from './logic/MinutesUntilScheduled.test';
import minutesUntilScheduled2Test from './logic/MinutesUntilScheduled2.test';
import minutesUntilScheduled3Test from './logic/MinutesUntilScheduled3.test';
import designScaleOfTest from './logic/DesignScaleOf.test';
import designScaleOf2Test from './logic/DesignScaleOf2.test';
import designScaleOf3Test from './logic/DesignScaleOf3.test';
import formRequestStateCtorTest from './logic/FormRequestStateCtor.test';
import formRequestStateRequestTest from './logic/FormRequestStateRequest.test';
import formRequestStateSucceedTest from './logic/FormRequestStateSucceed.test';
import formRequestStateSucceed2Test from './logic/FormRequestStateSucceed2.test';
import formRequestStateSucceed3Test from './logic/FormRequestStateSucceed3.test';
import formRequestStateFailTest from './logic/FormRequestStateFail.test';
import formRequestStateFail2Test from './logic/FormRequestStateFail2.test';
import formRequestStateFail3Test from './logic/FormRequestStateFail3.test';
import formRequestStateFlowTest from './logic/FormRequestStateFlow.test';
import formRequestStateFlow2Test from './logic/FormRequestStateFlow2.test';
import formRequestStateFlow3Test from './logic/FormRequestStateFlow3.test';
import formRequestStateFlow4Test from './logic/FormRequestStateFlow4.test';
import formRequestStateFlow5Test from './logic/FormRequestStateFlow5.test';
import formRequestStateFlow6Test from './logic/FormRequestStateFlow6.test';
import formRequestStateFlow7Test from './logic/FormRequestStateFlow7.test';
import requestAddFormLogicConstantsTest from './logic/RequestAddFormLogicConstants.test';

export default function testsuite() {
  beforeEachIt(async (done: Function) => {
    setTimeout(() => { done(); }, 1);
  });
  abilityTest();
  formDimensionMappingCoreTest();
  wantParamsModelCoreTest();
  formBindingDataModelCoreTest();
  loggerUtilityCoreTest();
  indexPageUiStateTest();
  formDimensionValueValuesTest();
  publishWantOfTest();
  wantJsonOfTest();
  wantJsonOf2Test();
  wantJsonOf3Test();
  wantJsonOf4Test();
  proxyCountOfTest();
  proxyJsonOfTest();
  proxyJsonOf2Test();
  publishLogOfTest();
  dimensionTextOfTest();
  dimensionTextOf2Test();
  dimensionOfTextTest();
  dimensionOfText2Test();
  isSupportedDimensionTest();
  cellCountOfTest();
  cellCountOf2Test();
  updateIntervalMinutesOfTest();
  updateIntervalMinutesOf2Test();
  updateIntervalMinutesOf3Test();
  minutesUntilScheduledTest();
  minutesUntilScheduled2Test();
  minutesUntilScheduled3Test();
  designScaleOfTest();
  designScaleOf2Test();
  designScaleOf3Test();
  formRequestStateCtorTest();
  formRequestStateRequestTest();
  formRequestStateSucceedTest();
  formRequestStateSucceed2Test();
  formRequestStateSucceed3Test();
  formRequestStateFailTest();
  formRequestStateFail2Test();
  formRequestStateFail3Test();
  formRequestStateFlowTest();
  formRequestStateFlow2Test();
  formRequestStateFlow3Test();
  formRequestStateFlow4Test();
  formRequestStateFlow5Test();
  formRequestStateFlow6Test();
  formRequestStateFlow7Test();
  requestAddFormLogicConstantsTest();
}

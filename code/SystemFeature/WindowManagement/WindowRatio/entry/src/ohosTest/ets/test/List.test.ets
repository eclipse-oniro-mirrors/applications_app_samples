/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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
import windowRatioRatioCoreTest from './RatioCore.test';
import windowRatioStorageModelTest from './StorageModel.test';
import windowRatioWindowModeEnumTest from './WindowModeEnum.test';
import windowRatioPageUiTest from './PageUi.test';
import ratioOfIndexTest from './logic/RatioOfIndex.test';
import ratioLabelOfIndexTest from './logic/RatioLabelOfIndex.test';
import sizeTextOfTest from './logic/SizeTextOf.test';
import sizeTextOf2Test from './logic/SizeTextOf2.test';
import heightForWidthTest from './logic/HeightForWidth.test';
import heightForWidth2Test from './logic/HeightForWidth2.test';
import heightForWidth3Test from './logic/HeightForWidth3.test';
import heightForWidth4Test from './logic/HeightForWidth4.test';
import widthForHeightTest from './logic/WidthForHeight.test';
import widthForHeight2Test from './logic/WidthForHeight2.test';
import widthForHeight3Test from './logic/WidthForHeight3.test';
import widthForHeight4Test from './logic/WidthForHeight4.test';
import roundedHeightForWidthTest from './logic/RoundedHeightForWidth.test';
import roundedHeightForWidth2Test from './logic/RoundedHeightForWidth2.test';
import roundedHeightForWidth3Test from './logic/RoundedHeightForWidth3.test';
import roundedHeightForWidth4Test from './logic/RoundedHeightForWidth4.test';
import sizeSummaryOfTest from './logic/SizeSummaryOf.test';
import sizeSummaryOf2Test from './logic/SizeSummaryOf2.test';
import sizeSummaryOf3Test from './logic/SizeSummaryOf3.test';
import sizeSummaryOf4Test from './logic/SizeSummaryOf4.test';
import matchesRatioTest from './logic/MatchesRatio.test';
import indexOfLabelTest from './logic/IndexOfLabel.test';
import ratioPageStateCtorTest from './logic/RatioPageStateCtor.test';
import ratioPageStateSelectTest from './logic/RatioPageStateSelect.test';
import ratioPageStateSelect2Test from './logic/RatioPageStateSelect2.test';
import ratioPageStateOnSizeChangeTest from './logic/RatioPageStateOnSizeChange.test';
import ratioPageStateOnSizeChange2Test from './logic/RatioPageStateOnSizeChange2.test';
import ratioPageStateOnSizeChange3Test from './logic/RatioPageStateOnSizeChange3.test';
import ratioPageStateOnSizeChange4Test from './logic/RatioPageStateOnSizeChange4.test';
import ratioPageStateOnSizeChange5Test from './logic/RatioPageStateOnSizeChange5.test';
import ratioPageStateApplyTest from './logic/RatioPageStateApply.test';
import ratioPageStateFlowTest from './logic/RatioPageStateFlow.test';
import ratioPageStateFlow2Test from './logic/RatioPageStateFlow2.test';
import ratioPageStateFlow3Test from './logic/RatioPageStateFlow3.test';
import ratioPageStateFlow4Test from './logic/RatioPageStateFlow4.test';
import ratioPageStateFlow5Test from './logic/RatioPageStateFlow5.test';
import ratioPageStateFlow6Test from './logic/RatioPageStateFlow6.test';
import ratioPageStateFlow7Test from './logic/RatioPageStateFlow7.test';
import windowRatioLogicConstantsTest from './logic/WindowRatioLogicConstants.test';

export default function testsuite() {
  // Yield between cases so the main EventHandler can service watchdog tasks.
  beforeEachIt(() => new Promise<void>((resolve) => {
    setTimeout(resolve, 1);
  }));

  abilityTest();
  windowRatioRatioCoreTest();
  windowRatioStorageModelTest();
  windowRatioWindowModeEnumTest();
  windowRatioPageUiTest();
  ratioOfIndexTest();
  ratioLabelOfIndexTest();
  sizeTextOfTest();
  sizeTextOf2Test();
  heightForWidthTest();
  heightForWidth2Test();
  heightForWidth3Test();
  heightForWidth4Test();
  widthForHeightTest();
  widthForHeight2Test();
  widthForHeight3Test();
  widthForHeight4Test();
  roundedHeightForWidthTest();
  roundedHeightForWidth2Test();
  roundedHeightForWidth3Test();
  roundedHeightForWidth4Test();
  sizeSummaryOfTest();
  sizeSummaryOf2Test();
  sizeSummaryOf3Test();
  sizeSummaryOf4Test();
  matchesRatioTest();
  indexOfLabelTest();
  ratioPageStateCtorTest();
  ratioPageStateSelectTest();
  ratioPageStateSelect2Test();
  ratioPageStateOnSizeChangeTest();
  ratioPageStateOnSizeChange2Test();
  ratioPageStateOnSizeChange3Test();
  ratioPageStateOnSizeChange4Test();
  ratioPageStateOnSizeChange5Test();
  ratioPageStateApplyTest();
  ratioPageStateFlowTest();
  ratioPageStateFlow2Test();
  ratioPageStateFlow3Test();
  ratioPageStateFlow4Test();
  ratioPageStateFlow5Test();
  ratioPageStateFlow6Test();
  ratioPageStateFlow7Test();
  windowRatioLogicConstantsTest();
}

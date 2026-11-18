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
import entryLoggerCoreTest from './EntryLoggerCore.test';
import windowConstModelCoreTest from './WindowConstModelCore.test';
import harLoggerCoreTest from './HarLoggerCore.test';
import windowMangerLogicCoreTest from './WindowMangerLogicCore.test';
import indexUiStateTest from './IndexUiState.test';
import videoPageUiTest from './VideoPageUi.test';
import systemBarUiStateTest from './SystemBarUiState.test';
import touchableUiStateTest from './TouchableUiState.test';
import vp2pxAtTest from './logic/Vp2pxAt.test';
import vp2pxAt2Test from './logic/Vp2pxAt2.test';
import vp2pxAt3Test from './logic/Vp2pxAt3.test';
import windowEventMessageOfTest from './logic/WindowEventMessageOf.test';
import subWindowWidthPxTest from './logic/SubWindowWidthPx.test';
import subWindowWidthPx2Test from './logic/SubWindowWidthPx2.test';
import subWindowHeightPxTest from './logic/SubWindowHeightPx.test';
import subWindowHeightPx2Test from './logic/SubWindowHeightPx2.test';
import displayMoveYOfTest from './logic/DisplayMoveYOf.test';
import displayMoveYOf2Test from './logic/DisplayMoveYOf2.test';
import subWindowStartYOfTest from './logic/SubWindowStartYOf.test';
import restartsGestureTest from './logic/RestartsGesture.test';
import nextEndOfTest from './logic/NextEndOf.test';
import nextEndOf2Test from './logic/NextEndOf2.test';
import nextEndOf3Test from './logic/NextEndOf3.test';
import insideBoundsTest from './logic/InsideBounds.test';
import indexAlignmentOfTest from './logic/IndexAlignmentOf.test';
import attributeAreaOfTest from './logic/AttributeAreaOf.test';
import attributeAreaOf2Test from './logic/AttributeAreaOf2.test';
import attributeAreaOf3Test from './logic/AttributeAreaOf3.test';
import isValidBrightnessTest from './logic/IsValidBrightness.test';
import subWindowDragModelCtorTest from './logic/SubWindowDragModelCtor.test';
import subWindowDragModelCtor2Test from './logic/SubWindowDragModelCtor2.test';
import subWindowDragModelCtor3Test from './logic/SubWindowDragModelCtor3.test';
import subWindowDragModelUpdateDisplayTest from './logic/SubWindowDragModelUpdateDisplay.test';
import subWindowDragModelUpdateDisplay2Test from './logic/SubWindowDragModelUpdateDisplay2.test';
import subWindowDragModelUpdateDisplay3Test from './logic/SubWindowDragModelUpdateDisplay3.test';
import subWindowDragModelUpdateDisplay4Test from './logic/SubWindowDragModelUpdateDisplay4.test';
import subWindowDragModelSetTopHeightTest from './logic/SubWindowDragModelSetTopHeight.test';
import subWindowDragModelSetTopHeight2Test from './logic/SubWindowDragModelSetTopHeight2.test';
import subWindowDragModelTouchTest from './logic/SubWindowDragModelTouch.test';
import subWindowDragModelTouch2Test from './logic/SubWindowDragModelTouch2.test';
import subWindowDragModelTouch3Test from './logic/SubWindowDragModelTouch3.test';
import subWindowDragModelTouch4Test from './logic/SubWindowDragModelTouch4.test';
import subWindowDragModelFlowTest from './logic/SubWindowDragModelFlow.test';
import subWindowDragModelFlow2Test from './logic/SubWindowDragModelFlow2.test';
import subWindowDragModelFlow3Test from './logic/SubWindowDragModelFlow3.test';
import subWindowDragModelFlow4Test from './logic/SubWindowDragModelFlow4.test';
import subWindowDragModelFlow5Test from './logic/SubWindowDragModelFlow5.test';
import windowMoveLogicConstantsTest from './logic/WindowMoveLogicConstants.test';

export default function testsuite() {
  beforeEachIt(async (done: Function) => {
    setTimeout(() => { done(); }, 1);
  });
  abilityTest();
  entryLoggerCoreTest();
  windowConstModelCoreTest();
  harLoggerCoreTest();
  windowMangerLogicCoreTest();
  indexUiStateTest();
  videoPageUiTest();
  systemBarUiStateTest();
  touchableUiStateTest();
  vp2pxAtTest();
  vp2pxAt2Test();
  vp2pxAt3Test();
  windowEventMessageOfTest();
  subWindowWidthPxTest();
  subWindowWidthPx2Test();
  subWindowHeightPxTest();
  subWindowHeightPx2Test();
  displayMoveYOfTest();
  displayMoveYOf2Test();
  subWindowStartYOfTest();
  restartsGestureTest();
  nextEndOfTest();
  nextEndOf2Test();
  nextEndOf3Test();
  insideBoundsTest();
  indexAlignmentOfTest();
  attributeAreaOfTest();
  attributeAreaOf2Test();
  attributeAreaOf3Test();
  isValidBrightnessTest();
  subWindowDragModelCtorTest();
  subWindowDragModelCtor2Test();
  subWindowDragModelCtor3Test();
  subWindowDragModelUpdateDisplayTest();
  subWindowDragModelUpdateDisplay2Test();
  subWindowDragModelUpdateDisplay3Test();
  subWindowDragModelUpdateDisplay4Test();
  subWindowDragModelSetTopHeightTest();
  subWindowDragModelSetTopHeight2Test();
  subWindowDragModelTouchTest();
  subWindowDragModelTouch2Test();
  subWindowDragModelTouch3Test();
  subWindowDragModelTouch4Test();
  subWindowDragModelFlowTest();
  subWindowDragModelFlow2Test();
  subWindowDragModelFlow3Test();
  subWindowDragModelFlow4Test();
  subWindowDragModelFlow5Test();
  windowMoveLogicConstantsTest();
}

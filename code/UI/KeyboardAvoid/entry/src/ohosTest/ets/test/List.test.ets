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

import { beforeEachIt } from '@ohos/hypium';
import dataSourceModelCoreTest from './DataSourceModelCore.test';
import dataSourceListenerCoreTest from './DataSourceListenerCore.test';
import dataSourceMutationOpsTest from './DataSourceMutationOps.test';
import dataSourceSeqFlowTest from './DataSourceSeqFlow.test';
import keyboardDataSourceGetDataTest from './logic/KeyboardDataSourceGetData.test';
import keyboardDataSourceTotalCountTest from './logic/KeyboardDataSourceTotalCount.test';
import keyboardDataSourceFlowTest from './logic/KeyboardDataSourceFlow.test';
import keyboardDataSourceFlow2Test from './logic/KeyboardDataSourceFlow2.test';
import keyboardDataSourceFlow3Test from './logic/KeyboardDataSourceFlow3.test';
import keyboardHeightVpOfTest from './logic/KeyboardHeightVpOf.test';
import keyboardHeightVpOf2Test from './logic/KeyboardHeightVpOf2.test';
import keyboardHeightVpOf3Test from './logic/KeyboardHeightVpOf3.test';
import popUpOpacityOfTest from './logic/PopUpOpacityOf.test';
import isKeyboardShownTest from './logic/IsKeyboardShown.test';
import bottomPaddingVpOfTest from './logic/BottomPaddingVpOf.test';
import bottomPaddingVpOf2Test from './logic/BottomPaddingVpOf2.test';
import bottomPaddingVpOf3Test from './logic/BottomPaddingVpOf3.test';
import resizedHeightOfTest from './logic/ResizedHeightOf.test';
import resizedHeightOf2Test from './logic/ResizedHeightOf2.test';
import resizedHeightOf3Test from './logic/ResizedHeightOf3.test';
import contentHeightOfTest from './logic/ContentHeightOf.test';
import contentHeightOf2Test from './logic/ContentHeightOf2.test';
import contentHeightOf3Test from './logic/ContentHeightOf3.test';
import liftUpShownAfterTest from './logic/LiftUpShownAfter.test';
import scalingShownAfterTest from './logic/ScalingShownAfter.test';
import buttonFontColorOfTest from './logic/ButtonFontColorOf.test';
import contentItemAtTest from './logic/ContentItemAt.test';
import contentItemAt2Test from './logic/ContentItemAt2.test';
import gridRowsOfTest from './logic/GridRowsOf.test';
import gridRowsOf2Test from './logic/GridRowsOf2.test';
import gridRowsOf3Test from './logic/GridRowsOf3.test';
import visibleItemsOfTest from './logic/VisibleItemsOf.test';
import visibleItemsOf2Test from './logic/VisibleItemsOf2.test';
import visibleItemsOf3Test from './logic/VisibleItemsOf3.test';
import keyboardAvoidStateCtorTest from './logic/KeyboardAvoidStateCtor.test';
import keyboardAvoidStateOnKeyboardHeightChangeTest from './logic/KeyboardAvoidStateOnKeyboardHeightChange.test';
import keyboardAvoidStateOnKeyboardHeightChange2Test from './logic/KeyboardAvoidStateOnKeyboardHeightChange2.test';
import keyboardAvoidStatePressLiftUpTest from './logic/KeyboardAvoidStatePressLiftUp.test';
import keyboardAvoidStatePressScalingTest from './logic/KeyboardAvoidStatePressScaling.test';
import keyboardAvoidStateSetAvoidAreaBottomTest from './logic/KeyboardAvoidStateSetAvoidAreaBottom.test';
import keyboardAvoidStateSetAvoidAreaBottom2Test from './logic/KeyboardAvoidStateSetAvoidAreaBottom2.test';
import keyboardAvoidStateContentHeightTest from './logic/KeyboardAvoidStateContentHeight.test';
import keyboardAvoidStateContentHeight2Test from './logic/KeyboardAvoidStateContentHeight2.test';
import keyboardAvoidStateFlowTest from './logic/KeyboardAvoidStateFlow.test';
import keyboardAvoidStateFlow2Test from './logic/KeyboardAvoidStateFlow2.test';
import keyboardAvoidStateFlow3Test from './logic/KeyboardAvoidStateFlow3.test';
import keyboardAvoidStateFlow4Test from './logic/KeyboardAvoidStateFlow4.test';
import keyboardAvoidLogicConstantsTest from './logic/KeyboardAvoidLogicConstants.test';

function yieldToEventLoop(): Promise<void> {
  return new Promise<void>(resolve => {
    setTimeout(() => {
      resolve();
    }, 1);
  });
}

export default function testsuite() {
  beforeEachIt(yieldToEventLoop);
  dataSourceModelCoreTest();
  dataSourceListenerCoreTest();
  dataSourceMutationOpsTest();
  dataSourceSeqFlowTest();
  keyboardDataSourceGetDataTest();
  keyboardDataSourceTotalCountTest();
  keyboardDataSourceFlowTest();
  keyboardDataSourceFlow2Test();
  keyboardDataSourceFlow3Test();
  keyboardHeightVpOfTest();
  keyboardHeightVpOf2Test();
  keyboardHeightVpOf3Test();
  popUpOpacityOfTest();
  isKeyboardShownTest();
  bottomPaddingVpOfTest();
  bottomPaddingVpOf2Test();
  bottomPaddingVpOf3Test();
  resizedHeightOfTest();
  resizedHeightOf2Test();
  resizedHeightOf3Test();
  contentHeightOfTest();
  contentHeightOf2Test();
  contentHeightOf3Test();
  liftUpShownAfterTest();
  scalingShownAfterTest();
  buttonFontColorOfTest();
  contentItemAtTest();
  contentItemAt2Test();
  gridRowsOfTest();
  gridRowsOf2Test();
  gridRowsOf3Test();
  visibleItemsOfTest();
  visibleItemsOf2Test();
  visibleItemsOf3Test();
  keyboardAvoidStateCtorTest();
  keyboardAvoidStateOnKeyboardHeightChangeTest();
  keyboardAvoidStateOnKeyboardHeightChange2Test();
  keyboardAvoidStatePressLiftUpTest();
  keyboardAvoidStatePressScalingTest();
  keyboardAvoidStateSetAvoidAreaBottomTest();
  keyboardAvoidStateSetAvoidAreaBottom2Test();
  keyboardAvoidStateContentHeightTest();
  keyboardAvoidStateContentHeight2Test();
  keyboardAvoidStateFlowTest();
  keyboardAvoidStateFlow2Test();
  keyboardAvoidStateFlow3Test();
  keyboardAvoidStateFlow4Test();
  keyboardAvoidLogicConstantsTest();
}

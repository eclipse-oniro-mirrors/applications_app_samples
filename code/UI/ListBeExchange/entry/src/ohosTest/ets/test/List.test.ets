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
import abilityTest from './Ability.test';
import listInfoModelTest from './ListInfoModel.test';
import exchangeCtrlCoreTest from './ExchangeCtrlCore.test';
import modifierModelTest from './ModifierModel.test';
import constantsModelTest from './ConstantsModel.test';
import mockDataModelTest from './MockDataModel.test';
import ctrlGenericModelTest from './CtrlGenericModel.test';
import listItemModifierGetInstanceTest from './logic/ListItemModifierGetInstance.test';
import listItemModifierCtorTest from './logic/ListItemModifierCtor.test';
import listInfoCtorTest from './logic/ListInfoCtor.test';
import commonConstantsValuesTest from './logic/CommonConstantsValues.test';
import operationStatusValuesTest from './logic/OperationStatusValues.test';
import relativeOffsetOfTest from './logic/RelativeOffsetOf.test';
import relativeOffsetOf2Test from './logic/RelativeOffsetOf2.test';
import relativeOffsetOf3Test from './logic/RelativeOffsetOf3.test';
import directionOfTest from './logic/DirectionOf.test';
import curveInputOfTest from './logic/CurveInputOf.test';
import curveInputOf2Test from './logic/CurveInputOf2.test';
import shrinkScaleOfTest from './logic/ShrinkScaleOf.test';
import shrinkScaleOf2Test from './logic/ShrinkScaleOf2.test';
import neighbourScaleOfTest from './logic/NeighbourScaleOf.test';
import neighbourScaleOf2Test from './logic/NeighbourScaleOf2.test';
import neighbourScaleOf3Test from './logic/NeighbourScaleOf3.test';
import passesSwapThresholdTest from './logic/PassesSwapThreshold.test';
import canSwapTest from './logic/CanSwap.test';
import swapTargetOfTest from './logic/SwapTargetOf.test';
import swapTargetOf2Test from './logic/SwapTargetOf2.test';
import swapTargetOf3Test from './logic/SwapTargetOf3.test';
import offsetAfterSwapOfTest from './logic/OffsetAfterSwapOf.test';
import offsetAfterSwapOf2Test from './logic/OffsetAfterSwapOf2.test';
import offsetAfterSwapOf3Test from './logic/OffsetAfterSwapOf3.test';
import refAfterSwapOfTest from './logic/RefAfterSwapOf.test';
import refAfterSwapOf2Test from './logic/RefAfterSwapOf2.test';
import refAfterSwapOf3Test from './logic/RefAfterSwapOf3.test';
import reorderTest from './logic/Reorder.test';
import reorder2Test from './logic/Reorder2.test';
import reorder3Test from './logic/Reorder3.test';
import reorder4Test from './logic/Reorder4.test';
import exchangeItemStateCtorTest from './logic/ExchangeItemStateCtor.test';
import listExchangeModelCtorTest from './logic/ListExchangeModelCtor.test';
import listExchangeModelInitDataTest from './logic/ListExchangeModelInitData.test';
import listExchangeModelLongPressTest from './logic/ListExchangeModelLongPress.test';
import listExchangeModelMoveTest from './logic/ListExchangeModelMove.test';
import listExchangeModelDropTest from './logic/ListExchangeModelDrop.test';
import listExchangeModelChangeItemTest from './logic/ListExchangeModelChangeItem.test';
import listExchangeModelDeleteItemTest from './logic/ListExchangeModelDeleteItem.test';
import listExchangeModelAddItemTest from './logic/ListExchangeModelAddItem.test';
import listExchangeModelAddItem2Test from './logic/ListExchangeModelAddItem2.test';
import listExchangeModelOrderTest from './logic/ListExchangeModelOrder.test';
import listExchangeModelFlowTest from './logic/ListExchangeModelFlow.test';
import listExchangeModelFlow2Test from './logic/ListExchangeModelFlow2.test';
import listExchangeModelFlow3Test from './logic/ListExchangeModelFlow3.test';
import listExchangeModelFlow4Test from './logic/ListExchangeModelFlow4.test';
import listExchangeModelFlow5Test from './logic/ListExchangeModelFlow5.test';
import listExchangeModelFlow6Test from './logic/ListExchangeModelFlow6.test';
import listExchangeBridgeConstantsTest from './logic/ListExchangeBridgeConstants.test';
import listExchangeLogicConstantsTest from './logic/ListExchangeLogicConstants.test';

function yieldToEventLoop(): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, 1);
  });
}

export default function testsuite() {
  beforeEachIt(yieldToEventLoop);
  abilityTest();
  listInfoModelTest();
  exchangeCtrlCoreTest();
  modifierModelTest();
  constantsModelTest();
  mockDataModelTest();
  ctrlGenericModelTest();
  listItemModifierGetInstanceTest();
  listItemModifierCtorTest();
  listInfoCtorTest();
  commonConstantsValuesTest();
  operationStatusValuesTest();
  relativeOffsetOfTest();
  relativeOffsetOf2Test();
  relativeOffsetOf3Test();
  directionOfTest();
  curveInputOfTest();
  curveInputOf2Test();
  shrinkScaleOfTest();
  shrinkScaleOf2Test();
  neighbourScaleOfTest();
  neighbourScaleOf2Test();
  neighbourScaleOf3Test();
  passesSwapThresholdTest();
  canSwapTest();
  swapTargetOfTest();
  swapTargetOf2Test();
  swapTargetOf3Test();
  offsetAfterSwapOfTest();
  offsetAfterSwapOf2Test();
  offsetAfterSwapOf3Test();
  refAfterSwapOfTest();
  refAfterSwapOf2Test();
  refAfterSwapOf3Test();
  reorderTest();
  reorder2Test();
  reorder3Test();
  reorder4Test();
  exchangeItemStateCtorTest();
  listExchangeModelCtorTest();
  listExchangeModelInitDataTest();
  listExchangeModelLongPressTest();
  listExchangeModelMoveTest();
  listExchangeModelDropTest();
  listExchangeModelChangeItemTest();
  listExchangeModelDeleteItemTest();
  listExchangeModelAddItemTest();
  listExchangeModelAddItem2Test();
  listExchangeModelOrderTest();
  listExchangeModelFlowTest();
  listExchangeModelFlow2Test();
  listExchangeModelFlow3Test();
  listExchangeModelFlow4Test();
  listExchangeModelFlow5Test();
  listExchangeModelFlow6Test();
  listExchangeBridgeConstantsTest();
  listExchangeLogicConstantsTest();
}

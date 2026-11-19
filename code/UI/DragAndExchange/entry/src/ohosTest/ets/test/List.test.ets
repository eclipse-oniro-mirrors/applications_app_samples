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
import appInfoModelCoreTest from './AppInfoModelCore.test';
import dataSourceModelCoreTest from './DataSourceModelCore.test';
import swapIndexCalcCoreTest from './SwapIndexCalcCore.test';
import appInfoCtorTest from './logic/AppInfoCtor.test';
import dataSourceTotalCountTest from './logic/DataSourceTotalCount.test';
import dataSourceGetDataTest from './logic/DataSourceGetData.test';
import dataSourceFlowTest from './logic/DataSourceFlow.test';
import dataSourceFlow2Test from './logic/DataSourceFlow2.test';
import dragParamsCtorTest from './logic/DragParamsCtor.test';
import gridAppNamesTest from './logic/GridAppNames.test';
import gridAppNames2Test from './logic/GridAppNames2.test';
import listItemNamesTest from './logic/ListItemNames.test';
import listItemNames2Test from './logic/ListItemNames2.test';
import gridIconNameTest from './logic/GridIconName.test';
import gridIconName2Test from './logic/GridIconName2.test';
import listIconNameTest from './logic/ListIconName.test';
import listIconName2Test from './logic/ListIconName2.test';
import gridRowOfTest from './logic/GridRowOf.test';
import gridRowOf2Test from './logic/GridRowOf2.test';
import gridColumnOfTest from './logic/GridColumnOf.test';
import gridColumnOf2Test from './logic/GridColumnOf2.test';
import gridIndexOfTest from './logic/GridIndexOf.test';
import gridIndexOf2Test from './logic/GridIndexOf2.test';
import isGridDropAcceptedTest from './logic/IsGridDropAccepted.test';
import isListDropAcceptedTest from './logic/IsListDropAccepted.test';
import swapNamesTest from './logic/SwapNames.test';
import swapNames2Test from './logic/SwapNames2.test';
import gridDropResultTest from './logic/GridDropResult.test';
import gridDropResult2Test from './logic/GridDropResult2.test';
import listDropResultTest from './logic/ListDropResult.test';
import listDropResult2Test from './logic/ListDropResult2.test';
import parseDragParamsTest from './logic/ParseDragParams.test';
import dragParamsTextTest from './logic/DragParamsText.test';
import dragParamsText2Test from './logic/DragParamsText2.test';
import dataSourceModelTotalCountTest from './logic/DataSourceModelTotalCount.test';
import dataSourceModelGetDataTest from './logic/DataSourceModelGetData.test';
import dataSourceModelListenerCountTest from './logic/DataSourceModelListenerCount.test';
import dataSourceModelOrderTest from './logic/DataSourceModelOrder.test';
import dataSourceModelEventsTest from './logic/DataSourceModelEvents.test';
import dataSourceModelFlowTest from './logic/DataSourceModelFlow.test';
import dataSourceModelFlow2Test from './logic/DataSourceModelFlow2.test';
import dataSourceModelFlow3Test from './logic/DataSourceModelFlow3.test';
import gridDragSessionDragStartTest from './logic/GridDragSessionDragStart.test';
import gridDragSessionDropTest from './logic/GridDragSessionDrop.test';
import gridDragSessionMovedNameTest from './logic/GridDragSessionMovedName.test';
import gridDragSessionOrderTest from './logic/GridDragSessionOrder.test';
import gridDragSessionEventsTest from './logic/GridDragSessionEvents.test';
import gridDragSessionFlowTest from './logic/GridDragSessionFlow.test';
import gridDragSessionFlow2Test from './logic/GridDragSessionFlow2.test';
import gridDragSessionFlow3Test from './logic/GridDragSessionFlow3.test';
import listDragSessionDragStartTest from './logic/ListDragSessionDragStart.test';
import listDragSessionDropTest from './logic/ListDragSessionDrop.test';
import listDragSessionCurrentDragIndexTest from './logic/ListDragSessionCurrentDragIndex.test';
import listDragSessionVisibleCountTest from './logic/ListDragSessionVisibleCount.test';
import listDragSessionOrderTest from './logic/ListDragSessionOrder.test';
import listDragSessionEventsTest from './logic/ListDragSessionEvents.test';
import listDragSessionFlowTest from './logic/ListDragSessionFlow.test';
import listDragSessionFlow2Test from './logic/ListDragSessionFlow2.test';
import listDragSessionFlow3Test from './logic/ListDragSessionFlow3.test';
import dragExchangeLogicConstantsTest from './logic/DragExchangeLogicConstants.test';

function yieldToEventHandler(): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => { resolve(); }, 1);
  });
}

export default function testsuite() {
  beforeEachIt(yieldToEventHandler);
  appInfoModelCoreTest();
  dataSourceModelCoreTest();
  swapIndexCalcCoreTest();
  appInfoCtorTest();
  dataSourceTotalCountTest();
  dataSourceGetDataTest();
  dataSourceFlowTest();
  dataSourceFlow2Test();
  dragParamsCtorTest();
  gridAppNamesTest();
  gridAppNames2Test();
  listItemNamesTest();
  listItemNames2Test();
  gridIconNameTest();
  gridIconName2Test();
  listIconNameTest();
  listIconName2Test();
  gridRowOfTest();
  gridRowOf2Test();
  gridColumnOfTest();
  gridColumnOf2Test();
  gridIndexOfTest();
  gridIndexOf2Test();
  isGridDropAcceptedTest();
  isListDropAcceptedTest();
  swapNamesTest();
  swapNames2Test();
  gridDropResultTest();
  gridDropResult2Test();
  listDropResultTest();
  listDropResult2Test();
  parseDragParamsTest();
  dragParamsTextTest();
  dragParamsText2Test();
  dataSourceModelTotalCountTest();
  dataSourceModelGetDataTest();
  dataSourceModelListenerCountTest();
  dataSourceModelOrderTest();
  dataSourceModelEventsTest();
  dataSourceModelFlowTest();
  dataSourceModelFlow2Test();
  dataSourceModelFlow3Test();
  gridDragSessionDragStartTest();
  gridDragSessionDropTest();
  gridDragSessionMovedNameTest();
  gridDragSessionOrderTest();
  gridDragSessionEventsTest();
  gridDragSessionFlowTest();
  gridDragSessionFlow2Test();
  gridDragSessionFlow3Test();
  listDragSessionDragStartTest();
  listDragSessionDropTest();
  listDragSessionCurrentDragIndexTest();
  listDragSessionVisibleCountTest();
  listDragSessionOrderTest();
  listDragSessionEventsTest();
  listDragSessionFlowTest();
  listDragSessionFlow2Test();
  listDragSessionFlow3Test();
  dragExchangeLogicConstantsTest();
}

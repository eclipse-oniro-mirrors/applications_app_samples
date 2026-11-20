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

import routerNavModeCoreTest from './RouterNavModeCore.test';
import routerUtilsCoreTest from './RouterUtilsCore.test';
import routerUtilsExtendedTest from './RouterUtilsExtended.test';
import breakpointConstantsCoreTest from './BreakpointConstantsCore.test';
import windowSizeConstantsCoreTest from './WindowSizeConstantsCore.test';
import breakpointConstantsValuesTest from './logic/BreakpointConstantsValues.test';
import navModeValuesTest from './logic/NavModeValues.test';
import breakpointOfTest from './logic/BreakpointOf.test';
import gridColumnsOfTest from './logic/GridColumnsOf.test';
import navModeOfBreakpointTest from './logic/NavModeOfBreakpoint.test';
import isFullScreenRouteTest from './logic/IsFullScreenRoute.test';
import navigationModeOfTest from './logic/NavigationModeOf.test';
import swiperDisplayCountOfTest from './logic/SwiperDisplayCountOf.test';
import maxItemCountOfTest from './logic/MaxItemCountOf.test';
import maxItemCountOf2Test from './logic/MaxItemCountOf2.test';
import tabColumnsOfTest from './logic/TabColumnsOf.test';
import tabColumnsOf2Test from './logic/TabColumnsOf2.test';
import columnCountOfTest from './logic/ColumnCountOf.test';
import columnCountOf2Test from './logic/ColumnCountOf2.test';
import popBranchOfTest from './logic/PopBranchOf.test';
import disablesPopAnimationTest from './logic/DisablesPopAnimation.test';
import foldLayoutStateCtorTest from './logic/FoldLayoutStateCtor.test';
import foldLayoutStateResizeTest from './logic/FoldLayoutStateResize.test';
import foldLayoutStatePushTest from './logic/FoldLayoutStatePush.test';
import foldLayoutStatePush2Test from './logic/FoldLayoutStatePush2.test';
import foldLayoutStatePush3Test from './logic/FoldLayoutStatePush3.test';
import foldLayoutStatePopTest from './logic/FoldLayoutStatePop.test';
import foldLayoutStateApplyModeTest from './logic/FoldLayoutStateApplyMode.test';
import foldLayoutStateFlowTest from './logic/FoldLayoutStateFlow.test';
import foldLayoutStateFlow2Test from './logic/FoldLayoutStateFlow2.test';
import foldLayoutStateFlow3Test from './logic/FoldLayoutStateFlow3.test';
import foldLayoutStateFlow4Test from './logic/FoldLayoutStateFlow4.test';
import foldLayoutStateFlow5Test from './logic/FoldLayoutStateFlow5.test';
import foldLayoutStateFlow6Test from './logic/FoldLayoutStateFlow6.test';
import foldLayoutStateFlow7Test from './logic/FoldLayoutStateFlow7.test';
import foldLayoutStateFlow8Test from './logic/FoldLayoutStateFlow8.test';
import foldLayoutStateFlow9Test from './logic/FoldLayoutStateFlow9.test';
import foldLayoutStateFlow10Test from './logic/FoldLayoutStateFlow10.test';
import foldLayoutStateFlow11Test from './logic/FoldLayoutStateFlow11.test';
import foldLayoutStateFlow12Test from './logic/FoldLayoutStateFlow12.test';
import foldLayoutStateFlow13Test from './logic/FoldLayoutStateFlow13.test';
import foldLayoutStateFlow14Test from './logic/FoldLayoutStateFlow14.test';
import foldLayoutStateFlow15Test from './logic/FoldLayoutStateFlow15.test';
import foldLayoutStateFlow16Test from './logic/FoldLayoutStateFlow16.test';
import foldLayoutStateFlow17Test from './logic/FoldLayoutStateFlow17.test';
import foldLayoutStateFlow18Test from './logic/FoldLayoutStateFlow18.test';
import foldLayoutLogicConstantsTest from './logic/FoldLayoutLogicConstants.test';

export default function testsuite() {
  routerNavModeCoreTest();
  routerUtilsCoreTest();
  routerUtilsExtendedTest();
  breakpointConstantsCoreTest();
  windowSizeConstantsCoreTest();
  breakpointConstantsValuesTest();
  navModeValuesTest();
  breakpointOfTest();
  gridColumnsOfTest();
  navModeOfBreakpointTest();
  isFullScreenRouteTest();
  navigationModeOfTest();
  swiperDisplayCountOfTest();
  maxItemCountOfTest();
  maxItemCountOf2Test();
  tabColumnsOfTest();
  tabColumnsOf2Test();
  columnCountOfTest();
  columnCountOf2Test();
  popBranchOfTest();
  disablesPopAnimationTest();
  foldLayoutStateCtorTest();
  foldLayoutStateResizeTest();
  foldLayoutStatePushTest();
  foldLayoutStatePush2Test();
  foldLayoutStatePush3Test();
  foldLayoutStatePopTest();
  foldLayoutStateApplyModeTest();
  foldLayoutStateFlowTest();
  foldLayoutStateFlow2Test();
  foldLayoutStateFlow3Test();
  foldLayoutStateFlow4Test();
  foldLayoutStateFlow5Test();
  foldLayoutStateFlow6Test();
  foldLayoutStateFlow7Test();
  foldLayoutStateFlow8Test();
  foldLayoutStateFlow9Test();
  foldLayoutStateFlow10Test();
  foldLayoutStateFlow11Test();
  foldLayoutStateFlow12Test();
  foldLayoutStateFlow13Test();
  foldLayoutStateFlow14Test();
  foldLayoutStateFlow15Test();
  foldLayoutStateFlow16Test();
  foldLayoutStateFlow17Test();
  foldLayoutStateFlow18Test();
  foldLayoutLogicConstantsTest();
}

// Same order as testsuite(): TestAbility registers this list in chunks so a single task never
// blocks the main thread long enough to trip LIFECYCLE_TIMEOUT. testsuite() must keep its plain
// calls, that is what the IDE test discoverer scans.
export const suiteList: Array<() => void> = [
  routerNavModeCoreTest,
  routerUtilsCoreTest,
  routerUtilsExtendedTest,
  breakpointConstantsCoreTest,
  windowSizeConstantsCoreTest,
  breakpointConstantsValuesTest,
  navModeValuesTest,
  breakpointOfTest,
  gridColumnsOfTest,
  navModeOfBreakpointTest,
  isFullScreenRouteTest,
  navigationModeOfTest,
  swiperDisplayCountOfTest,
  maxItemCountOfTest,
  maxItemCountOf2Test,
  tabColumnsOfTest,
  tabColumnsOf2Test,
  columnCountOfTest,
  columnCountOf2Test,
  popBranchOfTest,
  disablesPopAnimationTest,
  foldLayoutStateCtorTest,
  foldLayoutStateResizeTest,
  foldLayoutStatePushTest,
  foldLayoutStatePush2Test,
  foldLayoutStatePush3Test,
  foldLayoutStatePopTest,
  foldLayoutStateApplyModeTest,
  foldLayoutStateFlowTest,
  foldLayoutStateFlow2Test,
  foldLayoutStateFlow3Test,
  foldLayoutStateFlow4Test,
  foldLayoutStateFlow5Test,
  foldLayoutStateFlow6Test,
  foldLayoutStateFlow7Test,
  foldLayoutStateFlow8Test,
  foldLayoutStateFlow9Test,
  foldLayoutStateFlow10Test,
  foldLayoutStateFlow11Test,
  foldLayoutStateFlow12Test,
  foldLayoutStateFlow13Test,
  foldLayoutStateFlow14Test,
  foldLayoutStateFlow15Test,
  foldLayoutStateFlow16Test,
  foldLayoutStateFlow17Test,
  foldLayoutStateFlow18Test,
  foldLayoutLogicConstantsTest
];

/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import tabOverflowConfigCoreTest from './TabOverflowConfigCore.test';
import tabOverflowStringCoreTest from './TabOverflowStringCore.test';
import tabOverflowLoggerCoreTest from './TabOverflowLoggerCore.test';
import tabOverflowUtilsCoreTest from './TabOverflowUtilsCore.test';
import tabOverflowIndexUiStateTest from './TabOverflowIndexUiState.test';
import tabOverflowVideoUiStateTest from './TabOverflowVideoUiState.test';
import tabOverflowTabSwitchUiStateTest from './TabOverflowTabSwitchUiState.test';
import tabOverflowSideUiStateTest from './TabOverflowSideUiState.test';
import tabOverflowTopViewUiStateTest from './TabOverflowTopViewUiState.test';
import trackWidthOfTest from './logic/TrackWidthOf.test';
import trackWidthOf2Test from './logic/TrackWidthOf2.test';
import offsetForTimeOfTest from './logic/OffsetForTimeOf.test';
import offsetForTimeOf2Test from './logic/OffsetForTimeOf2.test';
import offsetForTimeOf3Test from './logic/OffsetForTimeOf3.test';
import clampedOffsetOfTest from './logic/ClampedOffsetOf.test';
import clampedOffsetOf2Test from './logic/ClampedOffsetOf2.test';
import clampedOffsetOf3Test from './logic/ClampedOffsetOf3.test';
import playSecondsOfTest from './logic/PlaySecondsOf.test';
import playSecondsOf2Test from './logic/PlaySecondsOf2.test';
import playSecondsOf3Test from './logic/PlaySecondsOf3.test';
import playTimeTextOfTest from './logic/PlayTimeTextOf.test';
import playTimeTextOf2Test from './logic/PlayTimeTextOf2.test';
import seekTimeOfTest from './logic/SeekTimeOf.test';
import seekTimeOf2Test from './logic/SeekTimeOf2.test';
import seekTimeOf3Test from './logic/SeekTimeOf3.test';
import seeksOnEndTest from './logic/SeeksOnEnd.test';
import nextPlayStateTest from './logic/NextPlayState.test';
import nextCountOfTest from './logic/NextCountOf.test';
import tabImageOfTest from './logic/TabImageOf.test';
import tabImageOf2Test from './logic/TabImageOf2.test';
import tabImageOf3Test from './logic/TabImageOf3.test';
import tabTitleOfTest from './logic/TabTitleOf.test';
import tabTitleOf2Test from './logic/TabTitleOf2.test';
import progressBarStateCtorTest from './logic/ProgressBarStateCtor.test';
import progressBarStateCtor2Test from './logic/ProgressBarStateCtor2.test';
import progressBarStateCtor3Test from './logic/ProgressBarStateCtor3.test';
import progressBarStateUpdateTest from './logic/ProgressBarStateUpdate.test';
import progressBarStateUpdate2Test from './logic/ProgressBarStateUpdate2.test';
import progressBarStateStartDragTest from './logic/ProgressBarStateStartDrag.test';
import progressBarStateDragTest from './logic/ProgressBarStateDrag.test';
import progressBarStateDrag2Test from './logic/ProgressBarStateDrag2.test';
import progressBarStateEndDragTest from './logic/ProgressBarStateEndDrag.test';
import progressBarStateTogglePlayTest from './logic/ProgressBarStateTogglePlay.test';
import progressBarStateFlowTest from './logic/ProgressBarStateFlow.test';
import progressBarStateFlow2Test from './logic/ProgressBarStateFlow2.test';
import progressBarStateFlow3Test from './logic/ProgressBarStateFlow3.test';
import progressBarStateFlow4Test from './logic/ProgressBarStateFlow4.test';
import progressBarStateFlow5Test from './logic/ProgressBarStateFlow5.test';
import sideBarStateCtorTest from './logic/SideBarStateCtor.test';
import sideBarStateToggleLikeTest from './logic/SideBarStateToggleLike.test';
import sideBarStateToggleFavoriteTest from './logic/SideBarStateToggleFavorite.test';
import sideBarStateToggleFocusTest from './logic/SideBarStateToggleFocus.test';
import sideBarStateFlowTest from './logic/SideBarStateFlow.test';
import sideBarStateFlow2Test from './logic/SideBarStateFlow2.test';
import sideBarStateFlow3Test from './logic/SideBarStateFlow3.test';
import sideBarStateFlow4Test from './logic/SideBarStateFlow4.test';
import sideBarStateFlow5Test from './logic/SideBarStateFlow5.test';
import tabContentLogicConstantsTest from './logic/TabContentLogicConstants.test';

export default function testsuite() {
  abilityTest();
  tabOverflowConfigCoreTest();
  tabOverflowStringCoreTest();
  tabOverflowLoggerCoreTest();
  tabOverflowUtilsCoreTest();
  tabOverflowIndexUiStateTest();
  tabOverflowVideoUiStateTest();
  tabOverflowTabSwitchUiStateTest();
  tabOverflowSideUiStateTest();
  tabOverflowTopViewUiStateTest();
  trackWidthOfTest();
  trackWidthOf2Test();
  offsetForTimeOfTest();
  offsetForTimeOf2Test();
  offsetForTimeOf3Test();
  clampedOffsetOfTest();
  clampedOffsetOf2Test();
  clampedOffsetOf3Test();
  playSecondsOfTest();
  playSecondsOf2Test();
  playSecondsOf3Test();
  playTimeTextOfTest();
  playTimeTextOf2Test();
  seekTimeOfTest();
  seekTimeOf2Test();
  seekTimeOf3Test();
  seeksOnEndTest();
  nextPlayStateTest();
  nextCountOfTest();
  tabImageOfTest();
  tabImageOf2Test();
  tabImageOf3Test();
  tabTitleOfTest();
  tabTitleOf2Test();
  progressBarStateCtorTest();
  progressBarStateCtor2Test();
  progressBarStateCtor3Test();
  progressBarStateUpdateTest();
  progressBarStateUpdate2Test();
  progressBarStateStartDragTest();
  progressBarStateDragTest();
  progressBarStateDrag2Test();
  progressBarStateEndDragTest();
  progressBarStateTogglePlayTest();
  progressBarStateFlowTest();
  progressBarStateFlow2Test();
  progressBarStateFlow3Test();
  progressBarStateFlow4Test();
  progressBarStateFlow5Test();
  sideBarStateCtorTest();
  sideBarStateToggleLikeTest();
  sideBarStateToggleFavoriteTest();
  sideBarStateToggleFocusTest();
  sideBarStateFlowTest();
  sideBarStateFlow2Test();
  sideBarStateFlow3Test();
  sideBarStateFlow4Test();
  sideBarStateFlow5Test();
  tabContentLogicConstantsTest();
}

// DevEco discovers suites through the direct calls in the default entry.
export const testSuites: Array<() => void> = [
  abilityTest,
  tabOverflowConfigCoreTest,
  tabOverflowStringCoreTest,
  tabOverflowLoggerCoreTest,
  tabOverflowUtilsCoreTest,
  tabOverflowIndexUiStateTest,
  tabOverflowVideoUiStateTest,
  tabOverflowTabSwitchUiStateTest,
  tabOverflowSideUiStateTest,
  tabOverflowTopViewUiStateTest,
  trackWidthOfTest,
  trackWidthOf2Test,
  offsetForTimeOfTest,
  offsetForTimeOf2Test,
  offsetForTimeOf3Test,
  clampedOffsetOfTest,
  clampedOffsetOf2Test,
  clampedOffsetOf3Test,
  playSecondsOfTest,
  playSecondsOf2Test,
  playSecondsOf3Test,
  playTimeTextOfTest,
  playTimeTextOf2Test,
  seekTimeOfTest,
  seekTimeOf2Test,
  seekTimeOf3Test,
  seeksOnEndTest,
  nextPlayStateTest,
  nextCountOfTest,
  tabImageOfTest,
  tabImageOf2Test,
  tabImageOf3Test,
  tabTitleOfTest,
  tabTitleOf2Test,
  progressBarStateCtorTest,
  progressBarStateCtor2Test,
  progressBarStateCtor3Test,
  progressBarStateUpdateTest,
  progressBarStateUpdate2Test,
  progressBarStateStartDragTest,
  progressBarStateDragTest,
  progressBarStateDrag2Test,
  progressBarStateEndDragTest,
  progressBarStateTogglePlayTest,
  progressBarStateFlowTest,
  progressBarStateFlow2Test,
  progressBarStateFlow3Test,
  progressBarStateFlow4Test,
  progressBarStateFlow5Test,
  sideBarStateCtorTest,
  sideBarStateToggleLikeTest,
  sideBarStateToggleFavoriteTest,
  sideBarStateToggleFocusTest,
  sideBarStateFlowTest,
  sideBarStateFlow2Test,
  sideBarStateFlow3Test,
  sideBarStateFlow4Test,
  sideBarStateFlow5Test,
  tabContentLogicConstantsTest
];

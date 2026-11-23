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
import napiQueryCoreTest from './NapiQueryCore.test';
import napiQueryExtendedTest from './NapiQueryExtended.test';
import ndkUiStateTest from './NdkUiState.test';
import px2vpAtTest from './logic/Px2vpAt.test';
import px2vpAt2Test from './logic/Px2vpAt2.test';
import px2vpAt3Test from './logic/Px2vpAt3.test';
import px2vpAt4Test from './logic/Px2vpAt4.test';
import vp2pxAtTest from './logic/Vp2pxAt.test';
import vp2pxAt2Test from './logic/Vp2pxAt2.test';
import vp2pxAt3Test from './logic/Vp2pxAt3.test';
import vp2pxAt4Test from './logic/Vp2pxAt4.test';
import titleAreaHeightAtTest from './logic/TitleAreaHeightAt.test';
import titleAreaHeightAt2Test from './logic/TitleAreaHeightAt2.test';
import dialogTitleHeightAtTest from './logic/DialogTitleHeightAt.test';
import dialogTitleHeightAt2Test from './logic/DialogTitleHeightAt2.test';
import dialogTextMarginAtTest from './logic/DialogTextMarginAt.test';
import dialogTextMarginAt2Test from './logic/DialogTextMarginAt2.test';
import dialogTextRoomAtTest from './logic/DialogTextRoomAt.test';
import dialogTextRoomAt2Test from './logic/DialogTextRoomAt2.test';
import dialogTextRoomAt3Test from './logic/DialogTextRoomAt3.test';
import dialogTextRoomAt4Test from './logic/DialogTextRoomAt4.test';
import dialogTextWidthOfTest from './logic/DialogTextWidthOf.test';
import dialogTextWidthOf2Test from './logic/DialogTextWidthOf2.test';
import checkButtonWidthOfTest from './logic/CheckButtonWidthOf.test';
import checkButtonWidthOf2Test from './logic/CheckButtonWidthOf2.test';
import titleTextWidthOfTest from './logic/TitleTextWidthOf.test';
import titleTextWidthOf2Test from './logic/TitleTextWidthOf2.test';
import freeSpaceOfTest from './logic/FreeSpaceOf.test';
import freeSpaceOf2Test from './logic/FreeSpaceOf2.test';
import freeSpaceOf3Test from './logic/FreeSpaceOf3.test';
import freeSpaceOf4Test from './logic/FreeSpaceOf4.test';
import resultLabelOfTest from './logic/ResultLabelOf.test';
import dialogResultTextOfTest from './logic/DialogResultTextOf.test';
import parseDialogResultTest from './logic/ParseDialogResult.test';
import napiBooleanOfTest from './logic/NapiBooleanOf.test';
import isExportedNapiTest from './logic/IsExportedNapi.test';
import isBoldWeightTest from './logic/IsBoldWeight.test';
import scaledFontOfTest from './logic/ScaledFontOf.test';
import scaledFontOf2Test from './logic/ScaledFontOf2.test';
import scaledFontOf3Test from './logic/ScaledFontOf3.test';
import scaledFontOf4Test from './logic/ScaledFontOf4.test';
import notificationPageStateCtorTest from './logic/NotificationPageStateCtor.test';
import notificationPageStateCheckTest from './logic/NotificationPageStateCheck.test';
import notificationPageStateConfirmTest from './logic/NotificationPageStateConfirm.test';
import notificationPageStateDetachControllerTest from './logic/NotificationPageStateDetachController.test';
import notificationPageStateDialogTextTest from './logic/NotificationPageStateDialogText.test';
import notificationPageStateTapOutsideTest from './logic/NotificationPageStateTapOutside.test';
import notificationPageStateFlowTest from './logic/NotificationPageStateFlow.test';
import notificationPageStateFlow2Test from './logic/NotificationPageStateFlow2.test';
import notificationPageStateFlow3Test from './logic/NotificationPageStateFlow3.test';
import notificationPageStateFlow4Test from './logic/NotificationPageStateFlow4.test';
import notificationPageStateFlow5Test from './logic/NotificationPageStateFlow5.test';
import notificationPageStateFlow6Test from './logic/NotificationPageStateFlow6.test';
import ndkNotificationLogicConstantsTest from './logic/NdkNotificationLogicConstants.test';

export default function testsuite() {
  abilityTest();
  napiQueryCoreTest();
  napiQueryExtendedTest();
  ndkUiStateTest();
  px2vpAtTest();
  px2vpAt2Test();
  px2vpAt3Test();
  px2vpAt4Test();
  vp2pxAtTest();
  vp2pxAt2Test();
  vp2pxAt3Test();
  vp2pxAt4Test();
  titleAreaHeightAtTest();
  titleAreaHeightAt2Test();
  dialogTitleHeightAtTest();
  dialogTitleHeightAt2Test();
  dialogTextMarginAtTest();
  dialogTextMarginAt2Test();
  dialogTextRoomAtTest();
  dialogTextRoomAt2Test();
  dialogTextRoomAt3Test();
  dialogTextRoomAt4Test();
  dialogTextWidthOfTest();
  dialogTextWidthOf2Test();
  checkButtonWidthOfTest();
  checkButtonWidthOf2Test();
  titleTextWidthOfTest();
  titleTextWidthOf2Test();
  freeSpaceOfTest();
  freeSpaceOf2Test();
  freeSpaceOf3Test();
  freeSpaceOf4Test();
  resultLabelOfTest();
  dialogResultTextOfTest();
  parseDialogResultTest();
  napiBooleanOfTest();
  isExportedNapiTest();
  isBoldWeightTest();
  scaledFontOfTest();
  scaledFontOf2Test();
  scaledFontOf3Test();
  scaledFontOf4Test();
  notificationPageStateCtorTest();
  notificationPageStateCheckTest();
  notificationPageStateConfirmTest();
  notificationPageStateDetachControllerTest();
  notificationPageStateDialogTextTest();
  notificationPageStateTapOutsideTest();
  notificationPageStateFlowTest();
  notificationPageStateFlow2Test();
  notificationPageStateFlow3Test();
  notificationPageStateFlow4Test();
  notificationPageStateFlow5Test();
  notificationPageStateFlow6Test();
  ndkNotificationLogicConstantsTest();
}

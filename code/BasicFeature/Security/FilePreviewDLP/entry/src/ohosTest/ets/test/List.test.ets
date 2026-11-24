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
import appLoggerCoreTest from './AppLoggerCore.test';
import testLoggerCoreTest from './TestLoggerCore.test';
import resourceContractCoreTest from './ResourceContractCore.test';
import entryContextCoreTest from './EntryContextCore.test';
import pickerWantModelCoreTest from './PickerWantModelCore.test';
import abilityClassContractCoreTest from './AbilityClassContractCore.test';
import abilityTest from './Ability.test';
import indexPageUiStateTest from './IndexPageUiState.test';
import viewWantOfTest from './logic/ViewWantOf.test';
import viewWantOf2Test from './logic/ViewWantOf2.test';
import viewWantJsonOfTest from './logic/ViewWantJsonOf.test';
import acceptedCountOfTest from './logic/AcceptedCountOf.test';
import acceptedCountOf2Test from './logic/AcceptedCountOf2.test';
import appendSelectionTest from './logic/AppendSelection.test';
import countAfterSelectionTest from './logic/CountAfterSelection.test';
import countAfterSelection2Test from './logic/CountAfterSelection2.test';
import countAfterSelection3Test from './logic/CountAfterSelection3.test';
import itemTitleOfTest from './logic/ItemTitleOf.test';
import itemTitleOf2Test from './logic/ItemTitleOf2.test';
import twoDigitsTest from './logic/TwoDigits.test';
import twoDigits2Test from './logic/TwoDigits2.test';
import formatDateTest from './logic/FormatDate.test';
import formatDate2Test from './logic/FormatDate2.test';
import formatDate3Test from './logic/FormatDate3.test';
import formatDateFromMonthIndexTest from './logic/FormatDateFromMonthIndex.test';
import formatDateFromMonthIndex2Test from './logic/FormatDateFromMonthIndex2.test';
import formatDateFromMonthIndex3Test from './logic/FormatDateFromMonthIndex3.test';
import formatSizeTest from './logic/FormatSize.test';
import formatSize2Test from './logic/FormatSize2.test';
import sizeValueOfTest from './logic/SizeValueOf.test';
import sizeValueOf2Test from './logic/SizeValueOf2.test';
import errorMessageOfTest from './logic/ErrorMessageOf.test';
import errorMessageOf2Test from './logic/ErrorMessageOf2.test';
import errorMessageOf3Test from './logic/ErrorMessageOf3.test';
import itemKeyOfTest from './logic/ItemKeyOf.test';
import itemKeyOf2Test from './logic/ItemKeyOf2.test';
import itemKeyOf3Test from './logic/ItemKeyOf3.test';
import dlpListStateCtorTest from './logic/DlpListStateCtor.test';
import dlpListStateSelectTest from './logic/DlpListStateSelect.test';
import dlpListStateViewTest from './logic/DlpListStateView.test';
import dlpListStateSiftTest from './logic/DlpListStateSift.test';
import dlpListStateTitleAtTest from './logic/DlpListStateTitleAt.test';
import dlpListStateTitleAt2Test from './logic/DlpListStateTitleAt2.test';
import dlpListStateFlowTest from './logic/DlpListStateFlow.test';
import dlpListStateFlow2Test from './logic/DlpListStateFlow2.test';
import dlpListStateFlow3Test from './logic/DlpListStateFlow3.test';
import dlpListStateFlow4Test from './logic/DlpListStateFlow4.test';
import dlpListStateFlow5Test from './logic/DlpListStateFlow5.test';
import dlpListStateFlow6Test from './logic/DlpListStateFlow6.test';
import filePreviewDlpLogicConstantsTest from './logic/FilePreviewDlpLogicConstants.test';

export default function testsuite() {
  appLoggerCoreTest();
  testLoggerCoreTest();
  resourceContractCoreTest();
  entryContextCoreTest();
  pickerWantModelCoreTest();
  abilityClassContractCoreTest();
  abilityTest();
  indexPageUiStateTest();
  viewWantOfTest();
  viewWantOf2Test();
  viewWantJsonOfTest();
  acceptedCountOfTest();
  acceptedCountOf2Test();
  appendSelectionTest();
  countAfterSelectionTest();
  countAfterSelection2Test();
  countAfterSelection3Test();
  itemTitleOfTest();
  itemTitleOf2Test();
  twoDigitsTest();
  twoDigits2Test();
  formatDateTest();
  formatDate2Test();
  formatDate3Test();
  formatDateFromMonthIndexTest();
  formatDateFromMonthIndex2Test();
  formatDateFromMonthIndex3Test();
  formatSizeTest();
  formatSize2Test();
  sizeValueOfTest();
  sizeValueOf2Test();
  errorMessageOfTest();
  errorMessageOf2Test();
  errorMessageOf3Test();
  itemKeyOfTest();
  itemKeyOf2Test();
  itemKeyOf3Test();
  dlpListStateCtorTest();
  dlpListStateSelectTest();
  dlpListStateViewTest();
  dlpListStateSiftTest();
  dlpListStateTitleAtTest();
  dlpListStateTitleAt2Test();
  dlpListStateFlowTest();
  dlpListStateFlow2Test();
  dlpListStateFlow3Test();
  dlpListStateFlow4Test();
  dlpListStateFlow5Test();
  dlpListStateFlow6Test();
  filePreviewDlpLogicConstantsTest();
}

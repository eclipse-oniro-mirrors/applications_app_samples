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

import abilityTest from './Ability.test';
import verifyCodeConstantsCoreTest from './VerifyCodeConstantsCore.test';
import verifyCodeLoggerCoreTest from './VerifyCodeLoggerCore.test';
import verifyCodeModuleExportCoreTest from './VerifyCodeModuleExportCore.test';
import verifyCodeUiStateTest from './VerifyCodeUiState.test';
import verifyCodeConstantsValuesTest from './logic/VerifyCodeConstantsValues.test';
import rejectsInsertTest from './logic/RejectsInsert.test';
import insertIntoTest from './logic/InsertInto.test';
import insertInto2Test from './logic/InsertInto2.test';
import insertInto3Test from './logic/InsertInto3.test';
import insertInto4Test from './logic/InsertInto4.test';
import insertInto5Test from './logic/InsertInto5.test';
import insertInto6Test from './logic/InsertInto6.test';
import insertInto7Test from './logic/InsertInto7.test';
import deleteLeftOfTest from './logic/DeleteLeftOf.test';
import deleteLeftOf2Test from './logic/DeleteLeftOf2.test';
import isCompleteTest from './logic/IsComplete.test';
import cellTextOfTest from './logic/CellTextOf.test';
import cellTextOf2Test from './logic/CellTextOf2.test';
import cellTextOf3Test from './logic/CellTextOf3.test';
import cellTextOf4Test from './logic/CellTextOf4.test';
import cellTextOf5Test from './logic/CellTextOf5.test';
import cellTextOf6Test from './logic/CellTextOf6.test';
import filledCellsOfTest from './logic/FilledCellsOf.test';
import filledCellsOf2Test from './logic/FilledCellsOf2.test';
import cellKeyOfTest from './logic/CellKeyOf.test';
import cellKeyOf2Test from './logic/CellKeyOf2.test';
import cellKeyOf3Test from './logic/CellKeyOf3.test';
import typeSequenceTest from './logic/TypeSequence.test';
import backActionOfTest from './logic/BackActionOf.test';
import verifyCodeStateCtorTest from './logic/VerifyCodeStateCtor.test';
import verifyCodeStateAttachTest from './logic/VerifyCodeStateAttach.test';
import verifyCodeStateInsertTest from './logic/VerifyCodeStateInsert.test';
import verifyCodeStateDeleteLeftTest from './logic/VerifyCodeStateDeleteLeft.test';
import verifyCodeStateBackPressTest from './logic/VerifyCodeStateBackPress.test';
import verifyCodeStateFlowTest from './logic/VerifyCodeStateFlow.test';
import verifyCodeStateFlow2Test from './logic/VerifyCodeStateFlow2.test';
import verifyCodeStateFlow3Test from './logic/VerifyCodeStateFlow3.test';
import verifyCodeStateFlow4Test from './logic/VerifyCodeStateFlow4.test';
import verifyCodeStateFlow5Test from './logic/VerifyCodeStateFlow5.test';
import verifyCodeStateFlow6Test from './logic/VerifyCodeStateFlow6.test';
import verifyCodeStateFlow7Test from './logic/VerifyCodeStateFlow7.test';
import verifyCodeStateFlow8Test from './logic/VerifyCodeStateFlow8.test';
import verifyCodeStateFlow9Test from './logic/VerifyCodeStateFlow9.test';
import verifyCodeStateFlow10Test from './logic/VerifyCodeStateFlow10.test';
import verifyCodeStateFlow11Test from './logic/VerifyCodeStateFlow11.test';
import verifyCodeStateFlow12Test from './logic/VerifyCodeStateFlow12.test';
import verifyCodeLogicConstantsTest from './logic/VerifyCodeLogicConstants.test';

export default function testsuite() {
  verifyCodeConstantsCoreTest();
  verifyCodeLoggerCoreTest();
  verifyCodeModuleExportCoreTest();
  abilityTest();
  verifyCodeUiStateTest();
  verifyCodeConstantsValuesTest();
  rejectsInsertTest();
  insertIntoTest();
  insertInto2Test();
  insertInto3Test();
  insertInto4Test();
  insertInto5Test();
  insertInto6Test();
  insertInto7Test();
  deleteLeftOfTest();
  deleteLeftOf2Test();
  isCompleteTest();
  cellTextOfTest();
  cellTextOf2Test();
  cellTextOf3Test();
  cellTextOf4Test();
  cellTextOf5Test();
  cellTextOf6Test();
  filledCellsOfTest();
  filledCellsOf2Test();
  cellKeyOfTest();
  cellKeyOf2Test();
  cellKeyOf3Test();
  typeSequenceTest();
  backActionOfTest();
  verifyCodeStateCtorTest();
  verifyCodeStateAttachTest();
  verifyCodeStateInsertTest();
  verifyCodeStateDeleteLeftTest();
  verifyCodeStateBackPressTest();
  verifyCodeStateFlowTest();
  verifyCodeStateFlow2Test();
  verifyCodeStateFlow3Test();
  verifyCodeStateFlow4Test();
  verifyCodeStateFlow5Test();
  verifyCodeStateFlow6Test();
  verifyCodeStateFlow7Test();
  verifyCodeStateFlow8Test();
  verifyCodeStateFlow9Test();
  verifyCodeStateFlow10Test();
  verifyCodeStateFlow11Test();
  verifyCodeStateFlow12Test();
  verifyCodeLogicConstantsTest();
}

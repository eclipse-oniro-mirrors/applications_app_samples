/*
* Copyright (c) 2023-2024 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License")
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

import basicTest from './basicExampleTest/BasicExample.test';
import executeOrder1 from './basicExampleTest/ExecuteOrder1.test';
import executeOrder2 from './basicExampleTest/ExecuteOrder2.test';
import executeOrder3 from './basicExampleTest/ExecuteOrder3.test';
import executeOrder4 from './basicExampleTest/ExecuteOrder4.test';
import assert from './assertExampleTest/AssertExample.test';
import param from './paramExampleTest/paramExample.test';
import custom from './customExampleTest/customExample.test';
import cover from './coverExampleTest/coverExample.test';
import callBack from './callBackExampleTest/callBackExample.test';
import customAssertTest from './customEexpect/customAssert.test';
import resourceReferenceTest from './resourceReferenceTest/resourceReference.test';
import dataDriver from './dataDriver/DataDriver.test';
import afterReturn from './mock/AfterReturn.test';
import afterThrow from './mock/AfterThrow.test';
import argumentMatchersForAny from './mock/ArgumentMatchersForAny.test';
import argumentMatchersForRegex from './mock/ArgumentMatchersForRegex.test';
import argumentMatchersForString from './mock/ArgumentMatchersForString.test';
import clearMock from './mock/ClearMock.test';
import ignoreMock from './mock/IgnoreMock.test';
import mockStatic from './mock/MockStatic.test';
import mockPrivateFunc from './mock/MockPrivateFunc.test';
import mockProperty from './mock/MockProperty.test';
import returnPromise from './mock/ReturnPromise.test';
import vertify from './mock/Vertify.test';
import vertifyTimes from './mock/VertifyTimes.test';
import isMockedTest from './mock/IsMocked.test';

import entryAbilitySequence from './EntryAbilitySequence.test';
import completionSuite01 from './CompletionNumericEqualityBoundary.test';
import completionSuite02 from './CompletionStrictOrderingBoundary.test';
import completionSuite03 from './CompletionInclusiveOrderingBoundary.test';
import completionSuite04 from './CompletionInverseOrderingBoundary.test';
import completionSuite05 from './CompletionStringWhitespaceBoundary.test';
import completionSuite06 from './CompletionStringUnicodeBoundary.test';
import completionSuite07 from './CompletionStringControlBoundary.test';
import completionSuite08 from './CompletionStringInverseBoundary.test';
import completionSuite09 from './CompletionArrayAscendingIntegerBoundary.test';
import completionSuite10 from './CompletionArrayAscendingQuarterBoundary.test';
import completionSuite11 from './CompletionArrayAscendingWideBoundary.test';
import completionSuite12 from './CompletionArrayDescendingIntegerBoundary.test';
import completionSuite13 from './CompletionArrayDescendingQuarterBoundary.test';
import completionSuite14 from './CompletionArrayDescendingWideBoundary.test';
import completionSuite15 from './CompletionArrayAlternatingIntegerBoundary.test';
import completionSuite16 from './CompletionArrayAlternatingQuarterBoundary.test';
import completionSuite17 from './CompletionArrayAlternatingWideBoundary.test';
import completionSuite18 from './CompletionArrayPlateauIntegerBoundary.test';
import completionSuite19 from './CompletionArrayPlateauQuarterBoundary.test';
import completionSuite20 from './CompletionArrayPlateauWideBoundary.test';
import completionSuite21 from './CompletionArraySymmetricIntegerBoundary.test';
import completionSuite22 from './CompletionArraySymmetricQuarterBoundary.test';
import completionSuite23 from './CompletionArraySymmetricWideBoundary.test';
import completionSuite24 from './CompletionArrayImpulseIntegerBoundary.test';
import completionSuite25 from './CompletionArrayImpulseQuarterBoundary.test';
import completionSuite26 from './CompletionArrayImpulseWideBoundary.test';
import completionSuite27 from './CompletionArrayBinaryPowersIntegerBoundary.test';
import completionSuite28 from './CompletionArrayBinaryPowersQuarterBoundary.test';
import completionSuite29 from './CompletionArrayBinaryPowersWideBoundary.test';
import completionSuite30 from './CompletionArraySawToothIntegerBoundary.test';
import completionSuite31 from './CompletionArraySawToothQuarterBoundary.test';
import completionSuite32 from './CompletionArraySawToothWideBoundary.test';
import completionSuite33 from './CompletionSmallArrayBoundary.test';

export default function testsuite(): void {
  completionSuite01();
  completionSuite02();
  completionSuite03();
  completionSuite04();
  completionSuite05();
  completionSuite06();
  completionSuite07();
  completionSuite08();
  completionSuite09();
  completionSuite10();
  completionSuite11();
  completionSuite12();
  completionSuite13();
  completionSuite14();
  completionSuite15();
  completionSuite16();
  completionSuite17();
  completionSuite18();
  completionSuite19();
  completionSuite20();
  completionSuite21();
  completionSuite22();
  completionSuite23();
  completionSuite24();
  completionSuite25();
  completionSuite26();
  completionSuite27();
  completionSuite28();
  completionSuite29();
  completionSuite30();
  completionSuite31();
  completionSuite32();
  completionSuite33();
  entryAbilitySequence();
  executeOrder1();
  executeOrder2();
  executeOrder3();
  executeOrder4();
  assert();
  param();
  cover();
  callBack();
  customAssertTest();
  dataDriver(); // Registers the consolidated AbilityTest data rows, not the old empty cases.
  afterReturn();
  afterThrow();
  argumentMatchersForAny();
  argumentMatchersForRegex();
  argumentMatchersForString();
  clearMock();
  ignoreMock();
  mockStatic();
  mockPrivateFunc();
  mockProperty();
  returnPromise();
  vertify();
  vertifyTimes();
  isMockedTest();
  basicTest();
  custom();
  resourceReferenceTest();
}
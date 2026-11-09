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

import { beforeEachIt } from '@ohos/hypium';
import formatterLogicTest from './FormatterLogic.test';
import vCardParserLogicTest from './VCardParserLogic.test';
import vCardManagerLogicTest from './VCardManagerLogic.test';
import viewModelLogicTest from './ViewModelLogic.test';
import vCardTest from './VCard.test';
import numberParseLogicTest from './NumberParseLogic.test';
import numberParseEdgeLogicTest from './NumberParseEdgeLogic.test';
import intMathLogicTest from './IntMathLogic.test';
import idCardLogicTest from './IdCardLogic.test';
import idCardEdgeLogicTest from './IdCardEdgeLogic.test';
import luhnLogicTest from './LuhnLogic.test';
import luhnGenLogicTest from './LuhnGenLogic.test';
import randGenLogicTest from './RandGenLogic.test';
import randEdgeLogicTest from './RandEdgeLogic.test';
import textCodecLogicTest from './TextCodecLogic.test';
import codecDecodeLogicTest from './CodecDecodeLogic.test';
import dateNumberLogicTest from './DateNumberLogic.test';
import dateEdgeLogicTest from './DateEdgeLogic.test';
import vCardFactoryLogicTest from './VCardFactoryLogic.test';
import vCardFixtureLogicTest from './VCardFixtureLogic.test';
import parserUnitLogicTest from './ParserUnitLogic.test';
import parserEdgeLogicTest from './ParserEdgeLogic.test';
import errorCodeLogicTest from './ErrorCodeLogic.test';
import typesModelLogicTest from './TypesModelLogic.test';
import exportLogicTest from './ExportLogic.test';
import importLogicTest from './ImportLogic.test';
import historyLogicTest from './HistoryLogic.test';
import settingsLogicTest from './SettingsLogic.test';
import contactServiceLogicTest from './ContactServiceLogic.test';
import formatterMatrixLogicTest from './FormatterMatrixLogic.test';
import permissionLogicTest from './PermissionLogic.test';
import constantsLogicTest from './ConstantsLogic.test';
import algoSelfLogicTest from './AlgoSelfLogic.test';

// Zero-delay timers can keep Promise chains in uv_run instead of yielding to EventHandler.
const yieldEachCase = async (): Promise<void> => {
  await new Promise<void>((resolve) => {
    setTimeout(resolve, 1);
  });
};

// Keep testsuite() to plain calls: any other statement inside makes DevEco find no test case.
export default function testsuite() {
  beforeEachIt(yieldEachCase);
  formatterLogicTest();
  vCardParserLogicTest();
  vCardManagerLogicTest();
  viewModelLogicTest();
  vCardTest();
  numberParseLogicTest();
  numberParseEdgeLogicTest();
  intMathLogicTest();
  idCardLogicTest();
  idCardEdgeLogicTest();
  luhnLogicTest();
  luhnGenLogicTest();
  randGenLogicTest();
  randEdgeLogicTest();
  textCodecLogicTest();
  codecDecodeLogicTest();
  dateNumberLogicTest();
  dateEdgeLogicTest();
  vCardFactoryLogicTest();
  vCardFixtureLogicTest();
  parserUnitLogicTest();
  parserEdgeLogicTest();
  errorCodeLogicTest();
  typesModelLogicTest();
  exportLogicTest();
  importLogicTest();
  historyLogicTest();
  settingsLogicTest();
  contactServiceLogicTest();
  formatterMatrixLogicTest();
  permissionLogicTest();
  constantsLogicTest();
  algoSelfLogicTest();
}

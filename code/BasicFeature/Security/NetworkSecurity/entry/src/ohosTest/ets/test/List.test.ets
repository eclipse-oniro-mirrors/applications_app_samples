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
import networkSecurityTest from './NetworkSecurity.test';
import stringFormatLogicTest from './StringFormatLogic.test';
import collectionObjectLogicTest from './CollectionObjectLogic.test';
import validateNetworkLogicTest from './ValidateNetworkLogic.test';
import dateCryptoAsyncLogicTest from './DateCryptoAsyncLogic.test';
import typesErrorsLogicTest from './TypesErrorsLogic.test';
import viewModelGuardsLogicTest from './ViewModelGuardsLogic.test';
import numericMatrixStrPadTest from './NumericMatrixStrPad.test';
import numericMatrixStrMatchTest from './NumericMatrixStrMatch.test';
import numericMatrixStrEdgeTest from './NumericMatrixStrEdge.test';
import numericMatrixValidateIpPortTest from './NumericMatrixValidateIpPort.test';
import numericMatrixValidateTextTest from './NumericMatrixValidateText.test';
import numericMatrixCollectionTest from './NumericMatrixCollection.test';
import numericMatrixObjectTest from './NumericMatrixObject.test';
import numericMatrixCryptoTest from './NumericMatrixCrypto.test';
import numericMatrixDateTest from './NumericMatrixDate.test';
import numericMatrixNetHttpTest from './NumericMatrixNetHttp.test';
import numericMatrixFileDeviceTest from './NumericMatrixFileDevice.test';
import numericMatrixAsyncLoggerTest from './NumericMatrixAsyncLogger.test';
import numericMatrixFormatTest from './NumericMatrixFormatMisc.test';

// Default exported entry that registers all ohosTest test suites.
export default function testsuite() {
  // A timer lets EventHandler run between cases instead of chaining only microtasks.
  beforeEachIt(() => new Promise<void>((resolve: (value: void) => void) => {
    setTimeout(() => resolve(), 1);
  }));
  // Register the pure-logic test suites first so device free cases finish
  // before UI interaction suites can raise dialogs or steal the uitest queue.
  stringFormatLogicTest();
  collectionObjectLogicTest();
  validateNetworkLogicTest();
  dateCryptoAsyncLogicTest();
  typesErrorsLogicTest();
  viewModelGuardsLogicTest();
  // Numeric matrix suites grouped by domain: string, validate, collection/
  // object, crypto/date, network/file-device, async/format.
  numericMatrixStrPadTest();
  numericMatrixStrMatchTest();
  numericMatrixStrEdgeTest();
  numericMatrixValidateIpPortTest();
  numericMatrixValidateTextTest();
  numericMatrixCollectionTest();
  numericMatrixObjectTest();
  numericMatrixCryptoTest();
  numericMatrixDateTest();
  numericMatrixNetHttpTest();
  numericMatrixFileDeviceTest();
  numericMatrixAsyncLoggerTest();
  numericMatrixFormatTest();
  // Register the NetworkSecurity UI test suite into the test runner.
  networkSecurityTest();
}

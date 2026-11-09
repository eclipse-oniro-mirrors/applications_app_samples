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
import atomicServiceComponentsTest from './AtomicServiceComponents.test';
import constantsAndThemeTest from './ConstantsAndTheme.test';
import demoLogicTest from './DemoLogic.test';
import deviceProfileTest from './DeviceProfile.test';
import downloadFlowTest from './DownloadFlow.test';
import errorUtilTest from './ErrorUtil.test';
import formatUtilTest from './FormatUtil.test';
import logStoreTest from './LogStore.test';
import deviceProfileMatrixTest from './DeviceProfileMatrix.test';
import formatUtilMatrixTest from './FormatUtilMatrix.test';
import logStoreMatrixTest from './LogStoreMatrix.test';
import downloadFlowMatrixTest from './DownloadFlowMatrix.test';
import errorUtilMatrixTest from './ErrorUtilMatrix.test';
import demoLogicMatrixTest from './DemoLogicMatrix.test';
import constantsAndThemeMatrixTest from './ConstantsAndThemeMatrix.test';
import abilityJumpTest from './AbilityJump.test';
import sheetFlowTest from './SheetFlow.test';
import prefsStoreTest from './PrefsStore.test';
import enrichmentDeviceTest from './EnrichmentDevice.test';
import indexUiTest from './IndexUi.test';

export default function testsuite() {
  atomicServiceComponentsTest();
  demoLogicTest();
  downloadFlowTest();
  deviceProfileTest();
  logStoreTest();
  formatUtilTest();
  errorUtilTest();
  constantsAndThemeTest();
  deviceProfileMatrixTest();
  formatUtilMatrixTest();
  logStoreMatrixTest();
  downloadFlowMatrixTest();
  errorUtilMatrixTest();
  demoLogicMatrixTest();
  constantsAndThemeMatrixTest();
  abilityJumpTest();
  sheetFlowTest();
  prefsStoreTest();
  enrichmentDeviceTest();
  indexUiTest();
}

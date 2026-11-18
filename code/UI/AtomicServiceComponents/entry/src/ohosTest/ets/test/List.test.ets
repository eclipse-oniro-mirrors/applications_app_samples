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
import atomicFlowStabilityTest from './AtomicFlowStability.test';

import deviceProfileBuildMatrixPart1Test from './DeviceProfileBuildMatrixPart1.test';
import deviceProfileBuildMatrixPart2Test from './DeviceProfileBuildMatrixPart2.test';
import formatUtilExtraMatrixPart1Test from './FormatUtilExtraMatrixPart1.test';
import formatUtilExtraMatrixPart2Test from './FormatUtilExtraMatrixPart2.test';
import downloadFlowExhaustiveMatrixPart1Test from './DownloadFlowExhaustiveMatrixPart1.test';
import downloadFlowExhaustiveMatrixPart2Test from './DownloadFlowExhaustiveMatrixPart2.test';
import demoSwitchTabMatrixPart1Test from './DemoSwitchTabMatrixPart1.test';
import demoSwitchTabMatrixPart2Test from './DemoSwitchTabMatrixPart2.test';
import demoSwitchTabMatrixPart3Test from './DemoSwitchTabMatrixPart3.test';
import logStoreCapacityMatrixPart1Test from './LogStoreCapacityMatrixPart1.test';
import logStoreCapacityMatrixPart2Test from './LogStoreCapacityMatrixPart2.test';
import abilityJumpErrorMatrixPart1Test from './AbilityJumpErrorMatrixPart1.test';
import abilityJumpErrorMatrixPart2Test from './AbilityJumpErrorMatrixPart2.test';
import sheetFlowStatusMatrixPart1Test from './SheetFlowStatusMatrixPart1.test';
import sheetFlowStatusMatrixPart2Test from './SheetFlowStatusMatrixPart2.test';
import prefsBoundaryMatrixPart1Test from './PrefsBoundaryMatrixPart1.test';
import prefsBoundaryMatrixPart2Test from './PrefsBoundaryMatrixPart2.test';
import errorUtilExtraMatrixPart1Test from './ErrorUtilExtraMatrixPart1.test';
import errorUtilExtraMatrixPart2Test from './ErrorUtilExtraMatrixPart2.test';
import crossModuleFlowMatrixPart1Test from './CrossModuleFlowMatrixPart1.test';
import formatNumericGridMatrixCombinedPart1Test from './FormatNumericGridMatrixCombinedPart1.test';
import formatNumericGridMatrixCombinedPart2Test from './FormatNumericGridMatrixCombinedPart2.test';
import formatDateGridMatrixCombinedPart1Test from './FormatDateGridMatrixCombinedPart1.test';
import demoFilterGridMatrixCombinedPart1Test from './DemoFilterGridMatrixCombinedPart1.test';
import demoFilterGridMatrixCombinedPart2Test from './DemoFilterGridMatrixCombinedPart2.test';
import demoFilterGridMatrixCombinedPart3Test from './DemoFilterGridMatrixCombinedPart3.test';
import demoFilterGridMatrixCombinedPart4Test from './DemoFilterGridMatrixCombinedPart4.test';
import deviceProfileGridMatrixCombinedPart1Test from './DeviceProfileGridMatrixCombinedPart1.test';
import deviceProfileGridMatrixCombinedPart2Test from './DeviceProfileGridMatrixCombinedPart2.test';
import deviceProfileGridMatrixCombinedPart3Test from './DeviceProfileGridMatrixCombinedPart3.test';
import logQueryGridMatrixCombinedPart1Test from './LogQueryGridMatrixCombinedPart1.test';
import logQueryGridMatrixCombinedPart2Test from './LogQueryGridMatrixCombinedPart2.test';
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
  atomicFlowStabilityTest();
  deviceProfileBuildMatrixPart1Test();
  deviceProfileBuildMatrixPart2Test();
  formatUtilExtraMatrixPart1Test();
  formatUtilExtraMatrixPart2Test();
  downloadFlowExhaustiveMatrixPart1Test();
  downloadFlowExhaustiveMatrixPart2Test();
  demoSwitchTabMatrixPart1Test();
  demoSwitchTabMatrixPart2Test();
  demoSwitchTabMatrixPart3Test();
  logStoreCapacityMatrixPart1Test();
  logStoreCapacityMatrixPart2Test();
  abilityJumpErrorMatrixPart1Test();
  abilityJumpErrorMatrixPart2Test();
  sheetFlowStatusMatrixPart1Test();
  sheetFlowStatusMatrixPart2Test();
  prefsBoundaryMatrixPart1Test();
  prefsBoundaryMatrixPart2Test();
  errorUtilExtraMatrixPart1Test();
  errorUtilExtraMatrixPart2Test();
  crossModuleFlowMatrixPart1Test();
  formatNumericGridMatrixCombinedPart1Test();
  formatNumericGridMatrixCombinedPart2Test();
  formatDateGridMatrixCombinedPart1Test();
  demoFilterGridMatrixCombinedPart1Test();
  demoFilterGridMatrixCombinedPart2Test();
  demoFilterGridMatrixCombinedPart3Test();
  demoFilterGridMatrixCombinedPart4Test();
  deviceProfileGridMatrixCombinedPart1Test();
  deviceProfileGridMatrixCombinedPart2Test();
  deviceProfileGridMatrixCombinedPart3Test();
  logQueryGridMatrixCombinedPart1Test();
  logQueryGridMatrixCombinedPart2Test();
}

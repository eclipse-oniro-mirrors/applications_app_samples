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
import demoLogicTest from './DemoLogic.test';
import formatUtilTest from './FormatUtil.test';
import errorUtilTest from './ErrorUtil.test';
import deviceProfileTest from './DeviceProfile.test';
import logStoreTest from './LogStore.test';
import downloadFlowTest from './DownloadFlow.test';
import appConstantsTest from './AppConstants.test';
import abilityJumpTest from './AbilityJump.test';
import sheetFlowTest from './SheetFlow.test';
import prefsStoreTest from './PrefsStore.test';

export default function testsuite() {
  demoLogicTest();
  formatUtilTest();
  errorUtilTest();
  deviceProfileTest();
  logStoreTest();
  downloadFlowTest();
  appConstantsTest();
  abilityJumpTest();
  sheetFlowTest();
  prefsStoreTest();
}

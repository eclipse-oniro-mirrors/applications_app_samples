/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import storagePathTest from './StoragePath.test';
import joinPathMatrixCoreTest from './JoinPathMatrixCore.test';
import joinPathMatrixExtendedTest from './JoinPathMatrixExtended.test';
import joinPathMatrixAdvancedTest from './JoinPathMatrixAdvanced.test';
import joinPathMatrixTailTest from './JoinPathMatrixTail.test';
import launchIntentTest from './LaunchIntent.test';
import wantFlagMatrixTest from './WantFlagMatrix.test';
import startOptionsFormatTest from './StartOptionsFormat.test';
import appConstantMatrixTest from './AppConstantMatrix.test';
import resourceLocaleMatrixTest from './ResourceLocaleMatrix.test';
import storageDataTest from './StorageData.test';
import storageAreaRecordCoreTest from './StorageAreaRecordCore.test';
import storageAreaRecordTailTest from './StorageAreaRecordTail.test';
import storageAreaSubsetTest from './StorageAreaSubset.test';
import characterOperationTest from './CharacterOperation.test';
import operationSubsetTest from './OperationSubset.test';
import abilityConfigTest from './AbilityConfig.test';
import implicitLaunchTest from './ImplicitLaunch.test';
import startOptionsTest from './StartOptions.test';
import abilityUiSmokeTest from './AbilityUiSmoke.test';

/**
 * 注册顺序即执行顺序：先跑纯逻辑矩阵，再跑资源与沙箱文件矩阵，然后是依赖首页 Context 的能力封装，
 * 最后才是会改语言/色彩模式、切换 Ability 栈顶的用例与 UI 冒烟，避免前序用例把界面留在中间态。
 */
export default function testsuite() {
  storagePathTest();
  joinPathMatrixCoreTest();
  joinPathMatrixExtendedTest();
  joinPathMatrixAdvancedTest();
  joinPathMatrixTailTest();
  launchIntentTest();
  wantFlagMatrixTest();
  startOptionsFormatTest();
  appConstantMatrixTest();
  resourceLocaleMatrixTest();
  storageDataTest();
  storageAreaRecordCoreTest();
  storageAreaRecordTailTest();
  storageAreaSubsetTest();
  characterOperationTest();
  operationSubsetTest();
  abilityConfigTest();
  implicitLaunchTest();
  startOptionsTest();
  abilityUiSmokeTest();
}

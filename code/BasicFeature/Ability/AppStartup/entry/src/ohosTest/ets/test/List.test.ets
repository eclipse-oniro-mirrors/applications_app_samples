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

import coldStartTest from './ColdStart.test';
import bundleConfigMatrixTest from './BundleConfigMatrix.test';
import resourceLocaleMatrixTest from './ResourceLocaleMatrix.test';
import startupManagerMatrixCoreTest from './StartupManagerMatrixCore.test';
import startupManagerMatrixTailTest from './StartupManagerMatrixTail.test';
import startupDataMatrixTest from './StartupDataMatrix.test';
import bundleManagerFlagMatrixTest from './BundleManagerFlagMatrix.test';
import startupRunSubsetMatrixTest from './StartupRunSubsetMatrix.test';
import startupInvalidNameMatrixTest from './StartupInvalidNameMatrix.test';
import startupListenerMatrixTest from './StartupListenerMatrix.test';
import resourceLocaleExtendedTest from './ResourceLocaleExtended.test';
import startupDataExtendedTest from './StartupDataExtended.test';
import resourceLocaleHugeMatrixCoreTest from './ResourceLocaleHugeMatrixCore.test';
import resourceLocaleHugeMatrixTailTest from './ResourceLocaleHugeMatrixTail.test';
import resourceLocaleMoreMatrixTest from './ResourceLocaleMoreMatrix.test';
import bundleInfoExtendedMatrixCoreTest from './BundleInfoExtendedMatrixCore.test';
import bundleInfoExtendedMatrixExtendedTest from './BundleInfoExtendedMatrixExtended.test';
import bundleInfoExtendedMatrixTailTest from './BundleInfoExtendedMatrixTail.test';
import startupRunPermutationMatrixCoreTest from './StartupRunPermutationMatrixCore.test';
import startupRunPermutationMatrixExtendedTest from './StartupRunPermutationMatrixExtended.test';
import startupRunPermutationMatrixAdvancedTest from './StartupRunPermutationMatrixAdvanced.test';
import startupRunPermutationMatrixTailTest from './StartupRunPermutationMatrixTail.test';
import startupRunPermutationMatrixExtraTest from './StartupRunPermutationMatrixExtra.test';
import startupRunPermutationMatrixMoreTest from './StartupRunPermutationMatrixMore.test';
import startupRunPermutationMatrixFinalTest from './StartupRunPermutationMatrixFinal.test';
import startupRunPermutationMatrixLastTest from './StartupRunPermutationMatrixLast.test';
import uiSmokeTest from './UiSmoke.test';

/**
 * 注册顺序即执行顺序：ColdStart 必须第一个跑，它断言 EntryAbility 拉起前 entry 的启动配置尚未加载；
 * 随后是不依赖页面的配置与资源矩阵、startupManager 接口矩阵、启动任务产出的业务数据，最后点击页面做 UI 冒烟。
 */
export default function testsuite() {
  coldStartTest();
  bundleConfigMatrixTest();
  resourceLocaleMatrixTest();
  startupManagerMatrixCoreTest();
  startupManagerMatrixTailTest();
  startupDataMatrixTest();
  bundleManagerFlagMatrixTest();
  startupRunSubsetMatrixTest();
  startupInvalidNameMatrixTest();
  startupListenerMatrixTest();
  resourceLocaleExtendedTest();
  startupDataExtendedTest();
  resourceLocaleHugeMatrixCoreTest();
  resourceLocaleHugeMatrixTailTest();
  resourceLocaleMoreMatrixTest();
  bundleInfoExtendedMatrixCoreTest();
  bundleInfoExtendedMatrixExtendedTest();
  bundleInfoExtendedMatrixTailTest();
  startupRunPermutationMatrixCoreTest();
  startupRunPermutationMatrixExtendedTest();
  startupRunPermutationMatrixAdvancedTest();
  startupRunPermutationMatrixTailTest();
  startupRunPermutationMatrixExtraTest();
  startupRunPermutationMatrixMoreTest();
  startupRunPermutationMatrixFinalTest();
  startupRunPermutationMatrixLastTest();
  uiSmokeTest();
}

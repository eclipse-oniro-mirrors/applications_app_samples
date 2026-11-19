/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bundleConfigMatrixTest from './BundleConfigMatrix.test';
import resourceLocaleMatrixCoreTest from './ResourceLocaleMatrixCore.test';
import resourceLocaleMatrixExtendedTest from './ResourceLocaleMatrixExtended.test';
import resourceLocaleMatrixAdvancedTest from './ResourceLocaleMatrixAdvanced.test';
import resourceLocaleMatrixTailTest from './ResourceLocaleMatrixTail.test';
import dataUriUtilsMatrixTest from './DataUriUtilsMatrix.test';
import appManagerMatrixTest from './AppManagerMatrix.test';
import applicationContextMatrixTest from './ApplicationContextMatrix.test';
import errorManagerMatrixTest from './ErrorManagerMatrix.test';
import wantAgentMatrixTest from './WantAgentMatrix.test';
import bundleManagerFlagMatrixTest from './BundleManagerFlagMatrix.test';
import canOpenLinkMatrixTest from './CanOpenLinkMatrix.test';
import resourceLocaleExtendedCoreTest from './ResourceLocaleExtendedCore.test';
import resourceLocaleExtendedExtendedTest from './ResourceLocaleExtendedExtended.test';
import resourceLocaleExtendedAdvancedTest from './ResourceLocaleExtendedAdvanced.test';
import resourceLocaleExtendedTailTest from './ResourceLocaleExtendedTail.test';
import applicationContextExtendedTest from './ApplicationContextExtended.test';
import dataUriUtilsExtendedTest from './DataUriUtilsExtended.test';
import wantAgentExtendedCoreTest from './WantAgentExtendedCore.test';
import wantAgentExtendedTailTest from './WantAgentExtendedTail.test';
import errorManagerExtendedTest from './ErrorManagerExtended.test';
import resourceLocaleHugeMatrixACoreTest from './ResourceLocaleHugeMatrixACore.test';
import resourceLocaleHugeMatrixAExtendedTest from './ResourceLocaleHugeMatrixAExtended.test';
import resourceLocaleHugeMatrixAAdvancedTest from './ResourceLocaleHugeMatrixAAdvanced.test';
import resourceLocaleHugeMatrixATailTest from './ResourceLocaleHugeMatrixATail.test';
import resourceLocaleHugeMatrixBCoreTest from './ResourceLocaleHugeMatrixBCore.test';
import resourceLocaleHugeMatrixBExtendedTest from './ResourceLocaleHugeMatrixBExtended.test';
import resourceLocaleHugeMatrixBAdvancedTest from './ResourceLocaleHugeMatrixBAdvanced.test';
import resourceLocaleHugeMatrixBTailTest from './ResourceLocaleHugeMatrixBTail.test';
import resourceLocaleHugeMatrixCCoreTest from './ResourceLocaleHugeMatrixCCore.test';
import resourceLocaleHugeMatrixCExtendedTest from './ResourceLocaleHugeMatrixCExtended.test';
import resourceLocaleHugeMatrixCAdvancedTest from './ResourceLocaleHugeMatrixCAdvanced.test';
import resourceLocaleHugeMatrixCTailTest from './ResourceLocaleHugeMatrixCTail.test';
import resourceLocaleHugeMatrixDCoreTest from './ResourceLocaleHugeMatrixDCore.test';
import resourceLocaleHugeMatrixDExtendedTest from './ResourceLocaleHugeMatrixDExtended.test';
import resourceLocaleHugeMatrixDAdvancedTest from './ResourceLocaleHugeMatrixDAdvanced.test';
import resourceLocaleHugeMatrixDTailTest from './ResourceLocaleHugeMatrixDTail.test';
import resourceLocaleMoreMatrixACoreTest from './ResourceLocaleMoreMatrixACore.test';
import resourceLocaleMoreMatrixAExtendedTest from './ResourceLocaleMoreMatrixAExtended.test';
import resourceLocaleMoreMatrixATailTest from './ResourceLocaleMoreMatrixATail.test';
import resourceLocaleMoreMatrixBCoreTest from './ResourceLocaleMoreMatrixBCore.test';
import resourceLocaleMoreMatrixBExtendedTest from './ResourceLocaleMoreMatrixBExtended.test';
import resourceLocaleMoreMatrixBTailTest from './ResourceLocaleMoreMatrixBTail.test';
import resourceLocaleMoreMatrixCCoreTest from './ResourceLocaleMoreMatrixCCore.test';
import resourceLocaleMoreMatrixCExtendedTest from './ResourceLocaleMoreMatrixCExtended.test';
import resourceLocaleMoreMatrixCTailTest from './ResourceLocaleMoreMatrixCTail.test';
import bundleInfoExtendedMatrixCoreTest from './BundleInfoExtendedMatrixCore.test';
import bundleInfoExtendedMatrixExtendedTest from './BundleInfoExtendedMatrixExtended.test';
import bundleInfoExtendedMatrixTailTest from './BundleInfoExtendedMatrixTail.test';
import abilityLifecycleTest from './AbilityLifecycle.test';
import uiSmokeTest from './UiSmoke.test';

/**
 * 注册顺序即执行顺序：先跑不依赖页面的配置、资源与接口矩阵，WantAgent 的 trigger 会把 EntryAbility
 * 拉到前台，放在接口矩阵最后；再跑 AbilityLifecycleAbility 生命周期与点击页面按钮的 UI 冒烟。
 */
export default function testsuite() {
  bundleConfigMatrixTest();
  resourceLocaleMatrixCoreTest();
  resourceLocaleMatrixExtendedTest();
  resourceLocaleMatrixAdvancedTest();
  resourceLocaleMatrixTailTest();
  dataUriUtilsMatrixTest();
  appManagerMatrixTest();
  applicationContextMatrixTest();
  errorManagerMatrixTest();
  wantAgentMatrixTest();
  bundleManagerFlagMatrixTest();
  canOpenLinkMatrixTest();
  resourceLocaleExtendedCoreTest();
  resourceLocaleExtendedExtendedTest();
  resourceLocaleExtendedAdvancedTest();
  resourceLocaleExtendedTailTest();
  applicationContextExtendedTest();
  dataUriUtilsExtendedTest();
  wantAgentExtendedCoreTest();
  wantAgentExtendedTailTest();
  errorManagerExtendedTest();
  resourceLocaleHugeMatrixACoreTest();
  resourceLocaleHugeMatrixAExtendedTest();
  resourceLocaleHugeMatrixAAdvancedTest();
  resourceLocaleHugeMatrixATailTest();
  resourceLocaleHugeMatrixBCoreTest();
  resourceLocaleHugeMatrixBExtendedTest();
  resourceLocaleHugeMatrixBAdvancedTest();
  resourceLocaleHugeMatrixBTailTest();
  resourceLocaleHugeMatrixCCoreTest();
  resourceLocaleHugeMatrixCExtendedTest();
  resourceLocaleHugeMatrixCAdvancedTest();
  resourceLocaleHugeMatrixCTailTest();
  resourceLocaleHugeMatrixDCoreTest();
  resourceLocaleHugeMatrixDExtendedTest();
  resourceLocaleHugeMatrixDAdvancedTest();
  resourceLocaleHugeMatrixDTailTest();
  resourceLocaleMoreMatrixACoreTest();
  resourceLocaleMoreMatrixAExtendedTest();
  resourceLocaleMoreMatrixATailTest();
  resourceLocaleMoreMatrixBCoreTest();
  resourceLocaleMoreMatrixBExtendedTest();
  resourceLocaleMoreMatrixBTailTest();
  resourceLocaleMoreMatrixCCoreTest();
  resourceLocaleMoreMatrixCExtendedTest();
  resourceLocaleMoreMatrixCTailTest();
  bundleInfoExtendedMatrixCoreTest();
  bundleInfoExtendedMatrixExtendedTest();
  bundleInfoExtendedMatrixTailTest();
  abilityLifecycleTest();
  uiSmokeTest();
}

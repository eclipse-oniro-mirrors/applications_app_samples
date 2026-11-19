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

import bundleConfigMatrixTest from './BundleConfigMatrix.test';
import resourceLocaleMatrixTest from './ResourceLocaleMatrix.test';
import skillMatchUriTest from './SkillMatchUri.test';
import skillMatchActionEntityTest from './SkillMatchActionEntity.test';
import paramPassthroughTest from './ParamPassthrough.test';
import openLinkMatrixCoreTest from './OpenLinkMatrixCore.test';
import openLinkMatrixTailTest from './OpenLinkMatrixTail.test';
import openLinkCallbackTest from './OpenLinkCallback.test';
import bundleManagerFlagMatrixTest from './BundleManagerFlagMatrix.test';
import canOpenLinkMatrixTest from './CanOpenLinkMatrix.test';
import canOpenLinkMoreMatrixTest from './CanOpenLinkMoreMatrix.test';
import skillMatchUriExtendedTest from './SkillMatchUriExtended.test';
import openLinkErrorMatrixTest from './OpenLinkErrorMatrix.test';
import resourceLocaleExtendedTest from './ResourceLocaleExtended.test';
import resourceLocaleHugeMatrixCoreTest from './ResourceLocaleHugeMatrixCore.test';
import resourceLocaleHugeMatrixTailTest from './ResourceLocaleHugeMatrixTail.test';
import resourceLocaleMoreMatrixTest from './ResourceLocaleMoreMatrix.test';
import bundleInfoExtendedMatrixCoreTest from './BundleInfoExtendedMatrixCore.test';
import bundleInfoExtendedMatrixExtendedTest from './BundleInfoExtendedMatrixExtended.test';
import bundleInfoExtendedMatrixTailTest from './BundleInfoExtendedMatrixTail.test';
import abilityLifecycleTest from './AbilityLifecycle.test';
import universalLinkUiSmokeTest from './UniversalLinkUiSmoke.test';

/**
 * 注册顺序即执行顺序：先跑不依赖页面的配置与资源矩阵，再跑隐式拉起与 openLink 矩阵，
 * 最后是单实例/显式启动与点击首页按钮的 UI 冒烟，避免前序用例把界面留在中间态。
 */
export default function testsuite() {
  bundleConfigMatrixTest();
  resourceLocaleMatrixTest();
  skillMatchUriTest();
  skillMatchActionEntityTest();
  paramPassthroughTest();
  openLinkMatrixCoreTest();
  openLinkMatrixTailTest();
  openLinkCallbackTest();
  bundleManagerFlagMatrixTest();
  canOpenLinkMatrixTest();
  canOpenLinkMoreMatrixTest();
  skillMatchUriExtendedTest();
  openLinkErrorMatrixTest();
  resourceLocaleExtendedTest();
  resourceLocaleHugeMatrixCoreTest();
  resourceLocaleHugeMatrixTailTest();
  resourceLocaleMoreMatrixTest();
  bundleInfoExtendedMatrixCoreTest();
  bundleInfoExtendedMatrixExtendedTest();
  bundleInfoExtendedMatrixTailTest();
  abilityLifecycleTest();
  universalLinkUiSmokeTest();
}

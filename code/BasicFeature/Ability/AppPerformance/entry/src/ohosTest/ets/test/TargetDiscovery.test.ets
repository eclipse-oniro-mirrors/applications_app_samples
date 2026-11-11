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

import { describe, expect } from '@ohos/hypium';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { common } from '@kit.AbilityKit';
import { fileIo } from '@kit.CoreFileKit';
import { NativeAppPlatform } from '../../../main/ets/core/AppPlatform';
import { scenario } from '../support/BoundedCase';

/** Real installed-file discovery, not a FakePlatform list. No eviction is requested here. */
export default function targetDiscoveryTests(): void {
  describe('AppPerformanceTargetDiscovery', (): void => {
    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCETARGETDISCOVERY_0100
     * @tc.name      testAppPerformanceTargetDiscovery0001
     * @tc.desc      Verify 安装目录不可枚举时仍发现真实可读hap，不生成虚构文件
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceTargetDiscovery0001', (): void => {
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const platform = new NativeAppPlatform(context as common.UIAbilityContext);
      const files = platform.listFiles();
      expect(files.indexOf('entry.hap') >= 0).assertTrue();
      expect(files.length > 0).assertTrue();
      files.forEach((relative: string): void => {
        expect(fileIo.statSync(`${context.bundleCodeDir}/${relative}`).isFile()).assertTrue();
      });
    });
  });
}

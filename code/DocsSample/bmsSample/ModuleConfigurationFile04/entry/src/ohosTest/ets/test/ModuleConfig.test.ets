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
import { beforeEach, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { bundleManager } from '@kit.AbilityKit';
import { TestLog } from '../harness/TestLog';

const BUNDLE_NAME = 'com.example.moduleconfigurationfile04';
const VERSION_NAME = '1.0.0';

function findModule(modules: bundleManager.HapModuleInfo[], name: string): bundleManager.HapModuleInfo | null {
  for (let i = 0; i < modules.length; i++) {
    if (modules[i].name === name) {
      return modules[i];
    }
  }
  return null;
}

export default function ModuleConfigTest(): void {
  describe('ModuleConfigTest', () => {
    // Yield a macrotask to keep large suites responsive to the main-thread watchdog.
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_0100
     * @tc.name      testModuleConfigBundleInfo0001
     * @tc.desc      Installed bundle keeps the module.json5 application identity.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleConfigBundleInfo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testModuleConfigBundleInfo0001', 'case begin', 'bundle identity check');
      const bundleInfo = await bundleManager.getBundleInfoForSelf(
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
      TestLog.text('testModuleConfigBundleInfo0001', 'bundle name', bundleInfo.name);
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      TestLog.text('testModuleConfigBundleInfo0001', 'version name', bundleInfo.versionName);
      expect(bundleInfo.versionName).assertEqual(VERSION_NAME);
      TestLog.text('testModuleConfigBundleInfo0001', 'case end', 'bundle identity check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_0200
     * @tc.name      testModuleConfigEntryModule0002
     * @tc.desc      Entry module stays an entry HAP with EntryAbility and non installationFree.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleConfigEntryModule0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testModuleConfigEntryModule0002', 'case begin', 'entry module check');
      const bundleInfo = await bundleManager.getBundleInfoForSelf(
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE);
      const entryModule = findModule(bundleInfo.hapModulesInfo, 'entry');
      TestLog.flag('testModuleConfigEntryModule0002', 'entry module found', entryModule !== null);
      expect(entryModule !== null).assertTrue();
      if (entryModule === null) {
        return;
      }
      TestLog.number('testModuleConfigEntryModule0002', 'module type', entryModule.type);
      expect(entryModule.type).assertEqual(bundleManager.ModuleType.ENTRY);
      TestLog.text('testModuleConfigEntryModule0002', 'main element', entryModule.mainElementName);
      expect(entryModule.mainElementName).assertEqual('EntryAbility');
      TestLog.flag('testModuleConfigEntryModule0002', 'installation free', entryModule.installationFree);
      expect(entryModule.installationFree).assertFalse();
      TestLog.text('testModuleConfigEntryModule0002', 'case end', 'entry module check');
    })
  })
}

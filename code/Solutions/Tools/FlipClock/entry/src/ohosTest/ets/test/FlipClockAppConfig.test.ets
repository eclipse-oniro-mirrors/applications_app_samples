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

import { describe, it, expect, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { bundleManager } from '@kit.AbilityKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';
let info: bundleManager.BundleInfo;

export default function flipClockAppConfigTest() {
  describe('FlipClockAppConfigTest', () => {
    beforeAll(() => { info = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION); })

    /**
     * @tc.name   testFlipClockConfigIdentity001
     * @tc.number SUB_FLIP_CLOCK_CONFIG_001
     * @tc.desc   Verify bundle identity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockConfigIdentity001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockConfigIdentity001 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.name), String('ohos.samples.flipclock'));
      expect(info.name).assertEqual('ohos.samples.flipclock');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.versionName), String('1.0.0'));
        expect(info.versionName).assertEqual('1.0.0');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.versionCode), String(1000000));
        expect(info.versionCode).assertEqual(1000000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockConfigIdentity001 end');
    })

    /**
     * @tc.name   testFlipClockConfigModule002
     * @tc.number SUB_FLIP_CLOCK_CONFIG_002
     * @tc.desc   Verify entry module is present.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockConfigModule002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockConfigModule002 begin');
      let found: boolean = false;
        for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
          if (info.hapModulesInfo[i].name === 'entry') {
          found = true;
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[i].deviceTypes.includes('default')));
        expect(info.hapModulesInfo[i].deviceTypes.includes('default')).assertTrue();
        }
          }
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(found));
          expect(found).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockConfigModule002 end');
    })

    /**
     * @tc.name   testFlipClockConfigDevice003
     * @tc.number SUB_FLIP_CLOCK_CONFIG_003
     * @tc.desc   Verify tablet device support.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockConfigDevice003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockConfigDevice003 begin');
      let module: bundleManager.HapModuleInfo | undefined = undefined;
        for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
          if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
        }
          }
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(module !== undefined));
          expect(module !== undefined).assertTrue();
        const mod: bundleManager.HapModuleInfo = module as bundleManager.HapModuleInfo;
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(mod.deviceTypes.includes('tablet')));
        expect(mod.deviceTypes.includes('tablet')).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(mod.deviceTypes.length >= 2));
        expect(mod.deviceTypes.length >= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockConfigDevice003 end');
    })

    /**
     * @tc.name   testFlipClockConfigAbility004
     * @tc.number SUB_FLIP_CLOCK_CONFIG_004
     * @tc.desc   Verify EntryAbility declaration.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockConfigAbility004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockConfigAbility004 begin');
      let found: boolean = false;
        for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
          const a: Array<bundleManager.AbilityInfo> = info.hapModulesInfo[i].abilitiesInfo;
        for (let j: number = 0; j < a.length; j++) {
          if (a[j].name === 'EntryAbility') {
          found = true;
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a[j].exported));
        expect(a[j].exported).assertTrue();
        }
          }
          }
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(found));
          expect(found).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockConfigAbility004 end');
    })

    /**
     * @tc.name   testFlipClockConfigAppIcon005
     * @tc.number SUB_FLIP_CLOCK_CONFIG_005
     * @tc.desc   Verify application label and icon.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockConfigAppIcon005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockConfigAppIcon005 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.appInfo.labelId > 0));
      expect(info.appInfo.labelId > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.appInfo.iconId > 0));
        expect(info.appInfo.iconId > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.appInfo.name), String('ohos.samples.flipclock'));
        expect(info.appInfo.name).assertEqual('ohos.samples.flipclock');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockConfigAppIcon005 end');
    })

    /**
     * @tc.name   testFlipClockConfigPermission006
     * @tc.number SUB_FLIP_CLOCK_CONFIG_006
     * @tc.desc   Verify permission PUBLISH_AGENT_REMINDER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockConfigPermission006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockConfigPermission006 begin');
      const names: Set<string> = new Set<string>();
        for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
          names.add(info.reqPermissionDetails[index].name);
        }
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(names.has('ohos.permission.PUBLISH_AGENT_REMINDER')));
          expect(names.has('ohos.permission.PUBLISH_AGENT_REMINDER')).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.reqPermissionDetails.length >= 3));
        expect(info.reqPermissionDetails.length >= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockConfigPermission006 end');
    })

    /**
     * @tc.name   testFlipClockConfigPermission007
     * @tc.number SUB_FLIP_CLOCK_CONFIG_007
     * @tc.desc   Verify permission READ_CALENDAR.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockConfigPermission007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockConfigPermission007 begin');
      const names: Set<string> = new Set<string>();
        for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
          names.add(info.reqPermissionDetails[index].name);
        }
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(names.has('ohos.permission.READ_CALENDAR')));
          expect(names.has('ohos.permission.READ_CALENDAR')).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.reqPermissionDetails.length >= 3));
        expect(info.reqPermissionDetails.length >= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockConfigPermission007 end');
    })

    /**
     * @tc.name   testFlipClockConfigPermission008
     * @tc.number SUB_FLIP_CLOCK_CONFIG_008
     * @tc.desc   Verify permission WRITE_CALENDAR.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockConfigPermission008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockConfigPermission008 begin');
      const names: Set<string> = new Set<string>();
        for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
          names.add(info.reqPermissionDetails[index].name);
        }
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(names.has('ohos.permission.WRITE_CALENDAR')));
          expect(names.has('ohos.permission.WRITE_CALENDAR')).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.reqPermissionDetails.length >= 3));
        expect(info.reqPermissionDetails.length >= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockConfigPermission008 end');
    })

    /**
     * @tc.name   testFlipClockConfigPermissionScene009
     * @tc.number SUB_FLIP_CLOCK_CONFIG_009
     * @tc.desc   Verify calendar permissions have scenes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockConfigPermissionScene009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockConfigPermissionScene009 begin');
      for (let i: number = 0; i < info.reqPermissionDetails.length; i++) {
        const item: bundleManager.PermissionDef = info.reqPermissionDetails[i];
        if (item.name.includes('CALENDAR')) {
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(item.reason.length > 0));
          expect(item.reason.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(item.usedScene.when.length > 0));
        expect(item.usedScene.when.length > 0).assertTrue();
        }
          }
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.reqPermissionDetails.length >= 3));
          expect(info.reqPermissionDetails.length >= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockConfigPermissionScene009 end');
    })

    /**
     * @tc.name   testFlipClockConfigModuleFlags010
     * @tc.number SUB_FLIP_CLOCK_CONFIG_010
     * @tc.desc   Verify entry module packaging flags.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockConfigModuleFlags010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockConfigModuleFlags010 begin');
      let module: bundleManager.HapModuleInfo | undefined = undefined;
        for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
          if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
        }
          }
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(module !== undefined));
          expect(module !== undefined).assertTrue();
        const mod: bundleManager.HapModuleInfo = module as bundleManager.HapModuleInfo;
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(mod.name), String('entry'));
        expect(mod.name).assertEqual('entry');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(mod.installationFree));
        expect(mod.installationFree).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockConfigModuleFlags010 end');
    })
  })
}

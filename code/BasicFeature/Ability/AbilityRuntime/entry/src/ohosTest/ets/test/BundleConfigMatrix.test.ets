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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { bundleManager } from '@kit.AbilityKit';
import { process } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { findAbility, findHapModule, getSelfBundleInfo } from './TestHelper';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AbilityRuntime]';

function requireHap(name: string): bundleManager.HapModuleInfo {
  const hap: bundleManager.HapModuleInfo | undefined = findHapModule(name);
  if (hap === undefined) {
    throw new Error('missing hap ' + name);
  }
  return hap;
}

function requireAbility(moduleName: string, name: string): bundleManager.AbilityInfo {
  const ability: bundleManager.AbilityInfo | undefined = findAbility(moduleName, name);
  if (ability === undefined) {
    throw new Error('missing ability ' + name);
  }
  return ability;
}

function hapNames(info: bundleManager.BundleInfo): string {
  return info.hapModulesInfo.map((m: bundleManager.HapModuleInfo) => m.name).sort().join(',');
}

function abilityNames(hap: bundleManager.HapModuleInfo): string {
  return hap.abilitiesInfo.map((a: bundleManager.AbilityInfo) => a.name).join(',');
}

function extensionNames(hap: bundleManager.HapModuleInfo): string {
  return hap.extensionAbilitiesInfo.map((e: bundleManager.ExtensionAbilityInfo) => e.name).join(',');
}

function requireBackupExtension(): bundleManager.ExtensionAbilityInfo {
  const ext: bundleManager.ExtensionAbilityInfo | undefined = requireHap('entry').extensionAbilitiesInfo.find(
    (e: bundleManager.ExtensionAbilityInfo) => e.name === 'EntryBackupAbility');
  if (ext === undefined) {
    throw new Error('missing EntryBackupAbility');
  }
  return ext;
}

export default function bundleConfigMatrixTest(): void {
  describe('AbilityRuntimeBundleConfigMatrixTest', () => {
    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0001
     * @tc.name      testBundleConfigMatrix0001
     * @tc.desc      包名、厂商与版本号与 app.json5 一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBundleConfigMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0001 begin');
      const info: bundleManager.BundleInfo = getSelfBundleInfo();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.vendor=${info.vendor}`);
      expect(info.vendor).assertEqual('example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0001 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0002
     * @tc.name      testBundleConfigMatrix0002
     * @tc.desc      版本名为 1.0.0，最低兼容版本号与版本号相同，目标 API 为 26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBundleConfigMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0002 begin');
      const info: bundleManager.BundleInfo = getSelfBundleInfo();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.versionName=${info.versionName}`);
      expect(info.versionName).assertEqual('1.0.0');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.minCompatibleVersionCode=${info.minCompatibleVersionCode}`);
      expect(info.minCompatibleVersionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.targetVersion=${info.targetVersion}`);
      expect(info.targetVersion).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0002 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0003
     * @tc.name      testBundleConfigMatrix0003
     * @tc.desc      应用名与进程名都等于包名，包类型为普通应用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0003 begin');
      const app: bundleManager.ApplicationInfo = getSelfBundleInfo().appInfo;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 app.name=${app.name}`);
      expect(app.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 app.process=${app.process}`);
      expect(app.process).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 app.bundleType=${app.bundleType}`);
      expect(app.bundleType).assertEqual(bundleManager.BundleType.APP);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0003 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0004
     * @tc.name      testBundleConfigMatrix0004
     * @tc.desc      调试包、签名类型为 release、分发类型为 os_integration
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBundleConfigMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0004 begin');
      const app: bundleManager.ApplicationInfo = getSelfBundleInfo().appInfo;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 app.debug=${app.debug}`);
      expect(app.debug).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 app.appProvisionType=${app.appProvisionType}`);
      expect(app.appProvisionType).assertEqual('release');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 app.appDistributionType=${app.appDistributionType}`);
      expect(app.appDistributionType).assertEqual('os_integration');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0004 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0005
     * @tc.name      testBundleConfigMatrix0005
     * @tc.desc      应用标签引用 $string:app_name，标签资源落在 entry 模块
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0005 begin');
      const app: bundleManager.ApplicationInfo = getSelfBundleInfo().appInfo;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 app.label=${app.label}`);
      expect(app.label).assertEqual('$string:app_name');
      const actual2: boolean = app.labelId > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 app.labelResource.moduleName=${app.labelResource.moduleName}`);
      expect(app.labelResource.moduleName).assertEqual('entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 app.labelResource.bundleName=${app.labelResource.bundleName}`);
      expect(app.labelResource.bundleName).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0005 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0006
     * @tc.name      testBundleConfigMatrix0006
     * @tc.desc      应用图标引用 $media:app_icon，图标资源 id 与 iconId 一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0006 begin');
      const app: bundleManager.ApplicationInfo = getSelfBundleInfo().appInfo;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 app.icon=${app.icon}`);
      expect(app.icon).assertEqual('$media:app_icon');
      const actual2: boolean = app.iconId > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 app.iconResource.id=${app.iconResource.id}`);
      expect(app.iconResource.id).assertEqual(app.iconId);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0006 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0007
     * @tc.name      testBundleConfigMatrix0007
     * @tc.desc      app.json5 未配置应用描述，description 为空串且资源 id 为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0007 begin');
      const app: bundleManager.ApplicationInfo = getSelfBundleInfo().appInfo;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 app.description=${app.description}`);
      expect(app.description).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 app.descriptionId=${app.descriptionId}`);
      expect(app.descriptionId).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 app.descriptionResource.id=${app.descriptionResource.id}`);
      expect(app.descriptionResource.id).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0007 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0008
     * @tc.name      testBundleConfigMatrix0008
     * @tc.desc      app.json5 配置了应用分身：多开模式为 appClone，最多 5 个分身
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBundleConfigMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0008 begin');
      const app: bundleManager.ApplicationInfo = getSelfBundleInfo().appInfo;
      const actual1: string | number | boolean = app.multiAppMode.multiAppModeType;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(bundleManager.MultiAppModeType.APP_CLONE);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 app.multiAppMode.maxCount=${app.multiAppMode.maxCount}`);
      expect(app.multiAppMode.maxCount).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 app.appIndex=${app.appIndex}`);
      expect(app.appIndex).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0008 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0009
     * @tc.name      testBundleConfigMatrix0009
     * @tc.desc      应用分身模式不是多实例，最大分身数与 app.json5 的 maxCount 字面量相同
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0009 begin');
      const app: bundleManager.ApplicationInfo = getSelfBundleInfo().appInfo;
      const actual1: boolean = app.multiAppMode.multiAppModeType === bundleManager.MultiAppModeType.MULTI_INSTANCE;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertFalse();
      const actual2: boolean = app.multiAppMode.multiAppModeType === bundleManager.MultiAppModeType.UNSPECIFIED;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 app.multiAppMode.maxCount=${app.multiAppMode.maxCount}`);
      expect(app.multiAppMode.maxCount).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0009 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0010
     * @tc.name      testBundleConfigMatrix0010
     * @tc.desc      三方应用：非系统应用、可卸载、处于启用状态
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0010 begin');
      const app: bundleManager.ApplicationInfo = getSelfBundleInfo().appInfo;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 app.systemApp=${app.systemApp}`);
      expect(app.systemApp).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 app.removable=${app.removable}`);
      expect(app.removable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 app.enabled=${app.enabled}`);
      expect(app.enabled).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0010 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0011
     * @tc.name      testBundleConfigMatrix0011
     * @tc.desc      安装路径位于 el1 公共目录，无 native 库，分身索引为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0011 begin');
      const app: bundleManager.ApplicationInfo = getSelfBundleInfo().appInfo;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 app.codePath=${app.codePath}`);
      expect(app.codePath).assertEqual('/data/app/el1/bundle/public/com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 app.nativeLibraryPath=${app.nativeLibraryPath}`);
      expect(app.nativeLibraryPath).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 app.appIndex=${app.appIndex}`);
      expect(app.appIndex).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0011 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0012
     * @tc.name      testBundleConfigMatrix0012
     * @tc.desc      发布类型为 Release，安装来源为 unknown，数据允许清除
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0012 begin');
      const app: bundleManager.ApplicationInfo = getSelfBundleInfo().appInfo;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 app.releaseType=${app.releaseType}`);
      expect(app.releaseType).assertEqual('Release');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 app.installSource=${app.installSource}`);
      expect(app.installSource).assertEqual('unknown');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 app.dataUnclearable=${app.dataUnclearable}`);
      expect(app.dataUnclearable).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0012 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0013
     * @tc.name      testBundleConfigMatrix0013
     * @tc.desc      应用未声明权限与应用级 metadata，未开启云文件同步
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0013 begin');
      const app: bundleManager.ApplicationInfo = getSelfBundleInfo().appInfo;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 app.permissions.length=${app.permissions.length}`);
      expect(app.permissions.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 app.metadataArray.length=${app.metadataArray.length}`);
      expect(app.metadataArray.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 app.cloudFileSyncEnabled=${app.cloudFileSyncEnabled}`);
      expect(app.cloudFileSyncEnabled).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0013 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0014
     * @tc.name      testBundleConfigMatrix0014
     * @tc.desc      签名信息的 appId 以包名加下划线开头，指纹非空
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0014 begin');
      const info: bundleManager.BundleInfo = getSelfBundleInfo();
      const actual1: boolean = info.signatureInfo.appId.startsWith('com.samples.abilityruntime_');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.signatureInfo.appId.length > 27;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = info.signatureInfo.fingerprint.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0014 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0015
     * @tc.name      testBundleConfigMatrix0015
     * @tc.desc      未申请权限，两个 HAP（entry 与 entry_test）都在包信息里
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0015 begin');
      const info: bundleManager.BundleInfo = getSelfBundleInfo();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.reqPermissionDetails.length=${info.reqPermissionDetails.length}`);
      expect(info.reqPermissionDetails.length).assertEqual(0);
      const actual2: number = info.permissionGrantStates.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.hapModulesInfo.length=${info.hapModulesInfo.length}`);
      expect(info.hapModulesInfo.length).assertEqual(2);
      const actual4: string = hapNames(info);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('entry,entry_test');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0015 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0016
     * @tc.name      testBundleConfigMatrix0016
     * @tc.desc      应用 uid 与当前进程 uid 相同，属于 100 号用户，令牌 id 非零
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0016 begin');
      const app: bundleManager.ApplicationInfo = getSelfBundleInfo().appInfo;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 app.uid=${app.uid}`);
      expect(app.uid).assertEqual(process.uid);
      const actual2: number = Math.floor(app.uid / 200000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(100);
      const actual3: boolean = app.accessTokenId > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0016 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0017
     * @tc.name      testBundleConfigMatrix0017
     * @tc.desc      安装时间与更新时间都已记录，更新时间不早于安装时间
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0017 begin');
      const info: bundleManager.BundleInfo = getSelfBundleInfo();
      const actual1: boolean = info.installTime > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.updateTime > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = info.updateTime >= info.installTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0017 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0018
     * @tc.name      testBundleConfigMatrix0018
     * @tc.desc      entry 模块为 entry 类型，主 Ability 为 EntryAbility
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBundleConfigMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0018 begin');
      const hap: bundleManager.HapModuleInfo = requireHap('entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 hap.name=${hap.name}`);
      expect(hap.name).assertEqual('entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 hap.type=${hap.type}`);
      expect(hap.type).assertEqual(bundleManager.ModuleType.ENTRY);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 hap.mainElementName=${hap.mainElementName}`);
      expect(hap.mainElementName).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0018 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0019
     * @tc.name      testBundleConfigMatrix0019
     * @tc.desc      entry 模块支持 default 与 tablet，非免安装，无模块级 metadata
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0019 begin');
      const hap: bundleManager.HapModuleInfo = requireHap('entry');
      const actual1: string = hap.deviceTypes.join(',');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('default,tablet');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 hap.installationFree=${hap.installationFree}`);
      expect(hap.installationFree).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 hap.metadata.length=${hap.metadata.length}`);
      expect(hap.metadata.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0019 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0020
     * @tc.name      testBundleConfigMatrix0020
     * @tc.desc      entry 模块声明两个 UIAbility（BMS 按 AbilityLifecycleAbility、EntryAbility 顺序返回）和一个备份扩展
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBundleConfigMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0020 begin');
      const hap: bundleManager.HapModuleInfo = requireHap('entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 hap.abilitiesInfo.length=${hap.abilitiesInfo.length}`);
      expect(hap.abilitiesInfo.length).assertEqual(2);
      const actual2: string = abilityNames(hap);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('AbilityLifecycleAbility,EntryAbility');
      const actual3: string = extensionNames(hap);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('EntryBackupAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0020 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0021
     * @tc.name      testBundleConfigMatrix0021
     * @tc.desc      entry 模块描述引用 $string:module_desc，无依赖与预加载
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0021 begin');
      const hap: bundleManager.HapModuleInfo = requireHap('entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 hap.description=${hap.description}`);
      expect(hap.description).assertEqual('$string:module_desc');
      const actual2: boolean = hap.descriptionId > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 hap.dependencies.length=${hap.dependencies.length}`);
      expect(hap.dependencies.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 hap.preloads.length=${hap.preloads.length}`);
      expect(hap.preloads.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0021 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0022
     * @tc.name      testBundleConfigMatrix0022
     * @tc.desc      entry_test 模块为 feature 类型，主 Ability 为 TestAbility
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0022 begin');
      const hap: bundleManager.HapModuleInfo = requireHap('entry_test');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 hap.name=${hap.name}`);
      expect(hap.name).assertEqual('entry_test');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 hap.type=${hap.type}`);
      expect(hap.type).assertEqual(bundleManager.ModuleType.FEATURE);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 hap.mainElementName=${hap.mainElementName}`);
      expect(hap.mainElementName).assertEqual('TestAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0022 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0023
     * @tc.name      testBundleConfigMatrix0023
     * @tc.desc      entry_test 模块只有 TestAbility，没有扩展，设备类型与 entry 一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0023 begin');
      const hap: bundleManager.HapModuleInfo = requireHap('entry_test');
      const actual1: string = abilityNames(hap);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('TestAbility');
      const actual2: number = hap.extensionAbilitiesInfo.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(0);
      const actual3: string = hap.deviceTypes.join(',');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('default,tablet');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0023 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0024
     * @tc.name      testBundleConfigMatrix0024
     * @tc.desc      EntryAbility 归属本应用 entry 模块
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBundleConfigMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0024 begin');
      const ability: bundleManager.AbilityInfo = requireAbility('entry', 'EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ability.bundleName=${ability.bundleName}`);
      expect(ability.bundleName).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ability.moduleName=${ability.moduleName}`);
      expect(ability.moduleName).assertEqual('entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ability.name=${ability.name}`);
      expect(ability.name).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0024 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0025
     * @tc.name      testBundleConfigMatrix0025
     * @tc.desc      EntryAbility 配置 exported=true，已启用，未配置 launchType 默认单实例
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBundleConfigMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0025 begin');
      const ability: bundleManager.AbilityInfo = requireAbility('entry', 'EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ability.exported=${ability.exported}`);
      expect(ability.exported).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ability.enabled=${ability.enabled}`);
      expect(ability.enabled).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ability.launchType=${ability.launchType}`);
      expect(ability.launchType).assertEqual(bundleManager.LaunchType.SINGLETON);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0025 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0026
     * @tc.name      testBundleConfigMatrix0026
     * @tc.desc      EntryAbility 的标签、描述、图标分别引用 EntryAbility_label、EntryAbility_desc、startIcon
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0026 begin');
      const ability: bundleManager.AbilityInfo = requireAbility('entry', 'EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ability.label=${ability.label}`);
      expect(ability.label).assertEqual('$string:EntryAbility_label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ability.description=${ability.description}`);
      expect(ability.description).assertEqual('$string:EntryAbility_desc');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ability.icon=${ability.icon}`);
      expect(ability.icon).assertEqual('$media:startIcon');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0026 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0027
     * @tc.name      testBundleConfigMatrix0027
     * @tc.desc      EntryAbility 的标签、描述、图标都解析出了资源 id
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0027 begin');
      const ability: bundleManager.AbilityInfo = requireAbility('entry', 'EntryAbility');
      const actual1: boolean = ability.labelId > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = ability.descriptionId > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = ability.iconId > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0027 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0028
     * @tc.name      testBundleConfigMatrix0028
     * @tc.desc      EntryAbility 只有一组 home/home 的桌面入口 skill
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBundleConfigMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0028 begin');
      const ability: bundleManager.AbilityInfo = requireAbility('entry', 'EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ability.skills.length=${ability.skills.length}`);
      expect(ability.skills.length).assertEqual(1);
      const actual2: string = ability.skills[0].actions.join(',');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('action.system.home');
      const actual3: string = ability.skills[0].entities.join(',');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('entity.system.home');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0028 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0029
     * @tc.name      testBundleConfigMatrix0029
     * @tc.desc      EntryAbility 的 skill 不带 uri、不做域名校验，Ability 不要求权限
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0029 begin');
      const ability: bundleManager.AbilityInfo = requireAbility('entry', 'EntryAbility');
      const actual1: number = ability.skills[0].uris.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      const actual2: boolean = ability.skills[0].domainVerify;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ability.permissions.length=${ability.permissions.length}`);
      expect(ability.permissions.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0029 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0030
     * @tc.name      testBundleConfigMatrix0030
     * @tc.desc      EntryAbility 支持全屏/分屏/悬浮三种窗口模式，方向未指定，在 Dock 中显示
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0030 begin');
      const ability: bundleManager.AbilityInfo = requireAbility('entry', 'EntryAbility');
      const actual1: string = ability.supportWindowModes.join(',');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('0,1,2');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ability.orientation=${ability.orientation}`);
      expect(ability.orientation).assertEqual(bundleManager.DisplayOrientation.UNSPECIFIED);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ability.excludeFromDock=${ability.excludeFromDock}`);
      expect(ability.excludeFromDock).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0030 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0031
     * @tc.name      testBundleConfigMatrix0031
     * @tc.desc      EntryAbility 设备类型继承模块配置，无 metadata，进程名为空（与应用同进程）
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0031 begin');
      const ability: bundleManager.AbilityInfo = requireAbility('entry', 'EntryAbility');
      const actual1: string = ability.deviceTypes.join(',');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('default,tablet');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ability.metadata.length=${ability.metadata.length}`);
      expect(ability.metadata.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ability.process=${ability.process}`);
      expect(ability.process).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0031 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0032
     * @tc.name      testBundleConfigMatrix0032
     * @tc.desc      EntryAbility 未限制窗口尺寸与宽高比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0032 begin');
      const ability: bundleManager.AbilityInfo = requireAbility('entry', 'EntryAbility');
      const actual1: number = ability.windowSize.maxWindowRatio;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      const actual2: number = ability.windowSize.minWindowWidth;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(0);
      const actual3: number = ability.windowSize.maxWindowHeight;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0032 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0033
     * @tc.name      testBundleConfigMatrix0033
     * @tc.desc      EntryAbility 没有 metadata，读取它的 profile 抛 17700024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0033 begin');
      const actual1: number = requireAbility('entry', 'EntryAbility').metadata.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      let code: number = 0;
      let thrown: boolean = false;
      try {
        bundleManager.getProfileByAbilitySync('entry', 'EntryAbility');
      } catch (error) {
        thrown = true;
        code = (error as BusinessError).code;
        expect(code).assertEqual(17700024);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 thrown=${thrown}`);
      expect(thrown).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 code=${code}`);
      expect(code).assertEqual(17700024);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0033 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0034
     * @tc.name      testBundleConfigMatrix0034
     * @tc.desc      AbilityLifecycleAbility 归属本应用 entry 模块
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0034 begin');
      const ability: bundleManager.AbilityInfo = requireAbility('entry', 'AbilityLifecycleAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ability.bundleName=${ability.bundleName}`);
      expect(ability.bundleName).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ability.moduleName=${ability.moduleName}`);
      expect(ability.moduleName).assertEqual('entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ability.name=${ability.name}`);
      expect(ability.name).assertEqual('AbilityLifecycleAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0034 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0035
     * @tc.name      testBundleConfigMatrix0035
     * @tc.desc      AbilityLifecycleAbility 配置 exported=true，已启用，未配置 launchType 默认单实例
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0035 begin');
      const ability: bundleManager.AbilityInfo = requireAbility('entry', 'AbilityLifecycleAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ability.exported=${ability.exported}`);
      expect(ability.exported).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ability.enabled=${ability.enabled}`);
      expect(ability.enabled).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ability.launchType=${ability.launchType}`);
      expect(ability.launchType).assertEqual(bundleManager.LaunchType.SINGLETON);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0035 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0036
     * @tc.name      testBundleConfigMatrix0036
     * @tc.desc      AbilityLifecycleAbility 的标签、描述、图标分别引用 EntryAbility_label、EntryAbility_desc、startIcon
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0036 begin');
      const ability: bundleManager.AbilityInfo = requireAbility('entry', 'AbilityLifecycleAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ability.label=${ability.label}`);
      expect(ability.label).assertEqual('$string:EntryAbility_label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ability.description=${ability.description}`);
      expect(ability.description).assertEqual('$string:EntryAbility_desc');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ability.icon=${ability.icon}`);
      expect(ability.icon).assertEqual('$media:startIcon');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0036 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0037
     * @tc.name      testBundleConfigMatrix0037
     * @tc.desc      AbilityLifecycleAbility 的标签、描述、图标都解析出了资源 id
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0037 begin');
      const ability: bundleManager.AbilityInfo = requireAbility('entry', 'AbilityLifecycleAbility');
      const actual1: boolean = ability.labelId > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = ability.descriptionId > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = ability.iconId > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0037 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0038
     * @tc.name      testBundleConfigMatrix0038
     * @tc.desc      AbilityLifecycleAbility 只有一组 home/home 的桌面入口 skill
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0038 begin');
      const ability: bundleManager.AbilityInfo = requireAbility('entry', 'AbilityLifecycleAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ability.skills.length=${ability.skills.length}`);
      expect(ability.skills.length).assertEqual(1);
      const actual2: string = ability.skills[0].actions.join(',');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('action.system.home');
      const actual3: string = ability.skills[0].entities.join(',');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('entity.system.home');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0038 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0039
     * @tc.name      testBundleConfigMatrix0039
     * @tc.desc      AbilityLifecycleAbility 的 skill 不带 uri、不做域名校验，Ability 不要求权限
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0039 begin');
      const ability: bundleManager.AbilityInfo = requireAbility('entry', 'AbilityLifecycleAbility');
      const actual1: number = ability.skills[0].uris.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      const actual2: boolean = ability.skills[0].domainVerify;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ability.permissions.length=${ability.permissions.length}`);
      expect(ability.permissions.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0039 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0040
     * @tc.name      testBundleConfigMatrix0040
     * @tc.desc      AbilityLifecycleAbility 支持全屏/分屏/悬浮三种窗口模式，方向未指定，在 Dock 中显示
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0040 begin');
      const ability: bundleManager.AbilityInfo = requireAbility('entry', 'AbilityLifecycleAbility');
      const actual1: string = ability.supportWindowModes.join(',');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('0,1,2');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ability.orientation=${ability.orientation}`);
      expect(ability.orientation).assertEqual(bundleManager.DisplayOrientation.UNSPECIFIED);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ability.excludeFromDock=${ability.excludeFromDock}`);
      expect(ability.excludeFromDock).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0040 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0041
     * @tc.name      testBundleConfigMatrix0041
     * @tc.desc      AbilityLifecycleAbility 设备类型继承模块配置，无 metadata，进程名为空（与应用同进程）
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0041 begin');
      const ability: bundleManager.AbilityInfo = requireAbility('entry', 'AbilityLifecycleAbility');
      const actual1: string = ability.deviceTypes.join(',');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('default,tablet');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ability.metadata.length=${ability.metadata.length}`);
      expect(ability.metadata.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ability.process=${ability.process}`);
      expect(ability.process).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0041 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0042
     * @tc.name      testBundleConfigMatrix0042
     * @tc.desc      AbilityLifecycleAbility 未限制窗口尺寸与宽高比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0042 begin');
      const ability: bundleManager.AbilityInfo = requireAbility('entry', 'AbilityLifecycleAbility');
      const actual1: number = ability.windowSize.maxWindowRatio;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      const actual2: number = ability.windowSize.minWindowWidth;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(0);
      const actual3: number = ability.windowSize.maxWindowHeight;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0042 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0043
     * @tc.name      testBundleConfigMatrix0043
     * @tc.desc      AbilityLifecycleAbility 没有 metadata，读取它的 profile 抛 17700024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0043 begin');
      const actual1: number = requireAbility('entry', 'AbilityLifecycleAbility').metadata.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      let code: number = 0;
      let thrown: boolean = false;
      try {
        bundleManager.getProfileByAbilitySync('entry', 'AbilityLifecycleAbility');
      } catch (error) {
        thrown = true;
        code = (error as BusinessError).code;
        expect(code).assertEqual(17700024);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 thrown=${thrown}`);
      expect(thrown).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 code=${code}`);
      expect(code).assertEqual(17700024);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0043 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0044
     * @tc.name      testBundleConfigMatrix0044
     * @tc.desc      两个 UIAbility 共用同一组标签、描述、图标资源 id
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0044 begin');
      const entry: bundleManager.AbilityInfo = requireAbility('entry', 'EntryAbility');
      const life: bundleManager.AbilityInfo = requireAbility('entry', 'AbilityLifecycleAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 life.labelId=${life.labelId}`);
      expect(life.labelId).assertEqual(entry.labelId);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 life.descriptionId=${life.descriptionId}`);
      expect(life.descriptionId).assertEqual(entry.descriptionId);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 life.iconId=${life.iconId}`);
      expect(life.iconId).assertEqual(entry.iconId);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0044 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0045
     * @tc.name      testBundleConfigMatrix0045
     * @tc.desc      两个 UIAbility 都有桌面入口 skill，但只有 EntryAbility 是模块主 Ability
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0045 begin');
      const life: bundleManager.AbilityInfo = requireAbility('entry', 'AbilityLifecycleAbility');
      const actual1: boolean = life.skills[0].actions.includes('action.system.home');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = life.skills[0].entities.includes('entity.system.home');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = requireHap('entry').mainElementName;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0045 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0046
     * @tc.name      testBundleConfigMatrix0046
     * @tc.desc      EntryBackupAbility 归属本应用 entry 模块
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBundleConfigMatrix0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0046 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireBackupExtension();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ext.bundleName=${ext.bundleName}`);
      expect(ext.bundleName).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ext.moduleName=${ext.moduleName}`);
      expect(ext.moduleName).assertEqual('entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ext.name=${ext.name}`);
      expect(ext.name).assertEqual('EntryBackupAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0046 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0047
     * @tc.name      testBundleConfigMatrix0047
     * @tc.desc      EntryBackupAbility 为 backup 类型扩展，不对外可见
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBundleConfigMatrix0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0047 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireBackupExtension();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ext.extensionAbilityType=${ext.extensionAbilityType}`);
      expect(ext.extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.BACKUP);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ext.extensionAbilityTypeName=${ext.extensionAbilityTypeName}`);
      expect(ext.extensionAbilityTypeName).assertEqual('backup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ext.exported=${ext.exported}`);
      expect(ext.exported).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0047 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0048
     * @tc.name      testBundleConfigMatrix0048
     * @tc.desc      EntryBackupAbility 只有一条 ohos.extension.backup metadata，指向 backup_config
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0048 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireBackupExtension();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ext.metadata.length=${ext.metadata.length}`);
      expect(ext.metadata.length).assertEqual(1);
      const actual2: string = ext.metadata[0].name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('ohos.extension.backup');
      const actual3: string = ext.metadata[0].resource;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('$profile:backup_config');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0048 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0049
     * @tc.name      testBundleConfigMatrix0049
     * @tc.desc      EntryBackupAbility 没有 skill、不要求权限、处于启用状态
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0049 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireBackupExtension();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ext.skills.length=${ext.skills.length}`);
      expect(ext.skills.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ext.permissions.length=${ext.permissions.length}`);
      expect(ext.permissions.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ext.enabled=${ext.enabled}`);
      expect(ext.enabled).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0049 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0050
     * @tc.name      testBundleConfigMatrix0050
     * @tc.desc      按 metadata 名读取备份配置 profile，内容为 allowToBackupRestore=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0050 begin');
      const profiles: string[] = bundleManager.getProfileByExtensionAbilitySync(
        'entry', 'EntryBackupAbility', 'ohos.extension.backup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 profiles.length=${profiles.length}`);
      expect(profiles.length).assertEqual(1);
      const actual2: boolean = profiles[0].includes('allowToBackupRestore');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = (JSON.parse(profiles[0]) as Record<string, boolean>)['allowToBackupRestore'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0050 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0051
     * @tc.name      testBundleConfigMatrix0051
     * @tc.desc      不指定 metadata 名时读取到同一份备份配置
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0051 begin');
      const all: string[] = bundleManager.getProfileByExtensionAbilitySync('entry', 'EntryBackupAbility');
      const named: string[] = bundleManager.getProfileByExtensionAbilitySync(
        'entry', 'EntryBackupAbility', 'ohos.extension.backup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 all.length=${all.length}`);
      expect(all.length).assertEqual(1);
      const actual2: string | number | boolean = all[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(named[0]);
      const actual3: boolean = (JSON.parse(all[0]) as Record<string, boolean>)['allowToBackupRestore'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0051 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0052
     * @tc.name      testBundleConfigMatrix0052
     * @tc.desc      TestAbility 归属 entry_test 模块，对外可见，标签引用测试模块资源
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0052 begin');
      const ability: bundleManager.AbilityInfo = requireAbility('entry_test', 'TestAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ability.moduleName=${ability.moduleName}`);
      expect(ability.moduleName).assertEqual('entry_test');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ability.exported=${ability.exported}`);
      expect(ability.exported).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ability.label=${ability.label}`);
      expect(ability.label).assertEqual('$string:TestAbility_label');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0052 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0053
     * @tc.name      testBundleConfigMatrix0053
     * @tc.desc      TestAbility 同样只有 home/home 入口 skill，单实例启动
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0053 begin');
      const ability: bundleManager.AbilityInfo = requireAbility('entry_test', 'TestAbility');
      const actual1: string = ability.skills[0].actions.join(',');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('action.system.home');
      const actual2: string = ability.skills[0].entities.join(',');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('entity.system.home');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ability.launchType=${ability.launchType}`);
      expect(ability.launchType).assertEqual(bundleManager.LaunchType.SINGLETON);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0053 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0054
     * @tc.name      testBundleConfigMatrix0054
     * @tc.desc      异步 getBundleInfoForSelf 与同步接口返回同一份包信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0054 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;
      const asyncInfo: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 asyncInfo.name=${asyncInfo.name}`);
      expect(asyncInfo.name).assertEqual(getSelfBundleInfo().name);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 asyncInfo.versionCode=${asyncInfo.versionCode}`);
      expect(asyncInfo.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncInfo.hapModulesInfo.length=${asyncInfo.hapModulesInfo.length}`);
      expect(asyncInfo.hapModulesInfo.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0054 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0055
     * @tc.name      testBundleConfigMatrix0055
     * @tc.desc      不带 HAP 标志查询时包信息里没有模块列表，但应用信息仍在
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0055 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const lite: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 lite.hapModulesInfo.length=${lite.hapModulesInfo.length}`);
      expect(lite.hapModulesInfo.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 lite.appInfo.name=${lite.appInfo.name}`);
      expect(lite.appInfo.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 lite.versionName=${lite.versionName}`);
      expect(lite.versionName).assertEqual('1.0.0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0055 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0056
     * @tc.name      testBundleConfigMatrix0056
     * @tc.desc      不带 ABILITY 标志查询时模块里没有 Ability 列表
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0056 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;
      const lite: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 lite.hapModulesInfo.length=${lite.hapModulesInfo.length}`);
      expect(lite.hapModulesInfo.length).assertEqual(2);
      const entry: bundleManager.HapModuleInfo[] = lite.hapModulesInfo.filter(
        (m: bundleManager.HapModuleInfo) => m.name === 'entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 entry.length=${entry.length}`);
      expect(entry.length).assertEqual(1);
      const actual3: number = entry[0].abilitiesInfo.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0056 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0057
     * @tc.name      testBundleConfigMatrix0057
     * @tc.desc      带 ABILITY 但不带 SKILL 标志查询时 Ability 的 skill 列表为空
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0057 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const lite: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const entry: bundleManager.HapModuleInfo[] = lite.hapModulesInfo.filter(
        (m: bundleManager.HapModuleInfo) => m.name === 'entry');
      const actual1: number = entry[0].abilitiesInfo.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(2);
      const actual2: string = entry[0].abilitiesInfo[0].name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('AbilityLifecycleAbility');
      const actual3: number = entry[0].abilitiesInfo[0].skills.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0057 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0058
     * @tc.name      testBundleConfigMatrix0058
     * @tc.desc      canOpenLink("http://docs.openharmony.cn") 因 scheme 未在 querySchemes 中声明而抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0058 begin');
      const link: string = 'http://docs.openharmony.cn';
      let code: number = 0;
      let thrown: boolean = false;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        thrown = true;
        code = (error as BusinessError).code;
        expect(code).assertEqual(17700056);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 thrown=${thrown}`);
      expect(thrown).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual3: boolean = link.includes('://');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0058 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0059
     * @tc.name      testBundleConfigMatrix0059
     * @tc.desc      canOpenLink("https://docs.openharmony.cn") 因 scheme 未在 querySchemes 中声明而抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0059 begin');
      const link: string = 'https://docs.openharmony.cn';
      let code: number = 0;
      let thrown: boolean = false;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        thrown = true;
        code = (error as BusinessError).code;
        expect(code).assertEqual(17700056);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 thrown=${thrown}`);
      expect(thrown).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual3: boolean = link.includes('://');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0059 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0060
     * @tc.name      testBundleConfigMatrix0060
     * @tc.desc      canOpenLink("abilityruntime://open") 因 scheme 未在 querySchemes 中声明而抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0060 begin');
      const link: string = 'abilityruntime://open';
      let code: number = 0;
      let thrown: boolean = false;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        thrown = true;
        code = (error as BusinessError).code;
        expect(code).assertEqual(17700056);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 thrown=${thrown}`);
      expect(thrown).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual3: boolean = link.includes('://');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0060 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_CONFIG_0061
     * @tc.name      testBundleConfigMatrix0061
     * @tc.desc      canOpenLink("ftp://docs.openharmony.cn") 因 scheme 未在 querySchemes 中声明而抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0061 begin');
      const link: string = 'ftp://docs.openharmony.cn';
      let code: number = 0;
      let thrown: boolean = false;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        thrown = true;
        code = (error as BusinessError).code;
        expect(code).assertEqual(17700056);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 thrown=${thrown}`);
      expect(thrown).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual3: boolean = link.includes('://');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0061 end');
    })
  })
}

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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { bundleManager } from '@kit.AbilityKit';
import { process } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';
import { resourceManager } from '@kit.LocalizationKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  findAbility, findExtension, findHapModule, getSelfBundleInfo, loadOverrideResourceManager
} from './TestHelper';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppStartup]';

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

function requireExtension(name: string): bundleManager.ExtensionAbilityInfo {
  const ext: bundleManager.ExtensionAbilityInfo | undefined = findExtension(name);
  if (ext === undefined) {
    throw new Error('missing extension ' + name);
  }
  return ext;
}

function hapNames(info: bundleManager.BundleInfo): string {
  return info.hapModulesInfo.map((m: bundleManager.HapModuleInfo) => m.name).sort().join(',');
}

function extensionNames(hap: bundleManager.HapModuleInfo): string {
  return hap.extensionAbilitiesInfo.map((e: bundleManager.ExtensionAbilityInfo) => e.name).join(',');
}

function lightManager(): Promise<resourceManager.ResourceManager> {
  return loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
}

export default function bundleConfigMatrixTest(): void {
  describe('AppStartupBundleConfigMatrixTest', () => {
    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0001
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
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.vendor=${info.vendor}`);
      expect(info.vendor).assertEqual('example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0001 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0002
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
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0003
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
      expect(app.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 app.process=${app.process}`);
      expect(app.process).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 app.bundleType=${app.bundleType}`);
      expect(app.bundleType).assertEqual(bundleManager.BundleType.APP);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0003 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0004
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
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0005
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
      expect(app.labelResource.bundleName).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0005 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0006
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
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0007
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
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0008
     * @tc.name      testBundleConfigMatrix0008
     * @tc.desc      app.json5 未配置应用分身：最大分身数为 0，分身索引为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0008 begin');
      const app: bundleManager.ApplicationInfo = getSelfBundleInfo().appInfo;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 app.multiAppMode.maxCount=${app.multiAppMode.maxCount}`);
      expect(app.multiAppMode.maxCount).assertEqual(0);
      const actual2: boolean = app.multiAppMode.multiAppModeType === bundleManager.MultiAppModeType.APP_CLONE;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 app.appIndex=${app.appIndex}`);
      expect(app.appIndex).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0008 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0009
     * @tc.name      testBundleConfigMatrix0009
     * @tc.desc      三方应用：非系统应用、可卸载、处于启用状态
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0009 begin');
      const app: bundleManager.ApplicationInfo = getSelfBundleInfo().appInfo;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 app.systemApp=${app.systemApp}`);
      expect(app.systemApp).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 app.removable=${app.removable}`);
      expect(app.removable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 app.enabled=${app.enabled}`);
      expect(app.enabled).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0009 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0010
     * @tc.name      testBundleConfigMatrix0010
     * @tc.desc      安装路径位于 el1 公共目录，native 库目录为沙箱内 el1/bundle/libs/arm，分身索引为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0010 begin');
      const app: bundleManager.ApplicationInfo = getSelfBundleInfo().appInfo;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 app.codePath=${app.codePath}`);
      expect(app.codePath).assertEqual('/data/app/el1/bundle/public/com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 app.nativeLibraryPath=${app.nativeLibraryPath}`);
      expect(app.nativeLibraryPath).assertEqual('/data/storage/el1/bundle/libs/arm');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 app.appIndex=${app.appIndex}`);
      expect(app.appIndex).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0010 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0011
     * @tc.name      testBundleConfigMatrix0011
     * @tc.desc      发布类型为 Release，安装来源为 unknown，数据允许清除
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0011 begin');
      const app: bundleManager.ApplicationInfo = getSelfBundleInfo().appInfo;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 app.releaseType=${app.releaseType}`);
      expect(app.releaseType).assertEqual('Release');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 app.installSource=${app.installSource}`);
      expect(app.installSource).assertEqual('unknown');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 app.dataUnclearable=${app.dataUnclearable}`);
      expect(app.dataUnclearable).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0011 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0012
     * @tc.name      testBundleConfigMatrix0012
     * @tc.desc      应用未声明权限与应用级 metadata，未开启云文件同步
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0012 begin');
      const app: bundleManager.ApplicationInfo = getSelfBundleInfo().appInfo;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 app.permissions.length=${app.permissions.length}`);
      expect(app.permissions.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 app.metadataArray.length=${app.metadataArray.length}`);
      expect(app.metadataArray.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 app.cloudFileSyncEnabled=${app.cloudFileSyncEnabled}`);
      expect(app.cloudFileSyncEnabled).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0012 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0013
     * @tc.name      testBundleConfigMatrix0013
     * @tc.desc      签名信息的 appId 以包名加下划线开头，指纹非空
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0013 begin');
      const info: bundleManager.BundleInfo = getSelfBundleInfo();
      const actual1: boolean = info.signatureInfo.appId.startsWith('com.samples.appstartup_');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.signatureInfo.appId.length > 23;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = info.signatureInfo.fingerprint.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0013 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0014
     * @tc.name      testBundleConfigMatrix0014
     * @tc.desc      未申请权限，两个 HAP（entry 与 entry_test）都在包信息里
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0014 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0014 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0015
     * @tc.name      testBundleConfigMatrix0015
     * @tc.desc      应用 uid 与当前进程 uid 相同，属于 100 号用户，令牌 id 非零
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0015 begin');
      const app: bundleManager.ApplicationInfo = getSelfBundleInfo().appInfo;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 app.uid=${app.uid}`);
      expect(app.uid).assertEqual(process.uid);
      const actual2: number = Math.floor(app.uid / 200000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(100);
      const actual3: boolean = app.accessTokenId > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0015 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0016
     * @tc.name      testBundleConfigMatrix0016
     * @tc.desc      安装时间与更新时间都已记录，更新时间不早于安装时间
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0016 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0016 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0017
     * @tc.name      testBundleConfigMatrix0017
     * @tc.desc      entry 模块为 entry 类型，主 Ability 为 EntryAbility
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBundleConfigMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0017 begin');
      const hap: bundleManager.HapModuleInfo = requireHap('entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 hap.name=${hap.name}`);
      expect(hap.name).assertEqual('entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 hap.type=${hap.type}`);
      expect(hap.type).assertEqual(bundleManager.ModuleType.ENTRY);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 hap.mainElementName=${hap.mainElementName}`);
      expect(hap.mainElementName).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0017 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0018
     * @tc.name      testBundleConfigMatrix0018
     * @tc.desc      entry 模块支持 default 与 tablet，非免安装，无模块级 metadata
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0018 begin');
      const hap: bundleManager.HapModuleInfo = requireHap('entry');
      const actual1: string = hap.deviceTypes.join(',');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('default,tablet');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 hap.installationFree=${hap.installationFree}`);
      expect(hap.installationFree).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 hap.metadata.length=${hap.metadata.length}`);
      expect(hap.metadata.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0018 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0019
     * @tc.name      testBundleConfigMatrix0019
     * @tc.desc      entry 模块只有一个 UIAbility，另有 6 个启动任务和 1 个启动配置共 7 个 embeddedUI 扩展
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBundleConfigMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0019 begin');
      const hap: bundleManager.HapModuleInfo = requireHap('entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 hap.abilitiesInfo.length=${hap.abilitiesInfo.length}`);
      expect(hap.abilitiesInfo.length).assertEqual(1);
      const actual2: string = hap.abilitiesInfo[0].name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('EntryAbility');
      const actual3: number = hap.extensionAbilitiesInfo.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0019 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0020
     * @tc.name      testBundleConfigMatrix0020
     * @tc.desc      entry 模块的扩展按名字字典序返回，大写字母排在小写之前（KVStoreTask 在 KvManagerUtilTask 之前）
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBundleConfigMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0020 begin');
      const hap: bundleManager.HapModuleInfo = requireHap('entry');
      expect(extensionNames(hap)).assertEqual('FileTask,ImageKnifeTask,KVStoreTask,KvManagerUtilTask,' +
        'RdbStoreTask,ResourceManagerTask,StartupConfig');
      const actual1: string = hap.extensionAbilitiesInfo[2].name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('KVStoreTask');
      const actual2: string = hap.extensionAbilitiesInfo[3].name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0020 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0021
     * @tc.name      testBundleConfigMatrix0021
     * @tc.desc      7 个扩展的类型全部是 EMBEDDED_UI，类型名全部是 embeddedUI
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0021 begin');
      const hap: bundleManager.HapModuleInfo = requireHap('entry');
      const types: number[] = hap.extensionAbilitiesInfo.map((e: bundleManager.ExtensionAbilityInfo) =>
        e.extensionAbilityType);
      const typeNames: string[] = hap.extensionAbilitiesInfo.map((e: bundleManager.ExtensionAbilityInfo) =>
        e.extensionAbilityTypeName);
      const actual1: number = types.filter((t: number) => t === bundleManager.ExtensionAbilityType.EMBEDDED_UI).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(7);
      const actual2: number = typeNames.filter((n: string) => n === 'embeddedUI').length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(7);
      const actual3: number = bundleManager.ExtensionAbilityType.EMBEDDED_UI;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0021 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0022
     * @tc.name      testBundleConfigMatrix0022
     * @tc.desc      7 个扩展都对外可见且已启用，没有一个配置 skill 或权限
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0022 begin');
      const hap: bundleManager.HapModuleInfo = requireHap('entry');
      const list: bundleManager.ExtensionAbilityInfo[] = hap.extensionAbilitiesInfo;
      const actual1: number = list.filter((e: bundleManager.ExtensionAbilityInfo) => e.exported && e.enabled).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(7);
      const actual2: number = list.filter((e: bundleManager.ExtensionAbilityInfo) => e.skills.length > 0).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(0);
      const actual3: number = list.filter((e: bundleManager.ExtensionAbilityInfo) => e.permissions.length > 0).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0022 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0023
     * @tc.name      testBundleConfigMatrix0023
     * @tc.desc      只有 StartupConfig 配了 label，其余 6 个启动任务扩展的 labelId 都是 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0023 begin');
      const hap: bundleManager.HapModuleInfo = requireHap('entry');
      const labelled: string[] = hap.extensionAbilitiesInfo.filter((e: bundleManager.ExtensionAbilityInfo) =>
        e.labelId > 0).map((e: bundleManager.ExtensionAbilityInfo) => e.name);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 labelled.length=${labelled.length}`);
      expect(labelled.length).assertEqual(1);
      const actual2: string = labelled[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('StartupConfig');
      const actual3: number = requireExtension('FileTask').labelId;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0023 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0024
     * @tc.name      testBundleConfigMatrix0024
     * @tc.desc      entry 模块描述引用 $string:module_desc，无依赖与预加载
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0024 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0024 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0025
     * @tc.name      testBundleConfigMatrix0025
     * @tc.desc      entry_test 模块为 feature 类型，主 Ability 为 TestAbility
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0025 begin');
      const hap: bundleManager.HapModuleInfo = requireHap('entry_test');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 hap.name=${hap.name}`);
      expect(hap.name).assertEqual('entry_test');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 hap.type=${hap.type}`);
      expect(hap.type).assertEqual(bundleManager.ModuleType.FEATURE);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 hap.mainElementName=${hap.mainElementName}`);
      expect(hap.mainElementName).assertEqual('TestAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0025 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0026
     * @tc.name      testBundleConfigMatrix0026
     * @tc.desc      entry_test 模块只有 TestAbility，没有扩展，设备类型与 entry 一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0026 begin');
      const hap: bundleManager.HapModuleInfo = requireHap('entry_test');
      const actual1: string = hap.abilitiesInfo.map((a: bundleManager.AbilityInfo) => a.name).join(',');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('TestAbility');
      const actual2: number = hap.extensionAbilitiesInfo.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(0);
      const actual3: string = hap.deviceTypes.join(',');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('default,tablet');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0026 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0027
     * @tc.name      testBundleConfigMatrix0027
     * @tc.desc      EntryAbility 归属本应用 entry 模块
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBundleConfigMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0027 begin');
      const ability: bundleManager.AbilityInfo = requireAbility('entry', 'EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ability.bundleName=${ability.bundleName}`);
      expect(ability.bundleName).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ability.moduleName=${ability.moduleName}`);
      expect(ability.moduleName).assertEqual('entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ability.name=${ability.name}`);
      expect(ability.name).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0027 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0028
     * @tc.name      testBundleConfigMatrix0028
     * @tc.desc      EntryAbility 配置 exported=true，已启用，未配置 launchType 默认单实例
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBundleConfigMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0028 begin');
      const ability: bundleManager.AbilityInfo = requireAbility('entry', 'EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ability.exported=${ability.exported}`);
      expect(ability.exported).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ability.enabled=${ability.enabled}`);
      expect(ability.enabled).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ability.launchType=${ability.launchType}`);
      expect(ability.launchType).assertEqual(bundleManager.LaunchType.SINGLETON);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0028 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0029
     * @tc.name      testBundleConfigMatrix0029
     * @tc.desc      EntryAbility 的标签、描述、图标分别引用 EntryAbility_label、EntryAbility_desc、icon
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0029 begin');
      const ability: bundleManager.AbilityInfo = requireAbility('entry', 'EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ability.label=${ability.label}`);
      expect(ability.label).assertEqual('$string:EntryAbility_label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ability.description=${ability.description}`);
      expect(ability.description).assertEqual('$string:EntryAbility_desc');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ability.icon=${ability.icon}`);
      expect(ability.icon).assertEqual('$media:icon');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0029 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0030
     * @tc.name      testBundleConfigMatrix0030
     * @tc.desc      EntryAbility 的标签、描述、图标都解析出了资源 id
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0030 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0030 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0031
     * @tc.name      testBundleConfigMatrix0031
     * @tc.desc      EntryAbility 只有一组 home/home 的桌面入口 skill
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBundleConfigMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0031 begin');
      const ability: bundleManager.AbilityInfo = requireAbility('entry', 'EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ability.skills.length=${ability.skills.length}`);
      expect(ability.skills.length).assertEqual(1);
      const actual2: string = ability.skills[0].actions.join(',');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('action.system.home');
      const actual3: string = ability.skills[0].entities.join(',');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('entity.system.home');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0031 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0032
     * @tc.name      testBundleConfigMatrix0032
     * @tc.desc      EntryAbility 的 skill 不带 uri、不做域名校验，Ability 不要求权限
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0032 begin');
      const ability: bundleManager.AbilityInfo = requireAbility('entry', 'EntryAbility');
      const actual1: number = ability.skills[0].uris.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      const actual2: boolean = ability.skills[0].domainVerify;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ability.permissions.length=${ability.permissions.length}`);
      expect(ability.permissions.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0032 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0033
     * @tc.name      testBundleConfigMatrix0033
     * @tc.desc      EntryAbility 支持全屏/分屏/悬浮三种窗口模式，方向未指定，在 Dock 中显示
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0033 begin');
      const ability: bundleManager.AbilityInfo = requireAbility('entry', 'EntryAbility');
      const actual1: string = ability.supportWindowModes.join(',');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('0,1,2');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ability.orientation=${ability.orientation}`);
      expect(ability.orientation).assertEqual(bundleManager.DisplayOrientation.UNSPECIFIED);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ability.excludeFromDock=${ability.excludeFromDock}`);
      expect(ability.excludeFromDock).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0033 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0034
     * @tc.name      testBundleConfigMatrix0034
     * @tc.desc      EntryAbility 设备类型继承模块配置，无 metadata，进程名为空（与应用同进程）
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0034 begin');
      const ability: bundleManager.AbilityInfo = requireAbility('entry', 'EntryAbility');
      const actual1: string = ability.deviceTypes.join(',');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('default,tablet');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ability.metadata.length=${ability.metadata.length}`);
      expect(ability.metadata.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ability.process=${ability.process}`);
      expect(ability.process).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0034 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0035
     * @tc.name      testBundleConfigMatrix0035
     * @tc.desc      EntryAbility 没有 metadata，读取它的 profile 抛 17700024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0035 begin');
      const actual1: number = requireAbility('entry', 'EntryAbility').metadata.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      let code: number = 0;
      try {
        bundleManager.getProfileByAbilitySync('entry', 'EntryAbility');
      } catch (error) {
        code = (error as BusinessError).code;
        expect(code).assertEqual(17700024);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 code=${code}`);
      expect(code).assertEqual(17700024);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0035 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0036
     * @tc.name      testBundleConfigMatrix0036
     * @tc.desc      TestAbility 归属 entry_test 模块，对外可见，标签引用测试模块资源
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0036 begin');
      const ability: bundleManager.AbilityInfo = requireAbility('entry_test', 'TestAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ability.moduleName=${ability.moduleName}`);
      expect(ability.moduleName).assertEqual('entry_test');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ability.exported=${ability.exported}`);
      expect(ability.exported).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ability.label=${ability.label}`);
      expect(ability.label).assertEqual('$string:TestAbility_label');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0036 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0037
     * @tc.name      testBundleConfigMatrix0037
     * @tc.desc      TestAbility 同样只有 home/home 入口 skill，单实例启动
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0037 begin');
      const ability: bundleManager.AbilityInfo = requireAbility('entry_test', 'TestAbility');
      const actual1: string = ability.skills[0].actions.join(',');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('action.system.home');
      const actual2: string = ability.skills[0].entities.join(',');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('entity.system.home');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ability.launchType=${ability.launchType}`);
      expect(ability.launchType).assertEqual(bundleManager.LaunchType.SINGLETON);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0037 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0038
     * @tc.name      testBundleConfigMatrix0038
     * @tc.desc      启动任务 FileTask 作为扩展登记在 entry 模块，排在扩展列表第 1 位
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0038 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireExtension('FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ext.bundleName=${ext.bundleName}`);
      expect(ext.bundleName).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ext.moduleName=${ext.moduleName}`);
      expect(ext.moduleName).assertEqual('entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ext.name=${ext.name}`);
      expect(ext.name).assertEqual('FileTask');
      const actual4: string = requireHap('entry').extensionAbilitiesInfo[0].name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0038 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0039
     * @tc.name      testBundleConfigMatrix0039
     * @tc.desc      FileTask 的类型为 EMBEDDED_UI（21），类型名为 embeddedUI，对外可见
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0039 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireExtension('FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ext.extensionAbilityType=${ext.extensionAbilityType}`);
      expect(ext.extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.EMBEDDED_UI);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ext.extensionAbilityTypeName=${ext.extensionAbilityTypeName}`);
      expect(ext.extensionAbilityTypeName).assertEqual('embeddedUI');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ext.exported=${ext.exported}`);
      expect(ext.exported).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0039 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0040
     * @tc.name      testBundleConfigMatrix0040
     * @tc.desc      FileTask 已启用，没有 skill，也不要求权限
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0040 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireExtension('FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ext.enabled=${ext.enabled}`);
      expect(ext.enabled).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ext.skills.length=${ext.skills.length}`);
      expect(ext.skills.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ext.permissions.length=${ext.permissions.length}`);
      expect(ext.permissions.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0040 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0041
     * @tc.name      testBundleConfigMatrix0041
     * @tc.desc      FileTask 没有 metadata，读写权限均为空串
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0041 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireExtension('FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ext.metadata.length=${ext.metadata.length}`);
      expect(ext.metadata.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ext.readPermission=${ext.readPermission}`);
      expect(ext.readPermission).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ext.writePermission=${ext.writePermission}`);
      expect(ext.writePermission).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0041 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0042
     * @tc.name      testBundleConfigMatrix0042
     * @tc.desc      FileTask 没有 metadata，按扩展读取 profile 抛 17700024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0042 begin');
      const actual1: number = requireExtension('FileTask').metadata.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      let code: number = 0;
      try {
        bundleManager.getProfileByExtensionAbilitySync('entry', 'FileTask');
      } catch (error) {
        code = (error as BusinessError).code;
        expect(code).assertEqual(17700024);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 code=${code}`);
      expect(code).assertEqual(17700024);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0042 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0043
     * @tc.name      testBundleConfigMatrix0043
     * @tc.desc      FileTask 未配置 label 与图标，labelId、iconId 都是 0，描述是字面量不解析资源
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0043 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireExtension('FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ext.labelId=${ext.labelId}`);
      expect(ext.labelId).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ext.iconId=${ext.iconId}`);
      expect(ext.iconId).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ext.descriptionId=${ext.descriptionId}`);
      expect(ext.descriptionId).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0043 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0044
     * @tc.name      testBundleConfigMatrix0044
     * @tc.desc      启动任务 ImageKnifeTask 作为扩展登记在 entry 模块，排在扩展列表第 2 位
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBundleConfigMatrix0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0044 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireExtension('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ext.bundleName=${ext.bundleName}`);
      expect(ext.bundleName).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ext.moduleName=${ext.moduleName}`);
      expect(ext.moduleName).assertEqual('entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ext.name=${ext.name}`);
      expect(ext.name).assertEqual('ImageKnifeTask');
      const actual4: string = requireHap('entry').extensionAbilitiesInfo[1].name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0044 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0045
     * @tc.name      testBundleConfigMatrix0045
     * @tc.desc      ImageKnifeTask 的类型为 EMBEDDED_UI（21），类型名为 embeddedUI，对外可见
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBundleConfigMatrix0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0045 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireExtension('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ext.extensionAbilityType=${ext.extensionAbilityType}`);
      expect(ext.extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.EMBEDDED_UI);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ext.extensionAbilityTypeName=${ext.extensionAbilityTypeName}`);
      expect(ext.extensionAbilityTypeName).assertEqual('embeddedUI');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ext.exported=${ext.exported}`);
      expect(ext.exported).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0045 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0046
     * @tc.name      testBundleConfigMatrix0046
     * @tc.desc      ImageKnifeTask 已启用，没有 skill，也不要求权限
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0046 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireExtension('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ext.enabled=${ext.enabled}`);
      expect(ext.enabled).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ext.skills.length=${ext.skills.length}`);
      expect(ext.skills.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ext.permissions.length=${ext.permissions.length}`);
      expect(ext.permissions.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0046 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0047
     * @tc.name      testBundleConfigMatrix0047
     * @tc.desc      ImageKnifeTask 没有 metadata，读写权限均为空串
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0047 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireExtension('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ext.metadata.length=${ext.metadata.length}`);
      expect(ext.metadata.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ext.readPermission=${ext.readPermission}`);
      expect(ext.readPermission).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ext.writePermission=${ext.writePermission}`);
      expect(ext.writePermission).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0047 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0048
     * @tc.name      testBundleConfigMatrix0048
     * @tc.desc      ImageKnifeTask 没有 metadata，按扩展读取 profile 抛 17700024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0048 begin');
      const actual1: number = requireExtension('ImageKnifeTask').metadata.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      let code: number = 0;
      try {
        bundleManager.getProfileByExtensionAbilitySync('entry', 'ImageKnifeTask');
      } catch (error) {
        code = (error as BusinessError).code;
        expect(code).assertEqual(17700024);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 code=${code}`);
      expect(code).assertEqual(17700024);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0048 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0049
     * @tc.name      testBundleConfigMatrix0049
     * @tc.desc      ImageKnifeTask 未配置 label 与图标，labelId、iconId 都是 0，描述是字面量不解析资源
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0049 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireExtension('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ext.labelId=${ext.labelId}`);
      expect(ext.labelId).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ext.iconId=${ext.iconId}`);
      expect(ext.iconId).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ext.descriptionId=${ext.descriptionId}`);
      expect(ext.descriptionId).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0049 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0050
     * @tc.name      testBundleConfigMatrix0050
     * @tc.desc      启动任务 KVStoreTask 作为扩展登记在 entry 模块，排在扩展列表第 3 位
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0050 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireExtension('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ext.bundleName=${ext.bundleName}`);
      expect(ext.bundleName).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ext.moduleName=${ext.moduleName}`);
      expect(ext.moduleName).assertEqual('entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ext.name=${ext.name}`);
      expect(ext.name).assertEqual('KVStoreTask');
      const actual4: string = requireHap('entry').extensionAbilitiesInfo[2].name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0050 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0051
     * @tc.name      testBundleConfigMatrix0051
     * @tc.desc      KVStoreTask 的类型为 EMBEDDED_UI（21），类型名为 embeddedUI，对外可见
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0051 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireExtension('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ext.extensionAbilityType=${ext.extensionAbilityType}`);
      expect(ext.extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.EMBEDDED_UI);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ext.extensionAbilityTypeName=${ext.extensionAbilityTypeName}`);
      expect(ext.extensionAbilityTypeName).assertEqual('embeddedUI');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ext.exported=${ext.exported}`);
      expect(ext.exported).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0051 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0052
     * @tc.name      testBundleConfigMatrix0052
     * @tc.desc      KVStoreTask 已启用，没有 skill，也不要求权限
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0052 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireExtension('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ext.enabled=${ext.enabled}`);
      expect(ext.enabled).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ext.skills.length=${ext.skills.length}`);
      expect(ext.skills.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ext.permissions.length=${ext.permissions.length}`);
      expect(ext.permissions.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0052 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0053
     * @tc.name      testBundleConfigMatrix0053
     * @tc.desc      KVStoreTask 没有 metadata，读写权限均为空串
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0053 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireExtension('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ext.metadata.length=${ext.metadata.length}`);
      expect(ext.metadata.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ext.readPermission=${ext.readPermission}`);
      expect(ext.readPermission).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ext.writePermission=${ext.writePermission}`);
      expect(ext.writePermission).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0053 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0054
     * @tc.name      testBundleConfigMatrix0054
     * @tc.desc      KVStoreTask 没有 metadata，按扩展读取 profile 抛 17700024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0054 begin');
      const actual1: number = requireExtension('KVStoreTask').metadata.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      let code: number = 0;
      try {
        bundleManager.getProfileByExtensionAbilitySync('entry', 'KVStoreTask');
      } catch (error) {
        code = (error as BusinessError).code;
        expect(code).assertEqual(17700024);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 code=${code}`);
      expect(code).assertEqual(17700024);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0054 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0055
     * @tc.name      testBundleConfigMatrix0055
     * @tc.desc      KVStoreTask 未配置 label 与图标，labelId、iconId 都是 0，描述是字面量不解析资源
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0055 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireExtension('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ext.labelId=${ext.labelId}`);
      expect(ext.labelId).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ext.iconId=${ext.iconId}`);
      expect(ext.iconId).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ext.descriptionId=${ext.descriptionId}`);
      expect(ext.descriptionId).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0055 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0056
     * @tc.name      testBundleConfigMatrix0056
     * @tc.desc      启动任务 KvManagerUtilTask 作为扩展登记在 entry 模块，排在扩展列表第 4 位
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0056 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireExtension('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ext.bundleName=${ext.bundleName}`);
      expect(ext.bundleName).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ext.moduleName=${ext.moduleName}`);
      expect(ext.moduleName).assertEqual('entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ext.name=${ext.name}`);
      expect(ext.name).assertEqual('KvManagerUtilTask');
      const actual4: string = requireHap('entry').extensionAbilitiesInfo[3].name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0056 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0057
     * @tc.name      testBundleConfigMatrix0057
     * @tc.desc      KvManagerUtilTask 的类型为 EMBEDDED_UI（21），类型名为 embeddedUI，对外可见
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0057 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireExtension('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ext.extensionAbilityType=${ext.extensionAbilityType}`);
      expect(ext.extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.EMBEDDED_UI);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ext.extensionAbilityTypeName=${ext.extensionAbilityTypeName}`);
      expect(ext.extensionAbilityTypeName).assertEqual('embeddedUI');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ext.exported=${ext.exported}`);
      expect(ext.exported).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0057 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0058
     * @tc.name      testBundleConfigMatrix0058
     * @tc.desc      KvManagerUtilTask 已启用，没有 skill，也不要求权限
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0058 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireExtension('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ext.enabled=${ext.enabled}`);
      expect(ext.enabled).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ext.skills.length=${ext.skills.length}`);
      expect(ext.skills.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ext.permissions.length=${ext.permissions.length}`);
      expect(ext.permissions.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0058 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0059
     * @tc.name      testBundleConfigMatrix0059
     * @tc.desc      KvManagerUtilTask 没有 metadata，读写权限均为空串
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0059 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireExtension('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ext.metadata.length=${ext.metadata.length}`);
      expect(ext.metadata.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ext.readPermission=${ext.readPermission}`);
      expect(ext.readPermission).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ext.writePermission=${ext.writePermission}`);
      expect(ext.writePermission).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0059 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0060
     * @tc.name      testBundleConfigMatrix0060
     * @tc.desc      KvManagerUtilTask 没有 metadata，按扩展读取 profile 抛 17700024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0060 begin');
      const actual1: number = requireExtension('KvManagerUtilTask').metadata.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      let code: number = 0;
      try {
        bundleManager.getProfileByExtensionAbilitySync('entry', 'KvManagerUtilTask');
      } catch (error) {
        code = (error as BusinessError).code;
        expect(code).assertEqual(17700024);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 code=${code}`);
      expect(code).assertEqual(17700024);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0060 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0061
     * @tc.name      testBundleConfigMatrix0061
     * @tc.desc      KvManagerUtilTask 未配置 label 与图标，labelId、iconId 都是 0，描述是字面量不解析资源
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0061 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireExtension('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ext.labelId=${ext.labelId}`);
      expect(ext.labelId).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ext.iconId=${ext.iconId}`);
      expect(ext.iconId).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ext.descriptionId=${ext.descriptionId}`);
      expect(ext.descriptionId).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0061 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0062
     * @tc.name      testBundleConfigMatrix0062
     * @tc.desc      启动任务 RdbStoreTask 作为扩展登记在 entry 模块，排在扩展列表第 5 位
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0062 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireExtension('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ext.bundleName=${ext.bundleName}`);
      expect(ext.bundleName).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ext.moduleName=${ext.moduleName}`);
      expect(ext.moduleName).assertEqual('entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ext.name=${ext.name}`);
      expect(ext.name).assertEqual('RdbStoreTask');
      const actual4: string = requireHap('entry').extensionAbilitiesInfo[4].name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0062 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0063
     * @tc.name      testBundleConfigMatrix0063
     * @tc.desc      RdbStoreTask 的类型为 EMBEDDED_UI（21），类型名为 embeddedUI，对外可见
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0063 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireExtension('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ext.extensionAbilityType=${ext.extensionAbilityType}`);
      expect(ext.extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.EMBEDDED_UI);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ext.extensionAbilityTypeName=${ext.extensionAbilityTypeName}`);
      expect(ext.extensionAbilityTypeName).assertEqual('embeddedUI');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ext.exported=${ext.exported}`);
      expect(ext.exported).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0063 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0064
     * @tc.name      testBundleConfigMatrix0064
     * @tc.desc      RdbStoreTask 已启用，没有 skill，也不要求权限
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0064 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireExtension('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ext.enabled=${ext.enabled}`);
      expect(ext.enabled).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ext.skills.length=${ext.skills.length}`);
      expect(ext.skills.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ext.permissions.length=${ext.permissions.length}`);
      expect(ext.permissions.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0064 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0065
     * @tc.name      testBundleConfigMatrix0065
     * @tc.desc      RdbStoreTask 没有 metadata，读写权限均为空串
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0065 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireExtension('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ext.metadata.length=${ext.metadata.length}`);
      expect(ext.metadata.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ext.readPermission=${ext.readPermission}`);
      expect(ext.readPermission).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ext.writePermission=${ext.writePermission}`);
      expect(ext.writePermission).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0065 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0066
     * @tc.name      testBundleConfigMatrix0066
     * @tc.desc      RdbStoreTask 没有 metadata，按扩展读取 profile 抛 17700024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0066 begin');
      const actual1: number = requireExtension('RdbStoreTask').metadata.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      let code: number = 0;
      try {
        bundleManager.getProfileByExtensionAbilitySync('entry', 'RdbStoreTask');
      } catch (error) {
        code = (error as BusinessError).code;
        expect(code).assertEqual(17700024);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 code=${code}`);
      expect(code).assertEqual(17700024);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0066 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0067
     * @tc.name      testBundleConfigMatrix0067
     * @tc.desc      RdbStoreTask 未配置 label 与图标，labelId、iconId 都是 0，描述是字面量不解析资源
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0067 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireExtension('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ext.labelId=${ext.labelId}`);
      expect(ext.labelId).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ext.iconId=${ext.iconId}`);
      expect(ext.iconId).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ext.descriptionId=${ext.descriptionId}`);
      expect(ext.descriptionId).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0067 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0068
     * @tc.name      testBundleConfigMatrix0068
     * @tc.desc      启动任务 ResourceManagerTask 作为扩展登记在 entry 模块，排在扩展列表第 6 位
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0068 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireExtension('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ext.bundleName=${ext.bundleName}`);
      expect(ext.bundleName).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ext.moduleName=${ext.moduleName}`);
      expect(ext.moduleName).assertEqual('entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ext.name=${ext.name}`);
      expect(ext.name).assertEqual('ResourceManagerTask');
      const actual4: string = requireHap('entry').extensionAbilitiesInfo[5].name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0068 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0069
     * @tc.name      testBundleConfigMatrix0069
     * @tc.desc      ResourceManagerTask 的类型为 EMBEDDED_UI（21），类型名为 embeddedUI，对外可见
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0069 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireExtension('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ext.extensionAbilityType=${ext.extensionAbilityType}`);
      expect(ext.extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.EMBEDDED_UI);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ext.extensionAbilityTypeName=${ext.extensionAbilityTypeName}`);
      expect(ext.extensionAbilityTypeName).assertEqual('embeddedUI');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ext.exported=${ext.exported}`);
      expect(ext.exported).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0069 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0070
     * @tc.name      testBundleConfigMatrix0070
     * @tc.desc      ResourceManagerTask 已启用，没有 skill，也不要求权限
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0070 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireExtension('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ext.enabled=${ext.enabled}`);
      expect(ext.enabled).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ext.skills.length=${ext.skills.length}`);
      expect(ext.skills.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ext.permissions.length=${ext.permissions.length}`);
      expect(ext.permissions.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0070 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0071
     * @tc.name      testBundleConfigMatrix0071
     * @tc.desc      ResourceManagerTask 没有 metadata，读写权限均为空串
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0071 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireExtension('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ext.metadata.length=${ext.metadata.length}`);
      expect(ext.metadata.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ext.readPermission=${ext.readPermission}`);
      expect(ext.readPermission).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ext.writePermission=${ext.writePermission}`);
      expect(ext.writePermission).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0071 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0072
     * @tc.name      testBundleConfigMatrix0072
     * @tc.desc      ResourceManagerTask 没有 metadata，按扩展读取 profile 抛 17700024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0072 begin');
      const actual1: number = requireExtension('ResourceManagerTask').metadata.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      let code: number = 0;
      try {
        bundleManager.getProfileByExtensionAbilitySync('entry', 'ResourceManagerTask');
      } catch (error) {
        code = (error as BusinessError).code;
        expect(code).assertEqual(17700024);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 code=${code}`);
      expect(code).assertEqual(17700024);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0072 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0073
     * @tc.name      testBundleConfigMatrix0073
     * @tc.desc      ResourceManagerTask 未配置 label 与图标，labelId、iconId 都是 0，描述是字面量不解析资源
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0073 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireExtension('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ext.labelId=${ext.labelId}`);
      expect(ext.labelId).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ext.iconId=${ext.iconId}`);
      expect(ext.iconId).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ext.descriptionId=${ext.descriptionId}`);
      expect(ext.descriptionId).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0073 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0074
     * @tc.name      testBundleConfigMatrix0074
     * @tc.desc      启动配置入口 StartupConfig 作为扩展登记在 entry 模块，排在扩展列表第 7 位
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBundleConfigMatrix0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0074 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireExtension('StartupConfig');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ext.bundleName=${ext.bundleName}`);
      expect(ext.bundleName).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ext.moduleName=${ext.moduleName}`);
      expect(ext.moduleName).assertEqual('entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ext.name=${ext.name}`);
      expect(ext.name).assertEqual('StartupConfig');
      const actual4: string = requireHap('entry').extensionAbilitiesInfo[6].name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('StartupConfig');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0074 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0075
     * @tc.name      testBundleConfigMatrix0075
     * @tc.desc      StartupConfig 的类型为 EMBEDDED_UI（21），类型名为 embeddedUI，对外可见
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBundleConfigMatrix0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0075 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireExtension('StartupConfig');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ext.extensionAbilityType=${ext.extensionAbilityType}`);
      expect(ext.extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.EMBEDDED_UI);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ext.extensionAbilityTypeName=${ext.extensionAbilityTypeName}`);
      expect(ext.extensionAbilityTypeName).assertEqual('embeddedUI');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ext.exported=${ext.exported}`);
      expect(ext.exported).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0075 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0076
     * @tc.name      testBundleConfigMatrix0076
     * @tc.desc      StartupConfig 已启用，没有 skill，也不要求权限
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0076 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireExtension('StartupConfig');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ext.enabled=${ext.enabled}`);
      expect(ext.enabled).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ext.skills.length=${ext.skills.length}`);
      expect(ext.skills.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ext.permissions.length=${ext.permissions.length}`);
      expect(ext.permissions.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0076 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0077
     * @tc.name      testBundleConfigMatrix0077
     * @tc.desc      StartupConfig 没有 metadata，读写权限均为空串
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0077 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireExtension('StartupConfig');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ext.metadata.length=${ext.metadata.length}`);
      expect(ext.metadata.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ext.readPermission=${ext.readPermission}`);
      expect(ext.readPermission).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ext.writePermission=${ext.writePermission}`);
      expect(ext.writePermission).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0077 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0078
     * @tc.name      testBundleConfigMatrix0078
     * @tc.desc      StartupConfig 没有 metadata，按扩展读取 profile 抛 17700024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0078 begin');
      const actual1: number = requireExtension('StartupConfig').metadata.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      let code: number = 0;
      try {
        bundleManager.getProfileByExtensionAbilitySync('entry', 'StartupConfig');
      } catch (error) {
        code = (error as BusinessError).code;
        expect(code).assertEqual(17700024);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 code=${code}`);
      expect(code).assertEqual(17700024);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0078 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0079
     * @tc.name      testBundleConfigMatrix0079
     * @tc.desc      StartupConfig 的 label 引用 $string:EntryAbility_label，按 labelId 解析为 label，未配图标
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0079 begin');
      const ext: bundleManager.ExtensionAbilityInfo = requireExtension('StartupConfig');
      const manager: resourceManager.ResourceManager = await lightManager();
      const actual1: boolean = ext.labelId > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = manager.getStringSync(ext.labelId);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ext.iconId=${ext.iconId}`);
      expect(ext.iconId).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0079 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0080
     * @tc.name      testBundleConfigMatrix0080
     * @tc.desc      异步 getBundleInfoForSelf 与同步接口返回同一份包信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleConfigMatrix0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0080 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;
      const asyncInfo: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 asyncInfo.name=${asyncInfo.name}`);
      expect(asyncInfo.name).assertEqual(getSelfBundleInfo().name);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 asyncInfo.versionCode=${asyncInfo.versionCode}`);
      expect(asyncInfo.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncInfo.hapModulesInfo.length=${asyncInfo.hapModulesInfo.length}`);
      expect(asyncInfo.hapModulesInfo.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0080 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0081
     * @tc.name      testBundleConfigMatrix0081
     * @tc.desc      不带 HAP 标志查询时包信息里没有模块列表，但应用信息仍在
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0081 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const lite: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 lite.hapModulesInfo.length=${lite.hapModulesInfo.length}`);
      expect(lite.hapModulesInfo.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 lite.appInfo.name=${lite.appInfo.name}`);
      expect(lite.appInfo.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 lite.versionName=${lite.versionName}`);
      expect(lite.versionName).assertEqual('1.0.0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0081 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0082
     * @tc.name      testBundleConfigMatrix0082
     * @tc.desc      只带 HAP 标志查询时模块里没有 Ability 与扩展列表
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0082 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;
      const lite: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const entry: bundleManager.HapModuleInfo[] = lite.hapModulesInfo.filter(
        (m: bundleManager.HapModuleInfo) => m.name === 'entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 entry.length=${entry.length}`);
      expect(entry.length).assertEqual(1);
      const actual2: number = entry[0].abilitiesInfo.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(0);
      const actual3: number = entry[0].extensionAbilitiesInfo.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0082 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0083
     * @tc.name      testBundleConfigMatrix0083
     * @tc.desc      带 EXTENSION_ABILITY 但不带 ABILITY 标志时只返回 7 个扩展，Ability 列表为空
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0083 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const lite: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const entry: bundleManager.HapModuleInfo[] = lite.hapModulesInfo.filter(
        (m: bundleManager.HapModuleInfo) => m.name === 'entry');
      const actual1: number = entry[0].extensionAbilitiesInfo.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(7);
      const actual2: number = entry[0].abilitiesInfo.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(0);
      const actual3: string = entry[0].extensionAbilitiesInfo[0].name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0083 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_CONFIG_0084
     * @tc.name      testBundleConfigMatrix0084
     * @tc.desc      带 ABILITY 但不带 SKILL 标志查询时 EntryAbility 的 skill 列表为空
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleConfigMatrix0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0084 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const lite: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const entry: bundleManager.HapModuleInfo[] = lite.hapModulesInfo.filter(
        (m: bundleManager.HapModuleInfo) => m.name === 'entry');
      const actual1: number = entry[0].abilitiesInfo.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(1);
      const actual2: string = entry[0].abilitiesInfo[0].name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('EntryAbility');
      const actual3: number = entry[0].abilitiesInfo[0].skills.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleConfigMatrix0084 end');
    })
  })
}

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

import { afterAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { common } from '@kit.AbilityKit';
import { resourceManager } from '@kit.LocalizationKit';
import CharacterOperation from '../../../main/ets/characteroperation/CharacterOperation';
import { getAppColorMode, getAppLocale, getConfiguration, getStringByName, loadEntryContext, sleep } from './TestHelper';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AbilityFeature]';

const CONFIG_SETTLE_MS: number = 800;

/**
 * 实测（真机 API 26）：setLanguage 之后字符串资源会立刻切到目标语言，
 * 但 resourceManager.getConfigurationSync().locale 仍返回系统语言，不跟随 setLanguage。
 * 所以语言类用例以资源文案作为生效依据，locale 只校验可读、非空。
 */

/** 每个用例都重新取一次 context：setLanguage 可能让 Ability 走重建流程，缓存旧 context 会失效。 */
async function freshOperation(): Promise<CharacterOperation | undefined> {
  try {
    const context: common.UIAbilityContext = await loadEntryContext();
    return new CharacterOperation(context);
  } catch (error) {
    return undefined;
  }
}

export default function abilityConfigTest() {
  describe('AbilityFeatureConfigTest', () => {
    afterAll(async (done: Function) => {
      const op: CharacterOperation | undefined = await freshOperation();
      if (op !== undefined) {
        op.setZHCNLanguage();
        op.setLightColorMode();
        await sleep(CONFIG_SETTLE_MS);
      }
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONFIG_0001
     * @tc.name      testSetChineseLanguage0001
     * @tc.desc      切到中文后配置语言与中文资源同时生效
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSetChineseLanguage0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSetChineseLanguage0001 begin');
      const op: CharacterOperation | undefined = await freshOperation();
      const actual1: boolean = op !== undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `testSetChineseLanguage0001 assert1 value=${actual1}`);
      expect(actual1).assertTrue();
      if (op === undefined) {
        done();
        return;
      }
      op.setZHCNLanguage();
      await sleep(CONFIG_SETTLE_MS);
      const actual2: boolean = getAppLocale().length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `testSetChineseLanguage0001 assert2 getAppLocale=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = getStringByName('Set_Dark_Mode');
      hilog.info(DOMAIN, TAG, '%{public}s', `testSetChineseLanguage0001 assert3 getStringByName=${actual3}`);
      expect(actual3).assertEqual('设置深色模式');
      const actual4: string = getStringByName('CreateStorageData');
      hilog.info(DOMAIN, TAG, '%{public}s', `testSetChineseLanguage0001 assert4 getStringByName=${actual4}`);
      expect(actual4).assertEqual('创建数据');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSetChineseLanguage0001 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONFIG_0002
     * @tc.name      testSetEnglishLanguage0002
     * @tc.desc      切到英文后配置语言与英文资源同时生效
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSetEnglishLanguage0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSetEnglishLanguage0002 begin');
      const op: CharacterOperation | undefined = await freshOperation();
      const actual1: boolean = op !== undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `testSetEnglishLanguage0002 assert1 value=${actual1}`);
      expect(actual1).assertTrue();
      if (op === undefined) {
        done();
        return;
      }
      op.setENUSLanguage();
      await sleep(CONFIG_SETTLE_MS);
      const actual2: boolean = getAppLocale().length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `testSetEnglishLanguage0002 assert2 getAppLocale=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = getStringByName('Set_Dark_Mode');
      hilog.info(DOMAIN, TAG, '%{public}s', `testSetEnglishLanguage0002 assert3 getStringByName=${actual3}`);
      expect(actual3).assertEqual('Set Dark Mode');
      const actual4: string = getStringByName('CreateStorageData');
      hilog.info(DOMAIN, TAG, '%{public}s', `testSetEnglishLanguage0002 assert4 getStringByName=${actual4}`);
      expect(actual4).assertEqual('Create Storage Data');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSetEnglishLanguage0002 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONFIG_0003
     * @tc.name      testLanguageRoundTrip0003
     * @tc.desc      中英往返切换后语言与资源依次回到初始语言
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLanguageRoundTrip0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLanguageRoundTrip0003 begin');
      const op: CharacterOperation | undefined = await freshOperation();
      const actual1: boolean = op !== undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `testLanguageRoundTrip0003 assert1 value=${actual1}`);
      expect(actual1).assertTrue();
      if (op === undefined) {
        done();
        return;
      }
      op.setENUSLanguage();
      await sleep(CONFIG_SETTLE_MS);
      const englishText: string = getStringByName('CreateStorageData');
      op.setZHCNLanguage();
      await sleep(CONFIG_SETTLE_MS);
      const chineseText: string = getStringByName('CreateStorageData');
      const actual2: boolean = englishText.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `testLanguageRoundTrip0003 assert2 value=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = englishText !== chineseText;
      hilog.info(DOMAIN, TAG, '%{public}s', `testLanguageRoundTrip0003 assert3 value=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testLanguageRoundTrip0003 assert4 chineseText=${chineseText}`);
      expect(chineseText).assertEqual('创建数据');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLanguageRoundTrip0003 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONFIG_0004
     * @tc.name      testSwitchDarkColorMode0004
     * @tc.desc      深色模式写入配置，colorMode 变为 DARK
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSwitchDarkColorMode0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchDarkColorMode0004 begin');
      const op: CharacterOperation | undefined = await freshOperation();
      const actual1: boolean = op !== undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `testSwitchDarkColorMode0004 assert1 value=${actual1}`);
      expect(actual1).assertTrue();
      if (op === undefined) {
        done();
        return;
      }
      op.setDarkColorMode();
      await sleep(CONFIG_SETTLE_MS);
      const actual2: number = getAppColorMode();
      hilog.info(DOMAIN, TAG, '%{public}s', `testSwitchDarkColorMode0004 assert2 getAppColorMode=${actual2}`);
      expect(actual2).assertEqual(resourceManager.ColorMode.DARK);
      const actual3: boolean = getConfiguration().colorMode === 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `testSwitchDarkColorMode0004 assert3 getConfiguration=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = getConfiguration().colorMode !== resourceManager.ColorMode.LIGHT;
      hilog.info(DOMAIN, TAG, '%{public}s', `testSwitchDarkColorMode0004 assert4 getConfiguration=${actual4}`);
      expect(actual4).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchDarkColorMode0004 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONFIG_0005
     * @tc.name      testSwitchLightColorMode0005
     * @tc.desc      浅色模式写入配置，colorMode 变为 LIGHT
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSwitchLightColorMode0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchLightColorMode0005 begin');
      const op: CharacterOperation | undefined = await freshOperation();
      const actual1: boolean = op !== undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `testSwitchLightColorMode0005 assert1 value=${actual1}`);
      expect(actual1).assertTrue();
      if (op === undefined) {
        done();
        return;
      }
      op.setLightColorMode();
      await sleep(CONFIG_SETTLE_MS);
      const actual2: number = getAppColorMode();
      hilog.info(DOMAIN, TAG, '%{public}s', `testSwitchLightColorMode0005 assert2 getAppColorMode=${actual2}`);
      expect(actual2).assertEqual(resourceManager.ColorMode.LIGHT);
      const actual3: boolean = getConfiguration().colorMode === 1;
      hilog.info(DOMAIN, TAG, '%{public}s', `testSwitchLightColorMode0005 assert3 getConfiguration=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = getConfiguration().colorMode !== resourceManager.ColorMode.DARK;
      hilog.info(DOMAIN, TAG, '%{public}s', `testSwitchLightColorMode0005 assert4 getConfiguration=${actual4}`);
      expect(actual4).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchLightColorMode0005 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONFIG_0006
     * @tc.name      testColorModeRoundTrip0006
     * @tc.desc      深浅色往返切换，配置值依次翻转
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testColorModeRoundTrip0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorModeRoundTrip0006 begin');
      const op: CharacterOperation | undefined = await freshOperation();
      const actual1: boolean = op !== undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorModeRoundTrip0006 assert1 value=${actual1}`);
      expect(actual1).assertTrue();
      if (op === undefined) {
        done();
        return;
      }
      op.setDarkColorMode();
      await sleep(CONFIG_SETTLE_MS);
      const actual2: number = getAppColorMode();
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorModeRoundTrip0006 assert2 getAppColorMode=${actual2}`);
      expect(actual2).assertEqual(resourceManager.ColorMode.DARK);
      op.setLightColorMode();
      await sleep(CONFIG_SETTLE_MS);
      const actual3: number = getAppColorMode();
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorModeRoundTrip0006 assert3 getAppColorMode=${actual3}`);
      expect(actual3).assertEqual(resourceManager.ColorMode.LIGHT);
      const actual4: boolean = getAppColorMode() === resourceManager.ColorMode.DARK;
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorModeRoundTrip0006 assert4 getAppColorMode=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorModeRoundTrip0006 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONFIG_0007
     * @tc.name      testResourceStringFollowsLocale0007
     * @tc.desc      同一资源在两种语言下取到不同文案
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResourceStringFollowsLocale0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceStringFollowsLocale0007 begin');
      const op: CharacterOperation | undefined = await freshOperation();
      const actual1: boolean = op !== undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `testResourceStringFollowsLocale0007 assert1 value=${actual1}`);
      expect(actual1).assertTrue();
      if (op === undefined) {
        done();
        return;
      }
      op.setENUSLanguage();
      await sleep(CONFIG_SETTLE_MS);
      const actual2: string = getStringByName('Set_Chinese_language');
      hilog.info(DOMAIN, TAG, '%{public}s', `testResourceStringFollowsLocale0007 assert2 getStringByName=${actual2}`);
      expect(actual2).assertEqual('Set Chinese language');
      op.setZHCNLanguage();
      await sleep(CONFIG_SETTLE_MS);
      const actual3: string = getStringByName('Set_Chinese_language');
      hilog.info(DOMAIN, TAG, '%{public}s', `testResourceStringFollowsLocale0007 assert3 getStringByName=${actual3}`);
      expect(actual3).assertEqual('设置中文语言');
      const actual4: boolean = getStringByName('Set_Chinese_language') !== 'Set Chinese language';
      hilog.info(DOMAIN, TAG, '%{public}s', `testResourceStringFollowsLocale0007 assert4 getStringByName=${actual4}`);
      expect(actual4).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceStringFollowsLocale0007 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONFIG_0008
     * @tc.name      testConfigurationIsReadable0008
     * @tc.desc      配置对象可重复读取，语言与色彩模式取值合法
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfigurationIsReadable0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigurationIsReadable0008 begin');
      const first: resourceManager.Configuration = getConfiguration();
      const second: resourceManager.Configuration = getConfiguration();
      const actual1: boolean = first !== undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `testConfigurationIsReadable0008 assert1 value=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = second.locale.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `testConfigurationIsReadable0008 assert2 value=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = second.colorMode === resourceManager.ColorMode.DARK || second.colorMode === resourceManager.ColorMode.LIGHT;
      hilog.info(DOMAIN, TAG, '%{public}s', `testConfigurationIsReadable0008 assert3 value=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testConfigurationIsReadable0008 assert4 first.locale.length=${first.locale.length}`);
      expect(first.locale.length).assertEqual(second.locale.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigurationIsReadable0008 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONFIG_0009
     * @tc.name      testRestoreDefaultConfiguration0009
     * @tc.desc      用例收尾把语言与色彩模式还原为中文浅色
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRestoreDefaultConfiguration0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRestoreDefaultConfiguration0009 begin');
      const op: CharacterOperation | undefined = await freshOperation();
      const actual1: boolean = op !== undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `testRestoreDefaultConfiguration0009 assert1 value=${actual1}`);
      expect(actual1).assertTrue();
      if (op === undefined) {
        done();
        return;
      }
      op.setZHCNLanguage();
      op.setLightColorMode();
      await sleep(CONFIG_SETTLE_MS);
      const actual2: boolean = getAppLocale().length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `testRestoreDefaultConfiguration0009 assert2 getAppLocale=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: number = getAppColorMode();
      hilog.info(DOMAIN, TAG, '%{public}s', `testRestoreDefaultConfiguration0009 assert3 getAppColorMode=${actual3}`);
      expect(actual3).assertEqual(resourceManager.ColorMode.LIGHT);
      const actual4: string = getStringByName('close');
      hilog.info(DOMAIN, TAG, '%{public}s', `testRestoreDefaultConfiguration0009 assert4 getStringByName=${actual4}`);
      expect(actual4).assertEqual('关闭');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRestoreDefaultConfiguration0009 end');
      done();
    })
  })
}

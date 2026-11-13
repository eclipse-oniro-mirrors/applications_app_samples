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

import { afterAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import { resourceManager } from '@kit.LocalizationKit';
import CharacterOperation from '../../../main/ets/characteroperation/CharacterOperation';
import { getAppColorMode, getAppLocale, getConfiguration, getStringByName, loadEntryContext, sleep } from './TestHelper';

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
      const op: CharacterOperation | undefined = await freshOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined) {
        done();
        return;
      }
      op.setZHCNLanguage();
      await sleep(CONFIG_SETTLE_MS);
      expect(getAppLocale().length > 0).assertTrue();
      expect(getStringByName('Set_Dark_Mode')).assertEqual('设置深色模式');
      expect(getStringByName('CreateStorageData')).assertEqual('创建数据');
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
      const op: CharacterOperation | undefined = await freshOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined) {
        done();
        return;
      }
      op.setENUSLanguage();
      await sleep(CONFIG_SETTLE_MS);
      expect(getAppLocale().length > 0).assertTrue();
      expect(getStringByName('Set_Dark_Mode')).assertEqual('Set Dark Mode');
      expect(getStringByName('CreateStorageData')).assertEqual('Create Storage Data');
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
      const op: CharacterOperation | undefined = await freshOperation();
      expect(op !== undefined).assertTrue();
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
      expect(englishText.length > 0).assertTrue();
      expect(englishText !== chineseText).assertTrue();
      expect(chineseText).assertEqual('创建数据');
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
      const op: CharacterOperation | undefined = await freshOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined) {
        done();
        return;
      }
      op.setDarkColorMode();
      await sleep(CONFIG_SETTLE_MS);
      expect(getAppColorMode()).assertEqual(resourceManager.ColorMode.DARK);
      expect(getConfiguration().colorMode === 0).assertTrue();
      expect(getConfiguration().colorMode !== resourceManager.ColorMode.LIGHT).assertTrue();
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
      const op: CharacterOperation | undefined = await freshOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined) {
        done();
        return;
      }
      op.setLightColorMode();
      await sleep(CONFIG_SETTLE_MS);
      expect(getAppColorMode()).assertEqual(resourceManager.ColorMode.LIGHT);
      expect(getConfiguration().colorMode === 1).assertTrue();
      expect(getConfiguration().colorMode !== resourceManager.ColorMode.DARK).assertTrue();
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
      const op: CharacterOperation | undefined = await freshOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined) {
        done();
        return;
      }
      op.setDarkColorMode();
      await sleep(CONFIG_SETTLE_MS);
      expect(getAppColorMode()).assertEqual(resourceManager.ColorMode.DARK);
      op.setLightColorMode();
      await sleep(CONFIG_SETTLE_MS);
      expect(getAppColorMode()).assertEqual(resourceManager.ColorMode.LIGHT);
      expect(getAppColorMode() === resourceManager.ColorMode.DARK).assertFalse();
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
      const op: CharacterOperation | undefined = await freshOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined) {
        done();
        return;
      }
      op.setENUSLanguage();
      await sleep(CONFIG_SETTLE_MS);
      expect(getStringByName('Set_Chinese_language')).assertEqual('Set Chinese language');
      op.setZHCNLanguage();
      await sleep(CONFIG_SETTLE_MS);
      expect(getStringByName('Set_Chinese_language')).assertEqual('设置中文语言');
      expect(getStringByName('Set_Chinese_language') !== 'Set Chinese language').assertTrue();
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
      const first: resourceManager.Configuration = getConfiguration();
      const second: resourceManager.Configuration = getConfiguration();
      expect(first !== undefined).assertTrue();
      expect(second.locale.length > 0).assertTrue();
      expect(second.colorMode === resourceManager.ColorMode.DARK ||
        second.colorMode === resourceManager.ColorMode.LIGHT).assertTrue();
      expect(first.locale.length).assertEqual(second.locale.length);
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
      const op: CharacterOperation | undefined = await freshOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined) {
        done();
        return;
      }
      op.setZHCNLanguage();
      op.setLightColorMode();
      await sleep(CONFIG_SETTLE_MS);
      expect(getAppLocale().length > 0).assertTrue();
      expect(getAppColorMode()).assertEqual(resourceManager.ColorMode.LIGHT);
      expect(getStringByName('close')).assertEqual('关闭');
      done();
    })
  })
}

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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Component, Driver, ON } from '@kit.TestKit';
import { common } from '@kit.AbilityKit';
import { resourceManager } from '@kit.LocalizationKit';
import {
  MENU_ID_ANIMATION_TOGGLE,
  MENU_ID_IMPLICIT_NO_POPUP,
  MENU_ID_LANGUAGE_EN,
  MENU_ID_LANGUAGE_ZH,
  MENU_ID_MODE_DARK,
  MENU_ID_MODE_LIGHT,
  MENU_ID_START_OPTIONS,
  MENU_ID_STORAGE_CHECK,
  MENU_ID_STORAGE_CREATE,
  PAGE_ID_NEW_BACK
} from '../../../main/ets/common/MenuIds';
import { countExisting, countMissing, removeStorageFiles } from '../../../main/ets/model/StoragePath';
import {
  ENTRY_ABILITY,
  NEW_ABILITY,
  getAbilityName,
  getAppColorMode,
  getStringByName,
  getTopAbility,
  loadEntryContext,
  sleep,
  startEntryAbility
} from './TestHelper';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AbilityFeature]';

/** 首页渲染与页面切换的稳定时间，取值参考真机实测 */
const LAUNCH_WAIT_MS: number = 800;
const FIND_WAIT_MS: number = 1000;
const TOAST_WAIT_MS: number = 1500;
const SETTLE_MS: number = 150;
const PAGE_SWITCH_MS: number = 1200;

async function ensureHome(): Promise<void> {
  try {
    await startEntryAbility();
  } catch (error) {
    // 拉不起来时由各用例的组件断言暴露，这里只负责尽量把页面恢复到首页
  }
  await sleep(LAUNCH_WAIT_MS);
}

/**
 * 页面里创建/检查数据用的是 EntryAbility 的 UIAbilityContext，落盘目录带 haps/entry 这一段；
 * AbilityDelegator.getAppContext() 是应用级 Context，目录少了这一段，数文件会永远对不上。
 */
async function entrySandboxContext(): Promise<common.Context | undefined> {
  try {
    return await loadEntryContext();
  } catch (error) {
    return undefined;
  }
}

async function openDriver(): Promise<Driver | undefined> {
  try {
    const created: Driver = Driver.create();
    await created.delayMs(300);
    return created;
  } catch (error) {
    return undefined;
  }
}

async function hasId(active: Driver, id: string, waitMs: number = FIND_WAIT_MS): Promise<boolean> {
  try {
    const component: Component | undefined = await active.waitForComponent(ON.id(id), waitMs);
    return component !== undefined;
  } catch (error) {
    return false;
  }
}

async function hasText(active: Driver, text: string, waitMs: number = FIND_WAIT_MS): Promise<boolean> {
  try {
    const component: Component | undefined = await active.waitForComponent(ON.text(text), waitMs);
    return component !== undefined;
  } catch (error) {
    return false;
  }
}

async function clickId(active: Driver, id: string): Promise<boolean> {
  try {
    const component: Component | undefined = await active.waitForComponent(ON.id(id), FIND_WAIT_MS);
    if (component === undefined) {
      return false;
    }
    await component.click();
    await active.delayMs(SETTLE_MS);
    return true;
  } catch (error) {
    return false;
  }
}

async function clickText(active: Driver, text: string): Promise<boolean> {
  try {
    const component: Component | undefined = await active.waitForComponent(ON.text(text), FIND_WAIT_MS);
    if (component === undefined) {
      return false;
    }
    await component.click();
    await active.delayMs(SETTLE_MS);
    return true;
  } catch (error) {
    return false;
  }
}

export default function abilityUiSmokeTest() {
  describe('AbilityFeatureUiSmokeTest', () => {
    /**
     * @tc.number    SUB_ABILITY_FEATURE_UI_SMOKE_0001
     * @tc.name      testHomeMenuIdsPresent0001
     * @tc.desc      首页三个分组的关键列表项都按 id 渲染出来
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHomeMenuIdsPresent0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHomeMenuIdsPresent0001 begin');
      await ensureHome();
      const active: Driver | undefined = await openDriver();
      const actual1: boolean = active !== undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `testHomeMenuIdsPresent0001 assert1 value=${actual1}`);
      expect(actual1).assertTrue();
      if (active !== undefined) {
        const actual2: boolean = await hasId(active, MENU_ID_LANGUAGE_ZH);
        hilog.info(DOMAIN, TAG, '%{public}s', `testHomeMenuIdsPresent0001 assert2 hasId=${actual2}`);
        expect(actual2).assertTrue();
        const actual3: boolean = await hasId(active, MENU_ID_LANGUAGE_EN);
        hilog.info(DOMAIN, TAG, '%{public}s', `testHomeMenuIdsPresent0001 assert3 hasId=${actual3}`);
        expect(actual3).assertTrue();
        const actual4: boolean = await hasId(active, MENU_ID_ANIMATION_TOGGLE);
        hilog.info(DOMAIN, TAG, '%{public}s', `testHomeMenuIdsPresent0001 assert4 hasId=${actual4}`);
        expect(actual4).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHomeMenuIdsPresent0001 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_UI_SMOKE_0002
     * @tc.name      testHomeStorageMenuIdsPresent0002
     * @tc.desc      数据操作分组的三个列表项都可见
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHomeStorageMenuIdsPresent0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHomeStorageMenuIdsPresent0002 begin');
      await ensureHome();
      const active: Driver | undefined = await openDriver();
      const actual1: boolean = active !== undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `testHomeStorageMenuIdsPresent0002 assert1 value=${actual1}`);
      expect(actual1).assertTrue();
      if (active !== undefined) {
        const actual2: boolean = await hasId(active, MENU_ID_STORAGE_CREATE);
        hilog.info(DOMAIN, TAG, '%{public}s', `testHomeStorageMenuIdsPresent0002 assert2 hasId=${actual2}`);
        expect(actual2).assertTrue();
        const actual3: boolean = await hasId(active, MENU_ID_STORAGE_CHECK);
        hilog.info(DOMAIN, TAG, '%{public}s', `testHomeStorageMenuIdsPresent0002 assert3 hasId=${actual3}`);
        expect(actual3).assertTrue();
        const actual4: boolean = await hasId(active, MENU_ID_START_OPTIONS);
        hilog.info(DOMAIN, TAG, '%{public}s', `testHomeStorageMenuIdsPresent0002 assert4 hasId=${actual4}`);
        expect(actual4).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHomeStorageMenuIdsPresent0002 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_UI_SMOKE_0003
     * @tc.name      testHomeTitleVisible0003
     * @tc.desc      首页标题文案与语言分组标题同时可见
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHomeTitleVisible0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHomeTitleVisible0003 begin');
      await ensureHome();
      const active: Driver | undefined = await openDriver();
      const actual1: boolean = active !== undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `testHomeTitleVisible0003 assert1 value=${actual1}`);
      expect(actual1).assertTrue();
      if (active !== undefined) {
        const actual2: boolean = await hasText(active, getStringByName('system_BasicCharacter_Demo'));
        hilog.info(DOMAIN, TAG, '%{public}s', `testHomeTitleVisible0003 assert2 hasText=${actual2}`);
        expect(actual2).assertTrue();
        const actual3: boolean = await hasText(active, getStringByName('Set_Chinese_language'));
        hilog.info(DOMAIN, TAG, '%{public}s', `testHomeTitleVisible0003 assert3 hasText=${actual3}`);
        expect(actual3).assertTrue();
        const actual4: boolean = await hasId(active, MENU_ID_LANGUAGE_ZH);
        hilog.info(DOMAIN, TAG, '%{public}s', `testHomeTitleVisible0003 assert4 hasId=${actual4}`);
        expect(actual4).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHomeTitleVisible0003 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_UI_SMOKE_0004
     * @tc.name      testAnimationToggleSwitches0004
     * @tc.desc      动效开关在“开启/关闭”两种文案之间切换
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAnimationToggleSwitches0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnimationToggleSwitches0004 begin');
      await ensureHome();
      const active: Driver | undefined = await openDriver();
      const actual1: boolean = active !== undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `testAnimationToggleSwitches0004 assert1 value=${actual1}`);
      expect(actual1).assertTrue();
      if (active !== undefined) {
        const actual2: boolean = await hasId(active, MENU_ID_ANIMATION_TOGGLE);
        hilog.info(DOMAIN, TAG, '%{public}s', `testAnimationToggleSwitches0004 assert2 hasId=${actual2}`);
        expect(actual2).assertTrue();
        const actual3: boolean = await clickText(active, getStringByName('open'));
        hilog.info(DOMAIN, TAG, '%{public}s', `testAnimationToggleSwitches0004 assert3 clickText=${actual3}`);
        expect(actual3).assertTrue();
        const actual4: boolean = await hasText(active, getStringByName('close'));
        hilog.info(DOMAIN, TAG, '%{public}s', `testAnimationToggleSwitches0004 assert4 hasText=${actual4}`);
        expect(actual4).assertTrue();
        const actual5: boolean = await clickText(active, getStringByName('close'));
        hilog.info(DOMAIN, TAG, '%{public}s', `testAnimationToggleSwitches0004 assert5 clickText=${actual5}`);
        expect(actual5).assertTrue();
        const actual6: boolean = await hasText(active, getStringByName('open'));
        hilog.info(DOMAIN, TAG, '%{public}s', `testAnimationToggleSwitches0004 assert6 hasText=${actual6}`);
        expect(actual6).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnimationToggleSwitches0004 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_UI_SMOKE_0005
     * @tc.name      testLanguageSwitchUpdatesText0005
     * @tc.desc      点英文后界面文案变英文，点中文后恢复中文
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLanguageSwitchUpdatesText0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLanguageSwitchUpdatesText0005 begin');
      await ensureHome();
      const active: Driver | undefined = await openDriver();
      const actual1: boolean = active !== undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `testLanguageSwitchUpdatesText0005 assert1 value=${actual1}`);
      expect(actual1).assertTrue();
      if (active !== undefined) {
        const actual2: boolean = await clickId(active, MENU_ID_LANGUAGE_EN);
        hilog.info(DOMAIN, TAG, '%{public}s', `testLanguageSwitchUpdatesText0005 assert2 clickId=${actual2}`);
        expect(actual2).assertTrue();
        await sleep(LAUNCH_WAIT_MS);
        const actual3: boolean = await hasText(active, 'Set Chinese language');
        hilog.info(DOMAIN, TAG, '%{public}s', `testLanguageSwitchUpdatesText0005 assert3 hasText=${actual3}`);
        expect(actual3).assertTrue();
        const actual4: boolean = await clickId(active, MENU_ID_LANGUAGE_ZH);
        hilog.info(DOMAIN, TAG, '%{public}s', `testLanguageSwitchUpdatesText0005 assert4 clickId=${actual4}`);
        expect(actual4).assertTrue();
        await sleep(LAUNCH_WAIT_MS);
        const actual5: boolean = await hasText(active, '设置中文语言');
        hilog.info(DOMAIN, TAG, '%{public}s', `testLanguageSwitchUpdatesText0005 assert5 hasText=${actual5}`);
        expect(actual5).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLanguageSwitchUpdatesText0005 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_UI_SMOKE_0006
     * @tc.name      testColorModeSwitchApplies0006
     * @tc.desc      点深色/浅色后应用配置的色彩模式随之变化
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testColorModeSwitchApplies0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorModeSwitchApplies0006 begin');
      await ensureHome();
      const active: Driver | undefined = await openDriver();
      const actual1: boolean = active !== undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorModeSwitchApplies0006 assert1 value=${actual1}`);
      expect(actual1).assertTrue();
      if (active !== undefined) {
        const actual2: boolean = await clickId(active, MENU_ID_MODE_DARK);
        hilog.info(DOMAIN, TAG, '%{public}s', `testColorModeSwitchApplies0006 assert2 clickId=${actual2}`);
        expect(actual2).assertTrue();
        await sleep(LAUNCH_WAIT_MS);
        const actual3: number = getAppColorMode();
        hilog.info(DOMAIN, TAG, '%{public}s', `testColorModeSwitchApplies0006 assert3 getAppColorMode=${actual3}`);
        expect(actual3).assertEqual(resourceManager.ColorMode.DARK);
        const actual4: boolean = await clickId(active, MENU_ID_MODE_LIGHT);
        hilog.info(DOMAIN, TAG, '%{public}s', `testColorModeSwitchApplies0006 assert4 clickId=${actual4}`);
        expect(actual4).assertTrue();
        await sleep(LAUNCH_WAIT_MS);
        const actual5: number = getAppColorMode();
        hilog.info(DOMAIN, TAG, '%{public}s', `testColorModeSwitchApplies0006 assert5 getAppColorMode=${actual5}`);
        expect(actual5).assertEqual(resourceManager.ColorMode.LIGHT);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorModeSwitchApplies0006 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_UI_SMOKE_0007
     * @tc.name      testCreateStorageFromUi0007
     * @tc.desc      点“创建数据”后弹出成功提示且五个目录都落盘
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateStorageFromUi0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateStorageFromUi0007 begin');
      await ensureHome();
      const active: Driver | undefined = await openDriver();
      const actual1: boolean = active !== undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `testCreateStorageFromUi0007 assert1 value=${actual1}`);
      expect(actual1).assertTrue();
      if (active !== undefined) {
        const context: common.Context | undefined = await entrySandboxContext();
        const actual2: boolean = context !== undefined;
        hilog.info(DOMAIN, TAG, '%{public}s', `testCreateStorageFromUi0007 assert2 value=${actual2}`);
        expect(actual2).assertTrue();
        if (context !== undefined) {
          removeStorageFiles(context);
          const actual3: boolean = await clickId(active, MENU_ID_STORAGE_CREATE);
          hilog.info(DOMAIN, TAG, '%{public}s', `testCreateStorageFromUi0007 assert3 clickId=${actual3}`);
          expect(actual3).assertTrue();
          const actual4: boolean = await hasText(active, getStringByName('create_File_Success'), TOAST_WAIT_MS);
          hilog.info(DOMAIN, TAG, '%{public}s', `testCreateStorageFromUi0007 assert4 hasText=${actual4}`);
          expect(actual4).assertTrue();
          const actual5: number = countExisting(context);
          hilog.info(DOMAIN, TAG, '%{public}s', `testCreateStorageFromUi0007 assert5 countExisting=${actual5}`);
          expect(actual5).assertEqual(5);
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateStorageFromUi0007 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_UI_SMOKE_0008
     * @tc.name      testCheckStorageFromUi0008
     * @tc.desc      文件齐全时点“检查数据”弹出查询成功提示
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCheckStorageFromUi0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckStorageFromUi0008 begin');
      await ensureHome();
      const active: Driver | undefined = await openDriver();
      const actual1: boolean = active !== undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `testCheckStorageFromUi0008 assert1 value=${actual1}`);
      expect(actual1).assertTrue();
      if (active !== undefined) {
        const context: common.Context | undefined = await entrySandboxContext();
        const actual2: boolean = context !== undefined;
        hilog.info(DOMAIN, TAG, '%{public}s', `testCheckStorageFromUi0008 assert2 value=${actual2}`);
        expect(actual2).assertTrue();
        if (context !== undefined) {
          const actual3: boolean = await clickId(active, MENU_ID_STORAGE_CREATE);
          hilog.info(DOMAIN, TAG, '%{public}s', `testCheckStorageFromUi0008 assert3 clickId=${actual3}`);
          expect(actual3).assertTrue();
          await sleep(TOAST_WAIT_MS);
          const actual4: boolean = await clickId(active, MENU_ID_STORAGE_CHECK);
          hilog.info(DOMAIN, TAG, '%{public}s', `testCheckStorageFromUi0008 assert4 clickId=${actual4}`);
          expect(actual4).assertTrue();
          const actual5: boolean = await hasText(active, getStringByName('search_File_Success'), TOAST_WAIT_MS);
          hilog.info(DOMAIN, TAG, '%{public}s', `testCheckStorageFromUi0008 assert5 hasText=${actual5}`);
          expect(actual5).assertTrue();
          const actual6: number = countMissing(context).length;
          hilog.info(DOMAIN, TAG, '%{public}s', `testCheckStorageFromUi0008 assert6 countMissing.length=${actual6}`);
          expect(actual6).assertEqual(0);
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckStorageFromUi0008 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_UI_SMOKE_0009
     * @tc.name      testOpenNewAbilityPage0009
     * @tc.desc      点“设置 StartOptions 启动 Ability”打开 New 页面
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOpenNewAbilityPage0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenNewAbilityPage0009 begin');
      await ensureHome();
      const active: Driver | undefined = await openDriver();
      const actual1: boolean = active !== undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `testOpenNewAbilityPage0009 assert1 value=${actual1}`);
      expect(actual1).assertTrue();
      if (active !== undefined) {
        await sleep(PAGE_SWITCH_MS);
        const actual2: boolean = await clickId(active, MENU_ID_START_OPTIONS);
        hilog.info(DOMAIN, TAG, '%{public}s', `testOpenNewAbilityPage0009 assert2 clickId=${actual2}`);
        expect(actual2).assertTrue();
        await sleep(PAGE_SWITCH_MS);
        const actual3: boolean = await hasText(active, getStringByName('NewAbility_label'), TOAST_WAIT_MS);
        hilog.info(DOMAIN, TAG, '%{public}s', `testOpenNewAbilityPage0009 assert3 hasText=${actual3}`);
        expect(actual3).assertTrue();
        const actual4: boolean = await hasId(active, PAGE_ID_NEW_BACK);
        hilog.info(DOMAIN, TAG, '%{public}s', `testOpenNewAbilityPage0009 assert4 hasId=${actual4}`);
        expect(actual4).assertTrue();
        const actual5: string = getAbilityName(await getTopAbility());
        hilog.info(DOMAIN, TAG, '%{public}s', `testOpenNewAbilityPage0009 assert5 getAbilityName=${actual5}`);
        expect(actual5).assertEqual(NEW_ABILITY);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenNewAbilityPage0009 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_UI_SMOKE_0010
     * @tc.name      testNewPageBackReturnsHome0010
     * @tc.desc      New 页面点返回后回到首页且栈顶恢复 EntryAbility
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNewPageBackReturnsHome0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNewPageBackReturnsHome0010 begin');
      await ensureHome();
      const active: Driver | undefined = await openDriver();
      const actual1: boolean = active !== undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `testNewPageBackReturnsHome0010 assert1 value=${actual1}`);
      expect(actual1).assertTrue();
      if (active !== undefined) {
        await sleep(PAGE_SWITCH_MS);
        const actual2: boolean = await clickId(active, MENU_ID_START_OPTIONS);
        hilog.info(DOMAIN, TAG, '%{public}s', `testNewPageBackReturnsHome0010 assert2 clickId=${actual2}`);
        expect(actual2).assertTrue();
        await sleep(PAGE_SWITCH_MS);
        const actual3: boolean = await clickId(active, PAGE_ID_NEW_BACK);
        hilog.info(DOMAIN, TAG, '%{public}s', `testNewPageBackReturnsHome0010 assert3 clickId=${actual3}`);
        expect(actual3).assertTrue();
        await sleep(PAGE_SWITCH_MS);
        const actual4: boolean = await hasId(active, MENU_ID_LANGUAGE_ZH);
        hilog.info(DOMAIN, TAG, '%{public}s', `testNewPageBackReturnsHome0010 assert4 hasId=${actual4}`);
        expect(actual4).assertTrue();
        const actual5: string = getAbilityName(await getTopAbility());
        hilog.info(DOMAIN, TAG, '%{public}s', `testNewPageBackReturnsHome0010 assert5 getAbilityName=${actual5}`);
        expect(actual5).assertEqual(ENTRY_ABILITY);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNewPageBackReturnsHome0010 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_UI_SMOKE_0011
     * @tc.name      testImplicitNoPopupStaysOnHome0011
     * @tc.desc      静默隐式启动失败后仍停留在首页，不跳转页面
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testImplicitNoPopupStaysOnHome0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testImplicitNoPopupStaysOnHome0011 begin');
      await ensureHome();
      const active: Driver | undefined = await openDriver();
      const actual1: boolean = active !== undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `testImplicitNoPopupStaysOnHome0011 assert1 value=${actual1}`);
      expect(actual1).assertTrue();
      if (active !== undefined) {
        const actual2: boolean = await clickId(active, MENU_ID_IMPLICIT_NO_POPUP);
        hilog.info(DOMAIN, TAG, '%{public}s', `testImplicitNoPopupStaysOnHome0011 assert2 clickId=${actual2}`);
        expect(actual2).assertTrue();
        await sleep(LAUNCH_WAIT_MS);
        // 真机实测：hilog 里隐式启动返回 16000019，但 Driver 仍能查到已销毁 New 页面的节点，
        // 所以不用“返回按钮不存在”判定，改用首页内容仍在 + 栈顶仍是首页来证明页面没被顶掉。
        const actual3: boolean = await hasId(active, MENU_ID_LANGUAGE_ZH);
        hilog.info(DOMAIN, TAG, '%{public}s', `testImplicitNoPopupStaysOnHome0011 assert3 hasId=${actual3}`);
        expect(actual3).assertTrue();
        const actual4: boolean = await hasId(active, MENU_ID_STORAGE_CREATE);
        hilog.info(DOMAIN, TAG, '%{public}s', `testImplicitNoPopupStaysOnHome0011 assert4 hasId=${actual4}`);
        expect(actual4).assertTrue();
        const actual5: string = getAbilityName(await getTopAbility());
        hilog.info(DOMAIN, TAG, '%{public}s', `testImplicitNoPopupStaysOnHome0011 assert5 getAbilityName=${actual5}`);
        expect(actual5).assertEqual(ENTRY_ABILITY);
        const actual6: boolean = getAbilityName(await getTopAbility()) !== NEW_ABILITY;
        hilog.info(DOMAIN, TAG, '%{public}s', `testImplicitNoPopupStaysOnHome0011 assert6 getAbilityName=${actual6}`);
        expect(actual6).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testImplicitNoPopupStaysOnHome0011 end');
      done();
    })
  })
}

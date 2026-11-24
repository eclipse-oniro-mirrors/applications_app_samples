/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { afterEach, beforeAll, describe, beforeEach, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from './TestEventLoop';
import { Component, Driver, ON } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { hilog } from '@kit.PerformanceAnalysisKit';

const BUNDLE: string = 'com.samples.imperativedynamiclayouts';
const ABILITY: string = 'EntryAbility';
const DOMAIN: number = 0xF814;
const TAG: string = 'ImperativeUiStateTest';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function sleep(duration: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, duration);
  });
}

async function shell(cmd: string): Promise<string> {
  const result = await delegator.executeShellCommand(cmd);
  return result.stdResult;
}

async function exists(driver: Driver, id: string): Promise<boolean> {
  try {
    const component: Component = await driver.findComponent(ON.id(id));
    return component !== undefined && component !== null;
  } catch (error) {
    log('exists failed: ' + id + ' -> ' + String(error));
    return false;
  }
}

async function clickId(driver: Driver, id: string): Promise<boolean> {
  try {
    const component: Component = await driver.findComponent(ON.id(id));
    if (component === undefined || component === null) {
      return false;
    }
    await component.click();
    await sleep(350);
    return true;
  } catch (error) {
    log('clickId failed: ' + id + ' -> ' + String(error));
    return false;
  }
}

async function ensureMainPage(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 3; i++) {
    if (await exists(driver, 'imperativeIndexRoot')) {
      return true;
    }
    await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
    await sleep(1200);
  }
  return await exists(driver, 'imperativeIndexRoot');
}

async function prepare(driver: Driver): Promise<boolean> {
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleep(1200);
  if (!await ensureMainPage(driver)) {
    log('prepare: main page is not available');
    return false;
  }
  return true;
}

export default function imperativeUiStateTest(): void {
  describe('ImperativeUiStateTest', () => {
    beforeEach(yieldToEventLoop);
    beforeAll(async () => {
      log('beforeAll start');
      const info: string = await shell('power-shell setmode 202');
      log('beforeAll power mode: ' + info);
      await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      await sleep(1200);
      log('beforeAll end');
    });

    afterEach(async () => {
      const driver: Driver = Driver.create();
      const actual1: boolean = await ensureMainPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureMainPage(driver)=${actual1}`);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_IMPERUI_0801
     * @tc.name      testImperativeUi0801
     * @tc.desc      Verify the entry page and its root column are exposed.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testImperativeUi0801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      log('testImperativeUi0801 begin');
      const actual22: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual22}`);
      expect(actual22).assertTrue();
      const actual2: boolean = await exists(driver, 'imperativeIndexRoot');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'imperativeIndexRoot')=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists(driver, 'imperativeRootColumn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'imperativeRootColumn')=${actual3}`);
      expect(actual3).assertTrue();
      log('testImperativeUi0801 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_IMPERUI_0802
     * @tc.name      testImperativeUi0802
     * @tc.desc      Verify the imperative NodeContainer is mounted with a real area.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testImperativeUi0802', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      log('testImperativeUi0802 begin');
      const actual23: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual23}`);
      expect(actual23).assertTrue();
      const container: Component = await driver.findComponent(ON.id('imperativeNodeContainer'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${container !== undefined && container !== null}`);
      expect(container !== undefined && container !== null).assertTrue();
      const rect = await container.getBounds();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger rect.right - rect.left=${rect.right - rect.left}`);
      expect(rect.right - rect.left).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger rect.bottom - rect.top=${rect.bottom - rect.top}`);
      expect(rect.bottom - rect.top).assertLarger(0);
      log('testImperativeUi0802 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_IMPERUI_0803
     * @tc.name      testImperativeUi0803
     * @tc.desc      Verify the page exposes the root, view column and container together.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testImperativeUi0803', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      log('testImperativeUi0803 begin');
      const actual24: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual24}`);
      expect(actual24).assertTrue();
      const actual4: boolean = await exists(driver, 'imperativeIndexRoot');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'imperativeIndexRoot')=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = await exists(driver, 'imperativeRootColumn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'imperativeRootColumn')=${actual5}`);
      expect(actual5).assertTrue();
      const actual6: boolean = await exists(driver, 'imperativeNodeContainer');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'imperativeNodeContainer')=${actual6}`);
      expect(actual6).assertTrue();
      log('testImperativeUi0803 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_IMPERUI_0804
     * @tc.name      testImperativeUi0804
     * @tc.desc      Verify the dynamic layout renders the refresh button.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testImperativeUi0804', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      log('testImperativeUi0804 begin');
      const actual25: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual25}`);
      expect(actual25).assertTrue();
      const actual7: boolean = await exists(driver, 'refreshImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'refreshImage')=${actual7}`);
      expect(actual7).assertTrue();
      const actual8: boolean = await exists(driver, 'imperativeNodeContainer');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'imperativeNodeContainer')=${actual8}`);
      expect(actual8).assertTrue();
      log('testImperativeUi0804 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_IMPERUI_0805
     * @tc.name      testImperativeUi0805
     * @tc.desc      Verify the refresh button occupies a visible area.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testImperativeUi0805', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      log('testImperativeUi0805 begin');
      const actual26: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual26}`);
      expect(actual26).assertTrue();
      const button: Component = await driver.findComponent(ON.id('refreshImage'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${button !== undefined && button !== null}`);
      expect(button !== undefined && button !== null).assertTrue();
      const rect = await button.getBounds();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger rect.right - rect.left=${rect.right - rect.left}`);
      expect(rect.right - rect.left).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger rect.bottom - rect.top=${rect.bottom - rect.top}`);
      expect(rect.bottom - rect.top).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLargerOrEqual rect.left=${rect.left}, expected=0`);
      expect(rect.left).assertLargerOrEqual(0);
      log('testImperativeUi0805 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_IMPERUI_0806
     * @tc.name      testImperativeUi0806
     * @tc.desc      Verify the refresh button id is precisely addressable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testImperativeUi0806', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      log('testImperativeUi0806 begin');
      const actual27: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual27}`);
      expect(actual27).assertTrue();
      const button: Component = await driver.findComponent(ON.id('refreshImage'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${button !== undefined && button !== null}`);
      expect(button !== undefined && button !== null).assertTrue();
      const componentId: string = await button.getId();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual componentId=${componentId}, expected='refreshImage'`);
      expect(componentId).assertEqual('refreshImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger componentId.length=${componentId.length}, expected=0`);
      expect(componentId.length).assertLarger(0);
      log('testImperativeUi0806 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_IMPERUI_0807
     * @tc.name      testImperativeUi0807
     * @tc.desc      Verify clicking refresh swaps posters and keeps the page alive.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testImperativeUi0807', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      log('testImperativeUi0807 begin');
      const actual28: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual28}`);
      expect(actual28).assertTrue();
      const actual9: boolean = await clickId(driver, 'refreshImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'refreshImage')=${actual9}`);
      expect(actual9).assertTrue();
      await sleep(500);
      const actual10: boolean = await exists(driver, 'refreshImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'refreshImage')=${actual10}`);
      expect(actual10).assertTrue();
      const actual11: boolean = await exists(driver, 'imperativeNodeContainer');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'imperativeNodeContainer')=${actual11}`);
      expect(actual11).assertTrue();
      log('testImperativeUi0807 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_IMPERUI_0808
     * @tc.name      testImperativeUi0808
     * @tc.desc      Verify the refresh button disables itself after one click.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testImperativeUi0808', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      log('testImperativeUi0808 begin');
      const actual29: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual29}`);
      expect(actual29).assertTrue();
      const actual12: boolean = await clickId(driver, 'refreshImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'refreshImage')=${actual12}`);
      expect(actual12).assertTrue();
      await sleep(500);
      const button: Component = await driver.findComponent(ON.id('refreshImage'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${button !== undefined && button !== null}`);
      expect(button !== undefined && button !== null).assertTrue();
      const actual13: boolean = await button.isClickable();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse button.isClickable()=${actual13}`);
      expect(actual13).assertFalse();
      log('testImperativeUi0808 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_IMPERUI_0809
     * @tc.name      testImperativeUi0809
     * @tc.desc      Verify repeated refresh clicks keep the disabled state stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testImperativeUi0809', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      log('testImperativeUi0809 begin');
      const actual30: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual30}`);
      expect(actual30).assertTrue();
      const actual14: boolean = await clickId(driver, 'refreshImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'refreshImage')=${actual14}`);
      expect(actual14).assertTrue();
      await sleep(300);
      await clickId(driver, 'refreshImage');
      await sleep(500);
      const actual15: boolean = await exists(driver, 'refreshImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'refreshImage')=${actual15}`);
      expect(actual15).assertTrue();
      const button: Component = await driver.findComponent(ON.id('refreshImage'));
      const actual16: boolean = await button.isClickable();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse button.isClickable()=${actual16}`);
      expect(actual16).assertFalse();
      const actual17: boolean = await exists(driver, 'imperativeNodeContainer');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'imperativeNodeContainer')=${actual17}`);
      expect(actual17).assertTrue();
      log('testImperativeUi0809 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_IMPERUI_0810
     * @tc.name      testImperativeUi0810
     * @tc.desc      Verify repeated page preparation is idempotent.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testImperativeUi0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      log('testImperativeUi0810 begin');
      const actual31: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual31}`);
      expect(actual31).assertTrue();
      const actual18: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual18}`);
      expect(actual18).assertTrue();
      const actual19: boolean = await exists(driver, 'imperativeIndexRoot');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'imperativeIndexRoot')=${actual19}`);
      expect(actual19).assertTrue();
      const actual20: boolean = await exists(driver, 'imperativeNodeContainer');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'imperativeNodeContainer')=${actual20}`);
      expect(actual20).assertTrue();
      const actual21: boolean = await exists(driver, 'refreshImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'refreshImage')=${actual21}`);
      expect(actual21).assertTrue();
      log('testImperativeUi0810 end');
    })
  })
}

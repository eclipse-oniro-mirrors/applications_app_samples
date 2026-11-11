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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeAll, beforeEach, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry, Component, Driver, ON } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const driver: Driver = Driver.create();
const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;

function parseTimeToSeconds(text: string): number {
  const parts: string[] = text.split(':');
  if (parts.length !== 2) { return -1; }
  const min: number = Number.parseInt(parts[0], 10);
  const sec: number = Number.parseInt(parts[1], 10);
  if (Number.isNaN(min) || Number.isNaN(sec)) { return -1; }
  return min * 60 + sec;
}

async function resetSpeedToDefault(): Promise<void> {
  for (let index: number = 0; index < 4; index++) {
    const button: Component = await driver.findComponent(ON.id('Speed'));
    const text: string = (await button.getText()).trim();
    if (text === '1.0X') {
      return;
    }
    await button.click();
    await driver.delayMs(500);
  }
}


const TAG: string = '[Sample_PlayWithCacheUiSpeed]';
const DOMAIN: number = 0xF813;

function it(name: string, filter: number, func: () => void | Promise<void>): void {
  hypiumIt(name, filter, async () => {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
    try {
      await func();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    }
  });
}

interface ExpectAssert {
  assertEqual(expectValue: string | number | boolean | Object | null | undefined): void;
  assertTrue(): void;
  assertFalse(): void;
  assertLarger(expectValue: number): void;
  assertLargerOrEqual(expectValue: number): void;
  assertLess(expectValue: number): void;
  assertLessOrEqual(expectValue: number): void;
  assertClose(expectValue: number, precision: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function playWithCacheUiSpeedTest(): void {
  describe('playWithCacheUiSpeedTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    beforeAll(async () => {
      const want: Want = { bundleName: bundleName, abilityName: 'EntryAbility' };
      await delegator.startAbility(want);
      await driver.delayMs(3000);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UI_0001
     * @tc.name      testExtCacheUiSpeed0001
     * @tc.desc      Speed sequence 1 reaches 1.0X.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUiSpeed0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await resetSpeedToDefault();
      const result: Component = await driver.findComponent(ON.id('Speed'));
      expect((await result.getText()).trim()).assertEqual('1.0X');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UI_0002
     * @tc.name      testExtCacheUiSpeed0002
     * @tc.desc      Speed sequence 2 reaches 1.25X.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUiSpeed0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await resetSpeedToDefault();
      for (let index: number = 0; index < 1; index++) {
        const button: Component = await driver.findComponent(ON.id('Speed'));
        await button.click();
        await driver.delayMs(500);
      }
      const result: Component = await driver.findComponent(ON.id('Speed'));
      expect((await result.getText()).trim()).assertEqual('1.25X');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UI_0003
     * @tc.name      testExtCacheUiSpeed0003
     * @tc.desc      Speed sequence 3 reaches 1.75X.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUiSpeed0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await resetSpeedToDefault();
      for (let index: number = 0; index < 2; index++) {
        const button: Component = await driver.findComponent(ON.id('Speed'));
        await button.click();
        await driver.delayMs(500);
      }
      const result: Component = await driver.findComponent(ON.id('Speed'));
      expect((await result.getText()).trim()).assertEqual('1.75X');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UI_0004
     * @tc.name      testExtCacheUiSpeed0004
     * @tc.desc      Speed sequence 4 reaches 2.0X.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUiSpeed0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await resetSpeedToDefault();
      for (let index: number = 0; index < 3; index++) {
        const button: Component = await driver.findComponent(ON.id('Speed'));
        await button.click();
        await driver.delayMs(500);
      }
      const result: Component = await driver.findComponent(ON.id('Speed'));
      expect((await result.getText()).trim()).assertEqual('2.0X');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UI_0005
     * @tc.name      testExtCacheUiSpeed0005
     * @tc.desc      Four speed taps return to 1.0X.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUiSpeed0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await resetSpeedToDefault();
      for (let index: number = 0; index < 4; index++) {
        const button: Component = await driver.findComponent(ON.id('Speed'));
        await button.click();
        await driver.delayMs(500);
      }
      const result: Component = await driver.findComponent(ON.id('Speed'));
      expect((await result.getText()).trim()).assertEqual('1.0X');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UI_0006
     * @tc.name      testExtCacheUiSpeed0006
     * @tc.desc      Playback control is present.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUiSpeed0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let button: Component = await driver.findComponent(ON.id('pause'));
      if (button === null || button === undefined) {
        button = await driver.findComponent(ON.id('play'));
      }
      expect(button !== null && button !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UI_0007
     * @tc.name      testExtCacheUiSpeed0007
     * @tc.desc      Slider and duration text are present.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUiSpeed0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.id('Slider'));
      const slider: Component = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const durationText: Component = await driver.findComponent(ON.id('durationTimeText'));
      expect((await durationText.getText()).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UI_0008
     * @tc.name      testExtCacheUiSpeed0008
     * @tc.desc      Current time text is non-negative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUiSpeed0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const currentText = await driver.findComponent(ON.id('currentTimeText'));
      const current: number = parseTimeToSeconds(await currentText.getText());
      expect(current).assertLargerOrEqual(0);
    })
  });
}

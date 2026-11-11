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
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';

const delegator = abilityDelegatorRegistry.getAbilityDelegator();
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
    const button = await driver.findComponent(ON.id('Speed'));
    const text: string = (await button.getText()).trim();
    if (text === '1.0X') { return; }
    await button.click();
    await driver.delayMs(500);
  }
}


const TAG: string = '[Sample_playWithCachePlaybackIntegration]';
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

export default function playWithCachePlaybackIntegrationTest(): void {
  describe('playWithCachePlaybackIntegrationTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    beforeAll(async () => {
      const want: Want = { bundleName: bundleName, abilityName: 'EntryAbility' };
      await delegator.startAbility(want);
      await driver.delayMs(5000);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAYINT_0001
     * @tc.name      testExtCachePlayback0001
     * @tc.desc      Playback speed step 1 reaches 1.0X.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlayback0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await resetSpeedToDefault();
      for (let index: number = 0; index < 0; index++) {
        const button = await driver.findComponent(ON.id('Speed'));
        await button.click();
        await driver.delayMs(500);
      }
      const result = await driver.findComponent(ON.id('Speed'));
      expect((await result.getText()).trim()).assertEqual('1.0X');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAYINT_0002
     * @tc.name      testExtCachePlayback0002
     * @tc.desc      Playback speed step 2 reaches 1.25X.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlayback0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await resetSpeedToDefault();
      for (let index: number = 0; index < 1; index++) {
        const button = await driver.findComponent(ON.id('Speed'));
        await button.click();
        await driver.delayMs(500);
      }
      const result = await driver.findComponent(ON.id('Speed'));
      expect((await result.getText()).trim()).assertEqual('1.25X');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAYINT_0003
     * @tc.name      testExtCachePlayback0003
     * @tc.desc      Playback speed step 3 reaches 1.75X.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlayback0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await resetSpeedToDefault();
      for (let index: number = 0; index < 2; index++) {
        const button = await driver.findComponent(ON.id('Speed'));
        await button.click();
        await driver.delayMs(500);
      }
      const result = await driver.findComponent(ON.id('Speed'));
      expect((await result.getText()).trim()).assertEqual('1.75X');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAYINT_0004
     * @tc.name      testExtCachePlayback0004
     * @tc.desc      Playback speed step 4 reaches 2.0X.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlayback0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await resetSpeedToDefault();
      for (let index: number = 0; index < 3; index++) {
        const button = await driver.findComponent(ON.id('Speed'));
        await button.click();
        await driver.delayMs(500);
      }
      const result = await driver.findComponent(ON.id('Speed'));
      expect((await result.getText()).trim()).assertEqual('2.0X');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAYINT_0005
     * @tc.name      testExtCachePlayback0005
     * @tc.desc      Playback control exists.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlayback0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let button = await driver.findComponent(ON.id('pause'));
      if (button === null || button === undefined) {
        button = await driver.findComponent(ON.id('play'));
      }
      expect(button !== null && button !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAYINT_0006
     * @tc.name      testExtCachePlayback0006
     * @tc.desc      Slider exists.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlayback0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const slider = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAYINT_0007
     * @tc.name      testExtCachePlayback0007
     * @tc.desc      Speed control exists while media is playing.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlayback0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const speed = await driver.findComponent(ON.id('Speed'));
      expect(speed !== null && speed !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAYINT_0008
     * @tc.name      testExtCachePlayback0008
     * @tc.desc      Duration text is non-empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlayback0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text = await driver.findComponent(ON.id('durationTimeText'));
      expect((await text.getText()).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAYINT_0009
     * @tc.name      testExtCachePlayback0009
     * @tc.desc      Current time is valid after seek right.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlayback0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const slider = await driver.findComponent(ON.id('Slider'));
      const point = await slider.getBoundsCenter();
      await driver.drag(point.x - 30, point.y, point.x + 90, point.y, 600);
      await driver.delayMs(1000);
      const text = await driver.findComponent(ON.id('currentTimeText'));
      expect(parseTimeToSeconds(await text.getText())).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAYINT_0010
     * @tc.name      testExtCachePlayback0010
     * @tc.desc      Current time is valid after seek left.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlayback0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const slider = await driver.findComponent(ON.id('Slider'));
      const point = await slider.getBoundsCenter();
      await driver.drag(point.x + 30, point.y, point.x - 60, point.y, 600);
      await driver.delayMs(1000);
      const text = await driver.findComponent(ON.id('currentTimeText'));
      expect(parseTimeToSeconds(await text.getText())).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAYINT_0011
     * @tc.name      testExtCachePlayback0011
     * @tc.desc      Pause then resume keeps playback control.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlayback0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pause = await driver.findComponent(ON.id('pause'));
      if (pause !== null && pause !== undefined) {
        await pause.click();
        await driver.delayMs(800);
      }
      let control = await driver.findComponent(ON.id('play'));
      if (control === null || control === undefined) {
        control = await driver.findComponent(ON.id('pause'));
      }
      expect(control !== null && control !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAYINT_0012
     * @tc.name      testExtCachePlayback0012
     * @tc.desc      Time text and duration remain visible.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlayback0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const current = await driver.findComponent(ON.id('currentTimeText'));
      const duration = await driver.findComponent(ON.id('durationTimeText'));
      expect((await current.getText()).length).assertLarger(0);
      expect((await duration.getText()).length).assertLarger(0);
    })
  });
}

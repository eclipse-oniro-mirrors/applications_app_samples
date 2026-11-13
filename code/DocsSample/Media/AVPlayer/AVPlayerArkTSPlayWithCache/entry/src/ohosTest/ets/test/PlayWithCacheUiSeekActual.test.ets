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


const TAG: string = '[Sample_playWithCacheUiSeekActual]';
const DOMAIN: number = 0xF811;

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

export default function playWithCacheUiSeekActualTest(): void {
  describe('playWithCacheUiSeekActualTest', () => {
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
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UISEEK2_0001
     * @tc.name      testExtCacheUiSeek0001
     * @tc.desc      Speed step 1 reaches 1.0X.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUiSeek0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await resetSpeedToDefault();
      const result = await driver.findComponent(ON.id('Speed'));
      expect((await result.getText()).trim()).assertEqual('1.0X');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UISEEK2_0002
     * @tc.name      testExtCacheUiSeek0002
     * @tc.desc      Speed step 2 reaches 1.25X.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUiSeek0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UISEEK2_0003
     * @tc.name      testExtCacheUiSeek0003
     * @tc.desc      Speed step 3 reaches 1.75X.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUiSeek0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UISEEK2_0004
     * @tc.name      testExtCacheUiSeek0004
     * @tc.desc      Speed step 4 reaches 2.0X.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUiSeek0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UISEEK2_0005
     * @tc.name      testExtCacheUiSeek0005
     * @tc.desc      Speed button is present.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUiSeek0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const component = await driver.findComponent(ON.id('Speed'));
      expect(component !== null && component !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UISEEK2_0006
     * @tc.name      testExtCacheUiSeek0006
     * @tc.desc      Slider is present.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUiSeek0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const component = await driver.findComponent(ON.id('Slider'));
      expect(component !== null && component !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UISEEK2_0007
     * @tc.name      testExtCacheUiSeek0007
     * @tc.desc      current time text is present.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUiSeek0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const component = await driver.findComponent(ON.id('currentTimeText'));
      expect(component !== null && component !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UISEEK2_0008
     * @tc.name      testExtCacheUiSeek0008
     * @tc.desc      duration text is present.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUiSeek0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const component = await driver.findComponent(ON.id('durationTimeText'));
      expect(component !== null && component !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UISEEK2_0009
     * @tc.name      testExtCacheUiSeek0009
     * @tc.desc      Seek drag 1 keeps a valid current time.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUiSeek0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const slider = await driver.findComponent(ON.id('Slider'));
      const point = await slider.getBoundsCenter();
      await driver.drag(point.x - 40, point.y, point.x + 60, point.y, 600);
      await driver.delayMs(1000);
      const current = await driver.findComponent(ON.id('currentTimeText'));
      expect(parseTimeToSeconds(await current.getText())).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UISEEK2_0010
     * @tc.name      testExtCacheUiSeek0010
     * @tc.desc      Seek drag 2 keeps a valid current time.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUiSeek0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const slider = await driver.findComponent(ON.id('Slider'));
      const point = await slider.getBoundsCenter();
      await driver.drag(point.x - 40, point.y, point.x + 70, point.y, 600);
      await driver.delayMs(1000);
      const current = await driver.findComponent(ON.id('currentTimeText'));
      expect(parseTimeToSeconds(await current.getText())).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UISEEK2_0011
     * @tc.name      testExtCacheUiSeek0011
     * @tc.desc      Seek drag 3 keeps a valid current time.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUiSeek0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const slider = await driver.findComponent(ON.id('Slider'));
      const point = await slider.getBoundsCenter();
      await driver.drag(point.x - 40, point.y, point.x + 80, point.y, 600);
      await driver.delayMs(1000);
      const current = await driver.findComponent(ON.id('currentTimeText'));
      expect(parseTimeToSeconds(await current.getText())).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UISEEK2_0012
     * @tc.name      testExtCacheUiSeek0012
     * @tc.desc      Seek drag 4 keeps a valid current time.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUiSeek0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const slider = await driver.findComponent(ON.id('Slider'));
      const point = await slider.getBoundsCenter();
      await driver.drag(point.x - 40, point.y, point.x + 90, point.y, 600);
      await driver.delayMs(1000);
      const current = await driver.findComponent(ON.id('currentTimeText'));
      expect(parseTimeToSeconds(await current.getText())).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UISEEK2_0013
     * @tc.name      testExtCacheUiSeek0013
     * @tc.desc      Time text check 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUiSeek0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text = await driver.findComponent(ON.id('currentTimeText'));
      expect(parseTimeToSeconds(await text.getText())).assertLargerOrEqual(0);
      const duration = await driver.findComponent(ON.id('durationTimeText'));
      expect((await duration.getText()).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UISEEK2_0014
     * @tc.name      testExtCacheUiSeek0014
     * @tc.desc      Time text check 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUiSeek0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text = await driver.findComponent(ON.id('currentTimeText'));
      expect(parseTimeToSeconds(await text.getText())).assertLargerOrEqual(0);
      const duration = await driver.findComponent(ON.id('durationTimeText'));
      expect((await duration.getText()).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UISEEK2_0015
     * @tc.name      testExtCacheUiSeek0015
     * @tc.desc      Time text check 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUiSeek0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text = await driver.findComponent(ON.id('currentTimeText'));
      expect(parseTimeToSeconds(await text.getText())).assertLargerOrEqual(0);
      const duration = await driver.findComponent(ON.id('durationTimeText'));
      expect((await duration.getText()).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UISEEK2_0016
     * @tc.name      testExtCacheUiSeek0016
     * @tc.desc      Time text check 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUiSeek0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text = await driver.findComponent(ON.id('currentTimeText'));
      expect(parseTimeToSeconds(await text.getText())).assertLargerOrEqual(0);
      const duration = await driver.findComponent(ON.id('durationTimeText'));
      expect((await duration.getText()).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UISEEK2_0017
     * @tc.name      testExtCacheUiSeek0017
     * @tc.desc      Playback control check 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUiSeek0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let button = await driver.findComponent(ON.id('pause'));
      if (button === null || button === undefined) {
        button = await driver.findComponent(ON.id('play'));
      }
      expect(button !== null && button !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UISEEK2_0018
     * @tc.name      testExtCacheUiSeek0018
     * @tc.desc      Playback control check 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUiSeek0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let button = await driver.findComponent(ON.id('pause'));
      if (button === null || button === undefined) {
        button = await driver.findComponent(ON.id('play'));
      }
      expect(button !== null && button !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UISEEK2_0019
     * @tc.name      testExtCacheUiSeek0019
     * @tc.desc      Playback control check 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUiSeek0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let button = await driver.findComponent(ON.id('pause'));
      if (button === null || button === undefined) {
        button = await driver.findComponent(ON.id('play'));
      }
      expect(button !== null && button !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UISEEK2_0020
     * @tc.name      testExtCacheUiSeek0020
     * @tc.desc      Playback control check 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUiSeek0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let button = await driver.findComponent(ON.id('pause'));
      if (button === null || button === undefined) {
        button = await driver.findComponent(ON.id('play'));
      }
      expect(button !== null && button !== undefined).assertTrue();
    })
  });
}

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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeAll, beforeEach, TestType, Size, Level, Assert } from '@ohos/hypium';
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


const TAG: string = '[Sample_playWithCacheUiSeek]';
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

function expect(actual: string | number | boolean | Object | null | undefined): Assert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function playWithCacheUiSeekTest(): void {
  describe('playWithCacheUiSeekTest', () => {
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
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UISEEK_0001
     * @tc.name      testExtCacheUiSeek0001
     * @tc.desc      Speed control step 1 reaches 1.0X.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUiSeek0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UISEEK_0002
     * @tc.name      testExtCacheUiSeek0002
     * @tc.desc      Speed control step 2 reaches 1.25X.
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
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UISEEK_0003
     * @tc.name      testExtCacheUiSeek0003
     * @tc.desc      Speed control step 3 reaches 1.75X.
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
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UISEEK_0004
     * @tc.name      testExtCacheUiSeek0004
     * @tc.desc      Speed control step 4 reaches 2.0X.
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
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UISEEK_0005
     * @tc.name      testExtCacheUiSeek0005
     * @tc.desc      Speed button is present.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUiSeek0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const speed = await driver.findComponent(ON.id('Speed'));
      expect(speed !== null && speed !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UISEEK_0006
     * @tc.name      testExtCacheUiSeek0006
     * @tc.desc      Slider is present.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUiSeek0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const slider = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UISEEK_0007
     * @tc.name      testExtCacheUiSeek0007
     * @tc.desc      Duration text is present and non-empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUiSeek0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text = await driver.findComponent(ON.id('durationTimeText'));
      expect((await text.getText()).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UISEEK_0008
     * @tc.name      testExtCacheUiSeek0008
     * @tc.desc      Current time text is non-negative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUiSeek0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text = await driver.findComponent(ON.id('currentTimeText'));
      expect(parseTimeToSeconds(await text.getText())).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UISEEK_0009
     * @tc.name      testExtCacheUiSeek0009
     * @tc.desc      Current time text is present.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUiSeek0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const view = await driver.findComponent(ON.id('currentTimeText'));
      expect(view !== null && view !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UISEEK_0010
     * @tc.name      testExtCacheUiSeek0010
     * @tc.desc      Playback control is present.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUiSeek0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let button = await driver.findComponent(ON.id('pause'));
      if (button === null || button === undefined) {
        button = await driver.findComponent(ON.id('play'));
      }
      expect(button !== null && button !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UISEEK_0011
     * @tc.name      testExtCacheUiSeek0011
     * @tc.desc      Speed label is one of four supported values.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUiSeek0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const button = await driver.findComponent(ON.id('Speed'));
      const text: string = (await button.getText()).trim();
      expect(['1.0X', '1.25X', '1.75X', '2.0X'].indexOf(text) >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_UISEEK_0012
     * @tc.name      testExtCacheUiSeek0012
     * @tc.desc      Speed control stays in range after reset.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUiSeek0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await resetSpeedToDefault();
      const button = await driver.findComponent(ON.id('Speed'));
      expect((await button.getText()).trim()).assertEqual('1.0X');
    })
  });
}

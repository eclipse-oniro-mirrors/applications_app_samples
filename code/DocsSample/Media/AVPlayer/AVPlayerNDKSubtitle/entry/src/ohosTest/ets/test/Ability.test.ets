/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { Component, Driver, ON, abilityDelegatorRegistry } from '@kit.TestKit';

export default function abilityTest(): void {
  const TAG = '[Sample_AVPlayerArkTS]';
  const DOMAIN = 0xF811;
  const driver = Driver.create();
  const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;
  const DELAY_UI_SETTLE: number = 3000;
  const DELAY_PLAY_SETTLE: number = 2000;
  const DELAY_SHORT_SETTLE: number = 1000;
  const DELAY_EXIT_SETTLE: number = 8000;
  const DRAG_DURATION: number = 800;
  const DRAG_OFFSET: number = 50;

  describe('AVPlayerNATIVESubtitleTest', () => {

    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_0100
     * @tc.name      testAVPlayerNATIVESubtitleStart0001
     * @tc.desc      Start the target ability and verify it starts without exception.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAVPlayerNATIVESubtitleStart0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAVPlayerNATIVESubtitleStart0001 begin');

      try {
        await abilityDelegator.startAbility({
          bundleName: bundleName,
          abilityName: 'EntryAbility'
        });
      } catch (exception) {
        hilog.error(DOMAIN, TAG, '%{public}s', `testAVPlayerNATIVESubtitleStart0001 exception = ${JSON.stringify(exception)}`);
        expect().assertFail();
      }

      await driver.delayMs(DELAY_UI_SETTLE);
      const topAbility = await abilityDelegator.getCurrentTopAbility();
      expect(topAbility.context.abilityInfo.name).assertEqual('EntryAbility');
      done();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAVPlayerNATIVESubtitleStart0001 end');
    })

    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_0200
     * @tc.name      testAVPlayerNATIVESubtitleSlider0002
     * @tc.desc      Play, pause and drag the progress slider, verify the image component exists.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAVPlayerNATIVESubtitleSlider0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAVPlayerNATIVESubtitleSlider0002 begin');

      await driver.delayMs(DELAY_PLAY_SETTLE);
      await driver.assertComponentExist(ON.type('Image'));
      const stack: Component = await driver.findComponent(ON.type('Image'));
      const topAbility = await abilityDelegator.getCurrentTopAbility();
      expect(topAbility.context.abilityInfo.name).assertEqual('EntryAbility');

      await stack.click();
      await driver.delayMs(DELAY_UI_SETTLE);

      await driver.assertComponentExist(ON.id('Slider'));
      const slider: Component = await driver.findComponent(ON.id('Slider'));
      const point = await slider.getBoundsCenter();
      await driver.drag(point.x - DRAG_OFFSET, point.y, point.x + DRAG_OFFSET, point.y, DRAG_DURATION);
      await driver.delayMs(DELAY_SHORT_SETTLE);

      await stack.click();
      await driver.delayMs(DELAY_SHORT_SETTLE);

      done();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAVPlayerNATIVESubtitleSlider0002 end');
    })

    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_0300
     * @tc.name      testAVPlayerNATIVESubtitleExit0003
     * @tc.desc      Pause playback before exit and verify the image component exists.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAVPlayerNATIVESubtitleExit0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAVPlayerNATIVESubtitleExit0003 begin');

      await driver.delayMs(DELAY_EXIT_SETTLE);
      await driver.assertComponentExist(ON.type('Image'));
      const stack: Component = await driver.findComponent(ON.type('Image'));
      const topAbility = await abilityDelegator.getCurrentTopAbility();
      expect(topAbility.context.abilityInfo.name).assertEqual('EntryAbility');
      await stack.click();
      await driver.delayMs(DELAY_PLAY_SETTLE);

      done();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAVPlayerNATIVESubtitleExit0003 end');
    })
  })
}
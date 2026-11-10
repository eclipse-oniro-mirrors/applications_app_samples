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
import { Driver, ON } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

export default function abilityTest(): void {
  const TAG = '[Sample_AVPlayerArkTS]';
  const DOMAIN = 0xF811;
  const driver = Driver.create();
  const abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  const bundleName = AbilityDelegatorRegistry.getArguments().bundleName;

  describe('AVPlayerNDKSubtitleTest', () => {

    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_0100
     * @tc.name      testAVPlayerNDKSubtitleStart0001
     * @tc.desc      Start the target ability and verify it starts without exception.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAVPlayerNDKSubtitleStart0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      console.info(TAG, 'testAVPlayerNDKSubtitleStart0001 begin');

      try {
        await abilityDelegator.startAbility({
          bundleName: bundleName,
          abilityName: 'EntryAbility'
        });
      } catch (exception) {
        hilog.error(DOMAIN, TAG, `testAVPlayerNDKSubtitleStart0001 exception = ${JSON.stringify(exception)}`);
        expect().assertFail();
      }

      await driver.delayMs(3000);
      let topAbility = await abilityDelegator.getCurrentTopAbility();
      expect(topAbility.context.abilityInfo.name).assertEqual('EntryAbility');
      done();
      console.info(TAG, 'testAVPlayerNDKSubtitleStart0001 end');
    })

    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_0200
     * @tc.name      testAVPlayerNDKSubtitleSlider0002
     * @tc.desc      Play, pause and drag the progress slider, verify the image component exists.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAVPlayerNDKSubtitleSlider0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      hilog.info(DOMAIN, TAG, 'testAVPlayerNDKSubtitleSlider0002 begin');

      await driver.delayMs(2000);
      await driver.assertComponentExist(ON.type('Image'));
      let stack = await driver.findComponent(ON.type('Image'));
      let topAbility = await abilityDelegator.getCurrentTopAbility();
      expect(topAbility.context.abilityInfo.name).assertEqual('EntryAbility');

      await stack.click();
      await driver.delayMs(3000);

      await driver.assertComponentExist(ON.id('Slider'));
      let Slider = await driver.findComponent(ON.id('Slider'));
      let point = await Slider.getBoundsCenter();
      await driver.drag(point.x - 50, point.y, point.x + 50, point.y, 800);
      await driver.delayMs(1000);

      await stack.click();
      await driver.delayMs(1000);

      done();
      hilog.info(DOMAIN, TAG, 'Slider_001 end');
      hilog.info(DOMAIN, TAG, 'testAVPlayerNDKSubtitleSlider0002 end');
    })

    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_0300
     * @tc.name      testAVPlayerNDKSubtitleExit0003
     * @tc.desc      Pause playback before exit and verify the image component exists.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAVPlayerNDKSubtitleExit0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      hilog.info(DOMAIN, TAG, 'testAVPlayerNDKSubtitleExit0003 begin');

      await driver.delayMs(8000);
      await driver.assertComponentExist(ON.type('Image'));
      let stack = await driver.findComponent(ON.type('Image'));
      let topAbility = await abilityDelegator.getCurrentTopAbility();
      expect(topAbility.context.abilityInfo.name).assertEqual('EntryAbility');
      await stack.click();
      await driver.delayMs(2000);

      done();
      hilog.info(DOMAIN, TAG, 'testAVPlayerNDKSubtitleExit0003 end');
    })
  })
}
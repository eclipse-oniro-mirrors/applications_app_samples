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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, it, expect, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import { abilityDelegatorRegistry, Component, Driver, ON } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_MovingPhotoView_TextMatrix]';
const BUNDLE_NAME: string = 'com.example.movingphotoviewsample';
const ENTRY_ABILITY: string = 'EntryAbility';
const PLAY_TEXT: string = 'PLAY';
const STOP_TEXT: string = 'STOP';
const PLAYING_TEXT: string = '开始播放';
const STOPPED_TEXT: string = '停止播放';
const LOADED_TEXT: string = '动态照片已加载，长按可播放';
const DELEGATOR = abilityDelegatorRegistry.getAbilityDelegator();

function delay(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, ms);
  });
}

export default function movingPhotoTextMatrixTest() {
  describe('MovingPhotoTextMatrixTest', () => {
    let driver: Driver;

    beforeAll(async () => {
      const want: Want = {
        bundleName: BUNDLE_NAME,
        abilityName: ENTRY_ABILITY
      };
      await DELEGATOR.startAbility(want);
      await delay(2500);
      driver = await Driver.create();
    })

    /**
     * @tc.name   testTextMatrix0001
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0001
     * @tc.desc   Test the loaded message. Text matrix case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0001 begin');
      const loaded: Component = await driver.findComponent(ON.text(LOADED_TEXT));
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(loaded !== null || playing !== null || stopped !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testTextMatrix0001 end');
    })

    /**
     * @tc.name   testTextMatrix0002
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0002
     * @tc.desc   Test the PLAY and STOP button presence. Text matrix case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0002 begin');
      await driver.assertComponentExist(ON.text(PLAY_TEXT));
      await driver.assertComponentExist(ON.text(STOP_TEXT));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testTextMatrix0002 end');
    })

    /**
     * @tc.name   testTextMatrix0003
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0003
     * @tc.desc   Test the stopped message. Text matrix case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0003 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(500);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testTextMatrix0003 end');
    })

    /**
     * @tc.name   testTextMatrix0004
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0004
     * @tc.desc   Test the started message. Text matrix case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0004 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testTextMatrix0004 end');
    })

    /**
     * @tc.name   testTextMatrix0005
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0005
     * @tc.desc   Test the loaded message. Text matrix case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0005 begin');
      const loaded: Component = await driver.findComponent(ON.text(LOADED_TEXT));
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(loaded !== null || playing !== null || stopped !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testTextMatrix0005 end');
    })

    /**
     * @tc.name   testTextMatrix0006
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0006
     * @tc.desc   Test the PLAY and STOP button presence. Text matrix case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0006 begin');
      await driver.assertComponentExist(ON.text(PLAY_TEXT));
      await driver.assertComponentExist(ON.text(STOP_TEXT));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testTextMatrix0006 end');
    })

    /**
     * @tc.name   testTextMatrix0007
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0007
     * @tc.desc   Test the stopped message. Text matrix case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0007 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(500);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testTextMatrix0007 end');
    })

    /**
     * @tc.name   testTextMatrix0008
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0008
     * @tc.desc   Test the started message. Text matrix case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0008 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testTextMatrix0008 end');
    })

    /**
     * @tc.name   testTextMatrix0009
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0009
     * @tc.desc   Test the loaded message. Text matrix case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0009 begin');
      const loaded: Component = await driver.findComponent(ON.text(LOADED_TEXT));
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(loaded !== null || playing !== null || stopped !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testTextMatrix0009 end');
    })

    /**
     * @tc.name   testTextMatrix0010
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0010
     * @tc.desc   Test the PLAY and STOP button presence. Text matrix case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0010 begin');
      await driver.assertComponentExist(ON.text(PLAY_TEXT));
      await driver.assertComponentExist(ON.text(STOP_TEXT));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testTextMatrix0010 end');
    })

    /**
     * @tc.name   testTextMatrix0011
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0011
     * @tc.desc   Test the stopped message. Text matrix case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0011 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(500);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testTextMatrix0011 end');
    })

    /**
     * @tc.name   testTextMatrix0012
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0012
     * @tc.desc   Test the started message. Text matrix case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0012 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testTextMatrix0012 end');
    })

    /**
     * @tc.name   testTextMatrix0013
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0013
     * @tc.desc   Test the loaded message. Text matrix case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0013 begin');
      const loaded: Component = await driver.findComponent(ON.text(LOADED_TEXT));
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(loaded !== null || playing !== null || stopped !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testTextMatrix0013 end');
    })

    /**
     * @tc.name   testTextMatrix0014
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0014
     * @tc.desc   Test the PLAY and STOP button presence. Text matrix case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0014 begin');
      await driver.assertComponentExist(ON.text(PLAY_TEXT));
      await driver.assertComponentExist(ON.text(STOP_TEXT));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testTextMatrix0014 end');
    })

    /**
     * @tc.name   testTextMatrix0015
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0015
     * @tc.desc   Test the stopped message. Text matrix case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0015 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(500);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testTextMatrix0015 end');
    })

    /**
     * @tc.name   testTextMatrix0016
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0016
     * @tc.desc   Test the started message. Text matrix case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0016 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testTextMatrix0016 end');
    })

    /**
     * @tc.name   testTextMatrix0017
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0017
     * @tc.desc   Test the loaded message. Text matrix case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0017 begin');
      const loaded: Component = await driver.findComponent(ON.text(LOADED_TEXT));
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(loaded !== null || playing !== null || stopped !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testTextMatrix0017 end');
    })

    /**
     * @tc.name   testTextMatrix0018
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0018
     * @tc.desc   Test the PLAY and STOP button presence. Text matrix case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0018 begin');
      await driver.assertComponentExist(ON.text(PLAY_TEXT));
      await driver.assertComponentExist(ON.text(STOP_TEXT));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testTextMatrix0018 end');
    })

    /**
     * @tc.name   testTextMatrix0019
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0019
     * @tc.desc   Test the stopped message. Text matrix case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0019 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(500);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testTextMatrix0019 end');
    })

    /**
     * @tc.name   testTextMatrix0020
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0020
     * @tc.desc   Test the started message. Text matrix case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0020 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testTextMatrix0020 end');
    })

    /**
     * @tc.name   testTextMatrix0021
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0021
     * @tc.desc   Test the loaded message. Text matrix case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0021 begin');
      const loaded: Component = await driver.findComponent(ON.text(LOADED_TEXT));
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(loaded !== null || playing !== null || stopped !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testTextMatrix0021 end');
    })

    /**
     * @tc.name   testTextMatrix0022
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0022
     * @tc.desc   Test the PLAY and STOP button presence. Text matrix case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0022 begin');
      await driver.assertComponentExist(ON.text(PLAY_TEXT));
      await driver.assertComponentExist(ON.text(STOP_TEXT));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testTextMatrix0022 end');
    })

    /**
     * @tc.name   testTextMatrix0023
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0023
     * @tc.desc   Test the stopped message. Text matrix case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0023 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(500);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testTextMatrix0023 end');
    })

    /**
     * @tc.name   testTextMatrix0024
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0024
     * @tc.desc   Test the started message. Text matrix case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0024 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testTextMatrix0024 end');
    })

    /**
     * @tc.name   testTextMatrix0025
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0025
     * @tc.desc   Test the loaded message. Text matrix case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0025 begin');
      const loaded: Component = await driver.findComponent(ON.text(LOADED_TEXT));
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(loaded !== null || playing !== null || stopped !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testTextMatrix0025 end');
    })

    /**
     * @tc.name   testTextMatrix0026
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0026
     * @tc.desc   Test the PLAY and STOP button presence. Text matrix case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0026 begin');
      await driver.assertComponentExist(ON.text(PLAY_TEXT));
      await driver.assertComponentExist(ON.text(STOP_TEXT));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testTextMatrix0026 end');
    })

    /**
     * @tc.name   testTextMatrix0027
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0027
     * @tc.desc   Test the stopped message. Text matrix case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0027 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(500);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testTextMatrix0027 end');
    })

    /**
     * @tc.name   testTextMatrix0028
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0028
     * @tc.desc   Test the started message. Text matrix case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0028 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testTextMatrix0028 end');
    })

    /**
     * @tc.name   testTextMatrix0029
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0029
     * @tc.desc   Test the loaded message. Text matrix case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0029 begin');
      const loaded: Component = await driver.findComponent(ON.text(LOADED_TEXT));
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(loaded !== null || playing !== null || stopped !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testTextMatrix0029 end');
    })

    /**
     * @tc.name   testTextMatrix0030
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0030
     * @tc.desc   Test the PLAY and STOP button presence. Text matrix case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0030 begin');
      await driver.assertComponentExist(ON.text(PLAY_TEXT));
      await driver.assertComponentExist(ON.text(STOP_TEXT));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testTextMatrix0030 end');
    })

    /**
     * @tc.name   testTextMatrix0031
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0031
     * @tc.desc   Test the stopped message. Text matrix case 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0031 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(500);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testTextMatrix0031 end');
    })

    /**
     * @tc.name   testTextMatrix0032
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0032
     * @tc.desc   Test the started message. Text matrix case 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0032 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testTextMatrix0032 end');
    })

    /**
     * @tc.name   testTextMatrix0033
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0033
     * @tc.desc   Test the loaded message. Text matrix case 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0033 begin');
      const loaded: Component = await driver.findComponent(ON.text(LOADED_TEXT));
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(loaded !== null || playing !== null || stopped !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testTextMatrix0033 end');
    })

    /**
     * @tc.name   testTextMatrix0034
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0034
     * @tc.desc   Test the PLAY and STOP button presence. Text matrix case 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0034 begin');
      await driver.assertComponentExist(ON.text(PLAY_TEXT));
      await driver.assertComponentExist(ON.text(STOP_TEXT));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testTextMatrix0034 end');
    })

    /**
     * @tc.name   testTextMatrix0035
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0035
     * @tc.desc   Test the stopped message. Text matrix case 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0035 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(500);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testTextMatrix0035 end');
    })

    /**
     * @tc.name   testTextMatrix0036
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0036
     * @tc.desc   Test the started message. Text matrix case 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0036 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testTextMatrix0036 end');
    })

    /**
     * @tc.name   testTextMatrix0037
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0037
     * @tc.desc   Test the loaded message. Text matrix case 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0037 begin');
      const loaded: Component = await driver.findComponent(ON.text(LOADED_TEXT));
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(loaded !== null || playing !== null || stopped !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testTextMatrix0037 end');
    })

    /**
     * @tc.name   testTextMatrix0038
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0038
     * @tc.desc   Test the PLAY and STOP button presence. Text matrix case 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0038 begin');
      await driver.assertComponentExist(ON.text(PLAY_TEXT));
      await driver.assertComponentExist(ON.text(STOP_TEXT));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testTextMatrix0038 end');
    })

    /**
     * @tc.name   testTextMatrix0039
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0039
     * @tc.desc   Test the stopped message. Text matrix case 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0039 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(500);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testTextMatrix0039 end');
    })

    /**
     * @tc.name   testTextMatrix0040
     * @tc.number MOVING_PHOTO_VIEW_TEXT_0040
     * @tc.desc   Test the started message. Text matrix case 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextMatrix0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testTextMatrix0040 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testTextMatrix0040 end');
    })
  })
}

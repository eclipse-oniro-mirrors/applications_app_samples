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
import { describe, beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver } from '@kit.TestKit';
import { ensureHomeReady, openFromHome, tapId, exists, existsText, labelOf, HOME_ID } from './shared/AudioDriver';

const CARD: string = 'spatial_audio_card';
const PLAY_2P0: string = '2P0_play_btn';
const PAUSE_2P0: string = '2P0_pause_btn';
const PLAY_5P1: string = '5P1_play_btn';
const PAUSE_5P1: string = '5P1_pause_btn';

/**
 * 空间音频页状态机
 *
 * 本节聚焦播放控件的状态切换与互不影响，而不是只验证控件存在：
 * 初始必为播放态；点击 2P0 播放后按钮切换为暂停；再点击恢复播放；
 * 2P0 的状态切换不改变 5P1；离开再进入后状态复位。相较 AudioTest02 只断言
 * 控件存在，这里断言了 id 切换、互斥与复位语义。
 */
export default function audioSpatialState() {
  describe('AudioSpatialState', () => {
    const driver: Driver = Driver.create();

    beforeAll(async () => {
      await ensureHomeReady(driver);
    });

    /**
     * @tc.number SUB_AUDIO_SPATIAL_STATE_0100
     * @tc.name testSpatialState0001
     * @tc.desc Verify the spatial page starts with the 2P0 and 5P1 play controls and no pause controls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSpatialState0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await openFromHome(driver, CARD, PLAY_2P0)).assertTrue();
      expect(await exists(driver, PLAY_2P0, 3000)).assertTrue();
      expect(await exists(driver, PAUSE_2P0, 1000)).assertFalse();
      expect(await exists(driver, PLAY_5P1, 3000)).assertTrue();
      expect(await exists(driver, PAUSE_5P1, 1000)).assertFalse();
    });

    /**
     * @tc.number SUB_AUDIO_SPATIAL_STATE_0200
     * @tc.name testSpatialState0002
     * @tc.desc Verify both stereo and 5.1 track labels are rendered on the spatial page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSpatialState0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await openFromHome(driver, CARD, PLAY_2P0)).assertTrue();
      expect(await existsText(driver, labelOf('2P0_MUSIC'), 3000)).assertTrue();
      expect(await existsText(driver, labelOf('5P1_MUSIC'), 3000)).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_SPATIAL_STATE_0300
     * @tc.name testSpatialState0003
     * @tc.desc Verify tapping the 2P0 play control switches it to the pause control
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSpatialState0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openFromHome(driver, CARD, PLAY_2P0)).assertTrue();
      expect(await tapId(driver, PLAY_2P0, 1200)).assertTrue();
      expect(await exists(driver, PAUSE_2P0, 5000)).assertTrue();
      expect(await exists(driver, PLAY_2P0, 1000)).assertFalse();
    });

    /**
     * @tc.number SUB_AUDIO_SPATIAL_STATE_0400
     * @tc.name testSpatialState0004
     * @tc.desc Verify pausing the 2P0 track restores its play control and hides the pause control
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSpatialState0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openFromHome(driver, CARD, PLAY_2P0)).assertTrue();
      expect(await tapId(driver, PLAY_2P0, 1200)).assertTrue();
      expect(await exists(driver, PAUSE_2P0, 5000)).assertTrue();
      expect(await tapId(driver, PAUSE_2P0, 1200)).assertTrue();
      expect(await exists(driver, PLAY_2P0, 5000)).assertTrue();
      expect(await exists(driver, PAUSE_2P0, 1000)).assertFalse();
    });

    /**
     * @tc.number SUB_AUDIO_SPATIAL_STATE_0500
     * @tc.name testSpatialState0005
     * @tc.desc Verify playing the 2P0 track does not change the 5.1 track control state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSpatialState0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openFromHome(driver, CARD, PLAY_2P0)).assertTrue();
      expect(await tapId(driver, PLAY_2P0, 1200)).assertTrue();
      expect(await exists(driver, PAUSE_2P0, 5000)).assertTrue();
      expect(await exists(driver, PAUSE_5P1, 1000)).assertFalse();
    });

    /**
     * @tc.number SUB_AUDIO_SPATIAL_STATE_0600
     * @tc.name testSpatialState0006
     * @tc.desc Verify leaving the spatial page returns home and removes the player controls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSpatialState0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await openFromHome(driver, CARD, PLAY_2P0)).assertTrue();
      await driver.pressBack();
      await driver.delayMs(1200);
      expect(await exists(driver, HOME_ID, 4000)).assertTrue();
      expect(await exists(driver, PLAY_2P0, 1000)).assertFalse();
    });

    /**
     * @tc.number SUB_AUDIO_SPATIAL_STATE_0700
     * @tc.name testSpatialState0007
     * @tc.desc Verify re-entering the spatial page after a play toggle resets the control to play
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSpatialState0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openFromHome(driver, CARD, PLAY_2P0)).assertTrue();
      expect(await tapId(driver, PLAY_2P0, 1200)).assertTrue();
      expect(await exists(driver, PAUSE_2P0, 5000)).assertTrue();
      await driver.pressBack();
      await driver.delayMs(1200);
      expect(await openFromHome(driver, CARD, PLAY_2P0)).assertTrue();
      expect(await exists(driver, PLAY_2P0, 3000)).assertTrue();
      expect(await exists(driver, PAUSE_2P0, 1000)).assertFalse();
    });
  });
}

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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { avSession as AVSessionManager } from '@kit.AVSessionKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function mediaControllerPlaybackTestPart01() {
  describe('MediaControllerPlaybackPart01', () => {
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0001
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0001
     * @tc.desc   Verify AVPlaybackState combination 1 (PREPARE/SINGLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0001 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_PREPARE,
        speed: 0.75,
        position: { elapsedTime: 1000, updateTime: 1010 },
        bufferedTime: 1500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SINGLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 1);
      expect(state.state).assertEqual(1);
      expect(state.position?.elapsedTime).assertEqual(1000);
      expect(state.bufferedTime).assertEqual(1500);
      expect(state.loopMode).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0001 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0002
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0002
     * @tc.desc   Verify AVPlaybackState combination 2 (PLAY/LIST).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0002 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_PLAY,
        speed: 1.0,
        position: { elapsedTime: 2000, updateTime: 2010 },
        bufferedTime: 2500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_LIST
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 2);
      expect(state.state).assertEqual(2);
      expect(state.position?.elapsedTime).assertEqual(2000);
      expect(state.bufferedTime).assertEqual(2500);
      expect(state.loopMode).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0002 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0003
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0003
     * @tc.desc   Verify AVPlaybackState combination 3 (PAUSE/SHUFFLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0003 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_PAUSE,
        speed: 1.25,
        position: { elapsedTime: 3000, updateTime: 3010 },
        bufferedTime: 3500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 3);
      expect(state.state).assertEqual(3);
      expect(state.position?.elapsedTime).assertEqual(3000);
      expect(state.bufferedTime).assertEqual(3500);
      expect(state.loopMode).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0003 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0004
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0004
     * @tc.desc   Verify AVPlaybackState combination 4 (FAST_FORWARD/CUSTOM).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0004 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_FAST_FORWARD,
        speed: 1.5,
        position: { elapsedTime: 4000, updateTime: 4010 },
        bufferedTime: 4500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_CUSTOM
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 4);
      expect(state.state).assertEqual(4);
      expect(state.position?.elapsedTime).assertEqual(4000);
      expect(state.bufferedTime).assertEqual(4500);
      expect(state.loopMode).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0004 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0005
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0005
     * @tc.desc   Verify AVPlaybackState combination 5 (REWIND/SEQUENCE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0005 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_REWIND,
        speed: 1.75,
        position: { elapsedTime: 5000, updateTime: 5010 },
        bufferedTime: 5500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 5);
      expect(state.state).assertEqual(5);
      expect(state.position?.elapsedTime).assertEqual(5000);
      expect(state.bufferedTime).assertEqual(5500);
      expect(state.loopMode).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0005 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0006
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0006
     * @tc.desc   Verify AVPlaybackState combination 6 (STOP/SINGLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0006 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_STOP,
        speed: 0.5,
        position: { elapsedTime: 6000, updateTime: 6010 },
        bufferedTime: 6500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SINGLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 6);
      expect(state.state).assertEqual(6);
      expect(state.position?.elapsedTime).assertEqual(6000);
      expect(state.bufferedTime).assertEqual(6500);
      expect(state.loopMode).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0006 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0007
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0007
     * @tc.desc   Verify AVPlaybackState combination 7 (COMPLETED/LIST).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0007 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_COMPLETED,
        speed: 0.75,
        position: { elapsedTime: 7000, updateTime: 7010 },
        bufferedTime: 7500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_LIST
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 7);
      expect(state.state).assertEqual(7);
      expect(state.position?.elapsedTime).assertEqual(7000);
      expect(state.bufferedTime).assertEqual(7500);
      expect(state.loopMode).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0007 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0008
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0008
     * @tc.desc   Verify AVPlaybackState combination 8 (RELEASED/SHUFFLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0008 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_RELEASED,
        speed: 1.0,
        position: { elapsedTime: 8000, updateTime: 8010 },
        bufferedTime: 8500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 8);
      expect(state.state).assertEqual(8);
      expect(state.position?.elapsedTime).assertEqual(8000);
      expect(state.bufferedTime).assertEqual(8500);
      expect(state.loopMode).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0008 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0009
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0009
     * @tc.desc   Verify AVPlaybackState combination 9 (ERROR/CUSTOM).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0009 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_ERROR,
        speed: 1.25,
        position: { elapsedTime: 9000, updateTime: 9010 },
        bufferedTime: 9500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_CUSTOM
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 9);
      expect(state.state).assertEqual(9);
      expect(state.position?.elapsedTime).assertEqual(9000);
      expect(state.bufferedTime).assertEqual(9500);
      expect(state.loopMode).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0009 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0010
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0010
     * @tc.desc   Verify AVPlaybackState combination 10 (IDLE/SEQUENCE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0010 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_IDLE,
        speed: 1.5,
        position: { elapsedTime: 10000, updateTime: 10010 },
        bufferedTime: 10500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 10);
      expect(state.state).assertEqual(10);
      expect(state.position?.elapsedTime).assertEqual(10000);
      expect(state.bufferedTime).assertEqual(10500);
      expect(state.loopMode).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0010 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0011
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0011
     * @tc.desc   Verify AVPlaybackState combination 11 (BUFFERING/SINGLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0011 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_BUFFERING,
        speed: 1.75,
        position: { elapsedTime: 11000, updateTime: 11010 },
        bufferedTime: 11500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SINGLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 11);
      expect(state.state).assertEqual(11);
      expect(state.position?.elapsedTime).assertEqual(11000);
      expect(state.bufferedTime).assertEqual(11500);
      expect(state.loopMode).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0011 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0012
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0012
     * @tc.desc   Verify AVPlaybackState combination 12 (INITIAL/LIST).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0012 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_INITIAL,
        speed: 0.5,
        position: { elapsedTime: 12000, updateTime: 12010 },
        bufferedTime: 12500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_LIST
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 0);
      expect(state.state).assertEqual(0);
      expect(state.position?.elapsedTime).assertEqual(12000);
      expect(state.bufferedTime).assertEqual(12500);
      expect(state.loopMode).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0012 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0013
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0013
     * @tc.desc   Verify AVPlaybackState combination 13 (PREPARE/SHUFFLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0013 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_PREPARE,
        speed: 0.75,
        position: { elapsedTime: 13000, updateTime: 13010 },
        bufferedTime: 13500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 1);
      expect(state.state).assertEqual(1);
      expect(state.position?.elapsedTime).assertEqual(13000);
      expect(state.bufferedTime).assertEqual(13500);
      expect(state.loopMode).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0013 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0014
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0014
     * @tc.desc   Verify AVPlaybackState combination 14 (PLAY/CUSTOM).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0014 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_PLAY,
        speed: 1.0,
        position: { elapsedTime: 14000, updateTime: 14010 },
        bufferedTime: 14500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_CUSTOM
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 2);
      expect(state.state).assertEqual(2);
      expect(state.position?.elapsedTime).assertEqual(14000);
      expect(state.bufferedTime).assertEqual(14500);
      expect(state.loopMode).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0014 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0015
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0015
     * @tc.desc   Verify AVPlaybackState combination 15 (PAUSE/SEQUENCE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0015 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_PAUSE,
        speed: 1.25,
        position: { elapsedTime: 15000, updateTime: 15010 },
        bufferedTime: 15500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 3);
      expect(state.state).assertEqual(3);
      expect(state.position?.elapsedTime).assertEqual(15000);
      expect(state.bufferedTime).assertEqual(15500);
      expect(state.loopMode).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0015 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0016
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0016
     * @tc.desc   Verify AVPlaybackState combination 16 (FAST_FORWARD/SINGLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0016 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_FAST_FORWARD,
        speed: 1.5,
        position: { elapsedTime: 16000, updateTime: 16010 },
        bufferedTime: 16500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SINGLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 4);
      expect(state.state).assertEqual(4);
      expect(state.position?.elapsedTime).assertEqual(16000);
      expect(state.bufferedTime).assertEqual(16500);
      expect(state.loopMode).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0016 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0017
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0017
     * @tc.desc   Verify AVPlaybackState combination 17 (REWIND/LIST).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0017 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_REWIND,
        speed: 1.75,
        position: { elapsedTime: 17000, updateTime: 17010 },
        bufferedTime: 17500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_LIST
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 5);
      expect(state.state).assertEqual(5);
      expect(state.position?.elapsedTime).assertEqual(17000);
      expect(state.bufferedTime).assertEqual(17500);
      expect(state.loopMode).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0017 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0018
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0018
     * @tc.desc   Verify AVPlaybackState combination 18 (STOP/SHUFFLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0018 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_STOP,
        speed: 0.5,
        position: { elapsedTime: 18000, updateTime: 18010 },
        bufferedTime: 18500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 6);
      expect(state.state).assertEqual(6);
      expect(state.position?.elapsedTime).assertEqual(18000);
      expect(state.bufferedTime).assertEqual(18500);
      expect(state.loopMode).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0018 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0019
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0019
     * @tc.desc   Verify AVPlaybackState combination 19 (COMPLETED/CUSTOM).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0019 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_COMPLETED,
        speed: 0.75,
        position: { elapsedTime: 19000, updateTime: 19010 },
        bufferedTime: 19500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_CUSTOM
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 7);
      expect(state.state).assertEqual(7);
      expect(state.position?.elapsedTime).assertEqual(19000);
      expect(state.bufferedTime).assertEqual(19500);
      expect(state.loopMode).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0019 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0020
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0020
     * @tc.desc   Verify AVPlaybackState combination 20 (RELEASED/SEQUENCE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0020 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_RELEASED,
        speed: 1.0,
        position: { elapsedTime: 20000, updateTime: 20010 },
        bufferedTime: 20500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 8);
      expect(state.state).assertEqual(8);
      expect(state.position?.elapsedTime).assertEqual(20000);
      expect(state.bufferedTime).assertEqual(20500);
      expect(state.loopMode).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0020 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0021
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0021
     * @tc.desc   Verify AVPlaybackState combination 21 (ERROR/SINGLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0021 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_ERROR,
        speed: 1.25,
        position: { elapsedTime: 21000, updateTime: 21010 },
        bufferedTime: 21500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SINGLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 9);
      expect(state.state).assertEqual(9);
      expect(state.position?.elapsedTime).assertEqual(21000);
      expect(state.bufferedTime).assertEqual(21500);
      expect(state.loopMode).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0021 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0022
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0022
     * @tc.desc   Verify AVPlaybackState combination 22 (IDLE/LIST).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0022 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_IDLE,
        speed: 1.5,
        position: { elapsedTime: 22000, updateTime: 22010 },
        bufferedTime: 22500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_LIST
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 10);
      expect(state.state).assertEqual(10);
      expect(state.position?.elapsedTime).assertEqual(22000);
      expect(state.bufferedTime).assertEqual(22500);
      expect(state.loopMode).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0022 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0023
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0023
     * @tc.desc   Verify AVPlaybackState combination 23 (BUFFERING/SHUFFLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0023 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_BUFFERING,
        speed: 1.75,
        position: { elapsedTime: 23000, updateTime: 23010 },
        bufferedTime: 23500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 11);
      expect(state.state).assertEqual(11);
      expect(state.position?.elapsedTime).assertEqual(23000);
      expect(state.bufferedTime).assertEqual(23500);
      expect(state.loopMode).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0023 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0024
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0024
     * @tc.desc   Verify AVPlaybackState combination 24 (INITIAL/CUSTOM).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0024 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_INITIAL,
        speed: 0.5,
        position: { elapsedTime: 24000, updateTime: 24010 },
        bufferedTime: 24500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_CUSTOM
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 0);
      expect(state.state).assertEqual(0);
      expect(state.position?.elapsedTime).assertEqual(24000);
      expect(state.bufferedTime).assertEqual(24500);
      expect(state.loopMode).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0024 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0025
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0025
     * @tc.desc   Verify AVPlaybackState combination 25 (PREPARE/SEQUENCE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0025 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_PREPARE,
        speed: 0.75,
        position: { elapsedTime: 25000, updateTime: 25010 },
        bufferedTime: 25500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 1);
      expect(state.state).assertEqual(1);
      expect(state.position?.elapsedTime).assertEqual(25000);
      expect(state.bufferedTime).assertEqual(25500);
      expect(state.loopMode).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0025 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0026
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0026
     * @tc.desc   Verify AVPlaybackState combination 26 (PLAY/SINGLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0026 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_PLAY,
        speed: 1.0,
        position: { elapsedTime: 26000, updateTime: 26010 },
        bufferedTime: 26500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SINGLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 2);
      expect(state.state).assertEqual(2);
      expect(state.position?.elapsedTime).assertEqual(26000);
      expect(state.bufferedTime).assertEqual(26500);
      expect(state.loopMode).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0026 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0027
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0027
     * @tc.desc   Verify AVPlaybackState combination 27 (PAUSE/LIST).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0027 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_PAUSE,
        speed: 1.25,
        position: { elapsedTime: 27000, updateTime: 27010 },
        bufferedTime: 27500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_LIST
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 3);
      expect(state.state).assertEqual(3);
      expect(state.position?.elapsedTime).assertEqual(27000);
      expect(state.bufferedTime).assertEqual(27500);
      expect(state.loopMode).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0027 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0028
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0028
     * @tc.desc   Verify AVPlaybackState combination 28 (FAST_FORWARD/SHUFFLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0028 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_FAST_FORWARD,
        speed: 1.5,
        position: { elapsedTime: 28000, updateTime: 28010 },
        bufferedTime: 28500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 4);
      expect(state.state).assertEqual(4);
      expect(state.position?.elapsedTime).assertEqual(28000);
      expect(state.bufferedTime).assertEqual(28500);
      expect(state.loopMode).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0028 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0029
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0029
     * @tc.desc   Verify AVPlaybackState combination 29 (REWIND/CUSTOM).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0029 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_REWIND,
        speed: 1.75,
        position: { elapsedTime: 29000, updateTime: 29010 },
        bufferedTime: 29500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_CUSTOM
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 5);
      expect(state.state).assertEqual(5);
      expect(state.position?.elapsedTime).assertEqual(29000);
      expect(state.bufferedTime).assertEqual(29500);
      expect(state.loopMode).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0029 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0030
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0030
     * @tc.desc   Verify AVPlaybackState combination 30 (STOP/SEQUENCE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0030 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_STOP,
        speed: 0.5,
        position: { elapsedTime: 30000, updateTime: 30010 },
        bufferedTime: 30500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 6);
      expect(state.state).assertEqual(6);
      expect(state.position?.elapsedTime).assertEqual(30000);
      expect(state.bufferedTime).assertEqual(30500);
      expect(state.loopMode).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0030 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0031
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0031
     * @tc.desc   Verify AVPlaybackState combination 31 (COMPLETED/SINGLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0031 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_COMPLETED,
        speed: 0.75,
        position: { elapsedTime: 31000, updateTime: 31010 },
        bufferedTime: 31500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SINGLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 7);
      expect(state.state).assertEqual(7);
      expect(state.position?.elapsedTime).assertEqual(31000);
      expect(state.bufferedTime).assertEqual(31500);
      expect(state.loopMode).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0031 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0032
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0032
     * @tc.desc   Verify AVPlaybackState combination 32 (RELEASED/LIST).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0032 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_RELEASED,
        speed: 1.0,
        position: { elapsedTime: 32000, updateTime: 32010 },
        bufferedTime: 32500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_LIST
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 8);
      expect(state.state).assertEqual(8);
      expect(state.position?.elapsedTime).assertEqual(32000);
      expect(state.bufferedTime).assertEqual(32500);
      expect(state.loopMode).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0032 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0033
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0033
     * @tc.desc   Verify AVPlaybackState combination 33 (ERROR/SHUFFLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0033 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_ERROR,
        speed: 1.25,
        position: { elapsedTime: 33000, updateTime: 33010 },
        bufferedTime: 33500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 9);
      expect(state.state).assertEqual(9);
      expect(state.position?.elapsedTime).assertEqual(33000);
      expect(state.bufferedTime).assertEqual(33500);
      expect(state.loopMode).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0033 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0034
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0034
     * @tc.desc   Verify AVPlaybackState combination 34 (IDLE/CUSTOM).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0034 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_IDLE,
        speed: 1.5,
        position: { elapsedTime: 34000, updateTime: 34010 },
        bufferedTime: 34500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_CUSTOM
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 10);
      expect(state.state).assertEqual(10);
      expect(state.position?.elapsedTime).assertEqual(34000);
      expect(state.bufferedTime).assertEqual(34500);
      expect(state.loopMode).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0034 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0035
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0035
     * @tc.desc   Verify AVPlaybackState combination 35 (BUFFERING/SEQUENCE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0035 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_BUFFERING,
        speed: 1.75,
        position: { elapsedTime: 35000, updateTime: 35010 },
        bufferedTime: 35500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 11);
      expect(state.state).assertEqual(11);
      expect(state.position?.elapsedTime).assertEqual(35000);
      expect(state.bufferedTime).assertEqual(35500);
      expect(state.loopMode).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0035 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0036
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0036
     * @tc.desc   Verify AVPlaybackState combination 36 (INITIAL/SINGLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0036 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_INITIAL,
        speed: 0.5,
        position: { elapsedTime: 36000, updateTime: 36010 },
        bufferedTime: 36500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SINGLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 0);
      expect(state.state).assertEqual(0);
      expect(state.position?.elapsedTime).assertEqual(36000);
      expect(state.bufferedTime).assertEqual(36500);
      expect(state.loopMode).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0036 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0037
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0037
     * @tc.desc   Verify AVPlaybackState combination 37 (PREPARE/LIST).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0037 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_PREPARE,
        speed: 0.75,
        position: { elapsedTime: 37000, updateTime: 37010 },
        bufferedTime: 37500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_LIST
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 1);
      expect(state.state).assertEqual(1);
      expect(state.position?.elapsedTime).assertEqual(37000);
      expect(state.bufferedTime).assertEqual(37500);
      expect(state.loopMode).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0037 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0038
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0038
     * @tc.desc   Verify AVPlaybackState combination 38 (PLAY/SHUFFLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0038 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_PLAY,
        speed: 1.0,
        position: { elapsedTime: 38000, updateTime: 38010 },
        bufferedTime: 38500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 2);
      expect(state.state).assertEqual(2);
      expect(state.position?.elapsedTime).assertEqual(38000);
      expect(state.bufferedTime).assertEqual(38500);
      expect(state.loopMode).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0038 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0039
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0039
     * @tc.desc   Verify AVPlaybackState combination 39 (PAUSE/CUSTOM).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0039 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_PAUSE,
        speed: 1.25,
        position: { elapsedTime: 39000, updateTime: 39010 },
        bufferedTime: 39500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_CUSTOM
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 3);
      expect(state.state).assertEqual(3);
      expect(state.position?.elapsedTime).assertEqual(39000);
      expect(state.bufferedTime).assertEqual(39500);
      expect(state.loopMode).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0039 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0040
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0040
     * @tc.desc   Verify AVPlaybackState combination 40 (FAST_FORWARD/SEQUENCE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0040 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_FAST_FORWARD,
        speed: 1.5,
        position: { elapsedTime: 40000, updateTime: 40010 },
        bufferedTime: 40500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 4);
      expect(state.state).assertEqual(4);
      expect(state.position?.elapsedTime).assertEqual(40000);
      expect(state.bufferedTime).assertEqual(40500);
      expect(state.loopMode).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0040 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0041
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0041
     * @tc.desc   Verify AVPlaybackState combination 41 (REWIND/SINGLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0041 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_REWIND,
        speed: 1.75,
        position: { elapsedTime: 41000, updateTime: 41010 },
        bufferedTime: 41500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SINGLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 5);
      expect(state.state).assertEqual(5);
      expect(state.position?.elapsedTime).assertEqual(41000);
      expect(state.bufferedTime).assertEqual(41500);
      expect(state.loopMode).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0041 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0042
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0042
     * @tc.desc   Verify AVPlaybackState combination 42 (STOP/LIST).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0042 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_STOP,
        speed: 0.5,
        position: { elapsedTime: 42000, updateTime: 42010 },
        bufferedTime: 42500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_LIST
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 6);
      expect(state.state).assertEqual(6);
      expect(state.position?.elapsedTime).assertEqual(42000);
      expect(state.bufferedTime).assertEqual(42500);
      expect(state.loopMode).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0042 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0043
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0043
     * @tc.desc   Verify AVPlaybackState combination 43 (COMPLETED/SHUFFLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0043 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_COMPLETED,
        speed: 0.75,
        position: { elapsedTime: 43000, updateTime: 43010 },
        bufferedTime: 43500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 7);
      expect(state.state).assertEqual(7);
      expect(state.position?.elapsedTime).assertEqual(43000);
      expect(state.bufferedTime).assertEqual(43500);
      expect(state.loopMode).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0043 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0044
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0044
     * @tc.desc   Verify AVPlaybackState combination 44 (RELEASED/CUSTOM).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0044 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_RELEASED,
        speed: 1.0,
        position: { elapsedTime: 44000, updateTime: 44010 },
        bufferedTime: 44500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_CUSTOM
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 8);
      expect(state.state).assertEqual(8);
      expect(state.position?.elapsedTime).assertEqual(44000);
      expect(state.bufferedTime).assertEqual(44500);
      expect(state.loopMode).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0044 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0045
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0045
     * @tc.desc   Verify AVPlaybackState combination 45 (ERROR/SEQUENCE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0045 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_ERROR,
        speed: 1.25,
        position: { elapsedTime: 45000, updateTime: 45010 },
        bufferedTime: 45500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 9);
      expect(state.state).assertEqual(9);
      expect(state.position?.elapsedTime).assertEqual(45000);
      expect(state.bufferedTime).assertEqual(45500);
      expect(state.loopMode).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0045 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0046
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0046
     * @tc.desc   Verify AVPlaybackState combination 46 (IDLE/SINGLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0046 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_IDLE,
        speed: 1.5,
        position: { elapsedTime: 46000, updateTime: 46010 },
        bufferedTime: 46500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SINGLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 10);
      expect(state.state).assertEqual(10);
      expect(state.position?.elapsedTime).assertEqual(46000);
      expect(state.bufferedTime).assertEqual(46500);
      expect(state.loopMode).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0046 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0047
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0047
     * @tc.desc   Verify AVPlaybackState combination 47 (BUFFERING/LIST).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0047 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_BUFFERING,
        speed: 1.75,
        position: { elapsedTime: 47000, updateTime: 47010 },
        bufferedTime: 47500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_LIST
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 11);
      expect(state.state).assertEqual(11);
      expect(state.position?.elapsedTime).assertEqual(47000);
      expect(state.bufferedTime).assertEqual(47500);
      expect(state.loopMode).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0047 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0048
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0048
     * @tc.desc   Verify AVPlaybackState combination 48 (INITIAL/SHUFFLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0048 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_INITIAL,
        speed: 0.5,
        position: { elapsedTime: 48000, updateTime: 48010 },
        bufferedTime: 48500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 0);
      expect(state.state).assertEqual(0);
      expect(state.position?.elapsedTime).assertEqual(48000);
      expect(state.bufferedTime).assertEqual(48500);
      expect(state.loopMode).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0048 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0049
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0049
     * @tc.desc   Verify AVPlaybackState combination 49 (PREPARE/CUSTOM).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0049 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_PREPARE,
        speed: 0.75,
        position: { elapsedTime: 49000, updateTime: 49010 },
        bufferedTime: 49500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_CUSTOM
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 1);
      expect(state.state).assertEqual(1);
      expect(state.position?.elapsedTime).assertEqual(49000);
      expect(state.bufferedTime).assertEqual(49500);
      expect(state.loopMode).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0049 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0050
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0050
     * @tc.desc   Verify AVPlaybackState combination 50 (PLAY/SEQUENCE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0050 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_PLAY,
        speed: 1.0,
        position: { elapsedTime: 50000, updateTime: 50010 },
        bufferedTime: 50500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 2);
      expect(state.state).assertEqual(2);
      expect(state.position?.elapsedTime).assertEqual(50000);
      expect(state.bufferedTime).assertEqual(50500);
      expect(state.loopMode).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0050 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0051
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0051
     * @tc.desc   Verify AVPlaybackState combination 51 (PAUSE/SINGLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0051 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_PAUSE,
        speed: 1.25,
        position: { elapsedTime: 51000, updateTime: 51010 },
        bufferedTime: 51500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SINGLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 3);
      expect(state.state).assertEqual(3);
      expect(state.position?.elapsedTime).assertEqual(51000);
      expect(state.bufferedTime).assertEqual(51500);
      expect(state.loopMode).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0051 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0052
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0052
     * @tc.desc   Verify AVPlaybackState combination 52 (FAST_FORWARD/LIST).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0052 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_FAST_FORWARD,
        speed: 1.5,
        position: { elapsedTime: 52000, updateTime: 52010 },
        bufferedTime: 52500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_LIST
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 4);
      expect(state.state).assertEqual(4);
      expect(state.position?.elapsedTime).assertEqual(52000);
      expect(state.bufferedTime).assertEqual(52500);
      expect(state.loopMode).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0052 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0053
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0053
     * @tc.desc   Verify AVPlaybackState combination 53 (REWIND/SHUFFLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0053 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_REWIND,
        speed: 1.75,
        position: { elapsedTime: 53000, updateTime: 53010 },
        bufferedTime: 53500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 5);
      expect(state.state).assertEqual(5);
      expect(state.position?.elapsedTime).assertEqual(53000);
      expect(state.bufferedTime).assertEqual(53500);
      expect(state.loopMode).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0053 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0054
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0054
     * @tc.desc   Verify AVPlaybackState combination 54 (STOP/CUSTOM).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0054 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_STOP,
        speed: 0.5,
        position: { elapsedTime: 54000, updateTime: 54010 },
        bufferedTime: 54500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_CUSTOM
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 6);
      expect(state.state).assertEqual(6);
      expect(state.position?.elapsedTime).assertEqual(54000);
      expect(state.bufferedTime).assertEqual(54500);
      expect(state.loopMode).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0054 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0055
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0055
     * @tc.desc   Verify AVPlaybackState combination 55 (COMPLETED/SEQUENCE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0055 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_COMPLETED,
        speed: 0.75,
        position: { elapsedTime: 55000, updateTime: 55010 },
        bufferedTime: 55500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 7);
      expect(state.state).assertEqual(7);
      expect(state.position?.elapsedTime).assertEqual(55000);
      expect(state.bufferedTime).assertEqual(55500);
      expect(state.loopMode).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0055 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0056
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0056
     * @tc.desc   Verify AVPlaybackState combination 56 (RELEASED/SINGLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0056 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_RELEASED,
        speed: 1.0,
        position: { elapsedTime: 56000, updateTime: 56010 },
        bufferedTime: 56500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SINGLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 8);
      expect(state.state).assertEqual(8);
      expect(state.position?.elapsedTime).assertEqual(56000);
      expect(state.bufferedTime).assertEqual(56500);
      expect(state.loopMode).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0056 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0057
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0057
     * @tc.desc   Verify AVPlaybackState combination 57 (ERROR/LIST).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0057 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_ERROR,
        speed: 1.25,
        position: { elapsedTime: 57000, updateTime: 57010 },
        bufferedTime: 57500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_LIST
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 9);
      expect(state.state).assertEqual(9);
      expect(state.position?.elapsedTime).assertEqual(57000);
      expect(state.bufferedTime).assertEqual(57500);
      expect(state.loopMode).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0057 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0058
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0058
     * @tc.desc   Verify AVPlaybackState combination 58 (IDLE/SHUFFLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0058 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_IDLE,
        speed: 1.5,
        position: { elapsedTime: 58000, updateTime: 58010 },
        bufferedTime: 58500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 10);
      expect(state.state).assertEqual(10);
      expect(state.position?.elapsedTime).assertEqual(58000);
      expect(state.bufferedTime).assertEqual(58500);
      expect(state.loopMode).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0058 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0059
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0059
     * @tc.desc   Verify AVPlaybackState combination 59 (BUFFERING/CUSTOM).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0059 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_BUFFERING,
        speed: 1.75,
        position: { elapsedTime: 59000, updateTime: 59010 },
        bufferedTime: 59500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_CUSTOM
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 11);
      expect(state.state).assertEqual(11);
      expect(state.position?.elapsedTime).assertEqual(59000);
      expect(state.bufferedTime).assertEqual(59500);
      expect(state.loopMode).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0059 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0060
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0060
     * @tc.desc   Verify AVPlaybackState combination 60 (INITIAL/SEQUENCE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0060 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_INITIAL,
        speed: 0.5,
        position: { elapsedTime: 60000, updateTime: 60010 },
        bufferedTime: 60500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 0);
      expect(state.state).assertEqual(0);
      expect(state.position?.elapsedTime).assertEqual(60000);
      expect(state.bufferedTime).assertEqual(60500);
      expect(state.loopMode).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0060 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0061
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0061
     * @tc.desc   Verify AVPlaybackState combination 61 (PREPARE/SINGLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0061 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_PREPARE,
        speed: 0.75,
        position: { elapsedTime: 61000, updateTime: 61010 },
        bufferedTime: 61500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SINGLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 1);
      expect(state.state).assertEqual(1);
      expect(state.position?.elapsedTime).assertEqual(61000);
      expect(state.bufferedTime).assertEqual(61500);
      expect(state.loopMode).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0061 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0062
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0062
     * @tc.desc   Verify AVPlaybackState combination 62 (PLAY/LIST).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0062 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_PLAY,
        speed: 1.0,
        position: { elapsedTime: 62000, updateTime: 62010 },
        bufferedTime: 62500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_LIST
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 2);
      expect(state.state).assertEqual(2);
      expect(state.position?.elapsedTime).assertEqual(62000);
      expect(state.bufferedTime).assertEqual(62500);
      expect(state.loopMode).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0062 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0063
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0063
     * @tc.desc   Verify AVPlaybackState combination 63 (PAUSE/SHUFFLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0063 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_PAUSE,
        speed: 1.25,
        position: { elapsedTime: 63000, updateTime: 63010 },
        bufferedTime: 63500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 3);
      expect(state.state).assertEqual(3);
      expect(state.position?.elapsedTime).assertEqual(63000);
      expect(state.bufferedTime).assertEqual(63500);
      expect(state.loopMode).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0063 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0064
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0064
     * @tc.desc   Verify AVPlaybackState combination 64 (FAST_FORWARD/CUSTOM).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0064 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_FAST_FORWARD,
        speed: 1.5,
        position: { elapsedTime: 64000, updateTime: 64010 },
        bufferedTime: 64500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_CUSTOM
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 4);
      expect(state.state).assertEqual(4);
      expect(state.position?.elapsedTime).assertEqual(64000);
      expect(state.bufferedTime).assertEqual(64500);
      expect(state.loopMode).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0064 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0065
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0065
     * @tc.desc   Verify AVPlaybackState combination 65 (REWIND/SEQUENCE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0065 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_REWIND,
        speed: 1.75,
        position: { elapsedTime: 65000, updateTime: 65010 },
        bufferedTime: 65500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 5);
      expect(state.state).assertEqual(5);
      expect(state.position?.elapsedTime).assertEqual(65000);
      expect(state.bufferedTime).assertEqual(65500);
      expect(state.loopMode).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0065 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0066
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0066
     * @tc.desc   Verify AVPlaybackState combination 66 (STOP/SINGLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0066 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_STOP,
        speed: 0.5,
        position: { elapsedTime: 66000, updateTime: 66010 },
        bufferedTime: 66500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SINGLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 6);
      expect(state.state).assertEqual(6);
      expect(state.position?.elapsedTime).assertEqual(66000);
      expect(state.bufferedTime).assertEqual(66500);
      expect(state.loopMode).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0066 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0067
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0067
     * @tc.desc   Verify AVPlaybackState combination 67 (COMPLETED/LIST).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0067 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_COMPLETED,
        speed: 0.75,
        position: { elapsedTime: 67000, updateTime: 67010 },
        bufferedTime: 67500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_LIST
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 7);
      expect(state.state).assertEqual(7);
      expect(state.position?.elapsedTime).assertEqual(67000);
      expect(state.bufferedTime).assertEqual(67500);
      expect(state.loopMode).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0067 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0068
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0068
     * @tc.desc   Verify AVPlaybackState combination 68 (RELEASED/SHUFFLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0068 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_RELEASED,
        speed: 1.0,
        position: { elapsedTime: 68000, updateTime: 68010 },
        bufferedTime: 68500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 8);
      expect(state.state).assertEqual(8);
      expect(state.position?.elapsedTime).assertEqual(68000);
      expect(state.bufferedTime).assertEqual(68500);
      expect(state.loopMode).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0068 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0069
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0069
     * @tc.desc   Verify AVPlaybackState combination 69 (ERROR/CUSTOM).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0069 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_ERROR,
        speed: 1.25,
        position: { elapsedTime: 69000, updateTime: 69010 },
        bufferedTime: 69500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_CUSTOM
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 9);
      expect(state.state).assertEqual(9);
      expect(state.position?.elapsedTime).assertEqual(69000);
      expect(state.bufferedTime).assertEqual(69500);
      expect(state.loopMode).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0069 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0070
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0070
     * @tc.desc   Verify AVPlaybackState combination 70 (IDLE/SEQUENCE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0070 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_IDLE,
        speed: 1.5,
        position: { elapsedTime: 70000, updateTime: 70010 },
        bufferedTime: 70500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 10);
      expect(state.state).assertEqual(10);
      expect(state.position?.elapsedTime).assertEqual(70000);
      expect(state.bufferedTime).assertEqual(70500);
      expect(state.loopMode).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0070 end');
    })
  })
}

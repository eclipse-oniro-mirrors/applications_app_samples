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
import AVSessionManager from '@ohos.multimedia.avsession';
import { hilog } from '@kit.PerformanceAnalysisKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function mediaControllerPlaybackTestPart02() {
  describe('MediaControllerPlaybackPart02', () => {
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0071
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0071
     * @tc.desc   Verify AVPlaybackState combination 71 (BUFFERING/SINGLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0071 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_BUFFERING,
        speed: 1.75,
        position: { elapsedTime: 71000, updateTime: 71010 },
        bufferedTime: 71500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SINGLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 11);
      expect(state.state).assertEqual(11);
      expect(state.position?.elapsedTime).assertEqual(71000);
      expect(state.bufferedTime).assertEqual(71500);
      expect(state.loopMode).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0071 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0072
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0072
     * @tc.desc   Verify AVPlaybackState combination 72 (INITIAL/LIST).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0072 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_INITIAL,
        speed: 0.5,
        position: { elapsedTime: 72000, updateTime: 72010 },
        bufferedTime: 72500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_LIST
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 0);
      expect(state.state).assertEqual(0);
      expect(state.position?.elapsedTime).assertEqual(72000);
      expect(state.bufferedTime).assertEqual(72500);
      expect(state.loopMode).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0072 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0073
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0073
     * @tc.desc   Verify AVPlaybackState combination 73 (PREPARE/SHUFFLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0073 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_PREPARE,
        speed: 0.75,
        position: { elapsedTime: 73000, updateTime: 73010 },
        bufferedTime: 73500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 1);
      expect(state.state).assertEqual(1);
      expect(state.position?.elapsedTime).assertEqual(73000);
      expect(state.bufferedTime).assertEqual(73500);
      expect(state.loopMode).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0073 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0074
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0074
     * @tc.desc   Verify AVPlaybackState combination 74 (PLAY/CUSTOM).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0074 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_PLAY,
        speed: 1.0,
        position: { elapsedTime: 74000, updateTime: 74010 },
        bufferedTime: 74500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_CUSTOM
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 2);
      expect(state.state).assertEqual(2);
      expect(state.position?.elapsedTime).assertEqual(74000);
      expect(state.bufferedTime).assertEqual(74500);
      expect(state.loopMode).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0074 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0075
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0075
     * @tc.desc   Verify AVPlaybackState combination 75 (PAUSE/SEQUENCE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0075 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_PAUSE,
        speed: 1.25,
        position: { elapsedTime: 75000, updateTime: 75010 },
        bufferedTime: 75500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 3);
      expect(state.state).assertEqual(3);
      expect(state.position?.elapsedTime).assertEqual(75000);
      expect(state.bufferedTime).assertEqual(75500);
      expect(state.loopMode).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0075 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0076
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0076
     * @tc.desc   Verify AVPlaybackState combination 76 (FAST_FORWARD/SINGLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0076 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_FAST_FORWARD,
        speed: 1.5,
        position: { elapsedTime: 76000, updateTime: 76010 },
        bufferedTime: 76500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SINGLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 4);
      expect(state.state).assertEqual(4);
      expect(state.position?.elapsedTime).assertEqual(76000);
      expect(state.bufferedTime).assertEqual(76500);
      expect(state.loopMode).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0076 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0077
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0077
     * @tc.desc   Verify AVPlaybackState combination 77 (REWIND/LIST).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0077 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_REWIND,
        speed: 1.75,
        position: { elapsedTime: 77000, updateTime: 77010 },
        bufferedTime: 77500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_LIST
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 5);
      expect(state.state).assertEqual(5);
      expect(state.position?.elapsedTime).assertEqual(77000);
      expect(state.bufferedTime).assertEqual(77500);
      expect(state.loopMode).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0077 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0078
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0078
     * @tc.desc   Verify AVPlaybackState combination 78 (STOP/SHUFFLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0078 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_STOP,
        speed: 0.5,
        position: { elapsedTime: 78000, updateTime: 78010 },
        bufferedTime: 78500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 6);
      expect(state.state).assertEqual(6);
      expect(state.position?.elapsedTime).assertEqual(78000);
      expect(state.bufferedTime).assertEqual(78500);
      expect(state.loopMode).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0078 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0079
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0079
     * @tc.desc   Verify AVPlaybackState combination 79 (COMPLETED/CUSTOM).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0079 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_COMPLETED,
        speed: 0.75,
        position: { elapsedTime: 79000, updateTime: 79010 },
        bufferedTime: 79500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_CUSTOM
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 7);
      expect(state.state).assertEqual(7);
      expect(state.position?.elapsedTime).assertEqual(79000);
      expect(state.bufferedTime).assertEqual(79500);
      expect(state.loopMode).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0079 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0080
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0080
     * @tc.desc   Verify AVPlaybackState combination 80 (RELEASED/SEQUENCE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0080 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_RELEASED,
        speed: 1.0,
        position: { elapsedTime: 80000, updateTime: 80010 },
        bufferedTime: 80500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 8);
      expect(state.state).assertEqual(8);
      expect(state.position?.elapsedTime).assertEqual(80000);
      expect(state.bufferedTime).assertEqual(80500);
      expect(state.loopMode).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0080 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0081
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0081
     * @tc.desc   Verify AVPlaybackState combination 81 (ERROR/SINGLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0081 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_ERROR,
        speed: 1.25,
        position: { elapsedTime: 81000, updateTime: 81010 },
        bufferedTime: 81500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SINGLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 9);
      expect(state.state).assertEqual(9);
      expect(state.position?.elapsedTime).assertEqual(81000);
      expect(state.bufferedTime).assertEqual(81500);
      expect(state.loopMode).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0081 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0082
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0082
     * @tc.desc   Verify AVPlaybackState combination 82 (IDLE/LIST).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0082 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_IDLE,
        speed: 1.5,
        position: { elapsedTime: 82000, updateTime: 82010 },
        bufferedTime: 82500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_LIST
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 10);
      expect(state.state).assertEqual(10);
      expect(state.position?.elapsedTime).assertEqual(82000);
      expect(state.bufferedTime).assertEqual(82500);
      expect(state.loopMode).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0082 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0083
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0083
     * @tc.desc   Verify AVPlaybackState combination 83 (BUFFERING/SHUFFLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0083 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_BUFFERING,
        speed: 1.75,
        position: { elapsedTime: 83000, updateTime: 83010 },
        bufferedTime: 83500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 11);
      expect(state.state).assertEqual(11);
      expect(state.position?.elapsedTime).assertEqual(83000);
      expect(state.bufferedTime).assertEqual(83500);
      expect(state.loopMode).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0083 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0084
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0084
     * @tc.desc   Verify AVPlaybackState combination 84 (INITIAL/CUSTOM).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0084 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_INITIAL,
        speed: 0.5,
        position: { elapsedTime: 84000, updateTime: 84010 },
        bufferedTime: 84500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_CUSTOM
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 0);
      expect(state.state).assertEqual(0);
      expect(state.position?.elapsedTime).assertEqual(84000);
      expect(state.bufferedTime).assertEqual(84500);
      expect(state.loopMode).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0084 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0085
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0085
     * @tc.desc   Verify AVPlaybackState combination 85 (PREPARE/SEQUENCE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0085 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_PREPARE,
        speed: 0.75,
        position: { elapsedTime: 85000, updateTime: 85010 },
        bufferedTime: 85500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 1);
      expect(state.state).assertEqual(1);
      expect(state.position?.elapsedTime).assertEqual(85000);
      expect(state.bufferedTime).assertEqual(85500);
      expect(state.loopMode).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0085 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0086
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0086
     * @tc.desc   Verify AVPlaybackState combination 86 (PLAY/SINGLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0086 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_PLAY,
        speed: 1.0,
        position: { elapsedTime: 86000, updateTime: 86010 },
        bufferedTime: 86500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SINGLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 2);
      expect(state.state).assertEqual(2);
      expect(state.position?.elapsedTime).assertEqual(86000);
      expect(state.bufferedTime).assertEqual(86500);
      expect(state.loopMode).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0086 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0087
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0087
     * @tc.desc   Verify AVPlaybackState combination 87 (PAUSE/LIST).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0087 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_PAUSE,
        speed: 1.25,
        position: { elapsedTime: 87000, updateTime: 87010 },
        bufferedTime: 87500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_LIST
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 3);
      expect(state.state).assertEqual(3);
      expect(state.position?.elapsedTime).assertEqual(87000);
      expect(state.bufferedTime).assertEqual(87500);
      expect(state.loopMode).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0087 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0088
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0088
     * @tc.desc   Verify AVPlaybackState combination 88 (FAST_FORWARD/SHUFFLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0088 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_FAST_FORWARD,
        speed: 1.5,
        position: { elapsedTime: 88000, updateTime: 88010 },
        bufferedTime: 88500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 4);
      expect(state.state).assertEqual(4);
      expect(state.position?.elapsedTime).assertEqual(88000);
      expect(state.bufferedTime).assertEqual(88500);
      expect(state.loopMode).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0088 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0089
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0089
     * @tc.desc   Verify AVPlaybackState combination 89 (REWIND/CUSTOM).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0089 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_REWIND,
        speed: 1.75,
        position: { elapsedTime: 89000, updateTime: 89010 },
        bufferedTime: 89500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_CUSTOM
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 5);
      expect(state.state).assertEqual(5);
      expect(state.position?.elapsedTime).assertEqual(89000);
      expect(state.bufferedTime).assertEqual(89500);
      expect(state.loopMode).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0089 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0090
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0090
     * @tc.desc   Verify AVPlaybackState combination 90 (STOP/SEQUENCE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0090 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_STOP,
        speed: 0.5,
        position: { elapsedTime: 90000, updateTime: 90010 },
        bufferedTime: 90500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 6);
      expect(state.state).assertEqual(6);
      expect(state.position?.elapsedTime).assertEqual(90000);
      expect(state.bufferedTime).assertEqual(90500);
      expect(state.loopMode).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0090 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0091
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0091
     * @tc.desc   Verify AVPlaybackState combination 91 (COMPLETED/SINGLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0091 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_COMPLETED,
        speed: 0.75,
        position: { elapsedTime: 91000, updateTime: 91010 },
        bufferedTime: 91500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SINGLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 7);
      expect(state.state).assertEqual(7);
      expect(state.position?.elapsedTime).assertEqual(91000);
      expect(state.bufferedTime).assertEqual(91500);
      expect(state.loopMode).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0091 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0092
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0092
     * @tc.desc   Verify AVPlaybackState combination 92 (RELEASED/LIST).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0092 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_RELEASED,
        speed: 1.0,
        position: { elapsedTime: 92000, updateTime: 92010 },
        bufferedTime: 92500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_LIST
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 8);
      expect(state.state).assertEqual(8);
      expect(state.position?.elapsedTime).assertEqual(92000);
      expect(state.bufferedTime).assertEqual(92500);
      expect(state.loopMode).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0092 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0093
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0093
     * @tc.desc   Verify AVPlaybackState combination 93 (ERROR/SHUFFLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0093 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_ERROR,
        speed: 1.25,
        position: { elapsedTime: 93000, updateTime: 93010 },
        bufferedTime: 93500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 9);
      expect(state.state).assertEqual(9);
      expect(state.position?.elapsedTime).assertEqual(93000);
      expect(state.bufferedTime).assertEqual(93500);
      expect(state.loopMode).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0093 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0094
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0094
     * @tc.desc   Verify AVPlaybackState combination 94 (IDLE/CUSTOM).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0094 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_IDLE,
        speed: 1.5,
        position: { elapsedTime: 94000, updateTime: 94010 },
        bufferedTime: 94500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_CUSTOM
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 10);
      expect(state.state).assertEqual(10);
      expect(state.position?.elapsedTime).assertEqual(94000);
      expect(state.bufferedTime).assertEqual(94500);
      expect(state.loopMode).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0094 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0095
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0095
     * @tc.desc   Verify AVPlaybackState combination 95 (BUFFERING/SEQUENCE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0095 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_BUFFERING,
        speed: 1.75,
        position: { elapsedTime: 95000, updateTime: 95010 },
        bufferedTime: 95500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 11);
      expect(state.state).assertEqual(11);
      expect(state.position?.elapsedTime).assertEqual(95000);
      expect(state.bufferedTime).assertEqual(95500);
      expect(state.loopMode).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0095 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0096
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0096
     * @tc.desc   Verify AVPlaybackState combination 96 (INITIAL/SINGLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0096 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_INITIAL,
        speed: 0.5,
        position: { elapsedTime: 96000, updateTime: 96010 },
        bufferedTime: 96500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SINGLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 0);
      expect(state.state).assertEqual(0);
      expect(state.position?.elapsedTime).assertEqual(96000);
      expect(state.bufferedTime).assertEqual(96500);
      expect(state.loopMode).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0096 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0097
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0097
     * @tc.desc   Verify AVPlaybackState combination 97 (PREPARE/LIST).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0097 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_PREPARE,
        speed: 0.75,
        position: { elapsedTime: 97000, updateTime: 97010 },
        bufferedTime: 97500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_LIST
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 1);
      expect(state.state).assertEqual(1);
      expect(state.position?.elapsedTime).assertEqual(97000);
      expect(state.bufferedTime).assertEqual(97500);
      expect(state.loopMode).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0097 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0098
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0098
     * @tc.desc   Verify AVPlaybackState combination 98 (PLAY/SHUFFLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0098 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_PLAY,
        speed: 1.0,
        position: { elapsedTime: 98000, updateTime: 98010 },
        bufferedTime: 98500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 2);
      expect(state.state).assertEqual(2);
      expect(state.position?.elapsedTime).assertEqual(98000);
      expect(state.bufferedTime).assertEqual(98500);
      expect(state.loopMode).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0098 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0099
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0099
     * @tc.desc   Verify AVPlaybackState combination 99 (PAUSE/CUSTOM).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0099 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_PAUSE,
        speed: 1.25,
        position: { elapsedTime: 99000, updateTime: 99010 },
        bufferedTime: 99500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_CUSTOM
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 3);
      expect(state.state).assertEqual(3);
      expect(state.position?.elapsedTime).assertEqual(99000);
      expect(state.bufferedTime).assertEqual(99500);
      expect(state.loopMode).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0099 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0100
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0100
     * @tc.desc   Verify AVPlaybackState combination 100 (FAST_FORWARD/SEQUENCE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0100 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_FAST_FORWARD,
        speed: 1.5,
        position: { elapsedTime: 100000, updateTime: 100010 },
        bufferedTime: 100500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 4);
      expect(state.state).assertEqual(4);
      expect(state.position?.elapsedTime).assertEqual(100000);
      expect(state.bufferedTime).assertEqual(100500);
      expect(state.loopMode).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0100 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0101
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0101
     * @tc.desc   Verify AVPlaybackState combination 101 (REWIND/SINGLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0101 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_REWIND,
        speed: 1.75,
        position: { elapsedTime: 101000, updateTime: 101010 },
        bufferedTime: 101500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SINGLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 5);
      expect(state.state).assertEqual(5);
      expect(state.position?.elapsedTime).assertEqual(101000);
      expect(state.bufferedTime).assertEqual(101500);
      expect(state.loopMode).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0101 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0102
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0102
     * @tc.desc   Verify AVPlaybackState combination 102 (STOP/LIST).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0102 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_STOP,
        speed: 0.5,
        position: { elapsedTime: 102000, updateTime: 102010 },
        bufferedTime: 102500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_LIST
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 6);
      expect(state.state).assertEqual(6);
      expect(state.position?.elapsedTime).assertEqual(102000);
      expect(state.bufferedTime).assertEqual(102500);
      expect(state.loopMode).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0102 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0103
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0103
     * @tc.desc   Verify AVPlaybackState combination 103 (COMPLETED/SHUFFLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0103 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_COMPLETED,
        speed: 0.75,
        position: { elapsedTime: 103000, updateTime: 103010 },
        bufferedTime: 103500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 7);
      expect(state.state).assertEqual(7);
      expect(state.position?.elapsedTime).assertEqual(103000);
      expect(state.bufferedTime).assertEqual(103500);
      expect(state.loopMode).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0103 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0104
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0104
     * @tc.desc   Verify AVPlaybackState combination 104 (RELEASED/CUSTOM).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0104 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_RELEASED,
        speed: 1.0,
        position: { elapsedTime: 104000, updateTime: 104010 },
        bufferedTime: 104500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_CUSTOM
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 8);
      expect(state.state).assertEqual(8);
      expect(state.position?.elapsedTime).assertEqual(104000);
      expect(state.bufferedTime).assertEqual(104500);
      expect(state.loopMode).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0104 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0105
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0105
     * @tc.desc   Verify AVPlaybackState combination 105 (ERROR/SEQUENCE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0105 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_ERROR,
        speed: 1.25,
        position: { elapsedTime: 105000, updateTime: 105010 },
        bufferedTime: 105500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 9);
      expect(state.state).assertEqual(9);
      expect(state.position?.elapsedTime).assertEqual(105000);
      expect(state.bufferedTime).assertEqual(105500);
      expect(state.loopMode).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0105 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0106
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0106
     * @tc.desc   Verify AVPlaybackState combination 106 (IDLE/SINGLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0106 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_IDLE,
        speed: 1.5,
        position: { elapsedTime: 106000, updateTime: 106010 },
        bufferedTime: 106500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SINGLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 10);
      expect(state.state).assertEqual(10);
      expect(state.position?.elapsedTime).assertEqual(106000);
      expect(state.bufferedTime).assertEqual(106500);
      expect(state.loopMode).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0106 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0107
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0107
     * @tc.desc   Verify AVPlaybackState combination 107 (BUFFERING/LIST).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0107 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_BUFFERING,
        speed: 1.75,
        position: { elapsedTime: 107000, updateTime: 107010 },
        bufferedTime: 107500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_LIST
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 11);
      expect(state.state).assertEqual(11);
      expect(state.position?.elapsedTime).assertEqual(107000);
      expect(state.bufferedTime).assertEqual(107500);
      expect(state.loopMode).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0107 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0108
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0108
     * @tc.desc   Verify AVPlaybackState combination 108 (INITIAL/SHUFFLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0108 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_INITIAL,
        speed: 0.5,
        position: { elapsedTime: 108000, updateTime: 108010 },
        bufferedTime: 108500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 0);
      expect(state.state).assertEqual(0);
      expect(state.position?.elapsedTime).assertEqual(108000);
      expect(state.bufferedTime).assertEqual(108500);
      expect(state.loopMode).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0108 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0109
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0109
     * @tc.desc   Verify AVPlaybackState combination 109 (PREPARE/CUSTOM).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0109 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_PREPARE,
        speed: 0.75,
        position: { elapsedTime: 109000, updateTime: 109010 },
        bufferedTime: 109500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_CUSTOM
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 1);
      expect(state.state).assertEqual(1);
      expect(state.position?.elapsedTime).assertEqual(109000);
      expect(state.bufferedTime).assertEqual(109500);
      expect(state.loopMode).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0109 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0110
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0110
     * @tc.desc   Verify AVPlaybackState combination 110 (PLAY/SEQUENCE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0110 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_PLAY,
        speed: 1.0,
        position: { elapsedTime: 110000, updateTime: 110010 },
        bufferedTime: 110500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 2);
      expect(state.state).assertEqual(2);
      expect(state.position?.elapsedTime).assertEqual(110000);
      expect(state.bufferedTime).assertEqual(110500);
      expect(state.loopMode).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0110 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0111
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0111
     * @tc.desc   Verify AVPlaybackState combination 111 (PAUSE/SINGLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0111 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_PAUSE,
        speed: 1.25,
        position: { elapsedTime: 111000, updateTime: 111010 },
        bufferedTime: 111500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SINGLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 3);
      expect(state.state).assertEqual(3);
      expect(state.position?.elapsedTime).assertEqual(111000);
      expect(state.bufferedTime).assertEqual(111500);
      expect(state.loopMode).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0111 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0112
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0112
     * @tc.desc   Verify AVPlaybackState combination 112 (FAST_FORWARD/LIST).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0112 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_FAST_FORWARD,
        speed: 1.5,
        position: { elapsedTime: 112000, updateTime: 112010 },
        bufferedTime: 112500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_LIST
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 4);
      expect(state.state).assertEqual(4);
      expect(state.position?.elapsedTime).assertEqual(112000);
      expect(state.bufferedTime).assertEqual(112500);
      expect(state.loopMode).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0112 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0113
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0113
     * @tc.desc   Verify AVPlaybackState combination 113 (REWIND/SHUFFLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0113 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_REWIND,
        speed: 1.75,
        position: { elapsedTime: 113000, updateTime: 113010 },
        bufferedTime: 113500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 5);
      expect(state.state).assertEqual(5);
      expect(state.position?.elapsedTime).assertEqual(113000);
      expect(state.bufferedTime).assertEqual(113500);
      expect(state.loopMode).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0113 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0114
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0114
     * @tc.desc   Verify AVPlaybackState combination 114 (STOP/CUSTOM).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0114 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_STOP,
        speed: 0.5,
        position: { elapsedTime: 114000, updateTime: 114010 },
        bufferedTime: 114500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_CUSTOM
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 6);
      expect(state.state).assertEqual(6);
      expect(state.position?.elapsedTime).assertEqual(114000);
      expect(state.bufferedTime).assertEqual(114500);
      expect(state.loopMode).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0114 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0115
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0115
     * @tc.desc   Verify AVPlaybackState combination 115 (COMPLETED/SEQUENCE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0115 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_COMPLETED,
        speed: 0.75,
        position: { elapsedTime: 115000, updateTime: 115010 },
        bufferedTime: 115500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 7);
      expect(state.state).assertEqual(7);
      expect(state.position?.elapsedTime).assertEqual(115000);
      expect(state.bufferedTime).assertEqual(115500);
      expect(state.loopMode).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0115 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0116
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0116
     * @tc.desc   Verify AVPlaybackState combination 116 (RELEASED/SINGLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0116 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_RELEASED,
        speed: 1.0,
        position: { elapsedTime: 116000, updateTime: 116010 },
        bufferedTime: 116500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SINGLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 8);
      expect(state.state).assertEqual(8);
      expect(state.position?.elapsedTime).assertEqual(116000);
      expect(state.bufferedTime).assertEqual(116500);
      expect(state.loopMode).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0116 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0117
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0117
     * @tc.desc   Verify AVPlaybackState combination 117 (ERROR/LIST).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0117 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_ERROR,
        speed: 1.25,
        position: { elapsedTime: 117000, updateTime: 117010 },
        bufferedTime: 117500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_LIST
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 9);
      expect(state.state).assertEqual(9);
      expect(state.position?.elapsedTime).assertEqual(117000);
      expect(state.bufferedTime).assertEqual(117500);
      expect(state.loopMode).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0117 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0118
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0118
     * @tc.desc   Verify AVPlaybackState combination 118 (IDLE/SHUFFLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0118 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_IDLE,
        speed: 1.5,
        position: { elapsedTime: 118000, updateTime: 118010 },
        bufferedTime: 118500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 10);
      expect(state.state).assertEqual(10);
      expect(state.position?.elapsedTime).assertEqual(118000);
      expect(state.bufferedTime).assertEqual(118500);
      expect(state.loopMode).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0118 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0119
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0119
     * @tc.desc   Verify AVPlaybackState combination 119 (BUFFERING/CUSTOM).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0119 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_BUFFERING,
        speed: 1.75,
        position: { elapsedTime: 119000, updateTime: 119010 },
        bufferedTime: 119500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_CUSTOM
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 11);
      expect(state.state).assertEqual(11);
      expect(state.position?.elapsedTime).assertEqual(119000);
      expect(state.bufferedTime).assertEqual(119500);
      expect(state.loopMode).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0119 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0120
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0120
     * @tc.desc   Verify AVPlaybackState combination 120 (INITIAL/SEQUENCE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0120 begin');
      const state: AVSessionManager.AVPlaybackState = {
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_INITIAL,
        speed: 0.5,
        position: { elapsedTime: 120000, updateTime: 120010 },
        bufferedTime: 120500,
        loopMode: AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state.state, 0);
      expect(state.state).assertEqual(0);
      expect(state.position?.elapsedTime).assertEqual(120000);
      expect(state.bufferedTime).assertEqual(120500);
      expect(state.loopMode).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0120 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0121
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0121
     * @tc.desc   Verify playback queue variant 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0121 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: -1, description: { assetId: 'playback-001', title: 'Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, -1);
      expect(item.itemId).assertEqual(-1);
      expect(item.description?.title).assertEqual('Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
      expect(item.description?.assetId).assertEqual('playback-001');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0121 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0122
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0122
     * @tc.desc   Verify playback queue variant 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0122 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 2, description: { assetId: 'playback-002', title: 'Quote "title" 2' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 2);
      expect(item.itemId).assertEqual(2);
      expect(item.description?.title).assertEqual('Quote "title" 2');
      expect(item.description?.assetId).assertEqual('playback-002');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0122 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0123
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0123
     * @tc.desc   Verify playback queue variant 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0123 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 100003, description: { assetId: 'playback-003', title: 'Playback Queue 003' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 100003);
      expect(item.itemId).assertEqual(100003);
      expect(item.description?.title).assertEqual('Playback Queue 003');
      expect(item.description?.assetId).assertEqual('playback-003');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0123 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0124
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0124
     * @tc.desc   Verify playback queue variant 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0124 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 0, description: { assetId: 'playback-004', title: '' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 0);
      expect(item.itemId).assertEqual(0);
      expect(item.description?.title).assertEqual('');
      expect(item.description?.assetId).assertEqual('playback-004');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0124 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0125
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0125
     * @tc.desc   Verify playback queue variant 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0125 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: -1, description: { assetId: 'playback-005', title: 'Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, -1);
      expect(item.itemId).assertEqual(-1);
      expect(item.description?.title).assertEqual('Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
      expect(item.description?.assetId).assertEqual('playback-005');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0125 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0126
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0126
     * @tc.desc   Verify playback queue variant 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0126 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 6, description: { assetId: 'playback-006', title: 'Quote "title" 6' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 6);
      expect(item.itemId).assertEqual(6);
      expect(item.description?.title).assertEqual('Quote "title" 6');
      expect(item.description?.assetId).assertEqual('playback-006');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0126 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0127
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0127
     * @tc.desc   Verify playback queue variant 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0127 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 100007, description: { assetId: 'playback-007', title: 'Playback Queue 007' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 100007);
      expect(item.itemId).assertEqual(100007);
      expect(item.description?.title).assertEqual('Playback Queue 007');
      expect(item.description?.assetId).assertEqual('playback-007');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0127 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0128
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0128
     * @tc.desc   Verify playback queue variant 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0128 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 0, description: { assetId: 'playback-008', title: '' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 0);
      expect(item.itemId).assertEqual(0);
      expect(item.description?.title).assertEqual('');
      expect(item.description?.assetId).assertEqual('playback-008');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0128 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0129
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0129
     * @tc.desc   Verify playback queue variant 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0129 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: -1, description: { assetId: 'playback-009', title: 'Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, -1);
      expect(item.itemId).assertEqual(-1);
      expect(item.description?.title).assertEqual('Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
      expect(item.description?.assetId).assertEqual('playback-009');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0129 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0130
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0130
     * @tc.desc   Verify playback queue variant 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0130 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 10, description: { assetId: 'playback-010', title: 'Quote "title" 10' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 10);
      expect(item.itemId).assertEqual(10);
      expect(item.description?.title).assertEqual('Quote "title" 10');
      expect(item.description?.assetId).assertEqual('playback-010');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0130 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0131
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0131
     * @tc.desc   Verify playback queue variant 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0131 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 100011, description: { assetId: 'playback-011', title: 'Playback Queue 011' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 100011);
      expect(item.itemId).assertEqual(100011);
      expect(item.description?.title).assertEqual('Playback Queue 011');
      expect(item.description?.assetId).assertEqual('playback-011');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0131 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0132
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0132
     * @tc.desc   Verify playback queue variant 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0132 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 0, description: { assetId: 'playback-012', title: '' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 0);
      expect(item.itemId).assertEqual(0);
      expect(item.description?.title).assertEqual('');
      expect(item.description?.assetId).assertEqual('playback-012');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0132 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0133
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0133
     * @tc.desc   Verify playback queue variant 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0133 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: -1, description: { assetId: 'playback-013', title: 'Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, -1);
      expect(item.itemId).assertEqual(-1);
      expect(item.description?.title).assertEqual('Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
      expect(item.description?.assetId).assertEqual('playback-013');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0133 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0134
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0134
     * @tc.desc   Verify playback queue variant 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0134 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 14, description: { assetId: 'playback-014', title: 'Quote "title" 14' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 14);
      expect(item.itemId).assertEqual(14);
      expect(item.description?.title).assertEqual('Quote "title" 14');
      expect(item.description?.assetId).assertEqual('playback-014');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0134 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0135
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0135
     * @tc.desc   Verify playback queue variant 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0135 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 100015, description: { assetId: 'playback-015', title: 'Playback Queue 015' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 100015);
      expect(item.itemId).assertEqual(100015);
      expect(item.description?.title).assertEqual('Playback Queue 015');
      expect(item.description?.assetId).assertEqual('playback-015');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0135 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0136
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0136
     * @tc.desc   Verify playback queue variant 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0136 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 0, description: { assetId: 'playback-016', title: '' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 0);
      expect(item.itemId).assertEqual(0);
      expect(item.description?.title).assertEqual('');
      expect(item.description?.assetId).assertEqual('playback-016');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0136 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0137
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0137
     * @tc.desc   Verify playback queue variant 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0137 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: -1, description: { assetId: 'playback-017', title: 'Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, -1);
      expect(item.itemId).assertEqual(-1);
      expect(item.description?.title).assertEqual('Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
      expect(item.description?.assetId).assertEqual('playback-017');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0137 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0138
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0138
     * @tc.desc   Verify playback queue variant 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0138 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 18, description: { assetId: 'playback-018', title: 'Quote "title" 18' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 18);
      expect(item.itemId).assertEqual(18);
      expect(item.description?.title).assertEqual('Quote "title" 18');
      expect(item.description?.assetId).assertEqual('playback-018');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0138 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0139
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0139
     * @tc.desc   Verify playback queue variant 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0139 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 100019, description: { assetId: 'playback-019', title: 'Playback Queue 019' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 100019);
      expect(item.itemId).assertEqual(100019);
      expect(item.description?.title).assertEqual('Playback Queue 019');
      expect(item.description?.assetId).assertEqual('playback-019');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0139 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0140
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0140
     * @tc.desc   Verify playback queue variant 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0140 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 0, description: { assetId: 'playback-020', title: '' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 0);
      expect(item.itemId).assertEqual(0);
      expect(item.description?.title).assertEqual('');
      expect(item.description?.assetId).assertEqual('playback-020');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0140 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0141
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0141
     * @tc.desc   Verify playback queue variant 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0141 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: -1, description: { assetId: 'playback-021', title: 'Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, -1);
      expect(item.itemId).assertEqual(-1);
      expect(item.description?.title).assertEqual('Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
      expect(item.description?.assetId).assertEqual('playback-021');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0141 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0142
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0142
     * @tc.desc   Verify playback queue variant 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0142 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 22, description: { assetId: 'playback-022', title: 'Quote "title" 22' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 22);
      expect(item.itemId).assertEqual(22);
      expect(item.description?.title).assertEqual('Quote "title" 22');
      expect(item.description?.assetId).assertEqual('playback-022');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0142 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0143
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0143
     * @tc.desc   Verify playback queue variant 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0143 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 100023, description: { assetId: 'playback-023', title: 'Playback Queue 023' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 100023);
      expect(item.itemId).assertEqual(100023);
      expect(item.description?.title).assertEqual('Playback Queue 023');
      expect(item.description?.assetId).assertEqual('playback-023');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0143 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0144
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0144
     * @tc.desc   Verify playback queue variant 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0144 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 0, description: { assetId: 'playback-024', title: '' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 0);
      expect(item.itemId).assertEqual(0);
      expect(item.description?.title).assertEqual('');
      expect(item.description?.assetId).assertEqual('playback-024');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0144 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0145
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0145
     * @tc.desc   Verify playback queue variant 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0145 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: -1, description: { assetId: 'playback-025', title: 'Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, -1);
      expect(item.itemId).assertEqual(-1);
      expect(item.description?.title).assertEqual('Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
      expect(item.description?.assetId).assertEqual('playback-025');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0145 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0146
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0146
     * @tc.desc   Verify playback queue variant 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0146 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 26, description: { assetId: 'playback-026', title: 'Quote "title" 26' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 26);
      expect(item.itemId).assertEqual(26);
      expect(item.description?.title).assertEqual('Quote "title" 26');
      expect(item.description?.assetId).assertEqual('playback-026');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0146 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0147
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0147
     * @tc.desc   Verify playback queue variant 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0147 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 100027, description: { assetId: 'playback-027', title: 'Playback Queue 027' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 100027);
      expect(item.itemId).assertEqual(100027);
      expect(item.description?.title).assertEqual('Playback Queue 027');
      expect(item.description?.assetId).assertEqual('playback-027');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0147 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0148
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0148
     * @tc.desc   Verify playback queue variant 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0148 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 0, description: { assetId: 'playback-028', title: '' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 0);
      expect(item.itemId).assertEqual(0);
      expect(item.description?.title).assertEqual('');
      expect(item.description?.assetId).assertEqual('playback-028');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0148 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0149
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0149
     * @tc.desc   Verify playback queue variant 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0149 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: -1, description: { assetId: 'playback-029', title: 'Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, -1);
      expect(item.itemId).assertEqual(-1);
      expect(item.description?.title).assertEqual('Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
      expect(item.description?.assetId).assertEqual('playback-029');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0149 end');
    })
  })
}

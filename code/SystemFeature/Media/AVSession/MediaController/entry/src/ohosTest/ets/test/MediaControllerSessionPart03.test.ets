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

export default function mediaControllerSessionTestPart03() {
  describe('MediaControllerSessionPart03', () => {
    /**
     * @tc.name   com.samples.mediacontroller_Session_0136
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0136
     * @tc.desc   Verify AVPlaybackState timing variant 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0136 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.0,
        position: { elapsedTime: 9000, updateTime: 9020 },
        bufferedTime: 10000
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.0);
      expect(state.speed).assertEqual(1.0);
      expect(state.position?.elapsedTime).assertEqual(9000);
      expect(state.position?.updateTime).assertEqual(9020);
      expect(state.bufferedTime).assertEqual(10000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0136 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0137
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0137
     * @tc.desc   Verify AVPlaybackState timing variant 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0137 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.25,
        position: { elapsedTime: 9250, updateTime: 9270 },
        bufferedTime: 10250
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.25);
      expect(state.speed).assertEqual(1.25);
      expect(state.position?.elapsedTime).assertEqual(9250);
      expect(state.position?.updateTime).assertEqual(9270);
      expect(state.bufferedTime).assertEqual(10250);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0137 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0138
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0138
     * @tc.desc   Verify AVPlaybackState timing variant 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0138 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.5,
        position: { elapsedTime: 9500, updateTime: 9520 },
        bufferedTime: 10500
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.5);
      expect(state.speed).assertEqual(1.5);
      expect(state.position?.elapsedTime).assertEqual(9500);
      expect(state.position?.updateTime).assertEqual(9520);
      expect(state.bufferedTime).assertEqual(10500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0138 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0139
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0139
     * @tc.desc   Verify AVPlaybackState timing variant 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0139 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.75,
        position: { elapsedTime: 9750, updateTime: 9770 },
        bufferedTime: 10750
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.75);
      expect(state.speed).assertEqual(1.75);
      expect(state.position?.elapsedTime).assertEqual(9750);
      expect(state.position?.updateTime).assertEqual(9770);
      expect(state.bufferedTime).assertEqual(10750);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0139 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0140
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0140
     * @tc.desc   Verify AVPlaybackState timing variant 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0140 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.0,
        position: { elapsedTime: 10000, updateTime: 10020 },
        bufferedTime: 11000
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.0);
      expect(state.speed).assertEqual(0.0);
      expect(state.position?.elapsedTime).assertEqual(10000);
      expect(state.position?.updateTime).assertEqual(10020);
      expect(state.bufferedTime).assertEqual(11000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0140 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0141
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0141
     * @tc.desc   Verify AVPlaybackState timing variant 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0141 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.25,
        position: { elapsedTime: 10250, updateTime: 10270 },
        bufferedTime: 11250
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.25);
      expect(state.speed).assertEqual(0.25);
      expect(state.position?.elapsedTime).assertEqual(10250);
      expect(state.position?.updateTime).assertEqual(10270);
      expect(state.bufferedTime).assertEqual(11250);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0141 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0142
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0142
     * @tc.desc   Verify AVPlaybackState timing variant 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0142 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.5,
        position: { elapsedTime: 10500, updateTime: 10520 },
        bufferedTime: 11500
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.5);
      expect(state.speed).assertEqual(0.5);
      expect(state.position?.elapsedTime).assertEqual(10500);
      expect(state.position?.updateTime).assertEqual(10520);
      expect(state.bufferedTime).assertEqual(11500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0142 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0143
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0143
     * @tc.desc   Verify AVPlaybackState timing variant 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0143 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.75,
        position: { elapsedTime: 10750, updateTime: 10770 },
        bufferedTime: 11750
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.75);
      expect(state.speed).assertEqual(0.75);
      expect(state.position?.elapsedTime).assertEqual(10750);
      expect(state.position?.updateTime).assertEqual(10770);
      expect(state.bufferedTime).assertEqual(11750);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0143 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0144
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0144
     * @tc.desc   Verify AVPlaybackState timing variant 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0144 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.0,
        position: { elapsedTime: 11000, updateTime: 11020 },
        bufferedTime: 12000
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.0);
      expect(state.speed).assertEqual(1.0);
      expect(state.position?.elapsedTime).assertEqual(11000);
      expect(state.position?.updateTime).assertEqual(11020);
      expect(state.bufferedTime).assertEqual(12000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0144 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0145
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0145
     * @tc.desc   Verify AVPlaybackState timing variant 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0145 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.25,
        position: { elapsedTime: 11250, updateTime: 11270 },
        bufferedTime: 12250
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.25);
      expect(state.speed).assertEqual(1.25);
      expect(state.position?.elapsedTime).assertEqual(11250);
      expect(state.position?.updateTime).assertEqual(11270);
      expect(state.bufferedTime).assertEqual(12250);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0145 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0146
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0146
     * @tc.desc   Verify AVPlaybackState timing variant 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0146 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.5,
        position: { elapsedTime: 11500, updateTime: 11520 },
        bufferedTime: 12500
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.5);
      expect(state.speed).assertEqual(1.5);
      expect(state.position?.elapsedTime).assertEqual(11500);
      expect(state.position?.updateTime).assertEqual(11520);
      expect(state.bufferedTime).assertEqual(12500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0146 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0147
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0147
     * @tc.desc   Verify AVPlaybackState timing variant 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0147 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.75,
        position: { elapsedTime: 11750, updateTime: 11770 },
        bufferedTime: 12750
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.75);
      expect(state.speed).assertEqual(1.75);
      expect(state.position?.elapsedTime).assertEqual(11750);
      expect(state.position?.updateTime).assertEqual(11770);
      expect(state.bufferedTime).assertEqual(12750);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0147 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0148
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0148
     * @tc.desc   Verify AVPlaybackState timing variant 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0148 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.0,
        position: { elapsedTime: 12000, updateTime: 12020 },
        bufferedTime: 13000
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.0);
      expect(state.speed).assertEqual(0.0);
      expect(state.position?.elapsedTime).assertEqual(12000);
      expect(state.position?.updateTime).assertEqual(12020);
      expect(state.bufferedTime).assertEqual(13000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0148 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0149
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0149
     * @tc.desc   Verify AVPlaybackState timing variant 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0149 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.25,
        position: { elapsedTime: 12250, updateTime: 12270 },
        bufferedTime: 13250
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.25);
      expect(state.speed).assertEqual(0.25);
      expect(state.position?.elapsedTime).assertEqual(12250);
      expect(state.position?.updateTime).assertEqual(12270);
      expect(state.bufferedTime).assertEqual(13250);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0149 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0150
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0150
     * @tc.desc   Verify AVPlaybackState timing variant 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0150 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.5,
        position: { elapsedTime: 12500, updateTime: 12520 },
        bufferedTime: 13500
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.5);
      expect(state.speed).assertEqual(0.5);
      expect(state.position?.elapsedTime).assertEqual(12500);
      expect(state.position?.updateTime).assertEqual(12520);
      expect(state.bufferedTime).assertEqual(13500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0150 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0151
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0151
     * @tc.desc   Verify AVPlaybackState timing variant 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0151 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.75,
        position: { elapsedTime: 12750, updateTime: 12770 },
        bufferedTime: 13750
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.75);
      expect(state.speed).assertEqual(0.75);
      expect(state.position?.elapsedTime).assertEqual(12750);
      expect(state.position?.updateTime).assertEqual(12770);
      expect(state.bufferedTime).assertEqual(13750);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0151 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0152
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0152
     * @tc.desc   Verify AVPlaybackState timing variant 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0152 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.0,
        position: { elapsedTime: 13000, updateTime: 13020 },
        bufferedTime: 14000
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.0);
      expect(state.speed).assertEqual(1.0);
      expect(state.position?.elapsedTime).assertEqual(13000);
      expect(state.position?.updateTime).assertEqual(13020);
      expect(state.bufferedTime).assertEqual(14000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0152 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0153
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0153
     * @tc.desc   Verify AVPlaybackState timing variant 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0153 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.25,
        position: { elapsedTime: 13250, updateTime: 13270 },
        bufferedTime: 14250
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.25);
      expect(state.speed).assertEqual(1.25);
      expect(state.position?.elapsedTime).assertEqual(13250);
      expect(state.position?.updateTime).assertEqual(13270);
      expect(state.bufferedTime).assertEqual(14250);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0153 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0154
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0154
     * @tc.desc   Verify AVPlaybackState timing variant 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0154 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.5,
        position: { elapsedTime: 13500, updateTime: 13520 },
        bufferedTime: 14500
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.5);
      expect(state.speed).assertEqual(1.5);
      expect(state.position?.elapsedTime).assertEqual(13500);
      expect(state.position?.updateTime).assertEqual(13520);
      expect(state.bufferedTime).assertEqual(14500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0154 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0155
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0155
     * @tc.desc   Verify AVPlaybackState timing variant 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0155 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.75,
        position: { elapsedTime: 13750, updateTime: 13770 },
        bufferedTime: 14750
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.75);
      expect(state.speed).assertEqual(1.75);
      expect(state.position?.elapsedTime).assertEqual(13750);
      expect(state.position?.updateTime).assertEqual(13770);
      expect(state.bufferedTime).assertEqual(14750);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0155 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0156
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0156
     * @tc.desc   Verify AVPlaybackState timing variant 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0156 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.0,
        position: { elapsedTime: 14000, updateTime: 14020 },
        bufferedTime: 15000
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.0);
      expect(state.speed).assertEqual(0.0);
      expect(state.position?.elapsedTime).assertEqual(14000);
      expect(state.position?.updateTime).assertEqual(14020);
      expect(state.bufferedTime).assertEqual(15000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0156 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0157
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0157
     * @tc.desc   Verify AVPlaybackState timing variant 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0157 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.25,
        position: { elapsedTime: 14250, updateTime: 14270 },
        bufferedTime: 15250
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.25);
      expect(state.speed).assertEqual(0.25);
      expect(state.position?.elapsedTime).assertEqual(14250);
      expect(state.position?.updateTime).assertEqual(14270);
      expect(state.bufferedTime).assertEqual(15250);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0157 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0158
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0158
     * @tc.desc   Verify AVPlaybackState timing variant 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0158 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.5,
        position: { elapsedTime: 14500, updateTime: 14520 },
        bufferedTime: 15500
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.5);
      expect(state.speed).assertEqual(0.5);
      expect(state.position?.elapsedTime).assertEqual(14500);
      expect(state.position?.updateTime).assertEqual(14520);
      expect(state.bufferedTime).assertEqual(15500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0158 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0159
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0159
     * @tc.desc   Verify AVPlaybackState timing variant 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0159 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.75,
        position: { elapsedTime: 14750, updateTime: 14770 },
        bufferedTime: 15750
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.75);
      expect(state.speed).assertEqual(0.75);
      expect(state.position?.elapsedTime).assertEqual(14750);
      expect(state.position?.updateTime).assertEqual(14770);
      expect(state.bufferedTime).assertEqual(15750);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0159 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0160
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0160
     * @tc.desc   Verify AVPlaybackState timing variant 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0160 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.0,
        position: { elapsedTime: 15000, updateTime: 15020 },
        bufferedTime: 16000
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.0);
      expect(state.speed).assertEqual(1.0);
      expect(state.position?.elapsedTime).assertEqual(15000);
      expect(state.position?.updateTime).assertEqual(15020);
      expect(state.bufferedTime).assertEqual(16000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0160 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0161
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0161
     * @tc.desc   Verify AVPlaybackState timing variant 61.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0161 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.25,
        position: { elapsedTime: 15250, updateTime: 15270 },
        bufferedTime: 16250
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.25);
      expect(state.speed).assertEqual(1.25);
      expect(state.position?.elapsedTime).assertEqual(15250);
      expect(state.position?.updateTime).assertEqual(15270);
      expect(state.bufferedTime).assertEqual(16250);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0161 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0162
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0162
     * @tc.desc   Verify AVPlaybackState timing variant 62.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0162 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.5,
        position: { elapsedTime: 15500, updateTime: 15520 },
        bufferedTime: 16500
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.5);
      expect(state.speed).assertEqual(1.5);
      expect(state.position?.elapsedTime).assertEqual(15500);
      expect(state.position?.updateTime).assertEqual(15520);
      expect(state.bufferedTime).assertEqual(16500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0162 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0163
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0163
     * @tc.desc   Verify AVPlaybackState timing variant 63.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0163 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.75,
        position: { elapsedTime: 15750, updateTime: 15770 },
        bufferedTime: 16750
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.75);
      expect(state.speed).assertEqual(1.75);
      expect(state.position?.elapsedTime).assertEqual(15750);
      expect(state.position?.updateTime).assertEqual(15770);
      expect(state.bufferedTime).assertEqual(16750);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0163 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0164
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0164
     * @tc.desc   Verify AVPlaybackState timing variant 64.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0164 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.0,
        position: { elapsedTime: 16000, updateTime: 16020 },
        bufferedTime: 17000
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.0);
      expect(state.speed).assertEqual(0.0);
      expect(state.position?.elapsedTime).assertEqual(16000);
      expect(state.position?.updateTime).assertEqual(16020);
      expect(state.bufferedTime).assertEqual(17000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0164 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0165
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0165
     * @tc.desc   Verify AVPlaybackState timing variant 65.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0165 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.25,
        position: { elapsedTime: 16250, updateTime: 16270 },
        bufferedTime: 17250
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.25);
      expect(state.speed).assertEqual(0.25);
      expect(state.position?.elapsedTime).assertEqual(16250);
      expect(state.position?.updateTime).assertEqual(16270);
      expect(state.bufferedTime).assertEqual(17250);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0165 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0166
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0166
     * @tc.desc   Verify AVPlaybackState timing variant 66.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0166 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.5,
        position: { elapsedTime: 16500, updateTime: 16520 },
        bufferedTime: 17500
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.5);
      expect(state.speed).assertEqual(0.5);
      expect(state.position?.elapsedTime).assertEqual(16500);
      expect(state.position?.updateTime).assertEqual(16520);
      expect(state.bufferedTime).assertEqual(17500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0166 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0167
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0167
     * @tc.desc   Verify AVPlaybackState timing variant 67.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0167 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.75,
        position: { elapsedTime: 16750, updateTime: 16770 },
        bufferedTime: 17750
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.75);
      expect(state.speed).assertEqual(0.75);
      expect(state.position?.elapsedTime).assertEqual(16750);
      expect(state.position?.updateTime).assertEqual(16770);
      expect(state.bufferedTime).assertEqual(17750);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0167 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0168
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0168
     * @tc.desc   Verify AVPlaybackState timing variant 68.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0168 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.0,
        position: { elapsedTime: 17000, updateTime: 17020 },
        bufferedTime: 18000
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.0);
      expect(state.speed).assertEqual(1.0);
      expect(state.position?.elapsedTime).assertEqual(17000);
      expect(state.position?.updateTime).assertEqual(17020);
      expect(state.bufferedTime).assertEqual(18000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0168 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0169
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0169
     * @tc.desc   Verify AVPlaybackState timing variant 69.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0169 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.25,
        position: { elapsedTime: 17250, updateTime: 17270 },
        bufferedTime: 18250
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.25);
      expect(state.speed).assertEqual(1.25);
      expect(state.position?.elapsedTime).assertEqual(17250);
      expect(state.position?.updateTime).assertEqual(17270);
      expect(state.bufferedTime).assertEqual(18250);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0169 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0170
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0170
     * @tc.desc   Verify AVPlaybackState timing variant 70.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0170 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.5,
        position: { elapsedTime: 17500, updateTime: 17520 },
        bufferedTime: 18500
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.5);
      expect(state.speed).assertEqual(1.5);
      expect(state.position?.elapsedTime).assertEqual(17500);
      expect(state.position?.updateTime).assertEqual(17520);
      expect(state.bufferedTime).assertEqual(18500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0170 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0171
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0171
     * @tc.desc   Verify AVPlaybackState timing variant 71.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0171 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.75,
        position: { elapsedTime: 17750, updateTime: 17770 },
        bufferedTime: 18750
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.75);
      expect(state.speed).assertEqual(1.75);
      expect(state.position?.elapsedTime).assertEqual(17750);
      expect(state.position?.updateTime).assertEqual(17770);
      expect(state.bufferedTime).assertEqual(18750);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0171 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0172
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0172
     * @tc.desc   Verify AVPlaybackState timing variant 72.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0172 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.0,
        position: { elapsedTime: 18000, updateTime: 18020 },
        bufferedTime: 19000
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.0);
      expect(state.speed).assertEqual(0.0);
      expect(state.position?.elapsedTime).assertEqual(18000);
      expect(state.position?.updateTime).assertEqual(18020);
      expect(state.bufferedTime).assertEqual(19000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0172 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0173
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0173
     * @tc.desc   Verify AVPlaybackState timing variant 73.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0173 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.25,
        position: { elapsedTime: 18250, updateTime: 18270 },
        bufferedTime: 19250
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.25);
      expect(state.speed).assertEqual(0.25);
      expect(state.position?.elapsedTime).assertEqual(18250);
      expect(state.position?.updateTime).assertEqual(18270);
      expect(state.bufferedTime).assertEqual(19250);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0173 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0174
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0174
     * @tc.desc   Verify AVPlaybackState timing variant 74.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0174 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.5,
        position: { elapsedTime: 18500, updateTime: 18520 },
        bufferedTime: 19500
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.5);
      expect(state.speed).assertEqual(0.5);
      expect(state.position?.elapsedTime).assertEqual(18500);
      expect(state.position?.updateTime).assertEqual(18520);
      expect(state.bufferedTime).assertEqual(19500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0174 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0175
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0175
     * @tc.desc   Verify AVPlaybackState timing variant 75.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0175 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.75,
        position: { elapsedTime: 18750, updateTime: 18770 },
        bufferedTime: 19750
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.75);
      expect(state.speed).assertEqual(0.75);
      expect(state.position?.elapsedTime).assertEqual(18750);
      expect(state.position?.updateTime).assertEqual(18770);
      expect(state.bufferedTime).assertEqual(19750);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0175 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0176
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0176
     * @tc.desc   Verify AVPlaybackState timing variant 76.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0176 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.0,
        position: { elapsedTime: 19000, updateTime: 19020 },
        bufferedTime: 20000
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.0);
      expect(state.speed).assertEqual(1.0);
      expect(state.position?.elapsedTime).assertEqual(19000);
      expect(state.position?.updateTime).assertEqual(19020);
      expect(state.bufferedTime).assertEqual(20000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0176 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0177
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0177
     * @tc.desc   Verify AVPlaybackState timing variant 77.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0177 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.25,
        position: { elapsedTime: 19250, updateTime: 19270 },
        bufferedTime: 20250
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.25);
      expect(state.speed).assertEqual(1.25);
      expect(state.position?.elapsedTime).assertEqual(19250);
      expect(state.position?.updateTime).assertEqual(19270);
      expect(state.bufferedTime).assertEqual(20250);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0177 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0178
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0178
     * @tc.desc   Verify AVPlaybackState timing variant 78.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0178 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.5,
        position: { elapsedTime: 19500, updateTime: 19520 },
        bufferedTime: 20500
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.5);
      expect(state.speed).assertEqual(1.5);
      expect(state.position?.elapsedTime).assertEqual(19500);
      expect(state.position?.updateTime).assertEqual(19520);
      expect(state.bufferedTime).assertEqual(20500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0178 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0179
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0179
     * @tc.desc   Verify AVPlaybackState timing variant 79.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0179 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.75,
        position: { elapsedTime: 19750, updateTime: 19770 },
        bufferedTime: 20750
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.75);
      expect(state.speed).assertEqual(1.75);
      expect(state.position?.elapsedTime).assertEqual(19750);
      expect(state.position?.updateTime).assertEqual(19770);
      expect(state.bufferedTime).assertEqual(20750);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0179 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0180
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0180
     * @tc.desc   Verify AVPlaybackState timing variant 80.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0180 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.0,
        position: { elapsedTime: 20000, updateTime: 20020 },
        bufferedTime: 21000
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.0);
      expect(state.speed).assertEqual(0.0);
      expect(state.position?.elapsedTime).assertEqual(20000);
      expect(state.position?.updateTime).assertEqual(20020);
      expect(state.bufferedTime).assertEqual(21000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0180 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0181
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0181
     * @tc.desc   Verify bulk Map variant 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0181 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-001-01', 101);
      map.set('bulk-001-02', 102);
      map.set('bulk-001-03', 103);
      map.set('bulk-001-04', 104);
      map.set('bulk-001-05', 105);
      map.set('bulk-001-06', 106);
      map.set('bulk-001-07', 107);
      map.set('bulk-001-08', 108);
      map.set('bulk-001-09', 109);
      map.set('bulk-001-10', 110);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-001-10')).assertEqual(110);
      map.delete('bulk-001-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0181 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0182
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0182
     * @tc.desc   Verify bulk Map variant 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0182 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-002-01', 201);
      map.set('bulk-002-02', 202);
      map.set('bulk-002-03', 203);
      map.set('bulk-002-04', 204);
      map.set('bulk-002-05', 205);
      map.set('bulk-002-06', 206);
      map.set('bulk-002-07', 207);
      map.set('bulk-002-08', 208);
      map.set('bulk-002-09', 209);
      map.set('bulk-002-10', 210);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-002-10')).assertEqual(210);
      map.delete('bulk-002-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0182 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0183
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0183
     * @tc.desc   Verify bulk Map variant 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0183 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-003-01', 301);
      map.set('bulk-003-02', 302);
      map.set('bulk-003-03', 303);
      map.set('bulk-003-04', 304);
      map.set('bulk-003-05', 305);
      map.set('bulk-003-06', 306);
      map.set('bulk-003-07', 307);
      map.set('bulk-003-08', 308);
      map.set('bulk-003-09', 309);
      map.set('bulk-003-10', 310);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-003-10')).assertEqual(310);
      map.delete('bulk-003-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0183 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0184
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0184
     * @tc.desc   Verify bulk Map variant 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0184 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-004-01', 401);
      map.set('bulk-004-02', 402);
      map.set('bulk-004-03', 403);
      map.set('bulk-004-04', 404);
      map.set('bulk-004-05', 405);
      map.set('bulk-004-06', 406);
      map.set('bulk-004-07', 407);
      map.set('bulk-004-08', 408);
      map.set('bulk-004-09', 409);
      map.set('bulk-004-10', 410);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-004-10')).assertEqual(410);
      map.delete('bulk-004-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0184 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0185
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0185
     * @tc.desc   Verify bulk Map variant 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0185 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-005-01', 501);
      map.set('bulk-005-02', 502);
      map.set('bulk-005-03', 503);
      map.set('bulk-005-04', 504);
      map.set('bulk-005-05', 505);
      map.set('bulk-005-06', 506);
      map.set('bulk-005-07', 507);
      map.set('bulk-005-08', 508);
      map.set('bulk-005-09', 509);
      map.set('bulk-005-10', 510);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-005-10')).assertEqual(510);
      map.delete('bulk-005-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0185 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0186
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0186
     * @tc.desc   Verify bulk Map variant 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0186 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-006-01', 601);
      map.set('bulk-006-02', 602);
      map.set('bulk-006-03', 603);
      map.set('bulk-006-04', 604);
      map.set('bulk-006-05', 605);
      map.set('bulk-006-06', 606);
      map.set('bulk-006-07', 607);
      map.set('bulk-006-08', 608);
      map.set('bulk-006-09', 609);
      map.set('bulk-006-10', 610);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-006-10')).assertEqual(610);
      map.delete('bulk-006-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0186 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0187
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0187
     * @tc.desc   Verify bulk Map variant 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0187 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-007-01', 701);
      map.set('bulk-007-02', 702);
      map.set('bulk-007-03', 703);
      map.set('bulk-007-04', 704);
      map.set('bulk-007-05', 705);
      map.set('bulk-007-06', 706);
      map.set('bulk-007-07', 707);
      map.set('bulk-007-08', 708);
      map.set('bulk-007-09', 709);
      map.set('bulk-007-10', 710);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-007-10')).assertEqual(710);
      map.delete('bulk-007-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0187 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0188
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0188
     * @tc.desc   Verify bulk Map variant 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0188 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-008-01', 801);
      map.set('bulk-008-02', 802);
      map.set('bulk-008-03', 803);
      map.set('bulk-008-04', 804);
      map.set('bulk-008-05', 805);
      map.set('bulk-008-06', 806);
      map.set('bulk-008-07', 807);
      map.set('bulk-008-08', 808);
      map.set('bulk-008-09', 809);
      map.set('bulk-008-10', 810);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-008-10')).assertEqual(810);
      map.delete('bulk-008-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0188 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0189
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0189
     * @tc.desc   Verify bulk Map variant 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0189 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-009-01', 901);
      map.set('bulk-009-02', 902);
      map.set('bulk-009-03', 903);
      map.set('bulk-009-04', 904);
      map.set('bulk-009-05', 905);
      map.set('bulk-009-06', 906);
      map.set('bulk-009-07', 907);
      map.set('bulk-009-08', 908);
      map.set('bulk-009-09', 909);
      map.set('bulk-009-10', 910);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-009-10')).assertEqual(910);
      map.delete('bulk-009-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0189 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0190
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0190
     * @tc.desc   Verify bulk Map variant 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0190 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-010-01', 1001);
      map.set('bulk-010-02', 1002);
      map.set('bulk-010-03', 1003);
      map.set('bulk-010-04', 1004);
      map.set('bulk-010-05', 1005);
      map.set('bulk-010-06', 1006);
      map.set('bulk-010-07', 1007);
      map.set('bulk-010-08', 1008);
      map.set('bulk-010-09', 1009);
      map.set('bulk-010-10', 1010);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-010-10')).assertEqual(1010);
      map.delete('bulk-010-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0190 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0191
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0191
     * @tc.desc   Verify bulk Map variant 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0191 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-011-01', 1101);
      map.set('bulk-011-02', 1102);
      map.set('bulk-011-03', 1103);
      map.set('bulk-011-04', 1104);
      map.set('bulk-011-05', 1105);
      map.set('bulk-011-06', 1106);
      map.set('bulk-011-07', 1107);
      map.set('bulk-011-08', 1108);
      map.set('bulk-011-09', 1109);
      map.set('bulk-011-10', 1110);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-011-10')).assertEqual(1110);
      map.delete('bulk-011-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0191 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0192
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0192
     * @tc.desc   Verify bulk Map variant 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0192 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-012-01', 1201);
      map.set('bulk-012-02', 1202);
      map.set('bulk-012-03', 1203);
      map.set('bulk-012-04', 1204);
      map.set('bulk-012-05', 1205);
      map.set('bulk-012-06', 1206);
      map.set('bulk-012-07', 1207);
      map.set('bulk-012-08', 1208);
      map.set('bulk-012-09', 1209);
      map.set('bulk-012-10', 1210);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-012-10')).assertEqual(1210);
      map.delete('bulk-012-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0192 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0193
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0193
     * @tc.desc   Verify bulk Map variant 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0193 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-013-01', 1301);
      map.set('bulk-013-02', 1302);
      map.set('bulk-013-03', 1303);
      map.set('bulk-013-04', 1304);
      map.set('bulk-013-05', 1305);
      map.set('bulk-013-06', 1306);
      map.set('bulk-013-07', 1307);
      map.set('bulk-013-08', 1308);
      map.set('bulk-013-09', 1309);
      map.set('bulk-013-10', 1310);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-013-10')).assertEqual(1310);
      map.delete('bulk-013-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0193 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0194
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0194
     * @tc.desc   Verify bulk Map variant 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0194 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-014-01', 1401);
      map.set('bulk-014-02', 1402);
      map.set('bulk-014-03', 1403);
      map.set('bulk-014-04', 1404);
      map.set('bulk-014-05', 1405);
      map.set('bulk-014-06', 1406);
      map.set('bulk-014-07', 1407);
      map.set('bulk-014-08', 1408);
      map.set('bulk-014-09', 1409);
      map.set('bulk-014-10', 1410);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-014-10')).assertEqual(1410);
      map.delete('bulk-014-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0194 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0195
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0195
     * @tc.desc   Verify bulk Map variant 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0195 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-015-01', 1501);
      map.set('bulk-015-02', 1502);
      map.set('bulk-015-03', 1503);
      map.set('bulk-015-04', 1504);
      map.set('bulk-015-05', 1505);
      map.set('bulk-015-06', 1506);
      map.set('bulk-015-07', 1507);
      map.set('bulk-015-08', 1508);
      map.set('bulk-015-09', 1509);
      map.set('bulk-015-10', 1510);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-015-10')).assertEqual(1510);
      map.delete('bulk-015-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0195 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0196
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0196
     * @tc.desc   Verify bulk Map variant 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0196 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-016-01', 1601);
      map.set('bulk-016-02', 1602);
      map.set('bulk-016-03', 1603);
      map.set('bulk-016-04', 1604);
      map.set('bulk-016-05', 1605);
      map.set('bulk-016-06', 1606);
      map.set('bulk-016-07', 1607);
      map.set('bulk-016-08', 1608);
      map.set('bulk-016-09', 1609);
      map.set('bulk-016-10', 1610);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-016-10')).assertEqual(1610);
      map.delete('bulk-016-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0196 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0197
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0197
     * @tc.desc   Verify bulk Map variant 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0197 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-017-01', 1701);
      map.set('bulk-017-02', 1702);
      map.set('bulk-017-03', 1703);
      map.set('bulk-017-04', 1704);
      map.set('bulk-017-05', 1705);
      map.set('bulk-017-06', 1706);
      map.set('bulk-017-07', 1707);
      map.set('bulk-017-08', 1708);
      map.set('bulk-017-09', 1709);
      map.set('bulk-017-10', 1710);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-017-10')).assertEqual(1710);
      map.delete('bulk-017-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0197 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0198
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0198
     * @tc.desc   Verify bulk Map variant 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0198 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-018-01', 1801);
      map.set('bulk-018-02', 1802);
      map.set('bulk-018-03', 1803);
      map.set('bulk-018-04', 1804);
      map.set('bulk-018-05', 1805);
      map.set('bulk-018-06', 1806);
      map.set('bulk-018-07', 1807);
      map.set('bulk-018-08', 1808);
      map.set('bulk-018-09', 1809);
      map.set('bulk-018-10', 1810);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-018-10')).assertEqual(1810);
      map.delete('bulk-018-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0198 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0199
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0199
     * @tc.desc   Verify bulk Map variant 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0199 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-019-01', 1901);
      map.set('bulk-019-02', 1902);
      map.set('bulk-019-03', 1903);
      map.set('bulk-019-04', 1904);
      map.set('bulk-019-05', 1905);
      map.set('bulk-019-06', 1906);
      map.set('bulk-019-07', 1907);
      map.set('bulk-019-08', 1908);
      map.set('bulk-019-09', 1909);
      map.set('bulk-019-10', 1910);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-019-10')).assertEqual(1910);
      map.delete('bulk-019-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0199 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0200
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0200
     * @tc.desc   Verify bulk Map variant 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0200 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-020-01', 2001);
      map.set('bulk-020-02', 2002);
      map.set('bulk-020-03', 2003);
      map.set('bulk-020-04', 2004);
      map.set('bulk-020-05', 2005);
      map.set('bulk-020-06', 2006);
      map.set('bulk-020-07', 2007);
      map.set('bulk-020-08', 2008);
      map.set('bulk-020-09', 2009);
      map.set('bulk-020-10', 2010);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-020-10')).assertEqual(2010);
      map.delete('bulk-020-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0200 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0201
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0201
     * @tc.desc   Verify bulk Map variant 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0201 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-021-01', 2101);
      map.set('bulk-021-02', 2102);
      map.set('bulk-021-03', 2103);
      map.set('bulk-021-04', 2104);
      map.set('bulk-021-05', 2105);
      map.set('bulk-021-06', 2106);
      map.set('bulk-021-07', 2107);
      map.set('bulk-021-08', 2108);
      map.set('bulk-021-09', 2109);
      map.set('bulk-021-10', 2110);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-021-10')).assertEqual(2110);
      map.delete('bulk-021-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0201 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0202
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0202
     * @tc.desc   Verify bulk Map variant 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0202 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-022-01', 2201);
      map.set('bulk-022-02', 2202);
      map.set('bulk-022-03', 2203);
      map.set('bulk-022-04', 2204);
      map.set('bulk-022-05', 2205);
      map.set('bulk-022-06', 2206);
      map.set('bulk-022-07', 2207);
      map.set('bulk-022-08', 2208);
      map.set('bulk-022-09', 2209);
      map.set('bulk-022-10', 2210);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-022-10')).assertEqual(2210);
      map.delete('bulk-022-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0202 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0203
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0203
     * @tc.desc   Verify bulk Map variant 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0203 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-023-01', 2301);
      map.set('bulk-023-02', 2302);
      map.set('bulk-023-03', 2303);
      map.set('bulk-023-04', 2304);
      map.set('bulk-023-05', 2305);
      map.set('bulk-023-06', 2306);
      map.set('bulk-023-07', 2307);
      map.set('bulk-023-08', 2308);
      map.set('bulk-023-09', 2309);
      map.set('bulk-023-10', 2310);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-023-10')).assertEqual(2310);
      map.delete('bulk-023-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0203 end');
    })
  })
}

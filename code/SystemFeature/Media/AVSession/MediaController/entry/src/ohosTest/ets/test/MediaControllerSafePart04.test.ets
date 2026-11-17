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

export default function mediaControllerSafeTestPart04() {
  describe('MediaControllerSafePart04', () => {
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0291
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0291
     * @tc.desc   Verify loop mode SINGLE (31).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0291 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_SINGLE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, mode);
      expect(mode === AVSessionManager.LoopMode.LOOP_MODE_SINGLE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0291 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0292
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0292
     * @tc.desc   Verify loop mode LIST (32).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0292 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_LIST;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, mode);
      expect(mode === AVSessionManager.LoopMode.LOOP_MODE_LIST).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0292 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0293
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0293
     * @tc.desc   Verify loop mode SHUFFLE (33).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0293 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, mode);
      expect(mode === AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0293 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0294
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0294
     * @tc.desc   Verify loop mode CUSTOM (34).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0294 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_CUSTOM;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, mode);
      expect(mode === AVSessionManager.LoopMode.LOOP_MODE_CUSTOM).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0294 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0295
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0295
     * @tc.desc   Verify loop mode SEQUENCE (35).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0295 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, mode);
      expect(mode === AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0295 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0296
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0296
     * @tc.desc   Verify loop mode SINGLE (36).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0296 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_SINGLE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, mode);
      expect(mode === AVSessionManager.LoopMode.LOOP_MODE_SINGLE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0296 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0297
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0297
     * @tc.desc   Verify loop mode LIST (37).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0297 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_LIST;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, mode);
      expect(mode === AVSessionManager.LoopMode.LOOP_MODE_LIST).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0297 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0298
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0298
     * @tc.desc   Verify loop mode SHUFFLE (38).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0298 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, mode);
      expect(mode === AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0298 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0299
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0299
     * @tc.desc   Verify loop mode CUSTOM (39).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0299 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_CUSTOM;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, mode);
      expect(mode === AVSessionManager.LoopMode.LOOP_MODE_CUSTOM).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0299 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0300
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0300
     * @tc.desc   Verify loop mode SEQUENCE (40).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0300 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, mode);
      expect(mode === AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0300 end');
    })
  })
}

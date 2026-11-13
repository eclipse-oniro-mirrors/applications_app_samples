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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { startContinuousTask, stopContinuousTask } from '../../../main/ets/common/utils/BackgroundUtil';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_VideoConferenceDemo]';

export default function BackgroundGuardPart1Test(): void {
  describe('BackgroundGuardPart1', () => {

    /**
     * @tc.number    SUB_VIDEO_CONF_BGP1_0100
     * @tc.name      testBackgroundGuard0001
     * @tc.desc      Verify start with undefined context is a no-op that does not throw.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBackgroundGuard0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBackgroundGuard0001 begin');
      let threw: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBackgroundGuard0001 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_BGP1_0200
     * @tc.name      testBackgroundGuard0002
     * @tc.desc      Verify stop with undefined context is a no-op that does not throw.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBackgroundGuard0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBackgroundGuard0002 begin');
      let threw: boolean = false;
      try {
        stopContinuousTask(undefined);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBackgroundGuard0002 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_BGP1_0300
     * @tc.name      testBackgroundGuard0003
     * @tc.desc      Verify start twice with undefined context is a no-op that does not throw.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBackgroundGuard0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBackgroundGuard0003 begin');
      let threw: boolean = false;
      try {
        startContinuousTask(undefined); startContinuousTask(undefined);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBackgroundGuard0003 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_BGP1_0400
     * @tc.name      testBackgroundGuard0004
     * @tc.desc      Verify stop twice with undefined context is a no-op that does not throw.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBackgroundGuard0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBackgroundGuard0004 begin');
      let threw: boolean = false;
      try {
        stopContinuousTask(undefined); stopContinuousTask(undefined);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBackgroundGuard0004 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_BGP1_0500
     * @tc.name      testBackgroundGuard0005
     * @tc.desc      Verify start then stop with undefined context is a no-op that does not throw.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBackgroundGuard0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBackgroundGuard0005 begin');
      let threw: boolean = false;
      try {
        startContinuousTask(undefined); stopContinuousTask(undefined);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBackgroundGuard0005 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_BGP1_0600
     * @tc.name      testBackgroundGuard0006
     * @tc.desc      Verify stop then start with undefined context is a no-op that does not throw.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBackgroundGuard0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBackgroundGuard0006 begin');
      let threw: boolean = false;
      try {
        stopContinuousTask(undefined); startContinuousTask(undefined);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBackgroundGuard0006 end');
    })

  })
}

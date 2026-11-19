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
import Logger from '../../../main/ets/common/utils/Logger';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF812;
const TAG: string = '[Sample_PhotoSameSource]';

export default function LoggerCountMatrixPart2Test(): void {
  describe('LoggerCountMatrixPart2', () => {

    /**
     * @tc.number    SUB_PHOTO_LOGNP2_4100
     * @tc.name      testLoggerCount0041
     * @tc.desc      Verify Logger.error accepts 5 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0041 begin');
      let threw: boolean = false;
      try {
        Logger.error('a1', 'a2', 'a3', 'a4', 'a5');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0041 end');
    })

    /**
     * @tc.number    SUB_PHOTO_LOGNP2_4200
     * @tc.name      testLoggerCount0042
     * @tc.desc      Verify Logger.error accepts 6 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0042 begin');
      let threw: boolean = false;
      try {
        Logger.error('a1', 'a2', 'a3', 'a4', 'a5', 'a6');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0042 end');
    })

    /**
     * @tc.number    SUB_PHOTO_LOGNP2_4300
     * @tc.name      testLoggerCount0043
     * @tc.desc      Verify Logger.error accepts 7 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0043 begin');
      let threw: boolean = false;
      try {
        Logger.error('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0043 end');
    })

    /**
     * @tc.number    SUB_PHOTO_LOGNP2_4400
     * @tc.name      testLoggerCount0044
     * @tc.desc      Verify Logger.error accepts 8 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0044 begin');
      let threw: boolean = false;
      try {
        Logger.error('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0044 end');
    })

    /**
     * @tc.number    SUB_PHOTO_LOGNP2_4500
     * @tc.name      testLoggerCount0045
     * @tc.desc      Verify Logger.error accepts 9 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0045 begin');
      let threw: boolean = false;
      try {
        Logger.error('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0045 end');
    })

    /**
     * @tc.number    SUB_PHOTO_LOGNP2_4600
     * @tc.name      testLoggerCount0046
     * @tc.desc      Verify Logger.error accepts 10 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0046 begin');
      let threw: boolean = false;
      try {
        Logger.error('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0046 end');
    })

    /**
     * @tc.number    SUB_PHOTO_LOGNP2_4700
     * @tc.name      testLoggerCount0047
     * @tc.desc      Verify Logger.error accepts 11 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0047 begin');
      let threw: boolean = false;
      try {
        Logger.error('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0047 end');
    })

    /**
     * @tc.number    SUB_PHOTO_LOGNP2_4800
     * @tc.name      testLoggerCount0048
     * @tc.desc      Verify Logger.error accepts 12 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0048 begin');
      let threw: boolean = false;
      try {
        Logger.error('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0048 end');
    })

  })
}

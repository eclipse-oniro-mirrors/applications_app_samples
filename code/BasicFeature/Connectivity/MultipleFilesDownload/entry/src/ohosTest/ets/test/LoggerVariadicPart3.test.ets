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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { logger } from 'multiplefilesdownload/src/main/ets/utils/Logger';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_MultipleFilesDownload]';

export default function LoggerVariadicPart3Test(): void {
  describe('LoggerVariadicPart3', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP3_ONE_0100
     * @tc.name      testLoggerVariadic0181
     * @tc.desc      Verify logger.error accepts 3 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0181 begin');
      let threw: boolean = false;
      try {
        logger.error('x', 'y', 'z');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0181 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP3_ONE_0200
     * @tc.name      testLoggerVariadic0182
     * @tc.desc      Verify logger.error accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0182 begin');
      let threw: boolean = false;
      try {
        logger.error('A', 'B', 'C', 'D');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0182 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP3_ONE_0300
     * @tc.name      testLoggerVariadic0183
     * @tc.desc      Verify logger.error accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0183 begin');
      let threw: boolean = false;
      try {
        logger.error('TAG', 'a', 'b', 'c');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0183 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP3_ONE_0400
     * @tc.name      testLoggerVariadic0184
     * @tc.desc      Verify logger.error accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0184 begin');
      let threw: boolean = false;
      try {
        logger.error('1', '2', '3', '4');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0184 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP3_ONE_0500
     * @tc.name      testLoggerVariadic0185
     * @tc.desc      Verify logger.error accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0185 begin');
      let threw: boolean = false;
      try {
        logger.error('w', 'x', 'y', 'z');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0185 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP3_ONE_0600
     * @tc.name      testLoggerVariadic0186
     * @tc.desc      Verify logger.error accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0186 begin');
      let threw: boolean = false;
      try {
        logger.error('中文', '标签', '消息', '内容');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0186 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP3_ONE_0700
     * @tc.name      testLoggerVariadic0187
     * @tc.desc      Verify logger.error accepts 5 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0187 begin');
      let threw: boolean = false;
      try {
        logger.error('A', 'B', 'C', 'D', 'E');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0187 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP3_ONE_0800
     * @tc.name      testLoggerVariadic0188
     * @tc.desc      Verify logger.error accepts 5 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0188 begin');
      let threw: boolean = false;
      try {
        logger.error('a', 'b', 'c', 'd', 'e');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0188 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP3_ONE_0900
     * @tc.name      testLoggerVariadic0189
     * @tc.desc      Verify logger.error accepts 5 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0189 begin');
      let threw: boolean = false;
      try {
        logger.error('1', '2', '3', '4', '5');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0189 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP3_ONE_1000
     * @tc.name      testLoggerVariadic0190
     * @tc.desc      Verify logger.error accepts 5 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0190 begin');
      let threw: boolean = false;
      try {
        logger.error('TAG', 'm1', 'm2', 'm3', 'm4');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0190 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP3_ONE_1100
     * @tc.name      testLoggerVariadic0191
     * @tc.desc      Verify logger.error accepts 5 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0191 begin');
      let threw: boolean = false;
      try {
        logger.error('中文', '一', '二', '三', '四');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0191 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP3_ONE_1200
     * @tc.name      testLoggerVariadic0192
     * @tc.desc      Verify logger.error accepts 5 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0192 begin');
      let threw: boolean = false;
      try {
        logger.error('v', 'w', 'x', 'y', 'z');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0192 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP3_ONE_1300
     * @tc.name      testLoggerVariadic0193
     * @tc.desc      Verify logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0193 begin');
      let threw: boolean = false;
      try {
        logger.error('yes', 'no');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0193 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP3_ONE_1400
     * @tc.name      testLoggerVariadic0194
     * @tc.desc      Verify logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0194 begin');
      let threw: boolean = false;
      try {
        logger.error('on', 'off');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0194 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP3_ONE_1500
     * @tc.name      testLoggerVariadic0195
     * @tc.desc      Verify logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0195 begin');
      let threw: boolean = false;
      try {
        logger.error('start', 'end');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0195 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP3_ONE_1600
     * @tc.name      testLoggerVariadic0196
     * @tc.desc      Verify logger.error accepts representative argument set 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0196 begin');
      let threw: boolean = false;
      try {
        logger.error('');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0196 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP3_ONE_1700
     * @tc.name      testLoggerVariadic0197
     * @tc.desc      Verify logger.error accepts representative argument set 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0197 begin');
      let threw: boolean = false;
      try {
        logger.error('tag', 'value');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0197 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP3_ONE_1800
     * @tc.name      testLoggerVariadic0198
     * @tc.desc      Verify logger.error accepts representative argument set 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0198 begin');
      let threw: boolean = false;
      try {
        logger.error('a', 'b', 'c', 'd', 'e');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0198 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP3_ONE_1900
     * @tc.name      testLoggerVariadic0199
     * @tc.desc      Verify logger.error accepts representative argument set 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0199 begin');
      let threw: boolean = false;
      try {
        logger.error('中文', 'emoji🙂', 'long_value_0123456789');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0199 end');
    })

  })
}

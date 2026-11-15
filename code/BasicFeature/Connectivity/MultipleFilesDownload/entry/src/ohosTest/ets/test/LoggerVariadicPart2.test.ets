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

export default function LoggerVariadicPart2Test(): void {
  describe('LoggerVariadicPart2', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_9100
     * @tc.name      testLoggerVariadic0091
     * @tc.desc      Verify logger.info accepts 5 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0091 begin');
      let threw: boolean = false;
      try {
        logger.info('中文', '一', '二', '三', '四');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0091 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_9200
     * @tc.name      testLoggerVariadic0092
     * @tc.desc      Verify logger.info accepts 5 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0092 begin');
      let threw: boolean = false;
      try {
        logger.info('v', 'w', 'x', 'y', 'z');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0092 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_9300
     * @tc.name      testLoggerVariadic0093
     * @tc.desc      Verify logger.info accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0093 begin');
      let threw: boolean = false;
      try {
        logger.info('yes', 'no');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0093 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_9400
     * @tc.name      testLoggerVariadic0094
     * @tc.desc      Verify logger.info accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0094 begin');
      let threw: boolean = false;
      try {
        logger.info('on', 'off');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0094 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_9500
     * @tc.name      testLoggerVariadic0095
     * @tc.desc      Verify logger.info accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0095 begin');
      let threw: boolean = false;
      try {
        logger.info('start', 'end');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0095 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_9600
     * @tc.name      testLoggerVariadic0096
     * @tc.desc      Verify logger.info accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0096 begin');
      let threw: boolean = false;
      try {
        logger.info('tag', 'value');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0096 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_9700
     * @tc.name      testLoggerVariadic0097
     * @tc.desc      Verify logger.info accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0097 begin');
      let threw: boolean = false;
      try {
        logger.info('k', 'v');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0097 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_9800
     * @tc.name      testLoggerVariadic0098
     * @tc.desc      Verify logger.info accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0098 begin');
      let threw: boolean = false;
      try {
        logger.info('key', 'value');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0098 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_9900
     * @tc.name      testLoggerVariadic0099
     * @tc.desc      Verify logger.info accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0099 begin');
      let threw: boolean = false;
      try {
        logger.info('name', 'age');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0099 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_10000
     * @tc.name      testLoggerVariadic0100
     * @tc.desc      Verify logger.info accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0100 begin');
      let threw: boolean = false;
      try {
        logger.info('arg0', 'value0');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0100 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_10100
     * @tc.name      testLoggerVariadic0101
     * @tc.desc      Verify logger.warn accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0101 begin');
      let threw: boolean = false;
      try {
        logger.warn('');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0101 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_10200
     * @tc.name      testLoggerVariadic0102
     * @tc.desc      Verify logger.warn accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0102 begin');
      let threw: boolean = false;
      try {
        logger.warn('a');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0102 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_10300
     * @tc.name      testLoggerVariadic0103
     * @tc.desc      Verify logger.warn accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0103 begin');
      let threw: boolean = false;
      try {
        logger.warn('message');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0103 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_10400
     * @tc.name      testLoggerVariadic0104
     * @tc.desc      Verify logger.warn accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0104 begin');
      let threw: boolean = false;
      try {
        logger.warn('中文消息');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0104 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_10500
     * @tc.name      testLoggerVariadic0105
     * @tc.desc      Verify logger.warn accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0105 begin');
      let threw: boolean = false;
      try {
        logger.warn('😀 emoji');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0105 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_10600
     * @tc.name      testLoggerVariadic0106
     * @tc.desc      Verify logger.warn accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0106 begin');
      let threw: boolean = false;
      try {
        logger.warn('%{public}s');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0106 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_10700
     * @tc.name      testLoggerVariadic0107
     * @tc.desc      Verify logger.warn accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0107 begin');
      let threw: boolean = false;
      try {
        logger.warn('a,b');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0107 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_10800
     * @tc.name      testLoggerVariadic0108
     * @tc.desc      Verify logger.warn accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0108 begin');
      let threw: boolean = false;
      try {
        logger.warn('line1\nline2');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0108 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_10900
     * @tc.name      testLoggerVariadic0109
     * @tc.desc      Verify logger.warn accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0109 begin');
      let threw: boolean = false;
      try {
        logger.warn('tab\tchar');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0109 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_11000
     * @tc.name      testLoggerVariadic0110
     * @tc.desc      Verify logger.warn accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0110 begin');
      let threw: boolean = false;
      try {
        logger.warn('quote\'s');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0110 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_11100
     * @tc.name      testLoggerVariadic0111
     * @tc.desc      Verify logger.warn accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0111 begin');
      let threw: boolean = false;
      try {
        logger.warn('back\\slash');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0111 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_11200
     * @tc.name      testLoggerVariadic0112
     * @tc.desc      Verify logger.warn accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0112 begin');
      let threw: boolean = false;
      try {
        logger.warn('null');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0112 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_11300
     * @tc.name      testLoggerVariadic0113
     * @tc.desc      Verify logger.warn accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0113 begin');
      let threw: boolean = false;
      try {
        logger.warn('0');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0113 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_11400
     * @tc.name      testLoggerVariadic0114
     * @tc.desc      Verify logger.warn accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0114 begin');
      let threw: boolean = false;
      try {
        logger.warn('true');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0114 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_11500
     * @tc.name      testLoggerVariadic0115
     * @tc.desc      Verify logger.warn accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0115 begin');
      let threw: boolean = false;
      try {
        logger.warn('false');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0115 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_11600
     * @tc.name      testLoggerVariadic0116
     * @tc.desc      Verify logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0116 begin');
      let threw: boolean = false;
      try {
        logger.warn('TAG', 'message');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0116 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_11700
     * @tc.name      testLoggerVariadic0117
     * @tc.desc      Verify logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0117 begin');
      let threw: boolean = false;
      try {
        logger.warn('TAG', '');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0117 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_11800
     * @tc.name      testLoggerVariadic0118
     * @tc.desc      Verify logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0118 begin');
      let threw: boolean = false;
      try {
        logger.warn('', 'message');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0118 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_11900
     * @tc.name      testLoggerVariadic0119
     * @tc.desc      Verify logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0119 begin');
      let threw: boolean = false;
      try {
        logger.warn('TAG', '中文');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0119 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_12000
     * @tc.name      testLoggerVariadic0120
     * @tc.desc      Verify logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0120 begin');
      let threw: boolean = false;
      try {
        logger.warn('TAG', '😀');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0120 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_12100
     * @tc.name      testLoggerVariadic0121
     * @tc.desc      Verify logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0121 begin');
      let threw: boolean = false;
      try {
        logger.warn('A', 'B');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0121 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_12200
     * @tc.name      testLoggerVariadic0122
     * @tc.desc      Verify logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0122 begin');
      let threw: boolean = false;
      try {
        logger.warn('0', '1');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0122 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_12300
     * @tc.name      testLoggerVariadic0123
     * @tc.desc      Verify logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0123 begin');
      let threw: boolean = false;
      try {
        logger.warn('true', 'false');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0123 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_12400
     * @tc.name      testLoggerVariadic0124
     * @tc.desc      Verify logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0124 begin');
      let threw: boolean = false;
      try {
        logger.warn('left', 'right');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0124 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_12500
     * @tc.name      testLoggerVariadic0125
     * @tc.desc      Verify logger.warn accepts 3 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0125 begin');
      let threw: boolean = false;
      try {
        logger.warn('A', 'B', 'C');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0125 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_12600
     * @tc.name      testLoggerVariadic0126
     * @tc.desc      Verify logger.warn accepts 3 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0126 begin');
      let threw: boolean = false;
      try {
        logger.warn('TAG', 'stage', 'message');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0126 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_12700
     * @tc.name      testLoggerVariadic0127
     * @tc.desc      Verify logger.warn accepts 3 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0127 begin');
      let threw: boolean = false;
      try {
        logger.warn('', '', '');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0127 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_12800
     * @tc.name      testLoggerVariadic0128
     * @tc.desc      Verify logger.warn accepts 3 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0128 begin');
      let threw: boolean = false;
      try {
        logger.warn('中文', '消息', '内容');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0128 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_12900
     * @tc.name      testLoggerVariadic0129
     * @tc.desc      Verify logger.warn accepts 3 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0129 begin');
      let threw: boolean = false;
      try {
        logger.warn('1', '2', '3');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0129 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_13000
     * @tc.name      testLoggerVariadic0130
     * @tc.desc      Verify logger.warn accepts 3 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0130 begin');
      let threw: boolean = false;
      try {
        logger.warn('a', 'b', 'c');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0130 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_13100
     * @tc.name      testLoggerVariadic0131
     * @tc.desc      Verify logger.warn accepts 3 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0131 begin');
      let threw: boolean = false;
      try {
        logger.warn('x', 'y', 'z');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0131 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_13200
     * @tc.name      testLoggerVariadic0132
     * @tc.desc      Verify logger.warn accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0132 begin');
      let threw: boolean = false;
      try {
        logger.warn('A', 'B', 'C', 'D');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0132 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_13300
     * @tc.name      testLoggerVariadic0133
     * @tc.desc      Verify logger.warn accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0133 begin');
      let threw: boolean = false;
      try {
        logger.warn('TAG', 'a', 'b', 'c');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0133 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_13400
     * @tc.name      testLoggerVariadic0134
     * @tc.desc      Verify logger.warn accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0134 begin');
      let threw: boolean = false;
      try {
        logger.warn('1', '2', '3', '4');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0134 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_13500
     * @tc.name      testLoggerVariadic0135
     * @tc.desc      Verify logger.warn accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0135 begin');
      let threw: boolean = false;
      try {
        logger.warn('w', 'x', 'y', 'z');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0135 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_13600
     * @tc.name      testLoggerVariadic0136
     * @tc.desc      Verify logger.warn accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0136 begin');
      let threw: boolean = false;
      try {
        logger.warn('中文', '标签', '消息', '内容');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0136 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_13700
     * @tc.name      testLoggerVariadic0137
     * @tc.desc      Verify logger.warn accepts 5 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0137 begin');
      let threw: boolean = false;
      try {
        logger.warn('A', 'B', 'C', 'D', 'E');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0137 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_13800
     * @tc.name      testLoggerVariadic0138
     * @tc.desc      Verify logger.warn accepts 5 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0138 begin');
      let threw: boolean = false;
      try {
        logger.warn('a', 'b', 'c', 'd', 'e');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0138 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_13900
     * @tc.name      testLoggerVariadic0139
     * @tc.desc      Verify logger.warn accepts 5 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0139 begin');
      let threw: boolean = false;
      try {
        logger.warn('1', '2', '3', '4', '5');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0139 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_14000
     * @tc.name      testLoggerVariadic0140
     * @tc.desc      Verify logger.warn accepts 5 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0140 begin');
      let threw: boolean = false;
      try {
        logger.warn('TAG', 'm1', 'm2', 'm3', 'm4');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0140 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_14100
     * @tc.name      testLoggerVariadic0141
     * @tc.desc      Verify logger.warn accepts 5 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0141 begin');
      let threw: boolean = false;
      try {
        logger.warn('中文', '一', '二', '三', '四');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0141 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_14200
     * @tc.name      testLoggerVariadic0142
     * @tc.desc      Verify logger.warn accepts 5 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0142 begin');
      let threw: boolean = false;
      try {
        logger.warn('v', 'w', 'x', 'y', 'z');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0142 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_14300
     * @tc.name      testLoggerVariadic0143
     * @tc.desc      Verify logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0143 begin');
      let threw: boolean = false;
      try {
        logger.warn('yes', 'no');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0143 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_14400
     * @tc.name      testLoggerVariadic0144
     * @tc.desc      Verify logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0144 begin');
      let threw: boolean = false;
      try {
        logger.warn('on', 'off');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0144 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_14500
     * @tc.name      testLoggerVariadic0145
     * @tc.desc      Verify logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0145 begin');
      let threw: boolean = false;
      try {
        logger.warn('start', 'end');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0145 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_14600
     * @tc.name      testLoggerVariadic0146
     * @tc.desc      Verify logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0146 begin');
      let threw: boolean = false;
      try {
        logger.warn('tag', 'value');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0146 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_14700
     * @tc.name      testLoggerVariadic0147
     * @tc.desc      Verify logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0147 begin');
      let threw: boolean = false;
      try {
        logger.warn('k', 'v');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0147 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_14800
     * @tc.name      testLoggerVariadic0148
     * @tc.desc      Verify logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0148 begin');
      let threw: boolean = false;
      try {
        logger.warn('key', 'value');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0148 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_14900
     * @tc.name      testLoggerVariadic0149
     * @tc.desc      Verify logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0149 begin');
      let threw: boolean = false;
      try {
        logger.warn('name', 'age');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0149 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_15000
     * @tc.name      testLoggerVariadic0150
     * @tc.desc      Verify logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0150 begin');
      let threw: boolean = false;
      try {
        logger.warn('arg0', 'value0');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0150 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_15100
     * @tc.name      testLoggerVariadic0151
     * @tc.desc      Verify logger.error accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0151 begin');
      let threw: boolean = false;
      try {
        logger.error('');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0151 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_15200
     * @tc.name      testLoggerVariadic0152
     * @tc.desc      Verify logger.error accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0152 begin');
      let threw: boolean = false;
      try {
        logger.error('a');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0152 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_15300
     * @tc.name      testLoggerVariadic0153
     * @tc.desc      Verify logger.error accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0153 begin');
      let threw: boolean = false;
      try {
        logger.error('message');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0153 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_15400
     * @tc.name      testLoggerVariadic0154
     * @tc.desc      Verify logger.error accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0154 begin');
      let threw: boolean = false;
      try {
        logger.error('中文消息');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0154 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_15500
     * @tc.name      testLoggerVariadic0155
     * @tc.desc      Verify logger.error accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0155 begin');
      let threw: boolean = false;
      try {
        logger.error('😀 emoji');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0155 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_15600
     * @tc.name      testLoggerVariadic0156
     * @tc.desc      Verify logger.error accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0156 begin');
      let threw: boolean = false;
      try {
        logger.error('%{public}s');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0156 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_15700
     * @tc.name      testLoggerVariadic0157
     * @tc.desc      Verify logger.error accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0157 begin');
      let threw: boolean = false;
      try {
        logger.error('a,b');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0157 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_15800
     * @tc.name      testLoggerVariadic0158
     * @tc.desc      Verify logger.error accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0158 begin');
      let threw: boolean = false;
      try {
        logger.error('line1\nline2');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0158 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_15900
     * @tc.name      testLoggerVariadic0159
     * @tc.desc      Verify logger.error accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0159 begin');
      let threw: boolean = false;
      try {
        logger.error('tab\tchar');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0159 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_16000
     * @tc.name      testLoggerVariadic0160
     * @tc.desc      Verify logger.error accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0160 begin');
      let threw: boolean = false;
      try {
        logger.error('quote\'s');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0160 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_16100
     * @tc.name      testLoggerVariadic0161
     * @tc.desc      Verify logger.error accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0161 begin');
      let threw: boolean = false;
      try {
        logger.error('back\\slash');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0161 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_16200
     * @tc.name      testLoggerVariadic0162
     * @tc.desc      Verify logger.error accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0162 begin');
      let threw: boolean = false;
      try {
        logger.error('null');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0162 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_16300
     * @tc.name      testLoggerVariadic0163
     * @tc.desc      Verify logger.error accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0163 begin');
      let threw: boolean = false;
      try {
        logger.error('0');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0163 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_16400
     * @tc.name      testLoggerVariadic0164
     * @tc.desc      Verify logger.error accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0164 begin');
      let threw: boolean = false;
      try {
        logger.error('true');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0164 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_16500
     * @tc.name      testLoggerVariadic0165
     * @tc.desc      Verify logger.error accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0165 begin');
      let threw: boolean = false;
      try {
        logger.error('false');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0165 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_16600
     * @tc.name      testLoggerVariadic0166
     * @tc.desc      Verify logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0166 begin');
      let threw: boolean = false;
      try {
        logger.error('TAG', 'message');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0166 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_16700
     * @tc.name      testLoggerVariadic0167
     * @tc.desc      Verify logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0167 begin');
      let threw: boolean = false;
      try {
        logger.error('TAG', '');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0167 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_16800
     * @tc.name      testLoggerVariadic0168
     * @tc.desc      Verify logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0168 begin');
      let threw: boolean = false;
      try {
        logger.error('', 'message');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0168 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_16900
     * @tc.name      testLoggerVariadic0169
     * @tc.desc      Verify logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0169 begin');
      let threw: boolean = false;
      try {
        logger.error('TAG', '中文');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0169 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_17000
     * @tc.name      testLoggerVariadic0170
     * @tc.desc      Verify logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0170 begin');
      let threw: boolean = false;
      try {
        logger.error('TAG', '😀');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0170 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_17100
     * @tc.name      testLoggerVariadic0171
     * @tc.desc      Verify logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0171 begin');
      let threw: boolean = false;
      try {
        logger.error('A', 'B');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0171 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_17200
     * @tc.name      testLoggerVariadic0172
     * @tc.desc      Verify logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0172 begin');
      let threw: boolean = false;
      try {
        logger.error('0', '1');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0172 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_17300
     * @tc.name      testLoggerVariadic0173
     * @tc.desc      Verify logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0173 begin');
      let threw: boolean = false;
      try {
        logger.error('true', 'false');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0173 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_17400
     * @tc.name      testLoggerVariadic0174
     * @tc.desc      Verify logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0174 begin');
      let threw: boolean = false;
      try {
        logger.error('left', 'right');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0174 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_17500
     * @tc.name      testLoggerVariadic0175
     * @tc.desc      Verify logger.error accepts 3 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0175 begin');
      let threw: boolean = false;
      try {
        logger.error('A', 'B', 'C');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0175 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_17600
     * @tc.name      testLoggerVariadic0176
     * @tc.desc      Verify logger.error accepts 3 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0176 begin');
      let threw: boolean = false;
      try {
        logger.error('TAG', 'stage', 'message');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0176 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_17700
     * @tc.name      testLoggerVariadic0177
     * @tc.desc      Verify logger.error accepts 3 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0177 begin');
      let threw: boolean = false;
      try {
        logger.error('', '', '');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0177 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_17800
     * @tc.name      testLoggerVariadic0178
     * @tc.desc      Verify logger.error accepts 3 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0178 begin');
      let threw: boolean = false;
      try {
        logger.error('中文', '消息', '内容');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0178 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_17900
     * @tc.name      testLoggerVariadic0179
     * @tc.desc      Verify logger.error accepts 3 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0179 begin');
      let threw: boolean = false;
      try {
        logger.error('1', '2', '3');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0179 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP2_18000
     * @tc.name      testLoggerVariadic0180
     * @tc.desc      Verify logger.error accepts 3 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0180 begin');
      let threw: boolean = false;
      try {
        logger.error('a', 'b', 'c');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0180 end');
    })

  })
}

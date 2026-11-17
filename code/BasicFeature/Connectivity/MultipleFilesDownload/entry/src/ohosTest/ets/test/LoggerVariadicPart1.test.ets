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

export default function LoggerVariadicPart1Test(): void {
  describe('LoggerVariadicPart1', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_0100
     * @tc.name      testLoggerVariadic0001
     * @tc.desc      Verify logger.debug accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0001 begin');
      let threw: boolean = false;
      try {
        logger.debug('');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0001 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_0200
     * @tc.name      testLoggerVariadic0002
     * @tc.desc      Verify logger.debug accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0002 begin');
      let threw: boolean = false;
      try {
        logger.debug('a');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0002 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_0300
     * @tc.name      testLoggerVariadic0003
     * @tc.desc      Verify logger.debug accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0003 begin');
      let threw: boolean = false;
      try {
        logger.debug('message');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0003 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_0400
     * @tc.name      testLoggerVariadic0004
     * @tc.desc      Verify logger.debug accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0004 begin');
      let threw: boolean = false;
      try {
        logger.debug('中文消息');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0004 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_0500
     * @tc.name      testLoggerVariadic0005
     * @tc.desc      Verify logger.debug accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0005 begin');
      let threw: boolean = false;
      try {
        logger.debug('😀 emoji');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0005 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_0600
     * @tc.name      testLoggerVariadic0006
     * @tc.desc      Verify logger.debug accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0006 begin');
      let threw: boolean = false;
      try {
        logger.debug('%{public}s');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0006 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_0700
     * @tc.name      testLoggerVariadic0007
     * @tc.desc      Verify logger.debug accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0007 begin');
      let threw: boolean = false;
      try {
        logger.debug('a,b');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0007 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_0800
     * @tc.name      testLoggerVariadic0008
     * @tc.desc      Verify logger.debug accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0008 begin');
      let threw: boolean = false;
      try {
        logger.debug('line1\nline2');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0008 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_0900
     * @tc.name      testLoggerVariadic0009
     * @tc.desc      Verify logger.debug accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0009 begin');
      let threw: boolean = false;
      try {
        logger.debug('tab\tchar');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0009 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_1000
     * @tc.name      testLoggerVariadic0010
     * @tc.desc      Verify logger.debug accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0010 begin');
      let threw: boolean = false;
      try {
        logger.debug('quote\'s');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0010 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_1100
     * @tc.name      testLoggerVariadic0011
     * @tc.desc      Verify logger.debug accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0011 begin');
      let threw: boolean = false;
      try {
        logger.debug('back\\slash');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0011 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_1200
     * @tc.name      testLoggerVariadic0012
     * @tc.desc      Verify logger.debug accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0012 begin');
      let threw: boolean = false;
      try {
        logger.debug('null');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0012 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_1300
     * @tc.name      testLoggerVariadic0013
     * @tc.desc      Verify logger.debug accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0013 begin');
      let threw: boolean = false;
      try {
        logger.debug('0');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0013 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_1400
     * @tc.name      testLoggerVariadic0014
     * @tc.desc      Verify logger.debug accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0014 begin');
      let threw: boolean = false;
      try {
        logger.debug('true');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0014 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_1500
     * @tc.name      testLoggerVariadic0015
     * @tc.desc      Verify logger.debug accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0015 begin');
      let threw: boolean = false;
      try {
        logger.debug('false');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0015 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_1600
     * @tc.name      testLoggerVariadic0016
     * @tc.desc      Verify logger.debug accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0016 begin');
      let threw: boolean = false;
      try {
        logger.debug('TAG', 'message');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0016 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_1700
     * @tc.name      testLoggerVariadic0017
     * @tc.desc      Verify logger.debug accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0017 begin');
      let threw: boolean = false;
      try {
        logger.debug('TAG', '');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0017 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_1800
     * @tc.name      testLoggerVariadic0018
     * @tc.desc      Verify logger.debug accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0018 begin');
      let threw: boolean = false;
      try {
        logger.debug('', 'message');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0018 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_1900
     * @tc.name      testLoggerVariadic0019
     * @tc.desc      Verify logger.debug accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0019 begin');
      let threw: boolean = false;
      try {
        logger.debug('TAG', '中文');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0019 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_2000
     * @tc.name      testLoggerVariadic0020
     * @tc.desc      Verify logger.debug accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0020 begin');
      let threw: boolean = false;
      try {
        logger.debug('TAG', '😀');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0020 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_2100
     * @tc.name      testLoggerVariadic0021
     * @tc.desc      Verify logger.debug accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0021 begin');
      let threw: boolean = false;
      try {
        logger.debug('A', 'B');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0021 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_2200
     * @tc.name      testLoggerVariadic0022
     * @tc.desc      Verify logger.debug accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0022 begin');
      let threw: boolean = false;
      try {
        logger.debug('0', '1');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0022 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_2300
     * @tc.name      testLoggerVariadic0023
     * @tc.desc      Verify logger.debug accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0023 begin');
      let threw: boolean = false;
      try {
        logger.debug('true', 'false');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0023 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_2400
     * @tc.name      testLoggerVariadic0024
     * @tc.desc      Verify logger.debug accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0024 begin');
      let threw: boolean = false;
      try {
        logger.debug('left', 'right');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0024 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_2500
     * @tc.name      testLoggerVariadic0025
     * @tc.desc      Verify logger.debug accepts 3 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0025 begin');
      let threw: boolean = false;
      try {
        logger.debug('A', 'B', 'C');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0025 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_2600
     * @tc.name      testLoggerVariadic0026
     * @tc.desc      Verify logger.debug accepts 3 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0026 begin');
      let threw: boolean = false;
      try {
        logger.debug('TAG', 'stage', 'message');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0026 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_2700
     * @tc.name      testLoggerVariadic0027
     * @tc.desc      Verify logger.debug accepts 3 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0027 begin');
      let threw: boolean = false;
      try {
        logger.debug('', '', '');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0027 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_2800
     * @tc.name      testLoggerVariadic0028
     * @tc.desc      Verify logger.debug accepts 3 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0028 begin');
      let threw: boolean = false;
      try {
        logger.debug('中文', '消息', '内容');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0028 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_2900
     * @tc.name      testLoggerVariadic0029
     * @tc.desc      Verify logger.debug accepts 3 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0029 begin');
      let threw: boolean = false;
      try {
        logger.debug('1', '2', '3');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0029 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_3000
     * @tc.name      testLoggerVariadic0030
     * @tc.desc      Verify logger.debug accepts 3 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0030 begin');
      let threw: boolean = false;
      try {
        logger.debug('a', 'b', 'c');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0030 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_3100
     * @tc.name      testLoggerVariadic0031
     * @tc.desc      Verify logger.debug accepts 3 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0031 begin');
      let threw: boolean = false;
      try {
        logger.debug('x', 'y', 'z');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0031 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_3200
     * @tc.name      testLoggerVariadic0032
     * @tc.desc      Verify logger.debug accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0032 begin');
      let threw: boolean = false;
      try {
        logger.debug('A', 'B', 'C', 'D');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0032 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_3300
     * @tc.name      testLoggerVariadic0033
     * @tc.desc      Verify logger.debug accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0033 begin');
      let threw: boolean = false;
      try {
        logger.debug('TAG', 'a', 'b', 'c');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0033 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_3400
     * @tc.name      testLoggerVariadic0034
     * @tc.desc      Verify logger.debug accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0034 begin');
      let threw: boolean = false;
      try {
        logger.debug('1', '2', '3', '4');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0034 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_3500
     * @tc.name      testLoggerVariadic0035
     * @tc.desc      Verify logger.debug accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0035 begin');
      let threw: boolean = false;
      try {
        logger.debug('w', 'x', 'y', 'z');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0035 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_3600
     * @tc.name      testLoggerVariadic0036
     * @tc.desc      Verify logger.debug accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0036 begin');
      let threw: boolean = false;
      try {
        logger.debug('中文', '标签', '消息', '内容');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0036 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_3700
     * @tc.name      testLoggerVariadic0037
     * @tc.desc      Verify logger.debug accepts 5 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0037 begin');
      let threw: boolean = false;
      try {
        logger.debug('A', 'B', 'C', 'D', 'E');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0037 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_3800
     * @tc.name      testLoggerVariadic0038
     * @tc.desc      Verify logger.debug accepts 5 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0038 begin');
      let threw: boolean = false;
      try {
        logger.debug('a', 'b', 'c', 'd', 'e');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0038 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_3900
     * @tc.name      testLoggerVariadic0039
     * @tc.desc      Verify logger.debug accepts 5 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0039 begin');
      let threw: boolean = false;
      try {
        logger.debug('1', '2', '3', '4', '5');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0039 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_4000
     * @tc.name      testLoggerVariadic0040
     * @tc.desc      Verify logger.debug accepts 5 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0040 begin');
      let threw: boolean = false;
      try {
        logger.debug('TAG', 'm1', 'm2', 'm3', 'm4');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0040 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_4100
     * @tc.name      testLoggerVariadic0041
     * @tc.desc      Verify logger.debug accepts 5 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0041 begin');
      let threw: boolean = false;
      try {
        logger.debug('中文', '一', '二', '三', '四');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0041 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_4200
     * @tc.name      testLoggerVariadic0042
     * @tc.desc      Verify logger.debug accepts 5 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0042 begin');
      let threw: boolean = false;
      try {
        logger.debug('v', 'w', 'x', 'y', 'z');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0042 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_4300
     * @tc.name      testLoggerVariadic0043
     * @tc.desc      Verify logger.debug accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0043 begin');
      let threw: boolean = false;
      try {
        logger.debug('yes', 'no');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0043 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_4400
     * @tc.name      testLoggerVariadic0044
     * @tc.desc      Verify logger.debug accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0044 begin');
      let threw: boolean = false;
      try {
        logger.debug('on', 'off');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0044 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_4500
     * @tc.name      testLoggerVariadic0045
     * @tc.desc      Verify logger.debug accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0045 begin');
      let threw: boolean = false;
      try {
        logger.debug('start', 'end');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0045 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_4600
     * @tc.name      testLoggerVariadic0046
     * @tc.desc      Verify logger.debug accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0046 begin');
      let threw: boolean = false;
      try {
        logger.debug('tag', 'value');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0046 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_4700
     * @tc.name      testLoggerVariadic0047
     * @tc.desc      Verify logger.debug accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0047 begin');
      let threw: boolean = false;
      try {
        logger.debug('k', 'v');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0047 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_4800
     * @tc.name      testLoggerVariadic0048
     * @tc.desc      Verify logger.debug accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0048 begin');
      let threw: boolean = false;
      try {
        logger.debug('key', 'value');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0048 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_4900
     * @tc.name      testLoggerVariadic0049
     * @tc.desc      Verify logger.debug accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0049 begin');
      let threw: boolean = false;
      try {
        logger.debug('name', 'age');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0049 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_5000
     * @tc.name      testLoggerVariadic0050
     * @tc.desc      Verify logger.debug accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0050 begin');
      let threw: boolean = false;
      try {
        logger.debug('arg0', 'value0');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0050 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_5100
     * @tc.name      testLoggerVariadic0051
     * @tc.desc      Verify logger.info accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0051 begin');
      let threw: boolean = false;
      try {
        logger.info('');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0051 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_5200
     * @tc.name      testLoggerVariadic0052
     * @tc.desc      Verify logger.info accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0052 begin');
      let threw: boolean = false;
      try {
        logger.info('a');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0052 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_5300
     * @tc.name      testLoggerVariadic0053
     * @tc.desc      Verify logger.info accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0053 begin');
      let threw: boolean = false;
      try {
        logger.info('message');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0053 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_5400
     * @tc.name      testLoggerVariadic0054
     * @tc.desc      Verify logger.info accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0054 begin');
      let threw: boolean = false;
      try {
        logger.info('中文消息');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0054 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_5500
     * @tc.name      testLoggerVariadic0055
     * @tc.desc      Verify logger.info accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0055 begin');
      let threw: boolean = false;
      try {
        logger.info('😀 emoji');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0055 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_5600
     * @tc.name      testLoggerVariadic0056
     * @tc.desc      Verify logger.info accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0056 begin');
      let threw: boolean = false;
      try {
        logger.info('%{public}s');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0056 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_5700
     * @tc.name      testLoggerVariadic0057
     * @tc.desc      Verify logger.info accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0057 begin');
      let threw: boolean = false;
      try {
        logger.info('a,b');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0057 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_5800
     * @tc.name      testLoggerVariadic0058
     * @tc.desc      Verify logger.info accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0058 begin');
      let threw: boolean = false;
      try {
        logger.info('line1\nline2');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0058 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_5900
     * @tc.name      testLoggerVariadic0059
     * @tc.desc      Verify logger.info accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0059 begin');
      let threw: boolean = false;
      try {
        logger.info('tab\tchar');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0059 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_6000
     * @tc.name      testLoggerVariadic0060
     * @tc.desc      Verify logger.info accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0060 begin');
      let threw: boolean = false;
      try {
        logger.info('quote\'s');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0060 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_6100
     * @tc.name      testLoggerVariadic0061
     * @tc.desc      Verify logger.info accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0061 begin');
      let threw: boolean = false;
      try {
        logger.info('back\\slash');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0061 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_6200
     * @tc.name      testLoggerVariadic0062
     * @tc.desc      Verify logger.info accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0062 begin');
      let threw: boolean = false;
      try {
        logger.info('null');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0062 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_6300
     * @tc.name      testLoggerVariadic0063
     * @tc.desc      Verify logger.info accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0063 begin');
      let threw: boolean = false;
      try {
        logger.info('0');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0063 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_6400
     * @tc.name      testLoggerVariadic0064
     * @tc.desc      Verify logger.info accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0064 begin');
      let threw: boolean = false;
      try {
        logger.info('true');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0064 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_6500
     * @tc.name      testLoggerVariadic0065
     * @tc.desc      Verify logger.info accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0065 begin');
      let threw: boolean = false;
      try {
        logger.info('false');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0065 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_6600
     * @tc.name      testLoggerVariadic0066
     * @tc.desc      Verify logger.info accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0066 begin');
      let threw: boolean = false;
      try {
        logger.info('TAG', 'message');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0066 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_6700
     * @tc.name      testLoggerVariadic0067
     * @tc.desc      Verify logger.info accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0067 begin');
      let threw: boolean = false;
      try {
        logger.info('TAG', '');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0067 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_6800
     * @tc.name      testLoggerVariadic0068
     * @tc.desc      Verify logger.info accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0068 begin');
      let threw: boolean = false;
      try {
        logger.info('', 'message');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0068 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_6900
     * @tc.name      testLoggerVariadic0069
     * @tc.desc      Verify logger.debug accepts representative argument set 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0069 begin');
      let threw: boolean = false;
      try {
        logger.debug('');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0069 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_7000
     * @tc.name      testLoggerVariadic0070
     * @tc.desc      Verify logger.info accepts representative argument set 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0070 begin');
      let threw: boolean = false;
      try {
        logger.info('tag', 'value');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0070 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_7100
     * @tc.name      testLoggerVariadic0071
     * @tc.desc      Verify logger.debug accepts representative argument set 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0071 begin');
      let threw: boolean = false;
      try {
        logger.debug('a', 'b', 'c', 'd', 'e');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0071 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_LOGVARP1_7200
     * @tc.name      testLoggerVariadic0072
     * @tc.desc      Verify logger.info accepts representative argument set 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0072 begin');
      let threw: boolean = false;
      try {
        logger.info('中文', 'emoji🙂', 'long_value_0123456789');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0072 end');
    })

  })
}

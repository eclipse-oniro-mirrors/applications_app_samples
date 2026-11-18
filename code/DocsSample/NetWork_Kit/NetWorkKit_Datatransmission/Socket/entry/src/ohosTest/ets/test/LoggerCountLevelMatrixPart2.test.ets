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
import Logger from '../../../main/ets/common/Logger';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Socket]';

export default function LoggerCountLevelMatrixPart2Test(): void {
  describe('LoggerCountLevelMatrixPart2', () => {

    /**
     * @tc.number    SUB_SOCKET_LCLP2_4100
     * @tc.name      testLoggerCount0041
     * @tc.desc      Verify Logger.warn accepts 1 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0041 begin');
      let threw: boolean = false;
      try {
        Logger.warn('a1');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0041 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_4200
     * @tc.name      testLoggerCount0042
     * @tc.desc      Verify Logger.warn accepts 2 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0042 begin');
      let threw: boolean = false;
      try {
        Logger.warn('a1', 'a2');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0042 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_4300
     * @tc.name      testLoggerCount0043
     * @tc.desc      Verify Logger.warn accepts 3 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0043 begin');
      let threw: boolean = false;
      try {
        Logger.warn('a1', 'a2', 'a3');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0043 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_4400
     * @tc.name      testLoggerCount0044
     * @tc.desc      Verify Logger.warn accepts 4 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0044 begin');
      let threw: boolean = false;
      try {
        Logger.warn('a1', 'a2', 'a3', 'a4');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0044 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_4500
     * @tc.name      testLoggerCount0045
     * @tc.desc      Verify Logger.warn accepts 5 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0045 begin');
      let threw: boolean = false;
      try {
        Logger.warn('a1', 'a2', 'a3', 'a4', 'a5');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0045 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_4600
     * @tc.name      testLoggerCount0046
     * @tc.desc      Verify Logger.warn accepts 6 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0046 begin');
      let threw: boolean = false;
      try {
        Logger.warn('a1', 'a2', 'a3', 'a4', 'a5', 'a6');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0046 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_4700
     * @tc.name      testLoggerCount0047
     * @tc.desc      Verify Logger.warn accepts 7 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0047 begin');
      let threw: boolean = false;
      try {
        Logger.warn('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0047 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_4800
     * @tc.name      testLoggerCount0048
     * @tc.desc      Verify Logger.warn accepts 8 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0048 begin');
      let threw: boolean = false;
      try {
        Logger.warn('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0048 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_4900
     * @tc.name      testLoggerCount0049
     * @tc.desc      Verify Logger.warn accepts 9 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0049 begin');
      let threw: boolean = false;
      try {
        Logger.warn('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0049 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_5000
     * @tc.name      testLoggerCount0050
     * @tc.desc      Verify Logger.warn accepts 10 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0050 begin');
      let threw: boolean = false;
      try {
        Logger.warn('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0050 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_5100
     * @tc.name      testLoggerCount0051
     * @tc.desc      Verify Logger.warn accepts 11 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0051 begin');
      let threw: boolean = false;
      try {
        Logger.warn('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0051 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_5200
     * @tc.name      testLoggerCount0052
     * @tc.desc      Verify Logger.warn accepts 12 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0052 begin');
      let threw: boolean = false;
      try {
        Logger.warn('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0052 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_5300
     * @tc.name      testLoggerCount0053
     * @tc.desc      Verify Logger.warn accepts 13 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0053 begin');
      let threw: boolean = false;
      try {
        Logger.warn('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0053 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_5400
     * @tc.name      testLoggerCount0054
     * @tc.desc      Verify Logger.warn accepts 14 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0054 begin');
      let threw: boolean = false;
      try {
        Logger.warn('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13', 'a14');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0054 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_5500
     * @tc.name      testLoggerCount0055
     * @tc.desc      Verify Logger.warn accepts 15 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0055 begin');
      let threw: boolean = false;
      try {
        Logger.warn('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13', 'a14', 'a15');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0055 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_5600
     * @tc.name      testLoggerCount0056
     * @tc.desc      Verify Logger.warn accepts 16 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0056 begin');
      let threw: boolean = false;
      try {
        Logger.warn('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13', 'a14', 'a15', 'a16');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0056 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_5700
     * @tc.name      testLoggerCount0057
     * @tc.desc      Verify Logger.warn accepts 17 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0057 begin');
      let threw: boolean = false;
      try {
        Logger.warn('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13', 'a14', 'a15', 'a16', 'a17');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0057 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_5800
     * @tc.name      testLoggerCount0058
     * @tc.desc      Verify Logger.warn accepts 18 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0058 begin');
      let threw: boolean = false;
      try {
        Logger.warn('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13', 'a14', 'a15', 'a16', 'a17', 'a18');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0058 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_5900
     * @tc.name      testLoggerCount0059
     * @tc.desc      Verify Logger.warn accepts 19 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0059 begin');
      let threw: boolean = false;
      try {
        Logger.warn('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13', 'a14', 'a15', 'a16', 'a17', 'a18', 'a19');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0059 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_6000
     * @tc.name      testLoggerCount0060
     * @tc.desc      Verify Logger.warn accepts 20 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0060 begin');
      let threw: boolean = false;
      try {
        Logger.warn('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13', 'a14', 'a15', 'a16', 'a17', 'a18', 'a19', 'a20');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0060 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_6100
     * @tc.name      testLoggerCount0061
     * @tc.desc      Verify Logger.error accepts 1 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0061 begin');
      let threw: boolean = false;
      try {
        Logger.error('a1');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0061 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_6200
     * @tc.name      testLoggerCount0062
     * @tc.desc      Verify Logger.error accepts 2 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0062 begin');
      let threw: boolean = false;
      try {
        Logger.error('a1', 'a2');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0062 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_6300
     * @tc.name      testLoggerCount0063
     * @tc.desc      Verify Logger.error accepts 3 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0063 begin');
      let threw: boolean = false;
      try {
        Logger.error('a1', 'a2', 'a3');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0063 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_6400
     * @tc.name      testLoggerCount0064
     * @tc.desc      Verify Logger.error accepts 4 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0064 begin');
      let threw: boolean = false;
      try {
        Logger.error('a1', 'a2', 'a3', 'a4');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0064 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_6500
     * @tc.name      testLoggerCount0065
     * @tc.desc      Verify Logger.error accepts 5 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0065 begin');
      let threw: boolean = false;
      try {
        Logger.error('a1', 'a2', 'a3', 'a4', 'a5');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0065 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_6600
     * @tc.name      testLoggerCount0066
     * @tc.desc      Verify Logger.error accepts 6 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0066 begin');
      let threw: boolean = false;
      try {
        Logger.error('a1', 'a2', 'a3', 'a4', 'a5', 'a6');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0066 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_6700
     * @tc.name      testLoggerCount0067
     * @tc.desc      Verify Logger.error accepts 7 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0067 begin');
      let threw: boolean = false;
      try {
        Logger.error('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0067 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_6800
     * @tc.name      testLoggerCount0068
     * @tc.desc      Verify Logger.error accepts 8 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0068 begin');
      let threw: boolean = false;
      try {
        Logger.error('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0068 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_6900
     * @tc.name      testLoggerCount0069
     * @tc.desc      Verify Logger.error accepts 9 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0069 begin');
      let threw: boolean = false;
      try {
        Logger.error('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0069 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_7000
     * @tc.name      testLoggerCount0070
     * @tc.desc      Verify Logger.error accepts 10 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0070 begin');
      let threw: boolean = false;
      try {
        Logger.error('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0070 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_7100
     * @tc.name      testLoggerCount0071
     * @tc.desc      Verify Logger.error accepts 11 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0071 begin');
      let threw: boolean = false;
      try {
        Logger.error('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0071 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_7200
     * @tc.name      testLoggerCount0072
     * @tc.desc      Verify Logger.error accepts 12 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0072 begin');
      let threw: boolean = false;
      try {
        Logger.error('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0072 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_7300
     * @tc.name      testLoggerCount0073
     * @tc.desc      Verify Logger.error accepts 13 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0073 begin');
      let threw: boolean = false;
      try {
        Logger.error('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0073 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_7400
     * @tc.name      testLoggerCount0074
     * @tc.desc      Verify Logger.error accepts 14 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0074 begin');
      let threw: boolean = false;
      try {
        Logger.error('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13', 'a14');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0074 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_7500
     * @tc.name      testLoggerCount0075
     * @tc.desc      Verify Logger.error accepts 15 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0075 begin');
      let threw: boolean = false;
      try {
        Logger.error('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13', 'a14', 'a15');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0075 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_7600
     * @tc.name      testLoggerCount0076
     * @tc.desc      Verify Logger.error accepts 16 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0076 begin');
      let threw: boolean = false;
      try {
        Logger.error('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13', 'a14', 'a15', 'a16');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0076 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_7700
     * @tc.name      testLoggerCount0077
     * @tc.desc      Verify Logger.error accepts 17 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0077 begin');
      let threw: boolean = false;
      try {
        Logger.error('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13', 'a14', 'a15', 'a16', 'a17');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0077 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_7800
     * @tc.name      testLoggerCount0078
     * @tc.desc      Verify Logger.error accepts 18 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0078 begin');
      let threw: boolean = false;
      try {
        Logger.error('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13', 'a14', 'a15', 'a16', 'a17', 'a18');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0078 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_7900
     * @tc.name      testLoggerCount0079
     * @tc.desc      Verify Logger.error accepts 19 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0079 begin');
      let threw: boolean = false;
      try {
        Logger.error('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13', 'a14', 'a15', 'a16', 'a17', 'a18', 'a19');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0079 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP2_8000
     * @tc.name      testLoggerCount0080
     * @tc.desc      Verify Logger.error accepts 20 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0080 begin');
      let threw: boolean = false;
      try {
        Logger.error('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13', 'a14', 'a15', 'a16', 'a17', 'a18', 'a19', 'a20');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0080 end');
    })

  })
}

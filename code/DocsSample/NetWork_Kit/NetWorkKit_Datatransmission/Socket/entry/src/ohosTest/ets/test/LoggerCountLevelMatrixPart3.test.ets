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

export default function LoggerCountLevelMatrixPart3Test(): void {
  describe('LoggerCountLevelMatrixPart3', () => {

    /**
     * @tc.number    SUB_SOCKET_LCLP3_8100
     * @tc.name      testLoggerCount0081
     * @tc.desc      Verify Logger.fatal accepts 1 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0081 begin');
      let threw: boolean = false;
      try {
        Logger.fatal('a1');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0081 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP3_8200
     * @tc.name      testLoggerCount0082
     * @tc.desc      Verify Logger.fatal accepts 2 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0082 begin');
      let threw: boolean = false;
      try {
        Logger.fatal('a1', 'a2');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0082 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP3_8300
     * @tc.name      testLoggerCount0083
     * @tc.desc      Verify Logger.fatal accepts 3 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0083 begin');
      let threw: boolean = false;
      try {
        Logger.fatal('a1', 'a2', 'a3');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0083 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP3_8400
     * @tc.name      testLoggerCount0084
     * @tc.desc      Verify Logger.fatal accepts 4 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0084 begin');
      let threw: boolean = false;
      try {
        Logger.fatal('a1', 'a2', 'a3', 'a4');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0084 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP3_8500
     * @tc.name      testLoggerCount0085
     * @tc.desc      Verify Logger.fatal accepts 5 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0085 begin');
      let threw: boolean = false;
      try {
        Logger.fatal('a1', 'a2', 'a3', 'a4', 'a5');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0085 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP3_8600
     * @tc.name      testLoggerCount0086
     * @tc.desc      Verify Logger.fatal accepts 6 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0086 begin');
      let threw: boolean = false;
      try {
        Logger.fatal('a1', 'a2', 'a3', 'a4', 'a5', 'a6');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0086 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP3_8700
     * @tc.name      testLoggerCount0087
     * @tc.desc      Verify Logger.fatal accepts 7 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0087 begin');
      let threw: boolean = false;
      try {
        Logger.fatal('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0087 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP3_8800
     * @tc.name      testLoggerCount0088
     * @tc.desc      Verify Logger.fatal accepts 8 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0088 begin');
      let threw: boolean = false;
      try {
        Logger.fatal('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0088 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP3_8900
     * @tc.name      testLoggerCount0089
     * @tc.desc      Verify Logger.fatal accepts 9 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0089 begin');
      let threw: boolean = false;
      try {
        Logger.fatal('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0089 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP3_9000
     * @tc.name      testLoggerCount0090
     * @tc.desc      Verify Logger.fatal accepts 10 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0090 begin');
      let threw: boolean = false;
      try {
        Logger.fatal('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0090 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP3_9100
     * @tc.name      testLoggerCount0091
     * @tc.desc      Verify Logger.fatal accepts 11 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0091 begin');
      let threw: boolean = false;
      try {
        Logger.fatal('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0091 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP3_9200
     * @tc.name      testLoggerCount0092
     * @tc.desc      Verify Logger.fatal accepts 12 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0092 begin');
      let threw: boolean = false;
      try {
        Logger.fatal('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0092 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP3_9300
     * @tc.name      testLoggerCount0093
     * @tc.desc      Verify Logger.fatal accepts 13 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0093 begin');
      let threw: boolean = false;
      try {
        Logger.fatal('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0093 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP3_9400
     * @tc.name      testLoggerCount0094
     * @tc.desc      Verify Logger.fatal accepts 14 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0094 begin');
      let threw: boolean = false;
      try {
        Logger.fatal('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13', 'a14');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0094 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP3_9500
     * @tc.name      testLoggerCount0095
     * @tc.desc      Verify Logger.fatal accepts 15 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0095 begin');
      let threw: boolean = false;
      try {
        Logger.fatal('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13', 'a14', 'a15');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0095 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP3_9600
     * @tc.name      testLoggerCount0096
     * @tc.desc      Verify Logger.fatal accepts 16 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0096 begin');
      let threw: boolean = false;
      try {
        Logger.fatal('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13', 'a14', 'a15', 'a16');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0096 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP3_9700
     * @tc.name      testLoggerCount0097
     * @tc.desc      Verify Logger.fatal accepts 17 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0097 begin');
      let threw: boolean = false;
      try {
        Logger.fatal('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13', 'a14', 'a15', 'a16', 'a17');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0097 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP3_9800
     * @tc.name      testLoggerCount0098
     * @tc.desc      Verify Logger.fatal accepts 18 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0098 begin');
      let threw: boolean = false;
      try {
        Logger.fatal('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13', 'a14', 'a15', 'a16', 'a17', 'a18');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0098 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP3_9900
     * @tc.name      testLoggerCount0099
     * @tc.desc      Verify Logger.fatal accepts 19 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0099 begin');
      let threw: boolean = false;
      try {
        Logger.fatal('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13', 'a14', 'a15', 'a16', 'a17', 'a18', 'a19');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0099 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP3_10000
     * @tc.name      testLoggerCount0100
     * @tc.desc      Verify Logger.fatal accepts 20 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0100 begin');
      let threw: boolean = false;
      try {
        Logger.fatal('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13', 'a14', 'a15', 'a16', 'a17', 'a18', 'a19', 'a20');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0100 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP3_10100
     * @tc.name      testLoggerLevel0101
     * @tc.desc      Verify Logger.isLoggable accepts level -2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerLevel0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerLevel0101 begin');
      let threw: boolean = false;
      try {
        Logger.isLoggable(-2);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerLevel0101 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP3_10200
     * @tc.name      testLoggerLevel0102
     * @tc.desc      Verify Logger.isLoggable accepts level 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerLevel0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerLevel0102 begin');
      let threw: boolean = false;
      try {
        Logger.isLoggable(6);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerLevel0102 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP3_10300
     * @tc.name      testLoggerLevel0103
     * @tc.desc      Verify Logger.isLoggable accepts level 99.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerLevel0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerLevel0103 begin');
      let threw: boolean = false;
      try {
        Logger.isLoggable(99);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerLevel0103 end');
    })

  })
}

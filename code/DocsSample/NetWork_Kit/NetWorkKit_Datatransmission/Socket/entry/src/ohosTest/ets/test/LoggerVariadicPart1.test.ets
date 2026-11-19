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
import Logger from '../../../main/ets/common/Logger';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Socket]';

export default function LoggerVariadicPart1Test(): void {
  describe('LoggerVariadicPart1', () => {

    /**
     * @tc.number    SUB_SOCKET_LOGVP1_0100
     * @tc.name      testLoggerVariadic0001
     * @tc.desc      Verify Logger.debug accepts no arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0001 begin');
      let threw: boolean = false;
      try {
        Logger.debug();
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0001 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGVP1_0200
     * @tc.name      testLoggerVariadic0002
     * @tc.desc      Verify Logger.debug accepts two arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0002 begin');
      let threw: boolean = false;
      try {
        Logger.debug('alpha', 'beta');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0002 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGVP1_0300
     * @tc.name      testLoggerVariadic0003
     * @tc.desc      Verify Logger.debug accepts format with two arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0003 begin');
      let threw: boolean = false;
      try {
        Logger.debug('%{public}s', 'gamma', 'delta');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0003 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGVP1_0400
     * @tc.name      testLoggerVariadic0004
     * @tc.desc      Verify Logger.debug accepts ten arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0004 begin');
      let threw: boolean = false;
      try {
        Logger.debug('p0', 'p1', 'p2', 'p3', 'p4', 'p5', 'p6', 'p7', 'p8', 'p9');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0004 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGVP1_0500
     * @tc.name      testLoggerVariadic0005
     * @tc.desc      Verify Logger.info accepts no arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0005 begin');
      let threw: boolean = false;
      try {
        Logger.info();
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0005 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGVP1_0600
     * @tc.name      testLoggerVariadic0006
     * @tc.desc      Verify Logger.info accepts two arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0006 begin');
      let threw: boolean = false;
      try {
        Logger.info('alpha', 'beta');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0006 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGVP1_0700
     * @tc.name      testLoggerVariadic0007
     * @tc.desc      Verify Logger.info accepts format with two arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0007 begin');
      let threw: boolean = false;
      try {
        Logger.info('%{public}s', 'gamma', 'delta');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0007 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGVP1_0800
     * @tc.name      testLoggerVariadic0008
     * @tc.desc      Verify Logger.info accepts ten arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0008 begin');
      let threw: boolean = false;
      try {
        Logger.info('p0', 'p1', 'p2', 'p3', 'p4', 'p5', 'p6', 'p7', 'p8', 'p9');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0008 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGVP1_0900
     * @tc.name      testLoggerVariadic0009
     * @tc.desc      Verify Logger.warn accepts no arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0009 begin');
      let threw: boolean = false;
      try {
        Logger.warn();
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0009 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGVP1_1000
     * @tc.name      testLoggerVariadic0010
     * @tc.desc      Verify Logger.warn accepts two arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0010 begin');
      let threw: boolean = false;
      try {
        Logger.warn('alpha', 'beta');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0010 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGVP1_1100
     * @tc.name      testLoggerVariadic0011
     * @tc.desc      Verify Logger.warn accepts format with two arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0011 begin');
      let threw: boolean = false;
      try {
        Logger.warn('%{public}s', 'gamma', 'delta');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0011 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGVP1_1200
     * @tc.name      testLoggerVariadic0012
     * @tc.desc      Verify Logger.warn accepts ten arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0012 begin');
      let threw: boolean = false;
      try {
        Logger.warn('p0', 'p1', 'p2', 'p3', 'p4', 'p5', 'p6', 'p7', 'p8', 'p9');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0012 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGVP1_1300
     * @tc.name      testLoggerVariadic0013
     * @tc.desc      Verify Logger.error accepts no arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0013 begin');
      let threw: boolean = false;
      try {
        Logger.error();
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0013 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGVP1_1400
     * @tc.name      testLoggerVariadic0014
     * @tc.desc      Verify Logger.error accepts two arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0014 begin');
      let threw: boolean = false;
      try {
        Logger.error('alpha', 'beta');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0014 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGVP1_1500
     * @tc.name      testLoggerVariadic0015
     * @tc.desc      Verify Logger.error accepts format with two arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0015 begin');
      let threw: boolean = false;
      try {
        Logger.error('%{public}s', 'gamma', 'delta');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0015 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGVP1_1600
     * @tc.name      testLoggerVariadic0016
     * @tc.desc      Verify Logger.error accepts ten arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0016 begin');
      let threw: boolean = false;
      try {
        Logger.error('p0', 'p1', 'p2', 'p3', 'p4', 'p5', 'p6', 'p7', 'p8', 'p9');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0016 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGVP1_1700
     * @tc.name      testLoggerVariadic0017
     * @tc.desc      Verify Logger.fatal accepts no arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0017 begin');
      let threw: boolean = false;
      try {
        Logger.fatal();
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0017 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGVP1_1800
     * @tc.name      testLoggerVariadic0018
     * @tc.desc      Verify Logger.fatal accepts two arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0018 begin');
      let threw: boolean = false;
      try {
        Logger.fatal('alpha', 'beta');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0018 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGVP1_1900
     * @tc.name      testLoggerVariadic0019
     * @tc.desc      Verify Logger.fatal accepts format with two arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0019 begin');
      let threw: boolean = false;
      try {
        Logger.fatal('%{public}s', 'gamma', 'delta');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0019 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGVP1_2000
     * @tc.name      testLoggerVariadic0020
     * @tc.desc      Verify Logger.fatal accepts ten arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0020 begin');
      let threw: boolean = false;
      try {
        Logger.fatal('p0', 'p1', 'p2', 'p3', 'p4', 'p5', 'p6', 'p7', 'p8', 'p9');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0020 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGVP1_2100
     * @tc.name      testLoggerLevelBoundary0021
     * @tc.desc      Verify isLoggable accepts out-of-range level -1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerLevelBoundary0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerLevelBoundary0021 begin');
      let threw: boolean = false;
      try {
        Logger.isLoggable(-1);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerLevelBoundary0021 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGVP1_2200
     * @tc.name      testLoggerLevelBoundary0022
     * @tc.desc      Verify isLoggable accepts out-of-range level 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerLevelBoundary0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerLevelBoundary0022 begin');
      let threw: boolean = false;
      try {
        Logger.isLoggable(5);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerLevelBoundary0022 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGVP1_2300
     * @tc.name      testLoggerLevelBoundary0023
     * @tc.desc      Verify isLoggable accepts out-of-range level 100.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerLevelBoundary0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerLevelBoundary0023 begin');
      let threw: boolean = false;
      try {
        Logger.isLoggable(100);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerLevelBoundary0023 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGVP1_2400
     * @tc.name      testLoggerLevelBoundary0024
     * @tc.desc      Verify isLoggable accepts out-of-range level 1000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerLevelBoundary0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerLevelBoundary0024 begin');
      let threw: boolean = false;
      try {
        Logger.isLoggable(1000);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerLevelBoundary0024 end');
    })

  })
}

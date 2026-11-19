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

export default function LoggerContractPart1Test(): void {
  describe('LoggerContractPart1', () => {

    /**
     * @tc.number    SUB_SOCKET_LOGGERP1_0100
     * @tc.name      testLoggerType0001
     * @tc.desc      Verify the exported logger object exists and isLoggable returns void.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerType0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerType0001 begin');
      expect(Logger !== undefined).assertTrue();
      let failed: boolean = false;
      try {
        Logger.isLoggable(2);
      } catch (err) {
        failed = true;
      }
      expect(failed).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerType0001 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGGERP1_0200
     * @tc.name      testLoggerCall0002
     * @tc.desc      Verify Logger.debug accepts 'message'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCall0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0002 begin');
      let threw: boolean = false;
      try {
        Logger.debug('message');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0002 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGGERP1_0300
     * @tc.name      testLoggerCall0003
     * @tc.desc      Verify Logger.debug accepts ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCall0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0003 begin');
      let threw: boolean = false;
      try {
        Logger.debug('');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0003 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGGERP1_0400
     * @tc.name      testLoggerCall0004
     * @tc.desc      Verify Logger.debug accepts '中文消息'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCall0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0004 begin');
      let threw: boolean = false;
      try {
        Logger.debug('中文消息');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0004 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGGERP1_0500
     * @tc.name      testLoggerCall0005
     * @tc.desc      Verify Logger.debug accepts '%{public}s'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCall0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0005 begin');
      let threw: boolean = false;
      try {
        Logger.debug('%{public}s');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0005 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGGERP1_0600
     * @tc.name      testLoggerCall0006
     * @tc.desc      Verify Logger.info accepts 'message'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCall0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0006 begin');
      let threw: boolean = false;
      try {
        Logger.info('message');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0006 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGGERP1_0700
     * @tc.name      testLoggerCall0007
     * @tc.desc      Verify Logger.info accepts ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCall0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0007 begin');
      let threw: boolean = false;
      try {
        Logger.info('');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0007 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGGERP1_0800
     * @tc.name      testLoggerCall0008
     * @tc.desc      Verify Logger.info accepts '中文消息'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCall0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0008 begin');
      let threw: boolean = false;
      try {
        Logger.info('中文消息');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0008 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGGERP1_0900
     * @tc.name      testLoggerCall0009
     * @tc.desc      Verify Logger.info accepts '%{public}s'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCall0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0009 begin');
      let threw: boolean = false;
      try {
        Logger.info('%{public}s');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0009 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGGERP1_1000
     * @tc.name      testLoggerCall0010
     * @tc.desc      Verify Logger.warn accepts 'message'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCall0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0010 begin');
      let threw: boolean = false;
      try {
        Logger.warn('message');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0010 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGGERP1_1100
     * @tc.name      testLoggerCall0011
     * @tc.desc      Verify Logger.warn accepts ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCall0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0011 begin');
      let threw: boolean = false;
      try {
        Logger.warn('');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0011 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGGERP1_1200
     * @tc.name      testLoggerCall0012
     * @tc.desc      Verify Logger.warn accepts '中文消息'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCall0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0012 begin');
      let threw: boolean = false;
      try {
        Logger.warn('中文消息');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0012 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGGERP1_1300
     * @tc.name      testLoggerCall0013
     * @tc.desc      Verify Logger.warn accepts '%{public}s'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCall0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0013 begin');
      let threw: boolean = false;
      try {
        Logger.warn('%{public}s');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0013 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGGERP1_1400
     * @tc.name      testLoggerCall0014
     * @tc.desc      Verify Logger.error accepts 'message'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCall0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0014 begin');
      let threw: boolean = false;
      try {
        Logger.error('message');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0014 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGGERP1_1500
     * @tc.name      testLoggerCall0015
     * @tc.desc      Verify Logger.error accepts ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCall0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0015 begin');
      let threw: boolean = false;
      try {
        Logger.error('');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0015 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGGERP1_1600
     * @tc.name      testLoggerCall0016
     * @tc.desc      Verify Logger.error accepts '中文消息'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCall0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0016 begin');
      let threw: boolean = false;
      try {
        Logger.error('中文消息');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0016 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGGERP1_1700
     * @tc.name      testLoggerCall0017
     * @tc.desc      Verify Logger.error accepts '%{public}s'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCall0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0017 begin');
      let threw: boolean = false;
      try {
        Logger.error('%{public}s');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0017 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGGERP1_1800
     * @tc.name      testLoggerCall0018
     * @tc.desc      Verify Logger.fatal accepts 'message'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCall0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0018 begin');
      let threw: boolean = false;
      try {
        Logger.fatal('message');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0018 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGGERP1_1900
     * @tc.name      testLoggerCall0019
     * @tc.desc      Verify Logger.fatal accepts ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCall0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0019 begin');
      let threw: boolean = false;
      try {
        Logger.fatal('');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0019 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGGERP1_2000
     * @tc.name      testLoggerCall0020
     * @tc.desc      Verify Logger.fatal accepts '中文消息'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCall0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0020 begin');
      let threw: boolean = false;
      try {
        Logger.fatal('中文消息');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0020 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGGERP1_2100
     * @tc.name      testLoggerCall0021
     * @tc.desc      Verify Logger.fatal accepts '%{public}s'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCall0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0021 begin');
      let threw: boolean = false;
      try {
        Logger.fatal('%{public}s');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0021 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGGERP1_2200
     * @tc.name      testLoggerLevel0022
     * @tc.desc      Verify isLoggable accepts level 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerLevel0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerLevel0022 begin');
      let threw: boolean = false;
      try {
        Logger.isLoggable(0);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerLevel0022 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGGERP1_2300
     * @tc.name      testLoggerLevel0023
     * @tc.desc      Verify isLoggable accepts level 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerLevel0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerLevel0023 begin');
      let threw: boolean = false;
      try {
        Logger.isLoggable(1);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerLevel0023 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGGERP1_2400
     * @tc.name      testLoggerLevel0024
     * @tc.desc      Verify isLoggable accepts level 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerLevel0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerLevel0024 begin');
      let threw: boolean = false;
      try {
        Logger.isLoggable(2);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerLevel0024 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGGERP1_2500
     * @tc.name      testLoggerLevel0025
     * @tc.desc      Verify isLoggable accepts level 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerLevel0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerLevel0025 begin');
      let threw: boolean = false;
      try {
        Logger.isLoggable(3);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerLevel0025 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGGERP1_2600
     * @tc.name      testLoggerLevel0026
     * @tc.desc      Verify isLoggable accepts level 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerLevel0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerLevel0026 begin');
      let threw: boolean = false;
      try {
        Logger.isLoggable(4);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerLevel0026 end');
    })

  })
}

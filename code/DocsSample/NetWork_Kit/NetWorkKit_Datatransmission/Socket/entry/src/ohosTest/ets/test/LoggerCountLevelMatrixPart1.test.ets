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

export default function LoggerCountLevelMatrixPart1Test(): void {
  describe('LoggerCountLevelMatrixPart1', () => {

    /**
     * @tc.number    SUB_SOCKET_LCLP1_0100
     * @tc.name      testLoggerCount0001
     * @tc.desc      Verify Logger.debug accepts 1 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0001 begin');
      let threw: boolean = false;
      try {
        Logger.debug('a1');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0001 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_0200
     * @tc.name      testLoggerCount0002
     * @tc.desc      Verify Logger.debug accepts 2 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0002 begin');
      let threw: boolean = false;
      try {
        Logger.debug('a1', 'a2');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0002 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_0300
     * @tc.name      testLoggerCount0003
     * @tc.desc      Verify Logger.debug accepts 3 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0003 begin');
      let threw: boolean = false;
      try {
        Logger.debug('a1', 'a2', 'a3');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0003 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_0400
     * @tc.name      testLoggerCount0004
     * @tc.desc      Verify Logger.debug accepts 4 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0004 begin');
      let threw: boolean = false;
      try {
        Logger.debug('a1', 'a2', 'a3', 'a4');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0004 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_0500
     * @tc.name      testLoggerCount0005
     * @tc.desc      Verify Logger.debug accepts 5 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0005 begin');
      let threw: boolean = false;
      try {
        Logger.debug('a1', 'a2', 'a3', 'a4', 'a5');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0005 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_0600
     * @tc.name      testLoggerCount0006
     * @tc.desc      Verify Logger.debug accepts 6 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0006 begin');
      let threw: boolean = false;
      try {
        Logger.debug('a1', 'a2', 'a3', 'a4', 'a5', 'a6');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0006 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_0700
     * @tc.name      testLoggerCount0007
     * @tc.desc      Verify Logger.debug accepts 7 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0007 begin');
      let threw: boolean = false;
      try {
        Logger.debug('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0007 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_0800
     * @tc.name      testLoggerCount0008
     * @tc.desc      Verify Logger.debug accepts 8 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0008 begin');
      let threw: boolean = false;
      try {
        Logger.debug('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0008 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_0900
     * @tc.name      testLoggerCount0009
     * @tc.desc      Verify Logger.debug accepts 9 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0009 begin');
      let threw: boolean = false;
      try {
        Logger.debug('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0009 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_1000
     * @tc.name      testLoggerCount0010
     * @tc.desc      Verify Logger.debug accepts 10 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0010 begin');
      let threw: boolean = false;
      try {
        Logger.debug('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0010 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_1100
     * @tc.name      testLoggerCount0011
     * @tc.desc      Verify Logger.debug accepts 11 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0011 begin');
      let threw: boolean = false;
      try {
        Logger.debug('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0011 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_1200
     * @tc.name      testLoggerCount0012
     * @tc.desc      Verify Logger.debug accepts 12 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0012 begin');
      let threw: boolean = false;
      try {
        Logger.debug('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0012 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_1300
     * @tc.name      testLoggerCount0013
     * @tc.desc      Verify Logger.debug accepts 13 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0013 begin');
      let threw: boolean = false;
      try {
        Logger.debug('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0013 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_1400
     * @tc.name      testLoggerCount0014
     * @tc.desc      Verify Logger.debug accepts 14 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0014 begin');
      let threw: boolean = false;
      try {
        Logger.debug('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13', 'a14');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0014 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_1500
     * @tc.name      testLoggerCount0015
     * @tc.desc      Verify Logger.debug accepts 15 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0015 begin');
      let threw: boolean = false;
      try {
        Logger.debug('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13', 'a14', 'a15');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0015 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_1600
     * @tc.name      testLoggerCount0016
     * @tc.desc      Verify Logger.debug accepts 16 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0016 begin');
      let threw: boolean = false;
      try {
        Logger.debug('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13', 'a14', 'a15', 'a16');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0016 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_1700
     * @tc.name      testLoggerCount0017
     * @tc.desc      Verify Logger.debug accepts 17 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0017 begin');
      let threw: boolean = false;
      try {
        Logger.debug('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13', 'a14', 'a15', 'a16', 'a17');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0017 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_1800
     * @tc.name      testLoggerCount0018
     * @tc.desc      Verify Logger.debug accepts 18 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0018 begin');
      let threw: boolean = false;
      try {
        Logger.debug('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13', 'a14', 'a15', 'a16', 'a17', 'a18');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0018 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_1900
     * @tc.name      testLoggerCount0019
     * @tc.desc      Verify Logger.debug accepts 19 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0019 begin');
      let threw: boolean = false;
      try {
        Logger.debug('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13', 'a14', 'a15', 'a16', 'a17', 'a18', 'a19');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0019 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_2000
     * @tc.name      testLoggerCount0020
     * @tc.desc      Verify Logger.debug accepts 20 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0020 begin');
      let threw: boolean = false;
      try {
        Logger.debug('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13', 'a14', 'a15', 'a16', 'a17', 'a18', 'a19', 'a20');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0020 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_2100
     * @tc.name      testLoggerCount0021
     * @tc.desc      Verify Logger.info accepts 1 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0021 begin');
      let threw: boolean = false;
      try {
        Logger.info('a1');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0021 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_2200
     * @tc.name      testLoggerCount0022
     * @tc.desc      Verify Logger.info accepts 2 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0022 begin');
      let threw: boolean = false;
      try {
        Logger.info('a1', 'a2');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0022 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_2300
     * @tc.name      testLoggerCount0023
     * @tc.desc      Verify Logger.info accepts 3 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0023 begin');
      let threw: boolean = false;
      try {
        Logger.info('a1', 'a2', 'a3');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0023 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_2400
     * @tc.name      testLoggerCount0024
     * @tc.desc      Verify Logger.info accepts 4 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0024 begin');
      let threw: boolean = false;
      try {
        Logger.info('a1', 'a2', 'a3', 'a4');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0024 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_2500
     * @tc.name      testLoggerCount0025
     * @tc.desc      Verify Logger.info accepts 5 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0025 begin');
      let threw: boolean = false;
      try {
        Logger.info('a1', 'a2', 'a3', 'a4', 'a5');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0025 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_2600
     * @tc.name      testLoggerCount0026
     * @tc.desc      Verify Logger.info accepts 6 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0026 begin');
      let threw: boolean = false;
      try {
        Logger.info('a1', 'a2', 'a3', 'a4', 'a5', 'a6');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0026 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_2700
     * @tc.name      testLoggerCount0027
     * @tc.desc      Verify Logger.info accepts 7 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0027 begin');
      let threw: boolean = false;
      try {
        Logger.info('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0027 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_2800
     * @tc.name      testLoggerCount0028
     * @tc.desc      Verify Logger.info accepts 8 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0028 begin');
      let threw: boolean = false;
      try {
        Logger.info('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0028 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_2900
     * @tc.name      testLoggerCount0029
     * @tc.desc      Verify Logger.info accepts 9 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0029 begin');
      let threw: boolean = false;
      try {
        Logger.info('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0029 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_3000
     * @tc.name      testLoggerCount0030
     * @tc.desc      Verify Logger.info accepts 10 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0030 begin');
      let threw: boolean = false;
      try {
        Logger.info('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0030 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_3100
     * @tc.name      testLoggerCount0031
     * @tc.desc      Verify Logger.info accepts 11 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0031 begin');
      let threw: boolean = false;
      try {
        Logger.info('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0031 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_3200
     * @tc.name      testLoggerCount0032
     * @tc.desc      Verify Logger.info accepts 12 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0032 begin');
      let threw: boolean = false;
      try {
        Logger.info('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0032 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_3300
     * @tc.name      testLoggerCount0033
     * @tc.desc      Verify Logger.info accepts 13 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0033 begin');
      let threw: boolean = false;
      try {
        Logger.info('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0033 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_3400
     * @tc.name      testLoggerCount0034
     * @tc.desc      Verify Logger.info accepts 14 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0034 begin');
      let threw: boolean = false;
      try {
        Logger.info('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13', 'a14');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0034 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_3500
     * @tc.name      testLoggerCount0035
     * @tc.desc      Verify Logger.info accepts 15 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0035 begin');
      let threw: boolean = false;
      try {
        Logger.info('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13', 'a14', 'a15');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0035 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_3600
     * @tc.name      testLoggerCount0036
     * @tc.desc      Verify Logger.info accepts 16 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0036 begin');
      let threw: boolean = false;
      try {
        Logger.info('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13', 'a14', 'a15', 'a16');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0036 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_3700
     * @tc.name      testLoggerCount0037
     * @tc.desc      Verify Logger.info accepts 17 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0037 begin');
      let threw: boolean = false;
      try {
        Logger.info('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13', 'a14', 'a15', 'a16', 'a17');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0037 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_3800
     * @tc.name      testLoggerCount0038
     * @tc.desc      Verify Logger.info accepts 18 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0038 begin');
      let threw: boolean = false;
      try {
        Logger.info('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13', 'a14', 'a15', 'a16', 'a17', 'a18');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0038 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_3900
     * @tc.name      testLoggerCount0039
     * @tc.desc      Verify Logger.info accepts 19 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0039 begin');
      let threw: boolean = false;
      try {
        Logger.info('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13', 'a14', 'a15', 'a16', 'a17', 'a18', 'a19');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0039 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LCLP1_4000
     * @tc.name      testLoggerCount0040
     * @tc.desc      Verify Logger.info accepts 20 arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCount0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0040 begin');
      let threw: boolean = false;
      try {
        Logger.info('a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11', 'a12', 'a13', 'a14', 'a15', 'a16', 'a17', 'a18', 'a19', 'a20');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCount0040 end');
    })

  })
}

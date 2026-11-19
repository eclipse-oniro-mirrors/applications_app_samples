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

export default function LoggerContractMatrixPart1Test(): void {
  describe('LoggerContractMatrixPart1', () => {

    /**
     * @tc.number    SUB_PHOTO_LOGP1_0100
     * @tc.name      testLoggerCall0001
     * @tc.desc      Verify Logger.debug accepts no arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCall0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0001 begin');
      let threw: boolean = false;
      try {
        Logger.debug();
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0001 end');
    })

    /**
     * @tc.number    SUB_PHOTO_LOGP1_0200
     * @tc.name      testLoggerCall0002
     * @tc.desc      Verify Logger.debug accepts two arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCall0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0002 begin');
      let threw: boolean = false;
      try {
        Logger.debug('alpha', 'beta');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0002 end');
    })

    /**
     * @tc.number    SUB_PHOTO_LOGP1_0300
     * @tc.name      testLoggerCall0003
     * @tc.desc      Verify Logger.debug accepts format with two arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCall0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0003 begin');
      let threw: boolean = false;
      try {
        Logger.debug('%{public}s', 'gamma', 'delta');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0003 end');
    })

    /**
     * @tc.number    SUB_PHOTO_LOGP1_0400
     * @tc.name      testLoggerCall0004
     * @tc.desc      Verify Logger.debug accepts ten arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCall0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0004 begin');
      let threw: boolean = false;
      try {
        Logger.debug('p0', 'p1', 'p2', 'p3', 'p4', 'p5', 'p6', 'p7', 'p8', 'p9');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0004 end');
    })

    /**
     * @tc.number    SUB_PHOTO_LOGP1_0500
     * @tc.name      testLoggerCall0005
     * @tc.desc      Verify Logger.info accepts no arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCall0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0005 begin');
      let threw: boolean = false;
      try {
        Logger.info();
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0005 end');
    })

    /**
     * @tc.number    SUB_PHOTO_LOGP1_0600
     * @tc.name      testLoggerCall0006
     * @tc.desc      Verify Logger.info accepts two arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCall0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0006 begin');
      let threw: boolean = false;
      try {
        Logger.info('alpha', 'beta');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0006 end');
    })

    /**
     * @tc.number    SUB_PHOTO_LOGP1_0700
     * @tc.name      testLoggerCall0007
     * @tc.desc      Verify Logger.info accepts format with two arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCall0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0007 begin');
      let threw: boolean = false;
      try {
        Logger.info('%{public}s', 'gamma', 'delta');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0007 end');
    })

    /**
     * @tc.number    SUB_PHOTO_LOGP1_0800
     * @tc.name      testLoggerCall0008
     * @tc.desc      Verify Logger.info accepts ten arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCall0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0008 begin');
      let threw: boolean = false;
      try {
        Logger.info('p0', 'p1', 'p2', 'p3', 'p4', 'p5', 'p6', 'p7', 'p8', 'p9');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0008 end');
    })

    /**
     * @tc.number    SUB_PHOTO_LOGP1_0900
     * @tc.name      testLoggerCall0009
     * @tc.desc      Verify Logger.warn accepts no arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCall0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0009 begin');
      let threw: boolean = false;
      try {
        Logger.warn();
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0009 end');
    })

    /**
     * @tc.number    SUB_PHOTO_LOGP1_1000
     * @tc.name      testLoggerCall0010
     * @tc.desc      Verify Logger.warn accepts two arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCall0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0010 begin');
      let threw: boolean = false;
      try {
        Logger.warn('alpha', 'beta');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0010 end');
    })

    /**
     * @tc.number    SUB_PHOTO_LOGP1_1100
     * @tc.name      testLoggerCall0011
     * @tc.desc      Verify Logger.warn accepts format with two arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCall0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0011 begin');
      let threw: boolean = false;
      try {
        Logger.warn('%{public}s', 'gamma', 'delta');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0011 end');
    })

    /**
     * @tc.number    SUB_PHOTO_LOGP1_1200
     * @tc.name      testLoggerCall0012
     * @tc.desc      Verify Logger.warn accepts ten arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCall0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0012 begin');
      let threw: boolean = false;
      try {
        Logger.warn('p0', 'p1', 'p2', 'p3', 'p4', 'p5', 'p6', 'p7', 'p8', 'p9');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0012 end');
    })

    /**
     * @tc.number    SUB_PHOTO_LOGP1_1300
     * @tc.name      testLoggerCall0013
     * @tc.desc      Verify Logger.error accepts no arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCall0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0013 begin');
      let threw: boolean = false;
      try {
        Logger.error();
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0013 end');
    })

    /**
     * @tc.number    SUB_PHOTO_LOGP1_1400
     * @tc.name      testLoggerCall0014
     * @tc.desc      Verify Logger.error accepts two arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCall0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0014 begin');
      let threw: boolean = false;
      try {
        Logger.error('alpha', 'beta');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0014 end');
    })

    /**
     * @tc.number    SUB_PHOTO_LOGP1_1500
     * @tc.name      testLoggerCall0015
     * @tc.desc      Verify Logger.error accepts format with two arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCall0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0015 begin');
      let threw: boolean = false;
      try {
        Logger.error('%{public}s', 'gamma', 'delta');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0015 end');
    })

    /**
     * @tc.number    SUB_PHOTO_LOGP1_1600
     * @tc.name      testLoggerCall0016
     * @tc.desc      Verify Logger.error accepts ten arguments.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerCall0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0016 begin');
      let threw: boolean = false;
      try {
        Logger.error('p0', 'p1', 'p2', 'p3', 'p4', 'p5', 'p6', 'p7', 'p8', 'p9');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerCall0016 end');
    })

  })
}

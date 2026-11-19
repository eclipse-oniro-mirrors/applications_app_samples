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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { HarLogger } from '../../../main/ets/utils/WindowManageBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'HarLoggerCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function runSafely(action: () => void): boolean {
  let thrown: boolean = false;
  try {
    action();
  } catch (err) {
    thrown = true;
  }
  return thrown;
}

export default function harLoggerCoreTest(): void {
  describe('HarLoggerCoreTest', () => {
    /**
     * @tc.number    SUB_WINDOW_MANAGE_HARLOGGER_0301
     * @tc.name      testHarLoggerCore0301
     * @tc.desc      Verify HarLogger.info accepts a tagged message without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHarLoggerCore0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testHarLoggerCore0301 begin');
      const thrown: boolean = runSafely(() => {
        HarLogger.info('WindowManger', 'ohosTest info');
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse thrown=${thrown}`);
      expect(thrown).assertFalse();
      log('testHarLoggerCore0301 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_HARLOGGER_0302
     * @tc.name      testHarLoggerCore0302
     * @tc.desc      Verify HarLogger.debug accepts a tagged message without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHarLoggerCore0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testHarLoggerCore0302 begin');
      const thrown: boolean = runSafely(() => {
        HarLogger.debug('WindowManger', 'ohosTest debug');
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse thrown=${thrown}`);
      expect(thrown).assertFalse();
      log('testHarLoggerCore0302 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_HARLOGGER_0303
     * @tc.name      testHarLoggerCore0303
     * @tc.desc      Verify HarLogger.warn accepts a tagged message without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHarLoggerCore0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testHarLoggerCore0303 begin');
      const thrown: boolean = runSafely(() => {
        HarLogger.warn('WindowManger', 'ohosTest warn');
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse thrown=${thrown}`);
      expect(thrown).assertFalse();
      log('testHarLoggerCore0303 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_HARLOGGER_0304
     * @tc.name      testHarLoggerCore0304
     * @tc.desc      Verify HarLogger.error accepts a tagged message without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHarLoggerCore0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testHarLoggerCore0304 begin');
      const thrown: boolean = runSafely(() => {
        HarLogger.error('WindowManger', 'ohosTest error');
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse thrown=${thrown}`);
      expect(thrown).assertFalse();
      log('testHarLoggerCore0304 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_HARLOGGER_0305
     * @tc.name      testHarLoggerCore0305
     * @tc.desc      Verify HarLogger.log accepts a tagged message without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHarLoggerCore0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testHarLoggerCore0305 begin');
      const thrown: boolean = runSafely(() => {
        HarLogger.log('WindowManger', 'ohosTest log');
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse thrown=${thrown}`);
      expect(thrown).assertFalse();
      log('testHarLoggerCore0305 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_HARLOGGER_0306
     * @tc.name      testHarLoggerCore0306
     * @tc.desc      Verify HarLogger.info accepts multiple joined arguments without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHarLoggerCore0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testHarLoggerCore0306 begin');
      const thrown: boolean = runSafely(() => {
        HarLogger.info('MainAbility', 'a', 'b', 'c');
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse thrown=${thrown}`);
      expect(thrown).assertFalse();
      log('testHarLoggerCore0306 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_HARLOGGER_0307
     * @tc.name      testHarLoggerCore0307
     * @tc.desc      Verify HarLogger.info accepts an empty tag without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHarLoggerCore0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testHarLoggerCore0307 begin');
      const thrown: boolean = runSafely(() => {
        HarLogger.info('');
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse thrown=${thrown}`);
      expect(thrown).assertFalse();
      log('testHarLoggerCore0307 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_HARLOGGER_0308
     * @tc.name      testHarLoggerCore0308
     * @tc.desc      Verify HarLogger accepts numeric and boolean arguments without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHarLoggerCore0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testHarLoggerCore0308 begin');
      const thrown: boolean = runSafely(() => {
        HarLogger.info('WindowManger', 1001, true, 1.5);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse thrown=${thrown}`);
      expect(thrown).assertFalse();
      log('testHarLoggerCore0308 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_HARLOGGER_0309
     * @tc.name      testHarLoggerCore0309
     * @tc.desc      Check HarLogger is exported as a class constructor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHarLoggerCore0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testHarLoggerCore0309 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof HarLogger=${typeof HarLogger}, expected='function'`);
      expect(typeof HarLogger).assertEqual('function');
      log('testHarLoggerCore0309 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_HARLOGGER_0310
     * @tc.name      testHarLoggerCore0310
     * @tc.desc      Check all five HarLogger levels are exposed as static functions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHarLoggerCore0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testHarLoggerCore0310 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof HarLogger.log=${typeof HarLogger.log}`);
      expect(typeof HarLogger.log).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof HarLogger.info=${typeof HarLogger.info}`);
      expect(typeof HarLogger.info).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof HarLogger.debug=${typeof HarLogger.debug}`);
      expect(typeof HarLogger.debug).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof HarLogger.warn=${typeof HarLogger.warn}`);
      expect(typeof HarLogger.warn).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof HarLogger.error=${typeof HarLogger.error}`);
      expect(typeof HarLogger.error).assertEqual('function');
      log('testHarLoggerCore0310 end');
    })
  })
}

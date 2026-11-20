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
import Logger from '../../../main/ets/logger/Logger';

const DOMAIN: number = 0xF814;
const TAG: string = 'LoggerUtilityCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function callSafely(call: () => void): boolean {
  try {
    call();
    return true;
  } catch (error) {
    log('callSafely failed: ' + String(error));
    return false;
  }
}

export default function loggerUtilityCoreTest(): void {
  describe('LoggerUtilityCoreTest', () => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_LOGGERCORE_0301
     * @tc.name      testLoggerCore0301
     * @tc.desc      Verify a debug log call completes without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerCore0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerCore0301 begin');
      const ok: boolean = callSafely(() => {
        Logger.debug('publish form debug message');
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ok=${ok}`);
      expect(ok).assertTrue();
      log('testLoggerCore0301 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_LOGGERCORE_0302
     * @tc.name      testLoggerCore0302
     * @tc.desc      Verify an info log call completes without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerCore0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerCore0302 begin');
      const ok: boolean = callSafely(() => {
        Logger.info('publish form info message');
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ok=${ok}`);
      expect(ok).assertTrue();
      log('testLoggerCore0302 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_LOGGERCORE_0303
     * @tc.name      testLoggerCore0303
     * @tc.desc      Verify a warn log call completes without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerCore0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerCore0303 begin');
      const ok: boolean = callSafely(() => {
        Logger.warn('publish form warn message');
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ok=${ok}`);
      expect(ok).assertTrue();
      log('testLoggerCore0303 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_LOGGERCORE_0304
     * @tc.name      testLoggerCore0304
     * @tc.desc      Verify an error log call completes without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerCore0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerCore0304 begin');
      const ok: boolean = callSafely(() => {
        Logger.error('publish form error message');
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ok=${ok}`);
      expect(ok).assertTrue();
      log('testLoggerCore0304 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_LOGGERCORE_0305
     * @tc.name      testLoggerCore0305
     * @tc.desc      Verify the debug method reference keeps the function type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerCore0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerCore0305 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Logger.debug=${typeof Logger.debug}`);
      expect(typeof Logger.debug).assertEqual('function');
      log('testLoggerCore0305 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_LOGGERCORE_0306
     * @tc.name      testLoggerCore0306
     * @tc.desc      Verify a debug call with multiple arguments completes safely.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerCore0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerCore0306 begin');
      const ok: boolean = callSafely(() => {
        Logger.debug('RequestPublishForm want:', 'dimension 2x2');
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ok=${ok}`);
      expect(ok).assertTrue();
      log('testLoggerCore0306 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_LOGGERCORE_0307
     * @tc.name      testLoggerCore0307
     * @tc.desc      Verify a debug call with no arguments completes safely.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerCore0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerCore0307 begin');
      const ok: boolean = callSafely(() => {
        Logger.debug();
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ok=${ok}`);
      expect(ok).assertTrue();
      log('testLoggerCore0307 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_LOGGERCORE_0308
     * @tc.name      testLoggerCore0308
     * @tc.desc      Verify an info call with a long message completes safely.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerCore0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerCore0308 begin');
      const longMessage: string = 'requestPublishForm-'.repeat(10);
      const ok: boolean = callSafely(() => {
        Logger.info(longMessage);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ok=${ok}`);
      expect(ok).assertTrue();
      log('testLoggerCore0308 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_LOGGERCORE_0309
     * @tc.name      testLoggerCore0309
     * @tc.desc      Verify an info call with a Chinese message completes safely.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerCore0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerCore0309 begin');
      const ok: boolean = callSafely(() => {
        Logger.info('请求发布卡片消息');
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ok=${ok}`);
      expect(ok).assertTrue();
      log('testLoggerCore0309 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_LOGGERCORE_0310
     * @tc.name      testLoggerCore0310
     * @tc.desc      Verify an info call with a JSON style message completes safely.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerCore0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerCore0310 begin');
      const ok: boolean = callSafely(() => {
        Logger.info('{"formName":"widget","dimension":4}');
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ok=${ok}`);
      expect(ok).assertTrue();
      log('testLoggerCore0310 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_LOGGERCORE_0311
     * @tc.name      testLoggerCore0311
     * @tc.desc      Verify an error call with a failure style message completes safely.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerCore0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerCore0311 begin');
      const ok: boolean = callSafely(() => {
        Logger.error('RequestPublishForm failed : inner error');
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ok=${ok}`);
      expect(ok).assertTrue();
      log('testLoggerCore0311 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_LOGGERCORE_0312
     * @tc.name      testLoggerCore0312
     * @tc.desc      Verify a warn call with a permission style message completes safely.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerCore0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerCore0312 begin');
      const ok: boolean = callSafely(() => {
        Logger.warn('REQUIRE_FORM permission required');
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ok=${ok}`);
      expect(ok).assertTrue();
      log('testLoggerCore0312 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_LOGGERCORE_0313
     * @tc.name      testLoggerCore0313
     * @tc.desc      Verify all four log levels complete safely in one sequence.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerCore0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerCore0313 begin');
      const ok: boolean = callSafely(() => {
        Logger.debug('seq debug');
        Logger.info('seq info');
        Logger.warn('seq warn');
        Logger.error('seq error');
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ok=${ok}`);
      expect(ok).assertTrue();
      log('testLoggerCore0313 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_LOGGERCORE_0314
     * @tc.name      testLoggerCore0314
     * @tc.desc      Verify three repeated debug calls complete safely.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerCore0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerCore0314 begin');
      const ok: boolean = callSafely(() => {
        Logger.debug('repeat one');
        Logger.debug('repeat two');
        Logger.debug('repeat three');
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ok=${ok}`);
      expect(ok).assertTrue();
      log('testLoggerCore0314 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_LOGGERCORE_0315
     * @tc.name      testLoggerCore0315
     * @tc.desc      Verify alternating debug and info calls complete safely.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerCore0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerCore0315 begin');
      const ok: boolean = callSafely(() => {
        Logger.debug('alt debug');
        Logger.info('alt info');
        Logger.debug('alt debug two');
        Logger.info('alt info two');
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ok=${ok}`);
      expect(ok).assertTrue();
      log('testLoggerCore0315 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_LOGGERCORE_0316
     * @tc.name      testLoggerCore0316
     * @tc.desc      Verify a debug call with tab and newline characters completes safely.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerCore0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerCore0316 begin');
      const ok: boolean = callSafely(() => {
        Logger.debug('line one\tcolumn two\nline three');
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ok=${ok}`);
      expect(ok).assertTrue();
      log('testLoggerCore0316 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_LOGGERCORE_0317
     * @tc.name      testLoggerCore0317
     * @tc.desc      Verify an info call with an empty message completes safely.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerCore0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerCore0317 begin');
      const ok: boolean = callSafely(() => {
        Logger.info('');
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ok=${ok}`);
      expect(ok).assertTrue();
      log('testLoggerCore0317 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_LOGGERCORE_0318
     * @tc.name      testLoggerCore0318
     * @tc.desc      Verify a debug call with a numeric string message completes safely.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerCore0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerCore0318 begin');
      const ok: boolean = callSafely(() => {
        Logger.debug('1234567890');
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ok=${ok}`);
      expect(ok).assertTrue();
      log('testLoggerCore0318 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_LOGGERCORE_0319
     * @tc.name      testLoggerCore0319
     * @tc.desc      Verify an error call with a serialized want message completes safely.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerCore0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerCore0319 begin');
      const ok: boolean = callSafely(() => {
        Logger.error('=====> want is {"abilityName":"EntryFormAbility"}');
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ok=${ok}`);
      expect(ok).assertTrue();
      log('testLoggerCore0319 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_LOGGERCORE_0320
     * @tc.name      testLoggerCore0320
     * @tc.desc      Verify two full rounds over all log levels complete safely.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerCore0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerCore0320 begin');
      const ok: boolean = callSafely(() => {
        for (let round: number = 0; round < 2; round++) {
          Logger.debug('round ' + round + ' debug');
          Logger.info('round ' + round + ' info');
          Logger.warn('round ' + round + ' warn');
          Logger.error('round ' + round + ' error');
        }
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ok=${ok}`);
      expect(ok).assertTrue();
      log('testLoggerCore0320 end');
    })
  })
}

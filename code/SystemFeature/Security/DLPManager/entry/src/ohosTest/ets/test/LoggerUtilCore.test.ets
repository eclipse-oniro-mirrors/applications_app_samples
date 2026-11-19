/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import DlpLogger, { Logger } from '../../../main/ets/utils/Logger';

const DOMAIN: number = 0xF814;
const TAG: string = 'LoggerUtilTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function repeatChar(ch: string, count: number): string {
  let result: string = '';
  for (let i = 0; i < count; i++) {
    result += ch;
  }
  return result;
}

export default function loggerUtilCoreTest(): void {
  describe('LoggerUtilCoreTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0401
     * @tc.name      testLoggerUtil0401
     * @tc.desc      Verify the default logger instance is an object.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0401 begin');
      expect(typeof DlpLogger).assertEqual('object');
      log('testLoggerUtil0401 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0402
     * @tc.name      testLoggerUtil0402
     * @tc.desc      Verify the default logger instance is not null.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0402 begin');
      expect(DlpLogger !== null).assertTrue();
      log('testLoggerUtil0402 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0403
     * @tc.name      testLoggerUtil0403
     * @tc.desc      Verify the default logger exposes an info function.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0403 begin');
      expect(typeof DlpLogger.info).assertEqual('function');
      log('testLoggerUtil0403 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0404
     * @tc.name      testLoggerUtil0404
     * @tc.desc      Verify the default logger exposes a debug function.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0404 begin');
      expect(typeof DlpLogger.debug).assertEqual('function');
      log('testLoggerUtil0404 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0405
     * @tc.name      testLoggerUtil0405
     * @tc.desc      Verify the default logger exposes a warn function.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0405 begin');
      expect(typeof DlpLogger.warn).assertEqual('function');
      log('testLoggerUtil0405 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0406
     * @tc.name      testLoggerUtil0406
     * @tc.desc      Verify the default logger exposes an error function.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0406 begin');
      expect(typeof DlpLogger.error).assertEqual('function');
      log('testLoggerUtil0406 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0407
     * @tc.name      testLoggerUtil0407
     * @tc.desc      Verify the default logger exposes a fatal function.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0407 begin');
      expect(typeof DlpLogger.fatal).assertEqual('function');
      log('testLoggerUtil0407 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0408
     * @tc.name      testLoggerUtil0408
     * @tc.desc      Verify the default logger exposes an isLoggable function.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0408 begin');
      expect(typeof DlpLogger.isLoggable).assertEqual('function');
      log('testLoggerUtil0408 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0409
     * @tc.name      testLoggerUtil0409
     * @tc.desc      Verify constructing a logger with a normal tag.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0409 begin');
      const logger: Logger = new Logger('tag-one');
      expect(typeof logger).assertEqual('object');
      expect(logger !== null).assertTrue();
      log('testLoggerUtil0409 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0410
     * @tc.name      testLoggerUtil0410
     * @tc.desc      Verify constructing a logger with an empty tag.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0410 begin');
      const logger: Logger = new Logger('');
      expect(typeof logger).assertEqual('object');
      log('testLoggerUtil0410 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0411
     * @tc.name      testLoggerUtil0411
     * @tc.desc      Verify constructing a logger with a long tag.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0411 begin');
      const logger: Logger = new Logger(repeatChar('t', 200));
      expect(typeof logger).assertEqual('object');
      log('testLoggerUtil0411 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0412
     * @tc.name      testLoggerUtil0412
     * @tc.desc      Verify constructing a logger with a CJK tag.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0412 begin');
      const logger: Logger = new Logger('标签');
      expect(typeof logger).assertEqual('object');
      log('testLoggerUtil0412 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0413
     * @tc.name      testLoggerUtil0413
     * @tc.desc      Verify constructing a logger with a spaced tag.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0413 begin');
      const logger: Logger = new Logger('a b c');
      expect(typeof logger).assertEqual('object');
      log('testLoggerUtil0413 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0414
     * @tc.name      testLoggerUtil0414
     * @tc.desc      Verify constructing a logger with a hilog format tag.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0414 begin');
      const logger: Logger = new Logger('%{public}s');
      expect(typeof logger).assertEqual('object');
      log('testLoggerUtil0414 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0415
     * @tc.name      testLoggerUtil0415
     * @tc.desc      Verify constructing a logger with a numeric tag.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0415 begin');
      const logger: Logger = new Logger('12345');
      expect(typeof logger).assertEqual('object');
      log('testLoggerUtil0415 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0416
     * @tc.name      testLoggerUtil0416
     * @tc.desc      Verify two logger instances are distinct objects.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0416 begin');
      const first: Logger = new Logger('first');
      const second: Logger = new Logger('second');
      expect(first === second).assertFalse();
      log('testLoggerUtil0416 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0417
     * @tc.name      testLoggerUtil0417
     * @tc.desc      Verify a fresh logger can emit an info message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0417 begin');
      const logger: Logger = new Logger('fresh-info');
      expect(typeof logger.info('m')).assertEqual('undefined');
      log('testLoggerUtil0417 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0418
     * @tc.name      testLoggerUtil0418
     * @tc.desc      Verify a fresh logger can emit an error message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0418 begin');
      const logger: Logger = new Logger('fresh-error');
      expect(typeof logger.error('m')).assertEqual('undefined');
      log('testLoggerUtil0418 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0419
     * @tc.name      testLoggerUtil0419
     * @tc.desc      Verify info accepts an empty message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0419 begin');
      expect(typeof DlpLogger.info('')).assertEqual('undefined');
      log('testLoggerUtil0419 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0420
     * @tc.name      testLoggerUtil0420
     * @tc.desc      Verify info accepts a simple message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0420 begin');
      expect(typeof DlpLogger.info('hello')).assertEqual('undefined');
      log('testLoggerUtil0420 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0421
     * @tc.name      testLoggerUtil0421
     * @tc.desc      Verify info accepts a CJK message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0421 begin');
      expect(typeof DlpLogger.info('日志测试')).assertEqual('undefined');
      log('testLoggerUtil0421 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0422
     * @tc.name      testLoggerUtil0422
     * @tc.desc      Verify info accepts a long message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0422 begin');
      expect(typeof DlpLogger.info(repeatChar('x', 500))).assertEqual('undefined');
      log('testLoggerUtil0422 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0423
     * @tc.name      testLoggerUtil0423
     * @tc.desc      Verify info accepts two arguments.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0423', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0423 begin');
      expect(typeof DlpLogger.info('a', 'b')).assertEqual('undefined');
      log('testLoggerUtil0423 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0424
     * @tc.name      testLoggerUtil0424
     * @tc.desc      Verify info accepts three arguments.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0424', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0424 begin');
      expect(typeof DlpLogger.info('a', 'b', 'c')).assertEqual('undefined');
      log('testLoggerUtil0424 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0425
     * @tc.name      testLoggerUtil0425
     * @tc.desc      Verify info accepts five arguments.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0425', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0425 begin');
      expect(typeof DlpLogger.info('a', 'b', 'c', 'd', 'e')).assertEqual('undefined');
      log('testLoggerUtil0425 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0426
     * @tc.name      testLoggerUtil0426
     * @tc.desc      Verify info accepts a JSON styled message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0426', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0426 begin');
      expect(typeof DlpLogger.info('{"k":"v"}')).assertEqual('undefined');
      log('testLoggerUtil0426 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0427
     * @tc.name      testLoggerUtil0427
     * @tc.desc      Verify info accepts a hilog format placeholder message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0427 begin');
      expect(typeof DlpLogger.info('%{public}s')).assertEqual('undefined');
      log('testLoggerUtil0427 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0428
     * @tc.name      testLoggerUtil0428
     * @tc.desc      Verify info accepts a sandbox file URI message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0428 begin');
      expect(typeof DlpLogger.info('file://com.sample.dlpmanager/data/storage/el2/base/haps/entry/files'))
        .assertEqual('undefined');
      log('testLoggerUtil0428 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0429
     * @tc.name      testLoggerUtil0429
     * @tc.desc      Verify info accepts a multiline message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0429 begin');
      expect(typeof DlpLogger.info('line1\nline2')).assertEqual('undefined');
      log('testLoggerUtil0429 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0430
     * @tc.name      testLoggerUtil0430
     * @tc.desc      Verify info accepts a tab separated message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0430 begin');
      expect(typeof DlpLogger.info('tab\there')).assertEqual('undefined');
      log('testLoggerUtil0430 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0431
     * @tc.name      testLoggerUtil0431
     * @tc.desc      Verify info accepts a quoted message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0431', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0431 begin');
      expect(typeof DlpLogger.info('"quoted"')).assertEqual('undefined');
      log('testLoggerUtil0431 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0432
     * @tc.name      testLoggerUtil0432
     * @tc.desc      Verify info accepts a numeric text message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0432', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0432 begin');
      expect(typeof DlpLogger.info('n=12345')).assertEqual('undefined');
      log('testLoggerUtil0432 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0433
     * @tc.name      testLoggerUtil0433
     * @tc.desc      Verify five repeated identical info calls stay safe.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0433', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0433 begin');
      for (let i = 0; i < 5; i++) {
        expect(typeof DlpLogger.info('repeat')).assertEqual('undefined');
      }
      log('testLoggerUtil0433 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0434
     * @tc.name      testLoggerUtil0434
     * @tc.desc      Verify three info calls with different arguments stay safe.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0434', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0434 begin');
      expect(typeof DlpLogger.info('first')).assertEqual('undefined');
      expect(typeof DlpLogger.info('second', 'x')).assertEqual('undefined');
      expect(typeof DlpLogger.info('third', 'y', 'z')).assertEqual('undefined');
      log('testLoggerUtil0434 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0435
     * @tc.name      testLoggerUtil0435
     * @tc.desc      Verify info works right after a debug call.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0435', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0435 begin');
      DlpLogger.debug('before');
      expect(typeof DlpLogger.info('after-debug')).assertEqual('undefined');
      log('testLoggerUtil0435 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0436
     * @tc.name      testLoggerUtil0436
     * @tc.desc      Verify info works right after an error call.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0436', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0436 begin');
      DlpLogger.error('before');
      expect(typeof DlpLogger.info('after-error')).assertEqual('undefined');
      log('testLoggerUtil0436 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0437
     * @tc.name      testLoggerUtil0437
     * @tc.desc      Verify debug accepts an empty message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0437', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0437 begin');
      expect(typeof DlpLogger.debug('')).assertEqual('undefined');
      log('testLoggerUtil0437 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0438
     * @tc.name      testLoggerUtil0438
     * @tc.desc      Verify debug accepts a simple message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0438', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0438 begin');
      expect(typeof DlpLogger.debug('debug msg')).assertEqual('undefined');
      log('testLoggerUtil0438 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0439
     * @tc.name      testLoggerUtil0439
     * @tc.desc      Verify debug accepts a CJK message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0439', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0439 begin');
      expect(typeof DlpLogger.debug('调试信息')).assertEqual('undefined');
      log('testLoggerUtil0439 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0440
     * @tc.name      testLoggerUtil0440
     * @tc.desc      Verify debug accepts a long message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0440', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0440 begin');
      expect(typeof DlpLogger.debug(repeatChar('d', 300))).assertEqual('undefined');
      log('testLoggerUtil0440 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0441
     * @tc.name      testLoggerUtil0441
     * @tc.desc      Verify debug accepts two arguments.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0441', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0441 begin');
      expect(typeof DlpLogger.debug('a', 'b')).assertEqual('undefined');
      log('testLoggerUtil0441 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0442
     * @tc.name      testLoggerUtil0442
     * @tc.desc      Verify debug accepts three arguments.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0442', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0442 begin');
      expect(typeof DlpLogger.debug('a', 'b', 'c')).assertEqual('undefined');
      log('testLoggerUtil0442 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0443
     * @tc.name      testLoggerUtil0443
     * @tc.desc      Verify debug accepts a JSON styled message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0443', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0443 begin');
      expect(typeof DlpLogger.debug('{"debug":true}')).assertEqual('undefined');
      log('testLoggerUtil0443 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0444
     * @tc.name      testLoggerUtil0444
     * @tc.desc      Verify debug accepts a path styled message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0444', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0444 begin');
      expect(typeof DlpLogger.debug('path/to/file.txt')).assertEqual('undefined');
      log('testLoggerUtil0444 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0445
     * @tc.name      testLoggerUtil0445
     * @tc.desc      Verify debug accepts a multiline message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0445', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0445 begin');
      expect(typeof DlpLogger.debug('d1\nd2')).assertEqual('undefined');
      log('testLoggerUtil0445 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0446
     * @tc.name      testLoggerUtil0446
     * @tc.desc      Verify five repeated identical debug calls stay safe.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0446', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0446 begin');
      for (let i = 0; i < 5; i++) {
        expect(typeof DlpLogger.debug('repeat')).assertEqual('undefined');
      }
      log('testLoggerUtil0446 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0447
     * @tc.name      testLoggerUtil0447
     * @tc.desc      Verify three debug calls with different arguments stay safe.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0447', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0447 begin');
      expect(typeof DlpLogger.debug('one')).assertEqual('undefined');
      expect(typeof DlpLogger.debug('two', 'p')).assertEqual('undefined');
      expect(typeof DlpLogger.debug('three', 'q', 'r')).assertEqual('undefined');
      log('testLoggerUtil0447 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0448
     * @tc.name      testLoggerUtil0448
     * @tc.desc      Verify debug works on a dedicated instance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0448', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0448 begin');
      const logger: Logger = new Logger('debug-tag');
      expect(typeof logger.debug('m')).assertEqual('undefined');
      log('testLoggerUtil0448 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0449
     * @tc.name      testLoggerUtil0449
     * @tc.desc      Verify debug works right after an info call.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0449', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0449 begin');
      DlpLogger.info('before');
      expect(typeof DlpLogger.debug('after-info')).assertEqual('undefined');
      log('testLoggerUtil0449 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0450
     * @tc.name      testLoggerUtil0450
     * @tc.desc      Verify debug works right after a fatal call.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0450', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0450 begin');
      DlpLogger.fatal('before');
      expect(typeof DlpLogger.debug('after-fatal')).assertEqual('undefined');
      log('testLoggerUtil0450 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0451
     * @tc.name      testLoggerUtil0451
     * @tc.desc      Verify warn accepts an empty message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0451', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0451 begin');
      expect(typeof DlpLogger.warn('')).assertEqual('undefined');
      log('testLoggerUtil0451 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0452
     * @tc.name      testLoggerUtil0452
     * @tc.desc      Verify warn accepts a simple message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0452', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0452 begin');
      expect(typeof DlpLogger.warn('warn msg')).assertEqual('undefined');
      log('testLoggerUtil0452 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0453
     * @tc.name      testLoggerUtil0453
     * @tc.desc      Verify warn accepts a CJK message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0453', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0453 begin');
      expect(typeof DlpLogger.warn('警告信息')).assertEqual('undefined');
      log('testLoggerUtil0453 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0454
     * @tc.name      testLoggerUtil0454
     * @tc.desc      Verify warn accepts a long message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0454', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0454 begin');
      expect(typeof DlpLogger.warn(repeatChar('w', 200))).assertEqual('undefined');
      log('testLoggerUtil0454 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0455
     * @tc.name      testLoggerUtil0455
     * @tc.desc      Verify warn accepts two arguments.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0455', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0455 begin');
      expect(typeof DlpLogger.warn('a', 'b')).assertEqual('undefined');
      log('testLoggerUtil0455 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0456
     * @tc.name      testLoggerUtil0456
     * @tc.desc      Verify warn accepts three arguments.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0456', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0456 begin');
      expect(typeof DlpLogger.warn('a', 'b', 'c')).assertEqual('undefined');
      log('testLoggerUtil0456 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0457
     * @tc.name      testLoggerUtil0457
     * @tc.desc      Verify warn accepts a JSON styled message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0457', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0457 begin');
      expect(typeof DlpLogger.warn('{"warn":1}')).assertEqual('undefined');
      log('testLoggerUtil0457 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0458
     * @tc.name      testLoggerUtil0458
     * @tc.desc      Verify warn accepts a format placeholder message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0458', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0458 begin');
      expect(typeof DlpLogger.warn('value %d')).assertEqual('undefined');
      log('testLoggerUtil0458 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0459
     * @tc.name      testLoggerUtil0459
     * @tc.desc      Verify three repeated identical warn calls stay safe.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0459', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0459 begin');
      for (let i = 0; i < 3; i++) {
        expect(typeof DlpLogger.warn('repeat')).assertEqual('undefined');
      }
      log('testLoggerUtil0459 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0460
     * @tc.name      testLoggerUtil0460
     * @tc.desc      Verify two warn calls with different arguments stay safe.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0460', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0460 begin');
      expect(typeof DlpLogger.warn('first')).assertEqual('undefined');
      expect(typeof DlpLogger.warn('second', 'x')).assertEqual('undefined');
      log('testLoggerUtil0460 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0461
     * @tc.name      testLoggerUtil0461
     * @tc.desc      Verify warn works on a dedicated instance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0461', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0461 begin');
      const logger: Logger = new Logger('warn-tag');
      expect(typeof logger.warn('m')).assertEqual('undefined');
      log('testLoggerUtil0461 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0462
     * @tc.name      testLoggerUtil0462
     * @tc.desc      Verify warn works right after an error call.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0462', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0462 begin');
      DlpLogger.error('before');
      expect(typeof DlpLogger.warn('after-error')).assertEqual('undefined');
      log('testLoggerUtil0462 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0463
     * @tc.name      testLoggerUtil0463
     * @tc.desc      Verify error accepts an empty message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0463', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0463 begin');
      expect(typeof DlpLogger.error('')).assertEqual('undefined');
      log('testLoggerUtil0463 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0464
     * @tc.name      testLoggerUtil0464
     * @tc.desc      Verify error accepts a simple message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0464', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0464 begin');
      expect(typeof DlpLogger.error('error msg')).assertEqual('undefined');
      log('testLoggerUtil0464 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0465
     * @tc.name      testLoggerUtil0465
     * @tc.desc      Verify error accepts a CJK message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0465', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0465 begin');
      expect(typeof DlpLogger.error('错误信息')).assertEqual('undefined');
      log('testLoggerUtil0465 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0466
     * @tc.name      testLoggerUtil0466
     * @tc.desc      Verify error accepts a long message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0466', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0466 begin');
      expect(typeof DlpLogger.error(repeatChar('e', 200))).assertEqual('undefined');
      log('testLoggerUtil0466 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0467
     * @tc.name      testLoggerUtil0467
     * @tc.desc      Verify error accepts two arguments.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0467', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0467 begin');
      expect(typeof DlpLogger.error('a', 'b')).assertEqual('undefined');
      log('testLoggerUtil0467 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0468
     * @tc.name      testLoggerUtil0468
     * @tc.desc      Verify error accepts a business error styled message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0468', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0468 begin');
      expect(typeof DlpLogger.error('code=13400001,msg=x')).assertEqual('undefined');
      log('testLoggerUtil0468 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0469
     * @tc.name      testLoggerUtil0469
     * @tc.desc      Verify error accepts a JSON styled message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0469', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0469 begin');
      expect(typeof DlpLogger.error('{"err":true}')).assertEqual('undefined');
      log('testLoggerUtil0469 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0470
     * @tc.name      testLoggerUtil0470
     * @tc.desc      Verify error accepts a stack styled message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0470', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0470 begin');
      expect(typeof DlpLogger.error('at fn (file.ets:1)')).assertEqual('undefined');
      log('testLoggerUtil0470 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0471
     * @tc.name      testLoggerUtil0471
     * @tc.desc      Verify three repeated identical error calls stay safe.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0471', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0471 begin');
      for (let i = 0; i < 3; i++) {
        expect(typeof DlpLogger.error('repeat')).assertEqual('undefined');
      }
      log('testLoggerUtil0471 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0472
     * @tc.name      testLoggerUtil0472
     * @tc.desc      Verify two error calls with different arguments stay safe.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0472', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0472 begin');
      expect(typeof DlpLogger.error('first')).assertEqual('undefined');
      expect(typeof DlpLogger.error('second', 'x')).assertEqual('undefined');
      log('testLoggerUtil0472 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0473
     * @tc.name      testLoggerUtil0473
     * @tc.desc      Verify error works on a dedicated instance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0473', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0473 begin');
      const logger: Logger = new Logger('err-tag');
      expect(typeof logger.error('m')).assertEqual('undefined');
      log('testLoggerUtil0473 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0474
     * @tc.name      testLoggerUtil0474
     * @tc.desc      Verify error works right after a warn call.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0474', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0474 begin');
      DlpLogger.warn('before');
      expect(typeof DlpLogger.error('after-warn')).assertEqual('undefined');
      log('testLoggerUtil0474 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0475
     * @tc.name      testLoggerUtil0475
     * @tc.desc      Verify fatal accepts an empty message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0475', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0475 begin');
      expect(typeof DlpLogger.fatal('')).assertEqual('undefined');
      log('testLoggerUtil0475 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0476
     * @tc.name      testLoggerUtil0476
     * @tc.desc      Verify fatal accepts a simple message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0476', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0476 begin');
      expect(typeof DlpLogger.fatal('fatal msg')).assertEqual('undefined');
      log('testLoggerUtil0476 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0477
     * @tc.name      testLoggerUtil0477
     * @tc.desc      Verify fatal accepts a CJK message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0477', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0477 begin');
      expect(typeof DlpLogger.fatal('致命信息')).assertEqual('undefined');
      log('testLoggerUtil0477 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0478
     * @tc.name      testLoggerUtil0478
     * @tc.desc      Verify fatal accepts a long message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0478', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0478 begin');
      expect(typeof DlpLogger.fatal(repeatChar('f', 150))).assertEqual('undefined');
      log('testLoggerUtil0478 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0479
     * @tc.name      testLoggerUtil0479
     * @tc.desc      Verify fatal accepts two arguments.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0479', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0479 begin');
      expect(typeof DlpLogger.fatal('a', 'b')).assertEqual('undefined');
      log('testLoggerUtil0479 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0480
     * @tc.name      testLoggerUtil0480
     * @tc.desc      Verify fatal accepts a JSON styled message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0480', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0480 begin');
      expect(typeof DlpLogger.fatal('{"fatal":1}')).assertEqual('undefined');
      log('testLoggerUtil0480 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0481
     * @tc.name      testLoggerUtil0481
     * @tc.desc      Verify three repeated identical fatal calls stay safe.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0481', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0481 begin');
      for (let i = 0; i < 3; i++) {
        expect(typeof DlpLogger.fatal('repeat')).assertEqual('undefined');
      }
      log('testLoggerUtil0481 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0482
     * @tc.name      testLoggerUtil0482
     * @tc.desc      Verify fatal works on a dedicated instance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0482', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0482 begin');
      const logger: Logger = new Logger('fatal-tag');
      expect(typeof logger.fatal('m')).assertEqual('undefined');
      log('testLoggerUtil0482 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0483
     * @tc.name      testLoggerUtil0483
     * @tc.desc      Verify fatal works right after an info call.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0483', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0483 begin');
      DlpLogger.info('before');
      expect(typeof DlpLogger.fatal('after-info')).assertEqual('undefined');
      log('testLoggerUtil0483 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0484
     * @tc.name      testLoggerUtil0484
     * @tc.desc      Verify fatal works right after a debug call.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0484', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0484 begin');
      DlpLogger.debug('before');
      expect(typeof DlpLogger.fatal('after-debug')).assertEqual('undefined');
      log('testLoggerUtil0484 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0485
     * @tc.name      testLoggerUtil0485
     * @tc.desc      Verify isLoggable accepts level zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0485', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0485 begin');
      expect(typeof DlpLogger.isLoggable(0)).assertEqual('undefined');
      log('testLoggerUtil0485 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0486
     * @tc.name      testLoggerUtil0486
     * @tc.desc      Verify isLoggable accepts level one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0486', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0486 begin');
      expect(typeof DlpLogger.isLoggable(1)).assertEqual('undefined');
      log('testLoggerUtil0486 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0487
     * @tc.name      testLoggerUtil0487
     * @tc.desc      Verify isLoggable accepts level two.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0487', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0487 begin');
      expect(typeof DlpLogger.isLoggable(2)).assertEqual('undefined');
      log('testLoggerUtil0487 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0488
     * @tc.name      testLoggerUtil0488
     * @tc.desc      Verify isLoggable accepts the debug level.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0488', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0488 begin');
      expect(typeof DlpLogger.isLoggable(3)).assertEqual('undefined');
      log('testLoggerUtil0488 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0489
     * @tc.name      testLoggerUtil0489
     * @tc.desc      Verify isLoggable accepts the info level.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0489', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0489 begin');
      expect(typeof DlpLogger.isLoggable(4)).assertEqual('undefined');
      log('testLoggerUtil0489 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0490
     * @tc.name      testLoggerUtil0490
     * @tc.desc      Verify isLoggable accepts the warn level.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0490', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0490 begin');
      expect(typeof DlpLogger.isLoggable(5)).assertEqual('undefined');
      log('testLoggerUtil0490 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0491
     * @tc.name      testLoggerUtil0491
     * @tc.desc      Verify isLoggable accepts the error level.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0491', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0491 begin');
      expect(typeof DlpLogger.isLoggable(6)).assertEqual('undefined');
      log('testLoggerUtil0491 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0492
     * @tc.name      testLoggerUtil0492
     * @tc.desc      Verify isLoggable accepts the fatal level.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0492', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0492 begin');
      expect(typeof DlpLogger.isLoggable(7)).assertEqual('undefined');
      log('testLoggerUtil0492 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0493
     * @tc.name      testLoggerUtil0493
     * @tc.desc      Verify isLoggable works on a dedicated instance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0493', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0493 begin');
      const logger: Logger = new Logger('level-tag');
      expect(typeof logger.isLoggable(4)).assertEqual('undefined');
      log('testLoggerUtil0493 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0494
     * @tc.name      testLoggerUtil0494
     * @tc.desc      Verify isLoggable works on two fresh instances.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0494', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0494 begin');
      const first: Logger = new Logger('level-a');
      const second: Logger = new Logger('level-b');
      expect(typeof first.isLoggable(3)).assertEqual('undefined');
      expect(typeof second.isLoggable(4)).assertEqual('undefined');
      log('testLoggerUtil0494 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0495
     * @tc.name      testLoggerUtil0495
     * @tc.desc      Verify repeated isLoggable calls stay safe.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0495', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0495 begin');
      for (let i = 0; i < 5; i++) {
        expect(typeof DlpLogger.isLoggable(3)).assertEqual('undefined');
      }
      log('testLoggerUtil0495 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0496
     * @tc.name      testLoggerUtil0496
     * @tc.desc      Verify isLoggable returns undefined by type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0496', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0496 begin');
      const result = DlpLogger.isLoggable(4);
      expect(typeof result).assertEqual('undefined');
      log('testLoggerUtil0496 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0497
     * @tc.name      testLoggerUtil0497
     * @tc.desc      Verify all five levels emit in ascending sequence.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0497', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0497 begin');
      expect(typeof DlpLogger.debug('s')).assertEqual('undefined');
      expect(typeof DlpLogger.info('s')).assertEqual('undefined');
      expect(typeof DlpLogger.warn('s')).assertEqual('undefined');
      expect(typeof DlpLogger.error('s')).assertEqual('undefined');
      expect(typeof DlpLogger.fatal('s')).assertEqual('undefined');
      log('testLoggerUtil0497 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0498
     * @tc.name      testLoggerUtil0498
     * @tc.desc      Verify all five levels emit in descending sequence.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0498', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0498 begin');
      expect(typeof DlpLogger.fatal('r')).assertEqual('undefined');
      expect(typeof DlpLogger.error('r')).assertEqual('undefined');
      expect(typeof DlpLogger.warn('r')).assertEqual('undefined');
      expect(typeof DlpLogger.info('r')).assertEqual('undefined');
      expect(typeof DlpLogger.debug('r')).assertEqual('undefined');
      log('testLoggerUtil0498 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0499
     * @tc.name      testLoggerUtil0499
     * @tc.desc      Verify ten info calls with changing arguments stay safe.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0499', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0499 begin');
      for (let i = 0; i < 10; i++) {
        expect(typeof DlpLogger.info('loop-' + i)).assertEqual('undefined');
      }
      log('testLoggerUtil0499 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0500
     * @tc.name      testLoggerUtil0500
     * @tc.desc      Verify two instances can emit interleaved messages.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0500 begin');
      const first: Logger = new Logger('mix-a');
      const second: Logger = new Logger('mix-b');
      expect(typeof first.info('one')).assertEqual('undefined');
      expect(typeof second.info('two')).assertEqual('undefined');
      expect(typeof first.warn('three')).assertEqual('undefined');
      expect(typeof second.error('four')).assertEqual('undefined');
      log('testLoggerUtil0500 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0501
     * @tc.name      testLoggerUtil0501
     * @tc.desc      Verify a very long 2000 character message is accepted.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0501', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0501 begin');
      expect(typeof DlpLogger.info(repeatChar('L', 2000))).assertEqual('undefined');
      log('testLoggerUtil0501 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0502
     * @tc.name      testLoggerUtil0502
     * @tc.desc      Verify a double placeholder format message is accepted.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0502', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0502 begin');
      expect(typeof DlpLogger.info('%{public}s %{public}s')).assertEqual('undefined');
      log('testLoggerUtil0502 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0503
     * @tc.name      testLoggerUtil0503
     * @tc.desc      Verify a message containing the default tag is accepted.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0503', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0503 begin');
      expect(typeof DlpLogger.info('[dlpmanager] inner')).assertEqual('undefined');
      log('testLoggerUtil0503 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0504
     * @tc.name      testLoggerUtil0504
     * @tc.desc      Verify an inline constructed logger emits an info message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0504', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0504 begin');
      expect(typeof new Logger('inline').info('m')).assertEqual('undefined');
      log('testLoggerUtil0504 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0505
     * @tc.name      testLoggerUtil0505
     * @tc.desc      Verify identical calls on two instances both return undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0505', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0505 begin');
      const first: Logger = new Logger('same-a');
      const second: Logger = new Logger('same-b');
      expect(typeof first.info('m')).assertEqual('undefined');
      expect(typeof second.info('m')).assertEqual('undefined');
      log('testLoggerUtil0505 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0506
     * @tc.name      testLoggerUtil0506
     * @tc.desc      Verify the default logger exposes every member as function.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0506', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0506 begin');
      expect(typeof DlpLogger.debug).assertEqual('function');
      expect(typeof DlpLogger.info).assertEqual('function');
      expect(typeof DlpLogger.warn).assertEqual('function');
      expect(typeof DlpLogger.error).assertEqual('function');
      expect(typeof DlpLogger.fatal).assertEqual('function');
      expect(typeof DlpLogger.isLoggable).assertEqual('function');
      log('testLoggerUtil0506 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0507
     * @tc.name      testLoggerUtil0507
     * @tc.desc      Verify two constructed loggers emit info messages.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0507', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0507 begin');
      const first: Logger = new Logger('a');
      const second: Logger = new Logger('b');
      expect(typeof first.info('x')).assertEqual('undefined');
      expect(typeof second.info('y')).assertEqual('undefined');
      log('testLoggerUtil0507 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_LOGGERUTIL_0508
     * @tc.name      testLoggerUtil0508
     * @tc.desc      Verify one fresh logger can emit every level with arguments.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoggerUtil0508', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLoggerUtil0508 begin');
      const logger: Logger = new Logger('all-levels');
      expect(typeof logger.debug('d', '1')).assertEqual('undefined');
      expect(typeof logger.info('i', '2')).assertEqual('undefined');
      expect(typeof logger.warn('w', '3')).assertEqual('undefined');
      expect(typeof logger.error('e', '4')).assertEqual('undefined');
      expect(typeof logger.fatal('f', '5')).assertEqual('undefined');
      log('testLoggerUtil0508 end');
    })
  })
}

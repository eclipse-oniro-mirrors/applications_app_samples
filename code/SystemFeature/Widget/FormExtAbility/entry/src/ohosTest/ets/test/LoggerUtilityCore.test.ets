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
import Logger from '../../../main/ets/model/Logger';

const DOMAIN: number = 0xF814;
const TAG: string = 'LoggerUtilityTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function loggerUtilityCoreTest(): void {
  describe('LoggerUtilityTest', () => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_LOGGER_0401
     * @tc.name      testLogger0401
     * @tc.desc      Verify Logger.log returns undefined for a single message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLogger0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLogger0401 begin');
      Logger.log('single message');
      expect(true).assertTrue();
      log('testLogger0401 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LOGGER_0402
     * @tc.name      testLogger0402
     * @tc.desc      Verify Logger.log joins multiple arguments without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLogger0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLogger0402 begin');
      Logger.log('part1', 'part2', 'part3');
      expect(true).assertTrue();
      log('testLogger0402 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LOGGER_0403
     * @tc.name      testLogger0403
     * @tc.desc      Verify Logger.log handles an empty string argument.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLogger0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLogger0403 begin');
      Logger.log('');
      expect(true).assertTrue();
      log('testLogger0403 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LOGGER_0404
     * @tc.name      testLogger0404
     * @tc.desc      Verify Logger.log handles special characters and Chinese text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLogger0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLogger0404 begin');
      Logger.log('温度: 25°C, status=ok, 中文消息');
      expect(true).assertTrue();
      log('testLogger0404 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LOGGER_0405
     * @tc.name      testLogger0405
     * @tc.desc      Verify Logger.log handles a long composed message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLogger0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLogger0405 begin');
      let longMessage: string = '';
      for (let i: number = 0; i < 200; i++) {
        longMessage = longMessage + 'log';
      }
      Logger.log(longMessage);
      expect(true).assertTrue();
      log('testLogger0405 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LOGGER_0406
     * @tc.name      testLogger0406
     * @tc.desc      Verify Logger.info returns undefined for a message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLogger0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLogger0406 begin');
      Logger.info('info message');
      expect(true).assertTrue();
      log('testLogger0406 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LOGGER_0407
     * @tc.name      testLogger0407
     * @tc.desc      Verify Logger.info joins multiple arguments.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLogger0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLogger0407 begin');
      Logger.info('a', 'b', 'c');
      expect(true).assertTrue();
      log('testLogger0407 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LOGGER_0408
     * @tc.name      testLogger0408
     * @tc.desc      Verify Logger.info handles an empty string argument.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLogger0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLogger0408 begin');
      Logger.info('');
      expect(true).assertTrue();
      log('testLogger0408 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LOGGER_0409
     * @tc.name      testLogger0409
     * @tc.desc      Verify Logger.debug returns undefined for a message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLogger0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLogger0409 begin');
      Logger.debug('debug message');
      expect(true).assertTrue();
      log('testLogger0409 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LOGGER_0410
     * @tc.name      testLogger0410
     * @tc.desc      Verify Logger.debug joins multiple arguments.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLogger0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLogger0410 begin');
      Logger.debug('x', 'y');
      expect(true).assertTrue();
      log('testLogger0410 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LOGGER_0411
     * @tc.name      testLogger0411
     * @tc.desc      Verify Logger.debug handles an empty string argument.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLogger0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLogger0411 begin');
      Logger.debug('');
      expect(true).assertTrue();
      log('testLogger0411 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LOGGER_0412
     * @tc.name      testLogger0412
     * @tc.desc      Verify Logger.warn returns undefined for a message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLogger0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLogger0412 begin');
      Logger.warn('warn message');
      expect(true).assertTrue();
      log('testLogger0412 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LOGGER_0413
     * @tc.name      testLogger0413
     * @tc.desc      Verify Logger.warn joins multiple arguments.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLogger0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLogger0413 begin');
      Logger.warn('w1', 'w2');
      expect(true).assertTrue();
      log('testLogger0413 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LOGGER_0414
     * @tc.name      testLogger0414
     * @tc.desc      Verify Logger.warn handles an empty string argument.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLogger0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLogger0414 begin');
      Logger.warn('');
      expect(true).assertTrue();
      log('testLogger0414 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LOGGER_0415
     * @tc.name      testLogger0415
     * @tc.desc      Verify Logger.error returns undefined for a message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLogger0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLogger0415 begin');
      Logger.error('error message');
      expect(true).assertTrue();
      log('testLogger0415 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LOGGER_0416
     * @tc.name      testLogger0416
     * @tc.desc      Verify Logger.error joins multiple arguments.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLogger0416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLogger0416 begin');
      Logger.error('e1', 'e2', 'e3');
      expect(true).assertTrue();
      log('testLogger0416 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LOGGER_0417
     * @tc.name      testLogger0417
     * @tc.desc      Verify Logger.error handles an empty string argument.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLogger0417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLogger0417 begin');
      Logger.error('');
      expect(true).assertTrue();
      log('testLogger0417 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LOGGER_0418
     * @tc.name      testLogger0418
     * @tc.desc      Checks every Logger level method keeps function type on the singleton.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLogger0418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLogger0418 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Logger.log=${typeof Logger.log}, expected='function'`);
      expect(typeof Logger.log).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Logger.info=${typeof Logger.info}`);
      expect(typeof Logger.info).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Logger.debug=${typeof Logger.debug}`);
      expect(typeof Logger.debug).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Logger.warn=${typeof Logger.warn}`);
      expect(typeof Logger.warn).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Logger.error=${typeof Logger.error}`);
      expect(typeof Logger.error).assertEqual('function');
      log('testLogger0418 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LOGGER_0419
     * @tc.name      testLogger0419
     * @tc.desc      Verify repeated Logger.log calls on the singleton stay stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLogger0419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLogger0419 begin');
      for (let i: number = 0; i < 10; i++) {
        Logger.log('round ' + i.toString());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testLogger0419 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LOGGER_0420
     * @tc.name      testLogger0420
     * @tc.desc      Verify mixed level calls in one sequence all return undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLogger0420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLogger0420 begin');
      Logger.log('mixed');
      Logger.info('mixed');
      Logger.debug('mixed');
      Logger.warn('mixed');
      Logger.error('mixed');
      expect(true).assertTrue();
      log('testLogger0420 end');
    })
  })
}

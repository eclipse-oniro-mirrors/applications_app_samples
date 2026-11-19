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
import { logger } from '../../../main/ets/CitySearchTestBridge';

const DOMAIN: number = 0xF811;
const TAG: string = 'HarLoggerCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function harLoggerCoreTest(): void {
  describe('HarLoggerCoreTest', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_HARLOGGER_0301
     * @tc.name      CitySearch_HarLogger_0301
     * @tc.desc      Verify logger.info prints without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_HarLogger_0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_HarLogger_0301 begin');
      let noThrow: boolean = true;
      try {
        logger.info('citysearch logger info message');
      } catch (error) {
        noThrow = false;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue noThrow=${noThrow}`);
      expect(noThrow).assertTrue();
      log('CitySearch_HarLogger_0301 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_HARLOGGER_0302
     * @tc.name      CitySearch_HarLogger_0302
     * @tc.desc      Verify logger.debug prints without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_HarLogger_0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_HarLogger_0302 begin');
      let noThrow: boolean = true;
      try {
        logger.debug('citysearch logger debug message');
      } catch (error) {
        noThrow = false;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue noThrow=${noThrow}`);
      expect(noThrow).assertTrue();
      log('CitySearch_HarLogger_0302 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_HARLOGGER_0303
     * @tc.name      CitySearch_HarLogger_0303
     * @tc.desc      Verify logger.warn prints without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_HarLogger_0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_HarLogger_0303 begin');
      let noThrow: boolean = true;
      try {
        logger.warn('citysearch logger warn message');
      } catch (error) {
        noThrow = false;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue noThrow=${noThrow}`);
      expect(noThrow).assertTrue();
      log('CitySearch_HarLogger_0303 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_HARLOGGER_0304
     * @tc.name      CitySearch_HarLogger_0304
     * @tc.desc      Verify logger.error prints without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_HarLogger_0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_HarLogger_0304 begin');
      let noThrow: boolean = true;
      try {
        logger.error('citysearch logger error message');
      } catch (error) {
        noThrow = false;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue noThrow=${noThrow}`);
      expect(noThrow).assertTrue();
      log('CitySearch_HarLogger_0304 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_HARLOGGER_0305
     * @tc.name      CitySearch_HarLogger_0305
     * @tc.desc      Verify logger.info accepts an empty message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_HarLogger_0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_HarLogger_0305 begin');
      let noThrow: boolean = true;
      try {
        logger.info('');
      } catch (error) {
        noThrow = false;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue noThrow=${noThrow}`);
      expect(noThrow).assertTrue();
      log('CitySearch_HarLogger_0305 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_HARLOGGER_0306
     * @tc.name      CitySearch_HarLogger_0306
     * @tc.desc      Verify logger.info accepts Chinese messages.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_HarLogger_0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_HarLogger_0306 begin');
      let noThrow: boolean = true;
      try {
        logger.info('城市搜索：北京 上海 广州');
      } catch (error) {
        noThrow = false;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue noThrow=${noThrow}`);
      expect(noThrow).assertTrue();
      log('CitySearch_HarLogger_0306 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_HARLOGGER_0307
     * @tc.name      CitySearch_HarLogger_0307
     * @tc.desc      Verify logger.info accepts a very long message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_HarLogger_0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_HarLogger_0307 begin');
      const longMessage: string = 'citysearch-log-'.repeat(100);
      let noThrow: boolean = true;
      try {
        logger.info(longMessage);
      } catch (error) {
        noThrow = false;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue noThrow=${noThrow}`);
      expect(noThrow).assertTrue();
      log('CitySearch_HarLogger_0307 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_HARLOGGER_0308
     * @tc.name      CitySearch_HarLogger_0308
     * @tc.desc      Verify exported logger is a usable object.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_HarLogger_0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_HarLogger_0308 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger=${typeof logger}, expected='object'`);
      expect(typeof logger).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue logger !== undefined=${logger !== undefined}`);
      expect(logger !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue logger !== null=${logger !== null}`);
      expect(logger !== null).assertTrue();
      log('CitySearch_HarLogger_0308 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_HARLOGGER_0309
     * @tc.name      CitySearch_HarLogger_0309
     * @tc.desc      Verify sequential mixed-level calls stay stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_HarLogger_0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_HarLogger_0309 begin');
      let noThrow: boolean = true;
      try {
        logger.debug('mixed-1');
        logger.info('mixed-2');
        logger.warn('mixed-3');
        logger.error('mixed-4');
      } catch (error) {
        noThrow = false;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue noThrow=${noThrow}`);
      expect(noThrow).assertTrue();
      log('CitySearch_HarLogger_0309 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_HARLOGGER_0310
     * @tc.name      CitySearch_HarLogger_0310
     * @tc.desc      Verify logger remains usable after repeated calls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_HarLogger_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_HarLogger_0310 begin');
      for (let i: number = 0; i < 10; i++) {
        logger.info('repeat-' + i);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger=${typeof logger}, expected='object'`);
      expect(typeof logger).assertEqual('object');
      logger.info('still usable');
      log('CitySearch_HarLogger_0310 end');
    })
  })
}

/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { logger } from '../../../main/ets/bridge/TabContentTouchHotZoneBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'TabOverflowLoggerCore';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function tabOverflowLoggerCoreTest(): void {
  describe('TabOverflowLoggerCoreTest', () => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_LOGGER_0201
     * @tc.name      testTabOverflowLogger0201
     * @tc.desc      Checks the exported logger singleton is a non-null object.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowLogger0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowLogger0201 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${logger !== undefined && logger !== null}`);
      expect(logger !== undefined && logger !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger=${typeof logger}, expected='object'`);
      expect(typeof logger).assertEqual('object');
      log('testTabOverflowLogger0201 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_LOGGER_0202
     * @tc.name      testTabOverflowLogger0202
     * @tc.desc      Checks logger.info is a callable function and logs without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowLogger0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowLogger0202 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.info=${typeof logger.info}`);
      expect(typeof logger.info).assertEqual('function');
      logger.info('TabOverflowLoggerCore', 'info message from ohosTest');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testTabOverflowLogger0202 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_LOGGER_0203
     * @tc.name      testTabOverflowLogger0203
     * @tc.desc      Checks logger.debug is a callable function and logs without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowLogger0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowLogger0203 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.debug=${typeof logger.debug}`);
      expect(typeof logger.debug).assertEqual('function');
      logger.debug('TabOverflowLoggerCore', 'debug message from ohosTest');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testTabOverflowLogger0203 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_LOGGER_0204
     * @tc.name      testTabOverflowLogger0204
     * @tc.desc      Checks logger.warn is a callable function and logs without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowLogger0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowLogger0204 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.warn=${typeof logger.warn}`);
      expect(typeof logger.warn).assertEqual('function');
      logger.warn('TabOverflowLoggerCore', 'warn message from ohosTest');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testTabOverflowLogger0204 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_LOGGER_0205
     * @tc.name      testTabOverflowLogger0205
     * @tc.desc      Checks logger.error is a callable function and logs without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowLogger0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowLogger0205 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.error=${typeof logger.error}`);
      expect(typeof logger.error).assertEqual('function');
      logger.error('TabOverflowLoggerCore', 'error message from ohosTest');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testTabOverflowLogger0205 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_LOGGER_0206
     * @tc.name      testTabOverflowLogger0206
     * @tc.desc      Checks logger.info handles a long message without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowLogger0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowLogger0206 begin');
      let longMessage: string = '';
      for (let i: number = 0; i < 30; i++) {
        longMessage += 'TabContentOverflowLongMessage';
      }
      logger.info('TabOverflowLoggerCore', longMessage);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue longMessage.length > 0=${longMessage.length > 0}`);
      expect(longMessage.length > 0).assertTrue();
      log('testTabOverflowLogger0206 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_LOGGER_0207
     * @tc.name      testTabOverflowLogger0207
     * @tc.desc      Checks logger.error handles an empty message without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowLogger0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowLogger0207 begin');
      logger.error('TabOverflowLoggerCore', '');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ''=${''}, expected=''`);
      expect('').assertEqual('');
      log('testTabOverflowLogger0207 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_LOGGER_0208
     * @tc.name      testTabOverflowLogger0208
     * @tc.desc      Checks ten repeated logger.info calls stay stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowLogger0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowLogger0208 begin');
      for (let i: number = 0; i < 10; i++) {
        logger.info('TabOverflowLoggerCore', 'repeat call ' + i.toString());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testTabOverflowLogger0208 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_LOGGER_0209
     * @tc.name      testTabOverflowLogger0209
     * @tc.desc      Checks mixed level logger calls in one sequence stay stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowLogger0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowLogger0209 begin');
      logger.info('TabOverflowLoggerCore', 'mixed info');
      logger.debug('TabOverflowLoggerCore', 'mixed debug');
      logger.warn('TabOverflowLoggerCore', 'mixed warn');
      logger.error('TabOverflowLoggerCore', 'mixed error');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testTabOverflowLogger0209 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_LOGGER_0210
     * @tc.name      testTabOverflowLogger0210
     * @tc.desc      Checks logger.info handles Chinese and special characters without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowLogger0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowLogger0210 begin');
      logger.info('TabOverflowLoggerCore', '中文日志@北大是只猫 · 100%#tag');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testTabOverflowLogger0210 end');
    })
  })
}

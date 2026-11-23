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
import { beforeEach, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../utils/YieldHook';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { logger } from '../../../main/ets/bridge/PageLoadingBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'HarLoggerCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function harLoggerCoreTest(): void {
  describe('HarLoggerCoreTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_HARLOG_0401
     * @tc.name      testHarLogger0401
     * @tc.desc      Verify the shared logger singleton exists as an object.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHarLogger0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testHarLogger0401 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${logger !== undefined && logger !== null}`);
      expect(logger !== undefined && logger !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger=${typeof logger}, expected='object'`);
      expect(typeof logger).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue logger.info !== undefined=${logger.info !== undefined}`);
      expect(logger.info !== undefined).assertTrue();
      log('testHarLogger0401 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_HARLOG_0402
     * @tc.name      testHarLogger0402
     * @tc.desc      Verify info is a callable function member.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHarLogger0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testHarLogger0402 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.info=${typeof logger.info}`);
      expect(typeof logger.info).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue logger.info !== undefined=${logger.info !== undefined}`);
      expect(logger.info !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger=${typeof logger}, expected='object'`);
      expect(typeof logger).assertEqual('object');
      log('testHarLogger0402 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_HARLOG_0403
     * @tc.name      testHarLogger0403
     * @tc.desc      Verify debug is a callable function member.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHarLogger0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testHarLogger0403 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.debug=${typeof logger.debug}`);
      expect(typeof logger.debug).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue logger.debug !== undefined=${logger.debug !== undefined}`);
      expect(logger.debug !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger=${typeof logger}, expected='object'`);
      expect(typeof logger).assertEqual('object');
      log('testHarLogger0403 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_HARLOG_0404
     * @tc.name      testHarLogger0404
     * @tc.desc      Verify warn is a callable function member.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHarLogger0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testHarLogger0404 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.warn=${typeof logger.warn}`);
      expect(typeof logger.warn).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue logger.warn !== undefined=${logger.warn !== undefined}`);
      expect(logger.warn !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger=${typeof logger}, expected='object'`);
      expect(typeof logger).assertEqual('object');
      log('testHarLogger0404 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_HARLOG_0405
     * @tc.name      testHarLogger0405
     * @tc.desc      Verify error is a callable function member.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHarLogger0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testHarLogger0405 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.error=${typeof logger.error}`);
      expect(typeof logger.error).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue logger.error !== undefined=${logger.error !== undefined}`);
      expect(logger.error !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger=${typeof logger}, expected='object'`);
      expect(typeof logger).assertEqual('object');
      log('testHarLogger0405 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_HARLOG_0406
     * @tc.name      testHarLogger0406
     * @tc.desc      Verify info accepts an empty message without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHarLogger0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testHarLogger0406 begin');
      let caught: boolean = false;
      try {
        logger.info('');
      } catch (error) {
        caught = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse caught=${caught}`);
      expect(caught).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger=${typeof logger}, expected='object'`);
      expect(typeof logger).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue logger.error !== undefined=${logger.error !== undefined}`);
      expect(logger.error !== undefined).assertTrue();
      log('testHarLogger0406 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_HARLOG_0407
     * @tc.name      testHarLogger0407
     * @tc.desc      Verify info accepts a Chinese message without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHarLogger0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testHarLogger0407 begin');
      let caught: boolean = false;
      try {
        logger.info('页面加载示例日志：商品精选');
      } catch (error) {
        caught = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse caught=${caught}`);
      expect(caught).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger=${typeof logger}, expected='object'`);
      expect(typeof logger).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue logger.error !== undefined=${logger.error !== undefined}`);
      expect(logger.error !== undefined).assertTrue();
      log('testHarLogger0407 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_HARLOG_0408
     * @tc.name      testHarLogger0408
     * @tc.desc      Verify info accepts a very long message without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHarLogger0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testHarLogger0408 begin');
      let caught: boolean = false;
      try {
        logger.info('x'.repeat(2000));
      } catch (error) {
        caught = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse caught=${caught}`);
      expect(caught).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger=${typeof logger}, expected='object'`);
      expect(typeof logger).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue logger.error !== undefined=${logger.error !== undefined}`);
      expect(logger.error !== undefined).assertTrue();
      log('testHarLogger0408 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_HARLOG_0409
     * @tc.name      testHarLogger0409
     * @tc.desc      Verify debug accepts multiple arguments without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHarLogger0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testHarLogger0409 begin');
      let caught: boolean = false;
      try {
        logger.debug('a', 'b', 'c');
      } catch (error) {
        caught = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse caught=${caught}`);
      expect(caught).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger=${typeof logger}, expected='object'`);
      expect(typeof logger).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue logger.error !== undefined=${logger.error !== undefined}`);
      expect(logger.error !== undefined).assertTrue();
      log('testHarLogger0409 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_HARLOG_0410
     * @tc.name      testHarLogger0410
     * @tc.desc      Verify warn accepts multiple arguments without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHarLogger0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testHarLogger0410 begin');
      let caught: boolean = false;
      try {
        logger.warn('w1', 'w2', 'w3');
      } catch (error) {
        caught = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse caught=${caught}`);
      expect(caught).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger=${typeof logger}, expected='object'`);
      expect(typeof logger).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue logger.error !== undefined=${logger.error !== undefined}`);
      expect(logger.error !== undefined).assertTrue();
      log('testHarLogger0410 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_HARLOG_0411
     * @tc.name      testHarLogger0411
     * @tc.desc      Verify error accepts multiple arguments without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHarLogger0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testHarLogger0411 begin');
      let caught: boolean = false;
      try {
        logger.error('e1', 'e2', 'e3');
      } catch (error) {
        caught = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse caught=${caught}`);
      expect(caught).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger=${typeof logger}, expected='object'`);
      expect(typeof logger).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue logger.error !== undefined=${logger.error !== undefined}`);
      expect(logger.error !== undefined).assertTrue();
      log('testHarLogger0411 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_HARLOG_0412
     * @tc.name      testHarLogger0412
     * @tc.desc      Verify repeated info and debug calls never throw.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHarLogger0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testHarLogger0412 begin');
      let caught: boolean = false;
      try {
        logger.info('probe');
        logger.debug('probe');
        logger.info('probe');
      } catch (error) {
        caught = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse caught=${caught}`);
      expect(caught).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.info=${typeof logger.info}`);
      expect(typeof logger.info).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.debug=${typeof logger.debug}`);
      expect(typeof logger.debug).assertEqual('function');
      log('testHarLogger0412 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_HARLOG_0413
     * @tc.name      testHarLogger0413
     * @tc.desc      Verify repeated warn and error calls never throw.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHarLogger0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testHarLogger0413 begin');
      let caught: boolean = false;
      try {
        logger.warn('probe');
        logger.error('probe');
        logger.warn('probe');
      } catch (error) {
        caught = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse caught=${caught}`);
      expect(caught).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.warn=${typeof logger.warn}`);
      expect(typeof logger.warn).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.error=${typeof logger.error}`);
      expect(typeof logger.error).assertEqual('function');
      log('testHarLogger0413 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_HARLOG_0414
     * @tc.name      testHarLogger0414
     * @tc.desc      Verify the singleton stays reusable across all four levels.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHarLogger0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testHarLogger0414 begin');
      let caught: boolean = false;
      try {
        logger.debug('cycle');
        logger.info('cycle');
        logger.warn('cycle');
        logger.error('cycle');
      } catch (error) {
        caught = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse caught=${caught}`);
      expect(caught).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger=${typeof logger}, expected='object'`);
      expect(typeof logger).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger=${typeof logger}, expected='object'`);
      expect(typeof logger).assertEqual('object');
      log('testHarLogger0414 end');
    })
  })
}

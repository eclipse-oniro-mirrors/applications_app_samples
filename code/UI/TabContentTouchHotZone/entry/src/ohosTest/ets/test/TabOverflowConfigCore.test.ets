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
import { CONFIGURATION } from '../../../main/ets/bridge/TabContentTouchHotZoneBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'TabOverflowConfigCore';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function tabOverflowConfigCoreTest(): void {
  describe('TabOverflowConfigCoreTest', () => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CONFIG_0001
     * @tc.name      testTabOverflowConfig0001
     * @tc.desc      Checks toast duration constant equals 300.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowConfig0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowConfig0001 begin');
      const value: number = CONFIGURATION['TABCONTENT_OVERFLOW_TOAST_DURATION'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=300`);
      expect(value).assertEqual(300);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testTabOverflowConfig0001 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CONFIG_0002
     * @tc.name      testTabOverflowConfig0002
     * @tc.desc      Checks interval number constant equals 30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowConfig0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowConfig0002 begin');
      const value: number = CONFIGURATION['TABCONTENT_OVERFLOW_INTERVAL_NUMBER'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=30`);
      expect(value).assertEqual(30);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testTabOverflowConfig0002 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CONFIG_0003
     * @tc.name      testTabOverflowConfig0003
     * @tc.desc      Checks z-index constant equals 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowConfig0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowConfig0003 begin');
      const value: number = CONFIGURATION['TABCONTENT_OVERFLOW_ZINDEX'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=2`);
      expect(value).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testTabOverflowConfig0003 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CONFIG_0004
     * @tc.name      testTabOverflowConfig0004
     * @tc.desc      Checks tabs animation duration constant equals 100.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowConfig0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowConfig0004 begin');
      const value: number = CONFIGURATION['TABCONTENT_OVERFLOW_TABS_DURATION'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=100`);
      expect(value).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testTabOverflowConfig0004 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CONFIG_0005
     * @tc.name      testTabOverflowConfig0005
     * @tc.desc      Checks opacity constant equals 0.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowConfig0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowConfig0005 begin');
      const value: number = CONFIGURATION['TABCONTENT_OVERFLOW_OPACITY'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=0.5`);
      expect(value).assertEqual(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testTabOverflowConfig0005 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CONFIG_0006
     * @tc.name      testTabOverflowConfig0006
     * @tc.desc      Checks text opacity constant equals 0.7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowConfig0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowConfig0006 begin');
      const value: number = CONFIGURATION['TABCONTENT_OVERFLOW_TEXT_OPACITY'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=0.7`);
      expect(value).assertEqual(0.7);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testTabOverflowConfig0006 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CONFIG_0007
     * @tc.name      testTabOverflowConfig0007
     * @tc.desc      Checks text translate constant equals 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowConfig0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowConfig0007 begin');
      const value: number = CONFIGURATION['TABCONTENT_OVERFLOW_TEXT_TRANSLATE'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=0`);
      expect(value).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testTabOverflowConfig0007 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CONFIG_0008
     * @tc.name      testTabOverflowConfig0008
     * @tc.desc      Checks text touch translate constant equals -15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowConfig0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowConfig0008 begin');
      const value: number = CONFIGURATION['TABCONTENT_OVERFLOW_TEXT_TOUCH_TRANSLATE'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=-15`);
      expect(value).assertEqual(-15);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testTabOverflowConfig0008 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CONFIG_0009
     * @tc.name      testTabOverflowConfig0009
     * @tc.desc      Checks text three margin top constant equals -7.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowConfig0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowConfig0009 begin');
      const value: number = CONFIGURATION['TABCONTENT_OVERFLOW_TEXT_THREE_MARGIN_TOP'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=-7.5`);
      expect(value).assertEqual(-7.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testTabOverflowConfig0009 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CONFIG_0010
     * @tc.name      testTabOverflowConfig0010
     * @tc.desc      Checks text three margin left constant equals -10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowConfig0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowConfig0010 begin');
      const value: number = CONFIGURATION['TABCONTENT_OVERFLOW_TEXT_THREE_MARGIN_LEFT'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=-10`);
      expect(value).assertEqual(-10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testTabOverflowConfig0010 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CONFIG_0011
     * @tc.name      testTabOverflowConfig0011
     * @tc.desc      Checks zero constant equals 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowConfig0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowConfig0011 begin');
      const value: number = CONFIGURATION['TABCONTENT_OVERFLOW_ZERO'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=0`);
      expect(value).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testTabOverflowConfig0011 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CONFIG_0012
     * @tc.name      testTabOverflowConfig0012
     * @tc.desc      Checks one constant equals 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowConfig0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowConfig0012 begin');
      const value: number = CONFIGURATION['TABCONTENT_OVERFLOW_ONE'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=1`);
      expect(value).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testTabOverflowConfig0012 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CONFIG_0013
     * @tc.name      testTabOverflowConfig0013
     * @tc.desc      Checks two constant equals 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowConfig0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowConfig0013 begin');
      const value: number = CONFIGURATION['TABCONTENT_OVERFLOW_TWO'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=2`);
      expect(value).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testTabOverflowConfig0013 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CONFIG_0014
     * @tc.name      testTabOverflowConfig0014
     * @tc.desc      Checks ten constant equals 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowConfig0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowConfig0014 begin');
      const value: number = CONFIGURATION['TABCONTENT_OVERFLOW_TEN'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=10`);
      expect(value).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testTabOverflowConfig0014 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CONFIG_0015
     * @tc.name      testTabOverflowConfig0015
     * @tc.desc      Checks animation duration constant equals 200.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowConfig0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowConfig0015 begin');
      const value: number = CONFIGURATION['TABCONTENT_OVERFLOW_DURATION'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=200`);
      expect(value).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testTabOverflowConfig0015 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CONFIG_0016
     * @tc.name      testTabOverflowConfig0016
     * @tc.desc      Checks head image border radius constant equals 22.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowConfig0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowConfig0016 begin');
      const value: number = CONFIGURATION['TABCONTENT_OVERFLOW_HEADIMAGE_BORDER_RADIUS'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=22.5`);
      expect(value).assertEqual(22.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testTabOverflowConfig0016 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CONFIG_0017
     * @tc.name      testTabOverflowConfig0017
     * @tc.desc      Checks head image margin left constant equals 7.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowConfig0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowConfig0017 begin');
      const value: number = CONFIGURATION['TABCONTENT_OVERFLOW_HEADIMAGE_MARGIN_LEFT'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=7.5`);
      expect(value).assertEqual(7.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testTabOverflowConfig0017 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CONFIG_0018
     * @tc.name      testTabOverflowConfig0018
     * @tc.desc      Checks max line constant equals 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowConfig0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowConfig0018 begin');
      const value: number = CONFIGURATION['TABCONTENT_OVERFLOW_MAXLINE'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=2`);
      expect(value).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testTabOverflowConfig0018 end');
    })
  })
}

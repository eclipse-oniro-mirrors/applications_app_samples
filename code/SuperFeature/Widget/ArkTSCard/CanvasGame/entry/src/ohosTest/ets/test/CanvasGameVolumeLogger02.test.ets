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
import { hilog } from '@kit.PerformanceAnalysisKit';
import logger from '../../../main/ets/model/Logger';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function canvasGameVolumeLogger02Test() {
  describe('CanvasGameVolumeLogger02Test', () => {

    /**
     * @tc.name   testCanvasVolLog020001
     * @tc.number SUB_CANVAS_VOL_LOG_02_0001
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog020001 begin');
      const s: string = 'v'.repeat(1700);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(1700));
        expect(s.length).assertEqual(1700);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog020001 end');
    })

    /**
     * @tc.name   testCanvasVolLog020002
     * @tc.number SUB_CANVAS_VOL_LOG_02_0002
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog020002 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.log('a','b','c') === undefined));
      expect(logger.log('a','b','c') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.debug('d','e') === undefined));
        expect(logger.debug('d','e') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.warn('f') === undefined));
        expect(logger.warn('f') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog020002 end');
    })

    /**
     * @tc.name   testCanvasVolLog020003
     * @tc.number SUB_CANVAS_VOL_LOG_02_0003
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog020003 begin');
      const s: string = 'v'.repeat(1900);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(1900));
        expect(s.length).assertEqual(1900);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog020003 end');
    })

    /**
     * @tc.name   testCanvasVolLog020004
     * @tc.number SUB_CANVAS_VOL_LOG_02_0004
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog020004 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.log('a','b','c') === undefined));
      expect(logger.log('a','b','c') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.debug('d','e') === undefined));
        expect(logger.debug('d','e') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.warn('f') === undefined));
        expect(logger.warn('f') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog020004 end');
    })

    /**
     * @tc.name   testCanvasVolLog020005
     * @tc.number SUB_CANVAS_VOL_LOG_02_0005
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog020005 begin');
      const s: string = 'v'.repeat(2100);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(2100));
        expect(s.length).assertEqual(2100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog020005 end');
    })

    /**
     * @tc.name   testCanvasVolLog020006
     * @tc.number SUB_CANVAS_VOL_LOG_02_0006
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog020006 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.log('a','b','c') === undefined));
      expect(logger.log('a','b','c') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.debug('d','e') === undefined));
        expect(logger.debug('d','e') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.warn('f') === undefined));
        expect(logger.warn('f') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog020006 end');
    })

    /**
     * @tc.name   testCanvasVolLog020007
     * @tc.number SUB_CANVAS_VOL_LOG_02_0007
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog020007 begin');
      const s: string = 'v'.repeat(2300);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(2300));
        expect(s.length).assertEqual(2300);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog020007 end');
    })

    /**
     * @tc.name   testCanvasVolLog020008
     * @tc.number SUB_CANVAS_VOL_LOG_02_0008
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog020008 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.log('a','b','c') === undefined));
      expect(logger.log('a','b','c') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.debug('d','e') === undefined));
        expect(logger.debug('d','e') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.warn('f') === undefined));
        expect(logger.warn('f') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog020008 end');
    })

    /**
     * @tc.name   testCanvasVolLog020009
     * @tc.number SUB_CANVAS_VOL_LOG_02_0009
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog020009 begin');
      const s: string = 'v'.repeat(2500);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(2500));
        expect(s.length).assertEqual(2500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog020009 end');
    })

    /**
     * @tc.name   testCanvasVolLog020010
     * @tc.number SUB_CANVAS_VOL_LOG_02_0010
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog020010 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.log('a','b','c') === undefined));
      expect(logger.log('a','b','c') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.debug('d','e') === undefined));
        expect(logger.debug('d','e') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.warn('f') === undefined));
        expect(logger.warn('f') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog020010 end');
    })

    /**
     * @tc.name   testCanvasVolLog020011
     * @tc.number SUB_CANVAS_VOL_LOG_02_0011
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog020011 begin');
      const s: string = 'v'.repeat(2700);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(2700));
        expect(s.length).assertEqual(2700);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog020011 end');
    })

    /**
     * @tc.name   testCanvasVolLog020012
     * @tc.number SUB_CANVAS_VOL_LOG_02_0012
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog020012 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.log('a','b','c') === undefined));
      expect(logger.log('a','b','c') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.debug('d','e') === undefined));
        expect(logger.debug('d','e') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.warn('f') === undefined));
        expect(logger.warn('f') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog020012 end');
    })

    /**
     * @tc.name   testCanvasVolLog020013
     * @tc.number SUB_CANVAS_VOL_LOG_02_0013
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog020013 begin');
      const s: string = 'v'.repeat(2900);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(2900));
        expect(s.length).assertEqual(2900);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog020013 end');
    })

    /**
     * @tc.name   testCanvasVolLog020014
     * @tc.number SUB_CANVAS_VOL_LOG_02_0014
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog020014 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.log('a','b','c') === undefined));
      expect(logger.log('a','b','c') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.debug('d','e') === undefined));
        expect(logger.debug('d','e') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.warn('f') === undefined));
        expect(logger.warn('f') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog020014 end');
    })

    /**
     * @tc.name   testCanvasVolLog020015
     * @tc.number SUB_CANVAS_VOL_LOG_02_0015
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog020015 begin');
      const s: string = 'v'.repeat(3100);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(3100));
        expect(s.length).assertEqual(3100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog020015 end');
    })

    /**
     * @tc.name   testCanvasVolLog020016
     * @tc.number SUB_CANVAS_VOL_LOG_02_0016
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog020016 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.log('a','b','c') === undefined));
      expect(logger.log('a','b','c') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.debug('d','e') === undefined));
        expect(logger.debug('d','e') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.warn('f') === undefined));
        expect(logger.warn('f') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog020016 end');
    })
  })
}

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

export default function canvasGameVolumeLogger03Test() {
  describe('CanvasGameVolumeLogger03Test', () => {

    /**
     * @tc.name   testCanvasVolLog030001
     * @tc.number SUB_CANVAS_VOL_LOG_03_0001
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog030001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog030001 begin');
      const s: string = 'v'.repeat(3300);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(3300));
        expect(s.length).assertEqual(3300);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog030001 end');
    })

    /**
     * @tc.name   testCanvasVolLog030002
     * @tc.number SUB_CANVAS_VOL_LOG_03_0002
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog030002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog030002 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.log('a','b','c') === undefined));
      expect(logger.log('a','b','c') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.debug('d','e') === undefined));
        expect(logger.debug('d','e') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.warn('f') === undefined));
        expect(logger.warn('f') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog030002 end');
    })

    /**
     * @tc.name   testCanvasVolLog030003
     * @tc.number SUB_CANVAS_VOL_LOG_03_0003
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog030003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog030003 begin');
      const s: string = 'v'.repeat(3500);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(3500));
        expect(s.length).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog030003 end');
    })

    /**
     * @tc.name   testCanvasVolLog030004
     * @tc.number SUB_CANVAS_VOL_LOG_03_0004
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog030004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog030004 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.log('a','b','c') === undefined));
      expect(logger.log('a','b','c') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.debug('d','e') === undefined));
        expect(logger.debug('d','e') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.warn('f') === undefined));
        expect(logger.warn('f') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog030004 end');
    })

    /**
     * @tc.name   testCanvasVolLog030005
     * @tc.number SUB_CANVAS_VOL_LOG_03_0005
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog030005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog030005 begin');
      const s: string = 'v'.repeat(3700);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(3700));
        expect(s.length).assertEqual(3700);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog030005 end');
    })

    /**
     * @tc.name   testCanvasVolLog030006
     * @tc.number SUB_CANVAS_VOL_LOG_03_0006
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog030006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog030006 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.log('a','b','c') === undefined));
      expect(logger.log('a','b','c') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.debug('d','e') === undefined));
        expect(logger.debug('d','e') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.warn('f') === undefined));
        expect(logger.warn('f') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog030006 end');
    })

    /**
     * @tc.name   testCanvasVolLog030007
     * @tc.number SUB_CANVAS_VOL_LOG_03_0007
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog030007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog030007 begin');
      const s: string = 'v'.repeat(3900);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(3900));
        expect(s.length).assertEqual(3900);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog030007 end');
    })

    /**
     * @tc.name   testCanvasVolLog030008
     * @tc.number SUB_CANVAS_VOL_LOG_03_0008
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog030008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog030008 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.log('a','b','c') === undefined));
      expect(logger.log('a','b','c') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.debug('d','e') === undefined));
        expect(logger.debug('d','e') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.warn('f') === undefined));
        expect(logger.warn('f') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog030008 end');
    })

    /**
     * @tc.name   testCanvasVolLog030009
     * @tc.number SUB_CANVAS_VOL_LOG_03_0009
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog030009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog030009 begin');
      const s: string = 'v'.repeat(4100);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(4100));
        expect(s.length).assertEqual(4100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog030009 end');
    })

    /**
     * @tc.name   testCanvasVolLog030010
     * @tc.number SUB_CANVAS_VOL_LOG_03_0010
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog030010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog030010 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.log('a','b','c') === undefined));
      expect(logger.log('a','b','c') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.debug('d','e') === undefined));
        expect(logger.debug('d','e') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.warn('f') === undefined));
        expect(logger.warn('f') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog030010 end');
    })

    /**
     * @tc.name   testCanvasVolLog030011
     * @tc.number SUB_CANVAS_VOL_LOG_03_0011
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog030011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog030011 begin');
      const s: string = 'v'.repeat(4300);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(4300));
        expect(s.length).assertEqual(4300);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog030011 end');
    })

    /**
     * @tc.name   testCanvasVolLog030012
     * @tc.number SUB_CANVAS_VOL_LOG_03_0012
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog030012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog030012 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.log('a','b','c') === undefined));
      expect(logger.log('a','b','c') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.debug('d','e') === undefined));
        expect(logger.debug('d','e') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.warn('f') === undefined));
        expect(logger.warn('f') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog030012 end');
    })

    /**
     * @tc.name   testCanvasVolLog030013
     * @tc.number SUB_CANVAS_VOL_LOG_03_0013
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog030013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog030013 begin');
      const s: string = 'v'.repeat(4500);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(4500));
        expect(s.length).assertEqual(4500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog030013 end');
    })

    /**
     * @tc.name   testCanvasVolLog030014
     * @tc.number SUB_CANVAS_VOL_LOG_03_0014
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog030014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog030014 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.log('a','b','c') === undefined));
      expect(logger.log('a','b','c') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.debug('d','e') === undefined));
        expect(logger.debug('d','e') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.warn('f') === undefined));
        expect(logger.warn('f') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog030014 end');
    })

    /**
     * @tc.name   testCanvasVolLog030015
     * @tc.number SUB_CANVAS_VOL_LOG_03_0015
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog030015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog030015 begin');
      const s: string = 'v'.repeat(4700);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(4700));
        expect(s.length).assertEqual(4700);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog030015 end');
    })

    /**
     * @tc.name   testCanvasVolLog030016
     * @tc.number SUB_CANVAS_VOL_LOG_03_0016
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog030016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog030016 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.log('a','b','c') === undefined));
      expect(logger.log('a','b','c') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.debug('d','e') === undefined));
        expect(logger.debug('d','e') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.warn('f') === undefined));
        expect(logger.warn('f') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog030016 end');
    })
  })
}

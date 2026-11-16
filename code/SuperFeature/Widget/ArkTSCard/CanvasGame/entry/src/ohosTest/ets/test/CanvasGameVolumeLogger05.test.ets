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

export default function canvasGameVolumeLogger05Test() {
  describe('CanvasGameVolumeLogger05Test', () => {

    /**
     * @tc.name   testCanvasVolLog050001
     * @tc.number SUB_CANVAS_VOL_LOG_05_0001
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog050001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog050001 begin');
      const s: string = 'v'.repeat(6500);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(6500);');
        expect(s.length).assertEqual(6500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog050001 end');
    })

    /**
     * @tc.name   testCanvasVolLog050002
     * @tc.number SUB_CANVAS_VOL_LOG_05_0002
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog050002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog050002 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\') === undefined).assertTrue();');
      expect(logger.log('a','b','c') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.debug(\'d\',\'e\') === undefined).assertTrue();');
        expect(logger.debug('d','e') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'f\') === undefined).assertTrue();');
        expect(logger.warn('f') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog050002 end');
    })

    /**
     * @tc.name   testCanvasVolLog050003
     * @tc.number SUB_CANVAS_VOL_LOG_05_0003
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog050003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog050003 begin');
      const s: string = 'v'.repeat(6700);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(6700);');
        expect(s.length).assertEqual(6700);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog050003 end');
    })

    /**
     * @tc.name   testCanvasVolLog050004
     * @tc.number SUB_CANVAS_VOL_LOG_05_0004
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog050004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog050004 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\') === undefined).assertTrue();');
      expect(logger.log('a','b','c') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.debug(\'d\',\'e\') === undefined).assertTrue();');
        expect(logger.debug('d','e') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'f\') === undefined).assertTrue();');
        expect(logger.warn('f') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog050004 end');
    })

    /**
     * @tc.name   testCanvasVolLog050005
     * @tc.number SUB_CANVAS_VOL_LOG_05_0005
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog050005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog050005 begin');
      const s: string = 'v'.repeat(6900);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(6900);');
        expect(s.length).assertEqual(6900);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog050005 end');
    })

    /**
     * @tc.name   testCanvasVolLog050006
     * @tc.number SUB_CANVAS_VOL_LOG_05_0006
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog050006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog050006 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\') === undefined).assertTrue();');
      expect(logger.log('a','b','c') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.debug(\'d\',\'e\') === undefined).assertTrue();');
        expect(logger.debug('d','e') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'f\') === undefined).assertTrue();');
        expect(logger.warn('f') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog050006 end');
    })

    /**
     * @tc.name   testCanvasVolLog050007
     * @tc.number SUB_CANVAS_VOL_LOG_05_0007
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog050007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog050007 begin');
      const s: string = 'v'.repeat(7100);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(7100);');
        expect(s.length).assertEqual(7100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog050007 end');
    })

    /**
     * @tc.name   testCanvasVolLog050008
     * @tc.number SUB_CANVAS_VOL_LOG_05_0008
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog050008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog050008 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\') === undefined).assertTrue();');
      expect(logger.log('a','b','c') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.debug(\'d\',\'e\') === undefined).assertTrue();');
        expect(logger.debug('d','e') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'f\') === undefined).assertTrue();');
        expect(logger.warn('f') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog050008 end');
    })

    /**
     * @tc.name   testCanvasVolLog050009
     * @tc.number SUB_CANVAS_VOL_LOG_05_0009
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog050009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog050009 begin');
      const s: string = 'v'.repeat(7300);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(7300);');
        expect(s.length).assertEqual(7300);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog050009 end');
    })

    /**
     * @tc.name   testCanvasVolLog050010
     * @tc.number SUB_CANVAS_VOL_LOG_05_0010
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog050010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog050010 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\') === undefined).assertTrue();');
      expect(logger.log('a','b','c') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.debug(\'d\',\'e\') === undefined).assertTrue();');
        expect(logger.debug('d','e') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'f\') === undefined).assertTrue();');
        expect(logger.warn('f') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog050010 end');
    })

    /**
     * @tc.name   testCanvasVolLog050011
     * @tc.number SUB_CANVAS_VOL_LOG_05_0011
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog050011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog050011 begin');
      const s: string = 'v'.repeat(7500);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(7500);');
        expect(s.length).assertEqual(7500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog050011 end');
    })

    /**
     * @tc.name   testCanvasVolLog050012
     * @tc.number SUB_CANVAS_VOL_LOG_05_0012
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog050012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog050012 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\') === undefined).assertTrue();');
      expect(logger.log('a','b','c') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.debug(\'d\',\'e\') === undefined).assertTrue();');
        expect(logger.debug('d','e') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'f\') === undefined).assertTrue();');
        expect(logger.warn('f') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog050012 end');
    })

    /**
     * @tc.name   testCanvasVolLog050013
     * @tc.number SUB_CANVAS_VOL_LOG_05_0013
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog050013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog050013 begin');
      const s: string = 'v'.repeat(7700);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(7700);');
        expect(s.length).assertEqual(7700);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog050013 end');
    })

    /**
     * @tc.name   testCanvasVolLog050014
     * @tc.number SUB_CANVAS_VOL_LOG_05_0014
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog050014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog050014 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\') === undefined).assertTrue();');
      expect(logger.log('a','b','c') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.debug(\'d\',\'e\') === undefined).assertTrue();');
        expect(logger.debug('d','e') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'f\') === undefined).assertTrue();');
        expect(logger.warn('f') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog050014 end');
    })

    /**
     * @tc.name   testCanvasVolLog050015
     * @tc.number SUB_CANVAS_VOL_LOG_05_0015
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog050015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog050015 begin');
      const s: string = 'v'.repeat(7900);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(7900);');
        expect(s.length).assertEqual(7900);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog050015 end');
    })

    /**
     * @tc.name   testCanvasVolLog050016
     * @tc.number SUB_CANVAS_VOL_LOG_05_0016
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog050016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog050016 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\') === undefined).assertTrue();');
      expect(logger.log('a','b','c') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.debug(\'d\',\'e\') === undefined).assertTrue();');
        expect(logger.debug('d','e') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'f\') === undefined).assertTrue();');
        expect(logger.warn('f') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolLog050016 end');
    })
  })
}

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

export default function canvasGameWaveLogger05Test() {
  describe('CanvasGameWaveLogger05Test', () => {

    /**
     * @tc.name   testCanvasWaveLog050001
     * @tc.number SUB_CANVAS_WAVE_LOG_05_0001
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog050001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog050001 begin');
      const s: string = 'l'.repeat(4160);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(4160);');
        expect(s.length).assertEqual(4160);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog050001 end');
    })

    /**
     * @tc.name   testCanvasWaveLog050002
     * @tc.number SUB_CANVAS_WAVE_LOG_05_0002
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog050002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog050002 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\',\'d\') === undefined).assertTrue();');
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'x\',\'y\') === undefined).assertTrue();');
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.error(\'e\') === undefined).assertTrue();');
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog050002 end');
    })

    /**
     * @tc.name   testCanvasWaveLog050003
     * @tc.number SUB_CANVAS_WAVE_LOG_05_0003
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog050003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog050003 begin');
      const s: string = 'l'.repeat(4288);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(4288);');
        expect(s.length).assertEqual(4288);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog050003 end');
    })

    /**
     * @tc.name   testCanvasWaveLog050004
     * @tc.number SUB_CANVAS_WAVE_LOG_05_0004
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog050004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog050004 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\',\'d\') === undefined).assertTrue();');
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'x\',\'y\') === undefined).assertTrue();');
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.error(\'e\') === undefined).assertTrue();');
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog050004 end');
    })

    /**
     * @tc.name   testCanvasWaveLog050005
     * @tc.number SUB_CANVAS_WAVE_LOG_05_0005
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog050005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog050005 begin');
      const s: string = 'l'.repeat(4416);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(4416);');
        expect(s.length).assertEqual(4416);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog050005 end');
    })

    /**
     * @tc.name   testCanvasWaveLog050006
     * @tc.number SUB_CANVAS_WAVE_LOG_05_0006
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog050006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog050006 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\',\'d\') === undefined).assertTrue();');
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'x\',\'y\') === undefined).assertTrue();');
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.error(\'e\') === undefined).assertTrue();');
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog050006 end');
    })

    /**
     * @tc.name   testCanvasWaveLog050007
     * @tc.number SUB_CANVAS_WAVE_LOG_05_0007
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog050007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog050007 begin');
      const s: string = 'l'.repeat(4544);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(4544);');
        expect(s.length).assertEqual(4544);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog050007 end');
    })

    /**
     * @tc.name   testCanvasWaveLog050008
     * @tc.number SUB_CANVAS_WAVE_LOG_05_0008
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog050008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog050008 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\',\'d\') === undefined).assertTrue();');
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'x\',\'y\') === undefined).assertTrue();');
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.error(\'e\') === undefined).assertTrue();');
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog050008 end');
    })

    /**
     * @tc.name   testCanvasWaveLog050009
     * @tc.number SUB_CANVAS_WAVE_LOG_05_0009
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog050009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog050009 begin');
      const s: string = 'l'.repeat(4672);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(4672);');
        expect(s.length).assertEqual(4672);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog050009 end');
    })

    /**
     * @tc.name   testCanvasWaveLog050010
     * @tc.number SUB_CANVAS_WAVE_LOG_05_0010
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog050010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog050010 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\',\'d\') === undefined).assertTrue();');
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'x\',\'y\') === undefined).assertTrue();');
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.error(\'e\') === undefined).assertTrue();');
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog050010 end');
    })

    /**
     * @tc.name   testCanvasWaveLog050011
     * @tc.number SUB_CANVAS_WAVE_LOG_05_0011
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog050011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog050011 begin');
      const s: string = 'l'.repeat(4800);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(4800);');
        expect(s.length).assertEqual(4800);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog050011 end');
    })

    /**
     * @tc.name   testCanvasWaveLog050012
     * @tc.number SUB_CANVAS_WAVE_LOG_05_0012
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog050012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog050012 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\',\'d\') === undefined).assertTrue();');
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'x\',\'y\') === undefined).assertTrue();');
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.error(\'e\') === undefined).assertTrue();');
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog050012 end');
    })

    /**
     * @tc.name   testCanvasWaveLog050013
     * @tc.number SUB_CANVAS_WAVE_LOG_05_0013
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog050013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog050013 begin');
      const s: string = 'l'.repeat(4928);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(4928);');
        expect(s.length).assertEqual(4928);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog050013 end');
    })

    /**
     * @tc.name   testCanvasWaveLog050014
     * @tc.number SUB_CANVAS_WAVE_LOG_05_0014
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog050014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog050014 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\',\'d\') === undefined).assertTrue();');
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'x\',\'y\') === undefined).assertTrue();');
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.error(\'e\') === undefined).assertTrue();');
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog050014 end');
    })

    /**
     * @tc.name   testCanvasWaveLog050015
     * @tc.number SUB_CANVAS_WAVE_LOG_05_0015
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog050015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog050015 begin');
      const s: string = 'l'.repeat(5056);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(5056);');
        expect(s.length).assertEqual(5056);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog050015 end');
    })

    /**
     * @tc.name   testCanvasWaveLog050016
     * @tc.number SUB_CANVAS_WAVE_LOG_05_0016
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog050016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog050016 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\',\'d\') === undefined).assertTrue();');
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'x\',\'y\') === undefined).assertTrue();');
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.error(\'e\') === undefined).assertTrue();');
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog050016 end');
    })
  })
}

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

export default function canvasGameWaveLogger01Test() {
  describe('CanvasGameWaveLogger01Test', () => {

    /**
     * @tc.name   testCanvasWaveLog010001
     * @tc.number SUB_CANVAS_WAVE_LOG_01_0001
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog010001 begin');
      const s: string = 'l'.repeat(64);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(64);');
        expect(s.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog010001 end');
    })

    /**
     * @tc.name   testCanvasWaveLog010002
     * @tc.number SUB_CANVAS_WAVE_LOG_01_0002
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog010002 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\',\'d\') === undefined).assertTrue();');
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'x\',\'y\') === undefined).assertTrue();');
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.error(\'e\') === undefined).assertTrue();');
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog010002 end');
    })

    /**
     * @tc.name   testCanvasWaveLog010003
     * @tc.number SUB_CANVAS_WAVE_LOG_01_0003
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog010003 begin');
      const s: string = 'l'.repeat(192);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(192);');
        expect(s.length).assertEqual(192);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog010003 end');
    })

    /**
     * @tc.name   testCanvasWaveLog010004
     * @tc.number SUB_CANVAS_WAVE_LOG_01_0004
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog010004 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\',\'d\') === undefined).assertTrue();');
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'x\',\'y\') === undefined).assertTrue();');
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.error(\'e\') === undefined).assertTrue();');
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog010004 end');
    })

    /**
     * @tc.name   testCanvasWaveLog010005
     * @tc.number SUB_CANVAS_WAVE_LOG_01_0005
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog010005 begin');
      const s: string = 'l'.repeat(320);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(320);');
        expect(s.length).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog010005 end');
    })

    /**
     * @tc.name   testCanvasWaveLog010006
     * @tc.number SUB_CANVAS_WAVE_LOG_01_0006
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog010006 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\',\'d\') === undefined).assertTrue();');
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'x\',\'y\') === undefined).assertTrue();');
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.error(\'e\') === undefined).assertTrue();');
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog010006 end');
    })

    /**
     * @tc.name   testCanvasWaveLog010007
     * @tc.number SUB_CANVAS_WAVE_LOG_01_0007
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog010007 begin');
      const s: string = 'l'.repeat(448);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(448);');
        expect(s.length).assertEqual(448);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog010007 end');
    })

    /**
     * @tc.name   testCanvasWaveLog010008
     * @tc.number SUB_CANVAS_WAVE_LOG_01_0008
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog010008 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\',\'d\') === undefined).assertTrue();');
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'x\',\'y\') === undefined).assertTrue();');
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.error(\'e\') === undefined).assertTrue();');
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog010008 end');
    })

    /**
     * @tc.name   testCanvasWaveLog010009
     * @tc.number SUB_CANVAS_WAVE_LOG_01_0009
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog010009 begin');
      const s: string = 'l'.repeat(576);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(576);');
        expect(s.length).assertEqual(576);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog010009 end');
    })

    /**
     * @tc.name   testCanvasWaveLog010010
     * @tc.number SUB_CANVAS_WAVE_LOG_01_0010
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog010010 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\',\'d\') === undefined).assertTrue();');
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'x\',\'y\') === undefined).assertTrue();');
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.error(\'e\') === undefined).assertTrue();');
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog010010 end');
    })

    /**
     * @tc.name   testCanvasWaveLog010011
     * @tc.number SUB_CANVAS_WAVE_LOG_01_0011
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog010011 begin');
      const s: string = 'l'.repeat(704);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(704);');
        expect(s.length).assertEqual(704);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog010011 end');
    })

    /**
     * @tc.name   testCanvasWaveLog010012
     * @tc.number SUB_CANVAS_WAVE_LOG_01_0012
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog010012 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\',\'d\') === undefined).assertTrue();');
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'x\',\'y\') === undefined).assertTrue();');
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.error(\'e\') === undefined).assertTrue();');
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog010012 end');
    })

    /**
     * @tc.name   testCanvasWaveLog010013
     * @tc.number SUB_CANVAS_WAVE_LOG_01_0013
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog010013 begin');
      const s: string = 'l'.repeat(832);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(832);');
        expect(s.length).assertEqual(832);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog010013 end');
    })

    /**
     * @tc.name   testCanvasWaveLog010014
     * @tc.number SUB_CANVAS_WAVE_LOG_01_0014
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog010014 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\',\'d\') === undefined).assertTrue();');
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'x\',\'y\') === undefined).assertTrue();');
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.error(\'e\') === undefined).assertTrue();');
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog010014 end');
    })

    /**
     * @tc.name   testCanvasWaveLog010015
     * @tc.number SUB_CANVAS_WAVE_LOG_01_0015
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog010015 begin');
      const s: string = 'l'.repeat(960);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(960);');
        expect(s.length).assertEqual(960);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog010015 end');
    })

    /**
     * @tc.name   testCanvasWaveLog010016
     * @tc.number SUB_CANVAS_WAVE_LOG_01_0016
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog010016 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\',\'d\') === undefined).assertTrue();');
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'x\',\'y\') === undefined).assertTrue();');
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.error(\'e\') === undefined).assertTrue();');
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog010016 end');
    })
  })
}

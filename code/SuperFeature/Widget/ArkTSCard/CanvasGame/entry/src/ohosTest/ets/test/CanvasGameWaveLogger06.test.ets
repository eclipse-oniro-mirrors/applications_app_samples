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

export default function canvasGameWaveLogger06Test() {
  describe('CanvasGameWaveLogger06Test', () => {

    /**
     * @tc.name   testCanvasWaveLog060001
     * @tc.number SUB_CANVAS_WAVE_LOG_06_0001
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog060001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog060001 begin');
      const s: string = 'l'.repeat(5184);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(5184);');
        expect(s.length).assertEqual(5184);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog060001 end');
    })

    /**
     * @tc.name   testCanvasWaveLog060002
     * @tc.number SUB_CANVAS_WAVE_LOG_06_0002
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog060002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog060002 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\',\'d\') === undefined).assertTrue();');
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'x\',\'y\') === undefined).assertTrue();');
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.error(\'e\') === undefined).assertTrue();');
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog060002 end');
    })

    /**
     * @tc.name   testCanvasWaveLog060003
     * @tc.number SUB_CANVAS_WAVE_LOG_06_0003
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog060003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog060003 begin');
      const s: string = 'l'.repeat(5312);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(5312);');
        expect(s.length).assertEqual(5312);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog060003 end');
    })

    /**
     * @tc.name   testCanvasWaveLog060004
     * @tc.number SUB_CANVAS_WAVE_LOG_06_0004
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog060004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog060004 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\',\'d\') === undefined).assertTrue();');
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'x\',\'y\') === undefined).assertTrue();');
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.error(\'e\') === undefined).assertTrue();');
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog060004 end');
    })

    /**
     * @tc.name   testCanvasWaveLog060005
     * @tc.number SUB_CANVAS_WAVE_LOG_06_0005
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog060005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog060005 begin');
      const s: string = 'l'.repeat(5440);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(5440);');
        expect(s.length).assertEqual(5440);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog060005 end');
    })

    /**
     * @tc.name   testCanvasWaveLog060006
     * @tc.number SUB_CANVAS_WAVE_LOG_06_0006
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog060006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog060006 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\',\'d\') === undefined).assertTrue();');
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'x\',\'y\') === undefined).assertTrue();');
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.error(\'e\') === undefined).assertTrue();');
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog060006 end');
    })

    /**
     * @tc.name   testCanvasWaveLog060007
     * @tc.number SUB_CANVAS_WAVE_LOG_06_0007
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog060007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog060007 begin');
      const s: string = 'l'.repeat(5568);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(5568);');
        expect(s.length).assertEqual(5568);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog060007 end');
    })

    /**
     * @tc.name   testCanvasWaveLog060008
     * @tc.number SUB_CANVAS_WAVE_LOG_06_0008
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog060008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog060008 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\',\'d\') === undefined).assertTrue();');
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'x\',\'y\') === undefined).assertTrue();');
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.error(\'e\') === undefined).assertTrue();');
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog060008 end');
    })

    /**
     * @tc.name   testCanvasWaveLog060009
     * @tc.number SUB_CANVAS_WAVE_LOG_06_0009
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog060009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog060009 begin');
      const s: string = 'l'.repeat(5696);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(5696);');
        expect(s.length).assertEqual(5696);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog060009 end');
    })

    /**
     * @tc.name   testCanvasWaveLog060010
     * @tc.number SUB_CANVAS_WAVE_LOG_06_0010
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog060010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog060010 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\',\'d\') === undefined).assertTrue();');
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'x\',\'y\') === undefined).assertTrue();');
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.error(\'e\') === undefined).assertTrue();');
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog060010 end');
    })

    /**
     * @tc.name   testCanvasWaveLog060011
     * @tc.number SUB_CANVAS_WAVE_LOG_06_0011
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog060011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog060011 begin');
      const s: string = 'l'.repeat(5824);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(5824);');
        expect(s.length).assertEqual(5824);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog060011 end');
    })

    /**
     * @tc.name   testCanvasWaveLog060012
     * @tc.number SUB_CANVAS_WAVE_LOG_06_0012
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog060012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog060012 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\',\'d\') === undefined).assertTrue();');
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'x\',\'y\') === undefined).assertTrue();');
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.error(\'e\') === undefined).assertTrue();');
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog060012 end');
    })

    /**
     * @tc.name   testCanvasWaveLog060013
     * @tc.number SUB_CANVAS_WAVE_LOG_06_0013
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog060013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog060013 begin');
      const s: string = 'l'.repeat(5952);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(5952);');
        expect(s.length).assertEqual(5952);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog060013 end');
    })

    /**
     * @tc.name   testCanvasWaveLog060014
     * @tc.number SUB_CANVAS_WAVE_LOG_06_0014
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog060014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog060014 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\',\'d\') === undefined).assertTrue();');
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'x\',\'y\') === undefined).assertTrue();');
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.error(\'e\') === undefined).assertTrue();');
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog060014 end');
    })

    /**
     * @tc.name   testCanvasWaveLog060015
     * @tc.number SUB_CANVAS_WAVE_LOG_06_0015
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog060015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog060015 begin');
      const s: string = 'l'.repeat(6080);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(6080);');
        expect(s.length).assertEqual(6080);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog060015 end');
    })

    /**
     * @tc.name   testCanvasWaveLog060016
     * @tc.number SUB_CANVAS_WAVE_LOG_06_0016
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog060016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog060016 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\',\'d\') === undefined).assertTrue();');
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'x\',\'y\') === undefined).assertTrue();');
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.error(\'e\') === undefined).assertTrue();');
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog060016 end');
    })
  })
}

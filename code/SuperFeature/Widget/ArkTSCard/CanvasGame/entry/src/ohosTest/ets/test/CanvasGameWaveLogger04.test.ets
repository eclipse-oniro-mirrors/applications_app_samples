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

export default function canvasGameWaveLogger04Test() {
  describe('CanvasGameWaveLogger04Test', () => {

    /**
     * @tc.name   testCanvasWaveLog040001
     * @tc.number SUB_CANVAS_WAVE_LOG_04_0001
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog040001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog040001 begin');
      const s: string = 'l'.repeat(3136);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(3136);');
        expect(s.length).assertEqual(3136);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog040001 end');
    })

    /**
     * @tc.name   testCanvasWaveLog040002
     * @tc.number SUB_CANVAS_WAVE_LOG_04_0002
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog040002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog040002 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\',\'d\') === undefined).assertTrue();');
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'x\',\'y\') === undefined).assertTrue();');
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.error(\'e\') === undefined).assertTrue();');
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog040002 end');
    })

    /**
     * @tc.name   testCanvasWaveLog040003
     * @tc.number SUB_CANVAS_WAVE_LOG_04_0003
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog040003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog040003 begin');
      const s: string = 'l'.repeat(3264);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(3264);');
        expect(s.length).assertEqual(3264);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog040003 end');
    })

    /**
     * @tc.name   testCanvasWaveLog040004
     * @tc.number SUB_CANVAS_WAVE_LOG_04_0004
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog040004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog040004 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\',\'d\') === undefined).assertTrue();');
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'x\',\'y\') === undefined).assertTrue();');
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.error(\'e\') === undefined).assertTrue();');
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog040004 end');
    })

    /**
     * @tc.name   testCanvasWaveLog040005
     * @tc.number SUB_CANVAS_WAVE_LOG_04_0005
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog040005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog040005 begin');
      const s: string = 'l'.repeat(3392);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(3392);');
        expect(s.length).assertEqual(3392);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog040005 end');
    })

    /**
     * @tc.name   testCanvasWaveLog040006
     * @tc.number SUB_CANVAS_WAVE_LOG_04_0006
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog040006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog040006 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\',\'d\') === undefined).assertTrue();');
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'x\',\'y\') === undefined).assertTrue();');
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.error(\'e\') === undefined).assertTrue();');
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog040006 end');
    })

    /**
     * @tc.name   testCanvasWaveLog040007
     * @tc.number SUB_CANVAS_WAVE_LOG_04_0007
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog040007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog040007 begin');
      const s: string = 'l'.repeat(3520);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(3520);');
        expect(s.length).assertEqual(3520);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog040007 end');
    })

    /**
     * @tc.name   testCanvasWaveLog040008
     * @tc.number SUB_CANVAS_WAVE_LOG_04_0008
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog040008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog040008 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\',\'d\') === undefined).assertTrue();');
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'x\',\'y\') === undefined).assertTrue();');
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.error(\'e\') === undefined).assertTrue();');
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog040008 end');
    })

    /**
     * @tc.name   testCanvasWaveLog040009
     * @tc.number SUB_CANVAS_WAVE_LOG_04_0009
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog040009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog040009 begin');
      const s: string = 'l'.repeat(3648);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(3648);');
        expect(s.length).assertEqual(3648);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog040009 end');
    })

    /**
     * @tc.name   testCanvasWaveLog040010
     * @tc.number SUB_CANVAS_WAVE_LOG_04_0010
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog040010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog040010 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\',\'d\') === undefined).assertTrue();');
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'x\',\'y\') === undefined).assertTrue();');
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.error(\'e\') === undefined).assertTrue();');
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog040010 end');
    })

    /**
     * @tc.name   testCanvasWaveLog040011
     * @tc.number SUB_CANVAS_WAVE_LOG_04_0011
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog040011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog040011 begin');
      const s: string = 'l'.repeat(3776);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(3776);');
        expect(s.length).assertEqual(3776);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog040011 end');
    })

    /**
     * @tc.name   testCanvasWaveLog040012
     * @tc.number SUB_CANVAS_WAVE_LOG_04_0012
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog040012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog040012 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\',\'d\') === undefined).assertTrue();');
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'x\',\'y\') === undefined).assertTrue();');
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.error(\'e\') === undefined).assertTrue();');
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog040012 end');
    })

    /**
     * @tc.name   testCanvasWaveLog040013
     * @tc.number SUB_CANVAS_WAVE_LOG_04_0013
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog040013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog040013 begin');
      const s: string = 'l'.repeat(3904);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(3904);');
        expect(s.length).assertEqual(3904);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog040013 end');
    })

    /**
     * @tc.name   testCanvasWaveLog040014
     * @tc.number SUB_CANVAS_WAVE_LOG_04_0014
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog040014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog040014 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\',\'d\') === undefined).assertTrue();');
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'x\',\'y\') === undefined).assertTrue();');
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.error(\'e\') === undefined).assertTrue();');
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog040014 end');
    })

    /**
     * @tc.name   testCanvasWaveLog040015
     * @tc.number SUB_CANVAS_WAVE_LOG_04_0015
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog040015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog040015 begin');
      const s: string = 'l'.repeat(4032);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(s) === undefined).assertTrue();');
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(4032);');
        expect(s.length).assertEqual(4032);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog040015 end');
    })

    /**
     * @tc.name   testCanvasWaveLog040016
     * @tc.number SUB_CANVAS_WAVE_LOG_04_0016
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog040016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog040016 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'a\',\'b\',\'c\',\'d\') === undefined).assertTrue();');
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'x\',\'y\') === undefined).assertTrue();');
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.error(\'e\') === undefined).assertTrue();');
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveLog040016 end');
    })
  })
}

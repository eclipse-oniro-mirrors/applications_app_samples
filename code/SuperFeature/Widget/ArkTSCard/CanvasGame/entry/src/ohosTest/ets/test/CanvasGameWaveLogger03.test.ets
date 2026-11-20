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

export default function canvasGameWaveLogger03Test() {
  describe('CanvasGameWaveLogger03Test', () => {

    /**
     * @tc.name   com.samples.canvasgame_WaveLogger03_0001
     * @tc.number SUB_CANVAS_WAVE_LOG_03_0001
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveLogger03_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveLogger03_0001 begin');
      const s: string = 'l'.repeat(2112);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(2112));
        expect(s.length).assertEqual(2112);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveLogger03_0001 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveLogger03_0002
     * @tc.number SUB_CANVAS_WAVE_LOG_03_0002
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveLogger03_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveLogger03_0002 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.log('a','b','c','d') === undefined));
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.warn('x','y') === undefined));
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.error('e') === undefined));
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveLogger03_0002 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveLogger03_0003
     * @tc.number SUB_CANVAS_WAVE_LOG_03_0003
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveLogger03_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveLogger03_0003 begin');
      const s: string = 'l'.repeat(2240);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(2240));
        expect(s.length).assertEqual(2240);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveLogger03_0003 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveLogger03_0004
     * @tc.number SUB_CANVAS_WAVE_LOG_03_0004
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveLogger03_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveLogger03_0004 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.log('a','b','c','d') === undefined));
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.warn('x','y') === undefined));
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.error('e') === undefined));
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveLogger03_0004 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveLogger03_0005
     * @tc.number SUB_CANVAS_WAVE_LOG_03_0005
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveLogger03_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveLogger03_0005 begin');
      const s: string = 'l'.repeat(2368);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(2368));
        expect(s.length).assertEqual(2368);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveLogger03_0005 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveLogger03_0006
     * @tc.number SUB_CANVAS_WAVE_LOG_03_0006
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveLogger03_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveLogger03_0006 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.log('a','b','c','d') === undefined));
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.warn('x','y') === undefined));
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.error('e') === undefined));
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveLogger03_0006 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveLogger03_0007
     * @tc.number SUB_CANVAS_WAVE_LOG_03_0007
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveLogger03_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveLogger03_0007 begin');
      const s: string = 'l'.repeat(2496);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(2496));
        expect(s.length).assertEqual(2496);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveLogger03_0007 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveLogger03_0008
     * @tc.number SUB_CANVAS_WAVE_LOG_03_0008
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveLogger03_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveLogger03_0008 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.log('a','b','c','d') === undefined));
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.warn('x','y') === undefined));
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.error('e') === undefined));
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveLogger03_0008 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveLogger03_0009
     * @tc.number SUB_CANVAS_WAVE_LOG_03_0009
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveLogger03_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveLogger03_0009 begin');
      const s: string = 'l'.repeat(2624);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(2624));
        expect(s.length).assertEqual(2624);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveLogger03_0009 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveLogger03_0010
     * @tc.number SUB_CANVAS_WAVE_LOG_03_0010
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveLogger03_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveLogger03_0010 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.log('a','b','c','d') === undefined));
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.warn('x','y') === undefined));
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.error('e') === undefined));
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveLogger03_0010 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveLogger03_0011
     * @tc.number SUB_CANVAS_WAVE_LOG_03_0011
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveLogger03_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveLogger03_0011 begin');
      const s: string = 'l'.repeat(2752);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(2752));
        expect(s.length).assertEqual(2752);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveLogger03_0011 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveLogger03_0012
     * @tc.number SUB_CANVAS_WAVE_LOG_03_0012
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveLogger03_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveLogger03_0012 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.log('a','b','c','d') === undefined));
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.warn('x','y') === undefined));
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.error('e') === undefined));
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveLogger03_0012 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveLogger03_0013
     * @tc.number SUB_CANVAS_WAVE_LOG_03_0013
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveLogger03_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveLogger03_0013 begin');
      const s: string = 'l'.repeat(2880);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(2880));
        expect(s.length).assertEqual(2880);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveLogger03_0013 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveLogger03_0014
     * @tc.number SUB_CANVAS_WAVE_LOG_03_0014
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveLogger03_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveLogger03_0014 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.log('a','b','c','d') === undefined));
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.warn('x','y') === undefined));
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.error('e') === undefined));
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveLogger03_0014 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveLogger03_0015
     * @tc.number SUB_CANVAS_WAVE_LOG_03_0015
     * @tc.desc   Verify logger.info(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveLogger03_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveLogger03_0015 begin');
      const s: string = 'l'.repeat(3008);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(3008));
        expect(s.length).assertEqual(3008);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveLogger03_0015 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveLogger03_0016
     * @tc.number SUB_CANVAS_WAVE_LOG_03_0016
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveLogger03_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveLogger03_0016 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.log('a','b','c','d') === undefined));
      expect(logger.log('a','b','c','d') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.warn('x','y') === undefined));
        expect(logger.warn('x','y') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.error('e') === undefined));
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveLogger03_0016 end');
    })
  })
}

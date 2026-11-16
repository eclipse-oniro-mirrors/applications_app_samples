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
import logger from '../../../main/ets/model/Logger';

export default function canvasGameWaveLogger03Test() {
  describe('CanvasGameWaveLogger03Test', () => {

    /**
     * @tc.name   testCanvasWaveLog030001
     * @tc.number SUB_CANVAS_WAVE_LOG_03_0001
     * @tc.desc   Wave logger case 3-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog030001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(2112); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(2112);
    })

    /**
     * @tc.name   testCanvasWaveLog030002
     * @tc.number SUB_CANVAS_WAVE_LOG_03_0002
     * @tc.desc   Wave logger case 3-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog030002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog030003
     * @tc.number SUB_CANVAS_WAVE_LOG_03_0003
     * @tc.desc   Wave logger case 3-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog030003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(2240); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(2240);
    })

    /**
     * @tc.name   testCanvasWaveLog030004
     * @tc.number SUB_CANVAS_WAVE_LOG_03_0004
     * @tc.desc   Wave logger case 3-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog030004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog030005
     * @tc.number SUB_CANVAS_WAVE_LOG_03_0005
     * @tc.desc   Wave logger case 3-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog030005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(2368); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(2368);
    })

    /**
     * @tc.name   testCanvasWaveLog030006
     * @tc.number SUB_CANVAS_WAVE_LOG_03_0006
     * @tc.desc   Wave logger case 3-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog030006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog030007
     * @tc.number SUB_CANVAS_WAVE_LOG_03_0007
     * @tc.desc   Wave logger case 3-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog030007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(2496); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(2496);
    })

    /**
     * @tc.name   testCanvasWaveLog030008
     * @tc.number SUB_CANVAS_WAVE_LOG_03_0008
     * @tc.desc   Wave logger case 3-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog030008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog030009
     * @tc.number SUB_CANVAS_WAVE_LOG_03_0009
     * @tc.desc   Wave logger case 3-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog030009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(2624); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(2624);
    })

    /**
     * @tc.name   testCanvasWaveLog030010
     * @tc.number SUB_CANVAS_WAVE_LOG_03_0010
     * @tc.desc   Wave logger case 3-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog030010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog030011
     * @tc.number SUB_CANVAS_WAVE_LOG_03_0011
     * @tc.desc   Wave logger case 3-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog030011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(2752); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(2752);
    })

    /**
     * @tc.name   testCanvasWaveLog030012
     * @tc.number SUB_CANVAS_WAVE_LOG_03_0012
     * @tc.desc   Wave logger case 3-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog030012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog030013
     * @tc.number SUB_CANVAS_WAVE_LOG_03_0013
     * @tc.desc   Wave logger case 3-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog030013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(2880); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(2880);
    })

    /**
     * @tc.name   testCanvasWaveLog030014
     * @tc.number SUB_CANVAS_WAVE_LOG_03_0014
     * @tc.desc   Wave logger case 3-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog030014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog030015
     * @tc.number SUB_CANVAS_WAVE_LOG_03_0015
     * @tc.desc   Wave logger case 3-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog030015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(3008); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(3008);
    })

    /**
     * @tc.name   testCanvasWaveLog030016
     * @tc.number SUB_CANVAS_WAVE_LOG_03_0016
     * @tc.desc   Wave logger case 3-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog030016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })
  })
}

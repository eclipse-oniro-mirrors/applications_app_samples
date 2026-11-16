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

export default function canvasGameWaveLogger02Test() {
  describe('CanvasGameWaveLogger02Test', () => {

    /**
     * @tc.name   testCanvasWaveLog020001
     * @tc.number SUB_CANVAS_WAVE_LOG_02_0001
     * @tc.desc   Wave logger case 2-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(1088); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(1088);
    })

    /**
     * @tc.name   testCanvasWaveLog020002
     * @tc.number SUB_CANVAS_WAVE_LOG_02_0002
     * @tc.desc   Wave logger case 2-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog020003
     * @tc.number SUB_CANVAS_WAVE_LOG_02_0003
     * @tc.desc   Wave logger case 2-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(1216); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(1216);
    })

    /**
     * @tc.name   testCanvasWaveLog020004
     * @tc.number SUB_CANVAS_WAVE_LOG_02_0004
     * @tc.desc   Wave logger case 2-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog020005
     * @tc.number SUB_CANVAS_WAVE_LOG_02_0005
     * @tc.desc   Wave logger case 2-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(1344); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(1344);
    })

    /**
     * @tc.name   testCanvasWaveLog020006
     * @tc.number SUB_CANVAS_WAVE_LOG_02_0006
     * @tc.desc   Wave logger case 2-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog020007
     * @tc.number SUB_CANVAS_WAVE_LOG_02_0007
     * @tc.desc   Wave logger case 2-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(1472); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(1472);
    })

    /**
     * @tc.name   testCanvasWaveLog020008
     * @tc.number SUB_CANVAS_WAVE_LOG_02_0008
     * @tc.desc   Wave logger case 2-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog020009
     * @tc.number SUB_CANVAS_WAVE_LOG_02_0009
     * @tc.desc   Wave logger case 2-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(1600); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(1600);
    })

    /**
     * @tc.name   testCanvasWaveLog020010
     * @tc.number SUB_CANVAS_WAVE_LOG_02_0010
     * @tc.desc   Wave logger case 2-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog020011
     * @tc.number SUB_CANVAS_WAVE_LOG_02_0011
     * @tc.desc   Wave logger case 2-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(1728); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(1728);
    })

    /**
     * @tc.name   testCanvasWaveLog020012
     * @tc.number SUB_CANVAS_WAVE_LOG_02_0012
     * @tc.desc   Wave logger case 2-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog020013
     * @tc.number SUB_CANVAS_WAVE_LOG_02_0013
     * @tc.desc   Wave logger case 2-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(1856); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(1856);
    })

    /**
     * @tc.name   testCanvasWaveLog020014
     * @tc.number SUB_CANVAS_WAVE_LOG_02_0014
     * @tc.desc   Wave logger case 2-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog020015
     * @tc.number SUB_CANVAS_WAVE_LOG_02_0015
     * @tc.desc   Wave logger case 2-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(1984); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(1984);
    })

    /**
     * @tc.name   testCanvasWaveLog020016
     * @tc.number SUB_CANVAS_WAVE_LOG_02_0016
     * @tc.desc   Wave logger case 2-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })
  })
}

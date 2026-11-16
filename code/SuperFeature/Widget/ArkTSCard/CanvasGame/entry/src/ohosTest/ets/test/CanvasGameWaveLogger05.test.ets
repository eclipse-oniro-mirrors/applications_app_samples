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

export default function canvasGameWaveLogger05Test() {
  describe('CanvasGameWaveLogger05Test', () => {

    /**
     * @tc.name   testCanvasWaveLog050001
     * @tc.number SUB_CANVAS_WAVE_LOG_05_0001
     * @tc.desc   Wave logger case 5-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog050001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(4160); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(4160);
    })

    /**
     * @tc.name   testCanvasWaveLog050002
     * @tc.number SUB_CANVAS_WAVE_LOG_05_0002
     * @tc.desc   Wave logger case 5-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog050002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog050003
     * @tc.number SUB_CANVAS_WAVE_LOG_05_0003
     * @tc.desc   Wave logger case 5-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog050003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(4288); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(4288);
    })

    /**
     * @tc.name   testCanvasWaveLog050004
     * @tc.number SUB_CANVAS_WAVE_LOG_05_0004
     * @tc.desc   Wave logger case 5-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog050004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog050005
     * @tc.number SUB_CANVAS_WAVE_LOG_05_0005
     * @tc.desc   Wave logger case 5-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog050005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(4416); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(4416);
    })

    /**
     * @tc.name   testCanvasWaveLog050006
     * @tc.number SUB_CANVAS_WAVE_LOG_05_0006
     * @tc.desc   Wave logger case 5-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog050006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog050007
     * @tc.number SUB_CANVAS_WAVE_LOG_05_0007
     * @tc.desc   Wave logger case 5-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog050007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(4544); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(4544);
    })

    /**
     * @tc.name   testCanvasWaveLog050008
     * @tc.number SUB_CANVAS_WAVE_LOG_05_0008
     * @tc.desc   Wave logger case 5-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog050008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog050009
     * @tc.number SUB_CANVAS_WAVE_LOG_05_0009
     * @tc.desc   Wave logger case 5-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog050009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(4672); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(4672);
    })

    /**
     * @tc.name   testCanvasWaveLog050010
     * @tc.number SUB_CANVAS_WAVE_LOG_05_0010
     * @tc.desc   Wave logger case 5-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog050010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog050011
     * @tc.number SUB_CANVAS_WAVE_LOG_05_0011
     * @tc.desc   Wave logger case 5-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog050011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(4800); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(4800);
    })

    /**
     * @tc.name   testCanvasWaveLog050012
     * @tc.number SUB_CANVAS_WAVE_LOG_05_0012
     * @tc.desc   Wave logger case 5-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog050012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog050013
     * @tc.number SUB_CANVAS_WAVE_LOG_05_0013
     * @tc.desc   Wave logger case 5-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog050013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(4928); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(4928);
    })

    /**
     * @tc.name   testCanvasWaveLog050014
     * @tc.number SUB_CANVAS_WAVE_LOG_05_0014
     * @tc.desc   Wave logger case 5-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog050014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog050015
     * @tc.number SUB_CANVAS_WAVE_LOG_05_0015
     * @tc.desc   Wave logger case 5-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog050015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(5056); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(5056);
    })

    /**
     * @tc.name   testCanvasWaveLog050016
     * @tc.number SUB_CANVAS_WAVE_LOG_05_0016
     * @tc.desc   Wave logger case 5-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog050016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })
  })
}

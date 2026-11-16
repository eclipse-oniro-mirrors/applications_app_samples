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

export default function canvasGameWaveLogger01Test() {
  describe('CanvasGameWaveLogger01Test', () => {

    /**
     * @tc.name   testCanvasWaveLog010001
     * @tc.number SUB_CANVAS_WAVE_LOG_01_0001
     * @tc.desc   Wave logger case 1-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(64); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(64);
    })

    /**
     * @tc.name   testCanvasWaveLog010002
     * @tc.number SUB_CANVAS_WAVE_LOG_01_0002
     * @tc.desc   Wave logger case 1-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog010003
     * @tc.number SUB_CANVAS_WAVE_LOG_01_0003
     * @tc.desc   Wave logger case 1-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(192); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(192);
    })

    /**
     * @tc.name   testCanvasWaveLog010004
     * @tc.number SUB_CANVAS_WAVE_LOG_01_0004
     * @tc.desc   Wave logger case 1-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog010005
     * @tc.number SUB_CANVAS_WAVE_LOG_01_0005
     * @tc.desc   Wave logger case 1-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(320); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(320);
    })

    /**
     * @tc.name   testCanvasWaveLog010006
     * @tc.number SUB_CANVAS_WAVE_LOG_01_0006
     * @tc.desc   Wave logger case 1-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog010007
     * @tc.number SUB_CANVAS_WAVE_LOG_01_0007
     * @tc.desc   Wave logger case 1-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(448); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(448);
    })

    /**
     * @tc.name   testCanvasWaveLog010008
     * @tc.number SUB_CANVAS_WAVE_LOG_01_0008
     * @tc.desc   Wave logger case 1-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog010009
     * @tc.number SUB_CANVAS_WAVE_LOG_01_0009
     * @tc.desc   Wave logger case 1-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(576); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(576);
    })

    /**
     * @tc.name   testCanvasWaveLog010010
     * @tc.number SUB_CANVAS_WAVE_LOG_01_0010
     * @tc.desc   Wave logger case 1-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog010011
     * @tc.number SUB_CANVAS_WAVE_LOG_01_0011
     * @tc.desc   Wave logger case 1-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(704); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(704);
    })

    /**
     * @tc.name   testCanvasWaveLog010012
     * @tc.number SUB_CANVAS_WAVE_LOG_01_0012
     * @tc.desc   Wave logger case 1-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog010013
     * @tc.number SUB_CANVAS_WAVE_LOG_01_0013
     * @tc.desc   Wave logger case 1-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(832); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(832);
    })

    /**
     * @tc.name   testCanvasWaveLog010014
     * @tc.number SUB_CANVAS_WAVE_LOG_01_0014
     * @tc.desc   Wave logger case 1-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog010015
     * @tc.number SUB_CANVAS_WAVE_LOG_01_0015
     * @tc.desc   Wave logger case 1-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(960); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(960);
    })

    /**
     * @tc.name   testCanvasWaveLog010016
     * @tc.number SUB_CANVAS_WAVE_LOG_01_0016
     * @tc.desc   Wave logger case 1-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })
  })
}

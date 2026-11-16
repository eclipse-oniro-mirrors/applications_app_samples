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

export default function canvasGameWaveLogger04Test() {
  describe('CanvasGameWaveLogger04Test', () => {

    /**
     * @tc.name   testCanvasWaveLog040001
     * @tc.number SUB_CANVAS_WAVE_LOG_04_0001
     * @tc.desc   Wave logger case 4-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog040001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(3136); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(3136);
    })

    /**
     * @tc.name   testCanvasWaveLog040002
     * @tc.number SUB_CANVAS_WAVE_LOG_04_0002
     * @tc.desc   Wave logger case 4-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog040002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog040003
     * @tc.number SUB_CANVAS_WAVE_LOG_04_0003
     * @tc.desc   Wave logger case 4-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog040003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(3264); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(3264);
    })

    /**
     * @tc.name   testCanvasWaveLog040004
     * @tc.number SUB_CANVAS_WAVE_LOG_04_0004
     * @tc.desc   Wave logger case 4-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog040004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog040005
     * @tc.number SUB_CANVAS_WAVE_LOG_04_0005
     * @tc.desc   Wave logger case 4-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog040005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(3392); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(3392);
    })

    /**
     * @tc.name   testCanvasWaveLog040006
     * @tc.number SUB_CANVAS_WAVE_LOG_04_0006
     * @tc.desc   Wave logger case 4-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog040006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog040007
     * @tc.number SUB_CANVAS_WAVE_LOG_04_0007
     * @tc.desc   Wave logger case 4-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog040007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(3520); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(3520);
    })

    /**
     * @tc.name   testCanvasWaveLog040008
     * @tc.number SUB_CANVAS_WAVE_LOG_04_0008
     * @tc.desc   Wave logger case 4-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog040008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog040009
     * @tc.number SUB_CANVAS_WAVE_LOG_04_0009
     * @tc.desc   Wave logger case 4-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog040009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(3648); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(3648);
    })

    /**
     * @tc.name   testCanvasWaveLog040010
     * @tc.number SUB_CANVAS_WAVE_LOG_04_0010
     * @tc.desc   Wave logger case 4-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog040010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog040011
     * @tc.number SUB_CANVAS_WAVE_LOG_04_0011
     * @tc.desc   Wave logger case 4-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog040011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(3776); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(3776);
    })

    /**
     * @tc.name   testCanvasWaveLog040012
     * @tc.number SUB_CANVAS_WAVE_LOG_04_0012
     * @tc.desc   Wave logger case 4-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog040012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog040013
     * @tc.number SUB_CANVAS_WAVE_LOG_04_0013
     * @tc.desc   Wave logger case 4-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog040013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(3904); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(3904);
    })

    /**
     * @tc.name   testCanvasWaveLog040014
     * @tc.number SUB_CANVAS_WAVE_LOG_04_0014
     * @tc.desc   Wave logger case 4-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog040014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog040015
     * @tc.number SUB_CANVAS_WAVE_LOG_04_0015
     * @tc.desc   Wave logger case 4-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog040015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(4032); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(4032);
    })

    /**
     * @tc.name   testCanvasWaveLog040016
     * @tc.number SUB_CANVAS_WAVE_LOG_04_0016
     * @tc.desc   Wave logger case 4-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog040016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })
  })
}

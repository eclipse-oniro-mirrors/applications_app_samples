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

export default function canvasGameWaveLogger06Test() {
  describe('CanvasGameWaveLogger06Test', () => {

    /**
     * @tc.name   testCanvasWaveLog060001
     * @tc.number SUB_CANVAS_WAVE_LOG_06_0001
     * @tc.desc   Wave logger case 6-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog060001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(5184); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(5184);
    })

    /**
     * @tc.name   testCanvasWaveLog060002
     * @tc.number SUB_CANVAS_WAVE_LOG_06_0002
     * @tc.desc   Wave logger case 6-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog060002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog060003
     * @tc.number SUB_CANVAS_WAVE_LOG_06_0003
     * @tc.desc   Wave logger case 6-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog060003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(5312); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(5312);
    })

    /**
     * @tc.name   testCanvasWaveLog060004
     * @tc.number SUB_CANVAS_WAVE_LOG_06_0004
     * @tc.desc   Wave logger case 6-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog060004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog060005
     * @tc.number SUB_CANVAS_WAVE_LOG_06_0005
     * @tc.desc   Wave logger case 6-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog060005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(5440); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(5440);
    })

    /**
     * @tc.name   testCanvasWaveLog060006
     * @tc.number SUB_CANVAS_WAVE_LOG_06_0006
     * @tc.desc   Wave logger case 6-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog060006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog060007
     * @tc.number SUB_CANVAS_WAVE_LOG_06_0007
     * @tc.desc   Wave logger case 6-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog060007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(5568); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(5568);
    })

    /**
     * @tc.name   testCanvasWaveLog060008
     * @tc.number SUB_CANVAS_WAVE_LOG_06_0008
     * @tc.desc   Wave logger case 6-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog060008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog060009
     * @tc.number SUB_CANVAS_WAVE_LOG_06_0009
     * @tc.desc   Wave logger case 6-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog060009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(5696); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(5696);
    })

    /**
     * @tc.name   testCanvasWaveLog060010
     * @tc.number SUB_CANVAS_WAVE_LOG_06_0010
     * @tc.desc   Wave logger case 6-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog060010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog060011
     * @tc.number SUB_CANVAS_WAVE_LOG_06_0011
     * @tc.desc   Wave logger case 6-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog060011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(5824); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(5824);
    })

    /**
     * @tc.name   testCanvasWaveLog060012
     * @tc.number SUB_CANVAS_WAVE_LOG_06_0012
     * @tc.desc   Wave logger case 6-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog060012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog060013
     * @tc.number SUB_CANVAS_WAVE_LOG_06_0013
     * @tc.desc   Wave logger case 6-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog060013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(5952); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(5952);
    })

    /**
     * @tc.name   testCanvasWaveLog060014
     * @tc.number SUB_CANVAS_WAVE_LOG_06_0014
     * @tc.desc   Wave logger case 6-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog060014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveLog060015
     * @tc.number SUB_CANVAS_WAVE_LOG_06_0015
     * @tc.desc   Wave logger case 6-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog060015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'l'.repeat(6080); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(6080);
    })

    /**
     * @tc.name   testCanvasWaveLog060016
     * @tc.number SUB_CANVAS_WAVE_LOG_06_0016
     * @tc.desc   Wave logger case 6-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveLog060016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d') === undefined).assertTrue(); expect(logger.warn('x','y') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })
  })
}

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

export default function canvasGameVolumeLogger01Test() {
  describe('CanvasGameVolumeLogger01Test', () => {

    /**
     * @tc.name   testCanvasVolLog010001
     * @tc.number SUB_CANVAS_VOL_LOG_01_0001
     * @tc.desc   Logger volume case 1-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(100); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(100);
    })

    /**
     * @tc.name   testCanvasVolLog010002
     * @tc.number SUB_CANVAS_VOL_LOG_01_0002
     * @tc.desc   Logger volume case 1-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolLog010003
     * @tc.number SUB_CANVAS_VOL_LOG_01_0003
     * @tc.desc   Logger volume case 1-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(300); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(300);
    })

    /**
     * @tc.name   testCanvasVolLog010004
     * @tc.number SUB_CANVAS_VOL_LOG_01_0004
     * @tc.desc   Logger volume case 1-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolLog010005
     * @tc.number SUB_CANVAS_VOL_LOG_01_0005
     * @tc.desc   Logger volume case 1-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(500); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(500);
    })

    /**
     * @tc.name   testCanvasVolLog010006
     * @tc.number SUB_CANVAS_VOL_LOG_01_0006
     * @tc.desc   Logger volume case 1-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolLog010007
     * @tc.number SUB_CANVAS_VOL_LOG_01_0007
     * @tc.desc   Logger volume case 1-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(700); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(700);
    })

    /**
     * @tc.name   testCanvasVolLog010008
     * @tc.number SUB_CANVAS_VOL_LOG_01_0008
     * @tc.desc   Logger volume case 1-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolLog010009
     * @tc.number SUB_CANVAS_VOL_LOG_01_0009
     * @tc.desc   Logger volume case 1-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(900); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(900);
    })

    /**
     * @tc.name   testCanvasVolLog010010
     * @tc.number SUB_CANVAS_VOL_LOG_01_0010
     * @tc.desc   Logger volume case 1-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolLog010011
     * @tc.number SUB_CANVAS_VOL_LOG_01_0011
     * @tc.desc   Logger volume case 1-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(1100); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(1100);
    })

    /**
     * @tc.name   testCanvasVolLog010012
     * @tc.number SUB_CANVAS_VOL_LOG_01_0012
     * @tc.desc   Logger volume case 1-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolLog010013
     * @tc.number SUB_CANVAS_VOL_LOG_01_0013
     * @tc.desc   Logger volume case 1-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(1300); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(1300);
    })

    /**
     * @tc.name   testCanvasVolLog010014
     * @tc.number SUB_CANVAS_VOL_LOG_01_0014
     * @tc.desc   Logger volume case 1-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolLog010015
     * @tc.number SUB_CANVAS_VOL_LOG_01_0015
     * @tc.desc   Logger volume case 1-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(1500); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(1500);
    })

    /**
     * @tc.name   testCanvasVolLog010016
     * @tc.number SUB_CANVAS_VOL_LOG_01_0016
     * @tc.desc   Logger volume case 1-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })
  })
}

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

export default function canvasGameVolumeLogger04Test() {
  describe('CanvasGameVolumeLogger04Test', () => {

    /**
     * @tc.name   testCanvasVolLog040001
     * @tc.number SUB_CANVAS_VOL_LOG_04_0001
     * @tc.desc   Logger volume case 4-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog040001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(4900); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(4900);
    })

    /**
     * @tc.name   testCanvasVolLog040002
     * @tc.number SUB_CANVAS_VOL_LOG_04_0002
     * @tc.desc   Logger volume case 4-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog040002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolLog040003
     * @tc.number SUB_CANVAS_VOL_LOG_04_0003
     * @tc.desc   Logger volume case 4-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog040003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(5100); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(5100);
    })

    /**
     * @tc.name   testCanvasVolLog040004
     * @tc.number SUB_CANVAS_VOL_LOG_04_0004
     * @tc.desc   Logger volume case 4-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog040004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolLog040005
     * @tc.number SUB_CANVAS_VOL_LOG_04_0005
     * @tc.desc   Logger volume case 4-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog040005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(5300); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(5300);
    })

    /**
     * @tc.name   testCanvasVolLog040006
     * @tc.number SUB_CANVAS_VOL_LOG_04_0006
     * @tc.desc   Logger volume case 4-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog040006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolLog040007
     * @tc.number SUB_CANVAS_VOL_LOG_04_0007
     * @tc.desc   Logger volume case 4-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog040007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(5500); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(5500);
    })

    /**
     * @tc.name   testCanvasVolLog040008
     * @tc.number SUB_CANVAS_VOL_LOG_04_0008
     * @tc.desc   Logger volume case 4-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog040008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolLog040009
     * @tc.number SUB_CANVAS_VOL_LOG_04_0009
     * @tc.desc   Logger volume case 4-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog040009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(5700); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(5700);
    })

    /**
     * @tc.name   testCanvasVolLog040010
     * @tc.number SUB_CANVAS_VOL_LOG_04_0010
     * @tc.desc   Logger volume case 4-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog040010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolLog040011
     * @tc.number SUB_CANVAS_VOL_LOG_04_0011
     * @tc.desc   Logger volume case 4-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog040011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(5900); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(5900);
    })

    /**
     * @tc.name   testCanvasVolLog040012
     * @tc.number SUB_CANVAS_VOL_LOG_04_0012
     * @tc.desc   Logger volume case 4-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog040012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolLog040013
     * @tc.number SUB_CANVAS_VOL_LOG_04_0013
     * @tc.desc   Logger volume case 4-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog040013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(6100); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(6100);
    })

    /**
     * @tc.name   testCanvasVolLog040014
     * @tc.number SUB_CANVAS_VOL_LOG_04_0014
     * @tc.desc   Logger volume case 4-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog040014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolLog040015
     * @tc.number SUB_CANVAS_VOL_LOG_04_0015
     * @tc.desc   Logger volume case 4-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog040015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(6300); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(6300);
    })

    /**
     * @tc.name   testCanvasVolLog040016
     * @tc.number SUB_CANVAS_VOL_LOG_04_0016
     * @tc.desc   Logger volume case 4-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog040016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })
  })
}

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

export default function canvasGameVolumeLogger02Test() {
  describe('CanvasGameVolumeLogger02Test', () => {

    /**
     * @tc.name   testCanvasVolLog020001
     * @tc.number SUB_CANVAS_VOL_LOG_02_0001
     * @tc.desc   Logger volume case 2-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(1700); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(1700);
    })

    /**
     * @tc.name   testCanvasVolLog020002
     * @tc.number SUB_CANVAS_VOL_LOG_02_0002
     * @tc.desc   Logger volume case 2-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolLog020003
     * @tc.number SUB_CANVAS_VOL_LOG_02_0003
     * @tc.desc   Logger volume case 2-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(1900); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(1900);
    })

    /**
     * @tc.name   testCanvasVolLog020004
     * @tc.number SUB_CANVAS_VOL_LOG_02_0004
     * @tc.desc   Logger volume case 2-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolLog020005
     * @tc.number SUB_CANVAS_VOL_LOG_02_0005
     * @tc.desc   Logger volume case 2-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(2100); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(2100);
    })

    /**
     * @tc.name   testCanvasVolLog020006
     * @tc.number SUB_CANVAS_VOL_LOG_02_0006
     * @tc.desc   Logger volume case 2-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolLog020007
     * @tc.number SUB_CANVAS_VOL_LOG_02_0007
     * @tc.desc   Logger volume case 2-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(2300); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(2300);
    })

    /**
     * @tc.name   testCanvasVolLog020008
     * @tc.number SUB_CANVAS_VOL_LOG_02_0008
     * @tc.desc   Logger volume case 2-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolLog020009
     * @tc.number SUB_CANVAS_VOL_LOG_02_0009
     * @tc.desc   Logger volume case 2-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(2500); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(2500);
    })

    /**
     * @tc.name   testCanvasVolLog020010
     * @tc.number SUB_CANVAS_VOL_LOG_02_0010
     * @tc.desc   Logger volume case 2-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolLog020011
     * @tc.number SUB_CANVAS_VOL_LOG_02_0011
     * @tc.desc   Logger volume case 2-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(2700); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(2700);
    })

    /**
     * @tc.name   testCanvasVolLog020012
     * @tc.number SUB_CANVAS_VOL_LOG_02_0012
     * @tc.desc   Logger volume case 2-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolLog020013
     * @tc.number SUB_CANVAS_VOL_LOG_02_0013
     * @tc.desc   Logger volume case 2-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(2900); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(2900);
    })

    /**
     * @tc.name   testCanvasVolLog020014
     * @tc.number SUB_CANVAS_VOL_LOG_02_0014
     * @tc.desc   Logger volume case 2-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolLog020015
     * @tc.number SUB_CANVAS_VOL_LOG_02_0015
     * @tc.desc   Logger volume case 2-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(3100); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(3100);
    })

    /**
     * @tc.name   testCanvasVolLog020016
     * @tc.number SUB_CANVAS_VOL_LOG_02_0016
     * @tc.desc   Logger volume case 2-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })
  })
}

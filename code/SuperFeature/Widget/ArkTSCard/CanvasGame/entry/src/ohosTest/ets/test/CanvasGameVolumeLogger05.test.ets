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

export default function canvasGameVolumeLogger05Test() {
  describe('CanvasGameVolumeLogger05Test', () => {

    /**
     * @tc.name   testCanvasVolLog050001
     * @tc.number SUB_CANVAS_VOL_LOG_05_0001
     * @tc.desc   Logger volume case 5-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog050001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(6500); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(6500);
    })

    /**
     * @tc.name   testCanvasVolLog050002
     * @tc.number SUB_CANVAS_VOL_LOG_05_0002
     * @tc.desc   Logger volume case 5-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog050002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolLog050003
     * @tc.number SUB_CANVAS_VOL_LOG_05_0003
     * @tc.desc   Logger volume case 5-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog050003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(6700); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(6700);
    })

    /**
     * @tc.name   testCanvasVolLog050004
     * @tc.number SUB_CANVAS_VOL_LOG_05_0004
     * @tc.desc   Logger volume case 5-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog050004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolLog050005
     * @tc.number SUB_CANVAS_VOL_LOG_05_0005
     * @tc.desc   Logger volume case 5-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog050005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(6900); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(6900);
    })

    /**
     * @tc.name   testCanvasVolLog050006
     * @tc.number SUB_CANVAS_VOL_LOG_05_0006
     * @tc.desc   Logger volume case 5-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog050006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolLog050007
     * @tc.number SUB_CANVAS_VOL_LOG_05_0007
     * @tc.desc   Logger volume case 5-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog050007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(7100); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(7100);
    })

    /**
     * @tc.name   testCanvasVolLog050008
     * @tc.number SUB_CANVAS_VOL_LOG_05_0008
     * @tc.desc   Logger volume case 5-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog050008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolLog050009
     * @tc.number SUB_CANVAS_VOL_LOG_05_0009
     * @tc.desc   Logger volume case 5-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog050009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(7300); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(7300);
    })

    /**
     * @tc.name   testCanvasVolLog050010
     * @tc.number SUB_CANVAS_VOL_LOG_05_0010
     * @tc.desc   Logger volume case 5-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog050010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolLog050011
     * @tc.number SUB_CANVAS_VOL_LOG_05_0011
     * @tc.desc   Logger volume case 5-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog050011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(7500); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(7500);
    })

    /**
     * @tc.name   testCanvasVolLog050012
     * @tc.number SUB_CANVAS_VOL_LOG_05_0012
     * @tc.desc   Logger volume case 5-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog050012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolLog050013
     * @tc.number SUB_CANVAS_VOL_LOG_05_0013
     * @tc.desc   Logger volume case 5-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog050013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(7700); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(7700);
    })

    /**
     * @tc.name   testCanvasVolLog050014
     * @tc.number SUB_CANVAS_VOL_LOG_05_0014
     * @tc.desc   Logger volume case 5-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog050014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolLog050015
     * @tc.number SUB_CANVAS_VOL_LOG_05_0015
     * @tc.desc   Logger volume case 5-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog050015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(7900); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(7900);
    })

    /**
     * @tc.name   testCanvasVolLog050016
     * @tc.number SUB_CANVAS_VOL_LOG_05_0016
     * @tc.desc   Logger volume case 5-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog050016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })
  })
}

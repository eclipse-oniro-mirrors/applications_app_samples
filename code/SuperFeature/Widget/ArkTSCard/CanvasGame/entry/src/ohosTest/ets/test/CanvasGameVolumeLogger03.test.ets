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

export default function canvasGameVolumeLogger03Test() {
  describe('CanvasGameVolumeLogger03Test', () => {

    /**
     * @tc.name   testCanvasVolLog030001
     * @tc.number SUB_CANVAS_VOL_LOG_03_0001
     * @tc.desc   Logger volume case 3-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog030001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(3300); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(3300);
    })

    /**
     * @tc.name   testCanvasVolLog030002
     * @tc.number SUB_CANVAS_VOL_LOG_03_0002
     * @tc.desc   Logger volume case 3-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog030002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolLog030003
     * @tc.number SUB_CANVAS_VOL_LOG_03_0003
     * @tc.desc   Logger volume case 3-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog030003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(3500); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(3500);
    })

    /**
     * @tc.name   testCanvasVolLog030004
     * @tc.number SUB_CANVAS_VOL_LOG_03_0004
     * @tc.desc   Logger volume case 3-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog030004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolLog030005
     * @tc.number SUB_CANVAS_VOL_LOG_03_0005
     * @tc.desc   Logger volume case 3-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog030005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(3700); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(3700);
    })

    /**
     * @tc.name   testCanvasVolLog030006
     * @tc.number SUB_CANVAS_VOL_LOG_03_0006
     * @tc.desc   Logger volume case 3-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog030006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolLog030007
     * @tc.number SUB_CANVAS_VOL_LOG_03_0007
     * @tc.desc   Logger volume case 3-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog030007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(3900); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(3900);
    })

    /**
     * @tc.name   testCanvasVolLog030008
     * @tc.number SUB_CANVAS_VOL_LOG_03_0008
     * @tc.desc   Logger volume case 3-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog030008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolLog030009
     * @tc.number SUB_CANVAS_VOL_LOG_03_0009
     * @tc.desc   Logger volume case 3-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog030009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(4100); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(4100);
    })

    /**
     * @tc.name   testCanvasVolLog030010
     * @tc.number SUB_CANVAS_VOL_LOG_03_0010
     * @tc.desc   Logger volume case 3-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog030010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolLog030011
     * @tc.number SUB_CANVAS_VOL_LOG_03_0011
     * @tc.desc   Logger volume case 3-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog030011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(4300); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(4300);
    })

    /**
     * @tc.name   testCanvasVolLog030012
     * @tc.number SUB_CANVAS_VOL_LOG_03_0012
     * @tc.desc   Logger volume case 3-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog030012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolLog030013
     * @tc.number SUB_CANVAS_VOL_LOG_03_0013
     * @tc.desc   Logger volume case 3-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog030013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(4500); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(4500);
    })

    /**
     * @tc.name   testCanvasVolLog030014
     * @tc.number SUB_CANVAS_VOL_LOG_03_0014
     * @tc.desc   Logger volume case 3-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog030014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolLog030015
     * @tc.number SUB_CANVAS_VOL_LOG_03_0015
     * @tc.desc   Logger volume case 3-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog030015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(4700); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(4700);
    })

    /**
     * @tc.name   testCanvasVolLog030016
     * @tc.number SUB_CANVAS_VOL_LOG_03_0016
     * @tc.desc   Logger volume case 3-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolLog030016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c') === undefined).assertTrue(); expect(logger.debug('d','e') === undefined).assertTrue(); expect(logger.warn('f') === undefined).assertTrue();
    })
  })
}

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

export default function canvasGameFinalLoggerTest() {
  describe('CanvasGameFinalLoggerTest', () => {

    /**
     * @tc.name   testCanvasFinalLogger0001
     * @tc.number SUB_CANVAS_FINAL_LOG_0001
     * @tc.desc   Final logger boundary 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalLogger0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'q'.repeat(150); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(150);
    })

    /**
     * @tc.name   testCanvasFinalLogger0002
     * @tc.number SUB_CANVAS_FINAL_LOG_0002
     * @tc.desc   Final logger boundary 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalLogger0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'q'.repeat(300); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(300);
    })

    /**
     * @tc.name   testCanvasFinalLogger0003
     * @tc.number SUB_CANVAS_FINAL_LOG_0003
     * @tc.desc   Final logger boundary 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalLogger0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'q'.repeat(450); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(450);
    })

    /**
     * @tc.name   testCanvasFinalLogger0004
     * @tc.number SUB_CANVAS_FINAL_LOG_0004
     * @tc.desc   Final logger boundary 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalLogger0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'q'.repeat(600); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(600);
    })

    /**
     * @tc.name   testCanvasFinalLogger0005
     * @tc.number SUB_CANVAS_FINAL_LOG_0005
     * @tc.desc   Final logger boundary 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalLogger0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'q'.repeat(750); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(750);
    })

    /**
     * @tc.name   testCanvasFinalLogger0006
     * @tc.number SUB_CANVAS_FINAL_LOG_0006
     * @tc.desc   Final logger boundary 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalLogger0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'q'.repeat(900); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(900);
    })

    /**
     * @tc.name   testCanvasFinalLogger0007
     * @tc.number SUB_CANVAS_FINAL_LOG_0007
     * @tc.desc   Final logger boundary 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalLogger0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'q'.repeat(1050); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(1050);
    })

    /**
     * @tc.name   testCanvasFinalLogger0008
     * @tc.number SUB_CANVAS_FINAL_LOG_0008
     * @tc.desc   Final logger boundary 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalLogger0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'q'.repeat(1200); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(1200);
    })

    /**
     * @tc.name   testCanvasFinalLogger0009
     * @tc.number SUB_CANVAS_FINAL_LOG_0009
     * @tc.desc   Final logger boundary 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalLogger0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'q'.repeat(1350); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(1350);
    })

    /**
     * @tc.name   testCanvasFinalLogger0010
     * @tc.number SUB_CANVAS_FINAL_LOG_0010
     * @tc.desc   Final logger boundary 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalLogger0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'q'.repeat(1500); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(1500);
    })

    /**
     * @tc.name   testCanvasFinalLogger0011
     * @tc.number SUB_CANVAS_FINAL_LOG_0011
     * @tc.desc   Final logger boundary 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalLogger0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'q'.repeat(1650); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(1650);
    })

    /**
     * @tc.name   testCanvasFinalLogger0012
     * @tc.number SUB_CANVAS_FINAL_LOG_0012
     * @tc.desc   Final logger boundary 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalLogger0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'q'.repeat(1800); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(1800);
    })

    /**
     * @tc.name   testCanvasFinalLogger0013
     * @tc.number SUB_CANVAS_FINAL_LOG_0013
     * @tc.desc   Final logger boundary 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalLogger0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'q'.repeat(1950); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(1950);
    })

    /**
     * @tc.name   testCanvasFinalLogger0014
     * @tc.number SUB_CANVAS_FINAL_LOG_0014
     * @tc.desc   Final logger boundary 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalLogger0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'q'.repeat(2100); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(2100);
    })

    /**
     * @tc.name   testCanvasFinalLogger0015
     * @tc.number SUB_CANVAS_FINAL_LOG_0015
     * @tc.desc   Final logger boundary 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalLogger0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'q'.repeat(2250); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(2250);
    })

    /**
     * @tc.name   testCanvasFinalLogger0016
     * @tc.number SUB_CANVAS_FINAL_LOG_0016
     * @tc.desc   Final logger boundary 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalLogger0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'q'.repeat(2400); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(2400);
    })
  })
}

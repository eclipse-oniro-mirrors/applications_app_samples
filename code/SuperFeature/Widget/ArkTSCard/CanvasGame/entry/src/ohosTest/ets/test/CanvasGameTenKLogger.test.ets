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

export default function canvasGameTenKLoggerTest() {
  describe('CanvasGameTenKLoggerTest', () => {

    /**
     * @tc.name   testCanvasTenKLog0001
     * @tc.number SUB_CANVAS_10K_LOG_0001
     * @tc.desc   Ten-K logger case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKLog0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'j'.repeat(200); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(200);
    })

    /**
     * @tc.name   testCanvasTenKLog0002
     * @tc.number SUB_CANVAS_10K_LOG_0002
     * @tc.desc   Ten-K logger case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKLog0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'j'.repeat(400); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(400);
    })

    /**
     * @tc.name   testCanvasTenKLog0003
     * @tc.number SUB_CANVAS_10K_LOG_0003
     * @tc.desc   Ten-K logger case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKLog0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'j'.repeat(600); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(600);
    })

    /**
     * @tc.name   testCanvasTenKLog0004
     * @tc.number SUB_CANVAS_10K_LOG_0004
     * @tc.desc   Ten-K logger case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKLog0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'j'.repeat(800); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(800);
    })

    /**
     * @tc.name   testCanvasTenKLog0005
     * @tc.number SUB_CANVAS_10K_LOG_0005
     * @tc.desc   Ten-K logger case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKLog0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'j'.repeat(1000); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(1000);
    })

    /**
     * @tc.name   testCanvasTenKLog0006
     * @tc.number SUB_CANVAS_10K_LOG_0006
     * @tc.desc   Ten-K logger case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKLog0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'j'.repeat(1200); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(1200);
    })

    /**
     * @tc.name   testCanvasTenKLog0007
     * @tc.number SUB_CANVAS_10K_LOG_0007
     * @tc.desc   Ten-K logger case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKLog0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'j'.repeat(1400); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(1400);
    })

    /**
     * @tc.name   testCanvasTenKLog0008
     * @tc.number SUB_CANVAS_10K_LOG_0008
     * @tc.desc   Ten-K logger case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKLog0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'j'.repeat(1600); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(1600);
    })

    /**
     * @tc.name   testCanvasTenKLog0009
     * @tc.number SUB_CANVAS_10K_LOG_0009
     * @tc.desc   Ten-K logger case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKLog0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'j'.repeat(1800); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(1800);
    })

    /**
     * @tc.name   testCanvasTenKLog0010
     * @tc.number SUB_CANVAS_10K_LOG_0010
     * @tc.desc   Ten-K logger case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKLog0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'j'.repeat(2000); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(2000);
    })
  })
}

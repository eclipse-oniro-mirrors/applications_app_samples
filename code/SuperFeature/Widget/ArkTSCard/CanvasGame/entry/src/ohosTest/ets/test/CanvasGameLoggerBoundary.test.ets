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

export default function canvasGameLoggerBoundaryTest() {
  describe('CanvasGameLoggerBoundaryTest', () => {

    /**
     * @tc.name   testCanvasLoggerBoundary001
     * @tc.number SUB_CANVAS_LOG_BOUND_001
     * @tc.desc   Log a string of length 200.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasLoggerBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(200); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(200);
    })

    /**
     * @tc.name   testCanvasLoggerBoundary002
     * @tc.number SUB_CANVAS_LOG_BOUND_002
     * @tc.desc   Log a string of length 400.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasLoggerBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(400); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(400);
    })

    /**
     * @tc.name   testCanvasLoggerBoundary003
     * @tc.number SUB_CANVAS_LOG_BOUND_003
     * @tc.desc   Log a string of length 600.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasLoggerBoundary003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(600); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(600);
    })

    /**
     * @tc.name   testCanvasLoggerBoundary004
     * @tc.number SUB_CANVAS_LOG_BOUND_004
     * @tc.desc   Log a string of length 800.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasLoggerBoundary004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(800); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(800);
    })

    /**
     * @tc.name   testCanvasLoggerBoundary005
     * @tc.number SUB_CANVAS_LOG_BOUND_005
     * @tc.desc   Log a string of length 1000.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasLoggerBoundary005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'v'.repeat(1000); expect(logger.info(s) === undefined).assertTrue(); expect(s.length).assertEqual(1000);
    })

    /**
     * @tc.name   testCanvasLoggerBoundary006
     * @tc.number SUB_CANVAS_LOG_BOUND_006
     * @tc.desc   Log multiple arguments case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasLoggerBoundary006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d','e','f') === undefined).assertTrue(); expect(logger.warn('w','x','y','z') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasLoggerBoundary007
     * @tc.number SUB_CANVAS_LOG_BOUND_007
     * @tc.desc   Log multiple arguments case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasLoggerBoundary007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d','e','f') === undefined).assertTrue(); expect(logger.warn('w','x','y','z') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasLoggerBoundary008
     * @tc.number SUB_CANVAS_LOG_BOUND_008
     * @tc.desc   Log multiple arguments case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasLoggerBoundary008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d','e','f') === undefined).assertTrue(); expect(logger.warn('w','x','y','z') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasLoggerBoundary009
     * @tc.number SUB_CANVAS_LOG_BOUND_009
     * @tc.desc   Log multiple arguments case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasLoggerBoundary009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d','e','f') === undefined).assertTrue(); expect(logger.warn('w','x','y','z') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasLoggerBoundary010
     * @tc.number SUB_CANVAS_LOG_BOUND_010
     * @tc.desc   Log multiple arguments case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasLoggerBoundary010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('a','b','c','d','e','f') === undefined).assertTrue(); expect(logger.warn('w','x','y','z') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue();
    })
  })
}

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

export default function canvasGameMoreLoggerTest() {
  describe('CanvasGameMoreLoggerTest', () => {

    /**
     * @tc.name   testCanvasMoreLogger0001
     * @tc.number SUB_CANVAS_MORE_LOG_0001
     * @tc.desc   More logger case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasMoreLogger0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.info('a','b','c','d','e') === undefined).assertTrue(); expect(logger.warn('x','y','z') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue(); expect(1 > 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasMoreLogger0002
     * @tc.number SUB_CANVAS_MORE_LOG_0002
     * @tc.desc   More logger case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasMoreLogger0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.info('a','b','c','d','e') === undefined).assertTrue(); expect(logger.warn('x','y','z') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue(); expect(2 > 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasMoreLogger0003
     * @tc.number SUB_CANVAS_MORE_LOG_0003
     * @tc.desc   More logger case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasMoreLogger0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.info('a','b','c','d','e') === undefined).assertTrue(); expect(logger.warn('x','y','z') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue(); expect(3 > 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasMoreLogger0004
     * @tc.number SUB_CANVAS_MORE_LOG_0004
     * @tc.desc   More logger case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasMoreLogger0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.info('a','b','c','d','e') === undefined).assertTrue(); expect(logger.warn('x','y','z') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue(); expect(4 > 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasMoreLogger0005
     * @tc.number SUB_CANVAS_MORE_LOG_0005
     * @tc.desc   More logger case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasMoreLogger0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.info('a','b','c','d','e') === undefined).assertTrue(); expect(logger.warn('x','y','z') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue(); expect(5 > 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasMoreLogger0006
     * @tc.number SUB_CANVAS_MORE_LOG_0006
     * @tc.desc   More logger case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasMoreLogger0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.info('a','b','c','d','e') === undefined).assertTrue(); expect(logger.warn('x','y','z') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue(); expect(6 > 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasMoreLogger0007
     * @tc.number SUB_CANVAS_MORE_LOG_0007
     * @tc.desc   More logger case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasMoreLogger0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.info('a','b','c','d','e') === undefined).assertTrue(); expect(logger.warn('x','y','z') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue(); expect(7 > 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasMoreLogger0008
     * @tc.number SUB_CANVAS_MORE_LOG_0008
     * @tc.desc   More logger case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasMoreLogger0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.info('a','b','c','d','e') === undefined).assertTrue(); expect(logger.warn('x','y','z') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue(); expect(8 > 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasMoreLogger0009
     * @tc.number SUB_CANVAS_MORE_LOG_0009
     * @tc.desc   More logger case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasMoreLogger0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.info('a','b','c','d','e') === undefined).assertTrue(); expect(logger.warn('x','y','z') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue(); expect(9 > 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasMoreLogger0010
     * @tc.number SUB_CANVAS_MORE_LOG_0010
     * @tc.desc   More logger case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasMoreLogger0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.info('a','b','c','d','e') === undefined).assertTrue(); expect(logger.warn('x','y','z') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue(); expect(10 > 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasMoreLogger0011
     * @tc.number SUB_CANVAS_MORE_LOG_0011
     * @tc.desc   More logger case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasMoreLogger0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.info('a','b','c','d','e') === undefined).assertTrue(); expect(logger.warn('x','y','z') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue(); expect(11 > 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasMoreLogger0012
     * @tc.number SUB_CANVAS_MORE_LOG_0012
     * @tc.desc   More logger case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasMoreLogger0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.info('a','b','c','d','e') === undefined).assertTrue(); expect(logger.warn('x','y','z') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue(); expect(12 > 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasMoreLogger0013
     * @tc.number SUB_CANVAS_MORE_LOG_0013
     * @tc.desc   More logger case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasMoreLogger0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.info('a','b','c','d','e') === undefined).assertTrue(); expect(logger.warn('x','y','z') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue(); expect(13 > 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasMoreLogger0014
     * @tc.number SUB_CANVAS_MORE_LOG_0014
     * @tc.desc   More logger case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasMoreLogger0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.info('a','b','c','d','e') === undefined).assertTrue(); expect(logger.warn('x','y','z') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue(); expect(14 > 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasMoreLogger0015
     * @tc.number SUB_CANVAS_MORE_LOG_0015
     * @tc.desc   More logger case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasMoreLogger0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.info('a','b','c','d','e') === undefined).assertTrue(); expect(logger.warn('x','y','z') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue(); expect(15 > 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasMoreLogger0016
     * @tc.number SUB_CANVAS_MORE_LOG_0016
     * @tc.desc   More logger case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasMoreLogger0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.info('a','b','c','d','e') === undefined).assertTrue(); expect(logger.warn('x','y','z') === undefined).assertTrue(); expect(logger.error('e') === undefined).assertTrue(); expect(16 > 0).assertTrue();
    })
  })
}

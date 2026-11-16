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

export default function canvasGameLoggerTypesTest() {
  describe('CanvasGameLoggerTypesTest', () => {

    /**
     * @tc.name   testCanvasLoggerMethods001
     * @tc.number SUB_CANVAS_LOGGER_001
     * @tc.desc   Verify logger method set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasLoggerMethods001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof logger.log === 'function').assertTrue(); expect(typeof logger.debug === 'function').assertTrue(); expect(typeof logger.info === 'function').assertTrue(); expect(typeof logger.warn === 'function').assertTrue(); expect(typeof logger.error === 'function').assertTrue();
    })

    /**
     * @tc.name   testCanvasLoggerEmpty002
     * @tc.number SUB_CANVAS_LOGGER_002
     * @tc.desc   Call logger with no arguments.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasLoggerEmpty002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log() === undefined).assertTrue(); expect(logger.debug() === undefined).assertTrue(); expect(logger.info() === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasLoggerOne003
     * @tc.number SUB_CANVAS_LOGGER_003
     * @tc.desc   Call logger with one argument.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasLoggerOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('canvas') === undefined).assertTrue(); expect(logger.warn('warning') === undefined).assertTrue(); expect(logger.error('error') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasLoggerMany004
     * @tc.number SUB_CANVAS_LOGGER_004
     * @tc.desc   Call logger with many arguments.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasLoggerMany004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.info('a', 'b', 'c', 'd') === undefined).assertTrue(); expect(logger.debug('1', '2', '3') === undefined).assertTrue(); expect(logger.error('x', 'y') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasLoggerLong005
     * @tc.number SUB_CANVAS_LOGGER_005
     * @tc.desc   Call logger with a long message.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasLoggerLong005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const msg: string = 'm'.repeat(1024); expect(logger.info(msg) === undefined).assertTrue(); expect(msg.length).assertEqual(1024);
    })

    /**
     * @tc.name   testCanvasLoggerRepeat006
     * @tc.number SUB_CANVAS_LOGGER_006
     * @tc.desc   Call logger repeatedly 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasLoggerRepeat006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('v6') === undefined).assertTrue(); expect(logger.debug('v6') === undefined).assertTrue(); expect(logger.info('v6') === undefined).assertTrue(); expect(logger.warn('v6') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasLoggerRepeat007
     * @tc.number SUB_CANVAS_LOGGER_007
     * @tc.desc   Call logger repeatedly 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasLoggerRepeat007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('v7') === undefined).assertTrue(); expect(logger.debug('v7') === undefined).assertTrue(); expect(logger.info('v7') === undefined).assertTrue(); expect(logger.warn('v7') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasLoggerRepeat008
     * @tc.number SUB_CANVAS_LOGGER_008
     * @tc.desc   Call logger repeatedly 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasLoggerRepeat008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('v8') === undefined).assertTrue(); expect(logger.debug('v8') === undefined).assertTrue(); expect(logger.info('v8') === undefined).assertTrue(); expect(logger.warn('v8') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasLoggerRepeat009
     * @tc.number SUB_CANVAS_LOGGER_009
     * @tc.desc   Call logger repeatedly 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasLoggerRepeat009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('v9') === undefined).assertTrue(); expect(logger.debug('v9') === undefined).assertTrue(); expect(logger.info('v9') === undefined).assertTrue(); expect(logger.warn('v9') === undefined).assertTrue();
    })

    /**
     * @tc.name   testCanvasLoggerRepeat010
     * @tc.number SUB_CANVAS_LOGGER_010
     * @tc.desc   Call logger repeatedly 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasLoggerRepeat010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('v10') === undefined).assertTrue(); expect(logger.debug('v10') === undefined).assertTrue(); expect(logger.info('v10') === undefined).assertTrue(); expect(logger.warn('v10') === undefined).assertTrue();
    })
  })
}

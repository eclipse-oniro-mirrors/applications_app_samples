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
import { hilog } from '@kit.PerformanceAnalysisKit';
import logger from '../../../main/ets/model/Logger';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasLoggerMethods001 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof logger.log === \'function\').assertTrue();');
      expect(typeof logger.log === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof logger.debug === \'function\').assertTrue();');
        expect(typeof logger.debug === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof logger.info === \'function\').assertTrue();');
        expect(typeof logger.info === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof logger.warn === \'function\').assertTrue();');
        expect(typeof logger.warn === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof logger.error === \'function\').assertTrue();');
        expect(typeof logger.error === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasLoggerMethods001 end');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasLoggerEmpty002 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log() === undefined).assertTrue();');
      expect(logger.log() === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.debug() === undefined).assertTrue();');
        expect(logger.debug() === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info() === undefined).assertTrue();');
        expect(logger.info() === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasLoggerEmpty002 end');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasLoggerOne003 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'canvas\') === undefined).assertTrue();');
      expect(logger.log('canvas') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'warning\') === undefined).assertTrue();');
        expect(logger.warn('warning') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.error(\'error\') === undefined).assertTrue();');
        expect(logger.error('error') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasLoggerOne003 end');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasLoggerMany004 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(\'a\', \'b\', \'c\', \'d\') === undefined).assertTrue();');
      expect(logger.info('a', 'b', 'c', 'd') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.debug(\'1\', \'2\', \'3\') === undefined).assertTrue();');
        expect(logger.debug('1', '2', '3') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.error(\'x\', \'y\') === undefined).assertTrue();');
        expect(logger.error('x', 'y') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasLoggerMany004 end');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasLoggerLong005 begin');
      const msg: string = 'm'.repeat(1024);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(msg) === undefined).assertTrue();');
        expect(logger.info(msg) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(msg.length).assertEqual(1024);');
        expect(msg.length).assertEqual(1024);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasLoggerLong005 end');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasLoggerRepeat006 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'v6\') === undefined).assertTrue();');
      expect(logger.log('v6') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.debug(\'v6\') === undefined).assertTrue();');
        expect(logger.debug('v6') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(\'v6\') === undefined).assertTrue();');
        expect(logger.info('v6') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'v6\') === undefined).assertTrue();');
        expect(logger.warn('v6') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasLoggerRepeat006 end');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasLoggerRepeat007 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'v7\') === undefined).assertTrue();');
      expect(logger.log('v7') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.debug(\'v7\') === undefined).assertTrue();');
        expect(logger.debug('v7') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(\'v7\') === undefined).assertTrue();');
        expect(logger.info('v7') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'v7\') === undefined).assertTrue();');
        expect(logger.warn('v7') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasLoggerRepeat007 end');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasLoggerRepeat008 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'v8\') === undefined).assertTrue();');
      expect(logger.log('v8') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.debug(\'v8\') === undefined).assertTrue();');
        expect(logger.debug('v8') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(\'v8\') === undefined).assertTrue();');
        expect(logger.info('v8') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'v8\') === undefined).assertTrue();');
        expect(logger.warn('v8') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasLoggerRepeat008 end');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasLoggerRepeat009 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'v9\') === undefined).assertTrue();');
      expect(logger.log('v9') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.debug(\'v9\') === undefined).assertTrue();');
        expect(logger.debug('v9') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(\'v9\') === undefined).assertTrue();');
        expect(logger.info('v9') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'v9\') === undefined).assertTrue();');
        expect(logger.warn('v9') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasLoggerRepeat009 end');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasLoggerRepeat010 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.log(\'v10\') === undefined).assertTrue();');
      expect(logger.log('v10') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.debug(\'v10\') === undefined).assertTrue();');
        expect(logger.debug('v10') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(\'v10\') === undefined).assertTrue();');
        expect(logger.info('v10') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(\'v10\') === undefined).assertTrue();');
        expect(logger.warn('v10') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasLoggerRepeat010 end');
    })
  })
}

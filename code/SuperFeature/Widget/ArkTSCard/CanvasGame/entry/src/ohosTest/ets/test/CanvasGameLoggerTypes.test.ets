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
     * @tc.name   com.samples.canvasgame_LoggerTypes_0001
     * @tc.number SUB_CANVAS_LOGGER_001
     * @tc.desc   Verify logger method set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_LoggerTypes_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerTypes_0001 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof logger.log === 'function'));
      expect(typeof logger.log === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof logger.debug === 'function'));
        expect(typeof logger.debug === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof logger.info === 'function'));
        expect(typeof logger.info === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof logger.warn === 'function'));
        expect(typeof logger.warn === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof logger.error === 'function'));
        expect(typeof logger.error === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerTypes_0001 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_LoggerTypes_0002
     * @tc.number SUB_CANVAS_LOGGER_002
     * @tc.desc   Call logger with no arguments.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_LoggerTypes_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerTypes_0002 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.log() === undefined));
      expect(logger.log() === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.debug() === undefined));
        expect(logger.debug() === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info() === undefined));
        expect(logger.info() === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerTypes_0002 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_LoggerTypes_0003
     * @tc.number SUB_CANVAS_LOGGER_003
     * @tc.desc   Call logger with one argument.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_LoggerTypes_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerTypes_0003 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.log('canvas') === undefined));
      expect(logger.log('canvas') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.warn('warning') === undefined));
        expect(logger.warn('warning') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.error('error') === undefined));
        expect(logger.error('error') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerTypes_0003 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_LoggerTypes_0004
     * @tc.number SUB_CANVAS_LOGGER_004
     * @tc.desc   Call logger with many arguments.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_LoggerTypes_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerTypes_0004 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info('a', 'b', 'c', 'd') === undefined));
      expect(logger.info('a', 'b', 'c', 'd') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.debug('1', '2', '3') === undefined));
        expect(logger.debug('1', '2', '3') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.error('x', 'y') === undefined));
        expect(logger.error('x', 'y') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerTypes_0004 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_LoggerTypes_0005
     * @tc.number SUB_CANVAS_LOGGER_005
     * @tc.desc   Call logger with a long message.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_LoggerTypes_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerTypes_0005 begin');
      const msg: string = 'm'.repeat(1024);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(msg) === undefined));
        expect(logger.info(msg) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(msg.length), String(1024));
        expect(msg.length).assertEqual(1024);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerTypes_0005 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_LoggerTypes_0006
     * @tc.number SUB_CANVAS_LOGGER_006
     * @tc.desc   Call logger repeatedly 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_LoggerTypes_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerTypes_0006 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.log('v6') === undefined));
      expect(logger.log('v6') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.debug('v6') === undefined));
        expect(logger.debug('v6') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info('v6') === undefined));
        expect(logger.info('v6') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.warn('v6') === undefined));
        expect(logger.warn('v6') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerTypes_0006 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_LoggerTypes_0007
     * @tc.number SUB_CANVAS_LOGGER_007
     * @tc.desc   Call logger repeatedly 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_LoggerTypes_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerTypes_0007 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.log('v7') === undefined));
      expect(logger.log('v7') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.debug('v7') === undefined));
        expect(logger.debug('v7') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info('v7') === undefined));
        expect(logger.info('v7') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.warn('v7') === undefined));
        expect(logger.warn('v7') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerTypes_0007 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_LoggerTypes_0008
     * @tc.number SUB_CANVAS_LOGGER_008
     * @tc.desc   Call logger repeatedly 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_LoggerTypes_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerTypes_0008 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.log('value-8') === undefined));
      expect(logger.log('value-8') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.debug('value-8') === undefined));
        expect(logger.debug('value-8') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info('value-8') === undefined));
        expect(logger.info('value-8') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.warn('value-8') === undefined));
        expect(logger.warn('value-8') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerTypes_0008 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_LoggerTypes_0009
     * @tc.number SUB_CANVAS_LOGGER_009
     * @tc.desc   Call logger repeatedly 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_LoggerTypes_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerTypes_0009 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.log('v9') === undefined));
      expect(logger.log('v9') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.debug('v9') === undefined));
        expect(logger.debug('v9') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info('v9') === undefined));
        expect(logger.info('v9') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.warn('v9') === undefined));
        expect(logger.warn('v9') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerTypes_0009 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_LoggerTypes_0010
     * @tc.number SUB_CANVAS_LOGGER_010
     * @tc.desc   Call logger repeatedly 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_LoggerTypes_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerTypes_0010 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.log('v10') === undefined));
      expect(logger.log('v10') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.debug('v10') === undefined));
        expect(logger.debug('v10') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info('v10') === undefined));
        expect(logger.info('v10') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.warn('v10') === undefined));
        expect(logger.warn('v10') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerTypes_0010 end');
    })
  })
}

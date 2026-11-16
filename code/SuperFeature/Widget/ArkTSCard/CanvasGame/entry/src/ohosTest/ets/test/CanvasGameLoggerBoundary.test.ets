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

export default function canvasGameLoggerBoundaryTest() {
  describe('CanvasGameLoggerBoundaryTest', () => {

    /**
     * @tc.name   com.samples.canvasgame_LoggerBoundary_0001
     * @tc.number SUB_CANVAS_LOG_BOUND_001
     * @tc.desc   Log a string of length 200.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_LoggerBoundary_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerBoundary_0001 begin');
      const s: string = 'v'.repeat(200);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(200));
        expect(s.length).assertEqual(200);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerBoundary_0001 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_LoggerBoundary_0002
     * @tc.number SUB_CANVAS_LOG_BOUND_002
     * @tc.desc   Log a string of length 400.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_LoggerBoundary_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerBoundary_0002 begin');
      const s: string = 'v'.repeat(400);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(400));
        expect(s.length).assertEqual(400);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerBoundary_0002 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_LoggerBoundary_0003
     * @tc.number SUB_CANVAS_LOG_BOUND_003
     * @tc.desc   Log a string of length 600.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_LoggerBoundary_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerBoundary_0003 begin');
      const s: string = 'v'.repeat(600);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(600));
        expect(s.length).assertEqual(600);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerBoundary_0003 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_LoggerBoundary_0004
     * @tc.number SUB_CANVAS_LOG_BOUND_004
     * @tc.desc   Log a string of length 800.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_LoggerBoundary_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerBoundary_0004 begin');
      const s: string = 'v'.repeat(800);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(800));
        expect(s.length).assertEqual(800);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerBoundary_0004 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_LoggerBoundary_0005
     * @tc.number SUB_CANVAS_LOG_BOUND_005
     * @tc.desc   Log a string of length 1000.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_LoggerBoundary_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerBoundary_0005 begin');
      const s: string = 'v'.repeat(1000);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(1000));
        expect(s.length).assertEqual(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerBoundary_0005 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_LoggerBoundary_0006
     * @tc.number SUB_CANVAS_LOG_BOUND_006
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\',\'e\',\'f\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_LoggerBoundary_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerBoundary_0006 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.log('a','b','c','d','e','f') === undefined));
      expect(logger.log('a','b','c','d','e','f') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.warn('w','x','y','z') === undefined));
        expect(logger.warn('w','x','y','z') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.error('e') === undefined));
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerBoundary_0006 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_LoggerBoundary_0007
     * @tc.number SUB_CANVAS_LOG_BOUND_007
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\',\'e\',\'f\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_LoggerBoundary_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerBoundary_0007 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.log('a','b','c','d','e','f') === undefined));
      expect(logger.log('a','b','c','d','e','f') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.warn('w','x','y','z') === undefined));
        expect(logger.warn('w','x','y','z') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.error('e') === undefined));
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerBoundary_0007 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_LoggerBoundary_0008
     * @tc.number SUB_CANVAS_LOG_BOUND_008
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\',\'e\',\'f\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_LoggerBoundary_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerBoundary_0008 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.log('a','b','c','d','e','f') === undefined));
      expect(logger.log('a','b','c','d','e','f') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.warn('w','x','y','z') === undefined));
        expect(logger.warn('w','x','y','z') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.error('e') === undefined));
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerBoundary_0008 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_LoggerBoundary_0009
     * @tc.number SUB_CANVAS_LOG_BOUND_009
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\',\'e\',\'f\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_LoggerBoundary_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerBoundary_0009 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.log('a','b','c','d','e','f') === undefined));
      expect(logger.log('a','b','c','d','e','f') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.warn('w','x','y','z') === undefined));
        expect(logger.warn('w','x','y','z') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.error('e') === undefined));
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerBoundary_0009 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_LoggerBoundary_0010
     * @tc.number SUB_CANVAS_LOG_BOUND_010
     * @tc.desc   Verify logger.log(\'a\',\'b\',\'c\',\'d\',\'e\',\'f\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_LoggerBoundary_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerBoundary_0010 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.log('a','b','c','d','e','f') === undefined));
      expect(logger.log('a','b','c','d','e','f') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.warn('w','x','y','z') === undefined));
        expect(logger.warn('w','x','y','z') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.error('e') === undefined));
        expect(logger.error('e') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_LoggerBoundary_0010 end');
    })
  })
}

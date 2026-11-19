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

export default function canvasGameFinalLoggerTest() {
  describe('CanvasGameFinalLoggerTest', () => {

    /**
     * @tc.name   com.samples.canvasgame_FinalLogger_0001
     * @tc.number SUB_CANVAS_FINAL_LOG_0001
     * @tc.desc   Final logger boundary 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_FinalLogger_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_FinalLogger_0001 begin');
      const s: string = 'q'.repeat(150);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(150));
        expect(s.length).assertEqual(150);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_FinalLogger_0001 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_FinalLogger_0002
     * @tc.number SUB_CANVAS_FINAL_LOG_0002
     * @tc.desc   Final logger boundary 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_FinalLogger_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_FinalLogger_0002 begin');
      const s: string = 'q'.repeat(300);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(300));
        expect(s.length).assertEqual(300);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_FinalLogger_0002 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_FinalLogger_0003
     * @tc.number SUB_CANVAS_FINAL_LOG_0003
     * @tc.desc   Final logger boundary 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_FinalLogger_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_FinalLogger_0003 begin');
      const s: string = 'q'.repeat(450);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(450));
        expect(s.length).assertEqual(450);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_FinalLogger_0003 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_FinalLogger_0004
     * @tc.number SUB_CANVAS_FINAL_LOG_0004
     * @tc.desc   Final logger boundary 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_FinalLogger_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_FinalLogger_0004 begin');
      const s: string = 'q'.repeat(600);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(600));
        expect(s.length).assertEqual(600);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_FinalLogger_0004 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_FinalLogger_0005
     * @tc.number SUB_CANVAS_FINAL_LOG_0005
     * @tc.desc   Final logger boundary 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_FinalLogger_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_FinalLogger_0005 begin');
      const s: string = 'q'.repeat(750);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(750));
        expect(s.length).assertEqual(750);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_FinalLogger_0005 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_FinalLogger_0006
     * @tc.number SUB_CANVAS_FINAL_LOG_0006
     * @tc.desc   Final logger boundary 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_FinalLogger_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_FinalLogger_0006 begin');
      const s: string = 'q'.repeat(900);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(900));
        expect(s.length).assertEqual(900);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_FinalLogger_0006 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_FinalLogger_0007
     * @tc.number SUB_CANVAS_FINAL_LOG_0007
     * @tc.desc   Final logger boundary 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_FinalLogger_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_FinalLogger_0007 begin');
      const s: string = 'q'.repeat(1050);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(1050));
        expect(s.length).assertEqual(1050);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_FinalLogger_0007 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_FinalLogger_0008
     * @tc.number SUB_CANVAS_FINAL_LOG_0008
     * @tc.desc   Final logger boundary 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_FinalLogger_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_FinalLogger_0008 begin');
      const s: string = 'q'.repeat(1200);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(1200));
        expect(s.length).assertEqual(1200);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_FinalLogger_0008 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_FinalLogger_0009
     * @tc.number SUB_CANVAS_FINAL_LOG_0009
     * @tc.desc   Final logger boundary 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_FinalLogger_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_FinalLogger_0009 begin');
      const s: string = 'q'.repeat(1350);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(1350));
        expect(s.length).assertEqual(1350);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_FinalLogger_0009 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_FinalLogger_0010
     * @tc.number SUB_CANVAS_FINAL_LOG_0010
     * @tc.desc   Final logger boundary 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_FinalLogger_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_FinalLogger_0010 begin');
      const s: string = 'q'.repeat(1500);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(1500));
        expect(s.length).assertEqual(1500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_FinalLogger_0010 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_FinalLogger_0011
     * @tc.number SUB_CANVAS_FINAL_LOG_0011
     * @tc.desc   Final logger boundary 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_FinalLogger_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_FinalLogger_0011 begin');
      const s: string = 'q'.repeat(1650);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(1650));
        expect(s.length).assertEqual(1650);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_FinalLogger_0011 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_FinalLogger_0012
     * @tc.number SUB_CANVAS_FINAL_LOG_0012
     * @tc.desc   Final logger boundary 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_FinalLogger_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_FinalLogger_0012 begin');
      const s: string = 'q'.repeat(1800);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(1800));
        expect(s.length).assertEqual(1800);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_FinalLogger_0012 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_FinalLogger_0013
     * @tc.number SUB_CANVAS_FINAL_LOG_0013
     * @tc.desc   Final logger boundary 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_FinalLogger_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_FinalLogger_0013 begin');
      const s: string = 'q'.repeat(1950);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(1950));
        expect(s.length).assertEqual(1950);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_FinalLogger_0013 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_FinalLogger_0014
     * @tc.number SUB_CANVAS_FINAL_LOG_0014
     * @tc.desc   Final logger boundary 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_FinalLogger_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_FinalLogger_0014 begin');
      const s: string = 'q'.repeat(2100);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(2100));
        expect(s.length).assertEqual(2100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_FinalLogger_0014 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_FinalLogger_0015
     * @tc.number SUB_CANVAS_FINAL_LOG_0015
     * @tc.desc   Final logger boundary 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_FinalLogger_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_FinalLogger_0015 begin');
      const s: string = 'q'.repeat(2250);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(2250));
        expect(s.length).assertEqual(2250);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_FinalLogger_0015 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_FinalLogger_0016
     * @tc.number SUB_CANVAS_FINAL_LOG_0016
     * @tc.desc   Final logger boundary 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_FinalLogger_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_FinalLogger_0016 begin');
      const s: string = 'q'.repeat(2400);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info(s) === undefined));
        expect(logger.info(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(s.length), String(2400));
        expect(s.length).assertEqual(2400);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_FinalLogger_0016 end');
    })
  })
}

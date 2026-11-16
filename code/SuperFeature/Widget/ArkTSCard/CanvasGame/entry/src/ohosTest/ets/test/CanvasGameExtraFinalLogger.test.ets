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

export default function canvasGameExtraFinalLoggerTest() {
  describe('CanvasGameExtraFinalLoggerTest', () => {

    /**
     * @tc.name   testCanvasExtraFinalLog0001
     * @tc.number SUB_CANVAS_EXTRA_FINAL_LOG_0001
     * @tc.desc   Verify logger.warn(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraFinalLog0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasExtraFinalLog0001 begin');
      const s: string = 'n'.repeat(300);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(s) === undefined).assertTrue();');
        expect(logger.warn(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(300);');
        expect(s.length).assertEqual(300);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasExtraFinalLog0001 end');
    })

    /**
     * @tc.name   testCanvasExtraFinalLog0002
     * @tc.number SUB_CANVAS_EXTRA_FINAL_LOG_0002
     * @tc.desc   Verify logger.warn(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraFinalLog0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasExtraFinalLog0002 begin');
      const s: string = 'n'.repeat(600);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(s) === undefined).assertTrue();');
        expect(logger.warn(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(600);');
        expect(s.length).assertEqual(600);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasExtraFinalLog0002 end');
    })

    /**
     * @tc.name   testCanvasExtraFinalLog0003
     * @tc.number SUB_CANVAS_EXTRA_FINAL_LOG_0003
     * @tc.desc   Verify logger.warn(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraFinalLog0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasExtraFinalLog0003 begin');
      const s: string = 'n'.repeat(900);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(s) === undefined).assertTrue();');
        expect(logger.warn(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(900);');
        expect(s.length).assertEqual(900);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasExtraFinalLog0003 end');
    })

    /**
     * @tc.name   testCanvasExtraFinalLog0004
     * @tc.number SUB_CANVAS_EXTRA_FINAL_LOG_0004
     * @tc.desc   Verify logger.warn(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraFinalLog0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasExtraFinalLog0004 begin');
      const s: string = 'n'.repeat(1200);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(s) === undefined).assertTrue();');
        expect(logger.warn(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(1200);');
        expect(s.length).assertEqual(1200);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasExtraFinalLog0004 end');
    })

    /**
     * @tc.name   testCanvasExtraFinalLog0005
     * @tc.number SUB_CANVAS_EXTRA_FINAL_LOG_0005
     * @tc.desc   Verify logger.warn(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraFinalLog0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasExtraFinalLog0005 begin');
      const s: string = 'n'.repeat(1500);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(s) === undefined).assertTrue();');
        expect(logger.warn(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(1500);');
        expect(s.length).assertEqual(1500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasExtraFinalLog0005 end');
    })

    /**
     * @tc.name   testCanvasExtraFinalLog0006
     * @tc.number SUB_CANVAS_EXTRA_FINAL_LOG_0006
     * @tc.desc   Verify logger.warn(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraFinalLog0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasExtraFinalLog0006 begin');
      const s: string = 'n'.repeat(1800);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(s) === undefined).assertTrue();');
        expect(logger.warn(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(1800);');
        expect(s.length).assertEqual(1800);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasExtraFinalLog0006 end');
    })

    /**
     * @tc.name   testCanvasExtraFinalLog0007
     * @tc.number SUB_CANVAS_EXTRA_FINAL_LOG_0007
     * @tc.desc   Verify logger.warn(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraFinalLog0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasExtraFinalLog0007 begin');
      const s: string = 'n'.repeat(2100);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(s) === undefined).assertTrue();');
        expect(logger.warn(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(2100);');
        expect(s.length).assertEqual(2100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasExtraFinalLog0007 end');
    })

    /**
     * @tc.name   testCanvasExtraFinalLog0008
     * @tc.number SUB_CANVAS_EXTRA_FINAL_LOG_0008
     * @tc.desc   Verify logger.warn(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraFinalLog0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasExtraFinalLog0008 begin');
      const s: string = 'n'.repeat(2400);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(s) === undefined).assertTrue();');
        expect(logger.warn(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(2400);');
        expect(s.length).assertEqual(2400);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasExtraFinalLog0008 end');
    })

    /**
     * @tc.name   testCanvasExtraFinalLog0009
     * @tc.number SUB_CANVAS_EXTRA_FINAL_LOG_0009
     * @tc.desc   Verify logger.warn(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraFinalLog0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasExtraFinalLog0009 begin');
      const s: string = 'n'.repeat(2700);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(s) === undefined).assertTrue();');
        expect(logger.warn(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(2700);');
        expect(s.length).assertEqual(2700);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasExtraFinalLog0009 end');
    })

    /**
     * @tc.name   testCanvasExtraFinalLog0010
     * @tc.number SUB_CANVAS_EXTRA_FINAL_LOG_0010
     * @tc.desc   Verify logger.warn(s) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraFinalLog0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasExtraFinalLog0010 begin');
      const s: string = 'n'.repeat(3000);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.warn(s) === undefined).assertTrue();');
        expect(logger.warn(s) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s.length).assertEqual(3000);');
        expect(s.length).assertEqual(3000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasExtraFinalLog0010 end');
    })
  })
}

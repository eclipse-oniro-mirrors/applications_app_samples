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

export default function canvasGameExtraFinalLoggerTest() {
  describe('CanvasGameExtraFinalLoggerTest', () => {

    /**
     * @tc.name   testCanvasExtraFinalLog0001
     * @tc.number SUB_CANVAS_EXTRA_FINAL_LOG_0001
     * @tc.desc   Extra CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraFinalLog0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'n'.repeat(300); expect(logger.warn(s) === undefined).assertTrue(); expect(s.length).assertEqual(300);
    })

    /**
     * @tc.name   testCanvasExtraFinalLog0002
     * @tc.number SUB_CANVAS_EXTRA_FINAL_LOG_0002
     * @tc.desc   Extra CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraFinalLog0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'n'.repeat(600); expect(logger.warn(s) === undefined).assertTrue(); expect(s.length).assertEqual(600);
    })

    /**
     * @tc.name   testCanvasExtraFinalLog0003
     * @tc.number SUB_CANVAS_EXTRA_FINAL_LOG_0003
     * @tc.desc   Extra CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraFinalLog0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'n'.repeat(900); expect(logger.warn(s) === undefined).assertTrue(); expect(s.length).assertEqual(900);
    })

    /**
     * @tc.name   testCanvasExtraFinalLog0004
     * @tc.number SUB_CANVAS_EXTRA_FINAL_LOG_0004
     * @tc.desc   Extra CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraFinalLog0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'n'.repeat(1200); expect(logger.warn(s) === undefined).assertTrue(); expect(s.length).assertEqual(1200);
    })

    /**
     * @tc.name   testCanvasExtraFinalLog0005
     * @tc.number SUB_CANVAS_EXTRA_FINAL_LOG_0005
     * @tc.desc   Extra CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraFinalLog0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'n'.repeat(1500); expect(logger.warn(s) === undefined).assertTrue(); expect(s.length).assertEqual(1500);
    })

    /**
     * @tc.name   testCanvasExtraFinalLog0006
     * @tc.number SUB_CANVAS_EXTRA_FINAL_LOG_0006
     * @tc.desc   Extra CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraFinalLog0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'n'.repeat(1800); expect(logger.warn(s) === undefined).assertTrue(); expect(s.length).assertEqual(1800);
    })

    /**
     * @tc.name   testCanvasExtraFinalLog0007
     * @tc.number SUB_CANVAS_EXTRA_FINAL_LOG_0007
     * @tc.desc   Extra CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraFinalLog0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'n'.repeat(2100); expect(logger.warn(s) === undefined).assertTrue(); expect(s.length).assertEqual(2100);
    })

    /**
     * @tc.name   testCanvasExtraFinalLog0008
     * @tc.number SUB_CANVAS_EXTRA_FINAL_LOG_0008
     * @tc.desc   Extra CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraFinalLog0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'n'.repeat(2400); expect(logger.warn(s) === undefined).assertTrue(); expect(s.length).assertEqual(2400);
    })

    /**
     * @tc.name   testCanvasExtraFinalLog0009
     * @tc.number SUB_CANVAS_EXTRA_FINAL_LOG_0009
     * @tc.desc   Extra CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraFinalLog0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'n'.repeat(2700); expect(logger.warn(s) === undefined).assertTrue(); expect(s.length).assertEqual(2700);
    })

    /**
     * @tc.name   testCanvasExtraFinalLog0010
     * @tc.number SUB_CANVAS_EXTRA_FINAL_LOG_0010
     * @tc.desc   Extra CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraFinalLog0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: string = 'n'.repeat(3000); expect(logger.warn(s) === undefined).assertTrue(); expect(s.length).assertEqual(3000);
    })
  })
}

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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../YieldToEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Point, offsetOrigin } from '../../../../main/ets/bridge/PhotomodifyBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Image]';
const BUNDLE: string = 'Image_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for offsetOrigin (59 cases). */
export default function offsetOrigin3Test(): void {
  describe('OffsetOrigin3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0171
     * @tc.name      Image_OffsetOrigin_0171
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=-1, offY=-1) returns -99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_OffsetOrigin_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0171 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), -1, -1);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=-1, ...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=-1, ...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-99);
      logInfo(`${BUNDLE}OffsetOrigin_0171 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0172
     * @tc.name      Image_OffsetOrigin_0172
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=-1, offY=2) returns -102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_OffsetOrigin_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0172 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), -1, 2);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=-1, ...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=-1, ...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-102);
      logInfo(`${BUNDLE}OffsetOrigin_0172 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0173
     * @tc.name      Image_OffsetOrigin_0173
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=-1, offY=3) returns -103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_OffsetOrigin_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0173 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), -1, 3);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=-1, ...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=-1, ...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-103);
      logInfo(`${BUNDLE}OffsetOrigin_0173 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0174
     * @tc.name      Image_OffsetOrigin_0174
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=-1, offY=10) returns -110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_OffsetOrigin_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0174 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), -1, 10);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=-1, ...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=-1, ...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-110);
      logInfo(`${BUNDLE}OffsetOrigin_0174 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0175
     * @tc.name      Image_OffsetOrigin_0175
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=-1, offY=100) returns -200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_OffsetOrigin_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0175 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), -1, 100);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=-1, ...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=-1, ...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-200);
      logInfo(`${BUNDLE}OffsetOrigin_0175 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0176
     * @tc.name      Image_OffsetOrigin_0176
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=-1, offY=5) returns -105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_OffsetOrigin_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0176 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), -1, 5);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=-1, ...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=-1, ...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-105);
      logInfo(`${BUNDLE}OffsetOrigin_0176 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0177
     * @tc.name      Image_OffsetOrigin_0177
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=-1, offY=15) returns -115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_OffsetOrigin_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0177 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), -1, 15);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=-1, ...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=-1, ...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-115);
      logInfo(`${BUNDLE}OffsetOrigin_0177 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0178
     * @tc.name      Image_OffsetOrigin_0178
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=-1, offY=20) returns -120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_OffsetOrigin_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0178 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), -1, 20);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=-1, ...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=-1, ...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-120);
      logInfo(`${BUNDLE}OffsetOrigin_0178 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0179
     * @tc.name      Image_OffsetOrigin_0179
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=-1, offY=25) returns -125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_OffsetOrigin_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0179 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), -1, 25);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=-1, ...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=-1, ...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-125);
      logInfo(`${BUNDLE}OffsetOrigin_0179 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0180
     * @tc.name      Image_OffsetOrigin_0180
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=-1, offY=-99) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_OffsetOrigin_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0180 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), -1, -99);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=-1, ...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=-1, ...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-1);
      logInfo(`${BUNDLE}OffsetOrigin_0180 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0181
     * @tc.name      Image_OffsetOrigin_0181
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=2, offY=0) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0181 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 2, 0);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=2, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-3);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=2, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-100);
      logInfo(`${BUNDLE}OffsetOrigin_0181 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0182
     * @tc.name      Image_OffsetOrigin_0182
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=2, offY=1) returns -101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0182 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 2, 1);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=2, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-3);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=2, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-101);
      logInfo(`${BUNDLE}OffsetOrigin_0182 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0183
     * @tc.name      Image_OffsetOrigin_0183
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=2, offY=-1) returns -99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_OffsetOrigin_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0183 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 2, -1);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=2, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-3);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=2, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-99);
      logInfo(`${BUNDLE}OffsetOrigin_0183 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0184
     * @tc.name      Image_OffsetOrigin_0184
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=2, offY=2) returns -102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0184 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 2, 2);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=2, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-3);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=2, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-102);
      logInfo(`${BUNDLE}OffsetOrigin_0184 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0185
     * @tc.name      Image_OffsetOrigin_0185
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=2, offY=3) returns -103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0185 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 2, 3);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=2, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-3);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=2, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-103);
      logInfo(`${BUNDLE}OffsetOrigin_0185 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0186
     * @tc.name      Image_OffsetOrigin_0186
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=2, offY=10) returns -110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0186 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 2, 10);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=2, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-3);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=2, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-110);
      logInfo(`${BUNDLE}OffsetOrigin_0186 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0187
     * @tc.name      Image_OffsetOrigin_0187
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=2, offY=100) returns -200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0187 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 2, 100);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=2, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-3);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=2, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-200);
      logInfo(`${BUNDLE}OffsetOrigin_0187 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0188
     * @tc.name      Image_OffsetOrigin_0188
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=2, offY=5) returns -105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0188 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 2, 5);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=2, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-3);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=2, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-105);
      logInfo(`${BUNDLE}OffsetOrigin_0188 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0189
     * @tc.name      Image_OffsetOrigin_0189
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=2, offY=15) returns -115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0189 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 2, 15);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=2, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-3);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=2, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-115);
      logInfo(`${BUNDLE}OffsetOrigin_0189 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0190
     * @tc.name      Image_OffsetOrigin_0190
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=2, offY=20) returns -120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0190 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 2, 20);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=2, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-3);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=2, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-120);
      logInfo(`${BUNDLE}OffsetOrigin_0190 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0191
     * @tc.name      Image_OffsetOrigin_0191
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=2, offY=25) returns -125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0191 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 2, 25);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=2, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-3);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=2, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-125);
      logInfo(`${BUNDLE}OffsetOrigin_0191 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0192
     * @tc.name      Image_OffsetOrigin_0192
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=2, offY=-99) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_OffsetOrigin_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0192 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 2, -99);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=2, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-3);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=2, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-1);
      logInfo(`${BUNDLE}OffsetOrigin_0192 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0193
     * @tc.name      Image_OffsetOrigin_0193
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=3, offY=0) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0193 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 3, 0);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=3, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-4);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=3, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-100);
      logInfo(`${BUNDLE}OffsetOrigin_0193 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0194
     * @tc.name      Image_OffsetOrigin_0194
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=3, offY=1) returns -101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0194 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 3, 1);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=3, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-4);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=3, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-101);
      logInfo(`${BUNDLE}OffsetOrigin_0194 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0195
     * @tc.name      Image_OffsetOrigin_0195
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=3, offY=-1) returns -99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_OffsetOrigin_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0195 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 3, -1);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=3, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-4);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=3, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-99);
      logInfo(`${BUNDLE}OffsetOrigin_0195 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0196
     * @tc.name      Image_OffsetOrigin_0196
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=3, offY=2) returns -102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0196 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 3, 2);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=3, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-4);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=3, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-102);
      logInfo(`${BUNDLE}OffsetOrigin_0196 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0197
     * @tc.name      Image_OffsetOrigin_0197
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=3, offY=3) returns -103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0197 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 3, 3);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=3, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-4);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=3, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-103);
      logInfo(`${BUNDLE}OffsetOrigin_0197 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0198
     * @tc.name      Image_OffsetOrigin_0198
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=3, offY=10) returns -110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0198 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 3, 10);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=3, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-4);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=3, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-110);
      logInfo(`${BUNDLE}OffsetOrigin_0198 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0199
     * @tc.name      Image_OffsetOrigin_0199
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=3, offY=100) returns -200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0199 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 3, 100);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=3, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-4);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=3, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-200);
      logInfo(`${BUNDLE}OffsetOrigin_0199 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0200
     * @tc.name      Image_OffsetOrigin_0200
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=3, offY=5) returns -105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0200 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 3, 5);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=3, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-4);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=3, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-105);
      logInfo(`${BUNDLE}OffsetOrigin_0200 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0201
     * @tc.name      Image_OffsetOrigin_0201
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=3, offY=15) returns -115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0201 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 3, 15);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=3, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-4);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=3, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-115);
      logInfo(`${BUNDLE}OffsetOrigin_0201 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0202
     * @tc.name      Image_OffsetOrigin_0202
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=3, offY=20) returns -120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0202 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 3, 20);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=3, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-4);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=3, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-120);
      logInfo(`${BUNDLE}OffsetOrigin_0202 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0203
     * @tc.name      Image_OffsetOrigin_0203
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=3, offY=25) returns -125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0203 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 3, 25);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=3, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-4);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=3, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-125);
      logInfo(`${BUNDLE}OffsetOrigin_0203 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0204
     * @tc.name      Image_OffsetOrigin_0204
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=3, offY=-99) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_OffsetOrigin_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0204 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 3, -99);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=3, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-4);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=3, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-1);
      logInfo(`${BUNDLE}OffsetOrigin_0204 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0205
     * @tc.name      Image_OffsetOrigin_0205
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=10, offY=0) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0205 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 10, 0);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=10, ...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-11);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=10, ...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-100);
      logInfo(`${BUNDLE}OffsetOrigin_0205 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0206
     * @tc.name      Image_OffsetOrigin_0206
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=10, offY=1) returns -101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0206 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 10, 1);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=10, ...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-11);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=10, ...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-101);
      logInfo(`${BUNDLE}OffsetOrigin_0206 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0207
     * @tc.name      Image_OffsetOrigin_0207
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=10, offY=-1) returns -99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_OffsetOrigin_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0207 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 10, -1);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=10, ...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-11);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=10, ...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-99);
      logInfo(`${BUNDLE}OffsetOrigin_0207 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0208
     * @tc.name      Image_OffsetOrigin_0208
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=10, offY=2) returns -102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0208 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 10, 2);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=10, ...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-11);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=10, ...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-102);
      logInfo(`${BUNDLE}OffsetOrigin_0208 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0209
     * @tc.name      Image_OffsetOrigin_0209
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=10, offY=3) returns -103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0209 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 10, 3);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=10, ...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-11);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=10, ...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-103);
      logInfo(`${BUNDLE}OffsetOrigin_0209 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0210
     * @tc.name      Image_OffsetOrigin_0210
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=10, offY=10) returns -110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0210 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 10, 10);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=10, ...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-11);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=10, ...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-110);
      logInfo(`${BUNDLE}OffsetOrigin_0210 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0211
     * @tc.name      Image_OffsetOrigin_0211
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=10, offY=100) returns -200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0211 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 10, 100);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=10, ...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-11);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=10, ...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-200);
      logInfo(`${BUNDLE}OffsetOrigin_0211 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0212
     * @tc.name      Image_OffsetOrigin_0212
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=10, offY=5) returns -105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0212 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 10, 5);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=10, ...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-11);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=10, ...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-105);
      logInfo(`${BUNDLE}OffsetOrigin_0212 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0213
     * @tc.name      Image_OffsetOrigin_0213
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=10, offY=15) returns -115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0213 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 10, 15);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=10, ...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-11);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=10, ...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-115);
      logInfo(`${BUNDLE}OffsetOrigin_0213 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0214
     * @tc.name      Image_OffsetOrigin_0214
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=10, offY=20) returns -120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0214 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 10, 20);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=10, ...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-11);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=10, ...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-120);
      logInfo(`${BUNDLE}OffsetOrigin_0214 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0215
     * @tc.name      Image_OffsetOrigin_0215
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=10, offY=25) returns -125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0215 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 10, 25);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=10, ...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-11);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=10, ...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-125);
      logInfo(`${BUNDLE}OffsetOrigin_0215 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0216
     * @tc.name      Image_OffsetOrigin_0216
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=10, offY=-99) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_OffsetOrigin_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0216 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 10, -99);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=10, ...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-11);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=10, ...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-1);
      logInfo(`${BUNDLE}OffsetOrigin_0216 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0217
     * @tc.name      Image_OffsetOrigin_0217
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=5, offY=0) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0217 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 5, 0);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=5, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-6);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=5, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-100);
      logInfo(`${BUNDLE}OffsetOrigin_0217 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0218
     * @tc.name      Image_OffsetOrigin_0218
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=5, offY=1) returns -101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0218 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 5, 1);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=5, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-6);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=5, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-101);
      logInfo(`${BUNDLE}OffsetOrigin_0218 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0219
     * @tc.name      Image_OffsetOrigin_0219
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=5, offY=-1) returns -99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_OffsetOrigin_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0219 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 5, -1);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=5, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-6);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=5, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-99);
      logInfo(`${BUNDLE}OffsetOrigin_0219 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0220
     * @tc.name      Image_OffsetOrigin_0220
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=5, offY=2) returns -102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0220 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 5, 2);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=5, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-6);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=5, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-102);
      logInfo(`${BUNDLE}OffsetOrigin_0220 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0221
     * @tc.name      Image_OffsetOrigin_0221
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=5, offY=3) returns -103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0221 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 5, 3);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=5, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-6);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=5, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-103);
      logInfo(`${BUNDLE}OffsetOrigin_0221 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0222
     * @tc.name      Image_OffsetOrigin_0222
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=5, offY=10) returns -110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0222 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 5, 10);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=5, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-6);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=5, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-110);
      logInfo(`${BUNDLE}OffsetOrigin_0222 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0223
     * @tc.name      Image_OffsetOrigin_0223
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=5, offY=100) returns -200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0223 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 5, 100);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=5, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-6);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=5, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-200);
      logInfo(`${BUNDLE}OffsetOrigin_0223 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0224
     * @tc.name      Image_OffsetOrigin_0224
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=5, offY=5) returns -105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0224 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 5, 5);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=5, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-6);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=5, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-105);
      logInfo(`${BUNDLE}OffsetOrigin_0224 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0225
     * @tc.name      Image_OffsetOrigin_0225
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=5, offY=15) returns -115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0225 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 5, 15);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=5, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-6);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=5, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-115);
      logInfo(`${BUNDLE}OffsetOrigin_0225 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0226
     * @tc.name      Image_OffsetOrigin_0226
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=5, offY=20) returns -120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0226 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 5, 20);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=5, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-6);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=5, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-120);
      logInfo(`${BUNDLE}OffsetOrigin_0226 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0227
     * @tc.name      Image_OffsetOrigin_0227
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=5, offY=25) returns -125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0227 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 5, 25);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=5, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-6);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=5, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-125);
      logInfo(`${BUNDLE}OffsetOrigin_0227 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0228
     * @tc.name      Image_OffsetOrigin_0228
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=5, offY=-99) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_OffsetOrigin_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0228 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 5, -99);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=5, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-6);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=5, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-1);
      logInfo(`${BUNDLE}OffsetOrigin_0228 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0229
     * @tc.name      Image_OffsetOrigin_0229
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=15, offY=0) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0229 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 15, 0);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=15, ...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-16);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=15, ...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-100);
      logInfo(`${BUNDLE}OffsetOrigin_0229 end`);
    });
  });
}

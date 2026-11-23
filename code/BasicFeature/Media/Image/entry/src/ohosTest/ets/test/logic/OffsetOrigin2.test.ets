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
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for offsetOrigin (85 cases). */
export default function offsetOrigin2Test(): void {
  describe('OffsetOrigin2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0086
     * @tc.name      Image_OffsetOrigin_0086
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=5, offY=1) returns -101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0086 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 5, 1);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=5,...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-105);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=5,...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-101);
      logInfo(`${BUNDLE}OffsetOrigin_0086 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0087
     * @tc.name      Image_OffsetOrigin_0087
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=5, offY=-1) returns -99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_OffsetOrigin_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0087 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 5, -1);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=5,...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-105);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=5,...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-99);
      logInfo(`${BUNDLE}OffsetOrigin_0087 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0088
     * @tc.name      Image_OffsetOrigin_0088
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=5, offY=2) returns -102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0088 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 5, 2);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=5,...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-105);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=5,...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-102);
      logInfo(`${BUNDLE}OffsetOrigin_0088 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0089
     * @tc.name      Image_OffsetOrigin_0089
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=5, offY=3) returns -103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0089 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 5, 3);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=5,...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-105);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=5,...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-103);
      logInfo(`${BUNDLE}OffsetOrigin_0089 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0090
     * @tc.name      Image_OffsetOrigin_0090
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=5, offY=10) returns -110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0090 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 5, 10);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=5,...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-105);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=5,...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-110);
      logInfo(`${BUNDLE}OffsetOrigin_0090 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0091
     * @tc.name      Image_OffsetOrigin_0091
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=5, offY=100) returns -200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0091 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 5, 100);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=5,...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-105);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=5,...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-200);
      logInfo(`${BUNDLE}OffsetOrigin_0091 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0092
     * @tc.name      Image_OffsetOrigin_0092
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=5, offY=5) returns -105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0092 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 5, 5);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=5,...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-105);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=5,...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-105);
      logInfo(`${BUNDLE}OffsetOrigin_0092 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0093
     * @tc.name      Image_OffsetOrigin_0093
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=5, offY=15) returns -115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0093 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 5, 15);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=5,...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-105);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=5,...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-115);
      logInfo(`${BUNDLE}OffsetOrigin_0093 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0094
     * @tc.name      Image_OffsetOrigin_0094
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=5, offY=20) returns -120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0094 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 5, 20);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=5,...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-105);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=5,...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-120);
      logInfo(`${BUNDLE}OffsetOrigin_0094 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0095
     * @tc.name      Image_OffsetOrigin_0095
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=5, offY=25) returns -125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0095 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 5, 25);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=5,...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-105);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=5,...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-125);
      logInfo(`${BUNDLE}OffsetOrigin_0095 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0096
     * @tc.name      Image_OffsetOrigin_0096
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=5, offY=-99) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_OffsetOrigin_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0096 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 5, -99);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=5,...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-105);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=5,...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-1);
      logInfo(`${BUNDLE}OffsetOrigin_0096 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0097
     * @tc.name      Image_OffsetOrigin_0097
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=15, offY=0) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0097 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 15, 0);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=15...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-115);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=15...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-100);
      logInfo(`${BUNDLE}OffsetOrigin_0097 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0098
     * @tc.name      Image_OffsetOrigin_0098
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=15, offY=1) returns -101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0098 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 15, 1);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=15...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-115);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=15...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-101);
      logInfo(`${BUNDLE}OffsetOrigin_0098 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0099
     * @tc.name      Image_OffsetOrigin_0099
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=15, offY=-1) returns -99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_OffsetOrigin_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0099 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 15, -1);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=15...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-115);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=15...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-99);
      logInfo(`${BUNDLE}OffsetOrigin_0099 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0100
     * @tc.name      Image_OffsetOrigin_0100
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=15, offY=2) returns -102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0100 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 15, 2);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=15...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-115);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=15...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-102);
      logInfo(`${BUNDLE}OffsetOrigin_0100 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0101
     * @tc.name      Image_OffsetOrigin_0101
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=15, offY=3) returns -103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0101 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 15, 3);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=15...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-115);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=15...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-103);
      logInfo(`${BUNDLE}OffsetOrigin_0101 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0102
     * @tc.name      Image_OffsetOrigin_0102
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=15, offY=10) returns -110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0102 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 15, 10);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=15...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-115);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=15...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-110);
      logInfo(`${BUNDLE}OffsetOrigin_0102 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0103
     * @tc.name      Image_OffsetOrigin_0103
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=15, offY=100) returns -200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0103 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 15, 100);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=15...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-115);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=15...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-200);
      logInfo(`${BUNDLE}OffsetOrigin_0103 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0104
     * @tc.name      Image_OffsetOrigin_0104
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=15, offY=5) returns -105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0104 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 15, 5);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=15...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-115);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=15...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-105);
      logInfo(`${BUNDLE}OffsetOrigin_0104 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0105
     * @tc.name      Image_OffsetOrigin_0105
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=15, offY=15) returns -115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0105 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 15, 15);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=15...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-115);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=15...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-115);
      logInfo(`${BUNDLE}OffsetOrigin_0105 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0106
     * @tc.name      Image_OffsetOrigin_0106
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=15, offY=20) returns -120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0106 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 15, 20);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=15...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-115);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=15...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-120);
      logInfo(`${BUNDLE}OffsetOrigin_0106 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0107
     * @tc.name      Image_OffsetOrigin_0107
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=15, offY=25) returns -125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0107 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 15, 25);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=15...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-115);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=15...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-125);
      logInfo(`${BUNDLE}OffsetOrigin_0107 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0108
     * @tc.name      Image_OffsetOrigin_0108
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=15, offY=-99) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_OffsetOrigin_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0108 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 15, -99);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=15...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-115);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=15...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-1);
      logInfo(`${BUNDLE}OffsetOrigin_0108 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0109
     * @tc.name      Image_OffsetOrigin_0109
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=20, offY=0) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0109 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 20, 0);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=20...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-120);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=20...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-100);
      logInfo(`${BUNDLE}OffsetOrigin_0109 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0110
     * @tc.name      Image_OffsetOrigin_0110
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=20, offY=1) returns -101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0110 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 20, 1);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=20...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-120);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=20...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-101);
      logInfo(`${BUNDLE}OffsetOrigin_0110 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0111
     * @tc.name      Image_OffsetOrigin_0111
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=20, offY=-1) returns -99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_OffsetOrigin_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0111 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 20, -1);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=20...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-120);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=20...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-99);
      logInfo(`${BUNDLE}OffsetOrigin_0111 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0112
     * @tc.name      Image_OffsetOrigin_0112
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=20, offY=2) returns -102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0112 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 20, 2);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=20...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-120);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=20...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-102);
      logInfo(`${BUNDLE}OffsetOrigin_0112 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0113
     * @tc.name      Image_OffsetOrigin_0113
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=20, offY=3) returns -103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0113 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 20, 3);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=20...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-120);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=20...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-103);
      logInfo(`${BUNDLE}OffsetOrigin_0113 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0114
     * @tc.name      Image_OffsetOrigin_0114
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=20, offY=10) returns -110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0114 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 20, 10);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=20...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-120);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=20...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-110);
      logInfo(`${BUNDLE}OffsetOrigin_0114 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0115
     * @tc.name      Image_OffsetOrigin_0115
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=20, offY=100) returns -200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0115 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 20, 100);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=20...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-120);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=20...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-200);
      logInfo(`${BUNDLE}OffsetOrigin_0115 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0116
     * @tc.name      Image_OffsetOrigin_0116
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=20, offY=5) returns -105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0116 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 20, 5);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=20...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-120);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=20...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-105);
      logInfo(`${BUNDLE}OffsetOrigin_0116 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0117
     * @tc.name      Image_OffsetOrigin_0117
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=20, offY=15) returns -115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0117 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 20, 15);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=20...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-120);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=20...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-115);
      logInfo(`${BUNDLE}OffsetOrigin_0117 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0118
     * @tc.name      Image_OffsetOrigin_0118
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=20, offY=20) returns -120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0118 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 20, 20);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=20...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-120);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=20...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-120);
      logInfo(`${BUNDLE}OffsetOrigin_0118 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0119
     * @tc.name      Image_OffsetOrigin_0119
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=20, offY=25) returns -125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0119 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 20, 25);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=20...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-120);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=20...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-125);
      logInfo(`${BUNDLE}OffsetOrigin_0119 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0120
     * @tc.name      Image_OffsetOrigin_0120
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=20, offY=-99) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_OffsetOrigin_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0120 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 20, -99);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=20...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-120);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=20...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-1);
      logInfo(`${BUNDLE}OffsetOrigin_0120 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0121
     * @tc.name      Image_OffsetOrigin_0121
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=25, offY=0) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0121 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 25, 0);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=25...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-125);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=25...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-100);
      logInfo(`${BUNDLE}OffsetOrigin_0121 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0122
     * @tc.name      Image_OffsetOrigin_0122
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=25, offY=1) returns -101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0122 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 25, 1);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=25...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-125);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=25...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-101);
      logInfo(`${BUNDLE}OffsetOrigin_0122 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0123
     * @tc.name      Image_OffsetOrigin_0123
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=25, offY=-1) returns -99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_OffsetOrigin_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0123 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 25, -1);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=25...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-125);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=25...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-99);
      logInfo(`${BUNDLE}OffsetOrigin_0123 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0124
     * @tc.name      Image_OffsetOrigin_0124
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=25, offY=2) returns -102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0124 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 25, 2);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=25...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-125);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=25...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-102);
      logInfo(`${BUNDLE}OffsetOrigin_0124 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0125
     * @tc.name      Image_OffsetOrigin_0125
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=25, offY=3) returns -103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0125 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 25, 3);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=25...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-125);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=25...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-103);
      logInfo(`${BUNDLE}OffsetOrigin_0125 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0126
     * @tc.name      Image_OffsetOrigin_0126
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=25, offY=10) returns -110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0126 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 25, 10);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=25...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-125);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=25...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-110);
      logInfo(`${BUNDLE}OffsetOrigin_0126 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0127
     * @tc.name      Image_OffsetOrigin_0127
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=25, offY=100) returns -200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0127 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 25, 100);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=25...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-125);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=25...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-200);
      logInfo(`${BUNDLE}OffsetOrigin_0127 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0128
     * @tc.name      Image_OffsetOrigin_0128
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=25, offY=5) returns -105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0128 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 25, 5);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=25...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-125);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=25...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-105);
      logInfo(`${BUNDLE}OffsetOrigin_0128 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0129
     * @tc.name      Image_OffsetOrigin_0129
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=25, offY=15) returns -115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0129 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 25, 15);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=25...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-125);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=25...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-115);
      logInfo(`${BUNDLE}OffsetOrigin_0129 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0130
     * @tc.name      Image_OffsetOrigin_0130
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=25, offY=20) returns -120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0130 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 25, 20);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=25...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-125);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=25...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-120);
      logInfo(`${BUNDLE}OffsetOrigin_0130 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0131
     * @tc.name      Image_OffsetOrigin_0131
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=25, offY=25) returns -125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0131 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 25, 25);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=25...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-125);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=25...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-125);
      logInfo(`${BUNDLE}OffsetOrigin_0131 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0132
     * @tc.name      Image_OffsetOrigin_0132
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=25, offY=-99) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_OffsetOrigin_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0132 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 25, -99);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=25...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-125);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=25...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-1);
      logInfo(`${BUNDLE}OffsetOrigin_0132 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0133
     * @tc.name      Image_OffsetOrigin_0133
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=31.41, offY=0) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0133 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 31.41, 0);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=31...: actual.x=${actual.x}`);
      expect(actual.x).assertClose(-131.41, PRECISION);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=31...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-100);
      logInfo(`${BUNDLE}OffsetOrigin_0133 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0134
     * @tc.name      Image_OffsetOrigin_0134
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=31.41, offY=1) returns -101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0134 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 31.41, 1);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=31...: actual.x=${actual.x}`);
      expect(actual.x).assertClose(-131.41, PRECISION);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=31...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-101);
      logInfo(`${BUNDLE}OffsetOrigin_0134 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0135
     * @tc.name      Image_OffsetOrigin_0135
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=31.41, offY=-1) returns -99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_OffsetOrigin_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0135 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 31.41, -1);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=31...: actual.x=${actual.x}`);
      expect(actual.x).assertClose(-131.41, PRECISION);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=31...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-99);
      logInfo(`${BUNDLE}OffsetOrigin_0135 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0136
     * @tc.name      Image_OffsetOrigin_0136
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=31.41, offY=2) returns -102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0136 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 31.41, 2);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=31...: actual.x=${actual.x}`);
      expect(actual.x).assertClose(-131.41, PRECISION);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=31...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-102);
      logInfo(`${BUNDLE}OffsetOrigin_0136 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0137
     * @tc.name      Image_OffsetOrigin_0137
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=31.41, offY=3) returns -103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0137 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 31.41, 3);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=31...: actual.x=${actual.x}`);
      expect(actual.x).assertClose(-131.41, PRECISION);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=31...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-103);
      logInfo(`${BUNDLE}OffsetOrigin_0137 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0138
     * @tc.name      Image_OffsetOrigin_0138
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=31.41, offY=10) returns -110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0138 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 31.41, 10);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=31...: actual.x=${actual.x}`);
      expect(actual.x).assertClose(-131.41, PRECISION);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=31...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-110);
      logInfo(`${BUNDLE}OffsetOrigin_0138 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0139
     * @tc.name      Image_OffsetOrigin_0139
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=31.41, offY=100) returns -200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0139 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 31.41, 100);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=31...: actual.x=${actual.x}`);
      expect(actual.x).assertClose(-131.41, PRECISION);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=31...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-200);
      logInfo(`${BUNDLE}OffsetOrigin_0139 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0140
     * @tc.name      Image_OffsetOrigin_0140
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=31.41, offY=5) returns -105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0140 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 31.41, 5);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=31...: actual.x=${actual.x}`);
      expect(actual.x).assertClose(-131.41, PRECISION);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=31...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-105);
      logInfo(`${BUNDLE}OffsetOrigin_0140 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0141
     * @tc.name      Image_OffsetOrigin_0141
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=31.41, offY=15) returns -115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0141 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 31.41, 15);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=31...: actual.x=${actual.x}`);
      expect(actual.x).assertClose(-131.41, PRECISION);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=31...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-115);
      logInfo(`${BUNDLE}OffsetOrigin_0141 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0142
     * @tc.name      Image_OffsetOrigin_0142
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=31.41, offY=20) returns -120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0142 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 31.41, 20);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=31...: actual.x=${actual.x}`);
      expect(actual.x).assertClose(-131.41, PRECISION);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=31...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-120);
      logInfo(`${BUNDLE}OffsetOrigin_0142 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0143
     * @tc.name      Image_OffsetOrigin_0143
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=31.41, offY=25) returns -125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0143 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 31.41, 25);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=31...: actual.x=${actual.x}`);
      expect(actual.x).assertClose(-131.41, PRECISION);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=31...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-125);
      logInfo(`${BUNDLE}OffsetOrigin_0143 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0144
     * @tc.name      Image_OffsetOrigin_0144
     * @tc.desc      offsetOrigin(p=Point(-100, -100), offX=31.41, offY=-99) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_OffsetOrigin_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0144 begin`);
      const actual: Point = offsetOrigin(new Point(-100, -100), 31.41, -99);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=31...: actual.x=${actual.x}`);
      expect(actual.x).assertClose(-131.41, PRECISION);
      logInfo(`offsetOrigin(p=Point(-100, -100), offX=31...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-1);
      logInfo(`${BUNDLE}OffsetOrigin_0144 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0145
     * @tc.name      Image_OffsetOrigin_0145
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=0, offY=0) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0145 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 0, 0);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=0, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-1);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=0, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-100);
      logInfo(`${BUNDLE}OffsetOrigin_0145 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0146
     * @tc.name      Image_OffsetOrigin_0146
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=0, offY=1) returns -101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0146 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 0, 1);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=0, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-1);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=0, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-101);
      logInfo(`${BUNDLE}OffsetOrigin_0146 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0147
     * @tc.name      Image_OffsetOrigin_0147
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=0, offY=-1) returns -99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_OffsetOrigin_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0147 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 0, -1);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=0, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-1);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=0, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-99);
      logInfo(`${BUNDLE}OffsetOrigin_0147 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0148
     * @tc.name      Image_OffsetOrigin_0148
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=0, offY=2) returns -102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0148 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 0, 2);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=0, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-1);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=0, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-102);
      logInfo(`${BUNDLE}OffsetOrigin_0148 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0149
     * @tc.name      Image_OffsetOrigin_0149
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=0, offY=3) returns -103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0149 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 0, 3);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=0, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-1);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=0, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-103);
      logInfo(`${BUNDLE}OffsetOrigin_0149 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0150
     * @tc.name      Image_OffsetOrigin_0150
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=0, offY=10) returns -110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0150 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 0, 10);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=0, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-1);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=0, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-110);
      logInfo(`${BUNDLE}OffsetOrigin_0150 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0151
     * @tc.name      Image_OffsetOrigin_0151
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=0, offY=100) returns -200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0151 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 0, 100);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=0, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-1);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=0, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-200);
      logInfo(`${BUNDLE}OffsetOrigin_0151 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0152
     * @tc.name      Image_OffsetOrigin_0152
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=0, offY=5) returns -105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0152 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 0, 5);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=0, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-1);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=0, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-105);
      logInfo(`${BUNDLE}OffsetOrigin_0152 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0153
     * @tc.name      Image_OffsetOrigin_0153
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=0, offY=15) returns -115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0153 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 0, 15);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=0, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-1);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=0, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-115);
      logInfo(`${BUNDLE}OffsetOrigin_0153 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0154
     * @tc.name      Image_OffsetOrigin_0154
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=0, offY=20) returns -120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0154 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 0, 20);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=0, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-1);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=0, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-120);
      logInfo(`${BUNDLE}OffsetOrigin_0154 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0155
     * @tc.name      Image_OffsetOrigin_0155
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=0, offY=25) returns -125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0155 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 0, 25);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=0, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-1);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=0, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-125);
      logInfo(`${BUNDLE}OffsetOrigin_0155 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0156
     * @tc.name      Image_OffsetOrigin_0156
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=0, offY=-99) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_OffsetOrigin_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0156 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 0, -99);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=0, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-1);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=0, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-1);
      logInfo(`${BUNDLE}OffsetOrigin_0156 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0157
     * @tc.name      Image_OffsetOrigin_0157
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=1, offY=0) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0157 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 1, 0);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=1, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-2);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=1, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-100);
      logInfo(`${BUNDLE}OffsetOrigin_0157 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0158
     * @tc.name      Image_OffsetOrigin_0158
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=1, offY=1) returns -101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0158 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 1, 1);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=1, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-2);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=1, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-101);
      logInfo(`${BUNDLE}OffsetOrigin_0158 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0159
     * @tc.name      Image_OffsetOrigin_0159
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=1, offY=-1) returns -99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_OffsetOrigin_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0159 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 1, -1);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=1, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-2);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=1, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-99);
      logInfo(`${BUNDLE}OffsetOrigin_0159 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0160
     * @tc.name      Image_OffsetOrigin_0160
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=1, offY=2) returns -102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0160 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 1, 2);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=1, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-2);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=1, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-102);
      logInfo(`${BUNDLE}OffsetOrigin_0160 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0161
     * @tc.name      Image_OffsetOrigin_0161
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=1, offY=3) returns -103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0161 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 1, 3);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=1, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-2);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=1, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-103);
      logInfo(`${BUNDLE}OffsetOrigin_0161 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0162
     * @tc.name      Image_OffsetOrigin_0162
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=1, offY=10) returns -110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0162 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 1, 10);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=1, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-2);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=1, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-110);
      logInfo(`${BUNDLE}OffsetOrigin_0162 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0163
     * @tc.name      Image_OffsetOrigin_0163
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=1, offY=100) returns -200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0163 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 1, 100);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=1, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-2);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=1, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-200);
      logInfo(`${BUNDLE}OffsetOrigin_0163 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0164
     * @tc.name      Image_OffsetOrigin_0164
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=1, offY=5) returns -105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0164 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 1, 5);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=1, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-2);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=1, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-105);
      logInfo(`${BUNDLE}OffsetOrigin_0164 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0165
     * @tc.name      Image_OffsetOrigin_0165
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=1, offY=15) returns -115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0165 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 1, 15);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=1, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-2);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=1, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-115);
      logInfo(`${BUNDLE}OffsetOrigin_0165 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0166
     * @tc.name      Image_OffsetOrigin_0166
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=1, offY=20) returns -120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0166 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 1, 20);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=1, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-2);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=1, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-120);
      logInfo(`${BUNDLE}OffsetOrigin_0166 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0167
     * @tc.name      Image_OffsetOrigin_0167
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=1, offY=25) returns -125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_OffsetOrigin_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0167 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 1, 25);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=1, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-2);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=1, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-125);
      logInfo(`${BUNDLE}OffsetOrigin_0167 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0168
     * @tc.name      Image_OffsetOrigin_0168
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=1, offY=-99) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_OffsetOrigin_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0168 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), 1, -99);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=1, o...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-2);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=1, o...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-1);
      logInfo(`${BUNDLE}OffsetOrigin_0168 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0169
     * @tc.name      Image_OffsetOrigin_0169
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=-1, offY=0) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_OffsetOrigin_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0169 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), -1, 0);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=-1, ...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=-1, ...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-100);
      logInfo(`${BUNDLE}OffsetOrigin_0169 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_OFFSET_ORIGIN_0170
     * @tc.name      Image_OffsetOrigin_0170
     * @tc.desc      offsetOrigin(p=Point(-1, -100), offX=-1, offY=1) returns -101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_OffsetOrigin_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetOrigin_0170 begin`);
      const actual: Point = offsetOrigin(new Point(-1, -100), -1, 1);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=-1, ...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`offsetOrigin(p=Point(-1, -100), offX=-1, ...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-101);
      logInfo(`${BUNDLE}OffsetOrigin_0170 end`);
    });
  });
}

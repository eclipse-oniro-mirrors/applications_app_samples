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
import { delayTick } from './shared/AsyncYield';
import { ColorUtil, ColorRgba, GradientPreset } from '../../../main/ets/model/utils/ColorUtil';
import { GeometryUtil, Point } from '../../../main/ets/model/utils/GeometryUtil';
import { LogUtil, LogLevel } from '../../../main/ets/model/utils/LogUtil';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_CanvasShowcase]';

export default function CanvasCombinedPart5Test(): void {
  describe('CvG5', () => {
    /**
     * @tc.number    SUB_CANVAS_CRGP2_7300
     * @tc.name      testToHex0073
     * @tc.desc      Verify toHex(171, 205, 239) returns #ABCDEF. Plus Verify toHex(36, 72, 108) returns #24486C. Plus Verify toHex(200, 100, 50) returns #C86432. Plus Verify toHex(5, 250, 125) returns #05FA7D. Plus Verify toHex(64, 128, 192) returns #4080C0. Plus Verify toHex(240, 15, 90) returns #F00F5A. Plus Verify toHex(33, 66, 99) returns #214263. Plus Verify toHex(2, 4, 8) returns #020408. Plus Verify toHex(63, 127, 191) returns #3F7FBF. Plus Verify toHex(224, 96, 32) returns #E06020. Plus Verify toHex(11, 22, 44) returns #0B162C. Plus Verify toHex(99, 100, 101) returns #636465. Plus Verify toHex(150, 75, 25) returns #964B19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToHex0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0073 begin');
      await delayTick();
      expect(ColorUtil.toHex(171, 205, 239)).assertEqual('#ABCDEF');
      {
      expect(ColorUtil.toHex(36, 72, 108)).assertEqual('#24486C');
      }
      {
      expect(ColorUtil.toHex(200, 100, 50)).assertEqual('#C86432');
      }
      {
      expect(ColorUtil.toHex(5, 250, 125)).assertEqual('#05FA7D');
      }
      {
      expect(ColorUtil.toHex(64, 128, 192)).assertEqual('#4080C0');
      }
      {
      expect(ColorUtil.toHex(240, 15, 90)).assertEqual('#F00F5A');
      }
      {
      expect(ColorUtil.toHex(33, 66, 99)).assertEqual('#214263');
      }
      {
      expect(ColorUtil.toHex(2, 4, 8)).assertEqual('#020408');
      }
      {
      expect(ColorUtil.toHex(63, 127, 191)).assertEqual('#3F7FBF');
      }
      {
      expect(ColorUtil.toHex(224, 96, 32)).assertEqual('#E06020');
      }
      {
      expect(ColorUtil.toHex(11, 22, 44)).assertEqual('#0B162C');
      }
      {
      expect(ColorUtil.toHex(99, 100, 101)).assertEqual('#636465');
      }
      {
      expect(ColorUtil.toHex(150, 75, 25)).assertEqual('#964B19');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0073 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP3_8600
     * @tc.name      testToHex0086
     * @tc.desc      Verify toHex(8, 16, 24) returns #081018.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToHex0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0086 begin');
      await delayTick();
      expect(ColorUtil.toHex(8, 16, 24)).assertEqual('#081018');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0086 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP3_8700
     * @tc.name      testToHex0087
     * @tc.desc      Verify toHex(250, 5, 130) returns #FA0582.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToHex0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0087 begin');
      await delayTick();
      expect(ColorUtil.toHex(250, 5, 130)).assertEqual('#FA0582');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0087 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP3_8800
     * @tc.name      testToHex0088
     * @tc.desc      Verify toHex(48, 96, 144) returns #306090.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToHex0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0088 begin');
      await delayTick();
      expect(ColorUtil.toHex(48, 96, 144)).assertEqual('#306090');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0088 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP3_8900
     * @tc.name      testToHex0089
     * @tc.desc      Verify toHex(201, 17, 83) returns #C91153.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToHex0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0089 begin');
      await delayTick();
      expect(ColorUtil.toHex(201, 17, 83)).assertEqual('#C91153');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0089 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP3_9000
     * @tc.name      testToHex0090
     * @tc.desc      Verify toHex(77, 154, 231) returns #4D9AE7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToHex0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0090 begin');
      await delayTick();
      expect(ColorUtil.toHex(77, 154, 231)).assertEqual('#4D9AE7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0090 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP3_9100
     * @tc.name      testToHex0091
     * @tc.desc      Verify toHex(12, 200, 88) returns #0CC858.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToHex0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0091 begin');
      await delayTick();
      expect(ColorUtil.toHex(12, 200, 88)).assertEqual('#0CC858');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0091 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP3_9200
     * @tc.name      testToHexMask0092
     * @tc.desc      Verify toHex masks -1, 256, 511.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToHexMask0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHexMask0092 begin');
      await delayTick();
      expect(ColorUtil.toHex(-1, 256, 511)).assertEqual('#FF00FF');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHexMask0092 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP3_9300
     * @tc.name      testToHexMask0093
     * @tc.desc      Verify toHex masks 0, 255, 256.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToHexMask0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHexMask0093 begin');
      await delayTick();
      expect(ColorUtil.toHex(0, 255, 256)).assertEqual('#00FF00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHexMask0093 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP3_9400
     * @tc.name      testToHexMask0094
     * @tc.desc      Verify toHex masks 15, 16, 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToHexMask0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHexMask0094 begin');
      await delayTick();
      expect(ColorUtil.toHex(15, 16, 17)).assertEqual('#0F1011');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHexMask0094 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP3_9500
     * @tc.name      testToHexMask0095
     * @tc.desc      Verify toHex masks 254, 255, 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToHexMask0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHexMask0095 begin');
      await delayTick();
      expect(ColorUtil.toHex(254, 255, 0)).assertEqual('#FEFF00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHexMask0095 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP3_9600
     * @tc.name      testToHexMask0096
     * @tc.desc      Verify toHex masks 128, 127, 126.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToHexMask0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHexMask0096 begin');
      await delayTick();
      expect(ColorUtil.toHex(128, 127, 126)).assertEqual('#807F7E');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHexMask0096 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP3_9700
     * @tc.name      testToHexMask0097
     * @tc.desc      Verify toHex masks 300, -20, 1000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToHexMask0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHexMask0097 begin');
      await delayTick();
      expect(ColorUtil.toHex(300, -20, 1000)).assertEqual('#2CECE8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHexMask0097 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP3_9800
     * @tc.name      testToRgbaString0098
     * @tc.desc      Verify toRgbaString(255, 0, 0, 255) returns rgba(255,0,0,1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToRgbaString0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToRgbaString0098 begin');
      await delayTick();
      expect(ColorUtil.toRgbaString(255, 0, 0, 255)).assertEqual('rgba(255,0,0,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToRgbaString0098 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP3_9900
     * @tc.name      testToRgbaString0099
     * @tc.desc      Verify toRgbaString(0, 255, 0, 0) returns rgba(0,255,0,0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToRgbaString0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToRgbaString0099 begin');
      await delayTick();
      expect(ColorUtil.toRgbaString(0, 255, 0, 0)).assertEqual('rgba(0,255,0,0)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToRgbaString0099 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP3_10000
     * @tc.name      testToRgbaString0100
     * @tc.desc      Verify toRgbaString(1, 2, 3, 51) returns rgba(1,2,3,0.2).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToRgbaString0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToRgbaString0100 begin');
      await delayTick();
      expect(ColorUtil.toRgbaString(1, 2, 3, 51)).assertEqual('rgba(1,2,3,0.2)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToRgbaString0100 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP3_10100
     * @tc.name      testToRgbaString0101
     * @tc.desc      Verify toRgbaString(10, 20, 30, 102) returns rgba(10,20,30,0.4).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToRgbaString0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToRgbaString0101 begin');
      await delayTick();
      expect(ColorUtil.toRgbaString(10, 20, 30, 102)).assertEqual('rgba(10,20,30,0.4)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToRgbaString0101 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP3_10200
     * @tc.name      testToRgbaString0102
     * @tc.desc      Verify toRgbaString(200, 100, 50, 128) returns rgba(200,100,50,0.5).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToRgbaString0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToRgbaString0102 begin');
      await delayTick();
      expect(ColorUtil.toRgbaString(200, 100, 50, 128)).assertEqual('rgba(200,100,50,0.5)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToRgbaString0102 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP3_10300
     * @tc.name      testToRgbaString0103
     * @tc.desc      Verify toRgbaString(17, 34, 51, 153) returns rgba(17,34,51,0.6).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToRgbaString0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToRgbaString0103 begin');
      await delayTick();
      expect(ColorUtil.toRgbaString(17, 34, 51, 153)).assertEqual('rgba(17,34,51,0.6)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToRgbaString0103 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP3_10400
     * @tc.name      testToRgbaString0104
     * @tc.desc      Verify toRgbaString(128, 64, 32, 204) returns rgba(128,64,32,0.8).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToRgbaString0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToRgbaString0104 begin');
      await delayTick();
      expect(ColorUtil.toRgbaString(128, 64, 32, 204)).assertEqual('rgba(128,64,32,0.8)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToRgbaString0104 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP3_10500
     * @tc.name      testToRgbaString0105
     * @tc.desc      Verify toRgbaString(254, 128, 1, 230) returns rgba(254,128,1,0.9).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToRgbaString0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToRgbaString0105 begin');
      await delayTick();
      expect(ColorUtil.toRgbaString(254, 128, 1, 230)).assertEqual('rgba(254,128,1,0.9)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToRgbaString0105 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP3_10600
     * @tc.name      testToRgbaString0106
     * @tc.desc      Verify toRgbaString(90, 180, 45, 242) returns rgba(90,180,45,0.95).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToRgbaString0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToRgbaString0106 begin');
      await delayTick();
      expect(ColorUtil.toRgbaString(90, 180, 45, 242)).assertEqual('rgba(90,180,45,0.95)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToRgbaString0106 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP3_10700
     * @tc.name      testToRgbaString0107
     * @tc.desc      Verify toRgbaString(300, -10, 999, 500) returns rgba(44,246,231,1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToRgbaString0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToRgbaString0107 begin');
      await delayTick();
      expect(ColorUtil.toRgbaString(300, -10, 999, 500)).assertEqual('rgba(44,246,231,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToRgbaString0107 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP3_10800
     * @tc.name      testClamp0108
     * @tc.desc      Verify clamp(5, 0, 10) returns 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClamp0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClamp0108 begin');
      await delayTick();
      expect(ColorUtil.clamp(5, 0, 10)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClamp0108 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP3_10900
     * @tc.name      testClamp0109
     * @tc.desc      Verify clamp(-1, 0, 10) returns 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClamp0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClamp0109 begin');
      await delayTick();
      expect(ColorUtil.clamp(-1, 0, 10)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClamp0109 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP3_11000
     * @tc.name      testClamp0110
     * @tc.desc      Verify clamp(11, 0, 10) returns 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClamp0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClamp0110 begin');
      await delayTick();
      expect(ColorUtil.clamp(11, 0, 10)).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClamp0110 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP3_11100
     * @tc.name      testClamp0111
     * @tc.desc      Verify clamp(0, 0, 0) returns 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClamp0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClamp0111 begin');
      await delayTick();
      expect(ColorUtil.clamp(0, 0, 0)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClamp0111 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP3_11200
     * @tc.name      testClamp0112
     * @tc.desc      Verify clamp(10, 10, 10) returns 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClamp0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClamp0112 begin');
      await delayTick();
      expect(ColorUtil.clamp(10, 10, 10)).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClamp0112 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP3_11300
     * @tc.name      testClamp0113
     * @tc.desc      Verify clamp(5, 10, 1) returns 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClamp0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClamp0113 begin');
      await delayTick();
      expect(ColorUtil.clamp(5, 10, 1)).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClamp0113 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP3_11400
     * @tc.name      testClamp0114
     * @tc.desc      Verify clamp(-5, -10, -1) returns -5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClamp0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClamp0114 begin');
      await delayTick();
      expect(ColorUtil.clamp(-5, -10, -1)).assertEqual(-5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClamp0114 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP3_11500
     * @tc.name      testClamp0115
     * @tc.desc      Verify clamp(0, -1, 1) returns 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClamp0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClamp0115 begin');
      await delayTick();
      expect(ColorUtil.clamp(0, -1, 1)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClamp0115 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP3_11600
     * @tc.name      testClamp0116
     * @tc.desc      Verify clamp(100, 0, 99) returns 99.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClamp0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClamp0116 begin');
      await delayTick();
      expect(ColorUtil.clamp(100, 0, 99)).assertEqual(99);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClamp0116 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP3_11700
     * @tc.name      testClamp0117
     * @tc.desc      Verify clamp(0.5, 0, 1) returns 0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClamp0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClamp0117 begin');
      await delayTick();
      expect(ColorUtil.clamp(0.5, 0, 1)).assertEqual(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClamp0117 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP3_11800
     * @tc.name      testClamp0118
     * @tc.desc      Verify clamp(2, 1, 3) returns 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClamp0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClamp0118 begin');
      await delayTick();
      expect(ColorUtil.clamp(2, 1, 3)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClamp0118 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP3_11900
     * @tc.name      testPresetGet0119
     * @tc.desc      Verify GradientPreset.get('sky') color stops.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetGet0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetGet0119 begin');
      await delayTick();
      const colors: string[] | null = GradientPreset.get('sky');
      expect(colors !== null).assertTrue();
      if (colors !== null) {
        expect(colors.length).assertEqual(4);
        expect(colors.join("|")).assertEqual('#0D47A1|#1976D2|#64B5F6|#BBDEFB');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetGet0119 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP3_12000
     * @tc.name      testPresetGet0120
     * @tc.desc      Verify GradientPreset.get('sunset') color stops.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetGet0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetGet0120 begin');
      await delayTick();
      const colors: string[] | null = GradientPreset.get('sunset');
      expect(colors !== null).assertTrue();
      if (colors !== null) {
        expect(colors.length).assertEqual(4);
        expect(colors.join("|")).assertEqual('#FF1744|#FF6D00|#FFD600|#FFF59D');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetGet0120 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP4_12100
     * @tc.name      testPresetGet0121
     * @tc.desc      Verify GradientPreset.get('ocean') color stops.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetGet0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetGet0121 begin');
      await delayTick();
      const colors: string[] | null = GradientPreset.get('ocean');
      expect(colors !== null).assertTrue();
      if (colors !== null) {
        expect(colors.length).assertEqual(4);
        expect(colors.join("|")).assertEqual('#004D40|#00897B|#4DB6AC|#B2DFDB');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetGet0121 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP4_12200
     * @tc.name      testPresetGet0122
     * @tc.desc      Verify GradientPreset.get('forest') color stops.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetGet0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetGet0122 begin');
      await delayTick();
      const colors: string[] | null = GradientPreset.get('forest');
      expect(colors !== null).assertTrue();
      if (colors !== null) {
        expect(colors.length).assertEqual(4);
        expect(colors.join("|")).assertEqual('#1B5E20|#43A047|#9CCC65|#DCEDC8');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetGet0122 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP4_12300
     * @tc.name      testPresetGet0123
     * @tc.desc      Verify GradientPreset.get('SKY') is null.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetGet0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetGet0123 begin');
      await delayTick();
      expect(GradientPreset.get('SKY') === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetGet0123 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP4_12400
     * @tc.name      testPresetGet0124
     * @tc.desc      Verify GradientPreset.get('missing') is null.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetGet0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetGet0124 begin');
      await delayTick();
      expect(GradientPreset.get('missing') === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetGet0124 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP4_12500
     * @tc.name      testPresetGet0125
     * @tc.desc      Verify GradientPreset.get('') is null.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetGet0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetGet0125 begin');
      await delayTick();
      expect(GradientPreset.get('') === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetGet0125 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP4_12600
     * @tc.name      testPresetCount0126
     * @tc.desc      Verify GradientPreset.count is 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetCount0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetCount0126 begin');
      await delayTick();
      expect(GradientPreset.count()).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetCount0126 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP4_12700
     * @tc.name      testPresetNames0127
     * @tc.desc      Verify GradientPreset.getNames order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetNames0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetNames0127 begin');
      await delayTick();
      expect(GradientPreset.getNames().join('|')).assertEqual('sky|sunset|ocean|forest');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetNames0127 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_0100
     * @tc.name      testCircleRad0001
     * @tc.desc      Verify pointOnCircle 0,0 r=10 angle 0deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0001 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(0, 0, 10, 0.0);
      expect(Math.abs(p.x - (10.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (0.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0001 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_0200
     * @tc.name      testCircleRad0002
     * @tc.desc      Verify pointOnCircle 50,60 r=20 angle 0deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0002 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(50, 60, 20, 0.0);
      expect(Math.abs(p.x - (70.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (60.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0002 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_0300
     * @tc.name      testCircleRad0003
     * @tc.desc      Verify pointOnCircle -15,25 r=5 angle 0deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0003 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(-15, 25, 5, 0.0);
      expect(Math.abs(p.x - (-10.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (25.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0003 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_0400
     * @tc.name      testCircleRad0004
     * @tc.desc      Verify pointOnCircle 200,-50 r=12 angle 0deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0004 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(200, -50, 12, 0.0);
      expect(Math.abs(p.x - (212.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (-50.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0004 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_0500
     * @tc.name      testCircleRad0005
     * @tc.desc      Verify pointOnCircle 7,9 r=1 angle 0deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0005 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(7, 9, 1, 0.0);
      expect(Math.abs(p.x - (8.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (9.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0005 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_0600
     * @tc.name      testCircleRad0006
     * @tc.desc      Verify pointOnCircle 320,240 r=100 angle 0deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0006 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(320, 240, 100, 0.0);
      expect(Math.abs(p.x - (420.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (240.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0006 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_0700
     * @tc.name      testCircleRad0007
     * @tc.desc      Verify pointOnCircle 0,0 r=10 angle 90deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0007 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(0, 0, 10, 1.5707963267948966);
      expect(Math.abs(p.x - (6.123233995736766e-16)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (10.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0007 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_0800
     * @tc.name      testCircleRad0008
     * @tc.desc      Verify pointOnCircle 50,60 r=20 angle 90deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0008 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(50, 60, 20, 1.5707963267948966);
      expect(Math.abs(p.x - (50.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (80.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0008 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_0900
     * @tc.name      testCircleRad0009
     * @tc.desc      Verify pointOnCircle -15,25 r=5 angle 90deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0009 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(-15, 25, 5, 1.5707963267948966);
      expect(Math.abs(p.x - (-15.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (30.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0009 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_1000
     * @tc.name      testCircleRad0010
     * @tc.desc      Verify pointOnCircle 200,-50 r=12 angle 90deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0010 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(200, -50, 12, 1.5707963267948966);
      expect(Math.abs(p.x - (200.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (-38.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0010 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_1100
     * @tc.name      testCircleRad0011
     * @tc.desc      Verify pointOnCircle 7,9 r=1 angle 90deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0011 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(7, 9, 1, 1.5707963267948966);
      expect(Math.abs(p.x - (7.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (10.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0011 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_1200
     * @tc.name      testCircleRad0012
     * @tc.desc      Verify pointOnCircle 320,240 r=100 angle 90deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0012 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(320, 240, 100, 1.5707963267948966);
      expect(Math.abs(p.x - (320.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (340.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0012 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_1300
     * @tc.name      testCircleRad0013
     * @tc.desc      Verify pointOnCircle 0,0 r=10 angle 180deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0013 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(0, 0, 10, 3.141592653589793);
      expect(Math.abs(p.x - (-10.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (1.2246467991473533e-15)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0013 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_1400
     * @tc.name      testCircleRad0014
     * @tc.desc      Verify pointOnCircle 50,60 r=20 angle 180deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0014 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(50, 60, 20, 3.141592653589793);
      expect(Math.abs(p.x - (30.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (60.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0014 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_1500
     * @tc.name      testCircleRad0015
     * @tc.desc      Verify pointOnCircle -15,25 r=5 angle 180deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0015 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(-15, 25, 5, 3.141592653589793);
      expect(Math.abs(p.x - (-20.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (25.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0015 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_1600
     * @tc.name      testCircleRad0016
     * @tc.desc      Verify pointOnCircle 200,-50 r=12 angle 180deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0016 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(200, -50, 12, 3.141592653589793);
      expect(Math.abs(p.x - (188.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (-50.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0016 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_1700
     * @tc.name      testCircleRad0017
     * @tc.desc      Verify pointOnCircle 7,9 r=1 angle 180deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0017 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(7, 9, 1, 3.141592653589793);
      expect(Math.abs(p.x - (6.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (9.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0017 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_1800
     * @tc.name      testCircleRad0018
     * @tc.desc      Verify pointOnCircle 320,240 r=100 angle 180deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0018 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(320, 240, 100, 3.141592653589793);
      expect(Math.abs(p.x - (220.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (240.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0018 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_1900
     * @tc.name      testCircleRad0019
     * @tc.desc      Verify pointOnCircle 0,0 r=10 angle 270deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0019 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(0, 0, 10, 4.71238898038469);
      expect(Math.abs(p.x - (-1.8369701987210296e-15)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (-10.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0019 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_2000
     * @tc.name      testCircleRad0020
     * @tc.desc      Verify pointOnCircle 50,60 r=20 angle 270deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0020 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(50, 60, 20, 4.71238898038469);
      expect(Math.abs(p.x - (49.99999999999999)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (40.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0020 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_2100
     * @tc.name      testCircleRad0021
     * @tc.desc      Verify pointOnCircle -15,25 r=5 angle 270deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0021 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(-15, 25, 5, 4.71238898038469);
      expect(Math.abs(p.x - (-15.000000000000002)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (20.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0021 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_2200
     * @tc.name      testCircleRad0022
     * @tc.desc      Verify pointOnCircle 200,-50 r=12 angle 270deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0022 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(200, -50, 12, 4.71238898038469);
      expect(Math.abs(p.x - (200.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (-62.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0022 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_2300
     * @tc.name      testCircleRad0023
     * @tc.desc      Verify pointOnCircle 7,9 r=1 angle 270deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0023 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(7, 9, 1, 4.71238898038469);
      expect(Math.abs(p.x - (7.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (8.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0023 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_2400
     * @tc.name      testCircleRad0024
     * @tc.desc      Verify pointOnCircle 320,240 r=100 angle 270deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0024 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(320, 240, 100, 4.71238898038469);
      expect(Math.abs(p.x - (320.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (140.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0024 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_2500
     * @tc.name      testCircleRad0025
     * @tc.desc      Verify pointOnCircle 0,0 r=10 angle 360deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0025 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(0, 0, 10, 6.283185307179586);
      expect(Math.abs(p.x - (10.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (-2.4492935982947065e-15)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0025 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_2600
     * @tc.name      testCircleRad0026
     * @tc.desc      Verify pointOnCircle 50,60 r=20 angle 360deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0026 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(50, 60, 20, 6.283185307179586);
      expect(Math.abs(p.x - (70.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (59.99999999999999)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0026 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_2700
     * @tc.name      testCircleRad0027
     * @tc.desc      Verify pointOnCircle -15,25 r=5 angle 360deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0027 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(-15, 25, 5, 6.283185307179586);
      expect(Math.abs(p.x - (-10.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (25.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0027 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_2800
     * @tc.name      testCircleRad0028
     * @tc.desc      Verify pointOnCircle 200,-50 r=12 angle 360deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0028 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(200, -50, 12, 6.283185307179586);
      expect(Math.abs(p.x - (212.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (-50.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0028 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_2900
     * @tc.name      testCircleRad0029
     * @tc.desc      Verify pointOnCircle 7,9 r=1 angle 360deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0029 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(7, 9, 1, 6.283185307179586);
      expect(Math.abs(p.x - (8.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (9.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0029 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_3000
     * @tc.name      testCircleRad0030
     * @tc.desc      Verify pointOnCircle 320,240 r=100 angle 360deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0030 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(320, 240, 100, 6.283185307179586);
      expect(Math.abs(p.x - (420.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (239.99999999999997)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0030 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_3100
     * @tc.name      testCircleRad0031
     * @tc.desc      Verify pointOnCircle 0,0 r=10 angle 45deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0031 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(0, 0, 10, 0.7853981633974483);
      expect(Math.abs(p.x - (7.0710678118654755)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (7.0710678118654755)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0031 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_3200
     * @tc.name      testCircleRad0032
     * @tc.desc      Verify pointOnCircle 50,60 r=20 angle 45deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0032 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(50, 60, 20, 0.7853981633974483);
      expect(Math.abs(p.x - (64.14213562373095)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (74.14213562373095)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0032 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_3300
     * @tc.name      testCircleRad0033
     * @tc.desc      Verify pointOnCircle -15,25 r=5 angle 45deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0033 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(-15, 25, 5, 0.7853981633974483);
      expect(Math.abs(p.x - (-11.464466094067262)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (28.535533905932738)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0033 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_3400
     * @tc.name      testCircleRad0034
     * @tc.desc      Verify pointOnCircle 200,-50 r=12 angle 45deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0034 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(200, -50, 12, 0.7853981633974483);
      expect(Math.abs(p.x - (208.48528137423858)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (-41.51471862576143)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0034 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_3500
     * @tc.name      testCircleRad0035
     * @tc.desc      Verify pointOnCircle 7,9 r=1 angle 45deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0035 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(7, 9, 1, 0.7853981633974483);
      expect(Math.abs(p.x - (7.707106781186548)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (9.707106781186548)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0035 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_3600
     * @tc.name      testCircleRad0036
     * @tc.desc      Verify pointOnCircle 320,240 r=100 angle 45deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0036 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(320, 240, 100, 0.7853981633974483);
      expect(Math.abs(p.x - (390.71067811865476)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (310.71067811865476)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0036 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_3700
     * @tc.name      testCircleRad0037
     * @tc.desc      Verify pointOnCircle 0,0 r=10 angle 135deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0037 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(0, 0, 10, 2.356194490192345);
      expect(Math.abs(p.x - (-7.071067811865475)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (7.0710678118654755)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0037 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_3800
     * @tc.name      testCircleRad0038
     * @tc.desc      Verify pointOnCircle 50,60 r=20 angle 135deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0038 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(50, 60, 20, 2.356194490192345);
      expect(Math.abs(p.x - (35.85786437626905)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (74.14213562373095)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0038 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_3900
     * @tc.name      testCircleRad0039
     * @tc.desc      Verify pointOnCircle -15,25 r=5 angle 135deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0039 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(-15, 25, 5, 2.356194490192345);
      expect(Math.abs(p.x - (-18.535533905932738)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (28.535533905932738)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0039 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP1_4000
     * @tc.name      testCircleRad0040
     * @tc.desc      Verify pointOnCircle 200,-50 r=12 angle 135deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0040 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(200, -50, 12, 2.356194490192345);
      expect(Math.abs(p.x - (191.51471862576142)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (-41.51471862576143)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0040 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP2_4100
     * @tc.name      testCircleRad0041
     * @tc.desc      Verify pointOnCircle 7,9 r=1 angle 135deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0041 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(7, 9, 1, 2.356194490192345);
      expect(Math.abs(p.x - (6.292893218813452)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (9.707106781186548)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0041 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP2_4200
     * @tc.name      testCircleRad0042
     * @tc.desc      Verify pointOnCircle 320,240 r=100 angle 135deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0042 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(320, 240, 100, 2.356194490192345);
      expect(Math.abs(p.x - (249.28932188134524)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (310.71067811865476)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0042 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP2_4300
     * @tc.name      testCircleRad0043
     * @tc.desc      Verify pointOnCircle 0,0 r=10 angle 225deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0043 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(0, 0, 10, 3.9269908169872414);
      expect(Math.abs(p.x - (-7.071067811865477)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (-7.071067811865475)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0043 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP2_4400
     * @tc.name      testCircleRad0044
     * @tc.desc      Verify pointOnCircle 50,60 r=20 angle 225deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0044 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(50, 60, 20, 3.9269908169872414);
      expect(Math.abs(p.x - (35.85786437626905)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (45.85786437626905)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0044 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP2_4500
     * @tc.name      testCircleRad0045
     * @tc.desc      Verify pointOnCircle -15,25 r=5 angle 225deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0045 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(-15, 25, 5, 3.9269908169872414);
      expect(Math.abs(p.x - (-18.535533905932738)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (21.464466094067262)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0045 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP2_4600
     * @tc.name      testCircleRad0046
     * @tc.desc      Verify pointOnCircle 200,-50 r=12 angle 225deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0046 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(200, -50, 12, 3.9269908169872414);
      expect(Math.abs(p.x - (191.51471862576142)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (-58.48528137423857)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0046 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP2_4700
     * @tc.name      testCircleRad0047
     * @tc.desc      Verify pointOnCircle 7,9 r=1 angle 225deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0047 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(7, 9, 1, 3.9269908169872414);
      expect(Math.abs(p.x - (6.292893218813452)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (8.292893218813452)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0047 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP2_4800
     * @tc.name      testCircleRad0048
     * @tc.desc      Verify pointOnCircle 320,240 r=100 angle 225deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0048 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(320, 240, 100, 3.9269908169872414);
      expect(Math.abs(p.x - (249.28932188134524)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (169.28932188134524)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0048 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP2_4900
     * @tc.name      testCircleRad0049
     * @tc.desc      Verify pointOnCircle 0,0 r=10 angle 315deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0049 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(0, 0, 10, 5.497787143782138);
      expect(Math.abs(p.x - (7.071067811865474)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (-7.071067811865477)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0049 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP2_5000
     * @tc.name      testCircleRad0050
     * @tc.desc      Verify pointOnCircle 50,60 r=20 angle 315deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0050 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(50, 60, 20, 5.497787143782138);
      expect(Math.abs(p.x - (64.14213562373095)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (45.85786437626905)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0050 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP2_5100
     * @tc.name      testCircleRad0051
     * @tc.desc      Verify pointOnCircle -15,25 r=5 angle 315deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0051 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(-15, 25, 5, 5.497787143782138);
      expect(Math.abs(p.x - (-11.464466094067262)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (21.464466094067262)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0051 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP2_5200
     * @tc.name      testCircleRad0052
     * @tc.desc      Verify pointOnCircle 200,-50 r=12 angle 315deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0052 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(200, -50, 12, 5.497787143782138);
      expect(Math.abs(p.x - (208.48528137423858)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (-58.48528137423857)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0052 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP2_5300
     * @tc.name      testCircleRad0053
     * @tc.desc      Verify pointOnCircle 7,9 r=1 angle 315deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0053 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(7, 9, 1, 5.497787143782138);
      expect(Math.abs(p.x - (7.707106781186547)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (8.292893218813452)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0053 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP2_5400
     * @tc.name      testCircleRad0054
     * @tc.desc      Verify pointOnCircle 320,240 r=100 angle 315deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0054 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(320, 240, 100, 5.497787143782138);
      expect(Math.abs(p.x - (390.71067811865476)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (169.28932188134524)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0054 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP2_5500
     * @tc.name      testCircleRad0055
     * @tc.desc      Verify pointOnCircle 0,0 r=10 angle -90deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0055 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(0, 0, 10, -1.5707963267948966);
      expect(Math.abs(p.x - (6.123233995736766e-16)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (-10.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0055 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP2_5600
     * @tc.name      testCircleRad0056
     * @tc.desc      Verify pointOnCircle 50,60 r=20 angle -90deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0056 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(50, 60, 20, -1.5707963267948966);
      expect(Math.abs(p.x - (50.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (40.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0056 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP2_5700
     * @tc.name      testCircleRad0057
     * @tc.desc      Verify pointOnCircle -15,25 r=5 angle -90deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0057 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(-15, 25, 5, -1.5707963267948966);
      expect(Math.abs(p.x - (-15.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (20.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0057 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP2_5800
     * @tc.name      testCircleRad0058
     * @tc.desc      Verify pointOnCircle 200,-50 r=12 angle -90deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0058 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(200, -50, 12, -1.5707963267948966);
      expect(Math.abs(p.x - (200.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (-62.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0058 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP2_5900
     * @tc.name      testCircleRad0059
     * @tc.desc      Verify pointOnCircle 7,9 r=1 angle -90deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0059 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(7, 9, 1, -1.5707963267948966);
      expect(Math.abs(p.x - (7.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (8.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0059 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP2_6000
     * @tc.name      testCircleRad0060
     * @tc.desc      Verify pointOnCircle 320,240 r=100 angle -90deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0060 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(320, 240, 100, -1.5707963267948966);
      expect(Math.abs(p.x - (320.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (140.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0060 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP2_6100
     * @tc.name      testCircleRad0061
     * @tc.desc      Verify pointOnCircle 0,0 r=10 angle 30deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0061 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(0, 0, 10, 0.5235987755982988);
      expect(Math.abs(p.x - (8.660254037844387)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (4.999999999999999)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0061 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP2_6200
     * @tc.name      testCircleRad0062
     * @tc.desc      Verify pointOnCircle 50,60 r=20 angle 30deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0062 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(50, 60, 20, 0.5235987755982988);
      expect(Math.abs(p.x - (67.32050807568878)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (70.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0062 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP2_6300
     * @tc.name      testCircleRad0063
     * @tc.desc      Verify pointOnCircle -15,25 r=5 angle 30deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0063 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(-15, 25, 5, 0.5235987755982988);
      expect(Math.abs(p.x - (-10.669872981077805)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (27.5)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0063 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP2_6400
     * @tc.name      testCircleRad0064
     * @tc.desc      Verify pointOnCircle 200,-50 r=12 angle 30deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0064 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(200, -50, 12, 0.5235987755982988);
      expect(Math.abs(p.x - (210.39230484541326)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (-44.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0064 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP2_6500
     * @tc.name      testCircleRad0065
     * @tc.desc      Verify pointOnCircle 7,9 r=1 angle 30deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0065 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(7, 9, 1, 0.5235987755982988);
      expect(Math.abs(p.x - (7.866025403784438)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (9.5)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0065 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP2_6600
     * @tc.name      testCircleRad0066
     * @tc.desc      Verify pointOnCircle 320,240 r=100 angle 30deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0066 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(320, 240, 100, 0.5235987755982988);
      expect(Math.abs(p.x - (406.6025403784439)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (290.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0066 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP2_6700
     * @tc.name      testCircleRad0067
     * @tc.desc      Verify pointOnCircle 0,0 r=10 angle 60deg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0067 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(0, 0, 10, 1.0471975511965976);
      expect(Math.abs(p.x - (5.000000000000001)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (8.660254037844386)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0067 end');
    })

  })
}

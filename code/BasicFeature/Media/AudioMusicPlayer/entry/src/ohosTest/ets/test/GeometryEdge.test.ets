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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { angleToRadian } from '../../../main/ets/common/utils/LrcUtils';
import { Rectangle } from '../../../main/ets/common/constants/LyricConst';
import { paceTurn } from './TestPace';

const TAG: string = 'Sample_AudioMusicPlayer';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'AudioMusicPlayer_';
const EPSILON: number = 1e-9;

const ANGLE_SAMPLES: number[] = [
  0, 15, 30, 45, 60, 90, 120, 135, 150, 180, 225, 270, 315, 360, -90, -180, 720
];

export default function GeometryEdgeTest() {
  describe('GeometryEdgeTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_GEOMETRY_EDGE_0100
     * @tc.name      testGeometryEdge0001
     * @tc.desc      验证角度换算弧度时与圆周率比例关系一致且正弦余弦在容差内
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testGeometryEdge0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Angle_RadianScale_0001 begin');
      for (let angle of ANGLE_SAMPLES) {
        let radian: number = angleToRadian(angle);
        let oracle: number = angle * Math.PI / 180;
        let sineError: number = Math.abs(Math.sin(radian) - Math.sin(oracle));
        hilog.info(DOMAIN, TAG, '%{public}s',
          `${angle}度 => ${radian}, oracle=${oracle}, sin误差=${sineError}`);
        expect(radian).assertEqual(oracle);
        expect(Math.abs(radian * 180 / Math.PI - angle) <= EPSILON).assertTrue();
        expect(sineError <= EPSILON).assertTrue();
      }
      expect(ANGLE_SAMPLES.length).assertEqual(17);
      expect(angleToRadian(0)).assertEqual(0);
      expect(angleToRadian(180)).assertEqual(Math.PI);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Angle_RadianScale_0001 end');
    });

    /**
     * @tc.number    SUB_GEOMETRY_EDGE_0300
     * @tc.name      testGeometryEdge0003
     * @tc.desc      验证歌词高亮区域边界点判定包含边缘且区域外坐标不命中
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testGeometryEdge0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Rectangle_BoundaryHit_0003 begin');
      let rect: Rectangle = new Rectangle(10, 20, 110, 60);
      let center: boolean = rect.isIn(60, 40);
      let corners: boolean[] = [
        rect.isIn(10, 20),
        rect.isIn(110, 20),
        rect.isIn(10, 60),
        rect.isIn(110, 60)
      ];
      let outside: boolean[] = [
        rect.isIn(9.99, 40),
        rect.isIn(110.01, 40),
        rect.isIn(60, 19.99),
        rect.isIn(60, 60.01)
      ];
      hilog.info(DOMAIN, TAG, '%{public}s',
        `中心命中=${center}, 四角命中=${corners}, 外侧命中=${outside}`);
      expect(center).assertTrue();
      for (let hit of corners) {
        expect(hit).assertTrue();
      }
      for (let hit of outside) {
        expect(hit).assertFalse();
      }
      expect(rect.left).assertEqual(10);
      expect(rect.right).assertEqual(110);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Rectangle_BoundaryHit_0003 end');
    });
  });
}

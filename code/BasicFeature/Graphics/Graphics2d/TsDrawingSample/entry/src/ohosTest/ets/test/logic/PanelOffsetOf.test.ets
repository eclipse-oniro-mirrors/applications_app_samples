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
import { yieldToEventLoop } from '../TestEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { panelOffsetOf } from '../model/DrawingGeometryLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TsDrawingSample]';
const BUNDLE: string = 'TsDrawingSample_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for panelOffsetOf (74 cases). */
export default function panelOffsetOfTest(): void {
  describe('PanelOffsetOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0001
     * @tc.name      TsDrawingSample_PanelOffsetOf_0001
     * @tc.desc      panelOffsetOf(screenWidth=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_PanelOffsetOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0001 begin`);
      const actual: number = panelOffsetOf(0);
      logInfo(`panelOffsetOf(screenWidth=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PanelOffsetOf_0001 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0002
     * @tc.name      TsDrawingSample_PanelOffsetOf_0002
     * @tc.desc      panelOffsetOf(screenWidth=1) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_PanelOffsetOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0002 begin`);
      const actual: number = panelOffsetOf(1);
      logInfo(`panelOffsetOf(screenWidth=1): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PanelOffsetOf_0002 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0003
     * @tc.name      TsDrawingSample_PanelOffsetOf_0003
     * @tc.desc      panelOffsetOf(screenWidth=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PanelOffsetOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0003 begin`);
      const actual: number = panelOffsetOf(2);
      logInfo(`panelOffsetOf(screenWidth=2): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}PanelOffsetOf_0003 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0004
     * @tc.name      TsDrawingSample_PanelOffsetOf_0004
     * @tc.desc      panelOffsetOf(screenWidth=3) returns 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PanelOffsetOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0004 begin`);
      const actual: number = panelOffsetOf(3);
      logInfo(`panelOffsetOf(screenWidth=3): actual=${actual}`);
      expect(actual).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}PanelOffsetOf_0004 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0005
     * @tc.name      TsDrawingSample_PanelOffsetOf_0005
     * @tc.desc      panelOffsetOf(screenWidth=100) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0005 begin`);
      const actual: number = panelOffsetOf(100);
      logInfo(`panelOffsetOf(screenWidth=100): actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}PanelOffsetOf_0005 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0006
     * @tc.name      TsDrawingSample_PanelOffsetOf_0006
     * @tc.desc      panelOffsetOf(screenWidth=360) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0006 begin`);
      const actual: number = panelOffsetOf(360);
      logInfo(`panelOffsetOf(screenWidth=360): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PanelOffsetOf_0006 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0007
     * @tc.name      TsDrawingSample_PanelOffsetOf_0007
     * @tc.desc      panelOffsetOf(screenWidth=720) returns 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0007 begin`);
      const actual: number = panelOffsetOf(720);
      logInfo(`panelOffsetOf(screenWidth=720): actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}PanelOffsetOf_0007 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0008
     * @tc.name      TsDrawingSample_PanelOffsetOf_0008
     * @tc.desc      panelOffsetOf(screenWidth=1080) returns 540
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0008 begin`);
      const actual: number = panelOffsetOf(1080);
      logInfo(`panelOffsetOf(screenWidth=1080): actual=${actual}`);
      expect(actual).assertEqual(540);
      logInfo(`${BUNDLE}PanelOffsetOf_0008 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0009
     * @tc.name      TsDrawingSample_PanelOffsetOf_0009
     * @tc.desc      panelOffsetOf(screenWidth=1920) returns 960
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0009 begin`);
      const actual: number = panelOffsetOf(1920);
      logInfo(`panelOffsetOf(screenWidth=1920): actual=${actual}`);
      expect(actual).assertEqual(960);
      logInfo(`${BUNDLE}PanelOffsetOf_0009 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0010
     * @tc.name      TsDrawingSample_PanelOffsetOf_0010
     * @tc.desc      panelOffsetOf(screenWidth=-1) returns -0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PanelOffsetOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0010 begin`);
      const actual: number = panelOffsetOf(-1);
      logInfo(`panelOffsetOf(screenWidth=-1): actual=${actual}`);
      expect(actual).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}PanelOffsetOf_0010 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0011
     * @tc.name      TsDrawingSample_PanelOffsetOf_0011
     * @tc.desc      panelOffsetOf(screenWidth=10) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0011 begin`);
      const actual: number = panelOffsetOf(10);
      logInfo(`panelOffsetOf(screenWidth=10): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}PanelOffsetOf_0011 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0012
     * @tc.name      TsDrawingSample_PanelOffsetOf_0012
     * @tc.desc      panelOffsetOf(screenWidth=96) returns 48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0012 begin`);
      const actual: number = panelOffsetOf(96);
      logInfo(`panelOffsetOf(screenWidth=96): actual=${actual}`);
      expect(actual).assertEqual(48);
      logInfo(`${BUNDLE}PanelOffsetOf_0012 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0013
     * @tc.name      TsDrawingSample_PanelOffsetOf_0013
     * @tc.desc      panelOffsetOf(screenWidth=192) returns 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0013 begin`);
      const actual: number = panelOffsetOf(192);
      logInfo(`panelOffsetOf(screenWidth=192): actual=${actual}`);
      expect(actual).assertEqual(96);
      logInfo(`${BUNDLE}PanelOffsetOf_0013 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0014
     * @tc.name      TsDrawingSample_PanelOffsetOf_0014
     * @tc.desc      panelOffsetOf(screenWidth=288) returns 144
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0014 begin`);
      const actual: number = panelOffsetOf(288);
      logInfo(`panelOffsetOf(screenWidth=288): actual=${actual}`);
      expect(actual).assertEqual(144);
      logInfo(`${BUNDLE}PanelOffsetOf_0014 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0015
     * @tc.name      TsDrawingSample_PanelOffsetOf_0015
     * @tc.desc      panelOffsetOf(screenWidth=384) returns 192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0015 begin`);
      const actual: number = panelOffsetOf(384);
      logInfo(`panelOffsetOf(screenWidth=384): actual=${actual}`);
      expect(actual).assertEqual(192);
      logInfo(`${BUNDLE}PanelOffsetOf_0015 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0016
     * @tc.name      TsDrawingSample_PanelOffsetOf_0016
     * @tc.desc      panelOffsetOf(screenWidth=480) returns 240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0016 begin`);
      const actual: number = panelOffsetOf(480);
      logInfo(`panelOffsetOf(screenWidth=480): actual=${actual}`);
      expect(actual).assertEqual(240);
      logInfo(`${BUNDLE}PanelOffsetOf_0016 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0017
     * @tc.name      TsDrawingSample_PanelOffsetOf_0017
     * @tc.desc      panelOffsetOf(screenWidth=576) returns 288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0017 begin`);
      const actual: number = panelOffsetOf(576);
      logInfo(`panelOffsetOf(screenWidth=576): actual=${actual}`);
      expect(actual).assertEqual(288);
      logInfo(`${BUNDLE}PanelOffsetOf_0017 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0018
     * @tc.name      TsDrawingSample_PanelOffsetOf_0018
     * @tc.desc      panelOffsetOf(screenWidth=672) returns 336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0018 begin`);
      const actual: number = panelOffsetOf(672);
      logInfo(`panelOffsetOf(screenWidth=672): actual=${actual}`);
      expect(actual).assertEqual(336);
      logInfo(`${BUNDLE}PanelOffsetOf_0018 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0019
     * @tc.name      TsDrawingSample_PanelOffsetOf_0019
     * @tc.desc      panelOffsetOf(screenWidth=768) returns 384
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0019 begin`);
      const actual: number = panelOffsetOf(768);
      logInfo(`panelOffsetOf(screenWidth=768): actual=${actual}`);
      expect(actual).assertEqual(384);
      logInfo(`${BUNDLE}PanelOffsetOf_0019 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0020
     * @tc.name      TsDrawingSample_PanelOffsetOf_0020
     * @tc.desc      panelOffsetOf(screenWidth=864) returns 432
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0020 begin`);
      const actual: number = panelOffsetOf(864);
      logInfo(`panelOffsetOf(screenWidth=864): actual=${actual}`);
      expect(actual).assertEqual(432);
      logInfo(`${BUNDLE}PanelOffsetOf_0020 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0021
     * @tc.name      TsDrawingSample_PanelOffsetOf_0021
     * @tc.desc      panelOffsetOf(screenWidth=960) returns 480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0021 begin`);
      const actual: number = panelOffsetOf(960);
      logInfo(`panelOffsetOf(screenWidth=960): actual=${actual}`);
      expect(actual).assertEqual(480);
      logInfo(`${BUNDLE}PanelOffsetOf_0021 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0022
     * @tc.name      TsDrawingSample_PanelOffsetOf_0022
     * @tc.desc      panelOffsetOf(screenWidth=1056) returns 528
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0022 begin`);
      const actual: number = panelOffsetOf(1056);
      logInfo(`panelOffsetOf(screenWidth=1056): actual=${actual}`);
      expect(actual).assertEqual(528);
      logInfo(`${BUNDLE}PanelOffsetOf_0022 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0023
     * @tc.name      TsDrawingSample_PanelOffsetOf_0023
     * @tc.desc      panelOffsetOf(screenWidth=1152) returns 576
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0023 begin`);
      const actual: number = panelOffsetOf(1152);
      logInfo(`panelOffsetOf(screenWidth=1152): actual=${actual}`);
      expect(actual).assertEqual(576);
      logInfo(`${BUNDLE}PanelOffsetOf_0023 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0024
     * @tc.name      TsDrawingSample_PanelOffsetOf_0024
     * @tc.desc      panelOffsetOf(screenWidth=1248) returns 624
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0024 begin`);
      const actual: number = panelOffsetOf(1248);
      logInfo(`panelOffsetOf(screenWidth=1248): actual=${actual}`);
      expect(actual).assertEqual(624);
      logInfo(`${BUNDLE}PanelOffsetOf_0024 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0025
     * @tc.name      TsDrawingSample_PanelOffsetOf_0025
     * @tc.desc      panelOffsetOf(screenWidth=1344) returns 672
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0025 begin`);
      const actual: number = panelOffsetOf(1344);
      logInfo(`panelOffsetOf(screenWidth=1344): actual=${actual}`);
      expect(actual).assertEqual(672);
      logInfo(`${BUNDLE}PanelOffsetOf_0025 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0026
     * @tc.name      TsDrawingSample_PanelOffsetOf_0026
     * @tc.desc      panelOffsetOf(screenWidth=1440) returns 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0026 begin`);
      const actual: number = panelOffsetOf(1440);
      logInfo(`panelOffsetOf(screenWidth=1440): actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}PanelOffsetOf_0026 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0027
     * @tc.name      TsDrawingSample_PanelOffsetOf_0027
     * @tc.desc      panelOffsetOf(screenWidth=1536) returns 768
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0027 begin`);
      const actual: number = panelOffsetOf(1536);
      logInfo(`panelOffsetOf(screenWidth=1536): actual=${actual}`);
      expect(actual).assertEqual(768);
      logInfo(`${BUNDLE}PanelOffsetOf_0027 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0028
     * @tc.name      TsDrawingSample_PanelOffsetOf_0028
     * @tc.desc      panelOffsetOf(screenWidth=1632) returns 816
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0028 begin`);
      const actual: number = panelOffsetOf(1632);
      logInfo(`panelOffsetOf(screenWidth=1632): actual=${actual}`);
      expect(actual).assertEqual(816);
      logInfo(`${BUNDLE}PanelOffsetOf_0028 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0029
     * @tc.name      TsDrawingSample_PanelOffsetOf_0029
     * @tc.desc      panelOffsetOf(screenWidth=1728) returns 864
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0029 begin`);
      const actual: number = panelOffsetOf(1728);
      logInfo(`panelOffsetOf(screenWidth=1728): actual=${actual}`);
      expect(actual).assertEqual(864);
      logInfo(`${BUNDLE}PanelOffsetOf_0029 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0030
     * @tc.name      TsDrawingSample_PanelOffsetOf_0030
     * @tc.desc      panelOffsetOf(screenWidth=1824) returns 912
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0030 begin`);
      const actual: number = panelOffsetOf(1824);
      logInfo(`panelOffsetOf(screenWidth=1824): actual=${actual}`);
      expect(actual).assertEqual(912);
      logInfo(`${BUNDLE}PanelOffsetOf_0030 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0031
     * @tc.name      TsDrawingSample_PanelOffsetOf_0031
     * @tc.desc      panelOffsetOf(screenWidth=2016) returns 1008
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0031 begin`);
      const actual: number = panelOffsetOf(2016);
      logInfo(`panelOffsetOf(screenWidth=2016): actual=${actual}`);
      expect(actual).assertEqual(1008);
      logInfo(`${BUNDLE}PanelOffsetOf_0031 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0032
     * @tc.name      TsDrawingSample_PanelOffsetOf_0032
     * @tc.desc      panelOffsetOf(screenWidth=2112) returns 1056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0032 begin`);
      const actual: number = panelOffsetOf(2112);
      logInfo(`panelOffsetOf(screenWidth=2112): actual=${actual}`);
      expect(actual).assertEqual(1056);
      logInfo(`${BUNDLE}PanelOffsetOf_0032 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0033
     * @tc.name      TsDrawingSample_PanelOffsetOf_0033
     * @tc.desc      panelOffsetOf(screenWidth=2208) returns 1104
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0033 begin`);
      const actual: number = panelOffsetOf(2208);
      logInfo(`panelOffsetOf(screenWidth=2208): actual=${actual}`);
      expect(actual).assertEqual(1104);
      logInfo(`${BUNDLE}PanelOffsetOf_0033 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0034
     * @tc.name      TsDrawingSample_PanelOffsetOf_0034
     * @tc.desc      panelOffsetOf(screenWidth=2304) returns 1152
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0034 begin`);
      const actual: number = panelOffsetOf(2304);
      logInfo(`panelOffsetOf(screenWidth=2304): actual=${actual}`);
      expect(actual).assertEqual(1152);
      logInfo(`${BUNDLE}PanelOffsetOf_0034 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0035
     * @tc.name      TsDrawingSample_PanelOffsetOf_0035
     * @tc.desc      panelOffsetOf(screenWidth=2400) returns 1200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0035 begin`);
      const actual: number = panelOffsetOf(2400);
      logInfo(`panelOffsetOf(screenWidth=2400): actual=${actual}`);
      expect(actual).assertEqual(1200);
      logInfo(`${BUNDLE}PanelOffsetOf_0035 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0036
     * @tc.name      TsDrawingSample_PanelOffsetOf_0036
     * @tc.desc      panelOffsetOf(screenWidth=2496) returns 1248
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0036 begin`);
      const actual: number = panelOffsetOf(2496);
      logInfo(`panelOffsetOf(screenWidth=2496): actual=${actual}`);
      expect(actual).assertEqual(1248);
      logInfo(`${BUNDLE}PanelOffsetOf_0036 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0037
     * @tc.name      TsDrawingSample_PanelOffsetOf_0037
     * @tc.desc      panelOffsetOf(screenWidth=2592) returns 1296
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0037 begin`);
      const actual: number = panelOffsetOf(2592);
      logInfo(`panelOffsetOf(screenWidth=2592): actual=${actual}`);
      expect(actual).assertEqual(1296);
      logInfo(`${BUNDLE}PanelOffsetOf_0037 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0038
     * @tc.name      TsDrawingSample_PanelOffsetOf_0038
     * @tc.desc      panelOffsetOf(screenWidth=2688) returns 1344
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0038 begin`);
      const actual: number = panelOffsetOf(2688);
      logInfo(`panelOffsetOf(screenWidth=2688): actual=${actual}`);
      expect(actual).assertEqual(1344);
      logInfo(`${BUNDLE}PanelOffsetOf_0038 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0039
     * @tc.name      TsDrawingSample_PanelOffsetOf_0039
     * @tc.desc      panelOffsetOf(screenWidth=2784) returns 1392
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0039 begin`);
      const actual: number = panelOffsetOf(2784);
      logInfo(`panelOffsetOf(screenWidth=2784): actual=${actual}`);
      expect(actual).assertEqual(1392);
      logInfo(`${BUNDLE}PanelOffsetOf_0039 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0040
     * @tc.name      TsDrawingSample_PanelOffsetOf_0040
     * @tc.desc      panelOffsetOf(screenWidth=2880) returns 1440
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0040 begin`);
      const actual: number = panelOffsetOf(2880);
      logInfo(`panelOffsetOf(screenWidth=2880): actual=${actual}`);
      expect(actual).assertEqual(1440);
      logInfo(`${BUNDLE}PanelOffsetOf_0040 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0041
     * @tc.name      TsDrawingSample_PanelOffsetOf_0041
     * @tc.desc      panelOffsetOf(screenWidth=2976) returns 1488
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0041 begin`);
      const actual: number = panelOffsetOf(2976);
      logInfo(`panelOffsetOf(screenWidth=2976): actual=${actual}`);
      expect(actual).assertEqual(1488);
      logInfo(`${BUNDLE}PanelOffsetOf_0041 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0042
     * @tc.name      TsDrawingSample_PanelOffsetOf_0042
     * @tc.desc      panelOffsetOf(screenWidth=3072) returns 1536
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0042 begin`);
      const actual: number = panelOffsetOf(3072);
      logInfo(`panelOffsetOf(screenWidth=3072): actual=${actual}`);
      expect(actual).assertEqual(1536);
      logInfo(`${BUNDLE}PanelOffsetOf_0042 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0043
     * @tc.name      TsDrawingSample_PanelOffsetOf_0043
     * @tc.desc      panelOffsetOf(screenWidth=3168) returns 1584
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0043 begin`);
      const actual: number = panelOffsetOf(3168);
      logInfo(`panelOffsetOf(screenWidth=3168): actual=${actual}`);
      expect(actual).assertEqual(1584);
      logInfo(`${BUNDLE}PanelOffsetOf_0043 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0044
     * @tc.name      TsDrawingSample_PanelOffsetOf_0044
     * @tc.desc      panelOffsetOf(screenWidth=3264) returns 1632
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0044 begin`);
      const actual: number = panelOffsetOf(3264);
      logInfo(`panelOffsetOf(screenWidth=3264): actual=${actual}`);
      expect(actual).assertEqual(1632);
      logInfo(`${BUNDLE}PanelOffsetOf_0044 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0045
     * @tc.name      TsDrawingSample_PanelOffsetOf_0045
     * @tc.desc      panelOffsetOf(screenWidth=3360) returns 1680
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0045 begin`);
      const actual: number = panelOffsetOf(3360);
      logInfo(`panelOffsetOf(screenWidth=3360): actual=${actual}`);
      expect(actual).assertEqual(1680);
      logInfo(`${BUNDLE}PanelOffsetOf_0045 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0046
     * @tc.name      TsDrawingSample_PanelOffsetOf_0046
     * @tc.desc      panelOffsetOf(screenWidth=3456) returns 1728
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0046 begin`);
      const actual: number = panelOffsetOf(3456);
      logInfo(`panelOffsetOf(screenWidth=3456): actual=${actual}`);
      expect(actual).assertEqual(1728);
      logInfo(`${BUNDLE}PanelOffsetOf_0046 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0047
     * @tc.name      TsDrawingSample_PanelOffsetOf_0047
     * @tc.desc      panelOffsetOf(screenWidth=3552) returns 1776
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0047 begin`);
      const actual: number = panelOffsetOf(3552);
      logInfo(`panelOffsetOf(screenWidth=3552): actual=${actual}`);
      expect(actual).assertEqual(1776);
      logInfo(`${BUNDLE}PanelOffsetOf_0047 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0048
     * @tc.name      TsDrawingSample_PanelOffsetOf_0048
     * @tc.desc      panelOffsetOf(screenWidth=3648) returns 1824
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0048 begin`);
      const actual: number = panelOffsetOf(3648);
      logInfo(`panelOffsetOf(screenWidth=3648): actual=${actual}`);
      expect(actual).assertEqual(1824);
      logInfo(`${BUNDLE}PanelOffsetOf_0048 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0049
     * @tc.name      TsDrawingSample_PanelOffsetOf_0049
     * @tc.desc      panelOffsetOf(screenWidth=3744) returns 1872
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0049 begin`);
      const actual: number = panelOffsetOf(3744);
      logInfo(`panelOffsetOf(screenWidth=3744): actual=${actual}`);
      expect(actual).assertEqual(1872);
      logInfo(`${BUNDLE}PanelOffsetOf_0049 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0050
     * @tc.name      TsDrawingSample_PanelOffsetOf_0050
     * @tc.desc      panelOffsetOf(screenWidth=3840) returns 1920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0050 begin`);
      const actual: number = panelOffsetOf(3840);
      logInfo(`panelOffsetOf(screenWidth=3840): actual=${actual}`);
      expect(actual).assertEqual(1920);
      logInfo(`${BUNDLE}PanelOffsetOf_0050 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0051
     * @tc.name      TsDrawingSample_PanelOffsetOf_0051
     * @tc.desc      panelOffsetOf(screenWidth=3005) returns 1502.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0051 begin`);
      const actual: number = panelOffsetOf(3005);
      logInfo(`panelOffsetOf(screenWidth=3005): actual=${actual}`);
      expect(actual).assertClose(1502.5, PRECISION);
      logInfo(`${BUNDLE}PanelOffsetOf_0051 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0052
     * @tc.name      TsDrawingSample_PanelOffsetOf_0052
     * @tc.desc      panelOffsetOf(screenWidth=-1128) returns -564
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PanelOffsetOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0052 begin`);
      const actual: number = panelOffsetOf(-1128);
      logInfo(`panelOffsetOf(screenWidth=-1128): actual=${actual}`);
      expect(actual).assertEqual(-564);
      logInfo(`${BUNDLE}PanelOffsetOf_0052 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0053
     * @tc.name      TsDrawingSample_PanelOffsetOf_0053
     * @tc.desc      panelOffsetOf(screenWidth=-59) returns -29.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PanelOffsetOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0053 begin`);
      const actual: number = panelOffsetOf(-59);
      logInfo(`panelOffsetOf(screenWidth=-59): actual=${actual}`);
      expect(actual).assertClose(-29.5, PRECISION);
      logInfo(`${BUNDLE}PanelOffsetOf_0053 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0054
     * @tc.name      TsDrawingSample_PanelOffsetOf_0054
     * @tc.desc      panelOffsetOf(screenWidth=239) returns 119.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0054 begin`);
      const actual: number = panelOffsetOf(239);
      logInfo(`panelOffsetOf(screenWidth=239): actual=${actual}`);
      expect(actual).assertClose(119.5, PRECISION);
      logInfo(`${BUNDLE}PanelOffsetOf_0054 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0055
     * @tc.name      TsDrawingSample_PanelOffsetOf_0055
     * @tc.desc      panelOffsetOf(screenWidth=1891.45) returns 945.725
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0055 begin`);
      const actual: number = panelOffsetOf(1891.45);
      logInfo(`panelOffsetOf(screenWidth=1891.45): actual=${actual}`);
      expect(actual).assertClose(945.725, PRECISION);
      logInfo(`${BUNDLE}PanelOffsetOf_0055 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0056
     * @tc.name      TsDrawingSample_PanelOffsetOf_0056
     * @tc.desc      panelOffsetOf(screenWidth=545.51) returns 272.755
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0056 begin`);
      const actual: number = panelOffsetOf(545.51);
      logInfo(`panelOffsetOf(screenWidth=545.51): actual=${actual}`);
      expect(actual).assertClose(272.755, PRECISION);
      logInfo(`${BUNDLE}PanelOffsetOf_0056 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0057
     * @tc.name      TsDrawingSample_PanelOffsetOf_0057
     * @tc.desc      panelOffsetOf(screenWidth=939) returns 469.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0057 begin`);
      const actual: number = panelOffsetOf(939);
      logInfo(`panelOffsetOf(screenWidth=939): actual=${actual}`);
      expect(actual).assertClose(469.5, PRECISION);
      logInfo(`${BUNDLE}PanelOffsetOf_0057 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0058
     * @tc.name      TsDrawingSample_PanelOffsetOf_0058
     * @tc.desc      panelOffsetOf(screenWidth=1322) returns 661
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0058 begin`);
      const actual: number = panelOffsetOf(1322);
      logInfo(`panelOffsetOf(screenWidth=1322): actual=${actual}`);
      expect(actual).assertEqual(661);
      logInfo(`${BUNDLE}PanelOffsetOf_0058 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0059
     * @tc.name      TsDrawingSample_PanelOffsetOf_0059
     * @tc.desc      panelOffsetOf(screenWidth=-421) returns -210.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PanelOffsetOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0059 begin`);
      const actual: number = panelOffsetOf(-421);
      logInfo(`panelOffsetOf(screenWidth=-421): actual=${actual}`);
      expect(actual).assertClose(-210.5, PRECISION);
      logInfo(`${BUNDLE}PanelOffsetOf_0059 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0060
     * @tc.name      TsDrawingSample_PanelOffsetOf_0060
     * @tc.desc      panelOffsetOf(screenWidth=-1603) returns -801.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PanelOffsetOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0060 begin`);
      const actual: number = panelOffsetOf(-1603);
      logInfo(`panelOffsetOf(screenWidth=-1603): actual=${actual}`);
      expect(actual).assertClose(-801.5, PRECISION);
      logInfo(`${BUNDLE}PanelOffsetOf_0060 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0061
     * @tc.name      TsDrawingSample_PanelOffsetOf_0061
     * @tc.desc      panelOffsetOf(screenWidth=-867) returns -433.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PanelOffsetOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0061 begin`);
      const actual: number = panelOffsetOf(-867);
      logInfo(`panelOffsetOf(screenWidth=-867): actual=${actual}`);
      expect(actual).assertClose(-433.5, PRECISION);
      logInfo(`${BUNDLE}PanelOffsetOf_0061 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0062
     * @tc.name      TsDrawingSample_PanelOffsetOf_0062
     * @tc.desc      panelOffsetOf(screenWidth=1174.06) returns 587.03
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0062 begin`);
      const actual: number = panelOffsetOf(1174.06);
      logInfo(`panelOffsetOf(screenWidth=1174.06): actual=${actual}`);
      expect(actual).assertClose(587.03, PRECISION);
      logInfo(`${BUNDLE}PanelOffsetOf_0062 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0063
     * @tc.name      TsDrawingSample_PanelOffsetOf_0063
     * @tc.desc      panelOffsetOf(screenWidth=1861.39) returns 930.695
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0063 begin`);
      const actual: number = panelOffsetOf(1861.39);
      logInfo(`panelOffsetOf(screenWidth=1861.39): actual=${actual}`);
      expect(actual).assertClose(930.695, PRECISION);
      logInfo(`${BUNDLE}PanelOffsetOf_0063 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0064
     * @tc.name      TsDrawingSample_PanelOffsetOf_0064
     * @tc.desc      panelOffsetOf(screenWidth=-1281) returns -640.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PanelOffsetOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0064 begin`);
      const actual: number = panelOffsetOf(-1281);
      logInfo(`panelOffsetOf(screenWidth=-1281): actual=${actual}`);
      expect(actual).assertClose(-640.5, PRECISION);
      logInfo(`${BUNDLE}PanelOffsetOf_0064 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0065
     * @tc.name      TsDrawingSample_PanelOffsetOf_0065
     * @tc.desc      panelOffsetOf(screenWidth=-641) returns -320.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PanelOffsetOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0065 begin`);
      const actual: number = panelOffsetOf(-641);
      logInfo(`panelOffsetOf(screenWidth=-641): actual=${actual}`);
      expect(actual).assertClose(-320.5, PRECISION);
      logInfo(`${BUNDLE}PanelOffsetOf_0065 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0066
     * @tc.name      TsDrawingSample_PanelOffsetOf_0066
     * @tc.desc      panelOffsetOf(screenWidth=357.01) returns 178.505
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0066 begin`);
      const actual: number = panelOffsetOf(357.01);
      logInfo(`panelOffsetOf(screenWidth=357.01): actual=${actual}`);
      expect(actual).assertClose(178.505, PRECISION);
      logInfo(`${BUNDLE}PanelOffsetOf_0066 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0067
     * @tc.name      TsDrawingSample_PanelOffsetOf_0067
     * @tc.desc      panelOffsetOf(screenWidth=664) returns 332
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0067 begin`);
      const actual: number = panelOffsetOf(664);
      logInfo(`panelOffsetOf(screenWidth=664): actual=${actual}`);
      expect(actual).assertEqual(332);
      logInfo(`${BUNDLE}PanelOffsetOf_0067 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0068
     * @tc.name      TsDrawingSample_PanelOffsetOf_0068
     * @tc.desc      panelOffsetOf(screenWidth=-148) returns -74
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PanelOffsetOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0068 begin`);
      const actual: number = panelOffsetOf(-148);
      logInfo(`panelOffsetOf(screenWidth=-148): actual=${actual}`);
      expect(actual).assertEqual(-74);
      logInfo(`${BUNDLE}PanelOffsetOf_0068 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0069
     * @tc.name      TsDrawingSample_PanelOffsetOf_0069
     * @tc.desc      panelOffsetOf(screenWidth=1001) returns 500.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0069 begin`);
      const actual: number = panelOffsetOf(1001);
      logInfo(`panelOffsetOf(screenWidth=1001): actual=${actual}`);
      expect(actual).assertClose(500.5, PRECISION);
      logInfo(`${BUNDLE}PanelOffsetOf_0069 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0070
     * @tc.name      TsDrawingSample_PanelOffsetOf_0070
     * @tc.desc      panelOffsetOf(screenWidth=1561) returns 780.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0070 begin`);
      const actual: number = panelOffsetOf(1561);
      logInfo(`panelOffsetOf(screenWidth=1561): actual=${actual}`);
      expect(actual).assertClose(780.5, PRECISION);
      logInfo(`${BUNDLE}PanelOffsetOf_0070 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0071
     * @tc.name      TsDrawingSample_PanelOffsetOf_0071
     * @tc.desc      panelOffsetOf(screenWidth=1492.2) returns 746.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0071 begin`);
      const actual: number = panelOffsetOf(1492.2);
      logInfo(`panelOffsetOf(screenWidth=1492.2): actual=${actual}`);
      expect(actual).assertClose(746.1, PRECISION);
      logInfo(`${BUNDLE}PanelOffsetOf_0071 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0072
     * @tc.name      TsDrawingSample_PanelOffsetOf_0072
     * @tc.desc      panelOffsetOf(screenWidth=421) returns 210.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PanelOffsetOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0072 begin`);
      const actual: number = panelOffsetOf(421);
      logInfo(`panelOffsetOf(screenWidth=421): actual=${actual}`);
      expect(actual).assertClose(210.5, PRECISION);
      logInfo(`${BUNDLE}PanelOffsetOf_0072 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0073
     * @tc.name      TsDrawingSample_PanelOffsetOf_0073
     * @tc.desc      panelOffsetOf(screenWidth=-901) returns -450.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PanelOffsetOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0073 begin`);
      const actual: number = panelOffsetOf(-901);
      logInfo(`panelOffsetOf(screenWidth=-901): actual=${actual}`);
      expect(actual).assertClose(-450.5, PRECISION);
      logInfo(`${BUNDLE}PanelOffsetOf_0073 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PANEL_OFFSET_OF_0074
     * @tc.name      TsDrawingSample_PanelOffsetOf_0074
     * @tc.desc      panelOffsetOf(screenWidth=-1437) returns -718.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PanelOffsetOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PanelOffsetOf_0074 begin`);
      const actual: number = panelOffsetOf(-1437);
      logInfo(`panelOffsetOf(screenWidth=-1437): actual=${actual}`);
      expect(actual).assertClose(-718.5, PRECISION);
      logInfo(`${BUNDLE}PanelOffsetOf_0074 end`);
    });
  });
}

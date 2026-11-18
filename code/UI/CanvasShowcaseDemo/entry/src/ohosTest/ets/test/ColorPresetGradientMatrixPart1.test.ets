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
import { ColorUtil, GradientPreset } from '../../../main/ets/model/utils/ColorUtil';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF817;
const TAG: string = '[Sample_Canvas]';

export default function ColorPresetGradientMatrixPart1Test(): void {
  describe('ColorPresetGradientMatrixPart1', () => {

    /**
     * @tc.number    SUB_CANVAS_CPGP1_0100
     * @tc.name      testPresetStop0001
     * @tc.desc      Verify SKY gradient at t=0 returns rgba(13,71,161,1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetStop0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0001 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(GradientPreset.SKY, 0)).assertEqual('rgba(13,71,161,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0001 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPGP1_0200
     * @tc.name      testPresetStop0002
     * @tc.desc      Verify SKY gradient at t=0.1 returns rgba(17,85,176,1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetStop0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0002 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(GradientPreset.SKY, 0.1)).assertEqual('rgba(17,85,176,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0002 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPGP1_0300
     * @tc.name      testPresetStop0003
     * @tc.desc      Verify SKY gradient at t=0.25 returns rgba(22,106,198,1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetStop0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0003 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(GradientPreset.SKY, 0.25)).assertEqual('rgba(22,106,198,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0003 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPGP1_0400
     * @tc.name      testPresetStop0004
     * @tc.desc      Verify SKY gradient at t=0.4 returns rgba(40,131,217,1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetStop0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0004 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(GradientPreset.SKY, 0.4)).assertEqual('rgba(40,131,217,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0004 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPGP1_0500
     * @tc.name      testPresetStop0005
     * @tc.desc      Verify SKY gradient at t=0.5 returns rgba(63,150,228,1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetStop0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0005 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(GradientPreset.SKY, 0.5)).assertEqual('rgba(63,150,228,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0005 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPGP1_0600
     * @tc.name      testPresetStop0006
     * @tc.desc      Verify SKY gradient at t=0.6 returns rgba(85,168,239,1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetStop0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0006 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(GradientPreset.SKY, 0.6)).assertEqual('rgba(85,168,239,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0006 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPGP1_0700
     * @tc.name      testPresetStop0007
     * @tc.desc      Verify SKY gradient at t=0.75 returns rgba(122,191,247,1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetStop0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0007 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(GradientPreset.SKY, 0.75)).assertEqual('rgba(122,191,247,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0007 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPGP1_0800
     * @tc.name      testPresetStop0008
     * @tc.desc      Verify SKY gradient at t=0.9 returns rgba(161,210,250,1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetStop0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0008 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(GradientPreset.SKY, 0.9)).assertEqual('rgba(161,210,250,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0008 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPGP1_0900
     * @tc.name      testPresetStop0009
     * @tc.desc      Verify SKY gradient at t=1 returns rgba(187,222,251,1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetStop0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0009 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(GradientPreset.SKY, 1)).assertEqual('rgba(187,222,251,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0009 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPGP1_1000
     * @tc.name      testPresetStop0010
     * @tc.desc      Verify SUNSET gradient at t=0 returns rgba(255,23,68,1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetStop0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0010 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(GradientPreset.SUNSET, 0)).assertEqual('rgba(255,23,68,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0010 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPGP1_1100
     * @tc.name      testPresetStop0011
     * @tc.desc      Verify SUNSET gradient at t=0.1 returns rgba(255,49,48,1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetStop0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0011 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(GradientPreset.SUNSET, 0.1)).assertEqual('rgba(255,49,48,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0011 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPGP1_1200
     * @tc.name      testPresetStop0012
     * @tc.desc      Verify SUNSET gradient at t=0.25 returns rgba(255,88,17,1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetStop0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0012 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(GradientPreset.SUNSET, 0.25)).assertEqual('rgba(255,88,17,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0012 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPGP1_1300
     * @tc.name      testPresetStop0013
     * @tc.desc      Verify SUNSET gradient at t=0.4 returns rgba(255,130,0,1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetStop0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0013 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(GradientPreset.SUNSET, 0.4)).assertEqual('rgba(255,130,0,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0013 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPGP1_1400
     * @tc.name      testPresetStop0014
     * @tc.desc      Verify SUNSET gradient at t=0.5 returns rgba(255,162,0,1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetStop0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0014 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(GradientPreset.SUNSET, 0.5)).assertEqual('rgba(255,162,0,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0014 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPGP1_1500
     * @tc.name      testPresetStop0015
     * @tc.desc      Verify SUNSET gradient at t=0.6 returns rgba(255,193,0,1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetStop0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0015 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(GradientPreset.SUNSET, 0.6)).assertEqual('rgba(255,193,0,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0015 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPGP1_1600
     * @tc.name      testPresetStop0016
     * @tc.desc      Verify SUNSET gradient at t=0.75 returns rgba(255,222,39,1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetStop0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0016 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(GradientPreset.SUNSET, 0.75)).assertEqual('rgba(255,222,39,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0016 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPGP1_1700
     * @tc.name      testPresetStop0017
     * @tc.desc      Verify SUNSET gradient at t=0.9 returns rgba(255,236,110,1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetStop0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0017 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(GradientPreset.SUNSET, 0.9)).assertEqual('rgba(255,236,110,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0017 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPGP1_1800
     * @tc.name      testPresetStop0018
     * @tc.desc      Verify SUNSET gradient at t=1 returns rgba(255,245,157,1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetStop0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0018 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(GradientPreset.SUNSET, 1)).assertEqual('rgba(255,245,157,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0018 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPGP1_1900
     * @tc.name      testPresetStop0019
     * @tc.desc      Verify OCEAN gradient at t=0 returns rgba(0,77,64,1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetStop0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0019 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(GradientPreset.OCEAN, 0)).assertEqual('rgba(0,77,64,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0019 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPGP1_2000
     * @tc.name      testPresetStop0020
     * @tc.desc      Verify OCEAN gradient at t=0.1 returns rgba(0,95,82,1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetStop0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0020 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(GradientPreset.OCEAN, 0.1)).assertEqual('rgba(0,95,82,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0020 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPGP1_2100
     * @tc.name      testPresetStop0021
     * @tc.desc      Verify OCEAN gradient at t=0.25 returns rgba(0,122,108,1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetStop0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0021 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(GradientPreset.OCEAN, 0.25)).assertEqual('rgba(0,122,108,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0021 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPGP1_2200
     * @tc.name      testPresetStop0022
     * @tc.desc      Verify OCEAN gradient at t=0.4 returns rgba(15,146,133,1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetStop0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0022 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(GradientPreset.OCEAN, 0.4)).assertEqual('rgba(15,146,133,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0022 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPGP1_2300
     * @tc.name      testPresetStop0023
     * @tc.desc      Verify OCEAN gradient at t=0.5 returns rgba(39,160,148,1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetStop0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0023 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(GradientPreset.OCEAN, 0.5)).assertEqual('rgba(39,160,148,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0023 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPGP1_2400
     * @tc.name      testPresetStop0024
     * @tc.desc      Verify OCEAN gradient at t=0.6 returns rgba(62,173,162,1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetStop0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0024 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(GradientPreset.OCEAN, 0.6)).assertEqual('rgba(62,173,162,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0024 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPGP1_2500
     * @tc.name      testPresetStop0025
     * @tc.desc      Verify OCEAN gradient at t=0.75 returns rgba(102,192,184,1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetStop0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0025 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(GradientPreset.OCEAN, 0.75)).assertEqual('rgba(102,192,184,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0025 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPGP1_2600
     * @tc.name      testPresetStop0026
     * @tc.desc      Verify OCEAN gradient at t=0.9 returns rgba(148,211,205,1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetStop0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0026 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(GradientPreset.OCEAN, 0.9)).assertEqual('rgba(148,211,205,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0026 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPGP1_2700
     * @tc.name      testPresetStop0027
     * @tc.desc      Verify OCEAN gradient at t=1 returns rgba(178,223,219,1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetStop0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0027 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(GradientPreset.OCEAN, 1)).assertEqual('rgba(178,223,219,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0027 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPGP1_2800
     * @tc.name      testPresetStop0028
     * @tc.desc      Verify FOREST gradient at t=0 returns rgba(27,94,32,1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetStop0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0028 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(GradientPreset.FOREST, 0)).assertEqual('rgba(27,94,32,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0028 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPGP1_2900
     * @tc.name      testPresetStop0029
     * @tc.desc      Verify FOREST gradient at t=0.1 returns rgba(39,114,44,1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetStop0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0029 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(GradientPreset.FOREST, 0.1)).assertEqual('rgba(39,114,44,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0029 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPGP1_3000
     * @tc.name      testPresetStop0030
     * @tc.desc      Verify FOREST gradient at t=0.25 returns rgba(57,144,61,1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetStop0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0030 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(GradientPreset.FOREST, 0.25)).assertEqual('rgba(57,144,61,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0030 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPGP1_3100
     * @tc.name      testPresetStop0031
     * @tc.desc      Verify FOREST gradient at t=0.4 returns rgba(85,169,77,1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetStop0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0031 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(GradientPreset.FOREST, 0.4)).assertEqual('rgba(85,169,77,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0031 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPGP1_3200
     * @tc.name      testPresetStop0032
     * @tc.desc      Verify FOREST gradient at t=0.5 returns rgba(112,182,86,1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetStop0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0032 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(GradientPreset.FOREST, 0.5)).assertEqual('rgba(112,182,86,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0032 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPGP1_3300
     * @tc.name      testPresetStop0033
     * @tc.desc      Verify FOREST gradient at t=0.6 returns rgba(138,195,95,1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetStop0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0033 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(GradientPreset.FOREST, 0.6)).assertEqual('rgba(138,195,95,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0033 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPGP1_3400
     * @tc.name      testPresetStop0034
     * @tc.desc      Verify FOREST gradient at t=0.75 returns rgba(172,212,126,1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetStop0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0034 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(GradientPreset.FOREST, 0.75)).assertEqual('rgba(172,212,126,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0034 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPGP1_3500
     * @tc.name      testPresetStop0035
     * @tc.desc      Verify FOREST gradient at t=0.9 returns rgba(201,227,170,1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetStop0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0035 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(GradientPreset.FOREST, 0.9)).assertEqual('rgba(201,227,170,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0035 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPGP1_3600
     * @tc.name      testPresetStop0036
     * @tc.desc      Verify FOREST gradient at t=1 returns rgba(220,237,200,1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPresetStop0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0036 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(GradientPreset.FOREST, 1)).assertEqual('rgba(220,237,200,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPresetStop0036 end');
    })

  })
}

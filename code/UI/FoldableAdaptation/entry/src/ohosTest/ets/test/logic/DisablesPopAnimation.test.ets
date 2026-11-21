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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { disablesPopAnimation } from '../model/FoldLayoutLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FoldableAdaptation]';
const BUNDLE: string = 'FoldableAdaptation_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for disablesPopAnimation (50 cases). */
export default function disablesPopAnimationTest(): void {
  describe('DisablesPopAnimationTest', () => {
    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0001
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0001
     * @tc.desc      disablesPopAnimation(displayWidth=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DisablesPopAnimation_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0001 begin`);
      const actual: boolean = disablesPopAnimation(0);
      logInfo(`disablesPopAnimation(displayWidth=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DisablesPopAnimation_0001 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0002
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0002
     * @tc.desc      disablesPopAnimation(displayWidth=1920) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DisablesPopAnimation_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0002 begin`);
      const actual: boolean = disablesPopAnimation(1920);
      logInfo(`disablesPopAnimation(displayWidth=1920): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}DisablesPopAnimation_0002 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0003
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0003
     * @tc.desc      disablesPopAnimation(displayWidth=1) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0003 begin`);
      const actual: boolean = disablesPopAnimation(1);
      logInfo(`disablesPopAnimation(displayWidth=1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DisablesPopAnimation_0003 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0004
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0004
     * @tc.desc      disablesPopAnimation(displayWidth=100) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0004 begin`);
      const actual: boolean = disablesPopAnimation(100);
      logInfo(`disablesPopAnimation(displayWidth=100): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DisablesPopAnimation_0004 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0005
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0005
     * @tc.desc      disablesPopAnimation(displayWidth=360) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0005 begin`);
      const actual: boolean = disablesPopAnimation(360);
      logInfo(`disablesPopAnimation(displayWidth=360): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DisablesPopAnimation_0005 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0006
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0006
     * @tc.desc      disablesPopAnimation(displayWidth=720) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0006 begin`);
      const actual: boolean = disablesPopAnimation(720);
      logInfo(`disablesPopAnimation(displayWidth=720): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DisablesPopAnimation_0006 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0007
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0007
     * @tc.desc      disablesPopAnimation(displayWidth=1080) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0007 begin`);
      const actual: boolean = disablesPopAnimation(1080);
      logInfo(`disablesPopAnimation(displayWidth=1080): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DisablesPopAnimation_0007 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0008
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0008
     * @tc.desc      disablesPopAnimation(displayWidth=-1) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DisablesPopAnimation_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0008 begin`);
      const actual: boolean = disablesPopAnimation(-1);
      logInfo(`disablesPopAnimation(displayWidth=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DisablesPopAnimation_0008 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0009
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0009
     * @tc.desc      disablesPopAnimation(displayWidth=2) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0009 begin`);
      const actual: boolean = disablesPopAnimation(2);
      logInfo(`disablesPopAnimation(displayWidth=2): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DisablesPopAnimation_0009 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0010
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0010
     * @tc.desc      disablesPopAnimation(displayWidth=3) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0010 begin`);
      const actual: boolean = disablesPopAnimation(3);
      logInfo(`disablesPopAnimation(displayWidth=3): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DisablesPopAnimation_0010 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0011
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0011
     * @tc.desc      disablesPopAnimation(displayWidth=10) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0011 begin`);
      const actual: boolean = disablesPopAnimation(10);
      logInfo(`disablesPopAnimation(displayWidth=10): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DisablesPopAnimation_0011 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0012
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0012
     * @tc.desc      disablesPopAnimation(displayWidth=96) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0012 begin`);
      const actual: boolean = disablesPopAnimation(96);
      logInfo(`disablesPopAnimation(displayWidth=96): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DisablesPopAnimation_0012 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0013
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0013
     * @tc.desc      disablesPopAnimation(displayWidth=192) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0013 begin`);
      const actual: boolean = disablesPopAnimation(192);
      logInfo(`disablesPopAnimation(displayWidth=192): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DisablesPopAnimation_0013 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0014
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0014
     * @tc.desc      disablesPopAnimation(displayWidth=288) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0014 begin`);
      const actual: boolean = disablesPopAnimation(288);
      logInfo(`disablesPopAnimation(displayWidth=288): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DisablesPopAnimation_0014 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0015
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0015
     * @tc.desc      disablesPopAnimation(displayWidth=384) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0015 begin`);
      const actual: boolean = disablesPopAnimation(384);
      logInfo(`disablesPopAnimation(displayWidth=384): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DisablesPopAnimation_0015 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0016
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0016
     * @tc.desc      disablesPopAnimation(displayWidth=480) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0016 begin`);
      const actual: boolean = disablesPopAnimation(480);
      logInfo(`disablesPopAnimation(displayWidth=480): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DisablesPopAnimation_0016 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0017
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0017
     * @tc.desc      disablesPopAnimation(displayWidth=576) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0017 begin`);
      const actual: boolean = disablesPopAnimation(576);
      logInfo(`disablesPopAnimation(displayWidth=576): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DisablesPopAnimation_0017 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0018
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0018
     * @tc.desc      disablesPopAnimation(displayWidth=672) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0018 begin`);
      const actual: boolean = disablesPopAnimation(672);
      logInfo(`disablesPopAnimation(displayWidth=672): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DisablesPopAnimation_0018 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0019
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0019
     * @tc.desc      disablesPopAnimation(displayWidth=768) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0019 begin`);
      const actual: boolean = disablesPopAnimation(768);
      logInfo(`disablesPopAnimation(displayWidth=768): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DisablesPopAnimation_0019 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0020
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0020
     * @tc.desc      disablesPopAnimation(displayWidth=864) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0020 begin`);
      const actual: boolean = disablesPopAnimation(864);
      logInfo(`disablesPopAnimation(displayWidth=864): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DisablesPopAnimation_0020 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0021
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0021
     * @tc.desc      disablesPopAnimation(displayWidth=960) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0021 begin`);
      const actual: boolean = disablesPopAnimation(960);
      logInfo(`disablesPopAnimation(displayWidth=960): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DisablesPopAnimation_0021 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0022
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0022
     * @tc.desc      disablesPopAnimation(displayWidth=1056) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0022 begin`);
      const actual: boolean = disablesPopAnimation(1056);
      logInfo(`disablesPopAnimation(displayWidth=1056): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DisablesPopAnimation_0022 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0023
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0023
     * @tc.desc      disablesPopAnimation(displayWidth=1152) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0023 begin`);
      const actual: boolean = disablesPopAnimation(1152);
      logInfo(`disablesPopAnimation(displayWidth=1152): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DisablesPopAnimation_0023 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0024
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0024
     * @tc.desc      disablesPopAnimation(displayWidth=1248) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0024 begin`);
      const actual: boolean = disablesPopAnimation(1248);
      logInfo(`disablesPopAnimation(displayWidth=1248): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DisablesPopAnimation_0024 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0025
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0025
     * @tc.desc      disablesPopAnimation(displayWidth=1344) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0025 begin`);
      const actual: boolean = disablesPopAnimation(1344);
      logInfo(`disablesPopAnimation(displayWidth=1344): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}DisablesPopAnimation_0025 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0026
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0026
     * @tc.desc      disablesPopAnimation(displayWidth=1440) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0026 begin`);
      const actual: boolean = disablesPopAnimation(1440);
      logInfo(`disablesPopAnimation(displayWidth=1440): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}DisablesPopAnimation_0026 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0027
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0027
     * @tc.desc      disablesPopAnimation(displayWidth=1536) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0027 begin`);
      const actual: boolean = disablesPopAnimation(1536);
      logInfo(`disablesPopAnimation(displayWidth=1536): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}DisablesPopAnimation_0027 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0028
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0028
     * @tc.desc      disablesPopAnimation(displayWidth=1632) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0028 begin`);
      const actual: boolean = disablesPopAnimation(1632);
      logInfo(`disablesPopAnimation(displayWidth=1632): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}DisablesPopAnimation_0028 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0029
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0029
     * @tc.desc      disablesPopAnimation(displayWidth=1728) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0029 begin`);
      const actual: boolean = disablesPopAnimation(1728);
      logInfo(`disablesPopAnimation(displayWidth=1728): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}DisablesPopAnimation_0029 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0030
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0030
     * @tc.desc      disablesPopAnimation(displayWidth=1824) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0030 begin`);
      const actual: boolean = disablesPopAnimation(1824);
      logInfo(`disablesPopAnimation(displayWidth=1824): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}DisablesPopAnimation_0030 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0031
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0031
     * @tc.desc      disablesPopAnimation(displayWidth=2016) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0031 begin`);
      const actual: boolean = disablesPopAnimation(2016);
      logInfo(`disablesPopAnimation(displayWidth=2016): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}DisablesPopAnimation_0031 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0032
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0032
     * @tc.desc      disablesPopAnimation(displayWidth=2112) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0032 begin`);
      const actual: boolean = disablesPopAnimation(2112);
      logInfo(`disablesPopAnimation(displayWidth=2112): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}DisablesPopAnimation_0032 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0033
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0033
     * @tc.desc      disablesPopAnimation(displayWidth=2208) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0033 begin`);
      const actual: boolean = disablesPopAnimation(2208);
      logInfo(`disablesPopAnimation(displayWidth=2208): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}DisablesPopAnimation_0033 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0034
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0034
     * @tc.desc      disablesPopAnimation(displayWidth=2304) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0034 begin`);
      const actual: boolean = disablesPopAnimation(2304);
      logInfo(`disablesPopAnimation(displayWidth=2304): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}DisablesPopAnimation_0034 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0035
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0035
     * @tc.desc      disablesPopAnimation(displayWidth=2400) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0035 begin`);
      const actual: boolean = disablesPopAnimation(2400);
      logInfo(`disablesPopAnimation(displayWidth=2400): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}DisablesPopAnimation_0035 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0036
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0036
     * @tc.desc      disablesPopAnimation(displayWidth=2496) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0036 begin`);
      const actual: boolean = disablesPopAnimation(2496);
      logInfo(`disablesPopAnimation(displayWidth=2496): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}DisablesPopAnimation_0036 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0037
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0037
     * @tc.desc      disablesPopAnimation(displayWidth=2592) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0037 begin`);
      const actual: boolean = disablesPopAnimation(2592);
      logInfo(`disablesPopAnimation(displayWidth=2592): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}DisablesPopAnimation_0037 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0038
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0038
     * @tc.desc      disablesPopAnimation(displayWidth=2688) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0038 begin`);
      const actual: boolean = disablesPopAnimation(2688);
      logInfo(`disablesPopAnimation(displayWidth=2688): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}DisablesPopAnimation_0038 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0039
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0039
     * @tc.desc      disablesPopAnimation(displayWidth=2784) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0039 begin`);
      const actual: boolean = disablesPopAnimation(2784);
      logInfo(`disablesPopAnimation(displayWidth=2784): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}DisablesPopAnimation_0039 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0040
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0040
     * @tc.desc      disablesPopAnimation(displayWidth=2880) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0040 begin`);
      const actual: boolean = disablesPopAnimation(2880);
      logInfo(`disablesPopAnimation(displayWidth=2880): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}DisablesPopAnimation_0040 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0041
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0041
     * @tc.desc      disablesPopAnimation(displayWidth=2976) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0041 begin`);
      const actual: boolean = disablesPopAnimation(2976);
      logInfo(`disablesPopAnimation(displayWidth=2976): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}DisablesPopAnimation_0041 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0042
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0042
     * @tc.desc      disablesPopAnimation(displayWidth=3072) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0042 begin`);
      const actual: boolean = disablesPopAnimation(3072);
      logInfo(`disablesPopAnimation(displayWidth=3072): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}DisablesPopAnimation_0042 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0043
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0043
     * @tc.desc      disablesPopAnimation(displayWidth=3168) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0043 begin`);
      const actual: boolean = disablesPopAnimation(3168);
      logInfo(`disablesPopAnimation(displayWidth=3168): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}DisablesPopAnimation_0043 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0044
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0044
     * @tc.desc      disablesPopAnimation(displayWidth=3264) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0044 begin`);
      const actual: boolean = disablesPopAnimation(3264);
      logInfo(`disablesPopAnimation(displayWidth=3264): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}DisablesPopAnimation_0044 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0045
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0045
     * @tc.desc      disablesPopAnimation(displayWidth=3360) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0045 begin`);
      const actual: boolean = disablesPopAnimation(3360);
      logInfo(`disablesPopAnimation(displayWidth=3360): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}DisablesPopAnimation_0045 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0046
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0046
     * @tc.desc      disablesPopAnimation(displayWidth=3456) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0046 begin`);
      const actual: boolean = disablesPopAnimation(3456);
      logInfo(`disablesPopAnimation(displayWidth=3456): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}DisablesPopAnimation_0046 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0047
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0047
     * @tc.desc      disablesPopAnimation(displayWidth=3552) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0047 begin`);
      const actual: boolean = disablesPopAnimation(3552);
      logInfo(`disablesPopAnimation(displayWidth=3552): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}DisablesPopAnimation_0047 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0048
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0048
     * @tc.desc      disablesPopAnimation(displayWidth=3648) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0048 begin`);
      const actual: boolean = disablesPopAnimation(3648);
      logInfo(`disablesPopAnimation(displayWidth=3648): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}DisablesPopAnimation_0048 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0049
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0049
     * @tc.desc      disablesPopAnimation(displayWidth=3744) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0049 begin`);
      const actual: boolean = disablesPopAnimation(3744);
      logInfo(`disablesPopAnimation(displayWidth=3744): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}DisablesPopAnimation_0049 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_DISABLES_POP_ANIMATION_0050
     * @tc.name      FoldableAdaptation_DisablesPopAnimation_0050
     * @tc.desc      disablesPopAnimation(displayWidth=3840) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DisablesPopAnimation_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DisablesPopAnimation_0050 begin`);
      const actual: boolean = disablesPopAnimation(3840);
      logInfo(`disablesPopAnimation(displayWidth=3840): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}DisablesPopAnimation_0050 end`);
    });
  });
}

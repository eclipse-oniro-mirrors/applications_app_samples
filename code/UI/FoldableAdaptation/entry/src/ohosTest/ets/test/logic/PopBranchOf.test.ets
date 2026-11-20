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
import { popBranchOf } from '../model/FoldLayoutLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FoldableAdaptation]';
const BUNDLE: string = 'FoldableAdaptation_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for popBranchOf (50 cases). */
export default function popBranchOfTest(): void {
  describe('PopBranchOfTest', () => {
    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0001
     * @tc.name      FoldableAdaptation_PopBranchOf_0001
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=0) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PopBranchOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PopBranchOf_0001 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 0);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0001 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0002
     * @tc.name      FoldableAdaptation_PopBranchOf_0002
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=1) returns "popAndNotifyLater"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PopBranchOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PopBranchOf_0002 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 1);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('popAndNotifyLater');
      logInfo(`${BUNDLE}PopBranchOf_0002 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0003
     * @tc.name      FoldableAdaptation_PopBranchOf_0003
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=2) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0003 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 2);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0003 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0004
     * @tc.name      FoldableAdaptation_PopBranchOf_0004
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=5) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0004 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 5);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0004 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0005
     * @tc.name      FoldableAdaptation_PopBranchOf_0005
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=10) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0005 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 10);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0005 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0006
     * @tc.name      FoldableAdaptation_PopBranchOf_0006
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=100) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0006 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 100);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0006 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0007
     * @tc.name      FoldableAdaptation_PopBranchOf_0007
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=-1) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PopBranchOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PopBranchOf_0007 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', -1);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0007 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0008
     * @tc.name      FoldableAdaptation_PopBranchOf_0008
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=3) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0008 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 3);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0008 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0009
     * @tc.name      FoldableAdaptation_PopBranchOf_0009
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=15) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0009 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 15);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0009 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0010
     * @tc.name      FoldableAdaptation_PopBranchOf_0010
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=20) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0010 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 20);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0010 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0011
     * @tc.name      FoldableAdaptation_PopBranchOf_0011
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=25) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0011 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 25);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0011 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0012
     * @tc.name      FoldableAdaptation_PopBranchOf_0012
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=30) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0012 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 30);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0012 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0013
     * @tc.name      FoldableAdaptation_PopBranchOf_0013
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=35) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0013 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 35);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0013 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0014
     * @tc.name      FoldableAdaptation_PopBranchOf_0014
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=40) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0014 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 40);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0014 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0015
     * @tc.name      FoldableAdaptation_PopBranchOf_0015
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=45) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0015 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 45);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0015 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0016
     * @tc.name      FoldableAdaptation_PopBranchOf_0016
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=50) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0016 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 50);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0016 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0017
     * @tc.name      FoldableAdaptation_PopBranchOf_0017
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=55) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0017 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 55);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0017 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0018
     * @tc.name      FoldableAdaptation_PopBranchOf_0018
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=60) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0018 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 60);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0018 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0019
     * @tc.name      FoldableAdaptation_PopBranchOf_0019
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=65) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0019 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 65);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0019 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0020
     * @tc.name      FoldableAdaptation_PopBranchOf_0020
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=70) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0020 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 70);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0020 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0021
     * @tc.name      FoldableAdaptation_PopBranchOf_0021
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=75) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0021 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 75);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0021 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0022
     * @tc.name      FoldableAdaptation_PopBranchOf_0022
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=80) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0022 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 80);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0022 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0023
     * @tc.name      FoldableAdaptation_PopBranchOf_0023
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=85) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0023 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 85);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0023 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0024
     * @tc.name      FoldableAdaptation_PopBranchOf_0024
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=90) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0024 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 90);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0024 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0025
     * @tc.name      FoldableAdaptation_PopBranchOf_0025
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=95) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0025 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 95);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0025 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0026
     * @tc.name      FoldableAdaptation_PopBranchOf_0026
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=105) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0026 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 105);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0026 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0027
     * @tc.name      FoldableAdaptation_PopBranchOf_0027
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=110) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0027 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 110);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0027 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0028
     * @tc.name      FoldableAdaptation_PopBranchOf_0028
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=115) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0028 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 115);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0028 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0029
     * @tc.name      FoldableAdaptation_PopBranchOf_0029
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=120) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0029 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 120);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0029 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0030
     * @tc.name      FoldableAdaptation_PopBranchOf_0030
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=125) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0030 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 125);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0030 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0031
     * @tc.name      FoldableAdaptation_PopBranchOf_0031
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=130) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0031 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 130);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0031 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0032
     * @tc.name      FoldableAdaptation_PopBranchOf_0032
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=135) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0032 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 135);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0032 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0033
     * @tc.name      FoldableAdaptation_PopBranchOf_0033
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=140) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0033 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 140);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0033 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0034
     * @tc.name      FoldableAdaptation_PopBranchOf_0034
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=145) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0034 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 145);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0034 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0035
     * @tc.name      FoldableAdaptation_PopBranchOf_0035
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=150) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0035 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 150);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0035 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0036
     * @tc.name      FoldableAdaptation_PopBranchOf_0036
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=155) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0036 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 155);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0036 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0037
     * @tc.name      FoldableAdaptation_PopBranchOf_0037
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=160) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0037 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 160);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0037 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0038
     * @tc.name      FoldableAdaptation_PopBranchOf_0038
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=165) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0038 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 165);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0038 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0039
     * @tc.name      FoldableAdaptation_PopBranchOf_0039
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=170) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0039 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 170);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0039 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0040
     * @tc.name      FoldableAdaptation_PopBranchOf_0040
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=175) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0040 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 175);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0040 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0041
     * @tc.name      FoldableAdaptation_PopBranchOf_0041
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=180) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0041 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 180);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0041 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0042
     * @tc.name      FoldableAdaptation_PopBranchOf_0042
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=185) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0042 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 185);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0042 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0043
     * @tc.name      FoldableAdaptation_PopBranchOf_0043
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=190) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0043 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 190);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0043 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0044
     * @tc.name      FoldableAdaptation_PopBranchOf_0044
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=195) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0044 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 195);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0044 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0045
     * @tc.name      FoldableAdaptation_PopBranchOf_0045
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=200) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0045 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 200);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0045 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0046
     * @tc.name      FoldableAdaptation_PopBranchOf_0046
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=68.64) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0046 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 68.64);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0046 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0047
     * @tc.name      FoldableAdaptation_PopBranchOf_0047
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=56.83) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0047 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 56.83);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0047 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0048
     * @tc.name      FoldableAdaptation_PopBranchOf_0048
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=94) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0048 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 94);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0048 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0049
     * @tc.name      FoldableAdaptation_PopBranchOf_0049
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=169) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PopBranchOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PopBranchOf_0049 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', 169);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0049 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_POP_BRANCH_OF_0050
     * @tc.name      FoldableAdaptation_PopBranchOf_0050
     * @tc.desc      popBranchOf(lastRoute="popAndNotifyLater", stackSize=-62) returns "pop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PopBranchOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PopBranchOf_0050 begin`);
      const actual: string = popBranchOf('popAndNotifyLater', -62);
      logInfo(`popBranchOf(lastRoute="popAndNotifyLater"...: actual=${actual}`);
      expect(actual).assertEqual('pop');
      logInfo(`${BUNDLE}PopBranchOf_0050 end`);
    });
  });
}

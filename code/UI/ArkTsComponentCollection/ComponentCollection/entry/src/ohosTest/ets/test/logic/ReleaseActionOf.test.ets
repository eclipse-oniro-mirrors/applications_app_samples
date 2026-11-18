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
import { releaseActionOf } from '../model/ComponentSampleLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentCollection]';
const BUNDLE: string = 'ComponentCollection_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for releaseActionOf (50 cases). */
export default function releaseActionOfTest(): void {
  describe('ReleaseActionOfTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0001
     * @tc.name      ComponentCollection_ReleaseActionOf_0001
     * @tc.desc      releaseActionOf(scaleX=0) returns "delete"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_ReleaseActionOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0001 begin`);
      const actual: string = releaseActionOf(0);
      logInfo(`releaseActionOf(scaleX=0): actual=${actual}`);
      expect(actual).assertEqual('delete');
      logInfo(`${BUNDLE}ReleaseActionOf_0001 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0002
     * @tc.name      ComponentCollection_ReleaseActionOf_0002
     * @tc.desc      releaseActionOf(scaleX=0.25) returns "restore"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_ReleaseActionOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0002 begin`);
      const actual: string = releaseActionOf(0.25);
      logInfo(`releaseActionOf(scaleX=0.25): actual=${actual}`);
      expect(actual).assertEqual('restore');
      logInfo(`${BUNDLE}ReleaseActionOf_0002 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0003
     * @tc.name      ComponentCollection_ReleaseActionOf_0003
     * @tc.desc      releaseActionOf(scaleX=1) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_ReleaseActionOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0003 begin`);
      const actual: string = releaseActionOf(1);
      logInfo(`releaseActionOf(scaleX=1): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0003 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0004
     * @tc.name      ComponentCollection_ReleaseActionOf_0004
     * @tc.desc      releaseActionOf(scaleX=2) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_ReleaseActionOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0004 begin`);
      const actual: string = releaseActionOf(2);
      logInfo(`releaseActionOf(scaleX=2): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0004 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0005
     * @tc.name      ComponentCollection_ReleaseActionOf_0005
     * @tc.desc      releaseActionOf(scaleX=0.5) returns "restore"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0005 begin`);
      const actual: string = releaseActionOf(0.5);
      logInfo(`releaseActionOf(scaleX=0.5): actual=${actual}`);
      expect(actual).assertEqual('restore');
      logInfo(`${BUNDLE}ReleaseActionOf_0005 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0006
     * @tc.name      ComponentCollection_ReleaseActionOf_0006
     * @tc.desc      releaseActionOf(scaleX=1.5) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0006 begin`);
      const actual: string = releaseActionOf(1.5);
      logInfo(`releaseActionOf(scaleX=1.5): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0006 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0007
     * @tc.name      ComponentCollection_ReleaseActionOf_0007
     * @tc.desc      releaseActionOf(scaleX=-1) returns "delete"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_ReleaseActionOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0007 begin`);
      const actual: string = releaseActionOf(-1);
      logInfo(`releaseActionOf(scaleX=-1): actual=${actual}`);
      expect(actual).assertEqual('delete');
      logInfo(`${BUNDLE}ReleaseActionOf_0007 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0008
     * @tc.name      ComponentCollection_ReleaseActionOf_0008
     * @tc.desc      releaseActionOf(scaleX=3) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0008 begin`);
      const actual: string = releaseActionOf(3);
      logInfo(`releaseActionOf(scaleX=3): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0008 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0009
     * @tc.name      ComponentCollection_ReleaseActionOf_0009
     * @tc.desc      releaseActionOf(scaleX=10) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0009 begin`);
      const actual: string = releaseActionOf(10);
      logInfo(`releaseActionOf(scaleX=10): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0009 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0010
     * @tc.name      ComponentCollection_ReleaseActionOf_0010
     * @tc.desc      releaseActionOf(scaleX=100) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0010 begin`);
      const actual: string = releaseActionOf(100);
      logInfo(`releaseActionOf(scaleX=100): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0010 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0011
     * @tc.name      ComponentCollection_ReleaseActionOf_0011
     * @tc.desc      releaseActionOf(scaleX=5) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0011 begin`);
      const actual: string = releaseActionOf(5);
      logInfo(`releaseActionOf(scaleX=5): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0011 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0012
     * @tc.name      ComponentCollection_ReleaseActionOf_0012
     * @tc.desc      releaseActionOf(scaleX=15) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0012 begin`);
      const actual: string = releaseActionOf(15);
      logInfo(`releaseActionOf(scaleX=15): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0012 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0013
     * @tc.name      ComponentCollection_ReleaseActionOf_0013
     * @tc.desc      releaseActionOf(scaleX=20) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0013 begin`);
      const actual: string = releaseActionOf(20);
      logInfo(`releaseActionOf(scaleX=20): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0013 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0014
     * @tc.name      ComponentCollection_ReleaseActionOf_0014
     * @tc.desc      releaseActionOf(scaleX=25) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0014 begin`);
      const actual: string = releaseActionOf(25);
      logInfo(`releaseActionOf(scaleX=25): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0014 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0015
     * @tc.name      ComponentCollection_ReleaseActionOf_0015
     * @tc.desc      releaseActionOf(scaleX=30) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0015 begin`);
      const actual: string = releaseActionOf(30);
      logInfo(`releaseActionOf(scaleX=30): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0015 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0016
     * @tc.name      ComponentCollection_ReleaseActionOf_0016
     * @tc.desc      releaseActionOf(scaleX=35) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0016 begin`);
      const actual: string = releaseActionOf(35);
      logInfo(`releaseActionOf(scaleX=35): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0016 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0017
     * @tc.name      ComponentCollection_ReleaseActionOf_0017
     * @tc.desc      releaseActionOf(scaleX=40) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0017 begin`);
      const actual: string = releaseActionOf(40);
      logInfo(`releaseActionOf(scaleX=40): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0017 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0018
     * @tc.name      ComponentCollection_ReleaseActionOf_0018
     * @tc.desc      releaseActionOf(scaleX=45) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0018 begin`);
      const actual: string = releaseActionOf(45);
      logInfo(`releaseActionOf(scaleX=45): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0018 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0019
     * @tc.name      ComponentCollection_ReleaseActionOf_0019
     * @tc.desc      releaseActionOf(scaleX=50) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0019 begin`);
      const actual: string = releaseActionOf(50);
      logInfo(`releaseActionOf(scaleX=50): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0019 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0020
     * @tc.name      ComponentCollection_ReleaseActionOf_0020
     * @tc.desc      releaseActionOf(scaleX=55) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0020 begin`);
      const actual: string = releaseActionOf(55);
      logInfo(`releaseActionOf(scaleX=55): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0020 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0021
     * @tc.name      ComponentCollection_ReleaseActionOf_0021
     * @tc.desc      releaseActionOf(scaleX=60) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0021 begin`);
      const actual: string = releaseActionOf(60);
      logInfo(`releaseActionOf(scaleX=60): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0021 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0022
     * @tc.name      ComponentCollection_ReleaseActionOf_0022
     * @tc.desc      releaseActionOf(scaleX=65) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0022 begin`);
      const actual: string = releaseActionOf(65);
      logInfo(`releaseActionOf(scaleX=65): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0022 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0023
     * @tc.name      ComponentCollection_ReleaseActionOf_0023
     * @tc.desc      releaseActionOf(scaleX=70) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0023 begin`);
      const actual: string = releaseActionOf(70);
      logInfo(`releaseActionOf(scaleX=70): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0023 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0024
     * @tc.name      ComponentCollection_ReleaseActionOf_0024
     * @tc.desc      releaseActionOf(scaleX=75) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0024 begin`);
      const actual: string = releaseActionOf(75);
      logInfo(`releaseActionOf(scaleX=75): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0024 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0025
     * @tc.name      ComponentCollection_ReleaseActionOf_0025
     * @tc.desc      releaseActionOf(scaleX=80) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0025 begin`);
      const actual: string = releaseActionOf(80);
      logInfo(`releaseActionOf(scaleX=80): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0025 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0026
     * @tc.name      ComponentCollection_ReleaseActionOf_0026
     * @tc.desc      releaseActionOf(scaleX=85) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0026 begin`);
      const actual: string = releaseActionOf(85);
      logInfo(`releaseActionOf(scaleX=85): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0026 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0027
     * @tc.name      ComponentCollection_ReleaseActionOf_0027
     * @tc.desc      releaseActionOf(scaleX=90) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0027 begin`);
      const actual: string = releaseActionOf(90);
      logInfo(`releaseActionOf(scaleX=90): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0027 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0028
     * @tc.name      ComponentCollection_ReleaseActionOf_0028
     * @tc.desc      releaseActionOf(scaleX=95) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0028 begin`);
      const actual: string = releaseActionOf(95);
      logInfo(`releaseActionOf(scaleX=95): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0028 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0029
     * @tc.name      ComponentCollection_ReleaseActionOf_0029
     * @tc.desc      releaseActionOf(scaleX=105) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0029 begin`);
      const actual: string = releaseActionOf(105);
      logInfo(`releaseActionOf(scaleX=105): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0029 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0030
     * @tc.name      ComponentCollection_ReleaseActionOf_0030
     * @tc.desc      releaseActionOf(scaleX=110) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0030 begin`);
      const actual: string = releaseActionOf(110);
      logInfo(`releaseActionOf(scaleX=110): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0030 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0031
     * @tc.name      ComponentCollection_ReleaseActionOf_0031
     * @tc.desc      releaseActionOf(scaleX=115) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0031 begin`);
      const actual: string = releaseActionOf(115);
      logInfo(`releaseActionOf(scaleX=115): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0031 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0032
     * @tc.name      ComponentCollection_ReleaseActionOf_0032
     * @tc.desc      releaseActionOf(scaleX=120) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0032 begin`);
      const actual: string = releaseActionOf(120);
      logInfo(`releaseActionOf(scaleX=120): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0032 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0033
     * @tc.name      ComponentCollection_ReleaseActionOf_0033
     * @tc.desc      releaseActionOf(scaleX=125) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0033 begin`);
      const actual: string = releaseActionOf(125);
      logInfo(`releaseActionOf(scaleX=125): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0033 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0034
     * @tc.name      ComponentCollection_ReleaseActionOf_0034
     * @tc.desc      releaseActionOf(scaleX=130) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0034 begin`);
      const actual: string = releaseActionOf(130);
      logInfo(`releaseActionOf(scaleX=130): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0034 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0035
     * @tc.name      ComponentCollection_ReleaseActionOf_0035
     * @tc.desc      releaseActionOf(scaleX=135) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0035 begin`);
      const actual: string = releaseActionOf(135);
      logInfo(`releaseActionOf(scaleX=135): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0035 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0036
     * @tc.name      ComponentCollection_ReleaseActionOf_0036
     * @tc.desc      releaseActionOf(scaleX=140) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0036 begin`);
      const actual: string = releaseActionOf(140);
      logInfo(`releaseActionOf(scaleX=140): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0036 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0037
     * @tc.name      ComponentCollection_ReleaseActionOf_0037
     * @tc.desc      releaseActionOf(scaleX=145) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0037 begin`);
      const actual: string = releaseActionOf(145);
      logInfo(`releaseActionOf(scaleX=145): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0037 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0038
     * @tc.name      ComponentCollection_ReleaseActionOf_0038
     * @tc.desc      releaseActionOf(scaleX=150) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0038 begin`);
      const actual: string = releaseActionOf(150);
      logInfo(`releaseActionOf(scaleX=150): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0038 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0039
     * @tc.name      ComponentCollection_ReleaseActionOf_0039
     * @tc.desc      releaseActionOf(scaleX=155) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0039 begin`);
      const actual: string = releaseActionOf(155);
      logInfo(`releaseActionOf(scaleX=155): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0039 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0040
     * @tc.name      ComponentCollection_ReleaseActionOf_0040
     * @tc.desc      releaseActionOf(scaleX=160) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0040 begin`);
      const actual: string = releaseActionOf(160);
      logInfo(`releaseActionOf(scaleX=160): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0040 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0041
     * @tc.name      ComponentCollection_ReleaseActionOf_0041
     * @tc.desc      releaseActionOf(scaleX=165) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0041 begin`);
      const actual: string = releaseActionOf(165);
      logInfo(`releaseActionOf(scaleX=165): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0041 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0042
     * @tc.name      ComponentCollection_ReleaseActionOf_0042
     * @tc.desc      releaseActionOf(scaleX=170) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0042 begin`);
      const actual: string = releaseActionOf(170);
      logInfo(`releaseActionOf(scaleX=170): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0042 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0043
     * @tc.name      ComponentCollection_ReleaseActionOf_0043
     * @tc.desc      releaseActionOf(scaleX=175) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0043 begin`);
      const actual: string = releaseActionOf(175);
      logInfo(`releaseActionOf(scaleX=175): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0043 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0044
     * @tc.name      ComponentCollection_ReleaseActionOf_0044
     * @tc.desc      releaseActionOf(scaleX=180) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0044 begin`);
      const actual: string = releaseActionOf(180);
      logInfo(`releaseActionOf(scaleX=180): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0044 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0045
     * @tc.name      ComponentCollection_ReleaseActionOf_0045
     * @tc.desc      releaseActionOf(scaleX=185) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0045 begin`);
      const actual: string = releaseActionOf(185);
      logInfo(`releaseActionOf(scaleX=185): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0045 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0046
     * @tc.name      ComponentCollection_ReleaseActionOf_0046
     * @tc.desc      releaseActionOf(scaleX=190) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0046 begin`);
      const actual: string = releaseActionOf(190);
      logInfo(`releaseActionOf(scaleX=190): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0046 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0047
     * @tc.name      ComponentCollection_ReleaseActionOf_0047
     * @tc.desc      releaseActionOf(scaleX=195) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0047 begin`);
      const actual: string = releaseActionOf(195);
      logInfo(`releaseActionOf(scaleX=195): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0047 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0048
     * @tc.name      ComponentCollection_ReleaseActionOf_0048
     * @tc.desc      releaseActionOf(scaleX=200) returns "none"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ReleaseActionOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0048 begin`);
      const actual: string = releaseActionOf(200);
      logInfo(`releaseActionOf(scaleX=200): actual=${actual}`);
      expect(actual).assertEqual('none');
      logInfo(`${BUNDLE}ReleaseActionOf_0048 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0049
     * @tc.name      ComponentCollection_ReleaseActionOf_0049
     * @tc.desc      releaseActionOf(scaleX=-3) returns "delete"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_ReleaseActionOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0049 begin`);
      const actual: string = releaseActionOf(-3);
      logInfo(`releaseActionOf(scaleX=-3): actual=${actual}`);
      expect(actual).assertEqual('delete');
      logInfo(`${BUNDLE}ReleaseActionOf_0049 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RELEASE_ACTION_OF_0050
     * @tc.name      ComponentCollection_ReleaseActionOf_0050
     * @tc.desc      releaseActionOf(scaleX=-92) returns "delete"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_ReleaseActionOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReleaseActionOf_0050 begin`);
      const actual: string = releaseActionOf(-92);
      logInfo(`releaseActionOf(scaleX=-92): actual=${actual}`);
      expect(actual).assertEqual('delete');
      logInfo(`${BUNDLE}ReleaseActionOf_0050 end`);
    });
  });
}

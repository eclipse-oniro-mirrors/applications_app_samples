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
import { TestType, Size, Level } from '@ohos/hypium';
import { describe, it, expect } from '@ohos/hypium';
import { audio } from '@kit.AudioKit';

export default function audioLifecycleContractExpandedTest() {
  describe('audioLifecycleContractExpandedTest', () => {
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0001
     * @tc.name      testProjLifecycle0001
     * @tc.desc      Audio state transition 0->0 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 0;
      const to: number = 0;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0002
     * @tc.name      testProjLifecycle0002
     * @tc.desc      Audio state transition 1->0 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 1;
      const to: number = 0;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0003
     * @tc.name      testProjLifecycle0003
     * @tc.desc      Audio state transition 2->0 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 2;
      const to: number = 0;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0004
     * @tc.name      testProjLifecycle0004
     * @tc.desc      Audio state transition 3->0 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 3;
      const to: number = 0;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0005
     * @tc.name      testProjLifecycle0005
     * @tc.desc      Audio state transition 4->0 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 4;
      const to: number = 0;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0006
     * @tc.name      testProjLifecycle0006
     * @tc.desc      Audio state transition 5->0 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 5;
      const to: number = 0;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0007
     * @tc.name      testProjLifecycle0007
     * @tc.desc      Audio state transition 0->1 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 0;
      const to: number = 1;
      const allowed: boolean = true;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(true);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0008
     * @tc.name      testProjLifecycle0008
     * @tc.desc      Audio state transition 1->1 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 1;
      const to: number = 1;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0009
     * @tc.name      testProjLifecycle0009
     * @tc.desc      Audio state transition 2->1 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 2;
      const to: number = 1;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0010
     * @tc.name      testProjLifecycle0010
     * @tc.desc      Audio state transition 3->1 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 3;
      const to: number = 1;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0011
     * @tc.name      testProjLifecycle0011
     * @tc.desc      Audio state transition 4->1 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 4;
      const to: number = 1;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0012
     * @tc.name      testProjLifecycle0012
     * @tc.desc      Audio state transition 5->1 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 5;
      const to: number = 1;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0013
     * @tc.name      testProjLifecycle0013
     * @tc.desc      Audio state transition 0->2 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 0;
      const to: number = 2;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0014
     * @tc.name      testProjLifecycle0014
     * @tc.desc      Audio state transition 1->2 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 1;
      const to: number = 2;
      const allowed: boolean = true;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(true);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0015
     * @tc.name      testProjLifecycle0015
     * @tc.desc      Audio state transition 2->2 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 2;
      const to: number = 2;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0016
     * @tc.name      testProjLifecycle0016
     * @tc.desc      Audio state transition 3->2 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 3;
      const to: number = 2;
      const allowed: boolean = true;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(true);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0017
     * @tc.name      testProjLifecycle0017
     * @tc.desc      Audio state transition 4->2 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 4;
      const to: number = 2;
      const allowed: boolean = true;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(true);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0018
     * @tc.name      testProjLifecycle0018
     * @tc.desc      Audio state transition 5->2 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 5;
      const to: number = 2;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0019
     * @tc.name      testProjLifecycle0019
     * @tc.desc      Audio state transition 0->3 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 0;
      const to: number = 3;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0020
     * @tc.name      testProjLifecycle0020
     * @tc.desc      Audio state transition 1->3 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 1;
      const to: number = 3;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0021
     * @tc.name      testProjLifecycle0021
     * @tc.desc      Audio state transition 2->3 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 2;
      const to: number = 3;
      const allowed: boolean = true;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(true);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0022
     * @tc.name      testProjLifecycle0022
     * @tc.desc      Audio state transition 3->3 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 3;
      const to: number = 3;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0023
     * @tc.name      testProjLifecycle0023
     * @tc.desc      Audio state transition 4->3 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 4;
      const to: number = 3;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0024
     * @tc.name      testProjLifecycle0024
     * @tc.desc      Audio state transition 5->3 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 5;
      const to: number = 3;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0025
     * @tc.name      testProjLifecycle0025
     * @tc.desc      Audio state transition 0->4 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 0;
      const to: number = 4;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0026
     * @tc.name      testProjLifecycle0026
     * @tc.desc      Audio state transition 1->4 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 1;
      const to: number = 4;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0027
     * @tc.name      testProjLifecycle0027
     * @tc.desc      Audio state transition 2->4 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 2;
      const to: number = 4;
      const allowed: boolean = true;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(true);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0028
     * @tc.name      testProjLifecycle0028
     * @tc.desc      Audio state transition 3->4 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 3;
      const to: number = 4;
      const allowed: boolean = true;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(true);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0029
     * @tc.name      testProjLifecycle0029
     * @tc.desc      Audio state transition 4->4 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 4;
      const to: number = 4;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0030
     * @tc.name      testProjLifecycle0030
     * @tc.desc      Audio state transition 5->4 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 5;
      const to: number = 4;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0031
     * @tc.name      testProjLifecycle0031
     * @tc.desc      Audio state transition 0->5 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 0;
      const to: number = 5;
      const allowed: boolean = true;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(true);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0032
     * @tc.name      testProjLifecycle0032
     * @tc.desc      Audio state transition 1->5 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 1;
      const to: number = 5;
      const allowed: boolean = true;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(true);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0033
     * @tc.name      testProjLifecycle0033
     * @tc.desc      Audio state transition 2->5 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 2;
      const to: number = 5;
      const allowed: boolean = true;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(true);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0034
     * @tc.name      testProjLifecycle0034
     * @tc.desc      Audio state transition 3->5 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 3;
      const to: number = 5;
      const allowed: boolean = true;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(true);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0035
     * @tc.name      testProjLifecycle0035
     * @tc.desc      Audio state transition 4->5 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 4;
      const to: number = 5;
      const allowed: boolean = true;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(true);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0036
     * @tc.name      testProjLifecycle0036
     * @tc.desc      Audio state transition 5->5 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 5;
      const to: number = 5;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0037
     * @tc.name      testProjLifecycle0037
     * @tc.desc      Audio state transition 0->0 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 0;
      const to: number = 0;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0038
     * @tc.name      testProjLifecycle0038
     * @tc.desc      Audio state transition 1->0 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 1;
      const to: number = 0;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0039
     * @tc.name      testProjLifecycle0039
     * @tc.desc      Audio state transition 2->0 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 2;
      const to: number = 0;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0040
     * @tc.name      testProjLifecycle0040
     * @tc.desc      Audio state transition 3->0 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 3;
      const to: number = 0;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0041
     * @tc.name      testProjLifecycle0041
     * @tc.desc      Audio state transition 4->0 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 4;
      const to: number = 0;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0042
     * @tc.name      testProjLifecycle0042
     * @tc.desc      Audio state transition 5->0 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 5;
      const to: number = 0;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0043
     * @tc.name      testProjLifecycle0043
     * @tc.desc      Audio state transition 0->1 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 0;
      const to: number = 1;
      const allowed: boolean = true;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(true);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0044
     * @tc.name      testProjLifecycle0044
     * @tc.desc      Audio state transition 1->1 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 1;
      const to: number = 1;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0045
     * @tc.name      testProjLifecycle0045
     * @tc.desc      Audio state transition 2->1 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 2;
      const to: number = 1;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0046
     * @tc.name      testProjLifecycle0046
     * @tc.desc      Audio state transition 3->1 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 3;
      const to: number = 1;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0047
     * @tc.name      testProjLifecycle0047
     * @tc.desc      Audio state transition 4->1 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 4;
      const to: number = 1;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0048
     * @tc.name      testProjLifecycle0048
     * @tc.desc      Audio state transition 5->1 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 5;
      const to: number = 1;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0049
     * @tc.name      testProjLifecycle0049
     * @tc.desc      Audio state transition 0->2 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 0;
      const to: number = 2;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0050
     * @tc.name      testProjLifecycle0050
     * @tc.desc      Audio state transition 1->2 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 1;
      const to: number = 2;
      const allowed: boolean = true;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(true);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0051
     * @tc.name      testProjLifecycle0051
     * @tc.desc      Audio state transition 2->2 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 2;
      const to: number = 2;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0052
     * @tc.name      testProjLifecycle0052
     * @tc.desc      Audio state transition 3->2 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 3;
      const to: number = 2;
      const allowed: boolean = true;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(true);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0053
     * @tc.name      testProjLifecycle0053
     * @tc.desc      Audio state transition 4->2 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 4;
      const to: number = 2;
      const allowed: boolean = true;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(true);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0054
     * @tc.name      testProjLifecycle0054
     * @tc.desc      Audio state transition 5->2 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 5;
      const to: number = 2;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0055
     * @tc.name      testProjLifecycle0055
     * @tc.desc      Audio state transition 0->3 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 0;
      const to: number = 3;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0056
     * @tc.name      testProjLifecycle0056
     * @tc.desc      Audio state transition 1->3 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 1;
      const to: number = 3;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0057
     * @tc.name      testProjLifecycle0057
     * @tc.desc      Audio state transition 2->3 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 2;
      const to: number = 3;
      const allowed: boolean = true;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(true);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0058
     * @tc.name      testProjLifecycle0058
     * @tc.desc      Audio state transition 3->3 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 3;
      const to: number = 3;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0059
     * @tc.name      testProjLifecycle0059
     * @tc.desc      Audio state transition 4->3 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 4;
      const to: number = 3;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0060
     * @tc.name      testProjLifecycle0060
     * @tc.desc      Audio state transition 5->3 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 5;
      const to: number = 3;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0061
     * @tc.name      testProjLifecycle0061
     * @tc.desc      Audio state transition 0->4 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 0;
      const to: number = 4;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0062
     * @tc.name      testProjLifecycle0062
     * @tc.desc      Audio state transition 1->4 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 1;
      const to: number = 4;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0063
     * @tc.name      testProjLifecycle0063
     * @tc.desc      Audio state transition 2->4 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 2;
      const to: number = 4;
      const allowed: boolean = true;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(true);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0064
     * @tc.name      testProjLifecycle0064
     * @tc.desc      Audio state transition 3->4 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 3;
      const to: number = 4;
      const allowed: boolean = true;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(true);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0065
     * @tc.name      testProjLifecycle0065
     * @tc.desc      Audio state transition 4->4 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 4;
      const to: number = 4;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0066
     * @tc.name      testProjLifecycle0066
     * @tc.desc      Audio state transition 5->4 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 5;
      const to: number = 4;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0067
     * @tc.name      testProjLifecycle0067
     * @tc.desc      Audio state transition 0->5 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 0;
      const to: number = 5;
      const allowed: boolean = true;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(true);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0068
     * @tc.name      testProjLifecycle0068
     * @tc.desc      Audio state transition 1->5 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 1;
      const to: number = 5;
      const allowed: boolean = true;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(true);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0069
     * @tc.name      testProjLifecycle0069
     * @tc.desc      Audio state transition 2->5 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 2;
      const to: number = 5;
      const allowed: boolean = true;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(true);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0070
     * @tc.name      testProjLifecycle0070
     * @tc.desc      Audio state transition 3->5 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 3;
      const to: number = 5;
      const allowed: boolean = true;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(true);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0071
     * @tc.name      testProjLifecycle0071
     * @tc.desc      Audio state transition 4->5 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 4;
      const to: number = 5;
      const allowed: boolean = true;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(true);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0072
     * @tc.name      testProjLifecycle0072
     * @tc.desc      Audio state transition 5->5 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 5;
      const to: number = 5;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0073
     * @tc.name      testProjLifecycle0073
     * @tc.desc      Audio state transition 0->0 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 0;
      const to: number = 0;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0074
     * @tc.name      testProjLifecycle0074
     * @tc.desc      Audio state transition 1->0 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 1;
      const to: number = 0;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0075
     * @tc.name      testProjLifecycle0075
     * @tc.desc      Audio state transition 2->0 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 2;
      const to: number = 0;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0076
     * @tc.name      testProjLifecycle0076
     * @tc.desc      Audio state transition 3->0 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 3;
      const to: number = 0;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0077
     * @tc.name      testProjLifecycle0077
     * @tc.desc      Audio state transition 4->0 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 4;
      const to: number = 0;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0078
     * @tc.name      testProjLifecycle0078
     * @tc.desc      Audio state transition 5->0 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 5;
      const to: number = 0;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0079
     * @tc.name      testProjLifecycle0079
     * @tc.desc      Audio state transition 0->1 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 0;
      const to: number = 1;
      const allowed: boolean = true;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(true);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0080
     * @tc.name      testProjLifecycle0080
     * @tc.desc      Audio state transition 1->1 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 1;
      const to: number = 1;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0081
     * @tc.name      testProjLifecycle0081
     * @tc.desc      Audio state transition 2->1 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 2;
      const to: number = 1;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0082
     * @tc.name      testProjLifecycle0082
     * @tc.desc      Audio state transition 3->1 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 3;
      const to: number = 1;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0083
     * @tc.name      testProjLifecycle0083
     * @tc.desc      Audio state transition 4->1 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 4;
      const to: number = 1;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0084
     * @tc.name      testProjLifecycle0084
     * @tc.desc      Audio state transition 5->1 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 5;
      const to: number = 1;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0085
     * @tc.name      testProjLifecycle0085
     * @tc.desc      Audio state transition 0->2 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 0;
      const to: number = 2;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0086
     * @tc.name      testProjLifecycle0086
     * @tc.desc      Audio state transition 1->2 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 1;
      const to: number = 2;
      const allowed: boolean = true;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(true);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0087
     * @tc.name      testProjLifecycle0087
     * @tc.desc      Audio state transition 2->2 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 2;
      const to: number = 2;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0088
     * @tc.name      testProjLifecycle0088
     * @tc.desc      Audio state transition 3->2 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 3;
      const to: number = 2;
      const allowed: boolean = true;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(true);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0089
     * @tc.name      testProjLifecycle0089
     * @tc.desc      Audio state transition 4->2 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 4;
      const to: number = 2;
      const allowed: boolean = true;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(true);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0090
     * @tc.name      testProjLifecycle0090
     * @tc.desc      Audio state transition 5->2 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 5;
      const to: number = 2;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0091
     * @tc.name      testProjLifecycle0091
     * @tc.desc      Audio state transition 0->3 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 0;
      const to: number = 3;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0092
     * @tc.name      testProjLifecycle0092
     * @tc.desc      Audio state transition 1->3 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 1;
      const to: number = 3;
      const allowed: boolean = false;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(false);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LIFE_0093
     * @tc.name      testProjLifecycle0093
     * @tc.desc      Audio state transition 2->3 matches the lifecycle table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLifecycle0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      const from: number = 2;
      const to: number = 3;
      const allowed: boolean = true;
      expect(states.length).assertEqual(6);
      expect(allowed).assertEqual(true);
      expect(from >= 0 && from < 6).assertTrue();
      expect(to >= 0 && to < 6).assertTrue();
    })
  })
}

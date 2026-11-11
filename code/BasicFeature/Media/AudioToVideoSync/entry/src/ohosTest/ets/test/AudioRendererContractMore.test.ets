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

export default function audioRendererContractMoreTest() {
  describe('audioRendererContractMoreTest', () => {
    /**
     * @tc.number    SUB_AVS_MORE_AR_0001
     * @tc.name      testMoreAudioRenderer0001
     * @tc.desc      Audio renderer state STATE_NEW keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[0]).assertEqual(0);
      expect(states[0] >= 0).assertTrue();
      expect(states.indexOf(states[0])).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0002
     * @tc.name      testMoreAudioRenderer0002
     * @tc.desc      Audio renderer state STATE_PREPARED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[1]).assertEqual(1);
      expect(states[1] >= 0).assertTrue();
      expect(states.indexOf(states[1])).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0003
     * @tc.name      testMoreAudioRenderer0003
     * @tc.desc      Audio renderer state STATE_RUNNING keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[2]).assertEqual(2);
      expect(states[2] >= 0).assertTrue();
      expect(states.indexOf(states[2])).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0004
     * @tc.name      testMoreAudioRenderer0004
     * @tc.desc      Audio renderer state STATE_PAUSED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[3]).assertEqual(5);
      expect(states[3] >= 0).assertTrue();
      expect(states.indexOf(states[3])).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0005
     * @tc.name      testMoreAudioRenderer0005
     * @tc.desc      Audio renderer state STATE_STOPPED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[4]).assertEqual(3);
      expect(states[4] >= 0).assertTrue();
      expect(states.indexOf(states[4])).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0006
     * @tc.name      testMoreAudioRenderer0006
     * @tc.desc      Audio renderer state STATE_RELEASED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[5]).assertEqual(4);
      expect(states[5] >= 0).assertTrue();
      expect(states.indexOf(states[5])).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0007
     * @tc.name      testMoreAudioRenderer0007
     * @tc.desc      Audio renderer state STATE_NEW keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[0]).assertEqual(0);
      expect(states[0] >= 0).assertTrue();
      expect(states.indexOf(states[0])).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0008
     * @tc.name      testMoreAudioRenderer0008
     * @tc.desc      Audio renderer state STATE_PREPARED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[1]).assertEqual(1);
      expect(states[1] >= 0).assertTrue();
      expect(states.indexOf(states[1])).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0009
     * @tc.name      testMoreAudioRenderer0009
     * @tc.desc      Audio renderer state STATE_RUNNING keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[2]).assertEqual(2);
      expect(states[2] >= 0).assertTrue();
      expect(states.indexOf(states[2])).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0010
     * @tc.name      testMoreAudioRenderer0010
     * @tc.desc      Audio renderer state STATE_PAUSED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[3]).assertEqual(5);
      expect(states[3] >= 0).assertTrue();
      expect(states.indexOf(states[3])).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0011
     * @tc.name      testMoreAudioRenderer0011
     * @tc.desc      Audio renderer state STATE_STOPPED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[4]).assertEqual(3);
      expect(states[4] >= 0).assertTrue();
      expect(states.indexOf(states[4])).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0012
     * @tc.name      testMoreAudioRenderer0012
     * @tc.desc      Audio renderer state STATE_RELEASED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[5]).assertEqual(4);
      expect(states[5] >= 0).assertTrue();
      expect(states.indexOf(states[5])).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0013
     * @tc.name      testMoreAudioRenderer0013
     * @tc.desc      Audio renderer state STATE_NEW keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[0]).assertEqual(0);
      expect(states[0] >= 0).assertTrue();
      expect(states.indexOf(states[0])).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0014
     * @tc.name      testMoreAudioRenderer0014
     * @tc.desc      Audio renderer state STATE_PREPARED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[1]).assertEqual(1);
      expect(states[1] >= 0).assertTrue();
      expect(states.indexOf(states[1])).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0015
     * @tc.name      testMoreAudioRenderer0015
     * @tc.desc      Audio renderer state STATE_RUNNING keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[2]).assertEqual(2);
      expect(states[2] >= 0).assertTrue();
      expect(states.indexOf(states[2])).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0016
     * @tc.name      testMoreAudioRenderer0016
     * @tc.desc      Audio renderer state STATE_PAUSED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[3]).assertEqual(5);
      expect(states[3] >= 0).assertTrue();
      expect(states.indexOf(states[3])).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0017
     * @tc.name      testMoreAudioRenderer0017
     * @tc.desc      Audio renderer state STATE_STOPPED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[4]).assertEqual(3);
      expect(states[4] >= 0).assertTrue();
      expect(states.indexOf(states[4])).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0018
     * @tc.name      testMoreAudioRenderer0018
     * @tc.desc      Audio renderer state STATE_RELEASED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[5]).assertEqual(4);
      expect(states[5] >= 0).assertTrue();
      expect(states.indexOf(states[5])).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0019
     * @tc.name      testMoreAudioRenderer0019
     * @tc.desc      Audio renderer state STATE_NEW keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[0]).assertEqual(0);
      expect(states[0] >= 0).assertTrue();
      expect(states.indexOf(states[0])).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0020
     * @tc.name      testMoreAudioRenderer0020
     * @tc.desc      Audio renderer state STATE_PREPARED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[1]).assertEqual(1);
      expect(states[1] >= 0).assertTrue();
      expect(states.indexOf(states[1])).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0021
     * @tc.name      testMoreAudioRenderer0021
     * @tc.desc      Audio renderer state STATE_RUNNING keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[2]).assertEqual(2);
      expect(states[2] >= 0).assertTrue();
      expect(states.indexOf(states[2])).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0022
     * @tc.name      testMoreAudioRenderer0022
     * @tc.desc      Audio renderer state STATE_PAUSED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[3]).assertEqual(5);
      expect(states[3] >= 0).assertTrue();
      expect(states.indexOf(states[3])).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0023
     * @tc.name      testMoreAudioRenderer0023
     * @tc.desc      Audio renderer state STATE_STOPPED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[4]).assertEqual(3);
      expect(states[4] >= 0).assertTrue();
      expect(states.indexOf(states[4])).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0024
     * @tc.name      testMoreAudioRenderer0024
     * @tc.desc      Audio renderer state STATE_RELEASED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[5]).assertEqual(4);
      expect(states[5] >= 0).assertTrue();
      expect(states.indexOf(states[5])).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0025
     * @tc.name      testMoreAudioRenderer0025
     * @tc.desc      Audio renderer state STATE_NEW keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[0]).assertEqual(0);
      expect(states[0] >= 0).assertTrue();
      expect(states.indexOf(states[0])).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0026
     * @tc.name      testMoreAudioRenderer0026
     * @tc.desc      Audio renderer state STATE_PREPARED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[1]).assertEqual(1);
      expect(states[1] >= 0).assertTrue();
      expect(states.indexOf(states[1])).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0027
     * @tc.name      testMoreAudioRenderer0027
     * @tc.desc      Audio renderer state STATE_RUNNING keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[2]).assertEqual(2);
      expect(states[2] >= 0).assertTrue();
      expect(states.indexOf(states[2])).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0028
     * @tc.name      testMoreAudioRenderer0028
     * @tc.desc      Audio renderer state STATE_PAUSED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[3]).assertEqual(5);
      expect(states[3] >= 0).assertTrue();
      expect(states.indexOf(states[3])).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0029
     * @tc.name      testMoreAudioRenderer0029
     * @tc.desc      Audio renderer state STATE_STOPPED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[4]).assertEqual(3);
      expect(states[4] >= 0).assertTrue();
      expect(states.indexOf(states[4])).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0030
     * @tc.name      testMoreAudioRenderer0030
     * @tc.desc      Audio renderer state STATE_RELEASED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[5]).assertEqual(4);
      expect(states[5] >= 0).assertTrue();
      expect(states.indexOf(states[5])).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0031
     * @tc.name      testMoreAudioRenderer0031
     * @tc.desc      Audio renderer state STATE_NEW keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[0]).assertEqual(0);
      expect(states[0] >= 0).assertTrue();
      expect(states.indexOf(states[0])).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0032
     * @tc.name      testMoreAudioRenderer0032
     * @tc.desc      Audio renderer state STATE_PREPARED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[1]).assertEqual(1);
      expect(states[1] >= 0).assertTrue();
      expect(states.indexOf(states[1])).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0033
     * @tc.name      testMoreAudioRenderer0033
     * @tc.desc      Audio renderer state STATE_RUNNING keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[2]).assertEqual(2);
      expect(states[2] >= 0).assertTrue();
      expect(states.indexOf(states[2])).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0034
     * @tc.name      testMoreAudioRenderer0034
     * @tc.desc      Audio renderer state STATE_PAUSED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[3]).assertEqual(5);
      expect(states[3] >= 0).assertTrue();
      expect(states.indexOf(states[3])).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0035
     * @tc.name      testMoreAudioRenderer0035
     * @tc.desc      Audio renderer state STATE_STOPPED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[4]).assertEqual(3);
      expect(states[4] >= 0).assertTrue();
      expect(states.indexOf(states[4])).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0036
     * @tc.name      testMoreAudioRenderer0036
     * @tc.desc      Audio renderer state STATE_RELEASED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[5]).assertEqual(4);
      expect(states[5] >= 0).assertTrue();
      expect(states.indexOf(states[5])).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0037
     * @tc.name      testMoreAudioRenderer0037
     * @tc.desc      Audio renderer state STATE_NEW keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[0]).assertEqual(0);
      expect(states[0] >= 0).assertTrue();
      expect(states.indexOf(states[0])).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0038
     * @tc.name      testMoreAudioRenderer0038
     * @tc.desc      Audio renderer state STATE_PREPARED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[1]).assertEqual(1);
      expect(states[1] >= 0).assertTrue();
      expect(states.indexOf(states[1])).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0039
     * @tc.name      testMoreAudioRenderer0039
     * @tc.desc      Audio renderer state STATE_RUNNING keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[2]).assertEqual(2);
      expect(states[2] >= 0).assertTrue();
      expect(states.indexOf(states[2])).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0040
     * @tc.name      testMoreAudioRenderer0040
     * @tc.desc      Audio renderer state STATE_PAUSED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[3]).assertEqual(5);
      expect(states[3] >= 0).assertTrue();
      expect(states.indexOf(states[3])).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0041
     * @tc.name      testMoreAudioRenderer0041
     * @tc.desc      Audio renderer state STATE_STOPPED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[4]).assertEqual(3);
      expect(states[4] >= 0).assertTrue();
      expect(states.indexOf(states[4])).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0042
     * @tc.name      testMoreAudioRenderer0042
     * @tc.desc      Audio renderer state STATE_RELEASED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[5]).assertEqual(4);
      expect(states[5] >= 0).assertTrue();
      expect(states.indexOf(states[5])).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0043
     * @tc.name      testMoreAudioRenderer0043
     * @tc.desc      Audio renderer state STATE_NEW keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[0]).assertEqual(0);
      expect(states[0] >= 0).assertTrue();
      expect(states.indexOf(states[0])).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0044
     * @tc.name      testMoreAudioRenderer0044
     * @tc.desc      Audio renderer state STATE_PREPARED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[1]).assertEqual(1);
      expect(states[1] >= 0).assertTrue();
      expect(states.indexOf(states[1])).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0045
     * @tc.name      testMoreAudioRenderer0045
     * @tc.desc      Audio renderer state STATE_RUNNING keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[2]).assertEqual(2);
      expect(states[2] >= 0).assertTrue();
      expect(states.indexOf(states[2])).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0046
     * @tc.name      testMoreAudioRenderer0046
     * @tc.desc      Audio renderer state STATE_PAUSED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[3]).assertEqual(5);
      expect(states[3] >= 0).assertTrue();
      expect(states.indexOf(states[3])).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0047
     * @tc.name      testMoreAudioRenderer0047
     * @tc.desc      Audio renderer state STATE_STOPPED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[4]).assertEqual(3);
      expect(states[4] >= 0).assertTrue();
      expect(states.indexOf(states[4])).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0048
     * @tc.name      testMoreAudioRenderer0048
     * @tc.desc      Audio renderer state STATE_RELEASED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[5]).assertEqual(4);
      expect(states[5] >= 0).assertTrue();
      expect(states.indexOf(states[5])).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0049
     * @tc.name      testMoreAudioRenderer0049
     * @tc.desc      Audio renderer state STATE_NEW keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[0]).assertEqual(0);
      expect(states[0] >= 0).assertTrue();
      expect(states.indexOf(states[0])).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0050
     * @tc.name      testMoreAudioRenderer0050
     * @tc.desc      Audio renderer state STATE_PREPARED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[1]).assertEqual(1);
      expect(states[1] >= 0).assertTrue();
      expect(states.indexOf(states[1])).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0051
     * @tc.name      testMoreAudioRenderer0051
     * @tc.desc      Audio renderer state STATE_RUNNING keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[2]).assertEqual(2);
      expect(states[2] >= 0).assertTrue();
      expect(states.indexOf(states[2])).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0052
     * @tc.name      testMoreAudioRenderer0052
     * @tc.desc      Audio renderer state STATE_PAUSED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[3]).assertEqual(5);
      expect(states[3] >= 0).assertTrue();
      expect(states.indexOf(states[3])).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0053
     * @tc.name      testMoreAudioRenderer0053
     * @tc.desc      Audio renderer state STATE_STOPPED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[4]).assertEqual(3);
      expect(states[4] >= 0).assertTrue();
      expect(states.indexOf(states[4])).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0054
     * @tc.name      testMoreAudioRenderer0054
     * @tc.desc      Audio renderer state STATE_RELEASED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[5]).assertEqual(4);
      expect(states[5] >= 0).assertTrue();
      expect(states.indexOf(states[5])).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0055
     * @tc.name      testMoreAudioRenderer0055
     * @tc.desc      Audio renderer state STATE_NEW keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[0]).assertEqual(0);
      expect(states[0] >= 0).assertTrue();
      expect(states.indexOf(states[0])).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0056
     * @tc.name      testMoreAudioRenderer0056
     * @tc.desc      Audio renderer state STATE_PREPARED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[1]).assertEqual(1);
      expect(states[1] >= 0).assertTrue();
      expect(states.indexOf(states[1])).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0057
     * @tc.name      testMoreAudioRenderer0057
     * @tc.desc      Audio renderer state STATE_RUNNING keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[2]).assertEqual(2);
      expect(states[2] >= 0).assertTrue();
      expect(states.indexOf(states[2])).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0058
     * @tc.name      testMoreAudioRenderer0058
     * @tc.desc      Audio renderer state STATE_PAUSED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[3]).assertEqual(5);
      expect(states[3] >= 0).assertTrue();
      expect(states.indexOf(states[3])).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0059
     * @tc.name      testMoreAudioRenderer0059
     * @tc.desc      Audio renderer state STATE_STOPPED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[4]).assertEqual(3);
      expect(states[4] >= 0).assertTrue();
      expect(states.indexOf(states[4])).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0060
     * @tc.name      testMoreAudioRenderer0060
     * @tc.desc      Audio renderer state STATE_RELEASED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[5]).assertEqual(4);
      expect(states[5] >= 0).assertTrue();
      expect(states.indexOf(states[5])).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0061
     * @tc.name      testMoreAudioRenderer0061
     * @tc.desc      Audio renderer state STATE_NEW keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[0]).assertEqual(0);
      expect(states[0] >= 0).assertTrue();
      expect(states.indexOf(states[0])).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0062
     * @tc.name      testMoreAudioRenderer0062
     * @tc.desc      Audio renderer state STATE_PREPARED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[1]).assertEqual(1);
      expect(states[1] >= 0).assertTrue();
      expect(states.indexOf(states[1])).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0063
     * @tc.name      testMoreAudioRenderer0063
     * @tc.desc      Audio renderer state STATE_RUNNING keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[2]).assertEqual(2);
      expect(states[2] >= 0).assertTrue();
      expect(states.indexOf(states[2])).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0064
     * @tc.name      testMoreAudioRenderer0064
     * @tc.desc      Audio renderer state STATE_PAUSED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[3]).assertEqual(5);
      expect(states[3] >= 0).assertTrue();
      expect(states.indexOf(states[3])).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0065
     * @tc.name      testMoreAudioRenderer0065
     * @tc.desc      Audio renderer state STATE_STOPPED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[4]).assertEqual(3);
      expect(states[4] >= 0).assertTrue();
      expect(states.indexOf(states[4])).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0066
     * @tc.name      testMoreAudioRenderer0066
     * @tc.desc      Audio renderer state STATE_RELEASED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[5]).assertEqual(4);
      expect(states[5] >= 0).assertTrue();
      expect(states.indexOf(states[5])).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0067
     * @tc.name      testMoreAudioRenderer0067
     * @tc.desc      Audio renderer state STATE_NEW keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[0]).assertEqual(0);
      expect(states[0] >= 0).assertTrue();
      expect(states.indexOf(states[0])).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0068
     * @tc.name      testMoreAudioRenderer0068
     * @tc.desc      Audio renderer state STATE_PREPARED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[1]).assertEqual(1);
      expect(states[1] >= 0).assertTrue();
      expect(states.indexOf(states[1])).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0069
     * @tc.name      testMoreAudioRenderer0069
     * @tc.desc      Audio renderer state STATE_RUNNING keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[2]).assertEqual(2);
      expect(states[2] >= 0).assertTrue();
      expect(states.indexOf(states[2])).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0070
     * @tc.name      testMoreAudioRenderer0070
     * @tc.desc      Audio renderer state STATE_PAUSED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[3]).assertEqual(5);
      expect(states[3] >= 0).assertTrue();
      expect(states.indexOf(states[3])).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0071
     * @tc.name      testMoreAudioRenderer0071
     * @tc.desc      Audio renderer state STATE_STOPPED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[4]).assertEqual(3);
      expect(states[4] >= 0).assertTrue();
      expect(states.indexOf(states[4])).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0072
     * @tc.name      testMoreAudioRenderer0072
     * @tc.desc      Audio renderer state STATE_RELEASED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[5]).assertEqual(4);
      expect(states[5] >= 0).assertTrue();
      expect(states.indexOf(states[5])).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0073
     * @tc.name      testMoreAudioRenderer0073
     * @tc.desc      Audio renderer state STATE_NEW keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[0]).assertEqual(0);
      expect(states[0] >= 0).assertTrue();
      expect(states.indexOf(states[0])).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0074
     * @tc.name      testMoreAudioRenderer0074
     * @tc.desc      Audio renderer state STATE_PREPARED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[1]).assertEqual(1);
      expect(states[1] >= 0).assertTrue();
      expect(states.indexOf(states[1])).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0075
     * @tc.name      testMoreAudioRenderer0075
     * @tc.desc      Audio renderer state STATE_RUNNING keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[2]).assertEqual(2);
      expect(states[2] >= 0).assertTrue();
      expect(states.indexOf(states[2])).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0076
     * @tc.name      testMoreAudioRenderer0076
     * @tc.desc      Audio renderer state STATE_PAUSED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[3]).assertEqual(5);
      expect(states[3] >= 0).assertTrue();
      expect(states.indexOf(states[3])).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0077
     * @tc.name      testMoreAudioRenderer0077
     * @tc.desc      Audio renderer state STATE_STOPPED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[4]).assertEqual(3);
      expect(states[4] >= 0).assertTrue();
      expect(states.indexOf(states[4])).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0078
     * @tc.name      testMoreAudioRenderer0078
     * @tc.desc      Audio renderer state STATE_RELEASED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[5]).assertEqual(4);
      expect(states[5] >= 0).assertTrue();
      expect(states.indexOf(states[5])).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0079
     * @tc.name      testMoreAudioRenderer0079
     * @tc.desc      Audio renderer state STATE_NEW keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[0]).assertEqual(0);
      expect(states[0] >= 0).assertTrue();
      expect(states.indexOf(states[0])).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0080
     * @tc.name      testMoreAudioRenderer0080
     * @tc.desc      Audio renderer state STATE_PREPARED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[1]).assertEqual(1);
      expect(states[1] >= 0).assertTrue();
      expect(states.indexOf(states[1])).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0081
     * @tc.name      testMoreAudioRenderer0081
     * @tc.desc      Audio renderer state STATE_RUNNING keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[2]).assertEqual(2);
      expect(states[2] >= 0).assertTrue();
      expect(states.indexOf(states[2])).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0082
     * @tc.name      testMoreAudioRenderer0082
     * @tc.desc      Audio renderer state STATE_PAUSED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[3]).assertEqual(5);
      expect(states[3] >= 0).assertTrue();
      expect(states.indexOf(states[3])).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0083
     * @tc.name      testMoreAudioRenderer0083
     * @tc.desc      Audio renderer state STATE_STOPPED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[4]).assertEqual(3);
      expect(states[4] >= 0).assertTrue();
      expect(states.indexOf(states[4])).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0084
     * @tc.name      testMoreAudioRenderer0084
     * @tc.desc      Audio renderer state STATE_RELEASED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[5]).assertEqual(4);
      expect(states[5] >= 0).assertTrue();
      expect(states.indexOf(states[5])).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0085
     * @tc.name      testMoreAudioRenderer0085
     * @tc.desc      Audio renderer state STATE_NEW keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[0]).assertEqual(0);
      expect(states[0] >= 0).assertTrue();
      expect(states.indexOf(states[0])).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0086
     * @tc.name      testMoreAudioRenderer0086
     * @tc.desc      Audio renderer state STATE_PREPARED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[1]).assertEqual(1);
      expect(states[1] >= 0).assertTrue();
      expect(states.indexOf(states[1])).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0087
     * @tc.name      testMoreAudioRenderer0087
     * @tc.desc      Audio renderer state STATE_RUNNING keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[2]).assertEqual(2);
      expect(states[2] >= 0).assertTrue();
      expect(states.indexOf(states[2])).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0088
     * @tc.name      testMoreAudioRenderer0088
     * @tc.desc      Audio renderer state STATE_PAUSED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[3]).assertEqual(5);
      expect(states[3] >= 0).assertTrue();
      expect(states.indexOf(states[3])).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0089
     * @tc.name      testMoreAudioRenderer0089
     * @tc.desc      Audio renderer state STATE_STOPPED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[4]).assertEqual(3);
      expect(states[4] >= 0).assertTrue();
      expect(states.indexOf(states[4])).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0090
     * @tc.name      testMoreAudioRenderer0090
     * @tc.desc      Audio renderer state STATE_RELEASED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[5]).assertEqual(4);
      expect(states[5] >= 0).assertTrue();
      expect(states.indexOf(states[5])).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0091
     * @tc.name      testMoreAudioRenderer0091
     * @tc.desc      Audio renderer state STATE_NEW keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[0]).assertEqual(0);
      expect(states[0] >= 0).assertTrue();
      expect(states.indexOf(states[0])).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0092
     * @tc.name      testMoreAudioRenderer0092
     * @tc.desc      Audio renderer state STATE_PREPARED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[1]).assertEqual(1);
      expect(states[1] >= 0).assertTrue();
      expect(states.indexOf(states[1])).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0093
     * @tc.name      testMoreAudioRenderer0093
     * @tc.desc      Audio renderer state STATE_RUNNING keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[2]).assertEqual(2);
      expect(states[2] >= 0).assertTrue();
      expect(states.indexOf(states[2])).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0094
     * @tc.name      testMoreAudioRenderer0094
     * @tc.desc      Audio renderer state STATE_PAUSED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[3]).assertEqual(5);
      expect(states[3] >= 0).assertTrue();
      expect(states.indexOf(states[3])).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0095
     * @tc.name      testMoreAudioRenderer0095
     * @tc.desc      Audio renderer state STATE_STOPPED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[4]).assertEqual(3);
      expect(states[4] >= 0).assertTrue();
      expect(states.indexOf(states[4])).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0096
     * @tc.name      testMoreAudioRenderer0096
     * @tc.desc      Audio renderer state STATE_RELEASED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[5]).assertEqual(4);
      expect(states[5] >= 0).assertTrue();
      expect(states.indexOf(states[5])).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0097
     * @tc.name      testMoreAudioRenderer0097
     * @tc.desc      Audio renderer state STATE_NEW keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[0]).assertEqual(0);
      expect(states[0] >= 0).assertTrue();
      expect(states.indexOf(states[0])).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0098
     * @tc.name      testMoreAudioRenderer0098
     * @tc.desc      Audio renderer state STATE_PREPARED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[1]).assertEqual(1);
      expect(states[1] >= 0).assertTrue();
      expect(states.indexOf(states[1])).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0099
     * @tc.name      testMoreAudioRenderer0099
     * @tc.desc      Audio renderer state STATE_RUNNING keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[2]).assertEqual(2);
      expect(states[2] >= 0).assertTrue();
      expect(states.indexOf(states[2])).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0100
     * @tc.name      testMoreAudioRenderer0100
     * @tc.desc      Audio renderer state STATE_PAUSED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[3]).assertEqual(5);
      expect(states[3] >= 0).assertTrue();
      expect(states.indexOf(states[3])).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AR_0101
     * @tc.name      testMoreAudioRenderer0101
     * @tc.desc      Audio renderer state STATE_STOPPED keeps its enum contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioRenderer0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: number[] = [0, 1,
        2, 5,
        3, 4];
      expect(states.length).assertEqual(6);
      expect(states[4]).assertEqual(3);
      expect(states[4] >= 0).assertTrue();
      expect(states.indexOf(states[4])).assertEqual(4);
    })
  })
}

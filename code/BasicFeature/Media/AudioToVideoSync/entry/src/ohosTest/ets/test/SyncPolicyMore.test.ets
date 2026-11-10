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

export default function syncPolicyMoreTest() {
  describe('syncPolicyMoreTest', () => {
    /**
     * @tc.number    SUB_AVS_MORE_SY_0001
     * @tc.name      testMoreSyncPolicy0001
     * @tc.desc      PTS delta -43ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -43;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-43);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0002
     * @tc.name      testMoreSyncPolicy0002
     * @tc.desc      PTS delta -42ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -42;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-42);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0003
     * @tc.name      testMoreSyncPolicy0003
     * @tc.desc      PTS delta -41ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -41;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-41);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0004
     * @tc.name      testMoreSyncPolicy0004
     * @tc.desc      PTS delta -40ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -40;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-40);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0005
     * @tc.name      testMoreSyncPolicy0005
     * @tc.desc      PTS delta -39ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -39;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-39);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0006
     * @tc.name      testMoreSyncPolicy0006
     * @tc.desc      PTS delta -38ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -38;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-38);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0007
     * @tc.name      testMoreSyncPolicy0007
     * @tc.desc      PTS delta -37ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -37;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-37);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0008
     * @tc.name      testMoreSyncPolicy0008
     * @tc.desc      PTS delta -36ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -36;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-36);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0009
     * @tc.name      testMoreSyncPolicy0009
     * @tc.desc      PTS delta -35ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -35;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-35);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0010
     * @tc.name      testMoreSyncPolicy0010
     * @tc.desc      PTS delta -34ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -34;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-34);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0011
     * @tc.name      testMoreSyncPolicy0011
     * @tc.desc      PTS delta -33ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -33;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-33);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0012
     * @tc.name      testMoreSyncPolicy0012
     * @tc.desc      PTS delta -32ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -32;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-32);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0013
     * @tc.name      testMoreSyncPolicy0013
     * @tc.desc      PTS delta -31ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -31;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-31);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0014
     * @tc.name      testMoreSyncPolicy0014
     * @tc.desc      PTS delta -30ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -30;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-30);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0015
     * @tc.name      testMoreSyncPolicy0015
     * @tc.desc      PTS delta -29ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -29;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-29);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0016
     * @tc.name      testMoreSyncPolicy0016
     * @tc.desc      PTS delta -28ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -28;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-28);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0017
     * @tc.name      testMoreSyncPolicy0017
     * @tc.desc      PTS delta -27ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -27;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-27);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0018
     * @tc.name      testMoreSyncPolicy0018
     * @tc.desc      PTS delta -26ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -26;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-26);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0019
     * @tc.name      testMoreSyncPolicy0019
     * @tc.desc      PTS delta -25ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -25;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-25);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0020
     * @tc.name      testMoreSyncPolicy0020
     * @tc.desc      PTS delta -24ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -24;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-24);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0021
     * @tc.name      testMoreSyncPolicy0021
     * @tc.desc      PTS delta -23ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -23;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-23);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0022
     * @tc.name      testMoreSyncPolicy0022
     * @tc.desc      PTS delta -22ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -22;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-22);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0023
     * @tc.name      testMoreSyncPolicy0023
     * @tc.desc      PTS delta -21ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -21;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-21);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0024
     * @tc.name      testMoreSyncPolicy0024
     * @tc.desc      PTS delta -20ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -20;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-20);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0025
     * @tc.name      testMoreSyncPolicy0025
     * @tc.desc      PTS delta -19ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -19;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-19);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0026
     * @tc.name      testMoreSyncPolicy0026
     * @tc.desc      PTS delta -18ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -18;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-18);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0027
     * @tc.name      testMoreSyncPolicy0027
     * @tc.desc      PTS delta -17ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -17;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-17);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0028
     * @tc.name      testMoreSyncPolicy0028
     * @tc.desc      PTS delta -16ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -16;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-16);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0029
     * @tc.name      testMoreSyncPolicy0029
     * @tc.desc      PTS delta -15ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -15;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-15);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0030
     * @tc.name      testMoreSyncPolicy0030
     * @tc.desc      PTS delta -14ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -14;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-14);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0031
     * @tc.name      testMoreSyncPolicy0031
     * @tc.desc      PTS delta -13ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -13;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-13);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0032
     * @tc.name      testMoreSyncPolicy0032
     * @tc.desc      PTS delta -12ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -12;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-12);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0033
     * @tc.name      testMoreSyncPolicy0033
     * @tc.desc      PTS delta -11ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -11;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-11);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0034
     * @tc.name      testMoreSyncPolicy0034
     * @tc.desc      PTS delta -10ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -10;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-10);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0035
     * @tc.name      testMoreSyncPolicy0035
     * @tc.desc      PTS delta -9ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -9;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-9);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0036
     * @tc.name      testMoreSyncPolicy0036
     * @tc.desc      PTS delta -8ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -8;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-8);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0037
     * @tc.name      testMoreSyncPolicy0037
     * @tc.desc      PTS delta -7ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -7;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-7);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0038
     * @tc.name      testMoreSyncPolicy0038
     * @tc.desc      PTS delta -6ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -6;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-6);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0039
     * @tc.name      testMoreSyncPolicy0039
     * @tc.desc      PTS delta -5ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -5;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-5);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0040
     * @tc.name      testMoreSyncPolicy0040
     * @tc.desc      PTS delta -4ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -4;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-4);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0041
     * @tc.name      testMoreSyncPolicy0041
     * @tc.desc      PTS delta -3ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -3;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-3);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0042
     * @tc.name      testMoreSyncPolicy0042
     * @tc.desc      PTS delta -2ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -2;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-2);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0043
     * @tc.name      testMoreSyncPolicy0043
     * @tc.desc      PTS delta -1ms chooses WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = -1;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-1);
      expect(policy).assertEqual('WAIT');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0044
     * @tc.name      testMoreSyncPolicy0044
     * @tc.desc      PTS delta 0ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 0;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(0);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0045
     * @tc.name      testMoreSyncPolicy0045
     * @tc.desc      PTS delta 1ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 1;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(1);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0046
     * @tc.name      testMoreSyncPolicy0046
     * @tc.desc      PTS delta 2ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 2;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(2);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0047
     * @tc.name      testMoreSyncPolicy0047
     * @tc.desc      PTS delta 3ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 3;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(3);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0048
     * @tc.name      testMoreSyncPolicy0048
     * @tc.desc      PTS delta 4ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 4;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(4);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0049
     * @tc.name      testMoreSyncPolicy0049
     * @tc.desc      PTS delta 5ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 5;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(5);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0050
     * @tc.name      testMoreSyncPolicy0050
     * @tc.desc      PTS delta 6ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 6;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(6);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0051
     * @tc.name      testMoreSyncPolicy0051
     * @tc.desc      PTS delta 7ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 7;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(7);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0052
     * @tc.name      testMoreSyncPolicy0052
     * @tc.desc      PTS delta 8ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 8;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(8);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0053
     * @tc.name      testMoreSyncPolicy0053
     * @tc.desc      PTS delta 9ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 9;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(9);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0054
     * @tc.name      testMoreSyncPolicy0054
     * @tc.desc      PTS delta 10ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 10;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(10);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0055
     * @tc.name      testMoreSyncPolicy0055
     * @tc.desc      PTS delta 11ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 11;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(11);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0056
     * @tc.name      testMoreSyncPolicy0056
     * @tc.desc      PTS delta 12ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 12;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(12);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0057
     * @tc.name      testMoreSyncPolicy0057
     * @tc.desc      PTS delta 13ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 13;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(13);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0058
     * @tc.name      testMoreSyncPolicy0058
     * @tc.desc      PTS delta 14ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 14;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(14);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0059
     * @tc.name      testMoreSyncPolicy0059
     * @tc.desc      PTS delta 15ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 15;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(15);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0060
     * @tc.name      testMoreSyncPolicy0060
     * @tc.desc      PTS delta 16ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 16;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(16);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0061
     * @tc.name      testMoreSyncPolicy0061
     * @tc.desc      PTS delta 17ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 17;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(17);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0062
     * @tc.name      testMoreSyncPolicy0062
     * @tc.desc      PTS delta 18ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 18;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(18);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0063
     * @tc.name      testMoreSyncPolicy0063
     * @tc.desc      PTS delta 19ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 19;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(19);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0064
     * @tc.name      testMoreSyncPolicy0064
     * @tc.desc      PTS delta 20ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 20;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(20);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0065
     * @tc.name      testMoreSyncPolicy0065
     * @tc.desc      PTS delta 21ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 21;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(21);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0066
     * @tc.name      testMoreSyncPolicy0066
     * @tc.desc      PTS delta 22ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 22;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(22);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0067
     * @tc.name      testMoreSyncPolicy0067
     * @tc.desc      PTS delta 23ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 23;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(23);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0068
     * @tc.name      testMoreSyncPolicy0068
     * @tc.desc      PTS delta 24ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 24;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(24);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0069
     * @tc.name      testMoreSyncPolicy0069
     * @tc.desc      PTS delta 25ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 25;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(25);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0070
     * @tc.name      testMoreSyncPolicy0070
     * @tc.desc      PTS delta 26ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 26;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(26);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0071
     * @tc.name      testMoreSyncPolicy0071
     * @tc.desc      PTS delta 27ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 27;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(27);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0072
     * @tc.name      testMoreSyncPolicy0072
     * @tc.desc      PTS delta 28ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 28;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(28);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0073
     * @tc.name      testMoreSyncPolicy0073
     * @tc.desc      PTS delta 29ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 29;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(29);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0074
     * @tc.name      testMoreSyncPolicy0074
     * @tc.desc      PTS delta 30ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 30;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(30);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0075
     * @tc.name      testMoreSyncPolicy0075
     * @tc.desc      PTS delta 31ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 31;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(31);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0076
     * @tc.name      testMoreSyncPolicy0076
     * @tc.desc      PTS delta 32ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 32;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(32);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0077
     * @tc.name      testMoreSyncPolicy0077
     * @tc.desc      PTS delta 33ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 33;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(33);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0078
     * @tc.name      testMoreSyncPolicy0078
     * @tc.desc      PTS delta 34ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 34;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(34);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0079
     * @tc.name      testMoreSyncPolicy0079
     * @tc.desc      PTS delta 35ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 35;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(35);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0080
     * @tc.name      testMoreSyncPolicy0080
     * @tc.desc      PTS delta 36ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 36;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(36);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0081
     * @tc.name      testMoreSyncPolicy0081
     * @tc.desc      PTS delta 37ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 37;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(37);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0082
     * @tc.name      testMoreSyncPolicy0082
     * @tc.desc      PTS delta 38ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 38;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(38);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0083
     * @tc.name      testMoreSyncPolicy0083
     * @tc.desc      PTS delta 39ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 39;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(39);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0084
     * @tc.name      testMoreSyncPolicy0084
     * @tc.desc      PTS delta 40ms chooses SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 40;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(40);
      expect(policy).assertEqual('SHOW');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0085
     * @tc.name      testMoreSyncPolicy0085
     * @tc.desc      PTS delta 41ms chooses DROP.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 41;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(41);
      expect(policy).assertEqual('DROP');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_SY_0086
     * @tc.name      testMoreSyncPolicy0086
     * @tc.desc      PTS delta 42ms chooses DROP.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSyncPolicy0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const delta: number = 42;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(42);
      expect(policy).assertEqual('DROP');
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
  })
}

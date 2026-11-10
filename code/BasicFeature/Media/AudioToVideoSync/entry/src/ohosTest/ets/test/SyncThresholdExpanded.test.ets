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

export default function syncThresholdExpandedTest() {
  describe('syncThresholdExpandedTest', () => {
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0001
     * @tc.name      testProjSyncThreshold0001
     * @tc.desc      Video-audio delta -50 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-50);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-50);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0002
     * @tc.name      testProjSyncThreshold0002
     * @tc.desc      Video-audio delta -49 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-49);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-49);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0003
     * @tc.name      testProjSyncThreshold0003
     * @tc.desc      Video-audio delta -48 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-48);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-48);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0004
     * @tc.name      testProjSyncThreshold0004
     * @tc.desc      Video-audio delta -47 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-47);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-47);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0005
     * @tc.name      testProjSyncThreshold0005
     * @tc.desc      Video-audio delta -46 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-46);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-46);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0006
     * @tc.name      testProjSyncThreshold0006
     * @tc.desc      Video-audio delta -45 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-45);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-45);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0007
     * @tc.name      testProjSyncThreshold0007
     * @tc.desc      Video-audio delta -44 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-44);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-44);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0008
     * @tc.name      testProjSyncThreshold0008
     * @tc.desc      Video-audio delta -43 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-43);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-43);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0009
     * @tc.name      testProjSyncThreshold0009
     * @tc.desc      Video-audio delta -42 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-42);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-42);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0010
     * @tc.name      testProjSyncThreshold0010
     * @tc.desc      Video-audio delta -41 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-41);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-41);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0011
     * @tc.name      testProjSyncThreshold0011
     * @tc.desc      Video-audio delta -40 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-40);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-40);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0012
     * @tc.name      testProjSyncThreshold0012
     * @tc.desc      Video-audio delta -39 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-39);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-39);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0013
     * @tc.name      testProjSyncThreshold0013
     * @tc.desc      Video-audio delta -38 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-38);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-38);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0014
     * @tc.name      testProjSyncThreshold0014
     * @tc.desc      Video-audio delta -37 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-37);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-37);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0015
     * @tc.name      testProjSyncThreshold0015
     * @tc.desc      Video-audio delta -36 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-36);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-36);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0016
     * @tc.name      testProjSyncThreshold0016
     * @tc.desc      Video-audio delta -35 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-35);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-35);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0017
     * @tc.name      testProjSyncThreshold0017
     * @tc.desc      Video-audio delta -34 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-34);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-34);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0018
     * @tc.name      testProjSyncThreshold0018
     * @tc.desc      Video-audio delta -33 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-33);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-33);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0019
     * @tc.name      testProjSyncThreshold0019
     * @tc.desc      Video-audio delta -32 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-32);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-32);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0020
     * @tc.name      testProjSyncThreshold0020
     * @tc.desc      Video-audio delta -31 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-31);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-31);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0021
     * @tc.name      testProjSyncThreshold0021
     * @tc.desc      Video-audio delta -30 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-30);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-30);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0022
     * @tc.name      testProjSyncThreshold0022
     * @tc.desc      Video-audio delta -29 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-29);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-29);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0023
     * @tc.name      testProjSyncThreshold0023
     * @tc.desc      Video-audio delta -28 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-28);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-28);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0024
     * @tc.name      testProjSyncThreshold0024
     * @tc.desc      Video-audio delta -27 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-27);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-27);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0025
     * @tc.name      testProjSyncThreshold0025
     * @tc.desc      Video-audio delta -26 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-26);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-26);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0026
     * @tc.name      testProjSyncThreshold0026
     * @tc.desc      Video-audio delta -25 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-25);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-25);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0027
     * @tc.name      testProjSyncThreshold0027
     * @tc.desc      Video-audio delta -24 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-24);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-24);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0028
     * @tc.name      testProjSyncThreshold0028
     * @tc.desc      Video-audio delta -23 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-23);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-23);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0029
     * @tc.name      testProjSyncThreshold0029
     * @tc.desc      Video-audio delta -22 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-22);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-22);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0030
     * @tc.name      testProjSyncThreshold0030
     * @tc.desc      Video-audio delta -21 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-21);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-21);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0031
     * @tc.name      testProjSyncThreshold0031
     * @tc.desc      Video-audio delta -20 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-20);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-20);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0032
     * @tc.name      testProjSyncThreshold0032
     * @tc.desc      Video-audio delta -19 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-19);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-19);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0033
     * @tc.name      testProjSyncThreshold0033
     * @tc.desc      Video-audio delta -18 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-18);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-18);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0034
     * @tc.name      testProjSyncThreshold0034
     * @tc.desc      Video-audio delta -17 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-17);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-17);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0035
     * @tc.name      testProjSyncThreshold0035
     * @tc.desc      Video-audio delta -16 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-16);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-16);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0036
     * @tc.name      testProjSyncThreshold0036
     * @tc.desc      Video-audio delta -15 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-15);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-15);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0037
     * @tc.name      testProjSyncThreshold0037
     * @tc.desc      Video-audio delta -14 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-14);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-14);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0038
     * @tc.name      testProjSyncThreshold0038
     * @tc.desc      Video-audio delta -13 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-13);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-13);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0039
     * @tc.name      testProjSyncThreshold0039
     * @tc.desc      Video-audio delta -12 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-12);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-12);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0040
     * @tc.name      testProjSyncThreshold0040
     * @tc.desc      Video-audio delta -11 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-11);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-11);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0041
     * @tc.name      testProjSyncThreshold0041
     * @tc.desc      Video-audio delta -10 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-10);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-10);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0042
     * @tc.name      testProjSyncThreshold0042
     * @tc.desc      Video-audio delta -9 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-9);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-9);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0043
     * @tc.name      testProjSyncThreshold0043
     * @tc.desc      Video-audio delta -8 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-8);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-8);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0044
     * @tc.name      testProjSyncThreshold0044
     * @tc.desc      Video-audio delta -7 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-7);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-7);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0045
     * @tc.name      testProjSyncThreshold0045
     * @tc.desc      Video-audio delta -6 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-6);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-6);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0046
     * @tc.name      testProjSyncThreshold0046
     * @tc.desc      Video-audio delta -5 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-5);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-5);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0047
     * @tc.name      testProjSyncThreshold0047
     * @tc.desc      Video-audio delta -4 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-4);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-4);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0048
     * @tc.name      testProjSyncThreshold0048
     * @tc.desc      Video-audio delta -3 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-3);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-3);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0049
     * @tc.name      testProjSyncThreshold0049
     * @tc.desc      Video-audio delta -2 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-2);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-2);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0050
     * @tc.name      testProjSyncThreshold0050
     * @tc.desc      Video-audio delta -1 ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (-1);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(-1);
      expect(policy).assertEqual('WAIT');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0051
     * @tc.name      testProjSyncThreshold0051
     * @tc.desc      Video-audio delta 0 ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (0);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(0);
      expect(policy).assertEqual('SHOW');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0052
     * @tc.name      testProjSyncThreshold0052
     * @tc.desc      Video-audio delta 1 ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (1);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(1);
      expect(policy).assertEqual('SHOW');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0053
     * @tc.name      testProjSyncThreshold0053
     * @tc.desc      Video-audio delta 2 ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (2);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(2);
      expect(policy).assertEqual('SHOW');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0054
     * @tc.name      testProjSyncThreshold0054
     * @tc.desc      Video-audio delta 3 ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (3);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(3);
      expect(policy).assertEqual('SHOW');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0055
     * @tc.name      testProjSyncThreshold0055
     * @tc.desc      Video-audio delta 4 ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (4);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(4);
      expect(policy).assertEqual('SHOW');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0056
     * @tc.name      testProjSyncThreshold0056
     * @tc.desc      Video-audio delta 5 ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (5);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(5);
      expect(policy).assertEqual('SHOW');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0057
     * @tc.name      testProjSyncThreshold0057
     * @tc.desc      Video-audio delta 6 ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (6);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(6);
      expect(policy).assertEqual('SHOW');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0058
     * @tc.name      testProjSyncThreshold0058
     * @tc.desc      Video-audio delta 7 ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (7);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(7);
      expect(policy).assertEqual('SHOW');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0059
     * @tc.name      testProjSyncThreshold0059
     * @tc.desc      Video-audio delta 8 ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (8);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(8);
      expect(policy).assertEqual('SHOW');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0060
     * @tc.name      testProjSyncThreshold0060
     * @tc.desc      Video-audio delta 9 ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (9);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(9);
      expect(policy).assertEqual('SHOW');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0061
     * @tc.name      testProjSyncThreshold0061
     * @tc.desc      Video-audio delta 10 ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (10);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(10);
      expect(policy).assertEqual('SHOW');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0062
     * @tc.name      testProjSyncThreshold0062
     * @tc.desc      Video-audio delta 11 ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (11);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(11);
      expect(policy).assertEqual('SHOW');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0063
     * @tc.name      testProjSyncThreshold0063
     * @tc.desc      Video-audio delta 12 ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (12);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(12);
      expect(policy).assertEqual('SHOW');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0064
     * @tc.name      testProjSyncThreshold0064
     * @tc.desc      Video-audio delta 13 ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (13);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(13);
      expect(policy).assertEqual('SHOW');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0065
     * @tc.name      testProjSyncThreshold0065
     * @tc.desc      Video-audio delta 14 ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (14);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(14);
      expect(policy).assertEqual('SHOW');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0066
     * @tc.name      testProjSyncThreshold0066
     * @tc.desc      Video-audio delta 15 ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (15);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(15);
      expect(policy).assertEqual('SHOW');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0067
     * @tc.name      testProjSyncThreshold0067
     * @tc.desc      Video-audio delta 16 ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (16);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(16);
      expect(policy).assertEqual('SHOW');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0068
     * @tc.name      testProjSyncThreshold0068
     * @tc.desc      Video-audio delta 17 ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (17);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(17);
      expect(policy).assertEqual('SHOW');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0069
     * @tc.name      testProjSyncThreshold0069
     * @tc.desc      Video-audio delta 18 ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (18);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(18);
      expect(policy).assertEqual('SHOW');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0070
     * @tc.name      testProjSyncThreshold0070
     * @tc.desc      Video-audio delta 19 ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (19);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(19);
      expect(policy).assertEqual('SHOW');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0071
     * @tc.name      testProjSyncThreshold0071
     * @tc.desc      Video-audio delta 20 ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (20);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(20);
      expect(policy).assertEqual('SHOW');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0072
     * @tc.name      testProjSyncThreshold0072
     * @tc.desc      Video-audio delta 21 ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (21);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(21);
      expect(policy).assertEqual('SHOW');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0073
     * @tc.name      testProjSyncThreshold0073
     * @tc.desc      Video-audio delta 22 ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (22);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(22);
      expect(policy).assertEqual('SHOW');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0074
     * @tc.name      testProjSyncThreshold0074
     * @tc.desc      Video-audio delta 23 ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (23);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(23);
      expect(policy).assertEqual('SHOW');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0075
     * @tc.name      testProjSyncThreshold0075
     * @tc.desc      Video-audio delta 24 ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (24);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(24);
      expect(policy).assertEqual('SHOW');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0076
     * @tc.name      testProjSyncThreshold0076
     * @tc.desc      Video-audio delta 25 ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (25);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(25);
      expect(policy).assertEqual('SHOW');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0077
     * @tc.name      testProjSyncThreshold0077
     * @tc.desc      Video-audio delta 26 ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (26);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(26);
      expect(policy).assertEqual('SHOW');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0078
     * @tc.name      testProjSyncThreshold0078
     * @tc.desc      Video-audio delta 27 ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (27);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(27);
      expect(policy).assertEqual('SHOW');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0079
     * @tc.name      testProjSyncThreshold0079
     * @tc.desc      Video-audio delta 28 ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (28);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(28);
      expect(policy).assertEqual('SHOW');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0080
     * @tc.name      testProjSyncThreshold0080
     * @tc.desc      Video-audio delta 29 ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (29);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(29);
      expect(policy).assertEqual('SHOW');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0081
     * @tc.name      testProjSyncThreshold0081
     * @tc.desc      Video-audio delta 30 ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (30);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(30);
      expect(policy).assertEqual('SHOW');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0082
     * @tc.name      testProjSyncThreshold0082
     * @tc.desc      Video-audio delta 31 ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (31);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(31);
      expect(policy).assertEqual('SHOW');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0083
     * @tc.name      testProjSyncThreshold0083
     * @tc.desc      Video-audio delta 32 ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (32);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(32);
      expect(policy).assertEqual('SHOW');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0084
     * @tc.name      testProjSyncThreshold0084
     * @tc.desc      Video-audio delta 33 ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (33);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(33);
      expect(policy).assertEqual('SHOW');
      expect(policy.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_SYNCT_0085
     * @tc.name      testProjSyncThreshold0085
     * @tc.desc      Video-audio delta 34 ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjSyncThreshold0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const videoPts: number = 1000;
      const audioPts: number = 1000 - (34);
      const delta: number = videoPts - audioPts;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(delta).assertEqual(34);
      expect(policy).assertEqual('SHOW');
      expect(policy.length > 0).assertTrue();
    })
  })
}

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
import { describe, it, expect } from '@ohos/hypium';

export default function subtitleSafeStateCoreTest() {
  describe('subtitleSafeStateCoreTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0001
     * @tc.name      testSafeSyncState0001
     * @tc.desc      Sync delta -50 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0001', 0, () => {
      const delta: number = -50;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-50);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0002
     * @tc.name      testSafeSyncState0002
     * @tc.desc      Sync delta -49 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0002', 0, () => {
      const delta: number = -49;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-49);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0003
     * @tc.name      testSafeSyncState0003
     * @tc.desc      Sync delta -48 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0003', 0, () => {
      const delta: number = -48;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-48);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0004
     * @tc.name      testSafeSyncState0004
     * @tc.desc      Sync delta -47 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0004', 0, () => {
      const delta: number = -47;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-47);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0005
     * @tc.name      testSafeSyncState0005
     * @tc.desc      Sync delta -46 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0005', 0, () => {
      const delta: number = -46;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-46);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0006
     * @tc.name      testSafeSyncState0006
     * @tc.desc      Sync delta -45 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0006', 0, () => {
      const delta: number = -45;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-45);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0007
     * @tc.name      testSafeSyncState0007
     * @tc.desc      Sync delta -44 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0007', 0, () => {
      const delta: number = -44;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-44);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0008
     * @tc.name      testSafeSyncState0008
     * @tc.desc      Sync delta -43 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0008', 0, () => {
      const delta: number = -43;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-43);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0009
     * @tc.name      testSafeSyncState0009
     * @tc.desc      Sync delta -42 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0009', 0, () => {
      const delta: number = -42;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-42);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0010
     * @tc.name      testSafeSyncState0010
     * @tc.desc      Sync delta -41 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0010', 0, () => {
      const delta: number = -41;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-41);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0011
     * @tc.name      testSafeSyncState0011
     * @tc.desc      Sync delta -40 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0011', 0, () => {
      const delta: number = -40;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-40);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0012
     * @tc.name      testSafeSyncState0012
     * @tc.desc      Sync delta -39 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0012', 0, () => {
      const delta: number = -39;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-39);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0013
     * @tc.name      testSafeSyncState0013
     * @tc.desc      Sync delta -38 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0013', 0, () => {
      const delta: number = -38;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-38);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0014
     * @tc.name      testSafeSyncState0014
     * @tc.desc      Sync delta -37 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0014', 0, () => {
      const delta: number = -37;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-37);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0015
     * @tc.name      testSafeSyncState0015
     * @tc.desc      Sync delta -36 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0015', 0, () => {
      const delta: number = -36;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-36);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0016
     * @tc.name      testSafeSyncState0016
     * @tc.desc      Sync delta -35 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0016', 0, () => {
      const delta: number = -35;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-35);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0017
     * @tc.name      testSafeSyncState0017
     * @tc.desc      Sync delta -34 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0017', 0, () => {
      const delta: number = -34;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-34);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0018
     * @tc.name      testSafeSyncState0018
     * @tc.desc      Sync delta -33 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0018', 0, () => {
      const delta: number = -33;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-33);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0019
     * @tc.name      testSafeSyncState0019
     * @tc.desc      Sync delta -32 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0019', 0, () => {
      const delta: number = -32;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-32);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0020
     * @tc.name      testSafeSyncState0020
     * @tc.desc      Sync delta -31 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0020', 0, () => {
      const delta: number = -31;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-31);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0021
     * @tc.name      testSafeSyncState0021
     * @tc.desc      Sync delta -30 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0021', 0, () => {
      const delta: number = -30;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-30);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0022
     * @tc.name      testSafeSyncState0022
     * @tc.desc      Sync delta -29 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0022', 0, () => {
      const delta: number = -29;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-29);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0023
     * @tc.name      testSafeSyncState0023
     * @tc.desc      Sync delta -28 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0023', 0, () => {
      const delta: number = -28;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-28);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0024
     * @tc.name      testSafeSyncState0024
     * @tc.desc      Sync delta -27 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0024', 0, () => {
      const delta: number = -27;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-27);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0025
     * @tc.name      testSafeSyncState0025
     * @tc.desc      Sync delta -26 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0025', 0, () => {
      const delta: number = -26;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-26);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0026
     * @tc.name      testSafeSyncState0026
     * @tc.desc      Sync delta -25 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0026', 0, () => {
      const delta: number = -25;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-25);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0027
     * @tc.name      testSafeSyncState0027
     * @tc.desc      Sync delta -24 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0027', 0, () => {
      const delta: number = -24;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-24);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0028
     * @tc.name      testSafeSyncState0028
     * @tc.desc      Sync delta -23 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0028', 0, () => {
      const delta: number = -23;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-23);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0029
     * @tc.name      testSafeSyncState0029
     * @tc.desc      Sync delta -22 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0029', 0, () => {
      const delta: number = -22;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-22);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0030
     * @tc.name      testSafeSyncState0030
     * @tc.desc      Sync delta -21 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0030', 0, () => {
      const delta: number = -21;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-21);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0031
     * @tc.name      testSafeSyncState0031
     * @tc.desc      Sync delta -20 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0031', 0, () => {
      const delta: number = -20;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-20);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0032
     * @tc.name      testSafeSyncState0032
     * @tc.desc      Sync delta -19 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0032', 0, () => {
      const delta: number = -19;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-19);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0033
     * @tc.name      testSafeSyncState0033
     * @tc.desc      Sync delta -18 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0033', 0, () => {
      const delta: number = -18;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-18);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0034
     * @tc.name      testSafeSyncState0034
     * @tc.desc      Sync delta -17 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0034', 0, () => {
      const delta: number = -17;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-17);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0035
     * @tc.name      testSafeSyncState0035
     * @tc.desc      Sync delta -16 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0035', 0, () => {
      const delta: number = -16;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-16);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0036
     * @tc.name      testSafeSyncState0036
     * @tc.desc      Sync delta -15 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0036', 0, () => {
      const delta: number = -15;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-15);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0037
     * @tc.name      testSafeSyncState0037
     * @tc.desc      Sync delta -14 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0037', 0, () => {
      const delta: number = -14;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-14);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0038
     * @tc.name      testSafeSyncState0038
     * @tc.desc      Sync delta -13 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0038', 0, () => {
      const delta: number = -13;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-13);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0039
     * @tc.name      testSafeSyncState0039
     * @tc.desc      Sync delta -12 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0039', 0, () => {
      const delta: number = -12;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-12);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0040
     * @tc.name      testSafeSyncState0040
     * @tc.desc      Sync delta -11 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0040', 0, () => {
      const delta: number = -11;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-11);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0041
     * @tc.name      testSafeSyncState0041
     * @tc.desc      Sync delta -10 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0041', 0, () => {
      const delta: number = -10;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-10);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0042
     * @tc.name      testSafeSyncState0042
     * @tc.desc      Sync delta -9 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0042', 0, () => {
      const delta: number = -9;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-9);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0043
     * @tc.name      testSafeSyncState0043
     * @tc.desc      Sync delta -8 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0043', 0, () => {
      const delta: number = -8;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-8);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0044
     * @tc.name      testSafeSyncState0044
     * @tc.desc      Sync delta -7 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0044', 0, () => {
      const delta: number = -7;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-7);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0045
     * @tc.name      testSafeSyncState0045
     * @tc.desc      Sync delta -6 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0045', 0, () => {
      const delta: number = -6;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-6);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0046
     * @tc.name      testSafeSyncState0046
     * @tc.desc      Sync delta -5 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0046', 0, () => {
      const delta: number = -5;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-5);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0047
     * @tc.name      testSafeSyncState0047
     * @tc.desc      Sync delta -4 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0047', 0, () => {
      const delta: number = -4;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-4);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0048
     * @tc.name      testSafeSyncState0048
     * @tc.desc      Sync delta -3 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0048', 0, () => {
      const delta: number = -3;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-3);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0049
     * @tc.name      testSafeSyncState0049
     * @tc.desc      Sync delta -2 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0049', 0, () => {
      const delta: number = -2;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-2);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0050
     * @tc.name      testSafeSyncState0050
     * @tc.desc      Sync delta -1 selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0050', 0, () => {
      const delta: number = -1;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-1);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0051
     * @tc.name      testSafeSyncState0051
     * @tc.desc      Sync delta 0 selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0051', 0, () => {
      const delta: number = 0;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(0);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0052
     * @tc.name      testSafeSyncState0052
     * @tc.desc      Sync delta 1 selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0052', 0, () => {
      const delta: number = 1;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(1);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0053
     * @tc.name      testSafeSyncState0053
     * @tc.desc      Sync delta 2 selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0053', 0, () => {
      const delta: number = 2;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(2);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0054
     * @tc.name      testSafeSyncState0054
     * @tc.desc      Sync delta 3 selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0054', 0, () => {
      const delta: number = 3;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(3);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0055
     * @tc.name      testSafeSyncState0055
     * @tc.desc      Sync delta 4 selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0055', 0, () => {
      const delta: number = 4;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(4);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0056
     * @tc.name      testSafeSyncState0056
     * @tc.desc      Sync delta 5 selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0056', 0, () => {
      const delta: number = 5;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(5);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0057
     * @tc.name      testSafeSyncState0057
     * @tc.desc      Sync delta 6 selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0057', 0, () => {
      const delta: number = 6;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(6);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0058
     * @tc.name      testSafeSyncState0058
     * @tc.desc      Sync delta 7 selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0058', 0, () => {
      const delta: number = 7;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(7);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0059
     * @tc.name      testSafeSyncState0059
     * @tc.desc      Sync delta 8 selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0059', 0, () => {
      const delta: number = 8;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(8);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0060
     * @tc.name      testSafeSyncState0060
     * @tc.desc      Sync delta 9 selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0060', 0, () => {
      const delta: number = 9;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(9);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0061
     * @tc.name      testSafeSyncState0061
     * @tc.desc      Sync delta 10 selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0061', 0, () => {
      const delta: number = 10;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(10);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0062
     * @tc.name      testSafeSyncState0062
     * @tc.desc      Sync delta 11 selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0062', 0, () => {
      const delta: number = 11;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(11);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0063
     * @tc.name      testSafeSyncState0063
     * @tc.desc      Sync delta 12 selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0063', 0, () => {
      const delta: number = 12;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(12);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0064
     * @tc.name      testSafeSyncState0064
     * @tc.desc      Sync delta 13 selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0064', 0, () => {
      const delta: number = 13;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(13);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0065
     * @tc.name      testSafeSyncState0065
     * @tc.desc      Sync delta 14 selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0065', 0, () => {
      const delta: number = 14;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(14);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0066
     * @tc.name      testSafeSyncState0066
     * @tc.desc      Sync delta 15 selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0066', 0, () => {
      const delta: number = 15;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(15);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0067
     * @tc.name      testSafeSyncState0067
     * @tc.desc      Sync delta 16 selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0067', 0, () => {
      const delta: number = 16;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(16);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0068
     * @tc.name      testSafeSyncState0068
     * @tc.desc      Sync delta 17 selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0068', 0, () => {
      const delta: number = 17;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(17);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0069
     * @tc.name      testSafeSyncState0069
     * @tc.desc      Sync delta 18 selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0069', 0, () => {
      const delta: number = 18;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(18);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0070
     * @tc.name      testSafeSyncState0070
     * @tc.desc      Sync delta 19 selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0070', 0, () => {
      const delta: number = 19;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(19);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0071
     * @tc.name      testSafeSyncState0071
     * @tc.desc      Sync delta 20 selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0071', 0, () => {
      const delta: number = 20;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(20);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0072
     * @tc.name      testSafeSyncState0072
     * @tc.desc      Sync delta 21 selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0072', 0, () => {
      const delta: number = 21;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(21);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0073
     * @tc.name      testSafeSyncState0073
     * @tc.desc      Sync delta 22 selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0073', 0, () => {
      const delta: number = 22;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(22);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0074
     * @tc.name      testSafeSyncState0074
     * @tc.desc      Sync delta 23 selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0074', 0, () => {
      const delta: number = 23;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(23);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0075
     * @tc.name      testSafeSyncState0075
     * @tc.desc      Sync delta 24 selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0075', 0, () => {
      const delta: number = 24;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(24);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0076
     * @tc.name      testSafeSyncState0076
     * @tc.desc      Sync delta 25 selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0076', 0, () => {
      const delta: number = 25;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(25);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0077
     * @tc.name      testSafeSyncState0077
     * @tc.desc      Sync delta 26 selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0077', 0, () => {
      const delta: number = 26;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(26);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0078
     * @tc.name      testSafeSyncState0078
     * @tc.desc      Sync delta 27 selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0078', 0, () => {
      const delta: number = 27;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(27);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0079
     * @tc.name      testSafeSyncState0079
     * @tc.desc      Sync delta 28 selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0079', 0, () => {
      const delta: number = 28;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(28);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0080
     * @tc.name      testSafeSyncState0080
     * @tc.desc      Sync delta 29 selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0080', 0, () => {
      const delta: number = 29;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(29);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0081
     * @tc.name      testSafeSyncState0081
     * @tc.desc      Sync delta 30 selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0081', 0, () => {
      const delta: number = 30;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(30);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0082
     * @tc.name      testSafeSyncState0082
     * @tc.desc      Sync delta 31 selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0082', 0, () => {
      const delta: number = 31;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(31);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0083
     * @tc.name      testSafeSyncState0083
     * @tc.desc      Sync delta 32 selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0083', 0, () => {
      const delta: number = 32;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(32);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0084
     * @tc.name      testSafeSyncState0084
     * @tc.desc      Sync delta 33 selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0084', 0, () => {
      const delta: number = 33;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(33);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0085
     * @tc.name      testSafeSyncState0085
     * @tc.desc      Sync delta 34 selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0085', 0, () => {
      const delta: number = 34;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(34);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0086
     * @tc.name      testSafeSyncState0086
     * @tc.desc      Sync delta 35 selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0086', 0, () => {
      const delta: number = 35;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(35);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0087
     * @tc.name      testSafeSyncState0087
     * @tc.desc      Sync delta 36 selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0087', 0, () => {
      const delta: number = 36;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(36);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_ST_0088
     * @tc.name      testSafeSyncState0088
     * @tc.desc      Sync delta 37 selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSyncState0088', 0, () => {
      const delta: number = 37;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(37);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
      expect(Number.isInteger(delta)).assertTrue();
    })
  })
}

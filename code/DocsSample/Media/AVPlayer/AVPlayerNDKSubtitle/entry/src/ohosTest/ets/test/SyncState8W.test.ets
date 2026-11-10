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


export default function syncState8wTest() {
  describe('syncState8wTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0001
     * @tc.name      test8wSyncState0001
     * @tc.desc      Sync delta -49ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0001', 0, () => {
      const delta: number = -49;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-49);
      expect(Math.abs(delta)).assertEqual(49);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0002
     * @tc.name      test8wSyncState0002
     * @tc.desc      Sync delta -48ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0002', 0, () => {
      const delta: number = -48;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-48);
      expect(Math.abs(delta)).assertEqual(48);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0003
     * @tc.name      test8wSyncState0003
     * @tc.desc      Sync delta -47ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0003', 0, () => {
      const delta: number = -47;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-47);
      expect(Math.abs(delta)).assertEqual(47);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0004
     * @tc.name      test8wSyncState0004
     * @tc.desc      Sync delta -46ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0004', 0, () => {
      const delta: number = -46;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-46);
      expect(Math.abs(delta)).assertEqual(46);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0005
     * @tc.name      test8wSyncState0005
     * @tc.desc      Sync delta -45ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0005', 0, () => {
      const delta: number = -45;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-45);
      expect(Math.abs(delta)).assertEqual(45);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0006
     * @tc.name      test8wSyncState0006
     * @tc.desc      Sync delta -44ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0006', 0, () => {
      const delta: number = -44;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-44);
      expect(Math.abs(delta)).assertEqual(44);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0007
     * @tc.name      test8wSyncState0007
     * @tc.desc      Sync delta -43ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0007', 0, () => {
      const delta: number = -43;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-43);
      expect(Math.abs(delta)).assertEqual(43);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0008
     * @tc.name      test8wSyncState0008
     * @tc.desc      Sync delta -42ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0008', 0, () => {
      const delta: number = -42;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-42);
      expect(Math.abs(delta)).assertEqual(42);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0009
     * @tc.name      test8wSyncState0009
     * @tc.desc      Sync delta -41ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0009', 0, () => {
      const delta: number = -41;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-41);
      expect(Math.abs(delta)).assertEqual(41);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0010
     * @tc.name      test8wSyncState0010
     * @tc.desc      Sync delta -40ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0010', 0, () => {
      const delta: number = -40;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-40);
      expect(Math.abs(delta)).assertEqual(40);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0011
     * @tc.name      test8wSyncState0011
     * @tc.desc      Sync delta -39ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0011', 0, () => {
      const delta: number = -39;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-39);
      expect(Math.abs(delta)).assertEqual(39);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0012
     * @tc.name      test8wSyncState0012
     * @tc.desc      Sync delta -38ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0012', 0, () => {
      const delta: number = -38;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-38);
      expect(Math.abs(delta)).assertEqual(38);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0013
     * @tc.name      test8wSyncState0013
     * @tc.desc      Sync delta -37ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0013', 0, () => {
      const delta: number = -37;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-37);
      expect(Math.abs(delta)).assertEqual(37);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0014
     * @tc.name      test8wSyncState0014
     * @tc.desc      Sync delta -36ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0014', 0, () => {
      const delta: number = -36;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-36);
      expect(Math.abs(delta)).assertEqual(36);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0015
     * @tc.name      test8wSyncState0015
     * @tc.desc      Sync delta -35ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0015', 0, () => {
      const delta: number = -35;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-35);
      expect(Math.abs(delta)).assertEqual(35);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0016
     * @tc.name      test8wSyncState0016
     * @tc.desc      Sync delta -34ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0016', 0, () => {
      const delta: number = -34;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-34);
      expect(Math.abs(delta)).assertEqual(34);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0017
     * @tc.name      test8wSyncState0017
     * @tc.desc      Sync delta -33ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0017', 0, () => {
      const delta: number = -33;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-33);
      expect(Math.abs(delta)).assertEqual(33);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0018
     * @tc.name      test8wSyncState0018
     * @tc.desc      Sync delta -32ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0018', 0, () => {
      const delta: number = -32;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-32);
      expect(Math.abs(delta)).assertEqual(32);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0019
     * @tc.name      test8wSyncState0019
     * @tc.desc      Sync delta -31ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0019', 0, () => {
      const delta: number = -31;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-31);
      expect(Math.abs(delta)).assertEqual(31);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0020
     * @tc.name      test8wSyncState0020
     * @tc.desc      Sync delta -30ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0020', 0, () => {
      const delta: number = -30;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-30);
      expect(Math.abs(delta)).assertEqual(30);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0021
     * @tc.name      test8wSyncState0021
     * @tc.desc      Sync delta -29ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0021', 0, () => {
      const delta: number = -29;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-29);
      expect(Math.abs(delta)).assertEqual(29);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0022
     * @tc.name      test8wSyncState0022
     * @tc.desc      Sync delta -28ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0022', 0, () => {
      const delta: number = -28;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-28);
      expect(Math.abs(delta)).assertEqual(28);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0023
     * @tc.name      test8wSyncState0023
     * @tc.desc      Sync delta -27ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0023', 0, () => {
      const delta: number = -27;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-27);
      expect(Math.abs(delta)).assertEqual(27);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0024
     * @tc.name      test8wSyncState0024
     * @tc.desc      Sync delta -26ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0024', 0, () => {
      const delta: number = -26;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-26);
      expect(Math.abs(delta)).assertEqual(26);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0025
     * @tc.name      test8wSyncState0025
     * @tc.desc      Sync delta -25ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0025', 0, () => {
      const delta: number = -25;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-25);
      expect(Math.abs(delta)).assertEqual(25);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0026
     * @tc.name      test8wSyncState0026
     * @tc.desc      Sync delta -24ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0026', 0, () => {
      const delta: number = -24;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-24);
      expect(Math.abs(delta)).assertEqual(24);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0027
     * @tc.name      test8wSyncState0027
     * @tc.desc      Sync delta -23ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0027', 0, () => {
      const delta: number = -23;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-23);
      expect(Math.abs(delta)).assertEqual(23);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0028
     * @tc.name      test8wSyncState0028
     * @tc.desc      Sync delta -22ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0028', 0, () => {
      const delta: number = -22;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-22);
      expect(Math.abs(delta)).assertEqual(22);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0029
     * @tc.name      test8wSyncState0029
     * @tc.desc      Sync delta -21ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0029', 0, () => {
      const delta: number = -21;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-21);
      expect(Math.abs(delta)).assertEqual(21);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0030
     * @tc.name      test8wSyncState0030
     * @tc.desc      Sync delta -20ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0030', 0, () => {
      const delta: number = -20;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-20);
      expect(Math.abs(delta)).assertEqual(20);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0031
     * @tc.name      test8wSyncState0031
     * @tc.desc      Sync delta -19ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0031', 0, () => {
      const delta: number = -19;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-19);
      expect(Math.abs(delta)).assertEqual(19);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0032
     * @tc.name      test8wSyncState0032
     * @tc.desc      Sync delta -18ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0032', 0, () => {
      const delta: number = -18;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-18);
      expect(Math.abs(delta)).assertEqual(18);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0033
     * @tc.name      test8wSyncState0033
     * @tc.desc      Sync delta -17ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0033', 0, () => {
      const delta: number = -17;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-17);
      expect(Math.abs(delta)).assertEqual(17);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0034
     * @tc.name      test8wSyncState0034
     * @tc.desc      Sync delta -16ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0034', 0, () => {
      const delta: number = -16;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-16);
      expect(Math.abs(delta)).assertEqual(16);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0035
     * @tc.name      test8wSyncState0035
     * @tc.desc      Sync delta -15ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0035', 0, () => {
      const delta: number = -15;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-15);
      expect(Math.abs(delta)).assertEqual(15);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0036
     * @tc.name      test8wSyncState0036
     * @tc.desc      Sync delta -14ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0036', 0, () => {
      const delta: number = -14;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-14);
      expect(Math.abs(delta)).assertEqual(14);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0037
     * @tc.name      test8wSyncState0037
     * @tc.desc      Sync delta -13ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0037', 0, () => {
      const delta: number = -13;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-13);
      expect(Math.abs(delta)).assertEqual(13);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0038
     * @tc.name      test8wSyncState0038
     * @tc.desc      Sync delta -12ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0038', 0, () => {
      const delta: number = -12;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-12);
      expect(Math.abs(delta)).assertEqual(12);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0039
     * @tc.name      test8wSyncState0039
     * @tc.desc      Sync delta -11ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0039', 0, () => {
      const delta: number = -11;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-11);
      expect(Math.abs(delta)).assertEqual(11);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0040
     * @tc.name      test8wSyncState0040
     * @tc.desc      Sync delta -10ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0040', 0, () => {
      const delta: number = -10;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-10);
      expect(Math.abs(delta)).assertEqual(10);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0041
     * @tc.name      test8wSyncState0041
     * @tc.desc      Sync delta -9ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0041', 0, () => {
      const delta: number = -9;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-9);
      expect(Math.abs(delta)).assertEqual(9);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0042
     * @tc.name      test8wSyncState0042
     * @tc.desc      Sync delta -8ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0042', 0, () => {
      const delta: number = -8;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-8);
      expect(Math.abs(delta)).assertEqual(8);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0043
     * @tc.name      test8wSyncState0043
     * @tc.desc      Sync delta -7ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0043', 0, () => {
      const delta: number = -7;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-7);
      expect(Math.abs(delta)).assertEqual(7);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0044
     * @tc.name      test8wSyncState0044
     * @tc.desc      Sync delta -6ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0044', 0, () => {
      const delta: number = -6;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-6);
      expect(Math.abs(delta)).assertEqual(6);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0045
     * @tc.name      test8wSyncState0045
     * @tc.desc      Sync delta -5ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0045', 0, () => {
      const delta: number = -5;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-5);
      expect(Math.abs(delta)).assertEqual(5);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0046
     * @tc.name      test8wSyncState0046
     * @tc.desc      Sync delta -4ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0046', 0, () => {
      const delta: number = -4;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-4);
      expect(Math.abs(delta)).assertEqual(4);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0047
     * @tc.name      test8wSyncState0047
     * @tc.desc      Sync delta -3ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0047', 0, () => {
      const delta: number = -3;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-3);
      expect(Math.abs(delta)).assertEqual(3);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0048
     * @tc.name      test8wSyncState0048
     * @tc.desc      Sync delta -2ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0048', 0, () => {
      const delta: number = -2;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-2);
      expect(Math.abs(delta)).assertEqual(2);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0049
     * @tc.name      test8wSyncState0049
     * @tc.desc      Sync delta -1ms selects WAIT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0049', 0, () => {
      const delta: number = -1;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('WAIT');
      expect(delta).assertEqual(-1);
      expect(Math.abs(delta)).assertEqual(1);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0050
     * @tc.name      test8wSyncState0050
     * @tc.desc      Sync delta 0ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0050', 0, () => {
      const delta: number = 0;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(0);
      expect(Math.abs(delta)).assertEqual(0);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0051
     * @tc.name      test8wSyncState0051
     * @tc.desc      Sync delta 1ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0051', 0, () => {
      const delta: number = 1;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(1);
      expect(Math.abs(delta)).assertEqual(1);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0052
     * @tc.name      test8wSyncState0052
     * @tc.desc      Sync delta 2ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0052', 0, () => {
      const delta: number = 2;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(2);
      expect(Math.abs(delta)).assertEqual(2);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0053
     * @tc.name      test8wSyncState0053
     * @tc.desc      Sync delta 3ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0053', 0, () => {
      const delta: number = 3;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(3);
      expect(Math.abs(delta)).assertEqual(3);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0054
     * @tc.name      test8wSyncState0054
     * @tc.desc      Sync delta 4ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0054', 0, () => {
      const delta: number = 4;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(4);
      expect(Math.abs(delta)).assertEqual(4);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0055
     * @tc.name      test8wSyncState0055
     * @tc.desc      Sync delta 5ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0055', 0, () => {
      const delta: number = 5;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(5);
      expect(Math.abs(delta)).assertEqual(5);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0056
     * @tc.name      test8wSyncState0056
     * @tc.desc      Sync delta 6ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0056', 0, () => {
      const delta: number = 6;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(6);
      expect(Math.abs(delta)).assertEqual(6);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0057
     * @tc.name      test8wSyncState0057
     * @tc.desc      Sync delta 7ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0057', 0, () => {
      const delta: number = 7;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(7);
      expect(Math.abs(delta)).assertEqual(7);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0058
     * @tc.name      test8wSyncState0058
     * @tc.desc      Sync delta 8ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0058', 0, () => {
      const delta: number = 8;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(8);
      expect(Math.abs(delta)).assertEqual(8);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0059
     * @tc.name      test8wSyncState0059
     * @tc.desc      Sync delta 9ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0059', 0, () => {
      const delta: number = 9;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(9);
      expect(Math.abs(delta)).assertEqual(9);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0060
     * @tc.name      test8wSyncState0060
     * @tc.desc      Sync delta 10ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0060', 0, () => {
      const delta: number = 10;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(10);
      expect(Math.abs(delta)).assertEqual(10);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0061
     * @tc.name      test8wSyncState0061
     * @tc.desc      Sync delta 11ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0061', 0, () => {
      const delta: number = 11;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(11);
      expect(Math.abs(delta)).assertEqual(11);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0062
     * @tc.name      test8wSyncState0062
     * @tc.desc      Sync delta 12ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0062', 0, () => {
      const delta: number = 12;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(12);
      expect(Math.abs(delta)).assertEqual(12);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0063
     * @tc.name      test8wSyncState0063
     * @tc.desc      Sync delta 13ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0063', 0, () => {
      const delta: number = 13;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(13);
      expect(Math.abs(delta)).assertEqual(13);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0064
     * @tc.name      test8wSyncState0064
     * @tc.desc      Sync delta 14ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0064', 0, () => {
      const delta: number = 14;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(14);
      expect(Math.abs(delta)).assertEqual(14);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0065
     * @tc.name      test8wSyncState0065
     * @tc.desc      Sync delta 15ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0065', 0, () => {
      const delta: number = 15;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(15);
      expect(Math.abs(delta)).assertEqual(15);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0066
     * @tc.name      test8wSyncState0066
     * @tc.desc      Sync delta 16ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0066', 0, () => {
      const delta: number = 16;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(16);
      expect(Math.abs(delta)).assertEqual(16);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0067
     * @tc.name      test8wSyncState0067
     * @tc.desc      Sync delta 17ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0067', 0, () => {
      const delta: number = 17;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(17);
      expect(Math.abs(delta)).assertEqual(17);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0068
     * @tc.name      test8wSyncState0068
     * @tc.desc      Sync delta 18ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0068', 0, () => {
      const delta: number = 18;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(18);
      expect(Math.abs(delta)).assertEqual(18);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0069
     * @tc.name      test8wSyncState0069
     * @tc.desc      Sync delta 19ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0069', 0, () => {
      const delta: number = 19;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(19);
      expect(Math.abs(delta)).assertEqual(19);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0070
     * @tc.name      test8wSyncState0070
     * @tc.desc      Sync delta 20ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0070', 0, () => {
      const delta: number = 20;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(20);
      expect(Math.abs(delta)).assertEqual(20);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0071
     * @tc.name      test8wSyncState0071
     * @tc.desc      Sync delta 21ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0071', 0, () => {
      const delta: number = 21;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(21);
      expect(Math.abs(delta)).assertEqual(21);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0072
     * @tc.name      test8wSyncState0072
     * @tc.desc      Sync delta 22ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0072', 0, () => {
      const delta: number = 22;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(22);
      expect(Math.abs(delta)).assertEqual(22);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0073
     * @tc.name      test8wSyncState0073
     * @tc.desc      Sync delta 23ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0073', 0, () => {
      const delta: number = 23;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(23);
      expect(Math.abs(delta)).assertEqual(23);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0074
     * @tc.name      test8wSyncState0074
     * @tc.desc      Sync delta 24ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0074', 0, () => {
      const delta: number = 24;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(24);
      expect(Math.abs(delta)).assertEqual(24);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0075
     * @tc.name      test8wSyncState0075
     * @tc.desc      Sync delta 25ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0075', 0, () => {
      const delta: number = 25;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(25);
      expect(Math.abs(delta)).assertEqual(25);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0076
     * @tc.name      test8wSyncState0076
     * @tc.desc      Sync delta 26ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0076', 0, () => {
      const delta: number = 26;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(26);
      expect(Math.abs(delta)).assertEqual(26);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0077
     * @tc.name      test8wSyncState0077
     * @tc.desc      Sync delta 27ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0077', 0, () => {
      const delta: number = 27;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(27);
      expect(Math.abs(delta)).assertEqual(27);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0078
     * @tc.name      test8wSyncState0078
     * @tc.desc      Sync delta 28ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0078', 0, () => {
      const delta: number = 28;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(28);
      expect(Math.abs(delta)).assertEqual(28);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0079
     * @tc.name      test8wSyncState0079
     * @tc.desc      Sync delta 29ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0079', 0, () => {
      const delta: number = 29;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(29);
      expect(Math.abs(delta)).assertEqual(29);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0080
     * @tc.name      test8wSyncState0080
     * @tc.desc      Sync delta 30ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0080', 0, () => {
      const delta: number = 30;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(30);
      expect(Math.abs(delta)).assertEqual(30);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0081
     * @tc.name      test8wSyncState0081
     * @tc.desc      Sync delta 31ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0081', 0, () => {
      const delta: number = 31;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(31);
      expect(Math.abs(delta)).assertEqual(31);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0082
     * @tc.name      test8wSyncState0082
     * @tc.desc      Sync delta 32ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0082', 0, () => {
      const delta: number = 32;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(32);
      expect(Math.abs(delta)).assertEqual(32);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0083
     * @tc.name      test8wSyncState0083
     * @tc.desc      Sync delta 33ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0083', 0, () => {
      const delta: number = 33;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(33);
      expect(Math.abs(delta)).assertEqual(33);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0084
     * @tc.name      test8wSyncState0084
     * @tc.desc      Sync delta 34ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0084', 0, () => {
      const delta: number = 34;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(34);
      expect(Math.abs(delta)).assertEqual(34);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0085
     * @tc.name      test8wSyncState0085
     * @tc.desc      Sync delta 35ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0085', 0, () => {
      const delta: number = 35;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(35);
      expect(Math.abs(delta)).assertEqual(35);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0086
     * @tc.name      test8wSyncState0086
     * @tc.desc      Sync delta 36ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0086', 0, () => {
      const delta: number = 36;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(36);
      expect(Math.abs(delta)).assertEqual(36);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0087
     * @tc.name      test8wSyncState0087
     * @tc.desc      Sync delta 37ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0087', 0, () => {
      const delta: number = 37;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(37);
      expect(Math.abs(delta)).assertEqual(37);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_SYNC_0088
     * @tc.name      test8wSyncState0088
     * @tc.desc      Sync delta 38ms selects SHOW.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSyncState0088', 0, () => {
      const delta: number = 38;
      let policy: string = 'SHOW';
      if (delta < 0) {
        policy = 'WAIT';
      } else if (delta > 40) {
        policy = 'DROP';
      }
      expect(policy).assertEqual('SHOW');
      expect(delta).assertEqual(38);
      expect(Math.abs(delta)).assertEqual(38);
      expect(['WAIT', 'SHOW', 'DROP'].indexOf(policy)).assertLargerOrEqual(0);
    })
  })
}

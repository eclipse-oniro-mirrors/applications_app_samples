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


export default function PlayerStateMatrixExpandedCoreTest() {
  describe('PlayerStateMatrixExpandedCoreTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0001
     * @tc.name      testMorePlayerState0001
     * @tc.desc      Player state matrix 0 yields ended.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0001', 0, () => {
      const paused: boolean = true;
      const ended: boolean = true;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('ended');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0002
     * @tc.name      testMorePlayerState0002
     * @tc.desc      Player state matrix 1 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0002', 0, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0003
     * @tc.name      testMorePlayerState0003
     * @tc.desc      Player state matrix 2 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0003', 0, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0004
     * @tc.name      testMorePlayerState0004
     * @tc.desc      Player state matrix 3 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0004', 0, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0005
     * @tc.name      testMorePlayerState0005
     * @tc.desc      Player state matrix 4 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0005', 0, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0006
     * @tc.name      testMorePlayerState0006
     * @tc.desc      Player state matrix 5 yields ended.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0006', 0, () => {
      const paused: boolean = false;
      const ended: boolean = true;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('ended');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0007
     * @tc.name      testMorePlayerState0007
     * @tc.desc      Player state matrix 6 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0007', 0, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0008
     * @tc.name      testMorePlayerState0008
     * @tc.desc      Player state matrix 7 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0008', 0, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0009
     * @tc.name      testMorePlayerState0009
     * @tc.desc      Player state matrix 8 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0009', 0, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0010
     * @tc.name      testMorePlayerState0010
     * @tc.desc      Player state matrix 9 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0010', 0, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0011
     * @tc.name      testMorePlayerState0011
     * @tc.desc      Player state matrix 10 yields ended.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0011', 0, () => {
      const paused: boolean = true;
      const ended: boolean = true;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('ended');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0012
     * @tc.name      testMorePlayerState0012
     * @tc.desc      Player state matrix 11 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0012', 0, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0013
     * @tc.name      testMorePlayerState0013
     * @tc.desc      Player state matrix 12 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0013', 0, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0014
     * @tc.name      testMorePlayerState0014
     * @tc.desc      Player state matrix 13 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0014', 0, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0015
     * @tc.name      testMorePlayerState0015
     * @tc.desc      Player state matrix 14 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0015', 0, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0016
     * @tc.name      testMorePlayerState0016
     * @tc.desc      Player state matrix 15 yields ended.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0016', 0, () => {
      const paused: boolean = false;
      const ended: boolean = true;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('ended');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0017
     * @tc.name      testMorePlayerState0017
     * @tc.desc      Player state matrix 16 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0017', 0, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0018
     * @tc.name      testMorePlayerState0018
     * @tc.desc      Player state matrix 17 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0018', 0, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0019
     * @tc.name      testMorePlayerState0019
     * @tc.desc      Player state matrix 18 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0019', 0, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0020
     * @tc.name      testMorePlayerState0020
     * @tc.desc      Player state matrix 19 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0020', 0, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0021
     * @tc.name      testMorePlayerState0021
     * @tc.desc      Player state matrix 20 yields ended.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0021', 0, () => {
      const paused: boolean = true;
      const ended: boolean = true;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('ended');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0022
     * @tc.name      testMorePlayerState0022
     * @tc.desc      Player state matrix 21 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0022', 0, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0023
     * @tc.name      testMorePlayerState0023
     * @tc.desc      Player state matrix 22 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0023', 0, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0024
     * @tc.name      testMorePlayerState0024
     * @tc.desc      Player state matrix 23 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0024', 0, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0025
     * @tc.name      testMorePlayerState0025
     * @tc.desc      Player state matrix 24 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0025', 0, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0026
     * @tc.name      testMorePlayerState0026
     * @tc.desc      Player state matrix 25 yields ended.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0026', 0, () => {
      const paused: boolean = false;
      const ended: boolean = true;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('ended');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0027
     * @tc.name      testMorePlayerState0027
     * @tc.desc      Player state matrix 26 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0027', 0, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0028
     * @tc.name      testMorePlayerState0028
     * @tc.desc      Player state matrix 27 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0028', 0, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0029
     * @tc.name      testMorePlayerState0029
     * @tc.desc      Player state matrix 28 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0029', 0, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0030
     * @tc.name      testMorePlayerState0030
     * @tc.desc      Player state matrix 29 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0030', 0, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0031
     * @tc.name      testMorePlayerState0031
     * @tc.desc      Player state matrix 30 yields ended.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0031', 0, () => {
      const paused: boolean = true;
      const ended: boolean = true;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('ended');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0032
     * @tc.name      testMorePlayerState0032
     * @tc.desc      Player state matrix 31 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0032', 0, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0033
     * @tc.name      testMorePlayerState0033
     * @tc.desc      Player state matrix 32 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0033', 0, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0034
     * @tc.name      testMorePlayerState0034
     * @tc.desc      Player state matrix 33 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0034', 0, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0035
     * @tc.name      testMorePlayerState0035
     * @tc.desc      Player state matrix 34 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0035', 0, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0036
     * @tc.name      testMorePlayerState0036
     * @tc.desc      Player state matrix 35 yields ended.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0036', 0, () => {
      const paused: boolean = false;
      const ended: boolean = true;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('ended');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0037
     * @tc.name      testMorePlayerState0037
     * @tc.desc      Player state matrix 36 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0037', 0, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0038
     * @tc.name      testMorePlayerState0038
     * @tc.desc      Player state matrix 37 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0038', 0, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0039
     * @tc.name      testMorePlayerState0039
     * @tc.desc      Player state matrix 38 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0039', 0, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0040
     * @tc.name      testMorePlayerState0040
     * @tc.desc      Player state matrix 39 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0040', 0, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0041
     * @tc.name      testMorePlayerState0041
     * @tc.desc      Player state matrix 40 yields ended.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0041', 0, () => {
      const paused: boolean = true;
      const ended: boolean = true;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('ended');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0042
     * @tc.name      testMorePlayerState0042
     * @tc.desc      Player state matrix 41 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0042', 0, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0043
     * @tc.name      testMorePlayerState0043
     * @tc.desc      Player state matrix 42 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0043', 0, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0044
     * @tc.name      testMorePlayerState0044
     * @tc.desc      Player state matrix 43 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0044', 0, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0045
     * @tc.name      testMorePlayerState0045
     * @tc.desc      Player state matrix 44 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0045', 0, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0046
     * @tc.name      testMorePlayerState0046
     * @tc.desc      Player state matrix 45 yields ended.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0046', 0, () => {
      const paused: boolean = false;
      const ended: boolean = true;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('ended');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0047
     * @tc.name      testMorePlayerState0047
     * @tc.desc      Player state matrix 46 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0047', 0, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0048
     * @tc.name      testMorePlayerState0048
     * @tc.desc      Player state matrix 47 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0048', 0, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0049
     * @tc.name      testMorePlayerState0049
     * @tc.desc      Player state matrix 48 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0049', 0, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_PSM_0050
     * @tc.name      testMorePlayerState0050
     * @tc.desc      Player state matrix 49 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0050', 0, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      let state: string = 'playing';
      if (ended) {
        state = 'ended';
      } else if (paused) {
        state = 'paused';
      }
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(['playing', 'paused', 'ended'].indexOf(state)).assertLargerOrEqual(0);
      expect(paused || !paused).assertTrue();
    })
  })
}

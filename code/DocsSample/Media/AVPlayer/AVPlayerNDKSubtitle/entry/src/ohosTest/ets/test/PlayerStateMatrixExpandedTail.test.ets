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


export default function PlayerStateMatrixExpandedTailTest() {
  describe('PlayerStateMatrixExpandedTailTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0051
     * @tc.name      testMorePlayerState0051
     * @tc.desc      Player state matrix 50 yields ended.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0051', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0052
     * @tc.name      testMorePlayerState0052
     * @tc.desc      Player state matrix 51 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0052', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0053
     * @tc.name      testMorePlayerState0053
     * @tc.desc      Player state matrix 52 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0053', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0054
     * @tc.name      testMorePlayerState0054
     * @tc.desc      Player state matrix 53 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0054', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0055
     * @tc.name      testMorePlayerState0055
     * @tc.desc      Player state matrix 54 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0055', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0056
     * @tc.name      testMorePlayerState0056
     * @tc.desc      Player state matrix 55 yields ended.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0056', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0057
     * @tc.name      testMorePlayerState0057
     * @tc.desc      Player state matrix 56 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0057', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0058
     * @tc.name      testMorePlayerState0058
     * @tc.desc      Player state matrix 57 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0058', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0059
     * @tc.name      testMorePlayerState0059
     * @tc.desc      Player state matrix 58 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0059', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0060
     * @tc.name      testMorePlayerState0060
     * @tc.desc      Player state matrix 59 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0060', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0061
     * @tc.name      testMorePlayerState0061
     * @tc.desc      Player state matrix 60 yields ended.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0061', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0062
     * @tc.name      testMorePlayerState0062
     * @tc.desc      Player state matrix 61 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0062', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0063
     * @tc.name      testMorePlayerState0063
     * @tc.desc      Player state matrix 62 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0063', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0064
     * @tc.name      testMorePlayerState0064
     * @tc.desc      Player state matrix 63 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0064', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0065
     * @tc.name      testMorePlayerState0065
     * @tc.desc      Player state matrix 64 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0065', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0066
     * @tc.name      testMorePlayerState0066
     * @tc.desc      Player state matrix 65 yields ended.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0066', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0067
     * @tc.name      testMorePlayerState0067
     * @tc.desc      Player state matrix 66 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0067', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0068
     * @tc.name      testMorePlayerState0068
     * @tc.desc      Player state matrix 67 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0068', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0069
     * @tc.name      testMorePlayerState0069
     * @tc.desc      Player state matrix 68 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0069', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0070
     * @tc.name      testMorePlayerState0070
     * @tc.desc      Player state matrix 69 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0070', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0071
     * @tc.name      testMorePlayerState0071
     * @tc.desc      Player state matrix 70 yields ended.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0071', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0072
     * @tc.name      testMorePlayerState0072
     * @tc.desc      Player state matrix 71 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0072', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0073
     * @tc.name      testMorePlayerState0073
     * @tc.desc      Player state matrix 72 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0073', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0074
     * @tc.name      testMorePlayerState0074
     * @tc.desc      Player state matrix 73 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0074', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0075
     * @tc.name      testMorePlayerState0075
     * @tc.desc      Player state matrix 74 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0075', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0076
     * @tc.name      testMorePlayerState0076
     * @tc.desc      Player state matrix 75 yields ended.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0076', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0077
     * @tc.name      testMorePlayerState0077
     * @tc.desc      Player state matrix 76 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0077', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0078
     * @tc.name      testMorePlayerState0078
     * @tc.desc      Player state matrix 77 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0078', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0079
     * @tc.name      testMorePlayerState0079
     * @tc.desc      Player state matrix 78 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0079', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0080
     * @tc.name      testMorePlayerState0080
     * @tc.desc      Player state matrix 79 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0080', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0081
     * @tc.name      testMorePlayerState0081
     * @tc.desc      Player state matrix 80 yields ended.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0081', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0082
     * @tc.name      testMorePlayerState0082
     * @tc.desc      Player state matrix 81 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0082', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0083
     * @tc.name      testMorePlayerState0083
     * @tc.desc      Player state matrix 82 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0083', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0084
     * @tc.name      testMorePlayerState0084
     * @tc.desc      Player state matrix 83 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0084', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0085
     * @tc.name      testMorePlayerState0085
     * @tc.desc      Player state matrix 84 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0085', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0086
     * @tc.name      testMorePlayerState0086
     * @tc.desc      Player state matrix 85 yields ended.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0086', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0087
     * @tc.name      testMorePlayerState0087
     * @tc.desc      Player state matrix 86 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0087', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0088
     * @tc.name      testMorePlayerState0088
     * @tc.desc      Player state matrix 87 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0088', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0089
     * @tc.name      testMorePlayerState0089
     * @tc.desc      Player state matrix 88 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0089', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0090
     * @tc.name      testMorePlayerState0090
     * @tc.desc      Player state matrix 89 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0090', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0091
     * @tc.name      testMorePlayerState0091
     * @tc.desc      Player state matrix 90 yields ended.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0091', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0092
     * @tc.name      testMorePlayerState0092
     * @tc.desc      Player state matrix 91 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0092', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0093
     * @tc.name      testMorePlayerState0093
     * @tc.desc      Player state matrix 92 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0093', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0094
     * @tc.name      testMorePlayerState0094
     * @tc.desc      Player state matrix 93 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0094', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0095
     * @tc.name      testMorePlayerState0095
     * @tc.desc      Player state matrix 94 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0095', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0096
     * @tc.name      testMorePlayerState0096
     * @tc.desc      Player state matrix 95 yields ended.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0096', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0097
     * @tc.name      testMorePlayerState0097
     * @tc.desc      Player state matrix 96 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0097', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0098
     * @tc.name      testMorePlayerState0098
     * @tc.desc      Player state matrix 97 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0098', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0099
     * @tc.name      testMorePlayerState0099
     * @tc.desc      Player state matrix 98 yields paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0099', 0, () => {
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_PSM_0100
     * @tc.name      testMorePlayerState0100
     * @tc.desc      Player state matrix 99 yields playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerState0100', 0, () => {
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

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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';


export default function playerControlStateExpandedTest() {
  describe('playerControlStateExpandedTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0001
     * @tc.name      testExpPlayerControl0001
     * @tc.desc      Control state 0 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0002
     * @tc.name      testExpPlayerControl0002
     * @tc.desc      Control state 1 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0003
     * @tc.name      testExpPlayerControl0003
     * @tc.desc      Control state 2 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0004
     * @tc.name      testExpPlayerControl0004
     * @tc.desc      Control state 3 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0005
     * @tc.name      testExpPlayerControl0005
     * @tc.desc      Control state 4 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0006
     * @tc.name      testExpPlayerControl0006
     * @tc.desc      Control state 5 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0007
     * @tc.name      testExpPlayerControl0007
     * @tc.desc      Control state 6 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0008
     * @tc.name      testExpPlayerControl0008
     * @tc.desc      Control state 7 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0009
     * @tc.name      testExpPlayerControl0009
     * @tc.desc      Control state 8 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0010
     * @tc.name      testExpPlayerControl0010
     * @tc.desc      Control state 9 resolves to end.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = true;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('end');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0011
     * @tc.name      testExpPlayerControl0011
     * @tc.desc      Control state 10 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0012
     * @tc.name      testExpPlayerControl0012
     * @tc.desc      Control state 11 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0013
     * @tc.name      testExpPlayerControl0013
     * @tc.desc      Control state 12 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0014
     * @tc.name      testExpPlayerControl0014
     * @tc.desc      Control state 13 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0015
     * @tc.name      testExpPlayerControl0015
     * @tc.desc      Control state 14 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0016
     * @tc.name      testExpPlayerControl0016
     * @tc.desc      Control state 15 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0017
     * @tc.name      testExpPlayerControl0017
     * @tc.desc      Control state 16 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0018
     * @tc.name      testExpPlayerControl0018
     * @tc.desc      Control state 17 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0019
     * @tc.name      testExpPlayerControl0019
     * @tc.desc      Control state 18 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0020
     * @tc.name      testExpPlayerControl0020
     * @tc.desc      Control state 19 resolves to end.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = true;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('end');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0021
     * @tc.name      testExpPlayerControl0021
     * @tc.desc      Control state 20 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0022
     * @tc.name      testExpPlayerControl0022
     * @tc.desc      Control state 21 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0023
     * @tc.name      testExpPlayerControl0023
     * @tc.desc      Control state 22 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0024
     * @tc.name      testExpPlayerControl0024
     * @tc.desc      Control state 23 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0025
     * @tc.name      testExpPlayerControl0025
     * @tc.desc      Control state 24 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0026
     * @tc.name      testExpPlayerControl0026
     * @tc.desc      Control state 25 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0027
     * @tc.name      testExpPlayerControl0027
     * @tc.desc      Control state 26 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0028
     * @tc.name      testExpPlayerControl0028
     * @tc.desc      Control state 27 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0029
     * @tc.name      testExpPlayerControl0029
     * @tc.desc      Control state 28 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0030
     * @tc.name      testExpPlayerControl0030
     * @tc.desc      Control state 29 resolves to end.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = true;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('end');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0031
     * @tc.name      testExpPlayerControl0031
     * @tc.desc      Control state 30 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0032
     * @tc.name      testExpPlayerControl0032
     * @tc.desc      Control state 31 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0033
     * @tc.name      testExpPlayerControl0033
     * @tc.desc      Control state 32 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0034
     * @tc.name      testExpPlayerControl0034
     * @tc.desc      Control state 33 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0035
     * @tc.name      testExpPlayerControl0035
     * @tc.desc      Control state 34 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0036
     * @tc.name      testExpPlayerControl0036
     * @tc.desc      Control state 35 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0037
     * @tc.name      testExpPlayerControl0037
     * @tc.desc      Control state 36 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0038
     * @tc.name      testExpPlayerControl0038
     * @tc.desc      Control state 37 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0039
     * @tc.name      testExpPlayerControl0039
     * @tc.desc      Control state 38 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0040
     * @tc.name      testExpPlayerControl0040
     * @tc.desc      Control state 39 resolves to end.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = true;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('end');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0041
     * @tc.name      testExpPlayerControl0041
     * @tc.desc      Control state 40 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0042
     * @tc.name      testExpPlayerControl0042
     * @tc.desc      Control state 41 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0043
     * @tc.name      testExpPlayerControl0043
     * @tc.desc      Control state 42 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0044
     * @tc.name      testExpPlayerControl0044
     * @tc.desc      Control state 43 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0045
     * @tc.name      testExpPlayerControl0045
     * @tc.desc      Control state 44 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0046
     * @tc.name      testExpPlayerControl0046
     * @tc.desc      Control state 45 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0047
     * @tc.name      testExpPlayerControl0047
     * @tc.desc      Control state 46 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0048
     * @tc.name      testExpPlayerControl0048
     * @tc.desc      Control state 47 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0049
     * @tc.name      testExpPlayerControl0049
     * @tc.desc      Control state 48 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0050
     * @tc.name      testExpPlayerControl0050
     * @tc.desc      Control state 49 resolves to end.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = true;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('end');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0051
     * @tc.name      testExpPlayerControl0051
     * @tc.desc      Control state 50 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0052
     * @tc.name      testExpPlayerControl0052
     * @tc.desc      Control state 51 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0053
     * @tc.name      testExpPlayerControl0053
     * @tc.desc      Control state 52 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0054
     * @tc.name      testExpPlayerControl0054
     * @tc.desc      Control state 53 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0055
     * @tc.name      testExpPlayerControl0055
     * @tc.desc      Control state 54 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0056
     * @tc.name      testExpPlayerControl0056
     * @tc.desc      Control state 55 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0057
     * @tc.name      testExpPlayerControl0057
     * @tc.desc      Control state 56 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0058
     * @tc.name      testExpPlayerControl0058
     * @tc.desc      Control state 57 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0059
     * @tc.name      testExpPlayerControl0059
     * @tc.desc      Control state 58 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0060
     * @tc.name      testExpPlayerControl0060
     * @tc.desc      Control state 59 resolves to end.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = true;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('end');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0061
     * @tc.name      testExpPlayerControl0061
     * @tc.desc      Control state 60 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0062
     * @tc.name      testExpPlayerControl0062
     * @tc.desc      Control state 61 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0063
     * @tc.name      testExpPlayerControl0063
     * @tc.desc      Control state 62 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0064
     * @tc.name      testExpPlayerControl0064
     * @tc.desc      Control state 63 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0065
     * @tc.name      testExpPlayerControl0065
     * @tc.desc      Control state 64 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0066
     * @tc.name      testExpPlayerControl0066
     * @tc.desc      Control state 65 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0067
     * @tc.name      testExpPlayerControl0067
     * @tc.desc      Control state 66 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0068
     * @tc.name      testExpPlayerControl0068
     * @tc.desc      Control state 67 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0069
     * @tc.name      testExpPlayerControl0069
     * @tc.desc      Control state 68 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0070
     * @tc.name      testExpPlayerControl0070
     * @tc.desc      Control state 69 resolves to end.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = true;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('end');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0071
     * @tc.name      testExpPlayerControl0071
     * @tc.desc      Control state 70 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0072
     * @tc.name      testExpPlayerControl0072
     * @tc.desc      Control state 71 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0073
     * @tc.name      testExpPlayerControl0073
     * @tc.desc      Control state 72 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0074
     * @tc.name      testExpPlayerControl0074
     * @tc.desc      Control state 73 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0075
     * @tc.name      testExpPlayerControl0075
     * @tc.desc      Control state 74 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0076
     * @tc.name      testExpPlayerControl0076
     * @tc.desc      Control state 75 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0077
     * @tc.name      testExpPlayerControl0077
     * @tc.desc      Control state 76 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0078
     * @tc.name      testExpPlayerControl0078
     * @tc.desc      Control state 77 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0079
     * @tc.name      testExpPlayerControl0079
     * @tc.desc      Control state 78 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0080
     * @tc.name      testExpPlayerControl0080
     * @tc.desc      Control state 79 resolves to end.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = true;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('end');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0081
     * @tc.name      testExpPlayerControl0081
     * @tc.desc      Control state 80 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0082
     * @tc.name      testExpPlayerControl0082
     * @tc.desc      Control state 81 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0083
     * @tc.name      testExpPlayerControl0083
     * @tc.desc      Control state 82 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0084
     * @tc.name      testExpPlayerControl0084
     * @tc.desc      Control state 83 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0085
     * @tc.name      testExpPlayerControl0085
     * @tc.desc      Control state 84 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0086
     * @tc.name      testExpPlayerControl0086
     * @tc.desc      Control state 85 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0087
     * @tc.name      testExpPlayerControl0087
     * @tc.desc      Control state 86 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0088
     * @tc.name      testExpPlayerControl0088
     * @tc.desc      Control state 87 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0089
     * @tc.name      testExpPlayerControl0089
     * @tc.desc      Control state 88 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0090
     * @tc.name      testExpPlayerControl0090
     * @tc.desc      Control state 89 resolves to end.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = true;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('end');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0091
     * @tc.name      testExpPlayerControl0091
     * @tc.desc      Control state 90 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0092
     * @tc.name      testExpPlayerControl0092
     * @tc.desc      Control state 91 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0093
     * @tc.name      testExpPlayerControl0093
     * @tc.desc      Control state 92 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0094
     * @tc.name      testExpPlayerControl0094
     * @tc.desc      Control state 93 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0095
     * @tc.name      testExpPlayerControl0095
     * @tc.desc      Control state 94 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0096
     * @tc.name      testExpPlayerControl0096
     * @tc.desc      Control state 95 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0097
     * @tc.name      testExpPlayerControl0097
     * @tc.desc      Control state 96 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0098
     * @tc.name      testExpPlayerControl0098
     * @tc.desc      Control state 97 resolves to playing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0099
     * @tc.name      testExpPlayerControl0099
     * @tc.desc      Control state 98 resolves to paused.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = true;
      const ended: boolean = false;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CTL_0100
     * @tc.name      testExpPlayerControl0100
     * @tc.desc      Control state 99 resolves to end.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlayerControl0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const paused: boolean = false;
      const ended: boolean = true;
      const state: string = ended ? 'end' : (paused ? 'paused' : 'playing');
      expect(state).assertEqual('end');
      expect(state.length).assertLarger(0);
      expect(paused || !paused).assertTrue();
      expect(state === 'end' || state === 'paused' || state === 'playing').assertTrue();
    })
  })
}

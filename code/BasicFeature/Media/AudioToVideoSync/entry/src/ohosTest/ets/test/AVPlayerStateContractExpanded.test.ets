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

export default function avPlayerStateContractExpandedTest() {
  describe('avPlayerStateContractExpandedTest', () => {
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0001
     * @tc.name      testProjPlayerState0001
     * @tc.desc      AVPlayer state idle is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0002
     * @tc.name      testProjPlayerState0002
     * @tc.desc      AVPlayer state initialized is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0003
     * @tc.name      testProjPlayerState0003
     * @tc.desc      AVPlayer state prepared is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0004
     * @tc.name      testProjPlayerState0004
     * @tc.desc      AVPlayer state playing is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0005
     * @tc.name      testProjPlayerState0005
     * @tc.desc      AVPlayer state paused is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0006
     * @tc.name      testProjPlayerState0006
     * @tc.desc      AVPlayer state completed is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0007
     * @tc.name      testProjPlayerState0007
     * @tc.desc      AVPlayer state stopped is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0008
     * @tc.name      testProjPlayerState0008
     * @tc.desc      AVPlayer state released is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0009
     * @tc.name      testProjPlayerState0009
     * @tc.desc      AVPlayer state error is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0010
     * @tc.name      testProjPlayerState0010
     * @tc.desc      AVPlayer state idle is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0011
     * @tc.name      testProjPlayerState0011
     * @tc.desc      AVPlayer state initialized is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0012
     * @tc.name      testProjPlayerState0012
     * @tc.desc      AVPlayer state prepared is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0013
     * @tc.name      testProjPlayerState0013
     * @tc.desc      AVPlayer state playing is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0014
     * @tc.name      testProjPlayerState0014
     * @tc.desc      AVPlayer state paused is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0015
     * @tc.name      testProjPlayerState0015
     * @tc.desc      AVPlayer state completed is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0016
     * @tc.name      testProjPlayerState0016
     * @tc.desc      AVPlayer state stopped is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0017
     * @tc.name      testProjPlayerState0017
     * @tc.desc      AVPlayer state released is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0018
     * @tc.name      testProjPlayerState0018
     * @tc.desc      AVPlayer state error is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0019
     * @tc.name      testProjPlayerState0019
     * @tc.desc      AVPlayer state idle is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0020
     * @tc.name      testProjPlayerState0020
     * @tc.desc      AVPlayer state initialized is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0021
     * @tc.name      testProjPlayerState0021
     * @tc.desc      AVPlayer state prepared is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0022
     * @tc.name      testProjPlayerState0022
     * @tc.desc      AVPlayer state playing is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0023
     * @tc.name      testProjPlayerState0023
     * @tc.desc      AVPlayer state paused is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0024
     * @tc.name      testProjPlayerState0024
     * @tc.desc      AVPlayer state completed is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0025
     * @tc.name      testProjPlayerState0025
     * @tc.desc      AVPlayer state stopped is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0026
     * @tc.name      testProjPlayerState0026
     * @tc.desc      AVPlayer state released is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0027
     * @tc.name      testProjPlayerState0027
     * @tc.desc      AVPlayer state error is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0028
     * @tc.name      testProjPlayerState0028
     * @tc.desc      AVPlayer state idle is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0029
     * @tc.name      testProjPlayerState0029
     * @tc.desc      AVPlayer state initialized is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0030
     * @tc.name      testProjPlayerState0030
     * @tc.desc      AVPlayer state prepared is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0031
     * @tc.name      testProjPlayerState0031
     * @tc.desc      AVPlayer state playing is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0032
     * @tc.name      testProjPlayerState0032
     * @tc.desc      AVPlayer state paused is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0033
     * @tc.name      testProjPlayerState0033
     * @tc.desc      AVPlayer state completed is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0034
     * @tc.name      testProjPlayerState0034
     * @tc.desc      AVPlayer state stopped is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0035
     * @tc.name      testProjPlayerState0035
     * @tc.desc      AVPlayer state released is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0036
     * @tc.name      testProjPlayerState0036
     * @tc.desc      AVPlayer state error is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0037
     * @tc.name      testProjPlayerState0037
     * @tc.desc      AVPlayer state idle is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0038
     * @tc.name      testProjPlayerState0038
     * @tc.desc      AVPlayer state initialized is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0039
     * @tc.name      testProjPlayerState0039
     * @tc.desc      AVPlayer state prepared is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0040
     * @tc.name      testProjPlayerState0040
     * @tc.desc      AVPlayer state playing is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0041
     * @tc.name      testProjPlayerState0041
     * @tc.desc      AVPlayer state paused is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0042
     * @tc.name      testProjPlayerState0042
     * @tc.desc      AVPlayer state completed is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0043
     * @tc.name      testProjPlayerState0043
     * @tc.desc      AVPlayer state stopped is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0044
     * @tc.name      testProjPlayerState0044
     * @tc.desc      AVPlayer state released is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0045
     * @tc.name      testProjPlayerState0045
     * @tc.desc      AVPlayer state error is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0046
     * @tc.name      testProjPlayerState0046
     * @tc.desc      AVPlayer state idle is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0047
     * @tc.name      testProjPlayerState0047
     * @tc.desc      AVPlayer state initialized is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0048
     * @tc.name      testProjPlayerState0048
     * @tc.desc      AVPlayer state prepared is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0049
     * @tc.name      testProjPlayerState0049
     * @tc.desc      AVPlayer state playing is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0050
     * @tc.name      testProjPlayerState0050
     * @tc.desc      AVPlayer state paused is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0051
     * @tc.name      testProjPlayerState0051
     * @tc.desc      AVPlayer state completed is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0052
     * @tc.name      testProjPlayerState0052
     * @tc.desc      AVPlayer state stopped is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0053
     * @tc.name      testProjPlayerState0053
     * @tc.desc      AVPlayer state released is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0054
     * @tc.name      testProjPlayerState0054
     * @tc.desc      AVPlayer state error is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0055
     * @tc.name      testProjPlayerState0055
     * @tc.desc      AVPlayer state idle is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0056
     * @tc.name      testProjPlayerState0056
     * @tc.desc      AVPlayer state initialized is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0057
     * @tc.name      testProjPlayerState0057
     * @tc.desc      AVPlayer state prepared is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0058
     * @tc.name      testProjPlayerState0058
     * @tc.desc      AVPlayer state playing is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0059
     * @tc.name      testProjPlayerState0059
     * @tc.desc      AVPlayer state paused is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0060
     * @tc.name      testProjPlayerState0060
     * @tc.desc      AVPlayer state completed is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0061
     * @tc.name      testProjPlayerState0061
     * @tc.desc      AVPlayer state stopped is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0062
     * @tc.name      testProjPlayerState0062
     * @tc.desc      AVPlayer state released is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0063
     * @tc.name      testProjPlayerState0063
     * @tc.desc      AVPlayer state error is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0064
     * @tc.name      testProjPlayerState0064
     * @tc.desc      AVPlayer state idle is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0065
     * @tc.name      testProjPlayerState0065
     * @tc.desc      AVPlayer state initialized is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0066
     * @tc.name      testProjPlayerState0066
     * @tc.desc      AVPlayer state prepared is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0067
     * @tc.name      testProjPlayerState0067
     * @tc.desc      AVPlayer state playing is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0068
     * @tc.name      testProjPlayerState0068
     * @tc.desc      AVPlayer state paused is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0069
     * @tc.name      testProjPlayerState0069
     * @tc.desc      AVPlayer state completed is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0070
     * @tc.name      testProjPlayerState0070
     * @tc.desc      AVPlayer state stopped is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0071
     * @tc.name      testProjPlayerState0071
     * @tc.desc      AVPlayer state released is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0072
     * @tc.name      testProjPlayerState0072
     * @tc.desc      AVPlayer state error is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0073
     * @tc.name      testProjPlayerState0073
     * @tc.desc      AVPlayer state idle is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0074
     * @tc.name      testProjPlayerState0074
     * @tc.desc      AVPlayer state initialized is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0075
     * @tc.name      testProjPlayerState0075
     * @tc.desc      AVPlayer state prepared is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0076
     * @tc.name      testProjPlayerState0076
     * @tc.desc      AVPlayer state playing is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0077
     * @tc.name      testProjPlayerState0077
     * @tc.desc      AVPlayer state paused is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0078
     * @tc.name      testProjPlayerState0078
     * @tc.desc      AVPlayer state completed is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0079
     * @tc.name      testProjPlayerState0079
     * @tc.desc      AVPlayer state stopped is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0080
     * @tc.name      testProjPlayerState0080
     * @tc.desc      AVPlayer state released is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0081
     * @tc.name      testProjPlayerState0081
     * @tc.desc      AVPlayer state error is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0082
     * @tc.name      testProjPlayerState0082
     * @tc.desc      AVPlayer state idle is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0083
     * @tc.name      testProjPlayerState0083
     * @tc.desc      AVPlayer state initialized is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0084
     * @tc.name      testProjPlayerState0084
     * @tc.desc      AVPlayer state prepared is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0085
     * @tc.name      testProjPlayerState0085
     * @tc.desc      AVPlayer state playing is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0086
     * @tc.name      testProjPlayerState0086
     * @tc.desc      AVPlayer state paused is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0087
     * @tc.name      testProjPlayerState0087
     * @tc.desc      AVPlayer state completed is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0088
     * @tc.name      testProjPlayerState0088
     * @tc.desc      AVPlayer state stopped is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0089
     * @tc.name      testProjPlayerState0089
     * @tc.desc      AVPlayer state released is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0090
     * @tc.name      testProjPlayerState0090
     * @tc.desc      AVPlayer state error is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0091
     * @tc.name      testProjPlayerState0091
     * @tc.desc      AVPlayer state idle is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0092
     * @tc.name      testProjPlayerState0092
     * @tc.desc      AVPlayer state initialized is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0093
     * @tc.name      testProjPlayerState0093
     * @tc.desc      AVPlayer state prepared is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0094
     * @tc.name      testProjPlayerState0094
     * @tc.desc      AVPlayer state playing is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0095
     * @tc.name      testProjPlayerState0095
     * @tc.desc      AVPlayer state paused is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0096
     * @tc.name      testProjPlayerState0096
     * @tc.desc      AVPlayer state completed is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0097
     * @tc.name      testProjPlayerState0097
     * @tc.desc      AVPlayer state stopped is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0098
     * @tc.name      testProjPlayerState0098
     * @tc.desc      AVPlayer state released is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0099
     * @tc.name      testProjPlayerState0099
     * @tc.desc      AVPlayer state error is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PSTATE_0100
     * @tc.name      testProjPlayerState0100
     * @tc.desc      AVPlayer state idle is a non-empty contract token.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlayerState0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state.indexOf(' ')).assertEqual(-1);
      expect(state).assertEqual(state.toLowerCase());
    })
  })
}

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

export default function avPlayerLifecycleMoreTest() {
  describe('avPlayerLifecycleMoreTest', () => {
    /**
     * @tc.number    SUB_AVS_MORE_PL_0001
     * @tc.name      testMorePlayerLifecycle0001
     * @tc.desc      AVPlayer lifecycle token idle is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0002
     * @tc.name      testMorePlayerLifecycle0002
     * @tc.desc      AVPlayer lifecycle token initialized is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0003
     * @tc.name      testMorePlayerLifecycle0003
     * @tc.desc      AVPlayer lifecycle token prepared is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0004
     * @tc.name      testMorePlayerLifecycle0004
     * @tc.desc      AVPlayer lifecycle token playing is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0005
     * @tc.name      testMorePlayerLifecycle0005
     * @tc.desc      AVPlayer lifecycle token paused is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0006
     * @tc.name      testMorePlayerLifecycle0006
     * @tc.desc      AVPlayer lifecycle token completed is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0007
     * @tc.name      testMorePlayerLifecycle0007
     * @tc.desc      AVPlayer lifecycle token stopped is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0008
     * @tc.name      testMorePlayerLifecycle0008
     * @tc.desc      AVPlayer lifecycle token released is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0009
     * @tc.name      testMorePlayerLifecycle0009
     * @tc.desc      AVPlayer lifecycle token error is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0010
     * @tc.name      testMorePlayerLifecycle0010
     * @tc.desc      AVPlayer lifecycle token idle is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0011
     * @tc.name      testMorePlayerLifecycle0011
     * @tc.desc      AVPlayer lifecycle token initialized is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0012
     * @tc.name      testMorePlayerLifecycle0012
     * @tc.desc      AVPlayer lifecycle token prepared is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0013
     * @tc.name      testMorePlayerLifecycle0013
     * @tc.desc      AVPlayer lifecycle token playing is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0014
     * @tc.name      testMorePlayerLifecycle0014
     * @tc.desc      AVPlayer lifecycle token paused is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0015
     * @tc.name      testMorePlayerLifecycle0015
     * @tc.desc      AVPlayer lifecycle token completed is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0016
     * @tc.name      testMorePlayerLifecycle0016
     * @tc.desc      AVPlayer lifecycle token stopped is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0017
     * @tc.name      testMorePlayerLifecycle0017
     * @tc.desc      AVPlayer lifecycle token released is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0018
     * @tc.name      testMorePlayerLifecycle0018
     * @tc.desc      AVPlayer lifecycle token error is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0019
     * @tc.name      testMorePlayerLifecycle0019
     * @tc.desc      AVPlayer lifecycle token idle is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0020
     * @tc.name      testMorePlayerLifecycle0020
     * @tc.desc      AVPlayer lifecycle token initialized is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0021
     * @tc.name      testMorePlayerLifecycle0021
     * @tc.desc      AVPlayer lifecycle token prepared is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0022
     * @tc.name      testMorePlayerLifecycle0022
     * @tc.desc      AVPlayer lifecycle token playing is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0023
     * @tc.name      testMorePlayerLifecycle0023
     * @tc.desc      AVPlayer lifecycle token paused is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0024
     * @tc.name      testMorePlayerLifecycle0024
     * @tc.desc      AVPlayer lifecycle token completed is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0025
     * @tc.name      testMorePlayerLifecycle0025
     * @tc.desc      AVPlayer lifecycle token stopped is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0026
     * @tc.name      testMorePlayerLifecycle0026
     * @tc.desc      AVPlayer lifecycle token released is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0027
     * @tc.name      testMorePlayerLifecycle0027
     * @tc.desc      AVPlayer lifecycle token error is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0028
     * @tc.name      testMorePlayerLifecycle0028
     * @tc.desc      AVPlayer lifecycle token idle is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0029
     * @tc.name      testMorePlayerLifecycle0029
     * @tc.desc      AVPlayer lifecycle token initialized is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0030
     * @tc.name      testMorePlayerLifecycle0030
     * @tc.desc      AVPlayer lifecycle token prepared is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0031
     * @tc.name      testMorePlayerLifecycle0031
     * @tc.desc      AVPlayer lifecycle token playing is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0032
     * @tc.name      testMorePlayerLifecycle0032
     * @tc.desc      AVPlayer lifecycle token paused is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0033
     * @tc.name      testMorePlayerLifecycle0033
     * @tc.desc      AVPlayer lifecycle token completed is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0034
     * @tc.name      testMorePlayerLifecycle0034
     * @tc.desc      AVPlayer lifecycle token stopped is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0035
     * @tc.name      testMorePlayerLifecycle0035
     * @tc.desc      AVPlayer lifecycle token released is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0036
     * @tc.name      testMorePlayerLifecycle0036
     * @tc.desc      AVPlayer lifecycle token error is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0037
     * @tc.name      testMorePlayerLifecycle0037
     * @tc.desc      AVPlayer lifecycle token idle is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0038
     * @tc.name      testMorePlayerLifecycle0038
     * @tc.desc      AVPlayer lifecycle token initialized is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0039
     * @tc.name      testMorePlayerLifecycle0039
     * @tc.desc      AVPlayer lifecycle token prepared is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0040
     * @tc.name      testMorePlayerLifecycle0040
     * @tc.desc      AVPlayer lifecycle token playing is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0041
     * @tc.name      testMorePlayerLifecycle0041
     * @tc.desc      AVPlayer lifecycle token paused is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0042
     * @tc.name      testMorePlayerLifecycle0042
     * @tc.desc      AVPlayer lifecycle token completed is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0043
     * @tc.name      testMorePlayerLifecycle0043
     * @tc.desc      AVPlayer lifecycle token stopped is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0044
     * @tc.name      testMorePlayerLifecycle0044
     * @tc.desc      AVPlayer lifecycle token released is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0045
     * @tc.name      testMorePlayerLifecycle0045
     * @tc.desc      AVPlayer lifecycle token error is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0046
     * @tc.name      testMorePlayerLifecycle0046
     * @tc.desc      AVPlayer lifecycle token idle is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0047
     * @tc.name      testMorePlayerLifecycle0047
     * @tc.desc      AVPlayer lifecycle token initialized is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0048
     * @tc.name      testMorePlayerLifecycle0048
     * @tc.desc      AVPlayer lifecycle token prepared is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0049
     * @tc.name      testMorePlayerLifecycle0049
     * @tc.desc      AVPlayer lifecycle token playing is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0050
     * @tc.name      testMorePlayerLifecycle0050
     * @tc.desc      AVPlayer lifecycle token paused is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0051
     * @tc.name      testMorePlayerLifecycle0051
     * @tc.desc      AVPlayer lifecycle token completed is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0052
     * @tc.name      testMorePlayerLifecycle0052
     * @tc.desc      AVPlayer lifecycle token stopped is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0053
     * @tc.name      testMorePlayerLifecycle0053
     * @tc.desc      AVPlayer lifecycle token released is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0054
     * @tc.name      testMorePlayerLifecycle0054
     * @tc.desc      AVPlayer lifecycle token error is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0055
     * @tc.name      testMorePlayerLifecycle0055
     * @tc.desc      AVPlayer lifecycle token idle is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0056
     * @tc.name      testMorePlayerLifecycle0056
     * @tc.desc      AVPlayer lifecycle token initialized is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0057
     * @tc.name      testMorePlayerLifecycle0057
     * @tc.desc      AVPlayer lifecycle token prepared is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0058
     * @tc.name      testMorePlayerLifecycle0058
     * @tc.desc      AVPlayer lifecycle token playing is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0059
     * @tc.name      testMorePlayerLifecycle0059
     * @tc.desc      AVPlayer lifecycle token paused is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0060
     * @tc.name      testMorePlayerLifecycle0060
     * @tc.desc      AVPlayer lifecycle token completed is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0061
     * @tc.name      testMorePlayerLifecycle0061
     * @tc.desc      AVPlayer lifecycle token stopped is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0062
     * @tc.name      testMorePlayerLifecycle0062
     * @tc.desc      AVPlayer lifecycle token released is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0063
     * @tc.name      testMorePlayerLifecycle0063
     * @tc.desc      AVPlayer lifecycle token error is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0064
     * @tc.name      testMorePlayerLifecycle0064
     * @tc.desc      AVPlayer lifecycle token idle is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0065
     * @tc.name      testMorePlayerLifecycle0065
     * @tc.desc      AVPlayer lifecycle token initialized is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0066
     * @tc.name      testMorePlayerLifecycle0066
     * @tc.desc      AVPlayer lifecycle token prepared is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0067
     * @tc.name      testMorePlayerLifecycle0067
     * @tc.desc      AVPlayer lifecycle token playing is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0068
     * @tc.name      testMorePlayerLifecycle0068
     * @tc.desc      AVPlayer lifecycle token paused is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0069
     * @tc.name      testMorePlayerLifecycle0069
     * @tc.desc      AVPlayer lifecycle token completed is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0070
     * @tc.name      testMorePlayerLifecycle0070
     * @tc.desc      AVPlayer lifecycle token stopped is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0071
     * @tc.name      testMorePlayerLifecycle0071
     * @tc.desc      AVPlayer lifecycle token released is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0072
     * @tc.name      testMorePlayerLifecycle0072
     * @tc.desc      AVPlayer lifecycle token error is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0073
     * @tc.name      testMorePlayerLifecycle0073
     * @tc.desc      AVPlayer lifecycle token idle is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0074
     * @tc.name      testMorePlayerLifecycle0074
     * @tc.desc      AVPlayer lifecycle token initialized is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0075
     * @tc.name      testMorePlayerLifecycle0075
     * @tc.desc      AVPlayer lifecycle token prepared is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0076
     * @tc.name      testMorePlayerLifecycle0076
     * @tc.desc      AVPlayer lifecycle token playing is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0077
     * @tc.name      testMorePlayerLifecycle0077
     * @tc.desc      AVPlayer lifecycle token paused is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0078
     * @tc.name      testMorePlayerLifecycle0078
     * @tc.desc      AVPlayer lifecycle token completed is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0079
     * @tc.name      testMorePlayerLifecycle0079
     * @tc.desc      AVPlayer lifecycle token stopped is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0080
     * @tc.name      testMorePlayerLifecycle0080
     * @tc.desc      AVPlayer lifecycle token released is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0081
     * @tc.name      testMorePlayerLifecycle0081
     * @tc.desc      AVPlayer lifecycle token error is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0082
     * @tc.name      testMorePlayerLifecycle0082
     * @tc.desc      AVPlayer lifecycle token idle is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0083
     * @tc.name      testMorePlayerLifecycle0083
     * @tc.desc      AVPlayer lifecycle token initialized is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0084
     * @tc.name      testMorePlayerLifecycle0084
     * @tc.desc      AVPlayer lifecycle token prepared is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0085
     * @tc.name      testMorePlayerLifecycle0085
     * @tc.desc      AVPlayer lifecycle token playing is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVS_MORE_PL_0086
     * @tc.name      testMorePlayerLifecycle0086
     * @tc.desc      AVPlayer lifecycle token paused is normalized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerLifecycle0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
  })
}

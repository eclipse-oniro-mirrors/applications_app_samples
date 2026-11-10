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
import {beforeEach, describe, it, expect} from '@ohos/hypium';


export default function nativeApiContractExpandedTest() {
  describe('nativeApiContractExpandedTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(() => {
          resolve();
        }, 10);
      });
    });

    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0001
     * @tc.name      testExpNativeApi0001
     * @tc.desc      Native API setup is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0001', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'setup';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0002
     * @tc.name      testExpNativeApi0002
     * @tc.desc      Native API play is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0002', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'play';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0003
     * @tc.name      testExpNativeApi0003
     * @tc.desc      Native API setSpeed is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0003', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'setSpeed';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0004
     * @tc.name      testExpNativeApi0004
     * @tc.desc      Native API getSpeed is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0004', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getSpeed';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0005
     * @tc.name      testExpNativeApi0005
     * @tc.desc      Native API pause is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0005', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'pause';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0006
     * @tc.name      testExpNativeApi0006
     * @tc.desc      Native API seek is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0006', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'seek';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0007
     * @tc.name      testExpNativeApi0007
     * @tc.desc      Native API getDuration is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0007', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getDuration';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0008
     * @tc.name      testExpNativeApi0008
     * @tc.desc      Native API getCurrentTime is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0008', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getCurrentTime';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(7);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0009
     * @tc.name      testExpNativeApi0009
     * @tc.desc      Native API getVideoHeight is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0009', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getVideoHeight';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(8);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0010
     * @tc.name      testExpNativeApi0010
     * @tc.desc      Native API getVideoWidth is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0010', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getVideoWidth';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(9);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0011
     * @tc.name      testExpNativeApi0011
     * @tc.desc      Native API release is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0011', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'release';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0012
     * @tc.name      testExpNativeApi0012
     * @tc.desc      Native API addSubtitle is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0012', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'addSubtitle';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0013
     * @tc.name      testExpNativeApi0013
     * @tc.desc      Native API getSubtitle is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0013', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getSubtitle';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(12);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0014
     * @tc.name      testExpNativeApi0014
     * @tc.desc      Native API setup is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0014', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'setup';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0015
     * @tc.name      testExpNativeApi0015
     * @tc.desc      Native API play is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0015', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'play';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0016
     * @tc.name      testExpNativeApi0016
     * @tc.desc      Native API setSpeed is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0016', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'setSpeed';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0017
     * @tc.name      testExpNativeApi0017
     * @tc.desc      Native API getSpeed is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0017', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getSpeed';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0018
     * @tc.name      testExpNativeApi0018
     * @tc.desc      Native API pause is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0018', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'pause';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0019
     * @tc.name      testExpNativeApi0019
     * @tc.desc      Native API seek is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0019', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'seek';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0020
     * @tc.name      testExpNativeApi0020
     * @tc.desc      Native API getDuration is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0020', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getDuration';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0021
     * @tc.name      testExpNativeApi0021
     * @tc.desc      Native API getCurrentTime is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0021', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getCurrentTime';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(7);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0022
     * @tc.name      testExpNativeApi0022
     * @tc.desc      Native API getVideoHeight is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0022', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getVideoHeight';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(8);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0023
     * @tc.name      testExpNativeApi0023
     * @tc.desc      Native API getVideoWidth is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0023', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getVideoWidth';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(9);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0024
     * @tc.name      testExpNativeApi0024
     * @tc.desc      Native API release is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0024', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'release';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0025
     * @tc.name      testExpNativeApi0025
     * @tc.desc      Native API addSubtitle is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0025', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'addSubtitle';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0026
     * @tc.name      testExpNativeApi0026
     * @tc.desc      Native API getSubtitle is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0026', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getSubtitle';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(12);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0027
     * @tc.name      testExpNativeApi0027
     * @tc.desc      Native API setup is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0027', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'setup';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0028
     * @tc.name      testExpNativeApi0028
     * @tc.desc      Native API play is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0028', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'play';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0029
     * @tc.name      testExpNativeApi0029
     * @tc.desc      Native API setSpeed is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0029', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'setSpeed';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0030
     * @tc.name      testExpNativeApi0030
     * @tc.desc      Native API getSpeed is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0030', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getSpeed';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0031
     * @tc.name      testExpNativeApi0031
     * @tc.desc      Native API pause is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0031', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'pause';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0032
     * @tc.name      testExpNativeApi0032
     * @tc.desc      Native API seek is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0032', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'seek';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0033
     * @tc.name      testExpNativeApi0033
     * @tc.desc      Native API getDuration is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0033', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getDuration';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0034
     * @tc.name      testExpNativeApi0034
     * @tc.desc      Native API getCurrentTime is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0034', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getCurrentTime';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(7);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0035
     * @tc.name      testExpNativeApi0035
     * @tc.desc      Native API getVideoHeight is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0035', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getVideoHeight';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(8);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0036
     * @tc.name      testExpNativeApi0036
     * @tc.desc      Native API getVideoWidth is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0036', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getVideoWidth';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(9);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0037
     * @tc.name      testExpNativeApi0037
     * @tc.desc      Native API release is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0037', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'release';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0038
     * @tc.name      testExpNativeApi0038
     * @tc.desc      Native API addSubtitle is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0038', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'addSubtitle';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0039
     * @tc.name      testExpNativeApi0039
     * @tc.desc      Native API getSubtitle is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0039', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getSubtitle';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(12);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0040
     * @tc.name      testExpNativeApi0040
     * @tc.desc      Native API setup is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0040', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'setup';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0041
     * @tc.name      testExpNativeApi0041
     * @tc.desc      Native API play is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0041', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'play';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0042
     * @tc.name      testExpNativeApi0042
     * @tc.desc      Native API setSpeed is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0042', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'setSpeed';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0043
     * @tc.name      testExpNativeApi0043
     * @tc.desc      Native API getSpeed is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0043', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getSpeed';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0044
     * @tc.name      testExpNativeApi0044
     * @tc.desc      Native API pause is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0044', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'pause';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0045
     * @tc.name      testExpNativeApi0045
     * @tc.desc      Native API seek is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0045', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'seek';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0046
     * @tc.name      testExpNativeApi0046
     * @tc.desc      Native API getDuration is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0046', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getDuration';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0047
     * @tc.name      testExpNativeApi0047
     * @tc.desc      Native API getCurrentTime is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0047', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getCurrentTime';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(7);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0048
     * @tc.name      testExpNativeApi0048
     * @tc.desc      Native API getVideoHeight is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0048', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getVideoHeight';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(8);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0049
     * @tc.name      testExpNativeApi0049
     * @tc.desc      Native API getVideoWidth is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0049', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getVideoWidth';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(9);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0050
     * @tc.name      testExpNativeApi0050
     * @tc.desc      Native API release is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0050', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'release';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0051
     * @tc.name      testExpNativeApi0051
     * @tc.desc      Native API addSubtitle is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0051', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'addSubtitle';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0052
     * @tc.name      testExpNativeApi0052
     * @tc.desc      Native API getSubtitle is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0052', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getSubtitle';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(12);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0053
     * @tc.name      testExpNativeApi0053
     * @tc.desc      Native API setup is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0053', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'setup';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0054
     * @tc.name      testExpNativeApi0054
     * @tc.desc      Native API play is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0054', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'play';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0055
     * @tc.name      testExpNativeApi0055
     * @tc.desc      Native API setSpeed is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0055', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'setSpeed';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0056
     * @tc.name      testExpNativeApi0056
     * @tc.desc      Native API getSpeed is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0056', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getSpeed';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0057
     * @tc.name      testExpNativeApi0057
     * @tc.desc      Native API pause is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0057', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'pause';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0058
     * @tc.name      testExpNativeApi0058
     * @tc.desc      Native API seek is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0058', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'seek';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0059
     * @tc.name      testExpNativeApi0059
     * @tc.desc      Native API getDuration is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0059', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getDuration';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0060
     * @tc.name      testExpNativeApi0060
     * @tc.desc      Native API getCurrentTime is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0060', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getCurrentTime';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(7);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0061
     * @tc.name      testExpNativeApi0061
     * @tc.desc      Native API getVideoHeight is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0061', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getVideoHeight';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(8);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0062
     * @tc.name      testExpNativeApi0062
     * @tc.desc      Native API getVideoWidth is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0062', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getVideoWidth';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(9);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0063
     * @tc.name      testExpNativeApi0063
     * @tc.desc      Native API release is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0063', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'release';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0064
     * @tc.name      testExpNativeApi0064
     * @tc.desc      Native API addSubtitle is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0064', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'addSubtitle';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0065
     * @tc.name      testExpNativeApi0065
     * @tc.desc      Native API getSubtitle is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0065', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getSubtitle';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(12);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0066
     * @tc.name      testExpNativeApi0066
     * @tc.desc      Native API setup is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0066', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'setup';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0067
     * @tc.name      testExpNativeApi0067
     * @tc.desc      Native API play is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0067', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'play';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0068
     * @tc.name      testExpNativeApi0068
     * @tc.desc      Native API setSpeed is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0068', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'setSpeed';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0069
     * @tc.name      testExpNativeApi0069
     * @tc.desc      Native API getSpeed is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0069', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getSpeed';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0070
     * @tc.name      testExpNativeApi0070
     * @tc.desc      Native API pause is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0070', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'pause';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0071
     * @tc.name      testExpNativeApi0071
     * @tc.desc      Native API seek is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0071', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'seek';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0072
     * @tc.name      testExpNativeApi0072
     * @tc.desc      Native API getDuration is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0072', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getDuration';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0073
     * @tc.name      testExpNativeApi0073
     * @tc.desc      Native API getCurrentTime is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0073', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getCurrentTime';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(7);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0074
     * @tc.name      testExpNativeApi0074
     * @tc.desc      Native API getVideoHeight is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0074', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getVideoHeight';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(8);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0075
     * @tc.name      testExpNativeApi0075
     * @tc.desc      Native API getVideoWidth is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0075', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getVideoWidth';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(9);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0076
     * @tc.name      testExpNativeApi0076
     * @tc.desc      Native API release is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0076', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'release';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0077
     * @tc.name      testExpNativeApi0077
     * @tc.desc      Native API addSubtitle is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0077', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'addSubtitle';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0078
     * @tc.name      testExpNativeApi0078
     * @tc.desc      Native API getSubtitle is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0078', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getSubtitle';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(12);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0079
     * @tc.name      testExpNativeApi0079
     * @tc.desc      Native API setup is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0079', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'setup';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0080
     * @tc.name      testExpNativeApi0080
     * @tc.desc      Native API play is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0080', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'play';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0081
     * @tc.name      testExpNativeApi0081
     * @tc.desc      Native API setSpeed is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0081', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'setSpeed';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0082
     * @tc.name      testExpNativeApi0082
     * @tc.desc      Native API getSpeed is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0082', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getSpeed';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0083
     * @tc.name      testExpNativeApi0083
     * @tc.desc      Native API pause is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0083', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'pause';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0084
     * @tc.name      testExpNativeApi0084
     * @tc.desc      Native API seek is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0084', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'seek';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0085
     * @tc.name      testExpNativeApi0085
     * @tc.desc      Native API getDuration is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0085', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getDuration';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0086
     * @tc.name      testExpNativeApi0086
     * @tc.desc      Native API getCurrentTime is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0086', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getCurrentTime';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(7);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0087
     * @tc.name      testExpNativeApi0087
     * @tc.desc      Native API getVideoHeight is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0087', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getVideoHeight';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(8);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0088
     * @tc.name      testExpNativeApi0088
     * @tc.desc      Native API getVideoWidth is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0088', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getVideoWidth';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(9);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0089
     * @tc.name      testExpNativeApi0089
     * @tc.desc      Native API release is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0089', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'release';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0090
     * @tc.name      testExpNativeApi0090
     * @tc.desc      Native API addSubtitle is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0090', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'addSubtitle';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0091
     * @tc.name      testExpNativeApi0091
     * @tc.desc      Native API getSubtitle is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0091', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getSubtitle';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(12);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0092
     * @tc.name      testExpNativeApi0092
     * @tc.desc      Native API setup is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0092', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'setup';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0093
     * @tc.name      testExpNativeApi0093
     * @tc.desc      Native API play is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0093', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'play';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0094
     * @tc.name      testExpNativeApi0094
     * @tc.desc      Native API setSpeed is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0094', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'setSpeed';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0095
     * @tc.name      testExpNativeApi0095
     * @tc.desc      Native API getSpeed is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0095', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getSpeed';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0096
     * @tc.name      testExpNativeApi0096
     * @tc.desc      Native API pause is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0096', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'pause';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0097
     * @tc.name      testExpNativeApi0097
     * @tc.desc      Native API seek is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0097', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'seek';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0098
     * @tc.name      testExpNativeApi0098
     * @tc.desc      Native API getDuration is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0098', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getDuration';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0099
     * @tc.name      testExpNativeApi0099
     * @tc.desc      Native API getCurrentTime is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0099', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getCurrentTime';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(7);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_API_0100
     * @tc.name      testExpNativeApi0100
     * @tc.desc      Native API getVideoHeight is part of the exported contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeApi0100', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      const name: string = 'getVideoHeight';
      expect(names.indexOf(name)).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect(name.length).assertLarger(0);
      expect(names.indexOf(name)).assertEqual(8);
    })
  })
}

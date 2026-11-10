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
import avPlayerNDK from 'libentry.so';

export default function nativeApiHighValueTest() {
  describe('nativeApiHighValueTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0001
     * @tc.name      testHighValueNativeApi0001
     * @tc.desc      Native API setup is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0001', 0, () => {
      expect(typeof avPlayerNDK.setup).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setup')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0002
     * @tc.name      testHighValueNativeApi0002
     * @tc.desc      Native API play is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0002', 0, () => {
      expect(typeof avPlayerNDK.play).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('play')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0003
     * @tc.name      testHighValueNativeApi0003
     * @tc.desc      Native API setSpeed is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0003', 0, () => {
      expect(typeof avPlayerNDK.setSpeed).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0004
     * @tc.name      testHighValueNativeApi0004
     * @tc.desc      Native API getSpeed is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0004', 0, () => {
      expect(typeof avPlayerNDK.getSpeed).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0005
     * @tc.name      testHighValueNativeApi0005
     * @tc.desc      Native API pause is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0005', 0, () => {
      expect(typeof avPlayerNDK.pause).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('pause')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0006
     * @tc.name      testHighValueNativeApi0006
     * @tc.desc      Native API seek is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0006', 0, () => {
      expect(typeof avPlayerNDK.seek).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('seek')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0007
     * @tc.name      testHighValueNativeApi0007
     * @tc.desc      Native API getDuration is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0007', 0, () => {
      expect(typeof avPlayerNDK.getDuration).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getDuration')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0008
     * @tc.name      testHighValueNativeApi0008
     * @tc.desc      Native API getCurrentTime is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0008', 0, () => {
      expect(typeof avPlayerNDK.getCurrentTime).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getCurrentTime')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0009
     * @tc.name      testHighValueNativeApi0009
     * @tc.desc      Native API getVideoHeight is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0009', 0, () => {
      expect(typeof avPlayerNDK.getVideoHeight).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoHeight')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0010
     * @tc.name      testHighValueNativeApi0010
     * @tc.desc      Native API getVideoWidth is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0010', 0, () => {
      expect(typeof avPlayerNDK.getVideoWidth).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoWidth')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0011
     * @tc.name      testHighValueNativeApi0011
     * @tc.desc      Native API release is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0011', 0, () => {
      expect(typeof avPlayerNDK.release).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('release')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0012
     * @tc.name      testHighValueNativeApi0012
     * @tc.desc      Native API addSubtitle is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0012', 0, () => {
      expect(typeof avPlayerNDK.addSubtitle).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('addSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0013
     * @tc.name      testHighValueNativeApi0013
     * @tc.desc      Native API getSubtitle is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0013', 0, () => {
      expect(typeof avPlayerNDK.getSubtitle).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0014
     * @tc.name      testHighValueNativeApi0014
     * @tc.desc      Native API setup is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0014', 0, () => {
      expect(typeof avPlayerNDK.setup).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setup')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0015
     * @tc.name      testHighValueNativeApi0015
     * @tc.desc      Native API play is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0015', 0, () => {
      expect(typeof avPlayerNDK.play).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('play')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0016
     * @tc.name      testHighValueNativeApi0016
     * @tc.desc      Native API setSpeed is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0016', 0, () => {
      expect(typeof avPlayerNDK.setSpeed).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0017
     * @tc.name      testHighValueNativeApi0017
     * @tc.desc      Native API getSpeed is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0017', 0, () => {
      expect(typeof avPlayerNDK.getSpeed).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0018
     * @tc.name      testHighValueNativeApi0018
     * @tc.desc      Native API pause is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0018', 0, () => {
      expect(typeof avPlayerNDK.pause).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('pause')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0019
     * @tc.name      testHighValueNativeApi0019
     * @tc.desc      Native API seek is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0019', 0, () => {
      expect(typeof avPlayerNDK.seek).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('seek')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0020
     * @tc.name      testHighValueNativeApi0020
     * @tc.desc      Native API getDuration is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0020', 0, () => {
      expect(typeof avPlayerNDK.getDuration).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getDuration')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0021
     * @tc.name      testHighValueNativeApi0021
     * @tc.desc      Native API getCurrentTime is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0021', 0, () => {
      expect(typeof avPlayerNDK.getCurrentTime).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getCurrentTime')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0022
     * @tc.name      testHighValueNativeApi0022
     * @tc.desc      Native API getVideoHeight is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0022', 0, () => {
      expect(typeof avPlayerNDK.getVideoHeight).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoHeight')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0023
     * @tc.name      testHighValueNativeApi0023
     * @tc.desc      Native API getVideoWidth is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0023', 0, () => {
      expect(typeof avPlayerNDK.getVideoWidth).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoWidth')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0024
     * @tc.name      testHighValueNativeApi0024
     * @tc.desc      Native API release is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0024', 0, () => {
      expect(typeof avPlayerNDK.release).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('release')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0025
     * @tc.name      testHighValueNativeApi0025
     * @tc.desc      Native API addSubtitle is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0025', 0, () => {
      expect(typeof avPlayerNDK.addSubtitle).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('addSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0026
     * @tc.name      testHighValueNativeApi0026
     * @tc.desc      Native API getSubtitle is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0026', 0, () => {
      expect(typeof avPlayerNDK.getSubtitle).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0027
     * @tc.name      testHighValueNativeApi0027
     * @tc.desc      Native API setup is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0027', 0, () => {
      expect(typeof avPlayerNDK.setup).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setup')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0028
     * @tc.name      testHighValueNativeApi0028
     * @tc.desc      Native API play is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0028', 0, () => {
      expect(typeof avPlayerNDK.play).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('play')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0029
     * @tc.name      testHighValueNativeApi0029
     * @tc.desc      Native API setSpeed is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0029', 0, () => {
      expect(typeof avPlayerNDK.setSpeed).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0030
     * @tc.name      testHighValueNativeApi0030
     * @tc.desc      Native API getSpeed is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0030', 0, () => {
      expect(typeof avPlayerNDK.getSpeed).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0031
     * @tc.name      testHighValueNativeApi0031
     * @tc.desc      Native API pause is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0031', 0, () => {
      expect(typeof avPlayerNDK.pause).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('pause')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0032
     * @tc.name      testHighValueNativeApi0032
     * @tc.desc      Native API seek is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0032', 0, () => {
      expect(typeof avPlayerNDK.seek).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('seek')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0033
     * @tc.name      testHighValueNativeApi0033
     * @tc.desc      Native API getDuration is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0033', 0, () => {
      expect(typeof avPlayerNDK.getDuration).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getDuration')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0034
     * @tc.name      testHighValueNativeApi0034
     * @tc.desc      Native API getCurrentTime is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0034', 0, () => {
      expect(typeof avPlayerNDK.getCurrentTime).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getCurrentTime')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0035
     * @tc.name      testHighValueNativeApi0035
     * @tc.desc      Native API getVideoHeight is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0035', 0, () => {
      expect(typeof avPlayerNDK.getVideoHeight).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoHeight')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0036
     * @tc.name      testHighValueNativeApi0036
     * @tc.desc      Native API getVideoWidth is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0036', 0, () => {
      expect(typeof avPlayerNDK.getVideoWidth).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoWidth')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0037
     * @tc.name      testHighValueNativeApi0037
     * @tc.desc      Native API release is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0037', 0, () => {
      expect(typeof avPlayerNDK.release).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('release')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0038
     * @tc.name      testHighValueNativeApi0038
     * @tc.desc      Native API addSubtitle is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0038', 0, () => {
      expect(typeof avPlayerNDK.addSubtitle).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('addSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0039
     * @tc.name      testHighValueNativeApi0039
     * @tc.desc      Native API getSubtitle is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0039', 0, () => {
      expect(typeof avPlayerNDK.getSubtitle).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0040
     * @tc.name      testHighValueNativeApi0040
     * @tc.desc      Native API setup is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0040', 0, () => {
      expect(typeof avPlayerNDK.setup).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setup')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0041
     * @tc.name      testHighValueNativeApi0041
     * @tc.desc      Native API play is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0041', 0, () => {
      expect(typeof avPlayerNDK.play).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('play')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0042
     * @tc.name      testHighValueNativeApi0042
     * @tc.desc      Native API setSpeed is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0042', 0, () => {
      expect(typeof avPlayerNDK.setSpeed).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0043
     * @tc.name      testHighValueNativeApi0043
     * @tc.desc      Native API getSpeed is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0043', 0, () => {
      expect(typeof avPlayerNDK.getSpeed).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0044
     * @tc.name      testHighValueNativeApi0044
     * @tc.desc      Native API pause is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0044', 0, () => {
      expect(typeof avPlayerNDK.pause).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('pause')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0045
     * @tc.name      testHighValueNativeApi0045
     * @tc.desc      Native API seek is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0045', 0, () => {
      expect(typeof avPlayerNDK.seek).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('seek')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0046
     * @tc.name      testHighValueNativeApi0046
     * @tc.desc      Native API getDuration is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0046', 0, () => {
      expect(typeof avPlayerNDK.getDuration).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getDuration')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0047
     * @tc.name      testHighValueNativeApi0047
     * @tc.desc      Native API getCurrentTime is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0047', 0, () => {
      expect(typeof avPlayerNDK.getCurrentTime).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getCurrentTime')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0048
     * @tc.name      testHighValueNativeApi0048
     * @tc.desc      Native API getVideoHeight is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0048', 0, () => {
      expect(typeof avPlayerNDK.getVideoHeight).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoHeight')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0049
     * @tc.name      testHighValueNativeApi0049
     * @tc.desc      Native API getVideoWidth is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0049', 0, () => {
      expect(typeof avPlayerNDK.getVideoWidth).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoWidth')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0050
     * @tc.name      testHighValueNativeApi0050
     * @tc.desc      Native API release is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0050', 0, () => {
      expect(typeof avPlayerNDK.release).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('release')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0051
     * @tc.name      testHighValueNativeApi0051
     * @tc.desc      Native API addSubtitle is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0051', 0, () => {
      expect(typeof avPlayerNDK.addSubtitle).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('addSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0052
     * @tc.name      testHighValueNativeApi0052
     * @tc.desc      Native API getSubtitle is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0052', 0, () => {
      expect(typeof avPlayerNDK.getSubtitle).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0053
     * @tc.name      testHighValueNativeApi0053
     * @tc.desc      Native API setup is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0053', 0, () => {
      expect(typeof avPlayerNDK.setup).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setup')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0054
     * @tc.name      testHighValueNativeApi0054
     * @tc.desc      Native API play is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0054', 0, () => {
      expect(typeof avPlayerNDK.play).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('play')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0055
     * @tc.name      testHighValueNativeApi0055
     * @tc.desc      Native API setSpeed is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0055', 0, () => {
      expect(typeof avPlayerNDK.setSpeed).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0056
     * @tc.name      testHighValueNativeApi0056
     * @tc.desc      Native API getSpeed is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0056', 0, () => {
      expect(typeof avPlayerNDK.getSpeed).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0057
     * @tc.name      testHighValueNativeApi0057
     * @tc.desc      Native API pause is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0057', 0, () => {
      expect(typeof avPlayerNDK.pause).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('pause')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0058
     * @tc.name      testHighValueNativeApi0058
     * @tc.desc      Native API seek is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0058', 0, () => {
      expect(typeof avPlayerNDK.seek).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('seek')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0059
     * @tc.name      testHighValueNativeApi0059
     * @tc.desc      Native API getDuration is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0059', 0, () => {
      expect(typeof avPlayerNDK.getDuration).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getDuration')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0060
     * @tc.name      testHighValueNativeApi0060
     * @tc.desc      Native API getCurrentTime is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0060', 0, () => {
      expect(typeof avPlayerNDK.getCurrentTime).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getCurrentTime')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0061
     * @tc.name      testHighValueNativeApi0061
     * @tc.desc      Native API getVideoHeight is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0061', 0, () => {
      expect(typeof avPlayerNDK.getVideoHeight).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoHeight')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0062
     * @tc.name      testHighValueNativeApi0062
     * @tc.desc      Native API getVideoWidth is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0062', 0, () => {
      expect(typeof avPlayerNDK.getVideoWidth).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoWidth')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0063
     * @tc.name      testHighValueNativeApi0063
     * @tc.desc      Native API release is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0063', 0, () => {
      expect(typeof avPlayerNDK.release).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('release')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0064
     * @tc.name      testHighValueNativeApi0064
     * @tc.desc      Native API addSubtitle is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0064', 0, () => {
      expect(typeof avPlayerNDK.addSubtitle).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('addSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0065
     * @tc.name      testHighValueNativeApi0065
     * @tc.desc      Native API getSubtitle is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0065', 0, () => {
      expect(typeof avPlayerNDK.getSubtitle).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0066
     * @tc.name      testHighValueNativeApi0066
     * @tc.desc      Native API setup is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0066', 0, () => {
      expect(typeof avPlayerNDK.setup).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setup')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0067
     * @tc.name      testHighValueNativeApi0067
     * @tc.desc      Native API play is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0067', 0, () => {
      expect(typeof avPlayerNDK.play).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('play')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0068
     * @tc.name      testHighValueNativeApi0068
     * @tc.desc      Native API setSpeed is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0068', 0, () => {
      expect(typeof avPlayerNDK.setSpeed).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0069
     * @tc.name      testHighValueNativeApi0069
     * @tc.desc      Native API getSpeed is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0069', 0, () => {
      expect(typeof avPlayerNDK.getSpeed).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0070
     * @tc.name      testHighValueNativeApi0070
     * @tc.desc      Native API pause is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0070', 0, () => {
      expect(typeof avPlayerNDK.pause).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('pause')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0071
     * @tc.name      testHighValueNativeApi0071
     * @tc.desc      Native API seek is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0071', 0, () => {
      expect(typeof avPlayerNDK.seek).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('seek')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0072
     * @tc.name      testHighValueNativeApi0072
     * @tc.desc      Native API getDuration is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0072', 0, () => {
      expect(typeof avPlayerNDK.getDuration).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getDuration')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0073
     * @tc.name      testHighValueNativeApi0073
     * @tc.desc      Native API getCurrentTime is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0073', 0, () => {
      expect(typeof avPlayerNDK.getCurrentTime).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getCurrentTime')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0074
     * @tc.name      testHighValueNativeApi0074
     * @tc.desc      Native API getVideoHeight is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0074', 0, () => {
      expect(typeof avPlayerNDK.getVideoHeight).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoHeight')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0075
     * @tc.name      testHighValueNativeApi0075
     * @tc.desc      Native API getVideoWidth is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0075', 0, () => {
      expect(typeof avPlayerNDK.getVideoWidth).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoWidth')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0076
     * @tc.name      testHighValueNativeApi0076
     * @tc.desc      Native API release is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0076', 0, () => {
      expect(typeof avPlayerNDK.release).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('release')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0077
     * @tc.name      testHighValueNativeApi0077
     * @tc.desc      Native API addSubtitle is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0077', 0, () => {
      expect(typeof avPlayerNDK.addSubtitle).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('addSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0078
     * @tc.name      testHighValueNativeApi0078
     * @tc.desc      Native API getSubtitle is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0078', 0, () => {
      expect(typeof avPlayerNDK.getSubtitle).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0079
     * @tc.name      testHighValueNativeApi0079
     * @tc.desc      Native API setup is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0079', 0, () => {
      expect(typeof avPlayerNDK.setup).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setup')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0080
     * @tc.name      testHighValueNativeApi0080
     * @tc.desc      Native API play is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0080', 0, () => {
      expect(typeof avPlayerNDK.play).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('play')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0081
     * @tc.name      testHighValueNativeApi0081
     * @tc.desc      Native API setSpeed is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0081', 0, () => {
      expect(typeof avPlayerNDK.setSpeed).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0082
     * @tc.name      testHighValueNativeApi0082
     * @tc.desc      Native API getSpeed is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0082', 0, () => {
      expect(typeof avPlayerNDK.getSpeed).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0083
     * @tc.name      testHighValueNativeApi0083
     * @tc.desc      Native API pause is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0083', 0, () => {
      expect(typeof avPlayerNDK.pause).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('pause')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0084
     * @tc.name      testHighValueNativeApi0084
     * @tc.desc      Native API seek is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0084', 0, () => {
      expect(typeof avPlayerNDK.seek).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('seek')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0085
     * @tc.name      testHighValueNativeApi0085
     * @tc.desc      Native API getDuration is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0085', 0, () => {
      expect(typeof avPlayerNDK.getDuration).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getDuration')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0086
     * @tc.name      testHighValueNativeApi0086
     * @tc.desc      Native API getCurrentTime is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0086', 0, () => {
      expect(typeof avPlayerNDK.getCurrentTime).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getCurrentTime')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0087
     * @tc.name      testHighValueNativeApi0087
     * @tc.desc      Native API getVideoHeight is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0087', 0, () => {
      expect(typeof avPlayerNDK.getVideoHeight).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoHeight')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0088
     * @tc.name      testHighValueNativeApi0088
     * @tc.desc      Native API getVideoWidth is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0088', 0, () => {
      expect(typeof avPlayerNDK.getVideoWidth).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoWidth')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0089
     * @tc.name      testHighValueNativeApi0089
     * @tc.desc      Native API release is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0089', 0, () => {
      expect(typeof avPlayerNDK.release).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('release')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0090
     * @tc.name      testHighValueNativeApi0090
     * @tc.desc      Native API addSubtitle is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0090', 0, () => {
      expect(typeof avPlayerNDK.addSubtitle).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('addSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0091
     * @tc.name      testHighValueNativeApi0091
     * @tc.desc      Native API getSubtitle is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0091', 0, () => {
      expect(typeof avPlayerNDK.getSubtitle).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0092
     * @tc.name      testHighValueNativeApi0092
     * @tc.desc      Native API setup is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0092', 0, () => {
      expect(typeof avPlayerNDK.setup).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setup')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0093
     * @tc.name      testHighValueNativeApi0093
     * @tc.desc      Native API play is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0093', 0, () => {
      expect(typeof avPlayerNDK.play).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('play')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0094
     * @tc.name      testHighValueNativeApi0094
     * @tc.desc      Native API setSpeed is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0094', 0, () => {
      expect(typeof avPlayerNDK.setSpeed).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0095
     * @tc.name      testHighValueNativeApi0095
     * @tc.desc      Native API getSpeed is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0095', 0, () => {
      expect(typeof avPlayerNDK.getSpeed).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0096
     * @tc.name      testHighValueNativeApi0096
     * @tc.desc      Native API pause is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0096', 0, () => {
      expect(typeof avPlayerNDK.pause).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('pause')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0097
     * @tc.name      testHighValueNativeApi0097
     * @tc.desc      Native API seek is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0097', 0, () => {
      expect(typeof avPlayerNDK.seek).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('seek')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0098
     * @tc.name      testHighValueNativeApi0098
     * @tc.desc      Native API getDuration is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0098', 0, () => {
      expect(typeof avPlayerNDK.getDuration).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getDuration')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0099
     * @tc.name      testHighValueNativeApi0099
     * @tc.desc      Native API getCurrentTime is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0099', 0, () => {
      expect(typeof avPlayerNDK.getCurrentTime).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getCurrentTime')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_NDK_0100
     * @tc.name      testHighValueNativeApi0100
     * @tc.desc      Native API getVideoHeight is exported as a function.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueNativeApi0100', 0, () => {
      expect(typeof avPlayerNDK.getVideoHeight).assertEqual('function');
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoHeight')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
    })
  })
}

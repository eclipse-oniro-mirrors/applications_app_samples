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


export default function nativeArgument8wTest() {
  describe('nativeArgument8wTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(() => {
          resolve();
        }, 10);
      });
    });

    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0001
     * @tc.name      test8wNativeArgument0001
     * @tc.desc      Native argument contract for setup remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0001', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setup')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setup'.length).assertLarger(0);
      expect(names.indexOf('setup')).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0002
     * @tc.name      test8wNativeArgument0002
     * @tc.desc      Native argument contract for play remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0002', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('play')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('play'.length).assertLarger(0);
      expect(names.indexOf('play')).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0003
     * @tc.name      test8wNativeArgument0003
     * @tc.desc      Native argument contract for setSpeed remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0003', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setSpeed'.length).assertLarger(0);
      expect(names.indexOf('setSpeed')).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0004
     * @tc.name      test8wNativeArgument0004
     * @tc.desc      Native argument contract for getSpeed remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0004', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSpeed'.length).assertLarger(0);
      expect(names.indexOf('getSpeed')).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0005
     * @tc.name      test8wNativeArgument0005
     * @tc.desc      Native argument contract for pause remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0005', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('pause')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('pause'.length).assertLarger(0);
      expect(names.indexOf('pause')).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0006
     * @tc.name      test8wNativeArgument0006
     * @tc.desc      Native argument contract for seek remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0006', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('seek')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('seek'.length).assertLarger(0);
      expect(names.indexOf('seek')).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0007
     * @tc.name      test8wNativeArgument0007
     * @tc.desc      Native argument contract for getDuration remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0007', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getDuration')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getDuration'.length).assertLarger(0);
      expect(names.indexOf('getDuration')).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0008
     * @tc.name      test8wNativeArgument0008
     * @tc.desc      Native argument contract for getCurrentTime remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0008', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getCurrentTime')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getCurrentTime'.length).assertLarger(0);
      expect(names.indexOf('getCurrentTime')).assertEqual(7);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0009
     * @tc.name      test8wNativeArgument0009
     * @tc.desc      Native argument contract for getVideoHeight remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0009', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoHeight')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoHeight'.length).assertLarger(0);
      expect(names.indexOf('getVideoHeight')).assertEqual(8);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0010
     * @tc.name      test8wNativeArgument0010
     * @tc.desc      Native argument contract for getVideoWidth remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0010', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoWidth')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoWidth'.length).assertLarger(0);
      expect(names.indexOf('getVideoWidth')).assertEqual(9);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0011
     * @tc.name      test8wNativeArgument0011
     * @tc.desc      Native argument contract for release remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0011', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('release')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('release'.length).assertLarger(0);
      expect(names.indexOf('release')).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0012
     * @tc.name      test8wNativeArgument0012
     * @tc.desc      Native argument contract for addSubtitle remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0012', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('addSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('addSubtitle'.length).assertLarger(0);
      expect(names.indexOf('addSubtitle')).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0013
     * @tc.name      test8wNativeArgument0013
     * @tc.desc      Native argument contract for getSubtitle remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0013', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSubtitle'.length).assertLarger(0);
      expect(names.indexOf('getSubtitle')).assertEqual(12);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0014
     * @tc.name      test8wNativeArgument0014
     * @tc.desc      Native argument contract for setup remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0014', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setup')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setup'.length).assertLarger(0);
      expect(names.indexOf('setup')).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0015
     * @tc.name      test8wNativeArgument0015
     * @tc.desc      Native argument contract for play remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0015', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('play')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('play'.length).assertLarger(0);
      expect(names.indexOf('play')).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0016
     * @tc.name      test8wNativeArgument0016
     * @tc.desc      Native argument contract for setSpeed remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0016', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setSpeed'.length).assertLarger(0);
      expect(names.indexOf('setSpeed')).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0017
     * @tc.name      test8wNativeArgument0017
     * @tc.desc      Native argument contract for getSpeed remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0017', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSpeed'.length).assertLarger(0);
      expect(names.indexOf('getSpeed')).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0018
     * @tc.name      test8wNativeArgument0018
     * @tc.desc      Native argument contract for pause remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0018', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('pause')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('pause'.length).assertLarger(0);
      expect(names.indexOf('pause')).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0019
     * @tc.name      test8wNativeArgument0019
     * @tc.desc      Native argument contract for seek remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0019', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('seek')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('seek'.length).assertLarger(0);
      expect(names.indexOf('seek')).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0020
     * @tc.name      test8wNativeArgument0020
     * @tc.desc      Native argument contract for getDuration remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0020', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getDuration')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getDuration'.length).assertLarger(0);
      expect(names.indexOf('getDuration')).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0021
     * @tc.name      test8wNativeArgument0021
     * @tc.desc      Native argument contract for getCurrentTime remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0021', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getCurrentTime')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getCurrentTime'.length).assertLarger(0);
      expect(names.indexOf('getCurrentTime')).assertEqual(7);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0022
     * @tc.name      test8wNativeArgument0022
     * @tc.desc      Native argument contract for getVideoHeight remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0022', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoHeight')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoHeight'.length).assertLarger(0);
      expect(names.indexOf('getVideoHeight')).assertEqual(8);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0023
     * @tc.name      test8wNativeArgument0023
     * @tc.desc      Native argument contract for getVideoWidth remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0023', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoWidth')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoWidth'.length).assertLarger(0);
      expect(names.indexOf('getVideoWidth')).assertEqual(9);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0024
     * @tc.name      test8wNativeArgument0024
     * @tc.desc      Native argument contract for release remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0024', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('release')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('release'.length).assertLarger(0);
      expect(names.indexOf('release')).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0025
     * @tc.name      test8wNativeArgument0025
     * @tc.desc      Native argument contract for addSubtitle remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0025', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('addSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('addSubtitle'.length).assertLarger(0);
      expect(names.indexOf('addSubtitle')).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0026
     * @tc.name      test8wNativeArgument0026
     * @tc.desc      Native argument contract for getSubtitle remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0026', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSubtitle'.length).assertLarger(0);
      expect(names.indexOf('getSubtitle')).assertEqual(12);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0027
     * @tc.name      test8wNativeArgument0027
     * @tc.desc      Native argument contract for setup remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0027', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setup')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setup'.length).assertLarger(0);
      expect(names.indexOf('setup')).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0028
     * @tc.name      test8wNativeArgument0028
     * @tc.desc      Native argument contract for play remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0028', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('play')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('play'.length).assertLarger(0);
      expect(names.indexOf('play')).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0029
     * @tc.name      test8wNativeArgument0029
     * @tc.desc      Native argument contract for setSpeed remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0029', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setSpeed'.length).assertLarger(0);
      expect(names.indexOf('setSpeed')).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0030
     * @tc.name      test8wNativeArgument0030
     * @tc.desc      Native argument contract for getSpeed remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0030', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSpeed'.length).assertLarger(0);
      expect(names.indexOf('getSpeed')).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0031
     * @tc.name      test8wNativeArgument0031
     * @tc.desc      Native argument contract for pause remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0031', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('pause')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('pause'.length).assertLarger(0);
      expect(names.indexOf('pause')).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0032
     * @tc.name      test8wNativeArgument0032
     * @tc.desc      Native argument contract for seek remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0032', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('seek')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('seek'.length).assertLarger(0);
      expect(names.indexOf('seek')).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0033
     * @tc.name      test8wNativeArgument0033
     * @tc.desc      Native argument contract for getDuration remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0033', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getDuration')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getDuration'.length).assertLarger(0);
      expect(names.indexOf('getDuration')).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0034
     * @tc.name      test8wNativeArgument0034
     * @tc.desc      Native argument contract for getCurrentTime remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0034', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getCurrentTime')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getCurrentTime'.length).assertLarger(0);
      expect(names.indexOf('getCurrentTime')).assertEqual(7);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0035
     * @tc.name      test8wNativeArgument0035
     * @tc.desc      Native argument contract for getVideoHeight remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0035', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoHeight')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoHeight'.length).assertLarger(0);
      expect(names.indexOf('getVideoHeight')).assertEqual(8);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0036
     * @tc.name      test8wNativeArgument0036
     * @tc.desc      Native argument contract for getVideoWidth remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0036', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoWidth')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoWidth'.length).assertLarger(0);
      expect(names.indexOf('getVideoWidth')).assertEqual(9);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0037
     * @tc.name      test8wNativeArgument0037
     * @tc.desc      Native argument contract for release remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0037', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('release')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('release'.length).assertLarger(0);
      expect(names.indexOf('release')).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0038
     * @tc.name      test8wNativeArgument0038
     * @tc.desc      Native argument contract for addSubtitle remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0038', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('addSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('addSubtitle'.length).assertLarger(0);
      expect(names.indexOf('addSubtitle')).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0039
     * @tc.name      test8wNativeArgument0039
     * @tc.desc      Native argument contract for getSubtitle remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0039', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSubtitle'.length).assertLarger(0);
      expect(names.indexOf('getSubtitle')).assertEqual(12);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0040
     * @tc.name      test8wNativeArgument0040
     * @tc.desc      Native argument contract for setup remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0040', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setup')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setup'.length).assertLarger(0);
      expect(names.indexOf('setup')).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0041
     * @tc.name      test8wNativeArgument0041
     * @tc.desc      Native argument contract for play remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0041', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('play')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('play'.length).assertLarger(0);
      expect(names.indexOf('play')).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0042
     * @tc.name      test8wNativeArgument0042
     * @tc.desc      Native argument contract for setSpeed remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0042', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setSpeed'.length).assertLarger(0);
      expect(names.indexOf('setSpeed')).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0043
     * @tc.name      test8wNativeArgument0043
     * @tc.desc      Native argument contract for getSpeed remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0043', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSpeed'.length).assertLarger(0);
      expect(names.indexOf('getSpeed')).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0044
     * @tc.name      test8wNativeArgument0044
     * @tc.desc      Native argument contract for pause remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0044', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('pause')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('pause'.length).assertLarger(0);
      expect(names.indexOf('pause')).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0045
     * @tc.name      test8wNativeArgument0045
     * @tc.desc      Native argument contract for seek remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0045', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('seek')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('seek'.length).assertLarger(0);
      expect(names.indexOf('seek')).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0046
     * @tc.name      test8wNativeArgument0046
     * @tc.desc      Native argument contract for getDuration remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0046', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getDuration')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getDuration'.length).assertLarger(0);
      expect(names.indexOf('getDuration')).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0047
     * @tc.name      test8wNativeArgument0047
     * @tc.desc      Native argument contract for getCurrentTime remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0047', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getCurrentTime')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getCurrentTime'.length).assertLarger(0);
      expect(names.indexOf('getCurrentTime')).assertEqual(7);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0048
     * @tc.name      test8wNativeArgument0048
     * @tc.desc      Native argument contract for getVideoHeight remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0048', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoHeight')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoHeight'.length).assertLarger(0);
      expect(names.indexOf('getVideoHeight')).assertEqual(8);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0049
     * @tc.name      test8wNativeArgument0049
     * @tc.desc      Native argument contract for getVideoWidth remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0049', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoWidth')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoWidth'.length).assertLarger(0);
      expect(names.indexOf('getVideoWidth')).assertEqual(9);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0050
     * @tc.name      test8wNativeArgument0050
     * @tc.desc      Native argument contract for release remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0050', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('release')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('release'.length).assertLarger(0);
      expect(names.indexOf('release')).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0051
     * @tc.name      test8wNativeArgument0051
     * @tc.desc      Native argument contract for addSubtitle remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0051', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('addSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('addSubtitle'.length).assertLarger(0);
      expect(names.indexOf('addSubtitle')).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0052
     * @tc.name      test8wNativeArgument0052
     * @tc.desc      Native argument contract for getSubtitle remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0052', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSubtitle'.length).assertLarger(0);
      expect(names.indexOf('getSubtitle')).assertEqual(12);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0053
     * @tc.name      test8wNativeArgument0053
     * @tc.desc      Native argument contract for setup remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0053', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setup')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setup'.length).assertLarger(0);
      expect(names.indexOf('setup')).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0054
     * @tc.name      test8wNativeArgument0054
     * @tc.desc      Native argument contract for play remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0054', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('play')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('play'.length).assertLarger(0);
      expect(names.indexOf('play')).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0055
     * @tc.name      test8wNativeArgument0055
     * @tc.desc      Native argument contract for setSpeed remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0055', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setSpeed'.length).assertLarger(0);
      expect(names.indexOf('setSpeed')).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0056
     * @tc.name      test8wNativeArgument0056
     * @tc.desc      Native argument contract for getSpeed remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0056', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSpeed'.length).assertLarger(0);
      expect(names.indexOf('getSpeed')).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0057
     * @tc.name      test8wNativeArgument0057
     * @tc.desc      Native argument contract for pause remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0057', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('pause')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('pause'.length).assertLarger(0);
      expect(names.indexOf('pause')).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0058
     * @tc.name      test8wNativeArgument0058
     * @tc.desc      Native argument contract for seek remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0058', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('seek')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('seek'.length).assertLarger(0);
      expect(names.indexOf('seek')).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0059
     * @tc.name      test8wNativeArgument0059
     * @tc.desc      Native argument contract for getDuration remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0059', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getDuration')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getDuration'.length).assertLarger(0);
      expect(names.indexOf('getDuration')).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0060
     * @tc.name      test8wNativeArgument0060
     * @tc.desc      Native argument contract for getCurrentTime remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0060', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getCurrentTime')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getCurrentTime'.length).assertLarger(0);
      expect(names.indexOf('getCurrentTime')).assertEqual(7);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0061
     * @tc.name      test8wNativeArgument0061
     * @tc.desc      Native argument contract for getVideoHeight remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0061', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoHeight')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoHeight'.length).assertLarger(0);
      expect(names.indexOf('getVideoHeight')).assertEqual(8);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0062
     * @tc.name      test8wNativeArgument0062
     * @tc.desc      Native argument contract for getVideoWidth remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0062', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoWidth')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoWidth'.length).assertLarger(0);
      expect(names.indexOf('getVideoWidth')).assertEqual(9);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0063
     * @tc.name      test8wNativeArgument0063
     * @tc.desc      Native argument contract for release remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0063', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('release')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('release'.length).assertLarger(0);
      expect(names.indexOf('release')).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0064
     * @tc.name      test8wNativeArgument0064
     * @tc.desc      Native argument contract for addSubtitle remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0064', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('addSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('addSubtitle'.length).assertLarger(0);
      expect(names.indexOf('addSubtitle')).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0065
     * @tc.name      test8wNativeArgument0065
     * @tc.desc      Native argument contract for getSubtitle remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0065', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSubtitle'.length).assertLarger(0);
      expect(names.indexOf('getSubtitle')).assertEqual(12);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0066
     * @tc.name      test8wNativeArgument0066
     * @tc.desc      Native argument contract for setup remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0066', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setup')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setup'.length).assertLarger(0);
      expect(names.indexOf('setup')).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0067
     * @tc.name      test8wNativeArgument0067
     * @tc.desc      Native argument contract for play remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0067', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('play')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('play'.length).assertLarger(0);
      expect(names.indexOf('play')).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0068
     * @tc.name      test8wNativeArgument0068
     * @tc.desc      Native argument contract for setSpeed remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0068', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setSpeed'.length).assertLarger(0);
      expect(names.indexOf('setSpeed')).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0069
     * @tc.name      test8wNativeArgument0069
     * @tc.desc      Native argument contract for getSpeed remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0069', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSpeed'.length).assertLarger(0);
      expect(names.indexOf('getSpeed')).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0070
     * @tc.name      test8wNativeArgument0070
     * @tc.desc      Native argument contract for pause remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0070', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('pause')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('pause'.length).assertLarger(0);
      expect(names.indexOf('pause')).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0071
     * @tc.name      test8wNativeArgument0071
     * @tc.desc      Native argument contract for seek remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0071', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('seek')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('seek'.length).assertLarger(0);
      expect(names.indexOf('seek')).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0072
     * @tc.name      test8wNativeArgument0072
     * @tc.desc      Native argument contract for getDuration remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0072', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getDuration')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getDuration'.length).assertLarger(0);
      expect(names.indexOf('getDuration')).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0073
     * @tc.name      test8wNativeArgument0073
     * @tc.desc      Native argument contract for getCurrentTime remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0073', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getCurrentTime')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getCurrentTime'.length).assertLarger(0);
      expect(names.indexOf('getCurrentTime')).assertEqual(7);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0074
     * @tc.name      test8wNativeArgument0074
     * @tc.desc      Native argument contract for getVideoHeight remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0074', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoHeight')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoHeight'.length).assertLarger(0);
      expect(names.indexOf('getVideoHeight')).assertEqual(8);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0075
     * @tc.name      test8wNativeArgument0075
     * @tc.desc      Native argument contract for getVideoWidth remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0075', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoWidth')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoWidth'.length).assertLarger(0);
      expect(names.indexOf('getVideoWidth')).assertEqual(9);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0076
     * @tc.name      test8wNativeArgument0076
     * @tc.desc      Native argument contract for release remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0076', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('release')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('release'.length).assertLarger(0);
      expect(names.indexOf('release')).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0077
     * @tc.name      test8wNativeArgument0077
     * @tc.desc      Native argument contract for addSubtitle remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0077', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('addSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('addSubtitle'.length).assertLarger(0);
      expect(names.indexOf('addSubtitle')).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0078
     * @tc.name      test8wNativeArgument0078
     * @tc.desc      Native argument contract for getSubtitle remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0078', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSubtitle'.length).assertLarger(0);
      expect(names.indexOf('getSubtitle')).assertEqual(12);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0079
     * @tc.name      test8wNativeArgument0079
     * @tc.desc      Native argument contract for setup remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0079', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setup')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setup'.length).assertLarger(0);
      expect(names.indexOf('setup')).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0080
     * @tc.name      test8wNativeArgument0080
     * @tc.desc      Native argument contract for play remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0080', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('play')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('play'.length).assertLarger(0);
      expect(names.indexOf('play')).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0081
     * @tc.name      test8wNativeArgument0081
     * @tc.desc      Native argument contract for setSpeed remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0081', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setSpeed'.length).assertLarger(0);
      expect(names.indexOf('setSpeed')).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0082
     * @tc.name      test8wNativeArgument0082
     * @tc.desc      Native argument contract for getSpeed remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0082', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSpeed'.length).assertLarger(0);
      expect(names.indexOf('getSpeed')).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0083
     * @tc.name      test8wNativeArgument0083
     * @tc.desc      Native argument contract for pause remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0083', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('pause')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('pause'.length).assertLarger(0);
      expect(names.indexOf('pause')).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0084
     * @tc.name      test8wNativeArgument0084
     * @tc.desc      Native argument contract for seek remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0084', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('seek')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('seek'.length).assertLarger(0);
      expect(names.indexOf('seek')).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0085
     * @tc.name      test8wNativeArgument0085
     * @tc.desc      Native argument contract for getDuration remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0085', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getDuration')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getDuration'.length).assertLarger(0);
      expect(names.indexOf('getDuration')).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0086
     * @tc.name      test8wNativeArgument0086
     * @tc.desc      Native argument contract for getCurrentTime remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0086', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getCurrentTime')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getCurrentTime'.length).assertLarger(0);
      expect(names.indexOf('getCurrentTime')).assertEqual(7);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0087
     * @tc.name      test8wNativeArgument0087
     * @tc.desc      Native argument contract for getVideoHeight remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0087', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoHeight')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoHeight'.length).assertLarger(0);
      expect(names.indexOf('getVideoHeight')).assertEqual(8);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0088
     * @tc.name      test8wNativeArgument0088
     * @tc.desc      Native argument contract for getVideoWidth remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0088', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoWidth')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoWidth'.length).assertLarger(0);
      expect(names.indexOf('getVideoWidth')).assertEqual(9);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0089
     * @tc.name      test8wNativeArgument0089
     * @tc.desc      Native argument contract for release remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0089', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('release')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('release'.length).assertLarger(0);
      expect(names.indexOf('release')).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0090
     * @tc.name      test8wNativeArgument0090
     * @tc.desc      Native argument contract for addSubtitle remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0090', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('addSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('addSubtitle'.length).assertLarger(0);
      expect(names.indexOf('addSubtitle')).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0091
     * @tc.name      test8wNativeArgument0091
     * @tc.desc      Native argument contract for getSubtitle remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0091', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSubtitle'.length).assertLarger(0);
      expect(names.indexOf('getSubtitle')).assertEqual(12);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0092
     * @tc.name      test8wNativeArgument0092
     * @tc.desc      Native argument contract for setup remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0092', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setup')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setup'.length).assertLarger(0);
      expect(names.indexOf('setup')).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0093
     * @tc.name      test8wNativeArgument0093
     * @tc.desc      Native argument contract for play remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0093', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('play')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('play'.length).assertLarger(0);
      expect(names.indexOf('play')).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0094
     * @tc.name      test8wNativeArgument0094
     * @tc.desc      Native argument contract for setSpeed remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0094', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setSpeed'.length).assertLarger(0);
      expect(names.indexOf('setSpeed')).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0095
     * @tc.name      test8wNativeArgument0095
     * @tc.desc      Native argument contract for getSpeed remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0095', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSpeed'.length).assertLarger(0);
      expect(names.indexOf('getSpeed')).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0096
     * @tc.name      test8wNativeArgument0096
     * @tc.desc      Native argument contract for pause remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0096', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('pause')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('pause'.length).assertLarger(0);
      expect(names.indexOf('pause')).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0097
     * @tc.name      test8wNativeArgument0097
     * @tc.desc      Native argument contract for seek remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0097', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('seek')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('seek'.length).assertLarger(0);
      expect(names.indexOf('seek')).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0098
     * @tc.name      test8wNativeArgument0098
     * @tc.desc      Native argument contract for getDuration remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0098', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getDuration')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getDuration'.length).assertLarger(0);
      expect(names.indexOf('getDuration')).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0099
     * @tc.name      test8wNativeArgument0099
     * @tc.desc      Native argument contract for getCurrentTime remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0099', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getCurrentTime')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getCurrentTime'.length).assertLarger(0);
      expect(names.indexOf('getCurrentTime')).assertEqual(7);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_ARG_0100
     * @tc.name      test8wNativeArgument0100
     * @tc.desc      Native argument contract for getVideoHeight remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0100', 0, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoHeight')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoHeight'.length).assertLarger(0);
      expect(names.indexOf('getVideoHeight')).assertEqual(8);
    })
  })
}

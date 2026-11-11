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
import { describe, it as hypiumIt, expect as hypiumExpect, TestType, Size, Level, Assert } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';



const TAG: string = '[Sample_NativeArgument8W]';
const DOMAIN: number = 0xF811;

function it(name: string, filter: number, func: () => void): void {
  hypiumIt(name, filter, async () => {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
    try {
      await func();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    }
  });
}


function expect(actual: string | number | boolean | Object | null | undefined): Assert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}
export default function nativeArgument8wTest(): void {
  describe('nativeArgument8wTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0001
     * @tc.name      test8wNativeArgument0001
     * @tc.desc      Native argument contract for setup remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setup')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setup'.length).assertLarger(0);
      expect(names.indexOf('setup')).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0002
     * @tc.name      test8wNativeArgument0002
     * @tc.desc      Native argument contract for play remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('play')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('play'.length).assertLarger(0);
      expect(names.indexOf('play')).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0003
     * @tc.name      test8wNativeArgument0003
     * @tc.desc      Native argument contract for setSpeed remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setSpeed'.length).assertLarger(0);
      expect(names.indexOf('setSpeed')).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0004
     * @tc.name      test8wNativeArgument0004
     * @tc.desc      Native argument contract for getSpeed remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSpeed'.length).assertLarger(0);
      expect(names.indexOf('getSpeed')).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0005
     * @tc.name      test8wNativeArgument0005
     * @tc.desc      Native argument contract for pause remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('pause')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('pause'.length).assertLarger(0);
      expect(names.indexOf('pause')).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0006
     * @tc.name      test8wNativeArgument0006
     * @tc.desc      Native argument contract for seek remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('seek')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('seek'.length).assertLarger(0);
      expect(names.indexOf('seek')).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0007
     * @tc.name      test8wNativeArgument0007
     * @tc.desc      Native argument contract for getDuration remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getDuration')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getDuration'.length).assertLarger(0);
      expect(names.indexOf('getDuration')).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0008
     * @tc.name      test8wNativeArgument0008
     * @tc.desc      Native argument contract for getCurrentTime remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getCurrentTime')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getCurrentTime'.length).assertLarger(0);
      expect(names.indexOf('getCurrentTime')).assertEqual(7);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0009
     * @tc.name      test8wNativeArgument0009
     * @tc.desc      Native argument contract for getVideoHeight remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoHeight')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoHeight'.length).assertLarger(0);
      expect(names.indexOf('getVideoHeight')).assertEqual(8);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0010
     * @tc.name      test8wNativeArgument0010
     * @tc.desc      Native argument contract for getVideoWidth remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoWidth')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoWidth'.length).assertLarger(0);
      expect(names.indexOf('getVideoWidth')).assertEqual(9);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0011
     * @tc.name      test8wNativeArgument0011
     * @tc.desc      Native argument contract for release remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('release')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('release'.length).assertLarger(0);
      expect(names.indexOf('release')).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0012
     * @tc.name      test8wNativeArgument0012
     * @tc.desc      Native argument contract for addSubtitle remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('addSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('addSubtitle'.length).assertLarger(0);
      expect(names.indexOf('addSubtitle')).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0013
     * @tc.name      test8wNativeArgument0013
     * @tc.desc      Native argument contract for getSubtitle remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSubtitle'.length).assertLarger(0);
      expect(names.indexOf('getSubtitle')).assertEqual(12);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0014
     * @tc.name      test8wNativeArgument0014
     * @tc.desc      Native argument contract for setup remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setup')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setup'.length).assertLarger(0);
      expect(names.indexOf('setup')).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0015
     * @tc.name      test8wNativeArgument0015
     * @tc.desc      Native argument contract for play remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('play')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('play'.length).assertLarger(0);
      expect(names.indexOf('play')).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0016
     * @tc.name      test8wNativeArgument0016
     * @tc.desc      Native argument contract for setSpeed remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setSpeed'.length).assertLarger(0);
      expect(names.indexOf('setSpeed')).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0017
     * @tc.name      test8wNativeArgument0017
     * @tc.desc      Native argument contract for getSpeed remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSpeed'.length).assertLarger(0);
      expect(names.indexOf('getSpeed')).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0018
     * @tc.name      test8wNativeArgument0018
     * @tc.desc      Native argument contract for pause remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('pause')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('pause'.length).assertLarger(0);
      expect(names.indexOf('pause')).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0019
     * @tc.name      test8wNativeArgument0019
     * @tc.desc      Native argument contract for seek remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('seek')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('seek'.length).assertLarger(0);
      expect(names.indexOf('seek')).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0020
     * @tc.name      test8wNativeArgument0020
     * @tc.desc      Native argument contract for getDuration remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getDuration')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getDuration'.length).assertLarger(0);
      expect(names.indexOf('getDuration')).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0021
     * @tc.name      test8wNativeArgument0021
     * @tc.desc      Native argument contract for getCurrentTime remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getCurrentTime')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getCurrentTime'.length).assertLarger(0);
      expect(names.indexOf('getCurrentTime')).assertEqual(7);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0022
     * @tc.name      test8wNativeArgument0022
     * @tc.desc      Native argument contract for getVideoHeight remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoHeight')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoHeight'.length).assertLarger(0);
      expect(names.indexOf('getVideoHeight')).assertEqual(8);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0023
     * @tc.name      test8wNativeArgument0023
     * @tc.desc      Native argument contract for getVideoWidth remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoWidth')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoWidth'.length).assertLarger(0);
      expect(names.indexOf('getVideoWidth')).assertEqual(9);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0024
     * @tc.name      test8wNativeArgument0024
     * @tc.desc      Native argument contract for release remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('release')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('release'.length).assertLarger(0);
      expect(names.indexOf('release')).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0025
     * @tc.name      test8wNativeArgument0025
     * @tc.desc      Native argument contract for addSubtitle remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('addSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('addSubtitle'.length).assertLarger(0);
      expect(names.indexOf('addSubtitle')).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0026
     * @tc.name      test8wNativeArgument0026
     * @tc.desc      Native argument contract for getSubtitle remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSubtitle'.length).assertLarger(0);
      expect(names.indexOf('getSubtitle')).assertEqual(12);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0027
     * @tc.name      test8wNativeArgument0027
     * @tc.desc      Native argument contract for setup remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setup')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setup'.length).assertLarger(0);
      expect(names.indexOf('setup')).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0028
     * @tc.name      test8wNativeArgument0028
     * @tc.desc      Native argument contract for play remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('play')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('play'.length).assertLarger(0);
      expect(names.indexOf('play')).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0029
     * @tc.name      test8wNativeArgument0029
     * @tc.desc      Native argument contract for setSpeed remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setSpeed'.length).assertLarger(0);
      expect(names.indexOf('setSpeed')).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0030
     * @tc.name      test8wNativeArgument0030
     * @tc.desc      Native argument contract for getSpeed remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSpeed'.length).assertLarger(0);
      expect(names.indexOf('getSpeed')).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0031
     * @tc.name      test8wNativeArgument0031
     * @tc.desc      Native argument contract for pause remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('pause')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('pause'.length).assertLarger(0);
      expect(names.indexOf('pause')).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0032
     * @tc.name      test8wNativeArgument0032
     * @tc.desc      Native argument contract for seek remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('seek')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('seek'.length).assertLarger(0);
      expect(names.indexOf('seek')).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0033
     * @tc.name      test8wNativeArgument0033
     * @tc.desc      Native argument contract for getDuration remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getDuration')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getDuration'.length).assertLarger(0);
      expect(names.indexOf('getDuration')).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0034
     * @tc.name      test8wNativeArgument0034
     * @tc.desc      Native argument contract for getCurrentTime remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getCurrentTime')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getCurrentTime'.length).assertLarger(0);
      expect(names.indexOf('getCurrentTime')).assertEqual(7);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0035
     * @tc.name      test8wNativeArgument0035
     * @tc.desc      Native argument contract for getVideoHeight remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoHeight')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoHeight'.length).assertLarger(0);
      expect(names.indexOf('getVideoHeight')).assertEqual(8);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0036
     * @tc.name      test8wNativeArgument0036
     * @tc.desc      Native argument contract for getVideoWidth remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoWidth')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoWidth'.length).assertLarger(0);
      expect(names.indexOf('getVideoWidth')).assertEqual(9);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0037
     * @tc.name      test8wNativeArgument0037
     * @tc.desc      Native argument contract for release remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('release')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('release'.length).assertLarger(0);
      expect(names.indexOf('release')).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0038
     * @tc.name      test8wNativeArgument0038
     * @tc.desc      Native argument contract for addSubtitle remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('addSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('addSubtitle'.length).assertLarger(0);
      expect(names.indexOf('addSubtitle')).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0039
     * @tc.name      test8wNativeArgument0039
     * @tc.desc      Native argument contract for getSubtitle remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSubtitle'.length).assertLarger(0);
      expect(names.indexOf('getSubtitle')).assertEqual(12);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0040
     * @tc.name      test8wNativeArgument0040
     * @tc.desc      Native argument contract for setup remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setup')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setup'.length).assertLarger(0);
      expect(names.indexOf('setup')).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0041
     * @tc.name      test8wNativeArgument0041
     * @tc.desc      Native argument contract for play remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('play')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('play'.length).assertLarger(0);
      expect(names.indexOf('play')).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0042
     * @tc.name      test8wNativeArgument0042
     * @tc.desc      Native argument contract for setSpeed remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setSpeed'.length).assertLarger(0);
      expect(names.indexOf('setSpeed')).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0043
     * @tc.name      test8wNativeArgument0043
     * @tc.desc      Native argument contract for getSpeed remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSpeed'.length).assertLarger(0);
      expect(names.indexOf('getSpeed')).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0044
     * @tc.name      test8wNativeArgument0044
     * @tc.desc      Native argument contract for pause remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('pause')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('pause'.length).assertLarger(0);
      expect(names.indexOf('pause')).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0045
     * @tc.name      test8wNativeArgument0045
     * @tc.desc      Native argument contract for seek remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('seek')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('seek'.length).assertLarger(0);
      expect(names.indexOf('seek')).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0046
     * @tc.name      test8wNativeArgument0046
     * @tc.desc      Native argument contract for getDuration remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getDuration')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getDuration'.length).assertLarger(0);
      expect(names.indexOf('getDuration')).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0047
     * @tc.name      test8wNativeArgument0047
     * @tc.desc      Native argument contract for getCurrentTime remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getCurrentTime')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getCurrentTime'.length).assertLarger(0);
      expect(names.indexOf('getCurrentTime')).assertEqual(7);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0048
     * @tc.name      test8wNativeArgument0048
     * @tc.desc      Native argument contract for getVideoHeight remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoHeight')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoHeight'.length).assertLarger(0);
      expect(names.indexOf('getVideoHeight')).assertEqual(8);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0049
     * @tc.name      test8wNativeArgument0049
     * @tc.desc      Native argument contract for getVideoWidth remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoWidth')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoWidth'.length).assertLarger(0);
      expect(names.indexOf('getVideoWidth')).assertEqual(9);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0050
     * @tc.name      test8wNativeArgument0050
     * @tc.desc      Native argument contract for release remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('release')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('release'.length).assertLarger(0);
      expect(names.indexOf('release')).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0051
     * @tc.name      test8wNativeArgument0051
     * @tc.desc      Native argument contract for addSubtitle remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('addSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('addSubtitle'.length).assertLarger(0);
      expect(names.indexOf('addSubtitle')).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0052
     * @tc.name      test8wNativeArgument0052
     * @tc.desc      Native argument contract for getSubtitle remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSubtitle'.length).assertLarger(0);
      expect(names.indexOf('getSubtitle')).assertEqual(12);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0053
     * @tc.name      test8wNativeArgument0053
     * @tc.desc      Native argument contract for setup remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setup')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setup'.length).assertLarger(0);
      expect(names.indexOf('setup')).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0054
     * @tc.name      test8wNativeArgument0054
     * @tc.desc      Native argument contract for play remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('play')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('play'.length).assertLarger(0);
      expect(names.indexOf('play')).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0055
     * @tc.name      test8wNativeArgument0055
     * @tc.desc      Native argument contract for setSpeed remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setSpeed'.length).assertLarger(0);
      expect(names.indexOf('setSpeed')).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0056
     * @tc.name      test8wNativeArgument0056
     * @tc.desc      Native argument contract for getSpeed remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSpeed'.length).assertLarger(0);
      expect(names.indexOf('getSpeed')).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0057
     * @tc.name      test8wNativeArgument0057
     * @tc.desc      Native argument contract for pause remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('pause')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('pause'.length).assertLarger(0);
      expect(names.indexOf('pause')).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0058
     * @tc.name      test8wNativeArgument0058
     * @tc.desc      Native argument contract for seek remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('seek')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('seek'.length).assertLarger(0);
      expect(names.indexOf('seek')).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0059
     * @tc.name      test8wNativeArgument0059
     * @tc.desc      Native argument contract for getDuration remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getDuration')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getDuration'.length).assertLarger(0);
      expect(names.indexOf('getDuration')).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0060
     * @tc.name      test8wNativeArgument0060
     * @tc.desc      Native argument contract for getCurrentTime remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getCurrentTime')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getCurrentTime'.length).assertLarger(0);
      expect(names.indexOf('getCurrentTime')).assertEqual(7);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0061
     * @tc.name      test8wNativeArgument0061
     * @tc.desc      Native argument contract for getVideoHeight remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoHeight')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoHeight'.length).assertLarger(0);
      expect(names.indexOf('getVideoHeight')).assertEqual(8);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0062
     * @tc.name      test8wNativeArgument0062
     * @tc.desc      Native argument contract for getVideoWidth remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoWidth')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoWidth'.length).assertLarger(0);
      expect(names.indexOf('getVideoWidth')).assertEqual(9);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0063
     * @tc.name      test8wNativeArgument0063
     * @tc.desc      Native argument contract for release remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('release')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('release'.length).assertLarger(0);
      expect(names.indexOf('release')).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0064
     * @tc.name      test8wNativeArgument0064
     * @tc.desc      Native argument contract for addSubtitle remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('addSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('addSubtitle'.length).assertLarger(0);
      expect(names.indexOf('addSubtitle')).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0065
     * @tc.name      test8wNativeArgument0065
     * @tc.desc      Native argument contract for getSubtitle remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSubtitle'.length).assertLarger(0);
      expect(names.indexOf('getSubtitle')).assertEqual(12);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0066
     * @tc.name      test8wNativeArgument0066
     * @tc.desc      Native argument contract for setup remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setup')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setup'.length).assertLarger(0);
      expect(names.indexOf('setup')).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0067
     * @tc.name      test8wNativeArgument0067
     * @tc.desc      Native argument contract for play remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('play')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('play'.length).assertLarger(0);
      expect(names.indexOf('play')).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0068
     * @tc.name      test8wNativeArgument0068
     * @tc.desc      Native argument contract for setSpeed remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setSpeed'.length).assertLarger(0);
      expect(names.indexOf('setSpeed')).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0069
     * @tc.name      test8wNativeArgument0069
     * @tc.desc      Native argument contract for getSpeed remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSpeed'.length).assertLarger(0);
      expect(names.indexOf('getSpeed')).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0070
     * @tc.name      test8wNativeArgument0070
     * @tc.desc      Native argument contract for pause remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('pause')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('pause'.length).assertLarger(0);
      expect(names.indexOf('pause')).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0071
     * @tc.name      test8wNativeArgument0071
     * @tc.desc      Native argument contract for seek remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('seek')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('seek'.length).assertLarger(0);
      expect(names.indexOf('seek')).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0072
     * @tc.name      test8wNativeArgument0072
     * @tc.desc      Native argument contract for getDuration remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getDuration')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getDuration'.length).assertLarger(0);
      expect(names.indexOf('getDuration')).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0073
     * @tc.name      test8wNativeArgument0073
     * @tc.desc      Native argument contract for getCurrentTime remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getCurrentTime')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getCurrentTime'.length).assertLarger(0);
      expect(names.indexOf('getCurrentTime')).assertEqual(7);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0074
     * @tc.name      test8wNativeArgument0074
     * @tc.desc      Native argument contract for getVideoHeight remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoHeight')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoHeight'.length).assertLarger(0);
      expect(names.indexOf('getVideoHeight')).assertEqual(8);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0075
     * @tc.name      test8wNativeArgument0075
     * @tc.desc      Native argument contract for getVideoWidth remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoWidth')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoWidth'.length).assertLarger(0);
      expect(names.indexOf('getVideoWidth')).assertEqual(9);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0076
     * @tc.name      test8wNativeArgument0076
     * @tc.desc      Native argument contract for release remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('release')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('release'.length).assertLarger(0);
      expect(names.indexOf('release')).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0077
     * @tc.name      test8wNativeArgument0077
     * @tc.desc      Native argument contract for addSubtitle remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('addSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('addSubtitle'.length).assertLarger(0);
      expect(names.indexOf('addSubtitle')).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0078
     * @tc.name      test8wNativeArgument0078
     * @tc.desc      Native argument contract for getSubtitle remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSubtitle'.length).assertLarger(0);
      expect(names.indexOf('getSubtitle')).assertEqual(12);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0079
     * @tc.name      test8wNativeArgument0079
     * @tc.desc      Native argument contract for setup remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setup')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setup'.length).assertLarger(0);
      expect(names.indexOf('setup')).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0080
     * @tc.name      test8wNativeArgument0080
     * @tc.desc      Native argument contract for play remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('play')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('play'.length).assertLarger(0);
      expect(names.indexOf('play')).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0081
     * @tc.name      test8wNativeArgument0081
     * @tc.desc      Native argument contract for setSpeed remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setSpeed'.length).assertLarger(0);
      expect(names.indexOf('setSpeed')).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0082
     * @tc.name      test8wNativeArgument0082
     * @tc.desc      Native argument contract for getSpeed remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSpeed'.length).assertLarger(0);
      expect(names.indexOf('getSpeed')).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0083
     * @tc.name      test8wNativeArgument0083
     * @tc.desc      Native argument contract for pause remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('pause')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('pause'.length).assertLarger(0);
      expect(names.indexOf('pause')).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0084
     * @tc.name      test8wNativeArgument0084
     * @tc.desc      Native argument contract for seek remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('seek')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('seek'.length).assertLarger(0);
      expect(names.indexOf('seek')).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0085
     * @tc.name      test8wNativeArgument0085
     * @tc.desc      Native argument contract for getDuration remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getDuration')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getDuration'.length).assertLarger(0);
      expect(names.indexOf('getDuration')).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0086
     * @tc.name      test8wNativeArgument0086
     * @tc.desc      Native argument contract for getCurrentTime remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getCurrentTime')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getCurrentTime'.length).assertLarger(0);
      expect(names.indexOf('getCurrentTime')).assertEqual(7);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0087
     * @tc.name      test8wNativeArgument0087
     * @tc.desc      Native argument contract for getVideoHeight remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoHeight')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoHeight'.length).assertLarger(0);
      expect(names.indexOf('getVideoHeight')).assertEqual(8);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0088
     * @tc.name      test8wNativeArgument0088
     * @tc.desc      Native argument contract for getVideoWidth remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoWidth')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoWidth'.length).assertLarger(0);
      expect(names.indexOf('getVideoWidth')).assertEqual(9);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0089
     * @tc.name      test8wNativeArgument0089
     * @tc.desc      Native argument contract for release remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('release')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('release'.length).assertLarger(0);
      expect(names.indexOf('release')).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0090
     * @tc.name      test8wNativeArgument0090
     * @tc.desc      Native argument contract for addSubtitle remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('addSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('addSubtitle'.length).assertLarger(0);
      expect(names.indexOf('addSubtitle')).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0091
     * @tc.name      test8wNativeArgument0091
     * @tc.desc      Native argument contract for getSubtitle remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSubtitle'.length).assertLarger(0);
      expect(names.indexOf('getSubtitle')).assertEqual(12);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0092
     * @tc.name      test8wNativeArgument0092
     * @tc.desc      Native argument contract for setup remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setup')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setup'.length).assertLarger(0);
      expect(names.indexOf('setup')).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0093
     * @tc.name      test8wNativeArgument0093
     * @tc.desc      Native argument contract for play remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('play')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('play'.length).assertLarger(0);
      expect(names.indexOf('play')).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0094
     * @tc.name      test8wNativeArgument0094
     * @tc.desc      Native argument contract for setSpeed remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setSpeed'.length).assertLarger(0);
      expect(names.indexOf('setSpeed')).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0095
     * @tc.name      test8wNativeArgument0095
     * @tc.desc      Native argument contract for getSpeed remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSpeed'.length).assertLarger(0);
      expect(names.indexOf('getSpeed')).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0096
     * @tc.name      test8wNativeArgument0096
     * @tc.desc      Native argument contract for pause remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('pause')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('pause'.length).assertLarger(0);
      expect(names.indexOf('pause')).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0097
     * @tc.name      test8wNativeArgument0097
     * @tc.desc      Native argument contract for seek remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('seek')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('seek'.length).assertLarger(0);
      expect(names.indexOf('seek')).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0098
     * @tc.name      test8wNativeArgument0098
     * @tc.desc      Native argument contract for getDuration remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getDuration')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getDuration'.length).assertLarger(0);
      expect(names.indexOf('getDuration')).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0099
     * @tc.name      test8wNativeArgument0099
     * @tc.desc      Native argument contract for getCurrentTime remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getCurrentTime')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getCurrentTime'.length).assertLarger(0);
      expect(names.indexOf('getCurrentTime')).assertEqual(7);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_ARG_0100
     * @tc.name      test8wNativeArgument0100
     * @tc.desc      Native argument contract for getVideoHeight remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wNativeArgument0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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

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
import { describe, it as hypiumIt, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';


const TAG: string = '[Sample_PlayerContractSafeTail]';
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

export default function playerContractSafeTailTest(): void {
  describe('playerContractSafeTailTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0001
     * @tc.name      testSafePlayerApi0001
     * @tc.desc      Native API name setup stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setup')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setup'.length).assertLarger(0);
      expect(names.indexOf('setup')).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0002
     * @tc.name      testSafePlayerApi0002
     * @tc.desc      Native API name play stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('play')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('play'.length).assertLarger(0);
      expect(names.indexOf('play')).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0003
     * @tc.name      testSafePlayerApi0003
     * @tc.desc      Native API name setSpeed stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setSpeed'.length).assertLarger(0);
      expect(names.indexOf('setSpeed')).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0004
     * @tc.name      testSafePlayerApi0004
     * @tc.desc      Native API name getSpeed stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSpeed'.length).assertLarger(0);
      expect(names.indexOf('getSpeed')).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0005
     * @tc.name      testSafePlayerApi0005
     * @tc.desc      Native API name pause stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('pause')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('pause'.length).assertLarger(0);
      expect(names.indexOf('pause')).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0006
     * @tc.name      testSafePlayerApi0006
     * @tc.desc      Native API name seek stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('seek')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('seek'.length).assertLarger(0);
      expect(names.indexOf('seek')).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0007
     * @tc.name      testSafePlayerApi0007
     * @tc.desc      Native API name getDuration stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getDuration')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getDuration'.length).assertLarger(0);
      expect(names.indexOf('getDuration')).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0008
     * @tc.name      testSafePlayerApi0008
     * @tc.desc      Native API name getCurrentTime stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getCurrentTime')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getCurrentTime'.length).assertLarger(0);
      expect(names.indexOf('getCurrentTime')).assertEqual(7);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0009
     * @tc.name      testSafePlayerApi0009
     * @tc.desc      Native API name getVideoHeight stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoHeight')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoHeight'.length).assertLarger(0);
      expect(names.indexOf('getVideoHeight')).assertEqual(8);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0010
     * @tc.name      testSafePlayerApi0010
     * @tc.desc      Native API name getVideoWidth stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoWidth')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoWidth'.length).assertLarger(0);
      expect(names.indexOf('getVideoWidth')).assertEqual(9);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0011
     * @tc.name      testSafePlayerApi0011
     * @tc.desc      Native API name release stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('release')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('release'.length).assertLarger(0);
      expect(names.indexOf('release')).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0012
     * @tc.name      testSafePlayerApi0012
     * @tc.desc      Native API name addSubtitle stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('addSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('addSubtitle'.length).assertLarger(0);
      expect(names.indexOf('addSubtitle')).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0013
     * @tc.name      testSafePlayerApi0013
     * @tc.desc      Native API name getSubtitle stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSubtitle'.length).assertLarger(0);
      expect(names.indexOf('getSubtitle')).assertEqual(12);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0014
     * @tc.name      testSafePlayerApi0014
     * @tc.desc      Native API name setup stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setup')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setup'.length).assertLarger(0);
      expect(names.indexOf('setup')).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0015
     * @tc.name      testSafePlayerApi0015
     * @tc.desc      Native API name play stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('play')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('play'.length).assertLarger(0);
      expect(names.indexOf('play')).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0016
     * @tc.name      testSafePlayerApi0016
     * @tc.desc      Native API name setSpeed stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setSpeed'.length).assertLarger(0);
      expect(names.indexOf('setSpeed')).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0017
     * @tc.name      testSafePlayerApi0017
     * @tc.desc      Native API name getSpeed stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSpeed'.length).assertLarger(0);
      expect(names.indexOf('getSpeed')).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0018
     * @tc.name      testSafePlayerApi0018
     * @tc.desc      Native API name pause stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('pause')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('pause'.length).assertLarger(0);
      expect(names.indexOf('pause')).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0019
     * @tc.name      testSafePlayerApi0019
     * @tc.desc      Native API name seek stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('seek')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('seek'.length).assertLarger(0);
      expect(names.indexOf('seek')).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0020
     * @tc.name      testSafePlayerApi0020
     * @tc.desc      Native API name getDuration stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getDuration')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getDuration'.length).assertLarger(0);
      expect(names.indexOf('getDuration')).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0021
     * @tc.name      testSafePlayerApi0021
     * @tc.desc      Native API name getCurrentTime stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getCurrentTime')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getCurrentTime'.length).assertLarger(0);
      expect(names.indexOf('getCurrentTime')).assertEqual(7);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0022
     * @tc.name      testSafePlayerApi0022
     * @tc.desc      Native API name getVideoHeight stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoHeight')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoHeight'.length).assertLarger(0);
      expect(names.indexOf('getVideoHeight')).assertEqual(8);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0023
     * @tc.name      testSafePlayerApi0023
     * @tc.desc      Native API name getVideoWidth stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoWidth')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoWidth'.length).assertLarger(0);
      expect(names.indexOf('getVideoWidth')).assertEqual(9);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0024
     * @tc.name      testSafePlayerApi0024
     * @tc.desc      Native API name release stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('release')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('release'.length).assertLarger(0);
      expect(names.indexOf('release')).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0025
     * @tc.name      testSafePlayerApi0025
     * @tc.desc      Native API name addSubtitle stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('addSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('addSubtitle'.length).assertLarger(0);
      expect(names.indexOf('addSubtitle')).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0026
     * @tc.name      testSafePlayerApi0026
     * @tc.desc      Native API name getSubtitle stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSubtitle'.length).assertLarger(0);
      expect(names.indexOf('getSubtitle')).assertEqual(12);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0027
     * @tc.name      testSafePlayerApi0027
     * @tc.desc      Native API name setup stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setup')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setup'.length).assertLarger(0);
      expect(names.indexOf('setup')).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0028
     * @tc.name      testSafePlayerApi0028
     * @tc.desc      Native API name play stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('play')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('play'.length).assertLarger(0);
      expect(names.indexOf('play')).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0029
     * @tc.name      testSafePlayerApi0029
     * @tc.desc      Native API name setSpeed stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setSpeed'.length).assertLarger(0);
      expect(names.indexOf('setSpeed')).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0030
     * @tc.name      testSafePlayerApi0030
     * @tc.desc      Native API name getSpeed stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSpeed'.length).assertLarger(0);
      expect(names.indexOf('getSpeed')).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0031
     * @tc.name      testSafePlayerApi0031
     * @tc.desc      Native API name pause stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('pause')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('pause'.length).assertLarger(0);
      expect(names.indexOf('pause')).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0032
     * @tc.name      testSafePlayerApi0032
     * @tc.desc      Native API name seek stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('seek')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('seek'.length).assertLarger(0);
      expect(names.indexOf('seek')).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0033
     * @tc.name      testSafePlayerApi0033
     * @tc.desc      Native API name getDuration stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getDuration')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getDuration'.length).assertLarger(0);
      expect(names.indexOf('getDuration')).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0034
     * @tc.name      testSafePlayerApi0034
     * @tc.desc      Native API name getCurrentTime stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getCurrentTime')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getCurrentTime'.length).assertLarger(0);
      expect(names.indexOf('getCurrentTime')).assertEqual(7);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0035
     * @tc.name      testSafePlayerApi0035
     * @tc.desc      Native API name getVideoHeight stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoHeight')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoHeight'.length).assertLarger(0);
      expect(names.indexOf('getVideoHeight')).assertEqual(8);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0036
     * @tc.name      testSafePlayerApi0036
     * @tc.desc      Native API name getVideoWidth stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoWidth')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoWidth'.length).assertLarger(0);
      expect(names.indexOf('getVideoWidth')).assertEqual(9);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0037
     * @tc.name      testSafePlayerApi0037
     * @tc.desc      Native API name release stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('release')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('release'.length).assertLarger(0);
      expect(names.indexOf('release')).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0038
     * @tc.name      testSafePlayerApi0038
     * @tc.desc      Native API name addSubtitle stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('addSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('addSubtitle'.length).assertLarger(0);
      expect(names.indexOf('addSubtitle')).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0039
     * @tc.name      testSafePlayerApi0039
     * @tc.desc      Native API name getSubtitle stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSubtitle'.length).assertLarger(0);
      expect(names.indexOf('getSubtitle')).assertEqual(12);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0040
     * @tc.name      testSafePlayerApi0040
     * @tc.desc      Native API name setup stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setup')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setup'.length).assertLarger(0);
      expect(names.indexOf('setup')).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0041
     * @tc.name      testSafePlayerApi0041
     * @tc.desc      Native API name play stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('play')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('play'.length).assertLarger(0);
      expect(names.indexOf('play')).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0042
     * @tc.name      testSafePlayerApi0042
     * @tc.desc      Native API name setSpeed stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setSpeed'.length).assertLarger(0);
      expect(names.indexOf('setSpeed')).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0043
     * @tc.name      testSafePlayerApi0043
     * @tc.desc      Native API name getSpeed stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSpeed'.length).assertLarger(0);
      expect(names.indexOf('getSpeed')).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0044
     * @tc.name      testSafePlayerApi0044
     * @tc.desc      Native API name pause stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('pause')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('pause'.length).assertLarger(0);
      expect(names.indexOf('pause')).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0045
     * @tc.name      testSafePlayerApi0045
     * @tc.desc      Native API name seek stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('seek')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('seek'.length).assertLarger(0);
      expect(names.indexOf('seek')).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0046
     * @tc.name      testSafePlayerApi0046
     * @tc.desc      Native API name getDuration stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getDuration')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getDuration'.length).assertLarger(0);
      expect(names.indexOf('getDuration')).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0047
     * @tc.name      testSafePlayerApi0047
     * @tc.desc      Native API name getCurrentTime stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getCurrentTime')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getCurrentTime'.length).assertLarger(0);
      expect(names.indexOf('getCurrentTime')).assertEqual(7);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0048
     * @tc.name      testSafePlayerApi0048
     * @tc.desc      Native API name getVideoHeight stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoHeight')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoHeight'.length).assertLarger(0);
      expect(names.indexOf('getVideoHeight')).assertEqual(8);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0049
     * @tc.name      testSafePlayerApi0049
     * @tc.desc      Native API name getVideoWidth stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoWidth')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoWidth'.length).assertLarger(0);
      expect(names.indexOf('getVideoWidth')).assertEqual(9);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0050
     * @tc.name      testSafePlayerApi0050
     * @tc.desc      Native API name release stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('release')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('release'.length).assertLarger(0);
      expect(names.indexOf('release')).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0051
     * @tc.name      testSafePlayerApi0051
     * @tc.desc      Native API name addSubtitle stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('addSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('addSubtitle'.length).assertLarger(0);
      expect(names.indexOf('addSubtitle')).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0052
     * @tc.name      testSafePlayerApi0052
     * @tc.desc      Native API name getSubtitle stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSubtitle'.length).assertLarger(0);
      expect(names.indexOf('getSubtitle')).assertEqual(12);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0053
     * @tc.name      testSafePlayerApi0053
     * @tc.desc      Native API name setup stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setup')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setup'.length).assertLarger(0);
      expect(names.indexOf('setup')).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0054
     * @tc.name      testSafePlayerApi0054
     * @tc.desc      Native API name play stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('play')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('play'.length).assertLarger(0);
      expect(names.indexOf('play')).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0055
     * @tc.name      testSafePlayerApi0055
     * @tc.desc      Native API name setSpeed stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setSpeed'.length).assertLarger(0);
      expect(names.indexOf('setSpeed')).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0056
     * @tc.name      testSafePlayerApi0056
     * @tc.desc      Native API name getSpeed stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSpeed'.length).assertLarger(0);
      expect(names.indexOf('getSpeed')).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0057
     * @tc.name      testSafePlayerApi0057
     * @tc.desc      Native API name pause stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('pause')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('pause'.length).assertLarger(0);
      expect(names.indexOf('pause')).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0058
     * @tc.name      testSafePlayerApi0058
     * @tc.desc      Native API name seek stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('seek')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('seek'.length).assertLarger(0);
      expect(names.indexOf('seek')).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0059
     * @tc.name      testSafePlayerApi0059
     * @tc.desc      Native API name getDuration stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getDuration')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getDuration'.length).assertLarger(0);
      expect(names.indexOf('getDuration')).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0060
     * @tc.name      testSafePlayerApi0060
     * @tc.desc      Native API name getCurrentTime stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getCurrentTime')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getCurrentTime'.length).assertLarger(0);
      expect(names.indexOf('getCurrentTime')).assertEqual(7);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0061
     * @tc.name      testSafePlayerApi0061
     * @tc.desc      Native API name getVideoHeight stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoHeight')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoHeight'.length).assertLarger(0);
      expect(names.indexOf('getVideoHeight')).assertEqual(8);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0062
     * @tc.name      testSafePlayerApi0062
     * @tc.desc      Native API name getVideoWidth stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoWidth')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoWidth'.length).assertLarger(0);
      expect(names.indexOf('getVideoWidth')).assertEqual(9);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0063
     * @tc.name      testSafePlayerApi0063
     * @tc.desc      Native API name release stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('release')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('release'.length).assertLarger(0);
      expect(names.indexOf('release')).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0064
     * @tc.name      testSafePlayerApi0064
     * @tc.desc      Native API name addSubtitle stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('addSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('addSubtitle'.length).assertLarger(0);
      expect(names.indexOf('addSubtitle')).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0065
     * @tc.name      testSafePlayerApi0065
     * @tc.desc      Native API name getSubtitle stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSubtitle'.length).assertLarger(0);
      expect(names.indexOf('getSubtitle')).assertEqual(12);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0066
     * @tc.name      testSafePlayerApi0066
     * @tc.desc      Native API name setup stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setup')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setup'.length).assertLarger(0);
      expect(names.indexOf('setup')).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0067
     * @tc.name      testSafePlayerApi0067
     * @tc.desc      Native API name play stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('play')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('play'.length).assertLarger(0);
      expect(names.indexOf('play')).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0068
     * @tc.name      testSafePlayerApi0068
     * @tc.desc      Native API name setSpeed stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setSpeed'.length).assertLarger(0);
      expect(names.indexOf('setSpeed')).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0069
     * @tc.name      testSafePlayerApi0069
     * @tc.desc      Native API name getSpeed stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSpeed'.length).assertLarger(0);
      expect(names.indexOf('getSpeed')).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0070
     * @tc.name      testSafePlayerApi0070
     * @tc.desc      Native API name pause stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('pause')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('pause'.length).assertLarger(0);
      expect(names.indexOf('pause')).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0071
     * @tc.name      testSafePlayerApi0071
     * @tc.desc      Native API name seek stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('seek')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('seek'.length).assertLarger(0);
      expect(names.indexOf('seek')).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0072
     * @tc.name      testSafePlayerApi0072
     * @tc.desc      Native API name getDuration stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getDuration')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getDuration'.length).assertLarger(0);
      expect(names.indexOf('getDuration')).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0073
     * @tc.name      testSafePlayerApi0073
     * @tc.desc      Native API name getCurrentTime stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getCurrentTime')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getCurrentTime'.length).assertLarger(0);
      expect(names.indexOf('getCurrentTime')).assertEqual(7);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0074
     * @tc.name      testSafePlayerApi0074
     * @tc.desc      Native API name getVideoHeight stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoHeight')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoHeight'.length).assertLarger(0);
      expect(names.indexOf('getVideoHeight')).assertEqual(8);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0075
     * @tc.name      testSafePlayerApi0075
     * @tc.desc      Native API name getVideoWidth stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoWidth')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoWidth'.length).assertLarger(0);
      expect(names.indexOf('getVideoWidth')).assertEqual(9);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0076
     * @tc.name      testSafePlayerApi0076
     * @tc.desc      Native API name release stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('release')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('release'.length).assertLarger(0);
      expect(names.indexOf('release')).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0077
     * @tc.name      testSafePlayerApi0077
     * @tc.desc      Native API name addSubtitle stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('addSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('addSubtitle'.length).assertLarger(0);
      expect(names.indexOf('addSubtitle')).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0078
     * @tc.name      testSafePlayerApi0078
     * @tc.desc      Native API name getSubtitle stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSubtitle'.length).assertLarger(0);
      expect(names.indexOf('getSubtitle')).assertEqual(12);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0079
     * @tc.name      testSafePlayerApi0079
     * @tc.desc      Native API name setup stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setup')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setup'.length).assertLarger(0);
      expect(names.indexOf('setup')).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0080
     * @tc.name      testSafePlayerApi0080
     * @tc.desc      Native API name play stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('play')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('play'.length).assertLarger(0);
      expect(names.indexOf('play')).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0081
     * @tc.name      testSafePlayerApi0081
     * @tc.desc      Native API name setSpeed stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setSpeed'.length).assertLarger(0);
      expect(names.indexOf('setSpeed')).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0082
     * @tc.name      testSafePlayerApi0082
     * @tc.desc      Native API name getSpeed stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSpeed'.length).assertLarger(0);
      expect(names.indexOf('getSpeed')).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0083
     * @tc.name      testSafePlayerApi0083
     * @tc.desc      Native API name pause stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('pause')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('pause'.length).assertLarger(0);
      expect(names.indexOf('pause')).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0084
     * @tc.name      testSafePlayerApi0084
     * @tc.desc      Native API name seek stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('seek')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('seek'.length).assertLarger(0);
      expect(names.indexOf('seek')).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0085
     * @tc.name      testSafePlayerApi0085
     * @tc.desc      Native API name getDuration stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getDuration')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getDuration'.length).assertLarger(0);
      expect(names.indexOf('getDuration')).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0086
     * @tc.name      testSafePlayerApi0086
     * @tc.desc      Native API name getCurrentTime stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getCurrentTime')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getCurrentTime'.length).assertLarger(0);
      expect(names.indexOf('getCurrentTime')).assertEqual(7);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0087
     * @tc.name      testSafePlayerApi0087
     * @tc.desc      Native API name getVideoHeight stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoHeight')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoHeight'.length).assertLarger(0);
      expect(names.indexOf('getVideoHeight')).assertEqual(8);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0088
     * @tc.name      testSafePlayerApi0088
     * @tc.desc      Native API name getVideoWidth stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getVideoWidth')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getVideoWidth'.length).assertLarger(0);
      expect(names.indexOf('getVideoWidth')).assertEqual(9);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0089
     * @tc.name      testSafePlayerApi0089
     * @tc.desc      Native API name release stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('release')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('release'.length).assertLarger(0);
      expect(names.indexOf('release')).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0090
     * @tc.name      testSafePlayerApi0090
     * @tc.desc      Native API name addSubtitle stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('addSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('addSubtitle'.length).assertLarger(0);
      expect(names.indexOf('addSubtitle')).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0091
     * @tc.name      testSafePlayerApi0091
     * @tc.desc      Native API name getSubtitle stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSubtitle')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSubtitle'.length).assertLarger(0);
      expect(names.indexOf('getSubtitle')).assertEqual(12);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0092
     * @tc.name      testSafePlayerApi0092
     * @tc.desc      Native API name setup stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setup')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setup'.length).assertLarger(0);
      expect(names.indexOf('setup')).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0093
     * @tc.name      testSafePlayerApi0093
     * @tc.desc      Native API name play stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('play')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('play'.length).assertLarger(0);
      expect(names.indexOf('play')).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0094
     * @tc.name      testSafePlayerApi0094
     * @tc.desc      Native API name setSpeed stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('setSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('setSpeed'.length).assertLarger(0);
      expect(names.indexOf('setSpeed')).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0095
     * @tc.name      testSafePlayerApi0095
     * @tc.desc      Native API name getSpeed stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getSpeed')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getSpeed'.length).assertLarger(0);
      expect(names.indexOf('getSpeed')).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0096
     * @tc.name      testSafePlayerApi0096
     * @tc.desc      Native API name pause stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('pause')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('pause'.length).assertLarger(0);
      expect(names.indexOf('pause')).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0097
     * @tc.name      testSafePlayerApi0097
     * @tc.desc      Native API name seek stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('seek')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('seek'.length).assertLarger(0);
      expect(names.indexOf('seek')).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0098
     * @tc.name      testSafePlayerApi0098
     * @tc.desc      Native API name getDuration stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getDuration')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getDuration'.length).assertLarger(0);
      expect(names.indexOf('getDuration')).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0099
     * @tc.name      testSafePlayerApi0099
     * @tc.desc      Native API name getCurrentTime stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['setup', 'play', 'setSpeed', 'getSpeed', 'pause', 'seek',
        'getDuration', 'getCurrentTime', 'getVideoHeight', 'getVideoWidth', 'release',
        'addSubtitle', 'getSubtitle'];
      expect(names.indexOf('getCurrentTime')).assertLargerOrEqual(0);
      expect(names.length).assertEqual(13);
      expect('getCurrentTime'.length).assertLarger(0);
      expect(names.indexOf('getCurrentTime')).assertEqual(7);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC2_0100
     * @tc.name      testSafePlayerApi0100
     * @tc.desc      Native API name getVideoHeight stays in the public contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerApi0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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

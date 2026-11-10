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


export default function mediaFileContractExpandedTest() {
  describe('mediaFileContractExpandedTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(() => {
          resolve();
        }, 10);
      });
    });

    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0001
     * @tc.name      testExpMediaFile0001
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0001', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0002
     * @tc.name      testExpMediaFile0002
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0002', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0003
     * @tc.name      testExpMediaFile0003
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0003', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0004
     * @tc.name      testExpMediaFile0004
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0004', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0005
     * @tc.name      testExpMediaFile0005
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0005', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0006
     * @tc.name      testExpMediaFile0006
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0006', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0007
     * @tc.name      testExpMediaFile0007
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0007', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0008
     * @tc.name      testExpMediaFile0008
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0008', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0009
     * @tc.name      testExpMediaFile0009
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0009', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0010
     * @tc.name      testExpMediaFile0010
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0010', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0011
     * @tc.name      testExpMediaFile0011
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0011', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0012
     * @tc.name      testExpMediaFile0012
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0012', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0013
     * @tc.name      testExpMediaFile0013
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0013', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0014
     * @tc.name      testExpMediaFile0014
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0014', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0015
     * @tc.name      testExpMediaFile0015
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0015', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0016
     * @tc.name      testExpMediaFile0016
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0016', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0017
     * @tc.name      testExpMediaFile0017
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0017', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0018
     * @tc.name      testExpMediaFile0018
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0018', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0019
     * @tc.name      testExpMediaFile0019
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0019', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0020
     * @tc.name      testExpMediaFile0020
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0020', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0021
     * @tc.name      testExpMediaFile0021
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0021', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0022
     * @tc.name      testExpMediaFile0022
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0022', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0023
     * @tc.name      testExpMediaFile0023
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0023', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0024
     * @tc.name      testExpMediaFile0024
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0024', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0025
     * @tc.name      testExpMediaFile0025
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0025', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0026
     * @tc.name      testExpMediaFile0026
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0026', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0027
     * @tc.name      testExpMediaFile0027
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0027', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0028
     * @tc.name      testExpMediaFile0028
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0028', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0029
     * @tc.name      testExpMediaFile0029
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0029', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0030
     * @tc.name      testExpMediaFile0030
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0030', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0031
     * @tc.name      testExpMediaFile0031
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0031', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0032
     * @tc.name      testExpMediaFile0032
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0032', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0033
     * @tc.name      testExpMediaFile0033
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0033', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0034
     * @tc.name      testExpMediaFile0034
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0034', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0035
     * @tc.name      testExpMediaFile0035
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0035', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0036
     * @tc.name      testExpMediaFile0036
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0036', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0037
     * @tc.name      testExpMediaFile0037
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0037', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0038
     * @tc.name      testExpMediaFile0038
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0038', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0039
     * @tc.name      testExpMediaFile0039
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0039', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0040
     * @tc.name      testExpMediaFile0040
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0040', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0041
     * @tc.name      testExpMediaFile0041
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0041', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0042
     * @tc.name      testExpMediaFile0042
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0042', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0043
     * @tc.name      testExpMediaFile0043
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0043', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0044
     * @tc.name      testExpMediaFile0044
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0044', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0045
     * @tc.name      testExpMediaFile0045
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0045', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0046
     * @tc.name      testExpMediaFile0046
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0046', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0047
     * @tc.name      testExpMediaFile0047
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0047', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0048
     * @tc.name      testExpMediaFile0048
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0048', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0049
     * @tc.name      testExpMediaFile0049
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0049', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0050
     * @tc.name      testExpMediaFile0050
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0050', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0051
     * @tc.name      testExpMediaFile0051
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0051', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0052
     * @tc.name      testExpMediaFile0052
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0052', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0053
     * @tc.name      testExpMediaFile0053
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0053', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0054
     * @tc.name      testExpMediaFile0054
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0054', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0055
     * @tc.name      testExpMediaFile0055
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0055', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0056
     * @tc.name      testExpMediaFile0056
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0056', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0057
     * @tc.name      testExpMediaFile0057
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0057', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0058
     * @tc.name      testExpMediaFile0058
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0058', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0059
     * @tc.name      testExpMediaFile0059
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0059', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0060
     * @tc.name      testExpMediaFile0060
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0060', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0061
     * @tc.name      testExpMediaFile0061
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0061', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0062
     * @tc.name      testExpMediaFile0062
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0062', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0063
     * @tc.name      testExpMediaFile0063
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0063', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0064
     * @tc.name      testExpMediaFile0064
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0064', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0065
     * @tc.name      testExpMediaFile0065
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0065', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0066
     * @tc.name      testExpMediaFile0066
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0066', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0067
     * @tc.name      testExpMediaFile0067
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0067', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0068
     * @tc.name      testExpMediaFile0068
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0068', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0069
     * @tc.name      testExpMediaFile0069
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0069', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0070
     * @tc.name      testExpMediaFile0070
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0070', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0071
     * @tc.name      testExpMediaFile0071
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0071', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0072
     * @tc.name      testExpMediaFile0072
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0072', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0073
     * @tc.name      testExpMediaFile0073
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0073', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0074
     * @tc.name      testExpMediaFile0074
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0074', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0075
     * @tc.name      testExpMediaFile0075
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0075', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0076
     * @tc.name      testExpMediaFile0076
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0076', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0077
     * @tc.name      testExpMediaFile0077
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0077', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0078
     * @tc.name      testExpMediaFile0078
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0078', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0079
     * @tc.name      testExpMediaFile0079
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0079', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0080
     * @tc.name      testExpMediaFile0080
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0080', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0081
     * @tc.name      testExpMediaFile0081
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0081', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0082
     * @tc.name      testExpMediaFile0082
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0082', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0083
     * @tc.name      testExpMediaFile0083
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0083', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0084
     * @tc.name      testExpMediaFile0084
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0084', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0085
     * @tc.name      testExpMediaFile0085
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0085', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0086
     * @tc.name      testExpMediaFile0086
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0086', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0087
     * @tc.name      testExpMediaFile0087
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0087', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0088
     * @tc.name      testExpMediaFile0088
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0088', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0089
     * @tc.name      testExpMediaFile0089
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0089', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0090
     * @tc.name      testExpMediaFile0090
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0090', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0091
     * @tc.name      testExpMediaFile0091
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0091', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0092
     * @tc.name      testExpMediaFile0092
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0092', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0093
     * @tc.name      testExpMediaFile0093
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0093', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0094
     * @tc.name      testExpMediaFile0094
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0094', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0095
     * @tc.name      testExpMediaFile0095
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0095', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0096
     * @tc.name      testExpMediaFile0096
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0096', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0097
     * @tc.name      testExpMediaFile0097
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0097', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0098
     * @tc.name      testExpMediaFile0098
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0098', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0099
     * @tc.name      testExpMediaFile0099
     * @tc.desc      Media asset test1.mp4 keeps its extension mp4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0099', 0, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('test1.mp4');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FILE_0100
     * @tc.name      testExpMediaFile0100
     * @tc.desc      Media asset subtitle.srt keeps its extension srt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMediaFile0100', 0, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      expect(name).assertEqual('subtitle.srt');
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(name.length).assertLarger(0);
    })
  })
}

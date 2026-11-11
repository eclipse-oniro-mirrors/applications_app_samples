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


export default function mediaMetadataExpandedTest() {
  describe('mediaMetadataExpandedTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0001
     * @tc.name      testMoreMediaMetadata0001
     * @tc.desc      Asset subtitle.srt is a subtitle resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      const kind: string = 'subtitle';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(kind).assertEqual('subtitle');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0002
     * @tc.name      testMoreMediaMetadata0002
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0003
     * @tc.name      testMoreMediaMetadata0003
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0004
     * @tc.name      testMoreMediaMetadata0004
     * @tc.desc      Asset subtitle.srt is a subtitle resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      const kind: string = 'subtitle';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(kind).assertEqual('subtitle');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0005
     * @tc.name      testMoreMediaMetadata0005
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0006
     * @tc.name      testMoreMediaMetadata0006
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0007
     * @tc.name      testMoreMediaMetadata0007
     * @tc.desc      Asset subtitle.srt is a subtitle resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      const kind: string = 'subtitle';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(kind).assertEqual('subtitle');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0008
     * @tc.name      testMoreMediaMetadata0008
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0009
     * @tc.name      testMoreMediaMetadata0009
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0010
     * @tc.name      testMoreMediaMetadata0010
     * @tc.desc      Asset subtitle.srt is a subtitle resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      const kind: string = 'subtitle';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(kind).assertEqual('subtitle');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0011
     * @tc.name      testMoreMediaMetadata0011
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0012
     * @tc.name      testMoreMediaMetadata0012
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0013
     * @tc.name      testMoreMediaMetadata0013
     * @tc.desc      Asset subtitle.srt is a subtitle resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      const kind: string = 'subtitle';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(kind).assertEqual('subtitle');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0014
     * @tc.name      testMoreMediaMetadata0014
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0015
     * @tc.name      testMoreMediaMetadata0015
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0016
     * @tc.name      testMoreMediaMetadata0016
     * @tc.desc      Asset subtitle.srt is a subtitle resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      const kind: string = 'subtitle';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(kind).assertEqual('subtitle');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0017
     * @tc.name      testMoreMediaMetadata0017
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0018
     * @tc.name      testMoreMediaMetadata0018
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0019
     * @tc.name      testMoreMediaMetadata0019
     * @tc.desc      Asset subtitle.srt is a subtitle resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      const kind: string = 'subtitle';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(kind).assertEqual('subtitle');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0020
     * @tc.name      testMoreMediaMetadata0020
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0021
     * @tc.name      testMoreMediaMetadata0021
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0022
     * @tc.name      testMoreMediaMetadata0022
     * @tc.desc      Asset subtitle.srt is a subtitle resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      const kind: string = 'subtitle';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(kind).assertEqual('subtitle');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0023
     * @tc.name      testMoreMediaMetadata0023
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0024
     * @tc.name      testMoreMediaMetadata0024
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0025
     * @tc.name      testMoreMediaMetadata0025
     * @tc.desc      Asset subtitle.srt is a subtitle resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      const kind: string = 'subtitle';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(kind).assertEqual('subtitle');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0026
     * @tc.name      testMoreMediaMetadata0026
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0027
     * @tc.name      testMoreMediaMetadata0027
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0028
     * @tc.name      testMoreMediaMetadata0028
     * @tc.desc      Asset subtitle.srt is a subtitle resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      const kind: string = 'subtitle';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(kind).assertEqual('subtitle');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0029
     * @tc.name      testMoreMediaMetadata0029
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0030
     * @tc.name      testMoreMediaMetadata0030
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0031
     * @tc.name      testMoreMediaMetadata0031
     * @tc.desc      Asset subtitle.srt is a subtitle resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      const kind: string = 'subtitle';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(kind).assertEqual('subtitle');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0032
     * @tc.name      testMoreMediaMetadata0032
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0033
     * @tc.name      testMoreMediaMetadata0033
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0034
     * @tc.name      testMoreMediaMetadata0034
     * @tc.desc      Asset subtitle.srt is a subtitle resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      const kind: string = 'subtitle';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(kind).assertEqual('subtitle');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0035
     * @tc.name      testMoreMediaMetadata0035
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0036
     * @tc.name      testMoreMediaMetadata0036
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0037
     * @tc.name      testMoreMediaMetadata0037
     * @tc.desc      Asset subtitle.srt is a subtitle resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      const kind: string = 'subtitle';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(kind).assertEqual('subtitle');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0038
     * @tc.name      testMoreMediaMetadata0038
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0039
     * @tc.name      testMoreMediaMetadata0039
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0040
     * @tc.name      testMoreMediaMetadata0040
     * @tc.desc      Asset subtitle.srt is a subtitle resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      const kind: string = 'subtitle';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(kind).assertEqual('subtitle');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0041
     * @tc.name      testMoreMediaMetadata0041
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0042
     * @tc.name      testMoreMediaMetadata0042
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0043
     * @tc.name      testMoreMediaMetadata0043
     * @tc.desc      Asset subtitle.srt is a subtitle resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      const kind: string = 'subtitle';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(kind).assertEqual('subtitle');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0044
     * @tc.name      testMoreMediaMetadata0044
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0045
     * @tc.name      testMoreMediaMetadata0045
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0046
     * @tc.name      testMoreMediaMetadata0046
     * @tc.desc      Asset subtitle.srt is a subtitle resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      const kind: string = 'subtitle';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(kind).assertEqual('subtitle');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0047
     * @tc.name      testMoreMediaMetadata0047
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0048
     * @tc.name      testMoreMediaMetadata0048
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0049
     * @tc.name      testMoreMediaMetadata0049
     * @tc.desc      Asset subtitle.srt is a subtitle resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      const kind: string = 'subtitle';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(kind).assertEqual('subtitle');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0050
     * @tc.name      testMoreMediaMetadata0050
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0051
     * @tc.name      testMoreMediaMetadata0051
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0052
     * @tc.name      testMoreMediaMetadata0052
     * @tc.desc      Asset subtitle.srt is a subtitle resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      const kind: string = 'subtitle';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(kind).assertEqual('subtitle');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0053
     * @tc.name      testMoreMediaMetadata0053
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0054
     * @tc.name      testMoreMediaMetadata0054
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0055
     * @tc.name      testMoreMediaMetadata0055
     * @tc.desc      Asset subtitle.srt is a subtitle resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      const kind: string = 'subtitle';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(kind).assertEqual('subtitle');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0056
     * @tc.name      testMoreMediaMetadata0056
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0057
     * @tc.name      testMoreMediaMetadata0057
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0058
     * @tc.name      testMoreMediaMetadata0058
     * @tc.desc      Asset subtitle.srt is a subtitle resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      const kind: string = 'subtitle';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(kind).assertEqual('subtitle');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0059
     * @tc.name      testMoreMediaMetadata0059
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0060
     * @tc.name      testMoreMediaMetadata0060
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0061
     * @tc.name      testMoreMediaMetadata0061
     * @tc.desc      Asset subtitle.srt is a subtitle resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      const kind: string = 'subtitle';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(kind).assertEqual('subtitle');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0062
     * @tc.name      testMoreMediaMetadata0062
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0063
     * @tc.name      testMoreMediaMetadata0063
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0064
     * @tc.name      testMoreMediaMetadata0064
     * @tc.desc      Asset subtitle.srt is a subtitle resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      const kind: string = 'subtitle';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(kind).assertEqual('subtitle');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0065
     * @tc.name      testMoreMediaMetadata0065
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0066
     * @tc.name      testMoreMediaMetadata0066
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0067
     * @tc.name      testMoreMediaMetadata0067
     * @tc.desc      Asset subtitle.srt is a subtitle resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      const kind: string = 'subtitle';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(kind).assertEqual('subtitle');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0068
     * @tc.name      testMoreMediaMetadata0068
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0069
     * @tc.name      testMoreMediaMetadata0069
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0070
     * @tc.name      testMoreMediaMetadata0070
     * @tc.desc      Asset subtitle.srt is a subtitle resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      const kind: string = 'subtitle';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(kind).assertEqual('subtitle');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0071
     * @tc.name      testMoreMediaMetadata0071
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0072
     * @tc.name      testMoreMediaMetadata0072
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0073
     * @tc.name      testMoreMediaMetadata0073
     * @tc.desc      Asset subtitle.srt is a subtitle resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      const kind: string = 'subtitle';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(kind).assertEqual('subtitle');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0074
     * @tc.name      testMoreMediaMetadata0074
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0075
     * @tc.name      testMoreMediaMetadata0075
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0076
     * @tc.name      testMoreMediaMetadata0076
     * @tc.desc      Asset subtitle.srt is a subtitle resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      const kind: string = 'subtitle';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(kind).assertEqual('subtitle');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0077
     * @tc.name      testMoreMediaMetadata0077
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0078
     * @tc.name      testMoreMediaMetadata0078
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0079
     * @tc.name      testMoreMediaMetadata0079
     * @tc.desc      Asset subtitle.srt is a subtitle resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      const kind: string = 'subtitle';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(kind).assertEqual('subtitle');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0080
     * @tc.name      testMoreMediaMetadata0080
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0081
     * @tc.name      testMoreMediaMetadata0081
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0082
     * @tc.name      testMoreMediaMetadata0082
     * @tc.desc      Asset subtitle.srt is a subtitle resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      const kind: string = 'subtitle';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(kind).assertEqual('subtitle');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0083
     * @tc.name      testMoreMediaMetadata0083
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0084
     * @tc.name      testMoreMediaMetadata0084
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0085
     * @tc.name      testMoreMediaMetadata0085
     * @tc.desc      Asset subtitle.srt is a subtitle resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      const kind: string = 'subtitle';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(kind).assertEqual('subtitle');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0086
     * @tc.name      testMoreMediaMetadata0086
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0087
     * @tc.name      testMoreMediaMetadata0087
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0088
     * @tc.name      testMoreMediaMetadata0088
     * @tc.desc      Asset subtitle.srt is a subtitle resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      const kind: string = 'subtitle';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(kind).assertEqual('subtitle');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0089
     * @tc.name      testMoreMediaMetadata0089
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0090
     * @tc.name      testMoreMediaMetadata0090
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0091
     * @tc.name      testMoreMediaMetadata0091
     * @tc.desc      Asset subtitle.srt is a subtitle resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      const kind: string = 'subtitle';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(kind).assertEqual('subtitle');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0092
     * @tc.name      testMoreMediaMetadata0092
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0093
     * @tc.name      testMoreMediaMetadata0093
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0094
     * @tc.name      testMoreMediaMetadata0094
     * @tc.desc      Asset subtitle.srt is a subtitle resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      const kind: string = 'subtitle';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(kind).assertEqual('subtitle');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0095
     * @tc.name      testMoreMediaMetadata0095
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0096
     * @tc.name      testMoreMediaMetadata0096
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0097
     * @tc.name      testMoreMediaMetadata0097
     * @tc.desc      Asset subtitle.srt is a subtitle resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      const kind: string = 'subtitle';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(kind).assertEqual('subtitle');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0098
     * @tc.name      testMoreMediaMetadata0098
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0099
     * @tc.name      testMoreMediaMetadata0099
     * @tc.desc      Asset test1.mp4 is a video resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const parts: string[] = name.split('.');
      const kind: string = 'video';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('mp4');
      expect(kind).assertEqual('video');
      expect(name.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_META_0100
     * @tc.name      testMoreMediaMetadata0100
     * @tc.desc      Asset subtitle.srt is a subtitle resource.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaMetadata0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'subtitle.srt';
      const parts: string[] = name.split('.');
      const kind: string = 'subtitle';
      expect(parts.length).assertEqual(2);
      expect(parts[1]).assertEqual('srt');
      expect(kind).assertEqual('subtitle');
      expect(name.length).assertLarger(0);
    })
  })
}

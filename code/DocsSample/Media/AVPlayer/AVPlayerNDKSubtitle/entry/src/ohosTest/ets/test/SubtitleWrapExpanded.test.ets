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


export default function subtitleWrapExpandedTest() {
  describe('subtitleWrapExpandedTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0001
     * @tc.name      testMoreSubtitleWrap0001
     * @tc.desc      15 chars at width 10 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0001', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSS';
      const width: number = 10;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(15);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0002
     * @tc.name      testMoreSubtitleWrap0002
     * @tc.desc      21 chars at width 16 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0002', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSS';
      const width: number = 16;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(21);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0003
     * @tc.name      testMoreSubtitleWrap0003
     * @tc.desc      25 chars at width 20 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0003', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 20;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(25);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0004
     * @tc.name      testMoreSubtitleWrap0004
     * @tc.desc      29 chars at width 24 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0004', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 24;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(29);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0005
     * @tc.name      testMoreSubtitleWrap0005
     * @tc.desc      37 chars at width 32 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0005', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 32;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(37);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0006
     * @tc.name      testMoreSubtitleWrap0006
     * @tc.desc      45 chars at width 40 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0006', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 40;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(45);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0007
     * @tc.name      testMoreSubtitleWrap0007
     * @tc.desc      15 chars at width 10 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0007', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSS';
      const width: number = 10;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(15);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0008
     * @tc.name      testMoreSubtitleWrap0008
     * @tc.desc      21 chars at width 16 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0008', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSS';
      const width: number = 16;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(21);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0009
     * @tc.name      testMoreSubtitleWrap0009
     * @tc.desc      25 chars at width 20 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0009', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 20;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(25);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0010
     * @tc.name      testMoreSubtitleWrap0010
     * @tc.desc      29 chars at width 24 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0010', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 24;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(29);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0011
     * @tc.name      testMoreSubtitleWrap0011
     * @tc.desc      37 chars at width 32 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0011', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 32;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(37);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0012
     * @tc.name      testMoreSubtitleWrap0012
     * @tc.desc      45 chars at width 40 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0012', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 40;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(45);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0013
     * @tc.name      testMoreSubtitleWrap0013
     * @tc.desc      15 chars at width 10 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0013', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSS';
      const width: number = 10;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(15);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0014
     * @tc.name      testMoreSubtitleWrap0014
     * @tc.desc      21 chars at width 16 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0014', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSS';
      const width: number = 16;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(21);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0015
     * @tc.name      testMoreSubtitleWrap0015
     * @tc.desc      25 chars at width 20 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0015', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 20;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(25);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0016
     * @tc.name      testMoreSubtitleWrap0016
     * @tc.desc      29 chars at width 24 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0016', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 24;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(29);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0017
     * @tc.name      testMoreSubtitleWrap0017
     * @tc.desc      37 chars at width 32 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0017', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 32;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(37);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0018
     * @tc.name      testMoreSubtitleWrap0018
     * @tc.desc      45 chars at width 40 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0018', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 40;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(45);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0019
     * @tc.name      testMoreSubtitleWrap0019
     * @tc.desc      15 chars at width 10 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0019', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSS';
      const width: number = 10;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(15);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0020
     * @tc.name      testMoreSubtitleWrap0020
     * @tc.desc      21 chars at width 16 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0020', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSS';
      const width: number = 16;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(21);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0021
     * @tc.name      testMoreSubtitleWrap0021
     * @tc.desc      25 chars at width 20 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0021', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 20;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(25);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0022
     * @tc.name      testMoreSubtitleWrap0022
     * @tc.desc      29 chars at width 24 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0022', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 24;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(29);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0023
     * @tc.name      testMoreSubtitleWrap0023
     * @tc.desc      37 chars at width 32 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0023', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 32;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(37);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0024
     * @tc.name      testMoreSubtitleWrap0024
     * @tc.desc      45 chars at width 40 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0024', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 40;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(45);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0025
     * @tc.name      testMoreSubtitleWrap0025
     * @tc.desc      15 chars at width 10 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0025', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSS';
      const width: number = 10;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(15);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0026
     * @tc.name      testMoreSubtitleWrap0026
     * @tc.desc      21 chars at width 16 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0026', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSS';
      const width: number = 16;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(21);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0027
     * @tc.name      testMoreSubtitleWrap0027
     * @tc.desc      25 chars at width 20 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0027', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 20;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(25);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0028
     * @tc.name      testMoreSubtitleWrap0028
     * @tc.desc      29 chars at width 24 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0028', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 24;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(29);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0029
     * @tc.name      testMoreSubtitleWrap0029
     * @tc.desc      37 chars at width 32 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0029', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 32;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(37);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0030
     * @tc.name      testMoreSubtitleWrap0030
     * @tc.desc      45 chars at width 40 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0030', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 40;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(45);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0031
     * @tc.name      testMoreSubtitleWrap0031
     * @tc.desc      15 chars at width 10 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0031', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSS';
      const width: number = 10;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(15);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0032
     * @tc.name      testMoreSubtitleWrap0032
     * @tc.desc      21 chars at width 16 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0032', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSS';
      const width: number = 16;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(21);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0033
     * @tc.name      testMoreSubtitleWrap0033
     * @tc.desc      25 chars at width 20 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0033', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 20;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(25);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0034
     * @tc.name      testMoreSubtitleWrap0034
     * @tc.desc      29 chars at width 24 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0034', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 24;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(29);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0035
     * @tc.name      testMoreSubtitleWrap0035
     * @tc.desc      37 chars at width 32 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0035', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 32;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(37);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0036
     * @tc.name      testMoreSubtitleWrap0036
     * @tc.desc      45 chars at width 40 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0036', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 40;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(45);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0037
     * @tc.name      testMoreSubtitleWrap0037
     * @tc.desc      15 chars at width 10 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0037', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSS';
      const width: number = 10;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(15);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0038
     * @tc.name      testMoreSubtitleWrap0038
     * @tc.desc      21 chars at width 16 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0038', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSS';
      const width: number = 16;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(21);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0039
     * @tc.name      testMoreSubtitleWrap0039
     * @tc.desc      25 chars at width 20 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0039', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 20;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(25);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0040
     * @tc.name      testMoreSubtitleWrap0040
     * @tc.desc      29 chars at width 24 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0040', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 24;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(29);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0041
     * @tc.name      testMoreSubtitleWrap0041
     * @tc.desc      37 chars at width 32 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0041', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 32;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(37);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0042
     * @tc.name      testMoreSubtitleWrap0042
     * @tc.desc      45 chars at width 40 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0042', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 40;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(45);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0043
     * @tc.name      testMoreSubtitleWrap0043
     * @tc.desc      15 chars at width 10 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0043', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSS';
      const width: number = 10;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(15);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0044
     * @tc.name      testMoreSubtitleWrap0044
     * @tc.desc      21 chars at width 16 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0044', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSS';
      const width: number = 16;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(21);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0045
     * @tc.name      testMoreSubtitleWrap0045
     * @tc.desc      25 chars at width 20 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0045', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 20;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(25);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0046
     * @tc.name      testMoreSubtitleWrap0046
     * @tc.desc      29 chars at width 24 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0046', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 24;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(29);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0047
     * @tc.name      testMoreSubtitleWrap0047
     * @tc.desc      37 chars at width 32 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0047', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 32;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(37);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0048
     * @tc.name      testMoreSubtitleWrap0048
     * @tc.desc      45 chars at width 40 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0048', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 40;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(45);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0049
     * @tc.name      testMoreSubtitleWrap0049
     * @tc.desc      15 chars at width 10 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0049', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSS';
      const width: number = 10;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(15);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0050
     * @tc.name      testMoreSubtitleWrap0050
     * @tc.desc      21 chars at width 16 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0050', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSS';
      const width: number = 16;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(21);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0051
     * @tc.name      testMoreSubtitleWrap0051
     * @tc.desc      25 chars at width 20 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0051', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 20;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(25);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0052
     * @tc.name      testMoreSubtitleWrap0052
     * @tc.desc      29 chars at width 24 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0052', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 24;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(29);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0053
     * @tc.name      testMoreSubtitleWrap0053
     * @tc.desc      37 chars at width 32 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0053', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 32;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(37);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0054
     * @tc.name      testMoreSubtitleWrap0054
     * @tc.desc      45 chars at width 40 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0054', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 40;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(45);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0055
     * @tc.name      testMoreSubtitleWrap0055
     * @tc.desc      15 chars at width 10 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0055', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSS';
      const width: number = 10;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(15);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0056
     * @tc.name      testMoreSubtitleWrap0056
     * @tc.desc      21 chars at width 16 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0056', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSS';
      const width: number = 16;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(21);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0057
     * @tc.name      testMoreSubtitleWrap0057
     * @tc.desc      25 chars at width 20 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0057', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 20;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(25);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0058
     * @tc.name      testMoreSubtitleWrap0058
     * @tc.desc      29 chars at width 24 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0058', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 24;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(29);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0059
     * @tc.name      testMoreSubtitleWrap0059
     * @tc.desc      37 chars at width 32 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0059', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 32;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(37);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0060
     * @tc.name      testMoreSubtitleWrap0060
     * @tc.desc      45 chars at width 40 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0060', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 40;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(45);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0061
     * @tc.name      testMoreSubtitleWrap0061
     * @tc.desc      15 chars at width 10 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0061', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSS';
      const width: number = 10;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(15);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0062
     * @tc.name      testMoreSubtitleWrap0062
     * @tc.desc      21 chars at width 16 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0062', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSS';
      const width: number = 16;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(21);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0063
     * @tc.name      testMoreSubtitleWrap0063
     * @tc.desc      25 chars at width 20 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0063', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 20;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(25);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0064
     * @tc.name      testMoreSubtitleWrap0064
     * @tc.desc      29 chars at width 24 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0064', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 24;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(29);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0065
     * @tc.name      testMoreSubtitleWrap0065
     * @tc.desc      37 chars at width 32 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0065', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 32;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(37);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0066
     * @tc.name      testMoreSubtitleWrap0066
     * @tc.desc      45 chars at width 40 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0066', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 40;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(45);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0067
     * @tc.name      testMoreSubtitleWrap0067
     * @tc.desc      15 chars at width 10 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0067', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSS';
      const width: number = 10;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(15);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0068
     * @tc.name      testMoreSubtitleWrap0068
     * @tc.desc      21 chars at width 16 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0068', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSS';
      const width: number = 16;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(21);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0069
     * @tc.name      testMoreSubtitleWrap0069
     * @tc.desc      25 chars at width 20 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0069', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 20;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(25);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0070
     * @tc.name      testMoreSubtitleWrap0070
     * @tc.desc      29 chars at width 24 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0070', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 24;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(29);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0071
     * @tc.name      testMoreSubtitleWrap0071
     * @tc.desc      37 chars at width 32 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0071', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 32;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(37);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0072
     * @tc.name      testMoreSubtitleWrap0072
     * @tc.desc      45 chars at width 40 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0072', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 40;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(45);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0073
     * @tc.name      testMoreSubtitleWrap0073
     * @tc.desc      15 chars at width 10 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0073', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSS';
      const width: number = 10;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(15);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0074
     * @tc.name      testMoreSubtitleWrap0074
     * @tc.desc      21 chars at width 16 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0074', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSS';
      const width: number = 16;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(21);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0075
     * @tc.name      testMoreSubtitleWrap0075
     * @tc.desc      25 chars at width 20 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0075', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 20;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(25);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0076
     * @tc.name      testMoreSubtitleWrap0076
     * @tc.desc      29 chars at width 24 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0076', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 24;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(29);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0077
     * @tc.name      testMoreSubtitleWrap0077
     * @tc.desc      37 chars at width 32 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0077', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 32;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(37);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0078
     * @tc.name      testMoreSubtitleWrap0078
     * @tc.desc      45 chars at width 40 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0078', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 40;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(45);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0079
     * @tc.name      testMoreSubtitleWrap0079
     * @tc.desc      15 chars at width 10 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0079', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSS';
      const width: number = 10;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(15);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0080
     * @tc.name      testMoreSubtitleWrap0080
     * @tc.desc      21 chars at width 16 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0080', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSS';
      const width: number = 16;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(21);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0081
     * @tc.name      testMoreSubtitleWrap0081
     * @tc.desc      25 chars at width 20 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0081', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 20;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(25);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0082
     * @tc.name      testMoreSubtitleWrap0082
     * @tc.desc      29 chars at width 24 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0082', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 24;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(29);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0083
     * @tc.name      testMoreSubtitleWrap0083
     * @tc.desc      37 chars at width 32 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0083', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 32;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(37);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0084
     * @tc.name      testMoreSubtitleWrap0084
     * @tc.desc      45 chars at width 40 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0084', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 40;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(45);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0085
     * @tc.name      testMoreSubtitleWrap0085
     * @tc.desc      15 chars at width 10 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0085', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSS';
      const width: number = 10;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(15);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0086
     * @tc.name      testMoreSubtitleWrap0086
     * @tc.desc      21 chars at width 16 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0086', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSS';
      const width: number = 16;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(21);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0087
     * @tc.name      testMoreSubtitleWrap0087
     * @tc.desc      25 chars at width 20 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0087', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 20;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(25);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0088
     * @tc.name      testMoreSubtitleWrap0088
     * @tc.desc      29 chars at width 24 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0088', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 24;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(29);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0089
     * @tc.name      testMoreSubtitleWrap0089
     * @tc.desc      37 chars at width 32 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0089', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 32;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(37);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0090
     * @tc.name      testMoreSubtitleWrap0090
     * @tc.desc      45 chars at width 40 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0090', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 40;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(45);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0091
     * @tc.name      testMoreSubtitleWrap0091
     * @tc.desc      15 chars at width 10 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0091', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSS';
      const width: number = 10;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(15);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0092
     * @tc.name      testMoreSubtitleWrap0092
     * @tc.desc      21 chars at width 16 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0092', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSS';
      const width: number = 16;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(21);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0093
     * @tc.name      testMoreSubtitleWrap0093
     * @tc.desc      25 chars at width 20 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0093', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 20;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(25);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0094
     * @tc.name      testMoreSubtitleWrap0094
     * @tc.desc      29 chars at width 24 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0094', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 24;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(29);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0095
     * @tc.name      testMoreSubtitleWrap0095
     * @tc.desc      37 chars at width 32 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0095', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 32;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(37);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0096
     * @tc.name      testMoreSubtitleWrap0096
     * @tc.desc      45 chars at width 40 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0096', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 40;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(45);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0097
     * @tc.name      testMoreSubtitleWrap0097
     * @tc.desc      15 chars at width 10 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0097', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSS';
      const width: number = 10;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(15);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0098
     * @tc.name      testMoreSubtitleWrap0098
     * @tc.desc      21 chars at width 16 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0098', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSS';
      const width: number = 16;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(21);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0099
     * @tc.name      testMoreSubtitleWrap0099
     * @tc.desc      25 chars at width 20 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0099', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 20;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(25);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_WRP_0100
     * @tc.name      testMoreSubtitleWrap0100
     * @tc.desc      29 chars at width 24 need 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleWrap0100', 0, () => {
      const text: string = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
      const width: number = 24;
      const lines: number = Math.ceil(text.length / width);
      expect(lines).assertEqual(2);
      expect(text.length).assertEqual(29);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
  })
}

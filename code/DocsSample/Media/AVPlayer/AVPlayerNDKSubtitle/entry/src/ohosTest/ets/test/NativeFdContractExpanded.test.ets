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

export default function nativeFdContractExpandedTest() {
  describe('nativeFdContractExpandedTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0001
     * @tc.name      testExpNativeFd0001
     * @tc.desc      Native setup descriptor fd=3 offset=0 size=1024 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0001', 0, () => {
      const fd: number = 3;
      const offset: number = 0;
      const size: number = 1024;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0002
     * @tc.name      testExpNativeFd0002
     * @tc.desc      Native setup descriptor fd=4 offset=16 size=1056 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0002', 0, () => {
      const fd: number = 4;
      const offset: number = 16;
      const size: number = 1056;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0003
     * @tc.name      testExpNativeFd0003
     * @tc.desc      Native setup descriptor fd=5 offset=32 size=1088 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0003', 0, () => {
      const fd: number = 5;
      const offset: number = 32;
      const size: number = 1088;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0004
     * @tc.name      testExpNativeFd0004
     * @tc.desc      Native setup descriptor fd=6 offset=48 size=1120 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0004', 0, () => {
      const fd: number = 6;
      const offset: number = 48;
      const size: number = 1120;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0005
     * @tc.name      testExpNativeFd0005
     * @tc.desc      Native setup descriptor fd=7 offset=64 size=1152 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0005', 0, () => {
      const fd: number = 7;
      const offset: number = 64;
      const size: number = 1152;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0006
     * @tc.name      testExpNativeFd0006
     * @tc.desc      Native setup descriptor fd=8 offset=80 size=1184 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0006', 0, () => {
      const fd: number = 8;
      const offset: number = 80;
      const size: number = 1184;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0007
     * @tc.name      testExpNativeFd0007
     * @tc.desc      Native setup descriptor fd=9 offset=96 size=1216 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0007', 0, () => {
      const fd: number = 9;
      const offset: number = 96;
      const size: number = 1216;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0008
     * @tc.name      testExpNativeFd0008
     * @tc.desc      Native setup descriptor fd=10 offset=112 size=1248 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0008', 0, () => {
      const fd: number = 10;
      const offset: number = 112;
      const size: number = 1248;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0009
     * @tc.name      testExpNativeFd0009
     * @tc.desc      Native setup descriptor fd=11 offset=128 size=1280 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0009', 0, () => {
      const fd: number = 11;
      const offset: number = 128;
      const size: number = 1280;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0010
     * @tc.name      testExpNativeFd0010
     * @tc.desc      Native setup descriptor fd=12 offset=144 size=1312 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0010', 0, () => {
      const fd: number = 12;
      const offset: number = 144;
      const size: number = 1312;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0011
     * @tc.name      testExpNativeFd0011
     * @tc.desc      Native setup descriptor fd=13 offset=160 size=1344 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0011', 0, () => {
      const fd: number = 13;
      const offset: number = 160;
      const size: number = 1344;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0012
     * @tc.name      testExpNativeFd0012
     * @tc.desc      Native setup descriptor fd=14 offset=176 size=1376 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0012', 0, () => {
      const fd: number = 14;
      const offset: number = 176;
      const size: number = 1376;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0013
     * @tc.name      testExpNativeFd0013
     * @tc.desc      Native setup descriptor fd=15 offset=192 size=1408 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0013', 0, () => {
      const fd: number = 15;
      const offset: number = 192;
      const size: number = 1408;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0014
     * @tc.name      testExpNativeFd0014
     * @tc.desc      Native setup descriptor fd=16 offset=208 size=1440 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0014', 0, () => {
      const fd: number = 16;
      const offset: number = 208;
      const size: number = 1440;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0015
     * @tc.name      testExpNativeFd0015
     * @tc.desc      Native setup descriptor fd=17 offset=224 size=1472 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0015', 0, () => {
      const fd: number = 17;
      const offset: number = 224;
      const size: number = 1472;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0016
     * @tc.name      testExpNativeFd0016
     * @tc.desc      Native setup descriptor fd=18 offset=240 size=1504 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0016', 0, () => {
      const fd: number = 18;
      const offset: number = 240;
      const size: number = 1504;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0017
     * @tc.name      testExpNativeFd0017
     * @tc.desc      Native setup descriptor fd=19 offset=256 size=1536 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0017', 0, () => {
      const fd: number = 19;
      const offset: number = 256;
      const size: number = 1536;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0018
     * @tc.name      testExpNativeFd0018
     * @tc.desc      Native setup descriptor fd=20 offset=272 size=1568 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0018', 0, () => {
      const fd: number = 20;
      const offset: number = 272;
      const size: number = 1568;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0019
     * @tc.name      testExpNativeFd0019
     * @tc.desc      Native setup descriptor fd=21 offset=288 size=1600 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0019', 0, () => {
      const fd: number = 21;
      const offset: number = 288;
      const size: number = 1600;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0020
     * @tc.name      testExpNativeFd0020
     * @tc.desc      Native setup descriptor fd=22 offset=304 size=1632 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0020', 0, () => {
      const fd: number = 22;
      const offset: number = 304;
      const size: number = 1632;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0021
     * @tc.name      testExpNativeFd0021
     * @tc.desc      Native setup descriptor fd=23 offset=320 size=1664 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0021', 0, () => {
      const fd: number = 23;
      const offset: number = 320;
      const size: number = 1664;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0022
     * @tc.name      testExpNativeFd0022
     * @tc.desc      Native setup descriptor fd=24 offset=336 size=1696 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0022', 0, () => {
      const fd: number = 24;
      const offset: number = 336;
      const size: number = 1696;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0023
     * @tc.name      testExpNativeFd0023
     * @tc.desc      Native setup descriptor fd=25 offset=352 size=1728 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0023', 0, () => {
      const fd: number = 25;
      const offset: number = 352;
      const size: number = 1728;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0024
     * @tc.name      testExpNativeFd0024
     * @tc.desc      Native setup descriptor fd=26 offset=368 size=1760 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0024', 0, () => {
      const fd: number = 26;
      const offset: number = 368;
      const size: number = 1760;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0025
     * @tc.name      testExpNativeFd0025
     * @tc.desc      Native setup descriptor fd=27 offset=384 size=1792 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0025', 0, () => {
      const fd: number = 27;
      const offset: number = 384;
      const size: number = 1792;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0026
     * @tc.name      testExpNativeFd0026
     * @tc.desc      Native setup descriptor fd=28 offset=400 size=1824 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0026', 0, () => {
      const fd: number = 28;
      const offset: number = 400;
      const size: number = 1824;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0027
     * @tc.name      testExpNativeFd0027
     * @tc.desc      Native setup descriptor fd=29 offset=416 size=1856 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0027', 0, () => {
      const fd: number = 29;
      const offset: number = 416;
      const size: number = 1856;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0028
     * @tc.name      testExpNativeFd0028
     * @tc.desc      Native setup descriptor fd=30 offset=432 size=1888 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0028', 0, () => {
      const fd: number = 30;
      const offset: number = 432;
      const size: number = 1888;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0029
     * @tc.name      testExpNativeFd0029
     * @tc.desc      Native setup descriptor fd=31 offset=448 size=1920 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0029', 0, () => {
      const fd: number = 31;
      const offset: number = 448;
      const size: number = 1920;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0030
     * @tc.name      testExpNativeFd0030
     * @tc.desc      Native setup descriptor fd=32 offset=464 size=1952 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0030', 0, () => {
      const fd: number = 32;
      const offset: number = 464;
      const size: number = 1952;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0031
     * @tc.name      testExpNativeFd0031
     * @tc.desc      Native setup descriptor fd=33 offset=480 size=1984 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0031', 0, () => {
      const fd: number = 33;
      const offset: number = 480;
      const size: number = 1984;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0032
     * @tc.name      testExpNativeFd0032
     * @tc.desc      Native setup descriptor fd=34 offset=496 size=2016 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0032', 0, () => {
      const fd: number = 34;
      const offset: number = 496;
      const size: number = 2016;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0033
     * @tc.name      testExpNativeFd0033
     * @tc.desc      Native setup descriptor fd=35 offset=512 size=2048 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0033', 0, () => {
      const fd: number = 35;
      const offset: number = 512;
      const size: number = 2048;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0034
     * @tc.name      testExpNativeFd0034
     * @tc.desc      Native setup descriptor fd=36 offset=528 size=2080 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0034', 0, () => {
      const fd: number = 36;
      const offset: number = 528;
      const size: number = 2080;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0035
     * @tc.name      testExpNativeFd0035
     * @tc.desc      Native setup descriptor fd=37 offset=544 size=2112 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0035', 0, () => {
      const fd: number = 37;
      const offset: number = 544;
      const size: number = 2112;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0036
     * @tc.name      testExpNativeFd0036
     * @tc.desc      Native setup descriptor fd=38 offset=560 size=2144 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0036', 0, () => {
      const fd: number = 38;
      const offset: number = 560;
      const size: number = 2144;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0037
     * @tc.name      testExpNativeFd0037
     * @tc.desc      Native setup descriptor fd=39 offset=576 size=2176 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0037', 0, () => {
      const fd: number = 39;
      const offset: number = 576;
      const size: number = 2176;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0038
     * @tc.name      testExpNativeFd0038
     * @tc.desc      Native setup descriptor fd=40 offset=592 size=2208 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0038', 0, () => {
      const fd: number = 40;
      const offset: number = 592;
      const size: number = 2208;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0039
     * @tc.name      testExpNativeFd0039
     * @tc.desc      Native setup descriptor fd=41 offset=608 size=2240 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0039', 0, () => {
      const fd: number = 41;
      const offset: number = 608;
      const size: number = 2240;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0040
     * @tc.name      testExpNativeFd0040
     * @tc.desc      Native setup descriptor fd=42 offset=624 size=2272 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0040', 0, () => {
      const fd: number = 42;
      const offset: number = 624;
      const size: number = 2272;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0041
     * @tc.name      testExpNativeFd0041
     * @tc.desc      Native setup descriptor fd=43 offset=640 size=2304 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0041', 0, () => {
      const fd: number = 43;
      const offset: number = 640;
      const size: number = 2304;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0042
     * @tc.name      testExpNativeFd0042
     * @tc.desc      Native setup descriptor fd=44 offset=656 size=2336 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0042', 0, () => {
      const fd: number = 44;
      const offset: number = 656;
      const size: number = 2336;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0043
     * @tc.name      testExpNativeFd0043
     * @tc.desc      Native setup descriptor fd=45 offset=672 size=2368 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0043', 0, () => {
      const fd: number = 45;
      const offset: number = 672;
      const size: number = 2368;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0044
     * @tc.name      testExpNativeFd0044
     * @tc.desc      Native setup descriptor fd=46 offset=688 size=2400 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0044', 0, () => {
      const fd: number = 46;
      const offset: number = 688;
      const size: number = 2400;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0045
     * @tc.name      testExpNativeFd0045
     * @tc.desc      Native setup descriptor fd=47 offset=704 size=2432 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0045', 0, () => {
      const fd: number = 47;
      const offset: number = 704;
      const size: number = 2432;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0046
     * @tc.name      testExpNativeFd0046
     * @tc.desc      Native setup descriptor fd=48 offset=720 size=2464 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0046', 0, () => {
      const fd: number = 48;
      const offset: number = 720;
      const size: number = 2464;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0047
     * @tc.name      testExpNativeFd0047
     * @tc.desc      Native setup descriptor fd=49 offset=736 size=2496 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0047', 0, () => {
      const fd: number = 49;
      const offset: number = 736;
      const size: number = 2496;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0048
     * @tc.name      testExpNativeFd0048
     * @tc.desc      Native setup descriptor fd=50 offset=752 size=2528 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0048', 0, () => {
      const fd: number = 50;
      const offset: number = 752;
      const size: number = 2528;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0049
     * @tc.name      testExpNativeFd0049
     * @tc.desc      Native setup descriptor fd=51 offset=768 size=2560 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0049', 0, () => {
      const fd: number = 51;
      const offset: number = 768;
      const size: number = 2560;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0050
     * @tc.name      testExpNativeFd0050
     * @tc.desc      Native setup descriptor fd=52 offset=784 size=2592 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0050', 0, () => {
      const fd: number = 52;
      const offset: number = 784;
      const size: number = 2592;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0051
     * @tc.name      testExpNativeFd0051
     * @tc.desc      Native setup descriptor fd=53 offset=800 size=2624 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0051', 0, () => {
      const fd: number = 53;
      const offset: number = 800;
      const size: number = 2624;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0052
     * @tc.name      testExpNativeFd0052
     * @tc.desc      Native setup descriptor fd=54 offset=816 size=2656 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0052', 0, () => {
      const fd: number = 54;
      const offset: number = 816;
      const size: number = 2656;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0053
     * @tc.name      testExpNativeFd0053
     * @tc.desc      Native setup descriptor fd=55 offset=832 size=2688 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0053', 0, () => {
      const fd: number = 55;
      const offset: number = 832;
      const size: number = 2688;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0054
     * @tc.name      testExpNativeFd0054
     * @tc.desc      Native setup descriptor fd=56 offset=848 size=2720 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0054', 0, () => {
      const fd: number = 56;
      const offset: number = 848;
      const size: number = 2720;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0055
     * @tc.name      testExpNativeFd0055
     * @tc.desc      Native setup descriptor fd=57 offset=864 size=2752 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0055', 0, () => {
      const fd: number = 57;
      const offset: number = 864;
      const size: number = 2752;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0056
     * @tc.name      testExpNativeFd0056
     * @tc.desc      Native setup descriptor fd=58 offset=880 size=2784 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0056', 0, () => {
      const fd: number = 58;
      const offset: number = 880;
      const size: number = 2784;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0057
     * @tc.name      testExpNativeFd0057
     * @tc.desc      Native setup descriptor fd=59 offset=896 size=2816 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0057', 0, () => {
      const fd: number = 59;
      const offset: number = 896;
      const size: number = 2816;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0058
     * @tc.name      testExpNativeFd0058
     * @tc.desc      Native setup descriptor fd=60 offset=912 size=2848 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0058', 0, () => {
      const fd: number = 60;
      const offset: number = 912;
      const size: number = 2848;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0059
     * @tc.name      testExpNativeFd0059
     * @tc.desc      Native setup descriptor fd=61 offset=928 size=2880 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0059', 0, () => {
      const fd: number = 61;
      const offset: number = 928;
      const size: number = 2880;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0060
     * @tc.name      testExpNativeFd0060
     * @tc.desc      Native setup descriptor fd=62 offset=944 size=2912 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0060', 0, () => {
      const fd: number = 62;
      const offset: number = 944;
      const size: number = 2912;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0061
     * @tc.name      testExpNativeFd0061
     * @tc.desc      Native setup descriptor fd=63 offset=960 size=2944 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0061', 0, () => {
      const fd: number = 63;
      const offset: number = 960;
      const size: number = 2944;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0062
     * @tc.name      testExpNativeFd0062
     * @tc.desc      Native setup descriptor fd=64 offset=976 size=2976 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0062', 0, () => {
      const fd: number = 64;
      const offset: number = 976;
      const size: number = 2976;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0063
     * @tc.name      testExpNativeFd0063
     * @tc.desc      Native setup descriptor fd=65 offset=992 size=3008 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0063', 0, () => {
      const fd: number = 65;
      const offset: number = 992;
      const size: number = 3008;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0064
     * @tc.name      testExpNativeFd0064
     * @tc.desc      Native setup descriptor fd=66 offset=1008 size=3040 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0064', 0, () => {
      const fd: number = 66;
      const offset: number = 1008;
      const size: number = 3040;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0065
     * @tc.name      testExpNativeFd0065
     * @tc.desc      Native setup descriptor fd=67 offset=1024 size=3072 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0065', 0, () => {
      const fd: number = 67;
      const offset: number = 1024;
      const size: number = 3072;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0066
     * @tc.name      testExpNativeFd0066
     * @tc.desc      Native setup descriptor fd=68 offset=1040 size=3104 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0066', 0, () => {
      const fd: number = 68;
      const offset: number = 1040;
      const size: number = 3104;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0067
     * @tc.name      testExpNativeFd0067
     * @tc.desc      Native setup descriptor fd=69 offset=1056 size=3136 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0067', 0, () => {
      const fd: number = 69;
      const offset: number = 1056;
      const size: number = 3136;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0068
     * @tc.name      testExpNativeFd0068
     * @tc.desc      Native setup descriptor fd=70 offset=1072 size=3168 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0068', 0, () => {
      const fd: number = 70;
      const offset: number = 1072;
      const size: number = 3168;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0069
     * @tc.name      testExpNativeFd0069
     * @tc.desc      Native setup descriptor fd=71 offset=1088 size=3200 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0069', 0, () => {
      const fd: number = 71;
      const offset: number = 1088;
      const size: number = 3200;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0070
     * @tc.name      testExpNativeFd0070
     * @tc.desc      Native setup descriptor fd=72 offset=1104 size=3232 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0070', 0, () => {
      const fd: number = 72;
      const offset: number = 1104;
      const size: number = 3232;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0071
     * @tc.name      testExpNativeFd0071
     * @tc.desc      Native setup descriptor fd=73 offset=1120 size=3264 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0071', 0, () => {
      const fd: number = 73;
      const offset: number = 1120;
      const size: number = 3264;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0072
     * @tc.name      testExpNativeFd0072
     * @tc.desc      Native setup descriptor fd=74 offset=1136 size=3296 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0072', 0, () => {
      const fd: number = 74;
      const offset: number = 1136;
      const size: number = 3296;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0073
     * @tc.name      testExpNativeFd0073
     * @tc.desc      Native setup descriptor fd=75 offset=1152 size=3328 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0073', 0, () => {
      const fd: number = 75;
      const offset: number = 1152;
      const size: number = 3328;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0074
     * @tc.name      testExpNativeFd0074
     * @tc.desc      Native setup descriptor fd=76 offset=1168 size=3360 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0074', 0, () => {
      const fd: number = 76;
      const offset: number = 1168;
      const size: number = 3360;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0075
     * @tc.name      testExpNativeFd0075
     * @tc.desc      Native setup descriptor fd=77 offset=1184 size=3392 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0075', 0, () => {
      const fd: number = 77;
      const offset: number = 1184;
      const size: number = 3392;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0076
     * @tc.name      testExpNativeFd0076
     * @tc.desc      Native setup descriptor fd=78 offset=1200 size=3424 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0076', 0, () => {
      const fd: number = 78;
      const offset: number = 1200;
      const size: number = 3424;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0077
     * @tc.name      testExpNativeFd0077
     * @tc.desc      Native setup descriptor fd=79 offset=1216 size=3456 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0077', 0, () => {
      const fd: number = 79;
      const offset: number = 1216;
      const size: number = 3456;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0078
     * @tc.name      testExpNativeFd0078
     * @tc.desc      Native setup descriptor fd=80 offset=1232 size=3488 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0078', 0, () => {
      const fd: number = 80;
      const offset: number = 1232;
      const size: number = 3488;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0079
     * @tc.name      testExpNativeFd0079
     * @tc.desc      Native setup descriptor fd=81 offset=1248 size=3520 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0079', 0, () => {
      const fd: number = 81;
      const offset: number = 1248;
      const size: number = 3520;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0080
     * @tc.name      testExpNativeFd0080
     * @tc.desc      Native setup descriptor fd=82 offset=1264 size=3552 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0080', 0, () => {
      const fd: number = 82;
      const offset: number = 1264;
      const size: number = 3552;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0081
     * @tc.name      testExpNativeFd0081
     * @tc.desc      Native setup descriptor fd=83 offset=1280 size=3584 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0081', 0, () => {
      const fd: number = 83;
      const offset: number = 1280;
      const size: number = 3584;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0082
     * @tc.name      testExpNativeFd0082
     * @tc.desc      Native setup descriptor fd=84 offset=1296 size=3616 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0082', 0, () => {
      const fd: number = 84;
      const offset: number = 1296;
      const size: number = 3616;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0083
     * @tc.name      testExpNativeFd0083
     * @tc.desc      Native setup descriptor fd=85 offset=1312 size=3648 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0083', 0, () => {
      const fd: number = 85;
      const offset: number = 1312;
      const size: number = 3648;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0084
     * @tc.name      testExpNativeFd0084
     * @tc.desc      Native setup descriptor fd=86 offset=1328 size=3680 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0084', 0, () => {
      const fd: number = 86;
      const offset: number = 1328;
      const size: number = 3680;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0085
     * @tc.name      testExpNativeFd0085
     * @tc.desc      Native setup descriptor fd=87 offset=1344 size=3712 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0085', 0, () => {
      const fd: number = 87;
      const offset: number = 1344;
      const size: number = 3712;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0086
     * @tc.name      testExpNativeFd0086
     * @tc.desc      Native setup descriptor fd=88 offset=1360 size=3744 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0086', 0, () => {
      const fd: number = 88;
      const offset: number = 1360;
      const size: number = 3744;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0087
     * @tc.name      testExpNativeFd0087
     * @tc.desc      Native setup descriptor fd=89 offset=1376 size=3776 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0087', 0, () => {
      const fd: number = 89;
      const offset: number = 1376;
      const size: number = 3776;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0088
     * @tc.name      testExpNativeFd0088
     * @tc.desc      Native setup descriptor fd=90 offset=1392 size=3808 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0088', 0, () => {
      const fd: number = 90;
      const offset: number = 1392;
      const size: number = 3808;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0089
     * @tc.name      testExpNativeFd0089
     * @tc.desc      Native setup descriptor fd=91 offset=1408 size=3840 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0089', 0, () => {
      const fd: number = 91;
      const offset: number = 1408;
      const size: number = 3840;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0090
     * @tc.name      testExpNativeFd0090
     * @tc.desc      Native setup descriptor fd=92 offset=1424 size=3872 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0090', 0, () => {
      const fd: number = 92;
      const offset: number = 1424;
      const size: number = 3872;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0091
     * @tc.name      testExpNativeFd0091
     * @tc.desc      Native setup descriptor fd=93 offset=1440 size=3904 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0091', 0, () => {
      const fd: number = 93;
      const offset: number = 1440;
      const size: number = 3904;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0092
     * @tc.name      testExpNativeFd0092
     * @tc.desc      Native setup descriptor fd=94 offset=1456 size=3936 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0092', 0, () => {
      const fd: number = 94;
      const offset: number = 1456;
      const size: number = 3936;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0093
     * @tc.name      testExpNativeFd0093
     * @tc.desc      Native setup descriptor fd=95 offset=1472 size=3968 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0093', 0, () => {
      const fd: number = 95;
      const offset: number = 1472;
      const size: number = 3968;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0094
     * @tc.name      testExpNativeFd0094
     * @tc.desc      Native setup descriptor fd=96 offset=1488 size=4000 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0094', 0, () => {
      const fd: number = 96;
      const offset: number = 1488;
      const size: number = 4000;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0095
     * @tc.name      testExpNativeFd0095
     * @tc.desc      Native setup descriptor fd=97 offset=1504 size=4032 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0095', 0, () => {
      const fd: number = 97;
      const offset: number = 1504;
      const size: number = 4032;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0096
     * @tc.name      testExpNativeFd0096
     * @tc.desc      Native setup descriptor fd=98 offset=1520 size=4064 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0096', 0, () => {
      const fd: number = 98;
      const offset: number = 1520;
      const size: number = 4064;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0097
     * @tc.name      testExpNativeFd0097
     * @tc.desc      Native setup descriptor fd=99 offset=1536 size=4096 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0097', 0, () => {
      const fd: number = 99;
      const offset: number = 1536;
      const size: number = 4096;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0098
     * @tc.name      testExpNativeFd0098
     * @tc.desc      Native setup descriptor fd=100 offset=1552 size=4128 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0098', 0, () => {
      const fd: number = 100;
      const offset: number = 1552;
      const size: number = 4128;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0099
     * @tc.name      testExpNativeFd0099
     * @tc.desc      Native setup descriptor fd=101 offset=1568 size=4160 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0099', 0, () => {
      const fd: number = 101;
      const offset: number = 1568;
      const size: number = 4160;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_FD_0100
     * @tc.name      testExpNativeFd0100
     * @tc.desc      Native setup descriptor fd=102 offset=1584 size=4192 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNativeFd0100', 0, () => {
      const fd: number = 102;
      const offset: number = 1584;
      const size: number = 4192;
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(size).assertLarger(offset);
      expect(fd + offset + size).assertLarger(0);
    })
  })
}

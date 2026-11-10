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


export default function fileDescriptor8wTest() {
  describe('fileDescriptor8wTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(() => {
          resolve();
        }, 10);
      });
    });

    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0001
     * @tc.name      test8wFileDescriptor0001
     * @tc.desc      Descriptor fd=1 offset=0 size=1024 leaves 1024 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0001', 0, () => {
      const fd: number = 1;
      const offset: number = 0;
      const size: number = 1024;
      const readable: number = size - offset;
      expect(readable).assertEqual(1024);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0002
     * @tc.name      test8wFileDescriptor0002
     * @tc.desc      Descriptor fd=2 offset=8 size=1040 leaves 1032 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0002', 0, () => {
      const fd: number = 2;
      const offset: number = 8;
      const size: number = 1040;
      const readable: number = size - offset;
      expect(readable).assertEqual(1032);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0003
     * @tc.name      test8wFileDescriptor0003
     * @tc.desc      Descriptor fd=3 offset=16 size=1056 leaves 1040 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0003', 0, () => {
      const fd: number = 3;
      const offset: number = 16;
      const size: number = 1056;
      const readable: number = size - offset;
      expect(readable).assertEqual(1040);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0004
     * @tc.name      test8wFileDescriptor0004
     * @tc.desc      Descriptor fd=4 offset=24 size=1072 leaves 1048 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0004', 0, () => {
      const fd: number = 4;
      const offset: number = 24;
      const size: number = 1072;
      const readable: number = size - offset;
      expect(readable).assertEqual(1048);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0005
     * @tc.name      test8wFileDescriptor0005
     * @tc.desc      Descriptor fd=5 offset=32 size=1088 leaves 1056 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0005', 0, () => {
      const fd: number = 5;
      const offset: number = 32;
      const size: number = 1088;
      const readable: number = size - offset;
      expect(readable).assertEqual(1056);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0006
     * @tc.name      test8wFileDescriptor0006
     * @tc.desc      Descriptor fd=6 offset=40 size=1104 leaves 1064 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0006', 0, () => {
      const fd: number = 6;
      const offset: number = 40;
      const size: number = 1104;
      const readable: number = size - offset;
      expect(readable).assertEqual(1064);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0007
     * @tc.name      test8wFileDescriptor0007
     * @tc.desc      Descriptor fd=7 offset=48 size=1120 leaves 1072 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0007', 0, () => {
      const fd: number = 7;
      const offset: number = 48;
      const size: number = 1120;
      const readable: number = size - offset;
      expect(readable).assertEqual(1072);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0008
     * @tc.name      test8wFileDescriptor0008
     * @tc.desc      Descriptor fd=8 offset=56 size=1136 leaves 1080 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0008', 0, () => {
      const fd: number = 8;
      const offset: number = 56;
      const size: number = 1136;
      const readable: number = size - offset;
      expect(readable).assertEqual(1080);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0009
     * @tc.name      test8wFileDescriptor0009
     * @tc.desc      Descriptor fd=9 offset=64 size=1152 leaves 1088 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0009', 0, () => {
      const fd: number = 9;
      const offset: number = 64;
      const size: number = 1152;
      const readable: number = size - offset;
      expect(readable).assertEqual(1088);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0010
     * @tc.name      test8wFileDescriptor0010
     * @tc.desc      Descriptor fd=10 offset=72 size=1168 leaves 1096 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0010', 0, () => {
      const fd: number = 10;
      const offset: number = 72;
      const size: number = 1168;
      const readable: number = size - offset;
      expect(readable).assertEqual(1096);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0011
     * @tc.name      test8wFileDescriptor0011
     * @tc.desc      Descriptor fd=11 offset=80 size=1184 leaves 1104 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0011', 0, () => {
      const fd: number = 11;
      const offset: number = 80;
      const size: number = 1184;
      const readable: number = size - offset;
      expect(readable).assertEqual(1104);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0012
     * @tc.name      test8wFileDescriptor0012
     * @tc.desc      Descriptor fd=12 offset=88 size=1200 leaves 1112 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0012', 0, () => {
      const fd: number = 12;
      const offset: number = 88;
      const size: number = 1200;
      const readable: number = size - offset;
      expect(readable).assertEqual(1112);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0013
     * @tc.name      test8wFileDescriptor0013
     * @tc.desc      Descriptor fd=13 offset=96 size=1216 leaves 1120 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0013', 0, () => {
      const fd: number = 13;
      const offset: number = 96;
      const size: number = 1216;
      const readable: number = size - offset;
      expect(readable).assertEqual(1120);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0014
     * @tc.name      test8wFileDescriptor0014
     * @tc.desc      Descriptor fd=14 offset=104 size=1232 leaves 1128 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0014', 0, () => {
      const fd: number = 14;
      const offset: number = 104;
      const size: number = 1232;
      const readable: number = size - offset;
      expect(readable).assertEqual(1128);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0015
     * @tc.name      test8wFileDescriptor0015
     * @tc.desc      Descriptor fd=15 offset=112 size=1248 leaves 1136 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0015', 0, () => {
      const fd: number = 15;
      const offset: number = 112;
      const size: number = 1248;
      const readable: number = size - offset;
      expect(readable).assertEqual(1136);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0016
     * @tc.name      test8wFileDescriptor0016
     * @tc.desc      Descriptor fd=16 offset=120 size=1264 leaves 1144 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0016', 0, () => {
      const fd: number = 16;
      const offset: number = 120;
      const size: number = 1264;
      const readable: number = size - offset;
      expect(readable).assertEqual(1144);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0017
     * @tc.name      test8wFileDescriptor0017
     * @tc.desc      Descriptor fd=17 offset=128 size=1280 leaves 1152 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0017', 0, () => {
      const fd: number = 17;
      const offset: number = 128;
      const size: number = 1280;
      const readable: number = size - offset;
      expect(readable).assertEqual(1152);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0018
     * @tc.name      test8wFileDescriptor0018
     * @tc.desc      Descriptor fd=18 offset=136 size=1296 leaves 1160 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0018', 0, () => {
      const fd: number = 18;
      const offset: number = 136;
      const size: number = 1296;
      const readable: number = size - offset;
      expect(readable).assertEqual(1160);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0019
     * @tc.name      test8wFileDescriptor0019
     * @tc.desc      Descriptor fd=19 offset=144 size=1312 leaves 1168 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0019', 0, () => {
      const fd: number = 19;
      const offset: number = 144;
      const size: number = 1312;
      const readable: number = size - offset;
      expect(readable).assertEqual(1168);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0020
     * @tc.name      test8wFileDescriptor0020
     * @tc.desc      Descriptor fd=20 offset=152 size=1328 leaves 1176 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0020', 0, () => {
      const fd: number = 20;
      const offset: number = 152;
      const size: number = 1328;
      const readable: number = size - offset;
      expect(readable).assertEqual(1176);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0021
     * @tc.name      test8wFileDescriptor0021
     * @tc.desc      Descriptor fd=21 offset=160 size=1344 leaves 1184 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0021', 0, () => {
      const fd: number = 21;
      const offset: number = 160;
      const size: number = 1344;
      const readable: number = size - offset;
      expect(readable).assertEqual(1184);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0022
     * @tc.name      test8wFileDescriptor0022
     * @tc.desc      Descriptor fd=22 offset=168 size=1360 leaves 1192 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0022', 0, () => {
      const fd: number = 22;
      const offset: number = 168;
      const size: number = 1360;
      const readable: number = size - offset;
      expect(readable).assertEqual(1192);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0023
     * @tc.name      test8wFileDescriptor0023
     * @tc.desc      Descriptor fd=23 offset=176 size=1376 leaves 1200 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0023', 0, () => {
      const fd: number = 23;
      const offset: number = 176;
      const size: number = 1376;
      const readable: number = size - offset;
      expect(readable).assertEqual(1200);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0024
     * @tc.name      test8wFileDescriptor0024
     * @tc.desc      Descriptor fd=24 offset=184 size=1392 leaves 1208 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0024', 0, () => {
      const fd: number = 24;
      const offset: number = 184;
      const size: number = 1392;
      const readable: number = size - offset;
      expect(readable).assertEqual(1208);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0025
     * @tc.name      test8wFileDescriptor0025
     * @tc.desc      Descriptor fd=25 offset=192 size=1408 leaves 1216 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0025', 0, () => {
      const fd: number = 25;
      const offset: number = 192;
      const size: number = 1408;
      const readable: number = size - offset;
      expect(readable).assertEqual(1216);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0026
     * @tc.name      test8wFileDescriptor0026
     * @tc.desc      Descriptor fd=26 offset=200 size=1424 leaves 1224 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0026', 0, () => {
      const fd: number = 26;
      const offset: number = 200;
      const size: number = 1424;
      const readable: number = size - offset;
      expect(readable).assertEqual(1224);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0027
     * @tc.name      test8wFileDescriptor0027
     * @tc.desc      Descriptor fd=27 offset=208 size=1440 leaves 1232 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0027', 0, () => {
      const fd: number = 27;
      const offset: number = 208;
      const size: number = 1440;
      const readable: number = size - offset;
      expect(readable).assertEqual(1232);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0028
     * @tc.name      test8wFileDescriptor0028
     * @tc.desc      Descriptor fd=28 offset=216 size=1456 leaves 1240 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0028', 0, () => {
      const fd: number = 28;
      const offset: number = 216;
      const size: number = 1456;
      const readable: number = size - offset;
      expect(readable).assertEqual(1240);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0029
     * @tc.name      test8wFileDescriptor0029
     * @tc.desc      Descriptor fd=29 offset=224 size=1472 leaves 1248 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0029', 0, () => {
      const fd: number = 29;
      const offset: number = 224;
      const size: number = 1472;
      const readable: number = size - offset;
      expect(readable).assertEqual(1248);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0030
     * @tc.name      test8wFileDescriptor0030
     * @tc.desc      Descriptor fd=30 offset=232 size=1488 leaves 1256 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0030', 0, () => {
      const fd: number = 30;
      const offset: number = 232;
      const size: number = 1488;
      const readable: number = size - offset;
      expect(readable).assertEqual(1256);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0031
     * @tc.name      test8wFileDescriptor0031
     * @tc.desc      Descriptor fd=31 offset=240 size=1504 leaves 1264 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0031', 0, () => {
      const fd: number = 31;
      const offset: number = 240;
      const size: number = 1504;
      const readable: number = size - offset;
      expect(readable).assertEqual(1264);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0032
     * @tc.name      test8wFileDescriptor0032
     * @tc.desc      Descriptor fd=32 offset=248 size=1520 leaves 1272 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0032', 0, () => {
      const fd: number = 32;
      const offset: number = 248;
      const size: number = 1520;
      const readable: number = size - offset;
      expect(readable).assertEqual(1272);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0033
     * @tc.name      test8wFileDescriptor0033
     * @tc.desc      Descriptor fd=33 offset=256 size=1536 leaves 1280 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0033', 0, () => {
      const fd: number = 33;
      const offset: number = 256;
      const size: number = 1536;
      const readable: number = size - offset;
      expect(readable).assertEqual(1280);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0034
     * @tc.name      test8wFileDescriptor0034
     * @tc.desc      Descriptor fd=34 offset=264 size=1552 leaves 1288 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0034', 0, () => {
      const fd: number = 34;
      const offset: number = 264;
      const size: number = 1552;
      const readable: number = size - offset;
      expect(readable).assertEqual(1288);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0035
     * @tc.name      test8wFileDescriptor0035
     * @tc.desc      Descriptor fd=35 offset=272 size=1568 leaves 1296 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0035', 0, () => {
      const fd: number = 35;
      const offset: number = 272;
      const size: number = 1568;
      const readable: number = size - offset;
      expect(readable).assertEqual(1296);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0036
     * @tc.name      test8wFileDescriptor0036
     * @tc.desc      Descriptor fd=36 offset=280 size=1584 leaves 1304 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0036', 0, () => {
      const fd: number = 36;
      const offset: number = 280;
      const size: number = 1584;
      const readable: number = size - offset;
      expect(readable).assertEqual(1304);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0037
     * @tc.name      test8wFileDescriptor0037
     * @tc.desc      Descriptor fd=37 offset=288 size=1600 leaves 1312 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0037', 0, () => {
      const fd: number = 37;
      const offset: number = 288;
      const size: number = 1600;
      const readable: number = size - offset;
      expect(readable).assertEqual(1312);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0038
     * @tc.name      test8wFileDescriptor0038
     * @tc.desc      Descriptor fd=38 offset=296 size=1616 leaves 1320 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0038', 0, () => {
      const fd: number = 38;
      const offset: number = 296;
      const size: number = 1616;
      const readable: number = size - offset;
      expect(readable).assertEqual(1320);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0039
     * @tc.name      test8wFileDescriptor0039
     * @tc.desc      Descriptor fd=39 offset=304 size=1632 leaves 1328 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0039', 0, () => {
      const fd: number = 39;
      const offset: number = 304;
      const size: number = 1632;
      const readable: number = size - offset;
      expect(readable).assertEqual(1328);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0040
     * @tc.name      test8wFileDescriptor0040
     * @tc.desc      Descriptor fd=40 offset=312 size=1648 leaves 1336 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0040', 0, () => {
      const fd: number = 40;
      const offset: number = 312;
      const size: number = 1648;
      const readable: number = size - offset;
      expect(readable).assertEqual(1336);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0041
     * @tc.name      test8wFileDescriptor0041
     * @tc.desc      Descriptor fd=41 offset=320 size=1664 leaves 1344 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0041', 0, () => {
      const fd: number = 41;
      const offset: number = 320;
      const size: number = 1664;
      const readable: number = size - offset;
      expect(readable).assertEqual(1344);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0042
     * @tc.name      test8wFileDescriptor0042
     * @tc.desc      Descriptor fd=42 offset=328 size=1680 leaves 1352 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0042', 0, () => {
      const fd: number = 42;
      const offset: number = 328;
      const size: number = 1680;
      const readable: number = size - offset;
      expect(readable).assertEqual(1352);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0043
     * @tc.name      test8wFileDescriptor0043
     * @tc.desc      Descriptor fd=43 offset=336 size=1696 leaves 1360 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0043', 0, () => {
      const fd: number = 43;
      const offset: number = 336;
      const size: number = 1696;
      const readable: number = size - offset;
      expect(readable).assertEqual(1360);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0044
     * @tc.name      test8wFileDescriptor0044
     * @tc.desc      Descriptor fd=44 offset=344 size=1712 leaves 1368 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0044', 0, () => {
      const fd: number = 44;
      const offset: number = 344;
      const size: number = 1712;
      const readable: number = size - offset;
      expect(readable).assertEqual(1368);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0045
     * @tc.name      test8wFileDescriptor0045
     * @tc.desc      Descriptor fd=45 offset=352 size=1728 leaves 1376 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0045', 0, () => {
      const fd: number = 45;
      const offset: number = 352;
      const size: number = 1728;
      const readable: number = size - offset;
      expect(readable).assertEqual(1376);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0046
     * @tc.name      test8wFileDescriptor0046
     * @tc.desc      Descriptor fd=46 offset=360 size=1744 leaves 1384 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0046', 0, () => {
      const fd: number = 46;
      const offset: number = 360;
      const size: number = 1744;
      const readable: number = size - offset;
      expect(readable).assertEqual(1384);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0047
     * @tc.name      test8wFileDescriptor0047
     * @tc.desc      Descriptor fd=47 offset=368 size=1760 leaves 1392 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0047', 0, () => {
      const fd: number = 47;
      const offset: number = 368;
      const size: number = 1760;
      const readable: number = size - offset;
      expect(readable).assertEqual(1392);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0048
     * @tc.name      test8wFileDescriptor0048
     * @tc.desc      Descriptor fd=48 offset=376 size=1776 leaves 1400 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0048', 0, () => {
      const fd: number = 48;
      const offset: number = 376;
      const size: number = 1776;
      const readable: number = size - offset;
      expect(readable).assertEqual(1400);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0049
     * @tc.name      test8wFileDescriptor0049
     * @tc.desc      Descriptor fd=49 offset=384 size=1792 leaves 1408 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0049', 0, () => {
      const fd: number = 49;
      const offset: number = 384;
      const size: number = 1792;
      const readable: number = size - offset;
      expect(readable).assertEqual(1408);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0050
     * @tc.name      test8wFileDescriptor0050
     * @tc.desc      Descriptor fd=50 offset=392 size=1808 leaves 1416 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0050', 0, () => {
      const fd: number = 50;
      const offset: number = 392;
      const size: number = 1808;
      const readable: number = size - offset;
      expect(readable).assertEqual(1416);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0051
     * @tc.name      test8wFileDescriptor0051
     * @tc.desc      Descriptor fd=51 offset=400 size=1824 leaves 1424 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0051', 0, () => {
      const fd: number = 51;
      const offset: number = 400;
      const size: number = 1824;
      const readable: number = size - offset;
      expect(readable).assertEqual(1424);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0052
     * @tc.name      test8wFileDescriptor0052
     * @tc.desc      Descriptor fd=52 offset=408 size=1840 leaves 1432 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0052', 0, () => {
      const fd: number = 52;
      const offset: number = 408;
      const size: number = 1840;
      const readable: number = size - offset;
      expect(readable).assertEqual(1432);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0053
     * @tc.name      test8wFileDescriptor0053
     * @tc.desc      Descriptor fd=53 offset=416 size=1856 leaves 1440 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0053', 0, () => {
      const fd: number = 53;
      const offset: number = 416;
      const size: number = 1856;
      const readable: number = size - offset;
      expect(readable).assertEqual(1440);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0054
     * @tc.name      test8wFileDescriptor0054
     * @tc.desc      Descriptor fd=54 offset=424 size=1872 leaves 1448 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0054', 0, () => {
      const fd: number = 54;
      const offset: number = 424;
      const size: number = 1872;
      const readable: number = size - offset;
      expect(readable).assertEqual(1448);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0055
     * @tc.name      test8wFileDescriptor0055
     * @tc.desc      Descriptor fd=55 offset=432 size=1888 leaves 1456 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0055', 0, () => {
      const fd: number = 55;
      const offset: number = 432;
      const size: number = 1888;
      const readable: number = size - offset;
      expect(readable).assertEqual(1456);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0056
     * @tc.name      test8wFileDescriptor0056
     * @tc.desc      Descriptor fd=56 offset=440 size=1904 leaves 1464 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0056', 0, () => {
      const fd: number = 56;
      const offset: number = 440;
      const size: number = 1904;
      const readable: number = size - offset;
      expect(readable).assertEqual(1464);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0057
     * @tc.name      test8wFileDescriptor0057
     * @tc.desc      Descriptor fd=57 offset=448 size=1920 leaves 1472 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0057', 0, () => {
      const fd: number = 57;
      const offset: number = 448;
      const size: number = 1920;
      const readable: number = size - offset;
      expect(readable).assertEqual(1472);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0058
     * @tc.name      test8wFileDescriptor0058
     * @tc.desc      Descriptor fd=58 offset=456 size=1936 leaves 1480 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0058', 0, () => {
      const fd: number = 58;
      const offset: number = 456;
      const size: number = 1936;
      const readable: number = size - offset;
      expect(readable).assertEqual(1480);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0059
     * @tc.name      test8wFileDescriptor0059
     * @tc.desc      Descriptor fd=59 offset=464 size=1952 leaves 1488 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0059', 0, () => {
      const fd: number = 59;
      const offset: number = 464;
      const size: number = 1952;
      const readable: number = size - offset;
      expect(readable).assertEqual(1488);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0060
     * @tc.name      test8wFileDescriptor0060
     * @tc.desc      Descriptor fd=60 offset=472 size=1968 leaves 1496 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0060', 0, () => {
      const fd: number = 60;
      const offset: number = 472;
      const size: number = 1968;
      const readable: number = size - offset;
      expect(readable).assertEqual(1496);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0061
     * @tc.name      test8wFileDescriptor0061
     * @tc.desc      Descriptor fd=61 offset=480 size=1984 leaves 1504 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0061', 0, () => {
      const fd: number = 61;
      const offset: number = 480;
      const size: number = 1984;
      const readable: number = size - offset;
      expect(readable).assertEqual(1504);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0062
     * @tc.name      test8wFileDescriptor0062
     * @tc.desc      Descriptor fd=62 offset=488 size=2000 leaves 1512 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0062', 0, () => {
      const fd: number = 62;
      const offset: number = 488;
      const size: number = 2000;
      const readable: number = size - offset;
      expect(readable).assertEqual(1512);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0063
     * @tc.name      test8wFileDescriptor0063
     * @tc.desc      Descriptor fd=63 offset=496 size=2016 leaves 1520 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0063', 0, () => {
      const fd: number = 63;
      const offset: number = 496;
      const size: number = 2016;
      const readable: number = size - offset;
      expect(readable).assertEqual(1520);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0064
     * @tc.name      test8wFileDescriptor0064
     * @tc.desc      Descriptor fd=64 offset=504 size=2032 leaves 1528 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0064', 0, () => {
      const fd: number = 64;
      const offset: number = 504;
      const size: number = 2032;
      const readable: number = size - offset;
      expect(readable).assertEqual(1528);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0065
     * @tc.name      test8wFileDescriptor0065
     * @tc.desc      Descriptor fd=65 offset=512 size=2048 leaves 1536 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0065', 0, () => {
      const fd: number = 65;
      const offset: number = 512;
      const size: number = 2048;
      const readable: number = size - offset;
      expect(readable).assertEqual(1536);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0066
     * @tc.name      test8wFileDescriptor0066
     * @tc.desc      Descriptor fd=66 offset=520 size=2064 leaves 1544 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0066', 0, () => {
      const fd: number = 66;
      const offset: number = 520;
      const size: number = 2064;
      const readable: number = size - offset;
      expect(readable).assertEqual(1544);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0067
     * @tc.name      test8wFileDescriptor0067
     * @tc.desc      Descriptor fd=67 offset=528 size=2080 leaves 1552 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0067', 0, () => {
      const fd: number = 67;
      const offset: number = 528;
      const size: number = 2080;
      const readable: number = size - offset;
      expect(readable).assertEqual(1552);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0068
     * @tc.name      test8wFileDescriptor0068
     * @tc.desc      Descriptor fd=68 offset=536 size=2096 leaves 1560 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0068', 0, () => {
      const fd: number = 68;
      const offset: number = 536;
      const size: number = 2096;
      const readable: number = size - offset;
      expect(readable).assertEqual(1560);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0069
     * @tc.name      test8wFileDescriptor0069
     * @tc.desc      Descriptor fd=69 offset=544 size=2112 leaves 1568 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0069', 0, () => {
      const fd: number = 69;
      const offset: number = 544;
      const size: number = 2112;
      const readable: number = size - offset;
      expect(readable).assertEqual(1568);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0070
     * @tc.name      test8wFileDescriptor0070
     * @tc.desc      Descriptor fd=70 offset=552 size=2128 leaves 1576 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0070', 0, () => {
      const fd: number = 70;
      const offset: number = 552;
      const size: number = 2128;
      const readable: number = size - offset;
      expect(readable).assertEqual(1576);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0071
     * @tc.name      test8wFileDescriptor0071
     * @tc.desc      Descriptor fd=71 offset=560 size=2144 leaves 1584 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0071', 0, () => {
      const fd: number = 71;
      const offset: number = 560;
      const size: number = 2144;
      const readable: number = size - offset;
      expect(readable).assertEqual(1584);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0072
     * @tc.name      test8wFileDescriptor0072
     * @tc.desc      Descriptor fd=72 offset=568 size=2160 leaves 1592 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0072', 0, () => {
      const fd: number = 72;
      const offset: number = 568;
      const size: number = 2160;
      const readable: number = size - offset;
      expect(readable).assertEqual(1592);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0073
     * @tc.name      test8wFileDescriptor0073
     * @tc.desc      Descriptor fd=73 offset=576 size=2176 leaves 1600 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0073', 0, () => {
      const fd: number = 73;
      const offset: number = 576;
      const size: number = 2176;
      const readable: number = size - offset;
      expect(readable).assertEqual(1600);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0074
     * @tc.name      test8wFileDescriptor0074
     * @tc.desc      Descriptor fd=74 offset=584 size=2192 leaves 1608 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0074', 0, () => {
      const fd: number = 74;
      const offset: number = 584;
      const size: number = 2192;
      const readable: number = size - offset;
      expect(readable).assertEqual(1608);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0075
     * @tc.name      test8wFileDescriptor0075
     * @tc.desc      Descriptor fd=75 offset=592 size=2208 leaves 1616 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0075', 0, () => {
      const fd: number = 75;
      const offset: number = 592;
      const size: number = 2208;
      const readable: number = size - offset;
      expect(readable).assertEqual(1616);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0076
     * @tc.name      test8wFileDescriptor0076
     * @tc.desc      Descriptor fd=76 offset=600 size=2224 leaves 1624 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0076', 0, () => {
      const fd: number = 76;
      const offset: number = 600;
      const size: number = 2224;
      const readable: number = size - offset;
      expect(readable).assertEqual(1624);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0077
     * @tc.name      test8wFileDescriptor0077
     * @tc.desc      Descriptor fd=77 offset=608 size=2240 leaves 1632 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0077', 0, () => {
      const fd: number = 77;
      const offset: number = 608;
      const size: number = 2240;
      const readable: number = size - offset;
      expect(readable).assertEqual(1632);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0078
     * @tc.name      test8wFileDescriptor0078
     * @tc.desc      Descriptor fd=78 offset=616 size=2256 leaves 1640 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0078', 0, () => {
      const fd: number = 78;
      const offset: number = 616;
      const size: number = 2256;
      const readable: number = size - offset;
      expect(readable).assertEqual(1640);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0079
     * @tc.name      test8wFileDescriptor0079
     * @tc.desc      Descriptor fd=79 offset=624 size=2272 leaves 1648 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0079', 0, () => {
      const fd: number = 79;
      const offset: number = 624;
      const size: number = 2272;
      const readable: number = size - offset;
      expect(readable).assertEqual(1648);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0080
     * @tc.name      test8wFileDescriptor0080
     * @tc.desc      Descriptor fd=80 offset=632 size=2288 leaves 1656 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0080', 0, () => {
      const fd: number = 80;
      const offset: number = 632;
      const size: number = 2288;
      const readable: number = size - offset;
      expect(readable).assertEqual(1656);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0081
     * @tc.name      test8wFileDescriptor0081
     * @tc.desc      Descriptor fd=81 offset=640 size=2304 leaves 1664 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0081', 0, () => {
      const fd: number = 81;
      const offset: number = 640;
      const size: number = 2304;
      const readable: number = size - offset;
      expect(readable).assertEqual(1664);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0082
     * @tc.name      test8wFileDescriptor0082
     * @tc.desc      Descriptor fd=82 offset=648 size=2320 leaves 1672 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0082', 0, () => {
      const fd: number = 82;
      const offset: number = 648;
      const size: number = 2320;
      const readable: number = size - offset;
      expect(readable).assertEqual(1672);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0083
     * @tc.name      test8wFileDescriptor0083
     * @tc.desc      Descriptor fd=83 offset=656 size=2336 leaves 1680 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0083', 0, () => {
      const fd: number = 83;
      const offset: number = 656;
      const size: number = 2336;
      const readable: number = size - offset;
      expect(readable).assertEqual(1680);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0084
     * @tc.name      test8wFileDescriptor0084
     * @tc.desc      Descriptor fd=84 offset=664 size=2352 leaves 1688 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0084', 0, () => {
      const fd: number = 84;
      const offset: number = 664;
      const size: number = 2352;
      const readable: number = size - offset;
      expect(readable).assertEqual(1688);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0085
     * @tc.name      test8wFileDescriptor0085
     * @tc.desc      Descriptor fd=85 offset=672 size=2368 leaves 1696 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0085', 0, () => {
      const fd: number = 85;
      const offset: number = 672;
      const size: number = 2368;
      const readable: number = size - offset;
      expect(readable).assertEqual(1696);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0086
     * @tc.name      test8wFileDescriptor0086
     * @tc.desc      Descriptor fd=86 offset=680 size=2384 leaves 1704 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0086', 0, () => {
      const fd: number = 86;
      const offset: number = 680;
      const size: number = 2384;
      const readable: number = size - offset;
      expect(readable).assertEqual(1704);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0087
     * @tc.name      test8wFileDescriptor0087
     * @tc.desc      Descriptor fd=87 offset=688 size=2400 leaves 1712 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0087', 0, () => {
      const fd: number = 87;
      const offset: number = 688;
      const size: number = 2400;
      const readable: number = size - offset;
      expect(readable).assertEqual(1712);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0088
     * @tc.name      test8wFileDescriptor0088
     * @tc.desc      Descriptor fd=88 offset=696 size=2416 leaves 1720 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0088', 0, () => {
      const fd: number = 88;
      const offset: number = 696;
      const size: number = 2416;
      const readable: number = size - offset;
      expect(readable).assertEqual(1720);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0089
     * @tc.name      test8wFileDescriptor0089
     * @tc.desc      Descriptor fd=89 offset=704 size=2432 leaves 1728 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0089', 0, () => {
      const fd: number = 89;
      const offset: number = 704;
      const size: number = 2432;
      const readable: number = size - offset;
      expect(readable).assertEqual(1728);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0090
     * @tc.name      test8wFileDescriptor0090
     * @tc.desc      Descriptor fd=90 offset=712 size=2448 leaves 1736 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0090', 0, () => {
      const fd: number = 90;
      const offset: number = 712;
      const size: number = 2448;
      const readable: number = size - offset;
      expect(readable).assertEqual(1736);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0091
     * @tc.name      test8wFileDescriptor0091
     * @tc.desc      Descriptor fd=91 offset=720 size=2464 leaves 1744 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0091', 0, () => {
      const fd: number = 91;
      const offset: number = 720;
      const size: number = 2464;
      const readable: number = size - offset;
      expect(readable).assertEqual(1744);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0092
     * @tc.name      test8wFileDescriptor0092
     * @tc.desc      Descriptor fd=92 offset=728 size=2480 leaves 1752 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0092', 0, () => {
      const fd: number = 92;
      const offset: number = 728;
      const size: number = 2480;
      const readable: number = size - offset;
      expect(readable).assertEqual(1752);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0093
     * @tc.name      test8wFileDescriptor0093
     * @tc.desc      Descriptor fd=93 offset=736 size=2496 leaves 1760 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0093', 0, () => {
      const fd: number = 93;
      const offset: number = 736;
      const size: number = 2496;
      const readable: number = size - offset;
      expect(readable).assertEqual(1760);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0094
     * @tc.name      test8wFileDescriptor0094
     * @tc.desc      Descriptor fd=94 offset=744 size=2512 leaves 1768 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0094', 0, () => {
      const fd: number = 94;
      const offset: number = 744;
      const size: number = 2512;
      const readable: number = size - offset;
      expect(readable).assertEqual(1768);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0095
     * @tc.name      test8wFileDescriptor0095
     * @tc.desc      Descriptor fd=95 offset=752 size=2528 leaves 1776 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0095', 0, () => {
      const fd: number = 95;
      const offset: number = 752;
      const size: number = 2528;
      const readable: number = size - offset;
      expect(readable).assertEqual(1776);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0096
     * @tc.name      test8wFileDescriptor0096
     * @tc.desc      Descriptor fd=96 offset=760 size=2544 leaves 1784 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0096', 0, () => {
      const fd: number = 96;
      const offset: number = 760;
      const size: number = 2544;
      const readable: number = size - offset;
      expect(readable).assertEqual(1784);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0097
     * @tc.name      test8wFileDescriptor0097
     * @tc.desc      Descriptor fd=97 offset=768 size=2560 leaves 1792 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0097', 0, () => {
      const fd: number = 97;
      const offset: number = 768;
      const size: number = 2560;
      const readable: number = size - offset;
      expect(readable).assertEqual(1792);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0098
     * @tc.name      test8wFileDescriptor0098
     * @tc.desc      Descriptor fd=98 offset=776 size=2576 leaves 1800 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0098', 0, () => {
      const fd: number = 98;
      const offset: number = 776;
      const size: number = 2576;
      const readable: number = size - offset;
      expect(readable).assertEqual(1800);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0099
     * @tc.name      test8wFileDescriptor0099
     * @tc.desc      Descriptor fd=99 offset=784 size=2592 leaves 1808 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0099', 0, () => {
      const fd: number = 99;
      const offset: number = 784;
      const size: number = 2592;
      const readable: number = size - offset;
      expect(readable).assertEqual(1808);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_FD_0100
     * @tc.name      test8wFileDescriptor0100
     * @tc.desc      Descriptor fd=100 offset=792 size=2608 leaves 1816 readable bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wFileDescriptor0100', 0, () => {
      const fd: number = 100;
      const offset: number = 792;
      const size: number = 2608;
      const readable: number = size - offset;
      expect(readable).assertEqual(1816);
      expect(fd).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(readable).assertLarger(0);
    })
  })
}

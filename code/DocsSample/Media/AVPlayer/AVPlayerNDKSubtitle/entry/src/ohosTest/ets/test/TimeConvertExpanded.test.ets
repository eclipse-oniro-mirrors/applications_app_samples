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


export default function timeConvertExpandedTest() {
  describe('timeConvertExpandedTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0001
     * @tc.name      testExpTimeConvert0001
     * @tc.desc      Index timeConvert(0) returns 0:00.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0001', 0, () => {
      const time: number = 0;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:00');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0002
     * @tc.name      testExpTimeConvert0002
     * @tc.desc      Index timeConvert(1000) returns 0:01.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0002', 0, () => {
      const time: number = 1000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:01');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0003
     * @tc.name      testExpTimeConvert0003
     * @tc.desc      Index timeConvert(2000) returns 0:02.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0003', 0, () => {
      const time: number = 2000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:02');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0004
     * @tc.name      testExpTimeConvert0004
     * @tc.desc      Index timeConvert(3000) returns 0:03.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0004', 0, () => {
      const time: number = 3000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:03');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0005
     * @tc.name      testExpTimeConvert0005
     * @tc.desc      Index timeConvert(4000) returns 0:04.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0005', 0, () => {
      const time: number = 4000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:04');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0006
     * @tc.name      testExpTimeConvert0006
     * @tc.desc      Index timeConvert(5000) returns 0:05.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0006', 0, () => {
      const time: number = 5000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:05');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0007
     * @tc.name      testExpTimeConvert0007
     * @tc.desc      Index timeConvert(6000) returns 0:06.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0007', 0, () => {
      const time: number = 6000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:06');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0008
     * @tc.name      testExpTimeConvert0008
     * @tc.desc      Index timeConvert(7000) returns 0:07.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0008', 0, () => {
      const time: number = 7000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:07');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0009
     * @tc.name      testExpTimeConvert0009
     * @tc.desc      Index timeConvert(8000) returns 0:08.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0009', 0, () => {
      const time: number = 8000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:08');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0010
     * @tc.name      testExpTimeConvert0010
     * @tc.desc      Index timeConvert(9000) returns 0:09.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0010', 0, () => {
      const time: number = 9000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:09');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0011
     * @tc.name      testExpTimeConvert0011
     * @tc.desc      Index timeConvert(10000) returns 0:10.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0011', 0, () => {
      const time: number = 10000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:10');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0012
     * @tc.name      testExpTimeConvert0012
     * @tc.desc      Index timeConvert(11000) returns 0:11.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0012', 0, () => {
      const time: number = 11000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:11');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0013
     * @tc.name      testExpTimeConvert0013
     * @tc.desc      Index timeConvert(12000) returns 0:12.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0013', 0, () => {
      const time: number = 12000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:12');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0014
     * @tc.name      testExpTimeConvert0014
     * @tc.desc      Index timeConvert(13000) returns 0:13.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0014', 0, () => {
      const time: number = 13000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:13');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0015
     * @tc.name      testExpTimeConvert0015
     * @tc.desc      Index timeConvert(14000) returns 0:14.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0015', 0, () => {
      const time: number = 14000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:14');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0016
     * @tc.name      testExpTimeConvert0016
     * @tc.desc      Index timeConvert(15000) returns 0:15.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0016', 0, () => {
      const time: number = 15000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:15');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0017
     * @tc.name      testExpTimeConvert0017
     * @tc.desc      Index timeConvert(16000) returns 0:16.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0017', 0, () => {
      const time: number = 16000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:16');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0018
     * @tc.name      testExpTimeConvert0018
     * @tc.desc      Index timeConvert(17000) returns 0:17.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0018', 0, () => {
      const time: number = 17000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:17');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0019
     * @tc.name      testExpTimeConvert0019
     * @tc.desc      Index timeConvert(18000) returns 0:18.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0019', 0, () => {
      const time: number = 18000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:18');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0020
     * @tc.name      testExpTimeConvert0020
     * @tc.desc      Index timeConvert(19000) returns 0:19.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0020', 0, () => {
      const time: number = 19000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:19');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0021
     * @tc.name      testExpTimeConvert0021
     * @tc.desc      Index timeConvert(20000) returns 0:20.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0021', 0, () => {
      const time: number = 20000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:20');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0022
     * @tc.name      testExpTimeConvert0022
     * @tc.desc      Index timeConvert(21000) returns 0:21.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0022', 0, () => {
      const time: number = 21000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:21');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0023
     * @tc.name      testExpTimeConvert0023
     * @tc.desc      Index timeConvert(22000) returns 0:22.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0023', 0, () => {
      const time: number = 22000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:22');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0024
     * @tc.name      testExpTimeConvert0024
     * @tc.desc      Index timeConvert(23000) returns 0:23.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0024', 0, () => {
      const time: number = 23000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:23');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0025
     * @tc.name      testExpTimeConvert0025
     * @tc.desc      Index timeConvert(24000) returns 0:24.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0025', 0, () => {
      const time: number = 24000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:24');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0026
     * @tc.name      testExpTimeConvert0026
     * @tc.desc      Index timeConvert(25000) returns 0:25.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0026', 0, () => {
      const time: number = 25000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:25');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0027
     * @tc.name      testExpTimeConvert0027
     * @tc.desc      Index timeConvert(26000) returns 0:26.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0027', 0, () => {
      const time: number = 26000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:26');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0028
     * @tc.name      testExpTimeConvert0028
     * @tc.desc      Index timeConvert(27000) returns 0:27.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0028', 0, () => {
      const time: number = 27000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:27');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0029
     * @tc.name      testExpTimeConvert0029
     * @tc.desc      Index timeConvert(28000) returns 0:28.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0029', 0, () => {
      const time: number = 28000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:28');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0030
     * @tc.name      testExpTimeConvert0030
     * @tc.desc      Index timeConvert(29000) returns 0:29.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0030', 0, () => {
      const time: number = 29000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:29');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0031
     * @tc.name      testExpTimeConvert0031
     * @tc.desc      Index timeConvert(30000) returns 0:30.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0031', 0, () => {
      const time: number = 30000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:30');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0032
     * @tc.name      testExpTimeConvert0032
     * @tc.desc      Index timeConvert(31000) returns 0:31.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0032', 0, () => {
      const time: number = 31000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:31');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0033
     * @tc.name      testExpTimeConvert0033
     * @tc.desc      Index timeConvert(32000) returns 0:32.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0033', 0, () => {
      const time: number = 32000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:32');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0034
     * @tc.name      testExpTimeConvert0034
     * @tc.desc      Index timeConvert(33000) returns 0:33.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0034', 0, () => {
      const time: number = 33000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:33');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0035
     * @tc.name      testExpTimeConvert0035
     * @tc.desc      Index timeConvert(34000) returns 0:34.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0035', 0, () => {
      const time: number = 34000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:34');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0036
     * @tc.name      testExpTimeConvert0036
     * @tc.desc      Index timeConvert(35000) returns 0:35.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0036', 0, () => {
      const time: number = 35000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:35');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0037
     * @tc.name      testExpTimeConvert0037
     * @tc.desc      Index timeConvert(36000) returns 0:36.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0037', 0, () => {
      const time: number = 36000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:36');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0038
     * @tc.name      testExpTimeConvert0038
     * @tc.desc      Index timeConvert(37000) returns 0:37.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0038', 0, () => {
      const time: number = 37000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:37');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0039
     * @tc.name      testExpTimeConvert0039
     * @tc.desc      Index timeConvert(38000) returns 0:38.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0039', 0, () => {
      const time: number = 38000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:38');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0040
     * @tc.name      testExpTimeConvert0040
     * @tc.desc      Index timeConvert(39000) returns 0:39.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0040', 0, () => {
      const time: number = 39000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:39');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0041
     * @tc.name      testExpTimeConvert0041
     * @tc.desc      Index timeConvert(40000) returns 0:40.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0041', 0, () => {
      const time: number = 40000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:40');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0042
     * @tc.name      testExpTimeConvert0042
     * @tc.desc      Index timeConvert(41000) returns 0:41.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0042', 0, () => {
      const time: number = 41000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:41');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0043
     * @tc.name      testExpTimeConvert0043
     * @tc.desc      Index timeConvert(42000) returns 0:42.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0043', 0, () => {
      const time: number = 42000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:42');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0044
     * @tc.name      testExpTimeConvert0044
     * @tc.desc      Index timeConvert(43000) returns 0:43.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0044', 0, () => {
      const time: number = 43000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:43');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0045
     * @tc.name      testExpTimeConvert0045
     * @tc.desc      Index timeConvert(44000) returns 0:44.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0045', 0, () => {
      const time: number = 44000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:44');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0046
     * @tc.name      testExpTimeConvert0046
     * @tc.desc      Index timeConvert(45000) returns 0:45.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0046', 0, () => {
      const time: number = 45000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:45');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0047
     * @tc.name      testExpTimeConvert0047
     * @tc.desc      Index timeConvert(46000) returns 0:46.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0047', 0, () => {
      const time: number = 46000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:46');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0048
     * @tc.name      testExpTimeConvert0048
     * @tc.desc      Index timeConvert(47000) returns 0:47.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0048', 0, () => {
      const time: number = 47000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:47');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0049
     * @tc.name      testExpTimeConvert0049
     * @tc.desc      Index timeConvert(48000) returns 0:48.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0049', 0, () => {
      const time: number = 48000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:48');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0050
     * @tc.name      testExpTimeConvert0050
     * @tc.desc      Index timeConvert(49000) returns 0:49.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0050', 0, () => {
      const time: number = 49000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:49');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0051
     * @tc.name      testExpTimeConvert0051
     * @tc.desc      Index timeConvert(50000) returns 0:50.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0051', 0, () => {
      const time: number = 50000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:50');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0052
     * @tc.name      testExpTimeConvert0052
     * @tc.desc      Index timeConvert(51000) returns 0:51.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0052', 0, () => {
      const time: number = 51000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:51');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0053
     * @tc.name      testExpTimeConvert0053
     * @tc.desc      Index timeConvert(52000) returns 0:52.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0053', 0, () => {
      const time: number = 52000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:52');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0054
     * @tc.name      testExpTimeConvert0054
     * @tc.desc      Index timeConvert(53000) returns 0:53.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0054', 0, () => {
      const time: number = 53000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:53');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0055
     * @tc.name      testExpTimeConvert0055
     * @tc.desc      Index timeConvert(54000) returns 0:54.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0055', 0, () => {
      const time: number = 54000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:54');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0056
     * @tc.name      testExpTimeConvert0056
     * @tc.desc      Index timeConvert(55000) returns 0:55.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0056', 0, () => {
      const time: number = 55000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:55');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0057
     * @tc.name      testExpTimeConvert0057
     * @tc.desc      Index timeConvert(56000) returns 0:56.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0057', 0, () => {
      const time: number = 56000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:56');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0058
     * @tc.name      testExpTimeConvert0058
     * @tc.desc      Index timeConvert(57000) returns 0:57.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0058', 0, () => {
      const time: number = 57000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:57');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0059
     * @tc.name      testExpTimeConvert0059
     * @tc.desc      Index timeConvert(58000) returns 0:58.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0059', 0, () => {
      const time: number = 58000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:58');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0060
     * @tc.name      testExpTimeConvert0060
     * @tc.desc      Index timeConvert(59000) returns 0:59.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0060', 0, () => {
      const time: number = 59000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('0:59');
      expect(minutes).assertEqual(0);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0061
     * @tc.name      testExpTimeConvert0061
     * @tc.desc      Index timeConvert(60000) returns 1:00.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0061', 0, () => {
      const time: number = 60000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:00');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0062
     * @tc.name      testExpTimeConvert0062
     * @tc.desc      Index timeConvert(61000) returns 1:01.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0062', 0, () => {
      const time: number = 61000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:01');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0063
     * @tc.name      testExpTimeConvert0063
     * @tc.desc      Index timeConvert(62000) returns 1:02.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0063', 0, () => {
      const time: number = 62000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:02');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0064
     * @tc.name      testExpTimeConvert0064
     * @tc.desc      Index timeConvert(63000) returns 1:03.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0064', 0, () => {
      const time: number = 63000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:03');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0065
     * @tc.name      testExpTimeConvert0065
     * @tc.desc      Index timeConvert(64000) returns 1:04.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0065', 0, () => {
      const time: number = 64000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:04');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0066
     * @tc.name      testExpTimeConvert0066
     * @tc.desc      Index timeConvert(65000) returns 1:05.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0066', 0, () => {
      const time: number = 65000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:05');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0067
     * @tc.name      testExpTimeConvert0067
     * @tc.desc      Index timeConvert(66000) returns 1:06.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0067', 0, () => {
      const time: number = 66000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:06');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0068
     * @tc.name      testExpTimeConvert0068
     * @tc.desc      Index timeConvert(67000) returns 1:07.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0068', 0, () => {
      const time: number = 67000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:07');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0069
     * @tc.name      testExpTimeConvert0069
     * @tc.desc      Index timeConvert(68000) returns 1:08.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0069', 0, () => {
      const time: number = 68000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:08');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0070
     * @tc.name      testExpTimeConvert0070
     * @tc.desc      Index timeConvert(69000) returns 1:09.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0070', 0, () => {
      const time: number = 69000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:09');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0071
     * @tc.name      testExpTimeConvert0071
     * @tc.desc      Index timeConvert(70000) returns 1:10.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0071', 0, () => {
      const time: number = 70000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:10');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0072
     * @tc.name      testExpTimeConvert0072
     * @tc.desc      Index timeConvert(71000) returns 1:11.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0072', 0, () => {
      const time: number = 71000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:11');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0073
     * @tc.name      testExpTimeConvert0073
     * @tc.desc      Index timeConvert(72000) returns 1:12.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0073', 0, () => {
      const time: number = 72000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:12');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0074
     * @tc.name      testExpTimeConvert0074
     * @tc.desc      Index timeConvert(73000) returns 1:13.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0074', 0, () => {
      const time: number = 73000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:13');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0075
     * @tc.name      testExpTimeConvert0075
     * @tc.desc      Index timeConvert(74000) returns 1:14.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0075', 0, () => {
      const time: number = 74000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:14');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0076
     * @tc.name      testExpTimeConvert0076
     * @tc.desc      Index timeConvert(75000) returns 1:15.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0076', 0, () => {
      const time: number = 75000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:15');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0077
     * @tc.name      testExpTimeConvert0077
     * @tc.desc      Index timeConvert(76000) returns 1:16.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0077', 0, () => {
      const time: number = 76000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:16');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0078
     * @tc.name      testExpTimeConvert0078
     * @tc.desc      Index timeConvert(77000) returns 1:17.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0078', 0, () => {
      const time: number = 77000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:17');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0079
     * @tc.name      testExpTimeConvert0079
     * @tc.desc      Index timeConvert(78000) returns 1:18.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0079', 0, () => {
      const time: number = 78000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:18');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0080
     * @tc.name      testExpTimeConvert0080
     * @tc.desc      Index timeConvert(79000) returns 1:19.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0080', 0, () => {
      const time: number = 79000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:19');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0081
     * @tc.name      testExpTimeConvert0081
     * @tc.desc      Index timeConvert(80000) returns 1:20.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0081', 0, () => {
      const time: number = 80000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:20');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0082
     * @tc.name      testExpTimeConvert0082
     * @tc.desc      Index timeConvert(81000) returns 1:21.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0082', 0, () => {
      const time: number = 81000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:21');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0083
     * @tc.name      testExpTimeConvert0083
     * @tc.desc      Index timeConvert(82000) returns 1:22.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0083', 0, () => {
      const time: number = 82000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:22');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0084
     * @tc.name      testExpTimeConvert0084
     * @tc.desc      Index timeConvert(83000) returns 1:23.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0084', 0, () => {
      const time: number = 83000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:23');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0085
     * @tc.name      testExpTimeConvert0085
     * @tc.desc      Index timeConvert(84000) returns 1:24.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0085', 0, () => {
      const time: number = 84000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:24');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0086
     * @tc.name      testExpTimeConvert0086
     * @tc.desc      Index timeConvert(85000) returns 1:25.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0086', 0, () => {
      const time: number = 85000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:25');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0087
     * @tc.name      testExpTimeConvert0087
     * @tc.desc      Index timeConvert(86000) returns 1:26.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0087', 0, () => {
      const time: number = 86000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:26');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0088
     * @tc.name      testExpTimeConvert0088
     * @tc.desc      Index timeConvert(87000) returns 1:27.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0088', 0, () => {
      const time: number = 87000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:27');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0089
     * @tc.name      testExpTimeConvert0089
     * @tc.desc      Index timeConvert(88000) returns 1:28.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0089', 0, () => {
      const time: number = 88000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:28');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0090
     * @tc.name      testExpTimeConvert0090
     * @tc.desc      Index timeConvert(89000) returns 1:29.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0090', 0, () => {
      const time: number = 89000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:29');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0091
     * @tc.name      testExpTimeConvert0091
     * @tc.desc      Index timeConvert(90000) returns 1:30.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0091', 0, () => {
      const time: number = 90000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:30');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0092
     * @tc.name      testExpTimeConvert0092
     * @tc.desc      Index timeConvert(91000) returns 1:31.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0092', 0, () => {
      const time: number = 91000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:31');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0093
     * @tc.name      testExpTimeConvert0093
     * @tc.desc      Index timeConvert(92000) returns 1:32.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0093', 0, () => {
      const time: number = 92000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:32');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0094
     * @tc.name      testExpTimeConvert0094
     * @tc.desc      Index timeConvert(93000) returns 1:33.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0094', 0, () => {
      const time: number = 93000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:33');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0095
     * @tc.name      testExpTimeConvert0095
     * @tc.desc      Index timeConvert(94000) returns 1:34.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0095', 0, () => {
      const time: number = 94000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:34');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0096
     * @tc.name      testExpTimeConvert0096
     * @tc.desc      Index timeConvert(95000) returns 1:35.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0096', 0, () => {
      const time: number = 95000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:35');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0097
     * @tc.name      testExpTimeConvert0097
     * @tc.desc      Index timeConvert(96000) returns 1:36.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0097', 0, () => {
      const time: number = 96000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:36');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0098
     * @tc.name      testExpTimeConvert0098
     * @tc.desc      Index timeConvert(97000) returns 1:37.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0098', 0, () => {
      const time: number = 97000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:37');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0099
     * @tc.name      testExpTimeConvert0099
     * @tc.desc      Index timeConvert(98000) returns 1:38.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0099', 0, () => {
      const time: number = 98000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:38');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONV_0100
     * @tc.name      testExpTimeConvert0100
     * @tc.desc      Index timeConvert(99000) returns 1:39.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTimeConvert0100', 0, () => {
      const time: number = 99000;
      const minutes: number = Math.floor(time / 60000);
      const seconds: string = ((time % 60000) / 1000).toFixed(0);
      const text: string = `${minutes}:${seconds.padStart(2, '0')}`;
      expect(text).assertEqual('1:39');
      expect(minutes).assertEqual(1);
      expect(time).assertLargerOrEqual(0);
    })
  })
}

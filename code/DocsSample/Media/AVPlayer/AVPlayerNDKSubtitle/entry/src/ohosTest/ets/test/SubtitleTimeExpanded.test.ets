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



const TAG: string = '[Sample_SubtitleTimeExpanded]';
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

export default function subtitleTimeExpandedTest(): void {
  describe('subtitleTimeExpandedTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0001
     * @tc.name      testExpSubtitleTime0001
     * @tc.desc      SRT timestamp 500ms formats as 00:00:00,500.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 500;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:00,500');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0002
     * @tc.name      testExpSubtitleTime0002
     * @tc.desc      SRT timestamp 1734ms formats as 00:00:01,734.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 1734;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:01,734');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0003
     * @tc.name      testExpSubtitleTime0003
     * @tc.desc      SRT timestamp 2968ms formats as 00:00:02,968.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 2968;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:02,968');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0004
     * @tc.name      testExpSubtitleTime0004
     * @tc.desc      SRT timestamp 4202ms formats as 00:00:04,202.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 4202;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:04,202');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0005
     * @tc.name      testExpSubtitleTime0005
     * @tc.desc      SRT timestamp 5436ms formats as 00:00:05,436.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 5436;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:05,436');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0006
     * @tc.name      testExpSubtitleTime0006
     * @tc.desc      SRT timestamp 6670ms formats as 00:00:06,670.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 6670;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:06,670');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0007
     * @tc.name      testExpSubtitleTime0007
     * @tc.desc      SRT timestamp 7904ms formats as 00:00:07,904.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 7904;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:07,904');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(7);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0008
     * @tc.name      testExpSubtitleTime0008
     * @tc.desc      SRT timestamp 9138ms formats as 00:00:09,138.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 9138;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:09,138');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(9);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0009
     * @tc.name      testExpSubtitleTime0009
     * @tc.desc      SRT timestamp 10372ms formats as 00:00:10,372.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 10372;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:10,372');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0010
     * @tc.name      testExpSubtitleTime0010
     * @tc.desc      SRT timestamp 11606ms formats as 00:00:11,606.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 11606;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:11,606');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0011
     * @tc.name      testExpSubtitleTime0011
     * @tc.desc      SRT timestamp 12840ms formats as 00:00:12,840.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 12840;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:12,840');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(12);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0012
     * @tc.name      testExpSubtitleTime0012
     * @tc.desc      SRT timestamp 14074ms formats as 00:00:14,074.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 14074;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:14,074');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(14);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0013
     * @tc.name      testExpSubtitleTime0013
     * @tc.desc      SRT timestamp 15308ms formats as 00:00:15,308.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 15308;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:15,308');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(15);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0014
     * @tc.name      testExpSubtitleTime0014
     * @tc.desc      SRT timestamp 16542ms formats as 00:00:16,542.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 16542;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:16,542');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0015
     * @tc.name      testExpSubtitleTime0015
     * @tc.desc      SRT timestamp 17776ms formats as 00:00:17,776.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 17776;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:17,776');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(17);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0016
     * @tc.name      testExpSubtitleTime0016
     * @tc.desc      SRT timestamp 19010ms formats as 00:00:19,010.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 19010;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:19,010');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(19);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0017
     * @tc.name      testExpSubtitleTime0017
     * @tc.desc      SRT timestamp 20244ms formats as 00:00:20,244.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 20244;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:20,244');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(20);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0018
     * @tc.name      testExpSubtitleTime0018
     * @tc.desc      SRT timestamp 21478ms formats as 00:00:21,478.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 21478;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:21,478');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(21);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0019
     * @tc.name      testExpSubtitleTime0019
     * @tc.desc      SRT timestamp 22712ms formats as 00:00:22,712.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 22712;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:22,712');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(22);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0020
     * @tc.name      testExpSubtitleTime0020
     * @tc.desc      SRT timestamp 23946ms formats as 00:00:23,946.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 23946;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:23,946');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0021
     * @tc.name      testExpSubtitleTime0021
     * @tc.desc      SRT timestamp 25180ms formats as 00:00:25,180.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 25180;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:25,180');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(25);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0022
     * @tc.name      testExpSubtitleTime0022
     * @tc.desc      SRT timestamp 26414ms formats as 00:00:26,414.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 26414;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:26,414');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(26);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0023
     * @tc.name      testExpSubtitleTime0023
     * @tc.desc      SRT timestamp 27648ms formats as 00:00:27,648.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 27648;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:27,648');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(27);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0024
     * @tc.name      testExpSubtitleTime0024
     * @tc.desc      SRT timestamp 28882ms formats as 00:00:28,882.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 28882;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:28,882');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(28);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0025
     * @tc.name      testExpSubtitleTime0025
     * @tc.desc      SRT timestamp 30116ms formats as 00:00:30,116.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 30116;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:30,116');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(30);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0026
     * @tc.name      testExpSubtitleTime0026
     * @tc.desc      SRT timestamp 31350ms formats as 00:00:31,350.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 31350;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:31,350');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(31);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0027
     * @tc.name      testExpSubtitleTime0027
     * @tc.desc      SRT timestamp 32584ms formats as 00:00:32,584.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 32584;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:32,584');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(32);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0028
     * @tc.name      testExpSubtitleTime0028
     * @tc.desc      SRT timestamp 33818ms formats as 00:00:33,818.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 33818;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:33,818');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(33);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0029
     * @tc.name      testExpSubtitleTime0029
     * @tc.desc      SRT timestamp 35052ms formats as 00:00:35,052.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 35052;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:35,052');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(35);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0030
     * @tc.name      testExpSubtitleTime0030
     * @tc.desc      SRT timestamp 36286ms formats as 00:00:36,286.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 36286;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:36,286');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(36);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0031
     * @tc.name      testExpSubtitleTime0031
     * @tc.desc      SRT timestamp 37520ms formats as 00:00:37,520.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 37520;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:37,520');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(37);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0032
     * @tc.name      testExpSubtitleTime0032
     * @tc.desc      SRT timestamp 38754ms formats as 00:00:38,754.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 38754;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:38,754');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(38);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0033
     * @tc.name      testExpSubtitleTime0033
     * @tc.desc      SRT timestamp 39988ms formats as 00:00:39,988.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 39988;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:39,988');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(39);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0034
     * @tc.name      testExpSubtitleTime0034
     * @tc.desc      SRT timestamp 41222ms formats as 00:00:41,222.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 41222;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:41,222');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(41);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0035
     * @tc.name      testExpSubtitleTime0035
     * @tc.desc      SRT timestamp 42456ms formats as 00:00:42,456.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 42456;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:42,456');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(42);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0036
     * @tc.name      testExpSubtitleTime0036
     * @tc.desc      SRT timestamp 43690ms formats as 00:00:43,690.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 43690;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:43,690');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(43);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0037
     * @tc.name      testExpSubtitleTime0037
     * @tc.desc      SRT timestamp 44924ms formats as 00:00:44,924.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 44924;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:44,924');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(44);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0038
     * @tc.name      testExpSubtitleTime0038
     * @tc.desc      SRT timestamp 46158ms formats as 00:00:46,158.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 46158;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:46,158');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(46);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0039
     * @tc.name      testExpSubtitleTime0039
     * @tc.desc      SRT timestamp 47392ms formats as 00:00:47,392.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 47392;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:47,392');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(47);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0040
     * @tc.name      testExpSubtitleTime0040
     * @tc.desc      SRT timestamp 48626ms formats as 00:00:48,626.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 48626;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:48,626');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(48);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0041
     * @tc.name      testExpSubtitleTime0041
     * @tc.desc      SRT timestamp 49860ms formats as 00:00:49,860.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 49860;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:49,860');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(49);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0042
     * @tc.name      testExpSubtitleTime0042
     * @tc.desc      SRT timestamp 51094ms formats as 00:00:51,094.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 51094;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:51,094');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(51);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0043
     * @tc.name      testExpSubtitleTime0043
     * @tc.desc      SRT timestamp 52328ms formats as 00:00:52,328.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 52328;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:52,328');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(52);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0044
     * @tc.name      testExpSubtitleTime0044
     * @tc.desc      SRT timestamp 53562ms formats as 00:00:53,562.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 53562;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:53,562');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(53);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0045
     * @tc.name      testExpSubtitleTime0045
     * @tc.desc      SRT timestamp 54796ms formats as 00:00:54,796.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 54796;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:54,796');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(54);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0046
     * @tc.name      testExpSubtitleTime0046
     * @tc.desc      SRT timestamp 56030ms formats as 00:00:56,030.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 56030;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:56,030');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(56);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0047
     * @tc.name      testExpSubtitleTime0047
     * @tc.desc      SRT timestamp 57264ms formats as 00:00:57,264.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 57264;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:57,264');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(57);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0048
     * @tc.name      testExpSubtitleTime0048
     * @tc.desc      SRT timestamp 58498ms formats as 00:00:58,498.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 58498;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:58,498');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(58);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0049
     * @tc.name      testExpSubtitleTime0049
     * @tc.desc      SRT timestamp 59732ms formats as 00:00:59,732.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 59732;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:00:59,732');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual(59);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0050
     * @tc.name      testExpSubtitleTime0050
     * @tc.desc      SRT timestamp 60966ms formats as 00:01:00,966.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 60966;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:00,966');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0051
     * @tc.name      testExpSubtitleTime0051
     * @tc.desc      SRT timestamp 62200ms formats as 00:01:02,200.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 62200;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:02,200');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0052
     * @tc.name      testExpSubtitleTime0052
     * @tc.desc      SRT timestamp 63434ms formats as 00:01:03,434.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 63434;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:03,434');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0053
     * @tc.name      testExpSubtitleTime0053
     * @tc.desc      SRT timestamp 64668ms formats as 00:01:04,668.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 64668;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:04,668');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0054
     * @tc.name      testExpSubtitleTime0054
     * @tc.desc      SRT timestamp 65902ms formats as 00:01:05,902.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 65902;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:05,902');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0055
     * @tc.name      testExpSubtitleTime0055
     * @tc.desc      SRT timestamp 67136ms formats as 00:01:07,136.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 67136;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:07,136');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(7);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0056
     * @tc.name      testExpSubtitleTime0056
     * @tc.desc      SRT timestamp 68370ms formats as 00:01:08,370.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 68370;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:08,370');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(8);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0057
     * @tc.name      testExpSubtitleTime0057
     * @tc.desc      SRT timestamp 69604ms formats as 00:01:09,604.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 69604;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:09,604');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(9);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0058
     * @tc.name      testExpSubtitleTime0058
     * @tc.desc      SRT timestamp 70838ms formats as 00:01:10,838.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 70838;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:10,838');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0059
     * @tc.name      testExpSubtitleTime0059
     * @tc.desc      SRT timestamp 72072ms formats as 00:01:12,072.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 72072;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:12,072');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(12);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0060
     * @tc.name      testExpSubtitleTime0060
     * @tc.desc      SRT timestamp 73306ms formats as 00:01:13,306.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 73306;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:13,306');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0061
     * @tc.name      testExpSubtitleTime0061
     * @tc.desc      SRT timestamp 74540ms formats as 00:01:14,540.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 74540;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:14,540');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(14);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0062
     * @tc.name      testExpSubtitleTime0062
     * @tc.desc      SRT timestamp 75774ms formats as 00:01:15,774.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 75774;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:15,774');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(15);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0063
     * @tc.name      testExpSubtitleTime0063
     * @tc.desc      SRT timestamp 77008ms formats as 00:01:17,008.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 77008;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:17,008');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(17);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0064
     * @tc.name      testExpSubtitleTime0064
     * @tc.desc      SRT timestamp 78242ms formats as 00:01:18,242.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 78242;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:18,242');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(18);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0065
     * @tc.name      testExpSubtitleTime0065
     * @tc.desc      SRT timestamp 79476ms formats as 00:01:19,476.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 79476;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:19,476');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(19);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0066
     * @tc.name      testExpSubtitleTime0066
     * @tc.desc      SRT timestamp 80710ms formats as 00:01:20,710.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 80710;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:20,710');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(20);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0067
     * @tc.name      testExpSubtitleTime0067
     * @tc.desc      SRT timestamp 81944ms formats as 00:01:21,944.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 81944;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:21,944');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(21);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0068
     * @tc.name      testExpSubtitleTime0068
     * @tc.desc      SRT timestamp 83178ms formats as 00:01:23,178.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 83178;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:23,178');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0069
     * @tc.name      testExpSubtitleTime0069
     * @tc.desc      SRT timestamp 84412ms formats as 00:01:24,412.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 84412;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:24,412');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(24);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0070
     * @tc.name      testExpSubtitleTime0070
     * @tc.desc      SRT timestamp 85646ms formats as 00:01:25,646.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 85646;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:25,646');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(25);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0071
     * @tc.name      testExpSubtitleTime0071
     * @tc.desc      SRT timestamp 86880ms formats as 00:01:26,880.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 86880;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:26,880');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(26);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0072
     * @tc.name      testExpSubtitleTime0072
     * @tc.desc      SRT timestamp 88114ms formats as 00:01:28,114.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 88114;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:28,114');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(28);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0073
     * @tc.name      testExpSubtitleTime0073
     * @tc.desc      SRT timestamp 89348ms formats as 00:01:29,348.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 89348;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:29,348');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(29);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0074
     * @tc.name      testExpSubtitleTime0074
     * @tc.desc      SRT timestamp 90582ms formats as 00:01:30,582.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 90582;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:30,582');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(30);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0075
     * @tc.name      testExpSubtitleTime0075
     * @tc.desc      SRT timestamp 91816ms formats as 00:01:31,816.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 91816;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:31,816');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(31);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0076
     * @tc.name      testExpSubtitleTime0076
     * @tc.desc      SRT timestamp 93050ms formats as 00:01:33,050.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 93050;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:33,050');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(33);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0077
     * @tc.name      testExpSubtitleTime0077
     * @tc.desc      SRT timestamp 94284ms formats as 00:01:34,284.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 94284;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:34,284');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(34);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0078
     * @tc.name      testExpSubtitleTime0078
     * @tc.desc      SRT timestamp 95518ms formats as 00:01:35,518.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 95518;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:35,518');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(35);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0079
     * @tc.name      testExpSubtitleTime0079
     * @tc.desc      SRT timestamp 96752ms formats as 00:01:36,752.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 96752;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:36,752');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(36);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0080
     * @tc.name      testExpSubtitleTime0080
     * @tc.desc      SRT timestamp 97986ms formats as 00:01:37,986.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 97986;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:37,986');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(37);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0081
     * @tc.name      testExpSubtitleTime0081
     * @tc.desc      SRT timestamp 99220ms formats as 00:01:39,220.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 99220;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:39,220');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(39);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0082
     * @tc.name      testExpSubtitleTime0082
     * @tc.desc      SRT timestamp 100454ms formats as 00:01:40,454.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 100454;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:40,454');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(40);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0083
     * @tc.name      testExpSubtitleTime0083
     * @tc.desc      SRT timestamp 101688ms formats as 00:01:41,688.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 101688;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:41,688');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(41);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0084
     * @tc.name      testExpSubtitleTime0084
     * @tc.desc      SRT timestamp 102922ms formats as 00:01:42,922.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 102922;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:42,922');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(42);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0085
     * @tc.name      testExpSubtitleTime0085
     * @tc.desc      SRT timestamp 104156ms formats as 00:01:44,156.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 104156;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:44,156');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(44);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0086
     * @tc.name      testExpSubtitleTime0086
     * @tc.desc      SRT timestamp 105390ms formats as 00:01:45,390.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 105390;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:45,390');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(45);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0087
     * @tc.name      testExpSubtitleTime0087
     * @tc.desc      SRT timestamp 106624ms formats as 00:01:46,624.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 106624;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:46,624');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(46);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0088
     * @tc.name      testExpSubtitleTime0088
     * @tc.desc      SRT timestamp 107858ms formats as 00:01:47,858.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 107858;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:47,858');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(47);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0089
     * @tc.name      testExpSubtitleTime0089
     * @tc.desc      SRT timestamp 109092ms formats as 00:01:49,092.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 109092;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:49,092');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(49);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0090
     * @tc.name      testExpSubtitleTime0090
     * @tc.desc      SRT timestamp 110326ms formats as 00:01:50,326.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 110326;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:50,326');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(50);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0091
     * @tc.name      testExpSubtitleTime0091
     * @tc.desc      SRT timestamp 111560ms formats as 00:01:51,560.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 111560;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:51,560');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(51);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_TIME_0092
     * @tc.name      testExpSubtitleTime0092
     * @tc.desc      SRT timestamp 112794ms formats as 00:01:52,794.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleTime0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const totalMs: number = 112794;
      const hours: number = Math.floor(totalMs / 3600000);
      const minutes: number = Math.floor((totalMs % 3600000) / 60000);
      const seconds: number = Math.floor((totalMs % 60000) / 1000);
      const millis: number = totalMs % 1000;
      const text: string = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')},${millis.toString().padStart(3, '0')}`;
      expect(text).assertEqual('00:01:52,794');
      expect(hours).assertEqual(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual(52);
    })
  })
}

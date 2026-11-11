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


const TAG: string = '[Sample_SubtitleSafeParseCore]';
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
export default function subtitleSafeParseCoreTest(): void {
  describe('subtitleSafeParseCoreTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0001
     * @tc.name      testSafeParseTime0001
     * @tc.desc      Parse timestamp 00:00:00,500 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0002
     * @tc.name      testSafeParseTime0002
     * @tc.desc      Parse timestamp 00:00:01,734 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(734);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0003
     * @tc.name      testSafeParseTime0003
     * @tc.desc      Parse timestamp 00:00:02,968 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(968);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0004
     * @tc.name      testSafeParseTime0004
     * @tc.desc      Parse timestamp 00:00:04,202 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(202);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0005
     * @tc.name      testSafeParseTime0005
     * @tc.desc      Parse timestamp 00:00:05,436 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(436);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0006
     * @tc.name      testSafeParseTime0006
     * @tc.desc      Parse timestamp 00:00:06,670 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(670);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0007
     * @tc.name      testSafeParseTime0007
     * @tc.desc      Parse timestamp 00:00:07,904 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(904);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0008
     * @tc.name      testSafeParseTime0008
     * @tc.desc      Parse timestamp 00:00:09,138 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(138);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0009
     * @tc.name      testSafeParseTime0009
     * @tc.desc      Parse timestamp 00:00:10,372 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(372);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0010
     * @tc.name      testSafeParseTime0010
     * @tc.desc      Parse timestamp 00:00:11,606 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(606);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0011
     * @tc.name      testSafeParseTime0011
     * @tc.desc      Parse timestamp 00:00:12,840 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(840);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0012
     * @tc.name      testSafeParseTime0012
     * @tc.desc      Parse timestamp 00:00:14,074 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(74);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0013
     * @tc.name      testSafeParseTime0013
     * @tc.desc      Parse timestamp 00:00:15,308 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(308);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0014
     * @tc.name      testSafeParseTime0014
     * @tc.desc      Parse timestamp 00:00:16,542 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(542);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0015
     * @tc.name      testSafeParseTime0015
     * @tc.desc      Parse timestamp 00:00:17,776 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(776);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0016
     * @tc.name      testSafeParseTime0016
     * @tc.desc      Parse timestamp 00:00:19,010 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0017
     * @tc.name      testSafeParseTime0017
     * @tc.desc      Parse timestamp 00:00:20,244 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(244);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0018
     * @tc.name      testSafeParseTime0018
     * @tc.desc      Parse timestamp 00:00:21,478 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(478);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0019
     * @tc.name      testSafeParseTime0019
     * @tc.desc      Parse timestamp 00:00:22,712 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(712);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0020
     * @tc.name      testSafeParseTime0020
     * @tc.desc      Parse timestamp 00:00:23,946 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(946);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0021
     * @tc.name      testSafeParseTime0021
     * @tc.desc      Parse timestamp 00:00:25,180 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(180);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0022
     * @tc.name      testSafeParseTime0022
     * @tc.desc      Parse timestamp 00:00:26,414 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(414);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0023
     * @tc.name      testSafeParseTime0023
     * @tc.desc      Parse timestamp 00:00:27,648 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(648);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0024
     * @tc.name      testSafeParseTime0024
     * @tc.desc      Parse timestamp 00:00:28,882 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(882);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0025
     * @tc.name      testSafeParseTime0025
     * @tc.desc      Parse timestamp 00:00:30,116 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(116);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0026
     * @tc.name      testSafeParseTime0026
     * @tc.desc      Parse timestamp 00:00:31,350 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(350);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0027
     * @tc.name      testSafeParseTime0027
     * @tc.desc      Parse timestamp 00:00:32,584 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(584);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0028
     * @tc.name      testSafeParseTime0028
     * @tc.desc      Parse timestamp 00:00:33,818 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(818);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0029
     * @tc.name      testSafeParseTime0029
     * @tc.desc      Parse timestamp 00:00:35,052 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(52);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0030
     * @tc.name      testSafeParseTime0030
     * @tc.desc      Parse timestamp 00:00:36,286 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(286);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0031
     * @tc.name      testSafeParseTime0031
     * @tc.desc      Parse timestamp 00:00:37,520 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(520);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0032
     * @tc.name      testSafeParseTime0032
     * @tc.desc      Parse timestamp 00:00:38,754 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(754);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0033
     * @tc.name      testSafeParseTime0033
     * @tc.desc      Parse timestamp 00:00:39,988 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(988);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0034
     * @tc.name      testSafeParseTime0034
     * @tc.desc      Parse timestamp 00:00:41,222 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(222);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0035
     * @tc.name      testSafeParseTime0035
     * @tc.desc      Parse timestamp 00:00:42,456 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(456);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0036
     * @tc.name      testSafeParseTime0036
     * @tc.desc      Parse timestamp 00:00:43,690 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(690);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0037
     * @tc.name      testSafeParseTime0037
     * @tc.desc      Parse timestamp 00:00:44,924 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(924);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0038
     * @tc.name      testSafeParseTime0038
     * @tc.desc      Parse timestamp 00:00:46,158 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(158);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0039
     * @tc.name      testSafeParseTime0039
     * @tc.desc      Parse timestamp 00:00:47,392 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(392);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0040
     * @tc.name      testSafeParseTime0040
     * @tc.desc      Parse timestamp 00:00:48,626 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(626);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0041
     * @tc.name      testSafeParseTime0041
     * @tc.desc      Parse timestamp 00:00:49,860 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(860);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0042
     * @tc.name      testSafeParseTime0042
     * @tc.desc      Parse timestamp 00:00:51,094 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(94);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0043
     * @tc.name      testSafeParseTime0043
     * @tc.desc      Parse timestamp 00:00:52,328 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(328);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0044
     * @tc.name      testSafeParseTime0044
     * @tc.desc      Parse timestamp 00:00:53,562 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(562);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0045
     * @tc.name      testSafeParseTime0045
     * @tc.desc      Parse timestamp 00:00:54,796 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(796);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0046
     * @tc.name      testSafeParseTime0046
     * @tc.desc      Parse timestamp 00:00:56,030 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(30);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0047
     * @tc.name      testSafeParseTime0047
     * @tc.desc      Parse timestamp 00:00:57,264 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(264);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0048
     * @tc.name      testSafeParseTime0048
     * @tc.desc      Parse timestamp 00:00:58,498 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(498);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0049
     * @tc.name      testSafeParseTime0049
     * @tc.desc      Parse timestamp 00:00:59,732 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(732);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0050
     * @tc.name      testSafeParseTime0050
     * @tc.desc      Parse timestamp 00:01:00,966 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(966);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0051
     * @tc.name      testSafeParseTime0051
     * @tc.desc      Parse timestamp 00:01:02,200 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(200);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0052
     * @tc.name      testSafeParseTime0052
     * @tc.desc      Parse timestamp 00:01:03,434 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(434);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0053
     * @tc.name      testSafeParseTime0053
     * @tc.desc      Parse timestamp 00:01:04,668 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(668);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0054
     * @tc.name      testSafeParseTime0054
     * @tc.desc      Parse timestamp 00:01:05,902 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(902);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0055
     * @tc.name      testSafeParseTime0055
     * @tc.desc      Parse timestamp 00:01:07,136 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(136);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0056
     * @tc.name      testSafeParseTime0056
     * @tc.desc      Parse timestamp 00:01:08,370 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(370);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0057
     * @tc.name      testSafeParseTime0057
     * @tc.desc      Parse timestamp 00:01:09,604 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(604);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0058
     * @tc.name      testSafeParseTime0058
     * @tc.desc      Parse timestamp 00:01:10,838 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(838);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0059
     * @tc.name      testSafeParseTime0059
     * @tc.desc      Parse timestamp 00:01:12,072 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(72);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0060
     * @tc.name      testSafeParseTime0060
     * @tc.desc      Parse timestamp 00:01:13,306 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(306);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0061
     * @tc.name      testSafeParseTime0061
     * @tc.desc      Parse timestamp 00:01:14,540 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(540);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0062
     * @tc.name      testSafeParseTime0062
     * @tc.desc      Parse timestamp 00:01:15,774 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(774);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0063
     * @tc.name      testSafeParseTime0063
     * @tc.desc      Parse timestamp 00:01:17,008 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(8);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0064
     * @tc.name      testSafeParseTime0064
     * @tc.desc      Parse timestamp 00:01:18,242 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(242);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0065
     * @tc.name      testSafeParseTime0065
     * @tc.desc      Parse timestamp 00:01:19,476 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(476);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0066
     * @tc.name      testSafeParseTime0066
     * @tc.desc      Parse timestamp 00:01:20,710 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(710);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0067
     * @tc.name      testSafeParseTime0067
     * @tc.desc      Parse timestamp 00:01:21,944 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(944);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0068
     * @tc.name      testSafeParseTime0068
     * @tc.desc      Parse timestamp 00:01:23,178 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(178);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0069
     * @tc.name      testSafeParseTime0069
     * @tc.desc      Parse timestamp 00:01:24,412 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(412);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0070
     * @tc.name      testSafeParseTime0070
     * @tc.desc      Parse timestamp 00:01:25,646 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(646);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0071
     * @tc.name      testSafeParseTime0071
     * @tc.desc      Parse timestamp 00:01:26,880 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(880);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0072
     * @tc.name      testSafeParseTime0072
     * @tc.desc      Parse timestamp 00:01:28,114 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(114);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0073
     * @tc.name      testSafeParseTime0073
     * @tc.desc      Parse timestamp 00:01:29,348 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(348);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0074
     * @tc.name      testSafeParseTime0074
     * @tc.desc      Parse timestamp 00:01:30,582 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(582);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0075
     * @tc.name      testSafeParseTime0075
     * @tc.desc      Parse timestamp 00:01:31,816 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(816);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0076
     * @tc.name      testSafeParseTime0076
     * @tc.desc      Parse timestamp 00:01:33,050 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(50);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0077
     * @tc.name      testSafeParseTime0077
     * @tc.desc      Parse timestamp 00:01:34,284 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(284);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0078
     * @tc.name      testSafeParseTime0078
     * @tc.desc      Parse timestamp 00:01:35,518 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(518);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0079
     * @tc.name      testSafeParseTime0079
     * @tc.desc      Parse timestamp 00:01:36,752 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(752);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0080
     * @tc.name      testSafeParseTime0080
     * @tc.desc      Parse timestamp 00:01:37,986 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(986);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0081
     * @tc.name      testSafeParseTime0081
     * @tc.desc      Parse timestamp 00:01:39,220 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(220);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0082
     * @tc.name      testSafeParseTime0082
     * @tc.desc      Parse timestamp 00:01:40,454 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(454);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0083
     * @tc.name      testSafeParseTime0083
     * @tc.desc      Parse timestamp 00:01:41,688 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(688);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0084
     * @tc.name      testSafeParseTime0084
     * @tc.desc      Parse timestamp 00:01:42,922 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(922);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0085
     * @tc.name      testSafeParseTime0085
     * @tc.desc      Parse timestamp 00:01:44,156 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(156);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0086
     * @tc.name      testSafeParseTime0086
     * @tc.desc      Parse timestamp 00:01:45,390 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(390);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0087
     * @tc.name      testSafeParseTime0087
     * @tc.desc      Parse timestamp 00:01:46,624 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(624);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PA_0088
     * @tc.name      testSafeParseTime0088
     * @tc.desc      Parse timestamp 00:01:47,858 to expected millisecond fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseTime0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(millis).assertEqual(858);
    })
  })
}

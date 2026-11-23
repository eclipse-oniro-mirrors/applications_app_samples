/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { beforeEach, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from './YieldToEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { notificationManager } from '@kit.NotificationKit';
import testNapi from 'libentry.so';

const DOMAIN: number = 0xF814;
const TAG: string = 'NapiQueryExtendedTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function sleep(duration: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => { resolve(); }, duration);
  });
}

function collectLoopFlags(rounds: number): boolean[] {
  const flags: boolean[] = [];
  for (let i: number = 0; i < rounds; i++) {
    const current: boolean = testNapi.isNotificationEnabled();
    flags.push(typeof current === 'boolean' && (current === true || current === false));
  }
  return flags;
}

export default function napiQueryExtendedTest(): void {
  describe('NapiQueryExtendedTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0101
     * @tc.name      testNapiQueryExtended0101
     * @tc.desc      Verify three looped native queries keep valid boolean results.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0101 begin');
      const flags: boolean[] = collectLoopFlags(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual flags.length=${flags.length}, expected=3`);
      expect(flags.length).assertEqual(3);
      for (let i: number = 0; i < flags.length; i++) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue flags[i]=${flags[i]}`);
        expect(flags[i]).assertTrue();
      }
      log('testNapiQueryExtended0101 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0102
     * @tc.name      testNapiQueryExtended0102
     * @tc.desc      Verify four looped native queries keep valid boolean results.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0102 begin');
      const flags: boolean[] = collectLoopFlags(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual flags.length=${flags.length}, expected=4`);
      expect(flags.length).assertEqual(4);
      for (let i: number = 0; i < flags.length; i++) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue flags[i]=${flags[i]}`);
        expect(flags[i]).assertTrue();
      }
      log('testNapiQueryExtended0102 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0103
     * @tc.name      testNapiQueryExtended0103
     * @tc.desc      Verify five looped native queries keep valid boolean results.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0103 begin');
      const flags: boolean[] = collectLoopFlags(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual flags.length=${flags.length}, expected=5`);
      expect(flags.length).assertEqual(5);
      for (let i: number = 0; i < flags.length; i++) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue flags[i]=${flags[i]}`);
        expect(flags[i]).assertTrue();
      }
      log('testNapiQueryExtended0103 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0104
     * @tc.name      testNapiQueryExtended0104
     * @tc.desc      Verify six looped native queries keep valid boolean results.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0104 begin');
      const flags: boolean[] = collectLoopFlags(6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual flags.length=${flags.length}, expected=6`);
      expect(flags.length).assertEqual(6);
      for (let i: number = 0; i < flags.length; i++) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue flags[i]=${flags[i]}`);
        expect(flags[i]).assertTrue();
      }
      log('testNapiQueryExtended0104 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0105
     * @tc.name      testNapiQueryExtended0105
     * @tc.desc      Verify seven looped native queries keep valid boolean results.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0105 begin');
      const flags: boolean[] = collectLoopFlags(7);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual flags.length=${flags.length}, expected=7`);
      expect(flags.length).assertEqual(7);
      for (let i: number = 0; i < flags.length; i++) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue flags[i]=${flags[i]}`);
        expect(flags[i]).assertTrue();
      }
      log('testNapiQueryExtended0105 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0106
     * @tc.name      testNapiQueryExtended0106
     * @tc.desc      Verify eight looped native queries keep valid boolean results.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0106 begin');
      const flags: boolean[] = collectLoopFlags(8);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual flags.length=${flags.length}, expected=8`);
      expect(flags.length).assertEqual(8);
      for (let i: number = 0; i < flags.length; i++) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue flags[i]=${flags[i]}`);
        expect(flags[i]).assertTrue();
      }
      log('testNapiQueryExtended0106 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0107
     * @tc.name      testNapiQueryExtended0107
     * @tc.desc      Verify nine looped native queries keep valid boolean results.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0107 begin');
      const flags: boolean[] = collectLoopFlags(9);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual flags.length=${flags.length}, expected=9`);
      expect(flags.length).assertEqual(9);
      for (let i: number = 0; i < flags.length; i++) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue flags[i]=${flags[i]}`);
        expect(flags[i]).assertTrue();
      }
      log('testNapiQueryExtended0107 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0108
     * @tc.name      testNapiQueryExtended0108
     * @tc.desc      Verify ten looped native queries keep valid boolean results.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0108 begin');
      const flags: boolean[] = collectLoopFlags(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual flags.length=${flags.length}, expected=10`);
      expect(flags.length).assertEqual(10);
      for (let i: number = 0; i < flags.length; i++) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue flags[i]=${flags[i]}`);
        expect(flags[i]).assertTrue();
      }
      log('testNapiQueryExtended0108 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0109
     * @tc.name      testNapiQueryExtended0109
     * @tc.desc      Verify twelve looped native queries keep valid boolean results.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0109 begin');
      const flags: boolean[] = collectLoopFlags(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual flags.length=${flags.length}, expected=12`);
      expect(flags.length).assertEqual(12);
      for (let i: number = 0; i < flags.length; i++) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue flags[i]=${flags[i]}`);
        expect(flags[i]).assertTrue();
      }
      log('testNapiQueryExtended0109 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0110
     * @tc.name      testNapiQueryExtended0110
     * @tc.desc      Verify fifteen looped native queries keep valid boolean results.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0110 begin');
      const flags: boolean[] = collectLoopFlags(15);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual flags.length=${flags.length}, expected=15`);
      expect(flags.length).assertEqual(15);
      for (let i: number = 0; i < flags.length; i++) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue flags[i]=${flags[i]}`);
        expect(flags[i]).assertTrue();
      }
      log('testNapiQueryExtended0110 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0111
     * @tc.name      testNapiQueryExtended0111
     * @tc.desc      Verify one native then one system query pair agree.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0111 begin');
      const nativeValue: boolean = testNapi.isNotificationEnabled();
      const systemValue: boolean = await notificationManager.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=systemValue`);
      expect(nativeValue).assertEqual(systemValue);
      log('testNapiQueryExtended0111 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0112
     * @tc.name      testNapiQueryExtended0112
     * @tc.desc      Verify a native system native sequence stays consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0112 begin');
      const nativeFirst: boolean = testNapi.isNotificationEnabled();
      const systemValue: boolean = await notificationManager.isNotificationEnabled();
      const nativeSecond: boolean = testNapi.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeFirst=${nativeFirst}, expected=systemValue`);
      expect(nativeFirst).assertEqual(systemValue);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeSecond=${nativeSecond}, expected=systemValue`);
      expect(nativeSecond).assertEqual(systemValue);
      log('testNapiQueryExtended0112 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0113
     * @tc.name      testNapiQueryExtended0113
     * @tc.desc      Verify a system native system sequence stays consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0113 begin');
      const systemFirst: boolean = await notificationManager.isNotificationEnabled();
      const nativeValue: boolean = testNapi.isNotificationEnabled();
      const systemSecond: boolean = await notificationManager.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=systemFirst`);
      expect(nativeValue).assertEqual(systemFirst);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual systemSecond=${systemSecond}, expected=systemFirst`);
      expect(systemSecond).assertEqual(systemFirst);
      log('testNapiQueryExtended0113 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0114
     * @tc.name      testNapiQueryExtended0114
     * @tc.desc      Verify two interleaved native and system query pairs agree.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0114 begin');
      const nativeBase: boolean = testNapi.isNotificationEnabled();
      for (let i: number = 0; i < 2; i++) {
        const nativeValue: boolean = testNapi.isNotificationEnabled();
        const systemValue: boolean = await notificationManager.isNotificationEnabled();
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=systemValue`);
        expect(nativeValue).assertEqual(systemValue);
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=nativeBase`);
        expect(nativeValue).assertEqual(nativeBase);
      }
      log('testNapiQueryExtended0114 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0115
     * @tc.name      testNapiQueryExtended0115
     * @tc.desc      Verify three interleaved native and system query pairs agree.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0115 begin');
      const nativeBase: boolean = testNapi.isNotificationEnabled();
      for (let i: number = 0; i < 3; i++) {
        const nativeValue: boolean = testNapi.isNotificationEnabled();
        const systemValue: boolean = await notificationManager.isNotificationEnabled();
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=systemValue`);
        expect(nativeValue).assertEqual(systemValue);
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=nativeBase`);
        expect(nativeValue).assertEqual(nativeBase);
      }
      log('testNapiQueryExtended0115 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0116
     * @tc.name      testNapiQueryExtended0116
     * @tc.desc      Verify four interleaved native and system query pairs agree.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0116 begin');
      const nativeBase: boolean = testNapi.isNotificationEnabled();
      for (let i: number = 0; i < 4; i++) {
        const nativeValue: boolean = testNapi.isNotificationEnabled();
        const systemValue: boolean = await notificationManager.isNotificationEnabled();
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=systemValue`);
        expect(nativeValue).assertEqual(systemValue);
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=nativeBase`);
        expect(nativeValue).assertEqual(nativeBase);
      }
      log('testNapiQueryExtended0116 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0117
     * @tc.name      testNapiQueryExtended0117
     * @tc.desc      Verify five interleaved native and system query pairs agree.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0117 begin');
      const nativeBase: boolean = testNapi.isNotificationEnabled();
      for (let i: number = 0; i < 5; i++) {
        const nativeValue: boolean = testNapi.isNotificationEnabled();
        const systemValue: boolean = await notificationManager.isNotificationEnabled();
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=systemValue`);
        expect(nativeValue).assertEqual(systemValue);
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=nativeBase`);
        expect(nativeValue).assertEqual(nativeBase);
      }
      log('testNapiQueryExtended0117 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0118
     * @tc.name      testNapiQueryExtended0118
     * @tc.desc      Verify six interleaved native and system query pairs agree.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0118 begin');
      const nativeBase: boolean = testNapi.isNotificationEnabled();
      for (let i: number = 0; i < 6; i++) {
        const nativeValue: boolean = testNapi.isNotificationEnabled();
        const systemValue: boolean = await notificationManager.isNotificationEnabled();
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=systemValue`);
        expect(nativeValue).assertEqual(systemValue);
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=nativeBase`);
        expect(nativeValue).assertEqual(nativeBase);
      }
      log('testNapiQueryExtended0118 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0119
     * @tc.name      testNapiQueryExtended0119
     * @tc.desc      Verify eight interleaved native and system query pairs agree.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0119 begin');
      const nativeBase: boolean = testNapi.isNotificationEnabled();
      for (let i: number = 0; i < 8; i++) {
        const nativeValue: boolean = testNapi.isNotificationEnabled();
        const systemValue: boolean = await notificationManager.isNotificationEnabled();
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=systemValue`);
        expect(nativeValue).assertEqual(systemValue);
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=nativeBase`);
        expect(nativeValue).assertEqual(nativeBase);
      }
      log('testNapiQueryExtended0119 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0120
     * @tc.name      testNapiQueryExtended0120
     * @tc.desc      Verify ten interleaved native and system query pairs agree.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0120 begin');
      const nativeBase: boolean = testNapi.isNotificationEnabled();
      for (let i: number = 0; i < 10; i++) {
        const nativeValue: boolean = testNapi.isNotificationEnabled();
        const systemValue: boolean = await notificationManager.isNotificationEnabled();
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=systemValue`);
        expect(nativeValue).assertEqual(systemValue);
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=nativeBase`);
        expect(nativeValue).assertEqual(nativeBase);
      }
      log('testNapiQueryExtended0120 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0121
     * @tc.name      testNapiQueryExtended0121
     * @tc.desc      Verify native and system queries agree after a 20ms delay.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0121 begin');
      await sleep(20);
      const nativeValue: boolean = testNapi.isNotificationEnabled();
      const systemValue: boolean = await notificationManager.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=systemValue`);
      expect(nativeValue).assertEqual(systemValue);
      log('testNapiQueryExtended0121 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0122
     * @tc.name      testNapiQueryExtended0122
     * @tc.desc      Verify native and system queries agree after a 40ms delay.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0122 begin');
      await sleep(40);
      const nativeValue: boolean = testNapi.isNotificationEnabled();
      const systemValue: boolean = await notificationManager.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=systemValue`);
      expect(nativeValue).assertEqual(systemValue);
      log('testNapiQueryExtended0122 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0123
     * @tc.name      testNapiQueryExtended0123
     * @tc.desc      Verify native and system queries agree after a 60ms delay.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0123 begin');
      await sleep(60);
      const nativeValue: boolean = testNapi.isNotificationEnabled();
      const systemValue: boolean = await notificationManager.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=systemValue`);
      expect(nativeValue).assertEqual(systemValue);
      log('testNapiQueryExtended0123 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0124
     * @tc.name      testNapiQueryExtended0124
     * @tc.desc      Verify native and system queries agree after an 80ms delay.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0124 begin');
      await sleep(80);
      const nativeValue: boolean = testNapi.isNotificationEnabled();
      const systemValue: boolean = await notificationManager.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=systemValue`);
      expect(nativeValue).assertEqual(systemValue);
      log('testNapiQueryExtended0124 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0125
     * @tc.name      testNapiQueryExtended0125
     * @tc.desc      Verify native and system queries agree after a 120ms delay.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0125 begin');
      await sleep(120);
      const nativeValue: boolean = testNapi.isNotificationEnabled();
      const systemValue: boolean = await notificationManager.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=systemValue`);
      expect(nativeValue).assertEqual(systemValue);
      log('testNapiQueryExtended0125 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0126
     * @tc.name      testNapiQueryExtended0126
     * @tc.desc      Verify native and system queries agree after a 150ms delay.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0126 begin');
      await sleep(150);
      const nativeValue: boolean = testNapi.isNotificationEnabled();
      const systemValue: boolean = await notificationManager.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=systemValue`);
      expect(nativeValue).assertEqual(systemValue);
      log('testNapiQueryExtended0126 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0127
     * @tc.name      testNapiQueryExtended0127
     * @tc.desc      Verify native and system queries agree after a 250ms delay.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0127 begin');
      await sleep(250);
      const nativeValue: boolean = testNapi.isNotificationEnabled();
      const systemValue: boolean = await notificationManager.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=systemValue`);
      expect(nativeValue).assertEqual(systemValue);
      log('testNapiQueryExtended0127 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0128
     * @tc.name      testNapiQueryExtended0128
     * @tc.desc      Verify native and system queries agree after a 350ms delay.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0128 begin');
      await sleep(350);
      const nativeValue: boolean = testNapi.isNotificationEnabled();
      const systemValue: boolean = await notificationManager.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=systemValue`);
      expect(nativeValue).assertEqual(systemValue);
      log('testNapiQueryExtended0128 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0129
     * @tc.name      testNapiQueryExtended0129
     * @tc.desc      Verify native and system queries agree after a 450ms delay.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0129 begin');
      await sleep(450);
      const nativeValue: boolean = testNapi.isNotificationEnabled();
      const systemValue: boolean = await notificationManager.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=systemValue`);
      expect(nativeValue).assertEqual(systemValue);
      log('testNapiQueryExtended0129 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0130
     * @tc.name      testNapiQueryExtended0130
     * @tc.desc      Verify native and system queries agree after a 600ms delay.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0130 begin');
      await sleep(600);
      const nativeValue: boolean = testNapi.isNotificationEnabled();
      const systemValue: boolean = await notificationManager.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=systemValue`);
      expect(nativeValue).assertEqual(systemValue);
      log('testNapiQueryExtended0130 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0131
     * @tc.name      testNapiQueryExtended0131
     * @tc.desc      Verify eight joined native queries all agree with the first one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0131 begin');
      const first: boolean = testNapi.isNotificationEnabled();
      const joined: boolean[] = await Promise.all([
        testNapi.isNotificationEnabled(),
        testNapi.isNotificationEnabled(),
        testNapi.isNotificationEnabled(),
        testNapi.isNotificationEnabled(),
        testNapi.isNotificationEnabled(),
        testNapi.isNotificationEnabled(),
        testNapi.isNotificationEnabled(),
        testNapi.isNotificationEnabled()
      ]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual joined.length=${joined.length}, expected=8`);
      expect(joined.length).assertEqual(8);
      for (let i: number = 0; i < joined.length; i++) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual joined[i]=${joined[i]}, expected=first`);
        expect(joined[i]).assertEqual(first);
      }
      log('testNapiQueryExtended0131 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0132
     * @tc.name      testNapiQueryExtended0132
     * @tc.desc      Verify sixteen joined native queries all keep boolean type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0132 begin');
      const joined: boolean[] = await Promise.all([
        testNapi.isNotificationEnabled(),
        testNapi.isNotificationEnabled(),
        testNapi.isNotificationEnabled(),
        testNapi.isNotificationEnabled(),
        testNapi.isNotificationEnabled(),
        testNapi.isNotificationEnabled(),
        testNapi.isNotificationEnabled(),
        testNapi.isNotificationEnabled(),
        testNapi.isNotificationEnabled(),
        testNapi.isNotificationEnabled(),
        testNapi.isNotificationEnabled(),
        testNapi.isNotificationEnabled(),
        testNapi.isNotificationEnabled(),
        testNapi.isNotificationEnabled(),
        testNapi.isNotificationEnabled(),
        testNapi.isNotificationEnabled()
      ]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual joined.length=${joined.length}, expected=16`);
      expect(joined.length).assertEqual(16);
      for (let i: number = 0; i < joined.length; i++) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof joined[i]=${typeof joined[i]}, expected='boolean'`);
        expect(typeof joined[i]).assertEqual('boolean');
      }
      log('testNapiQueryExtended0132 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0133
     * @tc.name      testNapiQueryExtended0133
     * @tc.desc      Verify ten native calls before a system query stay consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0133 begin');
      let lastNative: boolean = false;
      for (let i: number = 0; i < 10; i++) {
        lastNative = testNapi.isNotificationEnabled();
      }
      const systemValue: boolean = await notificationManager.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual lastNative=${lastNative}, expected=systemValue`);
      expect(lastNative).assertEqual(systemValue);
      log('testNapiQueryExtended0133 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0134
     * @tc.name      testNapiQueryExtended0134
     * @tc.desc      Verify the system query first then ten native calls stay consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0134 begin');
      const systemValue: boolean = await notificationManager.isNotificationEnabled();
      let lastNative: boolean = false;
      for (let i: number = 0; i < 10; i++) {
        lastNative = testNapi.isNotificationEnabled();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual lastNative=${lastNative}, expected=systemValue`);
      expect(lastNative).assertEqual(systemValue);
      log('testNapiQueryExtended0134 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0135
     * @tc.name      testNapiQueryExtended0135
     * @tc.desc      Verify system native system sandwich keeps all three equal.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0135 begin');
      const systemFirst: boolean = await notificationManager.isNotificationEnabled();
      const nativeValue: boolean = testNapi.isNotificationEnabled();
      const systemSecond: boolean = await notificationManager.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual systemFirst=${systemFirst}, expected=nativeValue`);
      expect(systemFirst).assertEqual(nativeValue);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual systemSecond=${systemSecond}, expected=nativeValue`);
      expect(systemSecond).assertEqual(nativeValue);
      log('testNapiQueryExtended0135 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0136
     * @tc.name      testNapiQueryExtended0136
     * @tc.desc      Verify two joined native batches return the same value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0136 begin');
      const batchOne: boolean[] = await Promise.all([
        testNapi.isNotificationEnabled(),
        testNapi.isNotificationEnabled(),
        testNapi.isNotificationEnabled(),
        testNapi.isNotificationEnabled()
      ]);
      const batchTwo: boolean[] = await Promise.all([
        testNapi.isNotificationEnabled(),
        testNapi.isNotificationEnabled(),
        testNapi.isNotificationEnabled(),
        testNapi.isNotificationEnabled()
      ]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual batchOne.length=${batchOne.length}, expected=4`);
      expect(batchOne.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual batchTwo.length=${batchTwo.length}, expected=4`);
      expect(batchTwo.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual batchTwo[0]=${batchTwo[0]}, expected=batchOne[0]`);
      expect(batchTwo[0]).assertEqual(batchOne[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual batchTwo[3]=${batchTwo[3]}, expected=batchOne[0]`);
      expect(batchTwo[3]).assertEqual(batchOne[0]);
      log('testNapiQueryExtended0136 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0137
     * @tc.name      testNapiQueryExtended0137
     * @tc.desc      Verify three rounds over short delays stay consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0137 begin');
      const base: boolean = testNapi.isNotificationEnabled();
      await sleep(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${testNapi.isNotificationEnabled()}, expected=base`);
      expect(testNapi.isNotificationEnabled()).assertEqual(base);
      await sleep(20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${testNapi.isNotificationEnabled()}, expected=base`);
      expect(testNapi.isNotificationEnabled()).assertEqual(base);
      await sleep(30);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${testNapi.isNotificationEnabled()}, expected=base`);
      expect(testNapi.isNotificationEnabled()).assertEqual(base);
      log('testNapiQueryExtended0137 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0138
     * @tc.name      testNapiQueryExtended0138
     * @tc.desc      Verify thirty native calls all stay inside the boolean domain.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0138 begin');
      let inDomain: boolean = true;
      for (let i: number = 0; i < 30; i++) {
        const current: boolean = testNapi.isNotificationEnabled();
        if (!(current === true || current === false)) {
          inDomain = false;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue inDomain=${inDomain}`);
      expect(inDomain).assertTrue();
      log('testNapiQueryExtended0138 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0139
     * @tc.name      testNapiQueryExtended0139
     * @tc.desc      Verify a thirty call run ends consistent with the system query.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0139 begin');
      const first: boolean = testNapi.isNotificationEnabled();
      let last: boolean = first;
      for (let i: number = 0; i < 30; i++) {
        last = testNapi.isNotificationEnabled();
      }
      const systemValue: boolean = await notificationManager.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual last=${last}, expected=first`);
      expect(last).assertEqual(first);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual last=${last}, expected=systemValue`);
      expect(last).assertEqual(systemValue);
      log('testNapiQueryExtended0139 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQEXT_0140
     * @tc.name      testNapiQueryExtended0140
     * @tc.desc      Verify a mixed twenty five call run keeps the boolean type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryExtended0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryExtended0140 begin');
      const first: boolean = testNapi.isNotificationEnabled();
      let allBoolean: boolean = true;
      for (let i: number = 0; i < 25; i++) {
        const current: boolean = testNapi.isNotificationEnabled();
        if (typeof current !== 'boolean') {
          allBoolean = false;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allBoolean=${allBoolean}`);
      expect(allBoolean).assertTrue();
      const systemValue: boolean = await notificationManager.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first=${first}, expected=systemValue`);
      expect(first).assertEqual(systemValue);
      log('testNapiQueryExtended0140 end');
    })
  })
}

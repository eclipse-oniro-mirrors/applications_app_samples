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
const TAG: string = 'NapiQueryCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function sleep(duration: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => { resolve(); }, duration);
  });
}

export default function napiQueryCoreTest(): void {
  describe('NapiQueryCoreTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQCORE_0001
     * @tc.name      testNapiQueryCore0001
     * @tc.desc      Verify the native query returns a boolean typed value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryCore0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryCore0001 begin');
      const nativeValue: boolean = testNapi.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof nativeValue=${typeof nativeValue}, expected='boolean'`);
      expect(typeof nativeValue).assertEqual('boolean');
      log('testNapiQueryCore0001 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQCORE_0002
     * @tc.name      testNapiQueryCore0002
     * @tc.desc      Verify the native query result stays inside the boolean domain.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryCore0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryCore0002 begin');
      const nativeValue: boolean = testNapi.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${nativeValue === true || nativeValue === false}`);
      expect(nativeValue === true || nativeValue === false).assertTrue();
      log('testNapiQueryCore0002 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQCORE_0003
     * @tc.name      testNapiQueryCore0003
     * @tc.desc      Verify three consecutive native queries keep the boolean type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryCore0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryCore0003 begin');
      const first: boolean = testNapi.isNotificationEnabled();
      const second: boolean = testNapi.isNotificationEnabled();
      const third: boolean = testNapi.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof first=${typeof first}, expected='boolean'`);
      expect(typeof first).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof second=${typeof second}, expected='boolean'`);
      expect(typeof second).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof third=${typeof third}, expected='boolean'`);
      expect(typeof third).assertEqual('boolean');
      log('testNapiQueryCore0003 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQCORE_0004
     * @tc.name      testNapiQueryCore0004
     * @tc.desc      Verify three consecutive native queries return the same value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryCore0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryCore0004 begin');
      const first: boolean = testNapi.isNotificationEnabled();
      const second: boolean = testNapi.isNotificationEnabled();
      const third: boolean = testNapi.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second=${second}, expected=first`);
      expect(second).assertEqual(first);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual third=${third}, expected=first`);
      expect(third).assertEqual(first);
      log('testNapiQueryCore0004 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQCORE_0005
     * @tc.name      testNapiQueryCore0005
     * @tc.desc      Verify two independent native query calls agree with each other.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryCore0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryCore0005 begin');
      const first: boolean = testNapi.isNotificationEnabled();
      const second: boolean = testNapi.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue first === second=${first === second}`);
      expect(first === second).assertTrue();
      log('testNapiQueryCore0005 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQCORE_0006
     * @tc.name      testNapiQueryCore0006
     * @tc.desc      Verify the native query agrees with the system query round 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryCore0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryCore0006 begin');
      const nativeValue: boolean = testNapi.isNotificationEnabled();
      const systemValue: boolean = await notificationManager.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=systemValue`);
      expect(nativeValue).assertEqual(systemValue);
      log('testNapiQueryCore0006 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQCORE_0007
     * @tc.name      testNapiQueryCore0007
     * @tc.desc      Verify the native query agrees with the system query round 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryCore0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryCore0007 begin');
      const nativeValue: boolean = testNapi.isNotificationEnabled();
      const systemValue: boolean = await notificationManager.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=systemValue`);
      expect(nativeValue).assertEqual(systemValue);
      log('testNapiQueryCore0007 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQCORE_0008
     * @tc.name      testNapiQueryCore0008
     * @tc.desc      Verify the native query agrees with the system query round 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryCore0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryCore0008 begin');
      const nativeValue: boolean = testNapi.isNotificationEnabled();
      const systemValue: boolean = await notificationManager.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=systemValue`);
      expect(nativeValue).assertEqual(systemValue);
      log('testNapiQueryCore0008 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQCORE_0009
     * @tc.name      testNapiQueryCore0009
     * @tc.desc      Verify the native query agrees with the system query round 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryCore0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryCore0009 begin');
      const nativeValue: boolean = testNapi.isNotificationEnabled();
      const systemValue: boolean = await notificationManager.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=systemValue`);
      expect(nativeValue).assertEqual(systemValue);
      log('testNapiQueryCore0009 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQCORE_0010
     * @tc.name      testNapiQueryCore0010
     * @tc.desc      Verify the native query agrees with the system query round 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryCore0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryCore0010 begin');
      const nativeValue: boolean = testNapi.isNotificationEnabled();
      const systemValue: boolean = await notificationManager.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=systemValue`);
      expect(nativeValue).assertEqual(systemValue);
      log('testNapiQueryCore0010 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQCORE_0011
     * @tc.name      testNapiQueryCore0011
     * @tc.desc      Verify the native query agrees with the system query round 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryCore0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryCore0011 begin');
      const nativeValue: boolean = testNapi.isNotificationEnabled();
      const systemValue: boolean = await notificationManager.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=systemValue`);
      expect(nativeValue).assertEqual(systemValue);
      log('testNapiQueryCore0011 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQCORE_0012
     * @tc.name      testNapiQueryCore0012
     * @tc.desc      Verify the native query agrees with the system query round 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryCore0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryCore0012 begin');
      const nativeValue: boolean = testNapi.isNotificationEnabled();
      const systemValue: boolean = await notificationManager.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=systemValue`);
      expect(nativeValue).assertEqual(systemValue);
      log('testNapiQueryCore0012 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQCORE_0013
     * @tc.name      testNapiQueryCore0013
     * @tc.desc      Verify the native query agrees with the system query round 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryCore0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryCore0013 begin');
      const nativeValue: boolean = testNapi.isNotificationEnabled();
      const systemValue: boolean = await notificationManager.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=systemValue`);
      expect(nativeValue).assertEqual(systemValue);
      log('testNapiQueryCore0013 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQCORE_0014
     * @tc.name      testNapiQueryCore0014
     * @tc.desc      Verify the native query agrees with the system query round 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryCore0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryCore0014 begin');
      const nativeValue: boolean = testNapi.isNotificationEnabled();
      const systemValue: boolean = await notificationManager.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=systemValue`);
      expect(nativeValue).assertEqual(systemValue);
      log('testNapiQueryCore0014 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQCORE_0015
     * @tc.name      testNapiQueryCore0015
     * @tc.desc      Verify the native query agrees with the system query round 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryCore0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryCore0015 begin');
      const nativeValue: boolean = testNapi.isNotificationEnabled();
      const systemValue: boolean = await notificationManager.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=systemValue`);
      expect(nativeValue).assertEqual(systemValue);
      log('testNapiQueryCore0015 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQCORE_0016
     * @tc.name      testNapiQueryCore0016
     * @tc.desc      Verify the native query agrees with the system query round 11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryCore0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryCore0016 begin');
      const nativeValue: boolean = testNapi.isNotificationEnabled();
      const systemValue: boolean = await notificationManager.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=systemValue`);
      expect(nativeValue).assertEqual(systemValue);
      log('testNapiQueryCore0016 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQCORE_0017
     * @tc.name      testNapiQueryCore0017
     * @tc.desc      Verify the native query stays consistent after zero delay.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryCore0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryCore0017 begin');
      await sleep(0);
      const nativeValue: boolean = testNapi.isNotificationEnabled();
      const systemValue: boolean = await notificationManager.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof nativeValue=${typeof nativeValue}, expected='boolean'`);
      expect(typeof nativeValue).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=systemValue`);
      expect(nativeValue).assertEqual(systemValue);
      log('testNapiQueryCore0017 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQCORE_0018
     * @tc.name      testNapiQueryCore0018
     * @tc.desc      Verify the native query stays consistent after 10ms delay.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryCore0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryCore0018 begin');
      await sleep(10);
      const nativeValue: boolean = testNapi.isNotificationEnabled();
      const systemValue: boolean = await notificationManager.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof nativeValue=${typeof nativeValue}, expected='boolean'`);
      expect(typeof nativeValue).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=systemValue`);
      expect(nativeValue).assertEqual(systemValue);
      log('testNapiQueryCore0018 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQCORE_0019
     * @tc.name      testNapiQueryCore0019
     * @tc.desc      Verify the native query stays consistent after 50ms delay.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryCore0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryCore0019 begin');
      await sleep(50);
      const nativeValue: boolean = testNapi.isNotificationEnabled();
      const systemValue: boolean = await notificationManager.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof nativeValue=${typeof nativeValue}, expected='boolean'`);
      expect(typeof nativeValue).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=systemValue`);
      expect(nativeValue).assertEqual(systemValue);
      log('testNapiQueryCore0019 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQCORE_0020
     * @tc.name      testNapiQueryCore0020
     * @tc.desc      Verify the native query stays consistent after 100ms delay.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryCore0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryCore0020 begin');
      await sleep(100);
      const nativeValue: boolean = testNapi.isNotificationEnabled();
      const systemValue: boolean = await notificationManager.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof nativeValue=${typeof nativeValue}, expected='boolean'`);
      expect(typeof nativeValue).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=systemValue`);
      expect(nativeValue).assertEqual(systemValue);
      log('testNapiQueryCore0020 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQCORE_0021
     * @tc.name      testNapiQueryCore0021
     * @tc.desc      Verify the native query stays consistent after 200ms delay.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryCore0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryCore0021 begin');
      await sleep(200);
      const nativeValue: boolean = testNapi.isNotificationEnabled();
      const systemValue: boolean = await notificationManager.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof nativeValue=${typeof nativeValue}, expected='boolean'`);
      expect(typeof nativeValue).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=systemValue`);
      expect(nativeValue).assertEqual(systemValue);
      log('testNapiQueryCore0021 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQCORE_0022
     * @tc.name      testNapiQueryCore0022
     * @tc.desc      Verify the native query stays consistent after 500ms delay.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryCore0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryCore0022 begin');
      await sleep(500);
      const nativeValue: boolean = testNapi.isNotificationEnabled();
      const systemValue: boolean = await notificationManager.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof nativeValue=${typeof nativeValue}, expected='boolean'`);
      expect(typeof nativeValue).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=systemValue`);
      expect(nativeValue).assertEqual(systemValue);
      log('testNapiQueryCore0022 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQCORE_0023
     * @tc.name      testNapiQueryCore0023
     * @tc.desc      Verify four joined native queries keep boolean type and agree.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryCore0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryCore0023 begin');
      const first: boolean = testNapi.isNotificationEnabled();
      const second: boolean = testNapi.isNotificationEnabled();
      const third: boolean = testNapi.isNotificationEnabled();
      const fourth: boolean = testNapi.isNotificationEnabled();
      const joined: boolean[] = await Promise.all([first, second, third, fourth]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual joined.length=${joined.length}, expected=4`);
      expect(joined.length).assertEqual(4);
      for (let i: number = 0; i < joined.length; i++) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof joined[i]=${typeof joined[i]}, expected='boolean'`);
        expect(typeof joined[i]).assertEqual('boolean');
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual joined[i]=${joined[i]}, expected=first`);
        expect(joined[i]).assertEqual(first);
      }
      log('testNapiQueryCore0023 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQCORE_0024
     * @tc.name      testNapiQueryCore0024
     * @tc.desc      Verify joined mixed native and system queries agree with each other.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryCore0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryCore0024 begin');
      const nativeFirst: boolean = testNapi.isNotificationEnabled();
      const systemFirst: Promise<boolean> = notificationManager.isNotificationEnabled();
      const nativeSecond: boolean = testNapi.isNotificationEnabled();
      const systemSecond: Promise<boolean> = notificationManager.isNotificationEnabled();
      const joined: boolean[] = await Promise.all([nativeFirst, systemFirst, nativeSecond, systemSecond]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual joined.length=${joined.length}, expected=4`);
      expect(joined.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual joined[0]=${joined[0]}, expected=joined[1]`);
      expect(joined[0]).assertEqual(joined[1]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual joined[0]=${joined[0]}, expected=joined[2]`);
      expect(joined[0]).assertEqual(joined[2]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual joined[0]=${joined[0]}, expected=joined[3]`);
      expect(joined[0]).assertEqual(joined[3]);
      log('testNapiQueryCore0024 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQCORE_0025
     * @tc.name      testNapiQueryCore0025
     * @tc.desc      Verify the system query still agrees after ten native calls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryCore0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryCore0025 begin');
      const first: boolean = testNapi.isNotificationEnabled();
      for (let i: number = 0; i < 10; i++) {
        const current: boolean = testNapi.isNotificationEnabled();
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof current=${typeof current}, expected='boolean'`);
        expect(typeof current).assertEqual('boolean');
      }
      const systemValue: boolean = await notificationManager.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first=${first}, expected=systemValue`);
      expect(first).assertEqual(systemValue);
      log('testNapiQueryCore0025 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQCORE_0026
     * @tc.name      testNapiQueryCore0026
     * @tc.desc      Verify the native query result is neither null nor undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryCore0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryCore0026 begin');
      const nativeValue: boolean = testNapi.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${nativeValue === null || nativeValue === undefined}`);
      expect(nativeValue === null || nativeValue === undefined).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${nativeValue === null || nativeValue === undefined}`);
      expect(nativeValue === null || nativeValue === undefined).assertEqual(false);
      log('testNapiQueryCore0026 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQCORE_0027
     * @tc.name      testNapiQueryCore0027
     * @tc.desc      Verify the native query keeps boolean type after one second delay.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryCore0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryCore0027 begin');
      await sleep(1000);
      const nativeValue: boolean = testNapi.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof nativeValue=${typeof nativeValue}, expected='boolean'`);
      expect(typeof nativeValue).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${nativeValue === true || nativeValue === false}`);
      expect(nativeValue === true || nativeValue === false).assertTrue();
      log('testNapiQueryCore0027 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQCORE_0028
     * @tc.name      testNapiQueryCore0028
     * @tc.desc      Verify two native queries around a 300ms delay agree with each other.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryCore0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryCore0028 begin');
      const before: boolean = testNapi.isNotificationEnabled();
      await sleep(300);
      const after: boolean = testNapi.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof after=${typeof after}, expected='boolean'`);
      expect(typeof after).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual after=${after}, expected=before`);
      expect(after).assertEqual(before);
      log('testNapiQueryCore0028 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQCORE_0029
     * @tc.name      testNapiQueryCore0029
     * @tc.desc      Verify the system query promise still resolves after a native call.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryCore0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryCore0029 begin');
      const nativeValue: boolean = testNapi.isNotificationEnabled();
      const systemValue: boolean = await notificationManager.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof systemValue=${typeof systemValue}, expected='boolean'`);
      expect(typeof systemValue).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=systemValue`);
      expect(nativeValue).assertEqual(systemValue);
      log('testNapiQueryCore0029 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPIQCORE_0030
     * @tc.name      testNapiQueryCore0030
     * @tc.desc      Verify twenty consecutive native calls stay boolean and stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNapiQueryCore0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNapiQueryCore0030 begin');
      const first: boolean = testNapi.isNotificationEnabled();
      for (let i: number = 0; i < 20; i++) {
        const current: boolean = testNapi.isNotificationEnabled();
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof current=${typeof current}, expected='boolean'`);
        expect(typeof current).assertEqual('boolean');
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual current=${current}, expected=first`);
        expect(current).assertEqual(first);
      }
      log('testNapiQueryCore0030 end');
    })
  })
}

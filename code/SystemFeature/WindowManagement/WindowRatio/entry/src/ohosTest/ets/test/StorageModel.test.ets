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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF814;
const TAG: string = 'WindowRatioStorageModelTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

// AppStorage keys used by MainAbility (windowSizeChange listener) and pages/Index.ets (@StorageLink).
const KEY_WIDTH: string = 'windowWidth';
const KEY_HEIGHT: string = 'windowHeight';
const KEY_WINDOWS: string = 'windows';

// Isolated keys for tests that verify deletion / missing-key behavior,
// avoiding interference from MainAbility's windowSizeChange listener.
const TEST_KEY_WIDTH: string = 'testWindowWidth';
const TEST_KEY_HEIGHT: string = 'testWindowHeight';

export default function windowRatioStorageModelTest(): void {
  describe('WindowRatioStorageModelTest', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0101
     * @tc.name      testStorageModel0101
     * @tc.desc      Verify windowWidth stores and returns a string value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0101 begin');
      AppStorage.delete(KEY_WIDTH);
      AppStorage.setOrCreate(KEY_WIDTH, '1280');
      const actual: string | undefined = AppStorage.get<string>(KEY_WIDTH);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='1280'`);
      expect(actual).assertEqual('1280');
      log('testStorageModel0101 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0102
     * @tc.name      testStorageModel0102
     * @tc.desc      Verify windowWidth stored value keeps string type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0102 begin');
      AppStorage.delete(KEY_WIDTH);
      AppStorage.setOrCreate(KEY_WIDTH, '1280');
      const actual: string | undefined = AppStorage.get<string>(KEY_WIDTH);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='string'`);
      expect(typeof actual).assertEqual('string');
      log('testStorageModel0102 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0103
     * @tc.name      testStorageModel0103
     * @tc.desc      Verify windowHeight stores and returns a string value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0103 begin');
      AppStorage.delete(KEY_HEIGHT);
      AppStorage.setOrCreate(KEY_HEIGHT, '720');
      const actual: string | undefined = AppStorage.get<string>(KEY_HEIGHT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='720'`);
      expect(actual).assertEqual('720');
      log('testStorageModel0103 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0104
     * @tc.name      testStorageModel0104
     * @tc.desc      Verify windowHeight stored value keeps string type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0104 begin');
      AppStorage.delete(KEY_HEIGHT);
      AppStorage.setOrCreate(KEY_HEIGHT, '720');
      const actual: string | undefined = AppStorage.get<string>(KEY_HEIGHT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='string'`);
      expect(typeof actual).assertEqual('string');
      log('testStorageModel0104 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0105
     * @tc.name      testStorageModel0105
     * @tc.desc      Verify windows key stores and returns the same object value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0105 begin');
      AppStorage.delete(KEY_WINDOWS);
      const sent: Record<string, number> = { 'width': 800 };
      AppStorage.setOrCreate(KEY_WINDOWS, sent);
      const actual: Record<string, number> | undefined = AppStorage.get<Record<string, number>>(KEY_WINDOWS);
      const actualJson: string = actual !== undefined ? JSON.stringify(actual) : 'undefined';
      const expectedJson: string = JSON.stringify(sent);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actualJson}, expected=${expectedJson}`);
      expect(actualJson).assertEqual(expectedJson);
      log('testStorageModel0105 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0106
     * @tc.name      testStorageModel0106
     * @tc.desc      Verify windows stored value keeps object type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0106 begin');
      AppStorage.delete(KEY_WINDOWS);
      const sent: Record<string, number> = { 'width': 800 };
      AppStorage.setOrCreate(KEY_WINDOWS, sent);
      const actual: Record<string, number> | undefined = AppStorage.get<Record<string, number>>(KEY_WINDOWS);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='object'`);
      expect(typeof actual).assertEqual('object');
      log('testStorageModel0106 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0107
     * @tc.name      testStorageModel0107
     * @tc.desc      Verify unset width key reads back undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0107 begin');
      AppStorage.delete(TEST_KEY_WIDTH);
      const actual: string | undefined = AppStorage.get<string>(TEST_KEY_WIDTH);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined actual`);
      expect(actual).assertUndefined();
      log('testStorageModel0107 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0108
     * @tc.name      testStorageModel0108
     * @tc.desc      Verify unset height key reads back undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0108 begin');
      AppStorage.delete(TEST_KEY_HEIGHT);
      const actual: string | undefined = AppStorage.get<string>(TEST_KEY_HEIGHT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined actual`);
      expect(actual).assertUndefined();
      log('testStorageModel0108 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0109
     * @tc.name      testStorageModel0109
     * @tc.desc      Verify unset windows key reads back undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0109 begin');
      AppStorage.delete(KEY_WINDOWS);
      const actual: Record<string, number> | undefined = AppStorage.get<Record<string, number>>(KEY_WINDOWS);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined actual`);
      expect(actual).assertUndefined();
      log('testStorageModel0109 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0110
     * @tc.name      testStorageModel0110
     * @tc.desc      Verify unset key reads back with undefined type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0110 begin');
      AppStorage.delete(TEST_KEY_WIDTH);
      const actual: string | undefined = AppStorage.get<string>(TEST_KEY_WIDTH);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='undefined'`);
      expect(typeof actual).assertEqual('undefined');
      log('testStorageModel0110 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0111
     * @tc.name      testStorageModel0111
     * @tc.desc      Verify has reports true after windowWidth is created.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0111 begin');
      AppStorage.delete(KEY_WIDTH);
      AppStorage.setOrCreate(KEY_WIDTH, '1280');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue AppStorage.has(KEY_WIDTH)=${AppStorage.has(KEY_WIDTH)}`);
      expect(AppStorage.has(KEY_WIDTH)).assertTrue();
      log('testStorageModel0111 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0112
     * @tc.name      testStorageModel0112
     * @tc.desc      Verify has reports false after width key is deleted.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0112 begin');
      AppStorage.setOrCreate(TEST_KEY_WIDTH, '1280');
      AppStorage.delete(TEST_KEY_WIDTH);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse AppStorage.has(TEST_KEY_WIDTH)=${AppStorage.has(TEST_KEY_WIDTH)}`);
      expect(AppStorage.has(TEST_KEY_WIDTH)).assertFalse();
      log('testStorageModel0112 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0113
     * @tc.name      testStorageModel0113
     * @tc.desc      Verify has reports true after windowHeight is created.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0113 begin');
      AppStorage.delete(KEY_HEIGHT);
      AppStorage.setOrCreate(KEY_HEIGHT, '720');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue AppStorage.has(KEY_HEIGHT)=${AppStorage.has(KEY_HEIGHT)}`);
      expect(AppStorage.has(KEY_HEIGHT)).assertTrue();
      log('testStorageModel0113 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0114
     * @tc.name      testStorageModel0114
     * @tc.desc      Verify has reports true after windows key is created.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0114 begin');
      AppStorage.delete(KEY_WINDOWS);
      const sent: Record<string, number> = { 'width': 800 };
      AppStorage.setOrCreate(KEY_WINDOWS, sent);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue AppStorage.has(KEY_WINDOWS)=${AppStorage.has(KEY_WINDOWS)}`);
      expect(AppStorage.has(KEY_WINDOWS)).assertTrue();
      log('testStorageModel0114 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0115
     * @tc.name      testStorageModel0115
     * @tc.desc      Verify deleting an existing key returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0115 begin');
      AppStorage.setOrCreate(TEST_KEY_WIDTH, '1280');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue AppStorage.delete(TEST_KEY_WIDTH)`);
      expect(AppStorage.delete(TEST_KEY_WIDTH)).assertTrue();
      log('testStorageModel0115 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0116
     * @tc.name      testStorageModel0116
     * @tc.desc      Verify deleting a missing key returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0116 begin');
      AppStorage.delete(KEY_HEIGHT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse AppStorage.delete(KEY_HEIGHT)`);
      expect(AppStorage.delete(KEY_HEIGHT)).assertFalse();
      log('testStorageModel0116 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0117
     * @tc.name      testStorageModel0117
     * @tc.desc      Verify overwriting windowWidth replaces the old value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0117 begin');
      AppStorage.delete(KEY_WIDTH);
      AppStorage.setOrCreate(KEY_WIDTH, '1280');
      AppStorage.setOrCreate(KEY_WIDTH, '1920');
      const actual: string | undefined = AppStorage.get<string>(KEY_WIDTH);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='1920'`);
      expect(actual).assertEqual('1920');
      log('testStorageModel0117 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0118
     * @tc.name      testStorageModel0118
     * @tc.desc      Verify overwriting windowHeight replaces the old value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0118 begin');
      AppStorage.delete(KEY_HEIGHT);
      AppStorage.setOrCreate(KEY_HEIGHT, '720');
      AppStorage.setOrCreate(KEY_HEIGHT, '1080');
      const actual: string | undefined = AppStorage.get<string>(KEY_HEIGHT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='1080'`);
      expect(actual).assertEqual('1080');
      log('testStorageModel0118 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0119
     * @tc.name      testStorageModel0119
     * @tc.desc      Verify overwriting windows key replaces with the new object value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0119 begin');
      AppStorage.delete(KEY_WINDOWS);
      const first: Record<string, number> = { 'width': 800 };
      const second: Record<string, number> = { 'width': 1600 };
      AppStorage.setOrCreate(KEY_WINDOWS, first);
      AppStorage.setOrCreate(KEY_WINDOWS, second);
      const actual: Record<string, number> | undefined = AppStorage.get<Record<string, number>>(KEY_WINDOWS);
      const actualJson: string = actual !== undefined ? JSON.stringify(actual) : 'undefined';
      const expectedJson: string = JSON.stringify(second);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actualJson}, expected=${expectedJson}`);
      expect(actualJson).assertEqual(expectedJson);
      log('testStorageModel0119 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0120
     * @tc.name      testStorageModel0120
     * @tc.desc      Verify link reads back the windowWidth value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0120 begin');
      AppStorage.delete(KEY_WIDTH);
      AppStorage.setOrCreate(KEY_WIDTH, '1280');
      const linkProp = AppStorage.link<string>(KEY_WIDTH);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(linkProp.get())=${String(linkProp.get())}`);
      expect(String(linkProp.get())).assertEqual('1280');
      log('testStorageModel0120 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0121
     * @tc.name      testStorageModel0121
     * @tc.desc      Verify link write propagates back to AppStorage.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0121 begin');
      AppStorage.delete(KEY_WIDTH);
      AppStorage.setOrCreate(KEY_WIDTH, '1280');
      const linkProp = AppStorage.link<string>(KEY_WIDTH);
      linkProp.set('960');
      const actual: string | undefined = AppStorage.get<string>(KEY_WIDTH);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='960'`);
      expect(actual).assertEqual('960');
      log('testStorageModel0121 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0122
     * @tc.name      testStorageModel0122
     * @tc.desc      Verify link reads back the windowHeight value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0122 begin');
      AppStorage.delete(KEY_HEIGHT);
      AppStorage.setOrCreate(KEY_HEIGHT, '720');
      const linkProp = AppStorage.link<string>(KEY_HEIGHT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(linkProp.get())=${String(linkProp.get())}`);
      expect(String(linkProp.get())).assertEqual('720');
      log('testStorageModel0122 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0123
     * @tc.name      testStorageModel0123
     * @tc.desc      Verify windowHeight link write propagates back to AppStorage.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0123 begin');
      AppStorage.delete(KEY_HEIGHT);
      AppStorage.setOrCreate(KEY_HEIGHT, '720');
      const linkProp = AppStorage.link<string>(KEY_HEIGHT);
      linkProp.set('540');
      const actual: string | undefined = AppStorage.get<string>(KEY_HEIGHT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='540'`);
      expect(actual).assertEqual('540');
      log('testStorageModel0123 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0124
     * @tc.name      testStorageModel0124
     * @tc.desc      Verify link returns the same object stored under windows key.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0124 begin');
      AppStorage.delete(KEY_WINDOWS);
      const sent: Record<string, number> = { 'width': 800 };
      AppStorage.setOrCreate(KEY_WINDOWS, sent);
      const linkProp = AppStorage.link<Record<string, number>>(KEY_WINDOWS);
      const actual: Record<string, number> | undefined = AppStorage.get<Record<string, number>>(KEY_WINDOWS);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue linkProp.get() === actual=${linkProp.get() === actual}`);
      expect(linkProp.get() === actual).assertTrue();
      log('testStorageModel0124 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0125
     * @tc.name      testStorageModel0125
     * @tc.desc      Verify two links to the same key observe equal values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0125 begin');
      AppStorage.delete(KEY_WIDTH);
      AppStorage.setOrCreate(KEY_WIDTH, '1280');
      const first = AppStorage.link<string>(KEY_WIDTH);
      const second = AppStorage.link<string>(KEY_WIDTH);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(first.get())=${String(first.get())}`);
      expect(String(first.get())).assertEqual(String(second.get()));
      log('testStorageModel0125 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0126
     * @tc.name      testStorageModel0126
     * @tc.desc      Verify set on a missing key fails without creating it.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0126 begin');
      AppStorage.delete(TEST_KEY_WIDTH);
      const ok: boolean = AppStorage.set(TEST_KEY_WIDTH, '1280');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse ok=${ok}`);
      expect(ok).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse AppStorage.has(TEST_KEY_WIDTH)=${AppStorage.has(TEST_KEY_WIDTH)}`);
      expect(AppStorage.has(TEST_KEY_WIDTH)).assertFalse();
      log('testStorageModel0126 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0127
     * @tc.name      testStorageModel0127
     * @tc.desc      Verify set on an existing key updates the value and returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0127 begin');
      AppStorage.delete(KEY_WIDTH);
      AppStorage.setOrCreate(KEY_WIDTH, '1280');
      const ok: boolean = AppStorage.set(KEY_WIDTH, '2560');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ok=${ok}`);
      expect(ok).assertTrue();
      const actual: string | undefined = AppStorage.get<string>(KEY_WIDTH);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='2560'`);
      expect(actual).assertEqual('2560');
      log('testStorageModel0127 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0128
     * @tc.name      testStorageModel0128
     * @tc.desc      Verify keys list contains windowWidth after creation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0128 begin');
      AppStorage.delete(KEY_WIDTH);
      AppStorage.setOrCreate(KEY_WIDTH, '1280');
      const keyList: Array<string> = Array.from(AppStorage.keys());
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${keyList.indexOf(KEY_WIDTH) >= 0}`);
      expect(keyList.indexOf(KEY_WIDTH) >= 0).assertTrue();
      log('testStorageModel0128 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0129
     * @tc.name      testStorageModel0129
     * @tc.desc      Verify keys list contains windowHeight after creation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0129 begin');
      AppStorage.delete(KEY_HEIGHT);
      AppStorage.setOrCreate(KEY_HEIGHT, '720');
      const keyList: Array<string> = Array.from(AppStorage.keys());
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${keyList.indexOf(KEY_HEIGHT) >= 0}`);
      expect(keyList.indexOf(KEY_HEIGHT) >= 0).assertTrue();
      log('testStorageModel0129 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0130
     * @tc.name      testStorageModel0130
     * @tc.desc      Verify size grows to at least one after creation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0130 begin');
      AppStorage.delete(KEY_WIDTH);
      AppStorage.setOrCreate(KEY_WIDTH, '1280');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue AppStorage.size() >= 1=${AppStorage.size() >= 1}`);
      expect(AppStorage.size() >= 1).assertTrue();
      log('testStorageModel0130 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0131
     * @tc.name      testStorageModel0131
     * @tc.desc      Verify number values are stored and read back unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0131 begin');
      AppStorage.delete(KEY_WIDTH);
      AppStorage.setOrCreate(KEY_WIDTH, 1280);
      const actual: number | undefined = AppStorage.get<number>(KEY_WIDTH);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=1280`);
      expect(actual).assertEqual(1280);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testStorageModel0131 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0132
     * @tc.name      testStorageModel0132
     * @tc.desc      Verify boolean values are stored and read back unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0132 begin');
      AppStorage.delete(KEY_HEIGHT);
      AppStorage.setOrCreate(KEY_HEIGHT, true);
      const actual: boolean | undefined = AppStorage.get<boolean>(KEY_HEIGHT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${actual}`);
      expect(actual).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='boolean'`);
      expect(typeof actual).assertEqual('boolean');
      log('testStorageModel0132 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0133
     * @tc.name      testStorageModel0133
     * @tc.desc      Verify windowWidth keeps a long digit string intact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0133 begin');
      AppStorage.delete(KEY_WIDTH);
      AppStorage.setOrCreate(KEY_WIDTH, '1234567890');
      const actual: string | undefined = AppStorage.get<string>(KEY_WIDTH);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='1234567890'`);
      expect(actual).assertEqual('1234567890');
      log('testStorageModel0133 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0134
     * @tc.name      testStorageModel0134
     * @tc.desc      Verify windowWidth keeps the zero width string intact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0134 begin');
      AppStorage.delete(KEY_WIDTH);
      AppStorage.setOrCreate(KEY_WIDTH, '0');
      const actual: string | undefined = AppStorage.get<string>(KEY_WIDTH);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='0'`);
      expect(actual).assertEqual('0');
      log('testStorageModel0134 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0135
     * @tc.name      testStorageModel0135
     * @tc.desc      Verify width 1280 serializes to the string the listener stores.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0135 begin');
      const actual: string = JSON.stringify(1280);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='1280'`);
      expect(actual).assertEqual('1280');
      log('testStorageModel0135 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0136
     * @tc.name      testStorageModel0136
     * @tc.desc      Verify height 720 serializes to the string the listener stores.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0136 begin');
      const actual: string = JSON.stringify(720);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='720'`);
      expect(actual).assertEqual('720');
      log('testStorageModel0136 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0137
     * @tc.name      testStorageModel0137
     * @tc.desc      Verify stored width string parses back to a number.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0137 begin');
      const actual: number = JSON.parse('1280') as number;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=1280`);
      expect(actual).assertEqual(1280);
      log('testStorageModel0137 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0138
     * @tc.name      testStorageModel0138
     * @tc.desc      Verify writing windowWidth does not affect windowHeight.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0138 begin');
      AppStorage.delete(KEY_WIDTH);
      AppStorage.delete(KEY_HEIGHT);
      AppStorage.setOrCreate(KEY_WIDTH, '1280');
      AppStorage.setOrCreate(KEY_HEIGHT, '720');
      AppStorage.setOrCreate(KEY_WIDTH, '2560');
      const height: string | undefined = AppStorage.get<string>(KEY_HEIGHT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual height=${height}, expected='720'`);
      expect(height).assertEqual('720');
      log('testStorageModel0138 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0139
     * @tc.name      testStorageModel0139
     * @tc.desc      Verify key lookup is case sensitive for windowWidth.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0139 begin');
      AppStorage.delete(KEY_WIDTH);
      AppStorage.delete('windowwidth');
      AppStorage.setOrCreate(KEY_WIDTH, '1280');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${AppStorage.has('windowwidth')}`);
      expect(AppStorage.has('windowwidth')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue AppStorage.has(KEY_WIDTH)=${AppStorage.has(KEY_WIDTH)}`);
      expect(AppStorage.has(KEY_WIDTH)).assertTrue();
      AppStorage.delete('windowwidth');
      log('testStorageModel0139 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_STORAGE_0140
     * @tc.name      testStorageModel0140
     * @tc.desc      Verify three consecutive writes keep only the last value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStorageModel0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStorageModel0140 begin');
      AppStorage.delete(KEY_WIDTH);
      AppStorage.setOrCreate(KEY_WIDTH, '800');
      AppStorage.setOrCreate(KEY_WIDTH, '1200');
      AppStorage.setOrCreate(KEY_WIDTH, '1600');
      const actual: string | undefined = AppStorage.get<string>(KEY_WIDTH);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='1600'`);
      expect(actual).assertEqual('1600');
      log('testStorageModel0140 end');
    })
  })
}

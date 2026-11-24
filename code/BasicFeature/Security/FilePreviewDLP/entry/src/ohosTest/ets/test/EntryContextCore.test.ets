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
import { common } from '@kit.AbilityKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const DOMAIN: number = 0xF812;
const TAG: string = 'EntryContextCoreTest';
const BUNDLE_NAME: string = 'com.samples.filepreviewdlp';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function getAppContext(): common.Context {
  return delegator.getAppContext();
}

export default function entryContextCoreTest(): void {
  describe('EntryContextCoreTest', () => {
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_CTXX_0301
     * @tc.name      testEntryContext0301
     * @tc.desc      Verify the ability delegator is available in the test runtime.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntryContext0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntryContext0301 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue delegator !== null=${delegator !== null}`);
      expect(delegator !== null).assertTrue();
      log('testEntryContext0301 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_CTXX_0302
     * @tc.name      testEntryContext0302
     * @tc.desc      Verify the application context can be obtained and is not null.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntryContext0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntryContext0302 begin');
      const appContext: common.Context = getAppContext();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue appContext !== null=${appContext !== null}`);
      expect(appContext !== null).assertTrue();
      log('testEntryContext0302 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_CTXX_0303
     * @tc.name      testEntryContext0303
     * @tc.desc      Verify the application info name matches the bundle configuration.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntryContext0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntryContext0303 begin');
      const appContext: common.Context = getAppContext();
      const name: string = appContext.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual name=${name}, expected=BUNDLE_NAME`);
      expect(name).assertEqual(BUNDLE_NAME);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof name=${typeof name}, expected='string'`);
      expect(typeof name).assertEqual('string');
      log('testEntryContext0303 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_CTXX_0304
     * @tc.name      testEntryContext0304
     * @tc.desc      Verify the application info is reachable from the context.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntryContext0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntryContext0304 begin');
      const appContext: common.Context = getAppContext();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${appContext.applicationInfo !== null}`);
      expect(appContext.applicationInfo !== null).assertTrue();
      log('testEntryContext0304 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_CTXX_0305
     * @tc.name      testEntryContext0305
     * @tc.desc      Verify the application info name is a non empty string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntryContext0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntryContext0305 begin');
      const appContext: common.Context = getAppContext();
      const name: string = appContext.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof name=${typeof name}, expected='string'`);
      expect(typeof name).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue name.length > 0=${name.length > 0}`);
      expect(name.length > 0).assertTrue();
      log('testEntryContext0305 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_CTXX_0306
     * @tc.name      testEntryContext0306
     * @tc.desc      Verify the application process name is a non empty string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntryContext0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntryContext0306 begin');
      const appContext: common.Context = getAppContext();
      const processName: string = appContext.applicationInfo.process;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof processName=${typeof processName}, expected='string'`);
      expect(typeof processName).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue processName.length > 0=${processName.length > 0}`);
      expect(processName.length > 0).assertTrue();
      log('testEntryContext0306 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_CTXX_0307
     * @tc.name      testEntryContext0307
     * @tc.desc      Verify the files directory is a non empty string path.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntryContext0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntryContext0307 begin');
      const filesDir: string = getAppContext().filesDir;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof filesDir=${typeof filesDir}, expected='string'`);
      expect(typeof filesDir).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue filesDir.length > 0=${filesDir.length > 0}`);
      expect(filesDir.length > 0).assertTrue();
      log('testEntryContext0307 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_CTXX_0308
     * @tc.name      testEntryContext0308
     * @tc.desc      Verify the cache directory is a non empty string path.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntryContext0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntryContext0308 begin');
      const cacheDir: string = getAppContext().cacheDir;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof cacheDir=${typeof cacheDir}, expected='string'`);
      expect(typeof cacheDir).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue cacheDir.length > 0=${cacheDir.length > 0}`);
      expect(cacheDir.length > 0).assertTrue();
      log('testEntryContext0308 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_CTXX_0309
     * @tc.name      testEntryContext0309
     * @tc.desc      Verify the temp directory is a non empty string path.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntryContext0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntryContext0309 begin');
      const tempDir: string = getAppContext().tempDir;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof tempDir=${typeof tempDir}, expected='string'`);
      expect(typeof tempDir).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue tempDir.length > 0=${tempDir.length > 0}`);
      expect(tempDir.length > 0).assertTrue();
      log('testEntryContext0309 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_CTXX_0310
     * @tc.name      testEntryContext0310
     * @tc.desc      Verify the database directory is a non empty string path.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntryContext0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntryContext0310 begin');
      const databaseDir: string = getAppContext().databaseDir;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof databaseDir=${typeof databaseDir}, expected='string'`);
      expect(typeof databaseDir).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue databaseDir.length > 0=${databaseDir.length > 0}`);
      expect(databaseDir.length > 0).assertTrue();
      log('testEntryContext0310 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_CTXX_0311
     * @tc.name      testEntryContext0311
     * @tc.desc      Verify the preferences directory is a non empty string path.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntryContext0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntryContext0311 begin');
      const preferencesDir: string = getAppContext().preferencesDir;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof preferencesDir=${typeof preferencesDir}`);
      expect(typeof preferencesDir).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue preferencesDir.length > 0=${preferencesDir.length > 0}`);
      expect(preferencesDir.length > 0).assertTrue();
      log('testEntryContext0311 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_CTXX_0312
     * @tc.name      testEntryContext0312
     * @tc.desc      Verify the bundle code directory is a non empty string path.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntryContext0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntryContext0312 begin');
      const bundleCodeDir: string = getAppContext().bundleCodeDir;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof bundleCodeDir=${typeof bundleCodeDir}`);
      expect(typeof bundleCodeDir).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue bundleCodeDir.length > 0=${bundleCodeDir.length > 0}`);
      expect(bundleCodeDir.length > 0).assertTrue();
      log('testEntryContext0312 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_CTXX_0313
     * @tc.name      testEntryContext0313
     * @tc.desc      Verify files and cache directories are distinct paths.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntryContext0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntryContext0313 begin');
      const appContext: common.Context = getAppContext();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${appContext.filesDir === appContext.cacheDir}`);
      expect(appContext.filesDir === appContext.cacheDir).assertFalse();
      log('testEntryContext0313 end');
    })
  })
}

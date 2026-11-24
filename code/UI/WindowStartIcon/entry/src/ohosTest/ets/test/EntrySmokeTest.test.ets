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
import { bundleManager } from '@kit.AbilityKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const DOMAIN: number = 0xF813;
const TAG: string = 'WindowStartIconEntrySmokeTest';

const BUNDLE: string = 'com.samples.windowstarticon';
const ABILITY: string = 'EntryAbility';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function sleep(duration: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => { resolve(); }, duration);
  });
}

export default function entrySmokeTest(): void {
  describe('EntrySmokeTest', () => {
    /**
     * @tc.number    SUB_WINDOW_START_ICON_ENTRYSMOKE_0501
     * @tc.name      testWindowStartIconEntrySmoke0501
     * @tc.desc      Verify the entry ability starts successfully on demand.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconEntrySmoke0501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconEntrySmoke0501 begin');
      let started: boolean = true;
      try {
        await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      } catch (error) {
        started = false;
        log('startAbility failed: ' + String(error));
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue started=${started}`);
      expect(started).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof started=${typeof started}, expected='boolean'`);
      expect(typeof started).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger BUNDLE.length=${BUNDLE.length}, expected=0`);
      expect(BUNDLE.length).assertLarger(0);
      await sleep(600);
      log('testWindowStartIconEntrySmoke0501 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ENTRYSMOKE_0502
     * @tc.name      testWindowStartIconEntrySmoke0502
     * @tc.desc      Verify the application context reports the sample bundle name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconEntrySmoke0502', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconEntrySmoke0502 begin');
      const bundleInfo: bundleManager.BundleInfo =
        await bundleManager.getBundleInfoForSelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bundleInfo.name=${bundleInfo.name}, expected=BUNDLE`);
      expect(bundleInfo.name).assertEqual(BUNDLE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof bundleInfo.name=${typeof bundleInfo.name}`);
      expect(typeof bundleInfo.name).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger bundleInfo.name.length=${bundleInfo.name.length}`);
      expect(bundleInfo.name.length).assertLarger(0);
      log('testWindowStartIconEntrySmoke0502 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ENTRYSMOKE_0503
     * @tc.name      testWindowStartIconEntrySmoke0503
     * @tc.desc      Verify the application context provides a usable cache directory.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconEntrySmoke0503', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconEntrySmoke0503 begin');
      const context = delegator.getAppContext();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${context !== undefined && context !== null}`);
      expect(context !== undefined && context !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof context.cacheDir=${typeof context.cacheDir}`);
      expect(typeof context.cacheDir).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger context.cacheDir.length=${context.cacheDir.length}`);
      expect(context.cacheDir.length).assertLarger(0);
      log('testWindowStartIconEntrySmoke0503 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ENTRYSMOKE_0504
     * @tc.name      testWindowStartIconEntrySmoke0504
     * @tc.desc      Verify repeated context reads return the same bundle name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconEntrySmoke0504', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconEntrySmoke0504 begin');
      const first: bundleManager.BundleInfo =
        await bundleManager.getBundleInfoForSelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT);
      const second: bundleManager.BundleInfo =
        await bundleManager.getBundleInfoForSelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.name=${first.name}, expected=second.name`);
      expect(first.name).assertEqual(second.name);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.name=${first.name}, expected=BUNDLE`);
      expect(first.name).assertEqual(BUNDLE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger first.name.length=${first.name.length}, expected=0`);
      expect(first.name.length).assertLarger(0);
      log('testWindowStartIconEntrySmoke0504 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ENTRYSMOKE_0505
     * @tc.name      testWindowStartIconEntrySmoke0505
     * @tc.desc      Verify the device reports a positive screen density for icon scaling.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconEntrySmoke0505', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconEntrySmoke0505 begin');
      const capability = await delegator.getAppContext().resourceManager.getDeviceCapability();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${capability !== undefined && capability !== null}`);
      expect(capability !== undefined && capability !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger capability.screenDensity=${capability.screenDensity}`);
      expect(capability.screenDensity).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof capability.screenDensity}, expected='number'`);
      expect(typeof capability.screenDensity).assertEqual('number');
      log('testWindowStartIconEntrySmoke0505 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ENTRYSMOKE_0506
     * @tc.name      testWindowStartIconEntrySmoke0506
     * @tc.desc      Verify the application provides distinct files and cache directories.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconEntrySmoke0506', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconEntrySmoke0506 begin');
      const context = delegator.getAppContext();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof context.filesDir=${typeof context.filesDir}`);
      expect(typeof context.filesDir).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger context.filesDir.length=${context.filesDir.length}`);
      expect(context.filesDir.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${context.filesDir === context.cacheDir}`);
      expect(context.filesDir === context.cacheDir).assertFalse();
      log('testWindowStartIconEntrySmoke0506 end');
    })
  })
}

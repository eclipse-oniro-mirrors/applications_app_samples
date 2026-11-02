import { describe, it, expect } from '@ohos/hypium';
import { preferences } from '@kit.ArkData';
import { bundleManager, common } from '@kit.AbilityKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { SELF_BUNDLE_NAME, jumpTargetByKey } from '../../../main/ets/model/AbilityJump';
import { PREFS_COUNT_KEY, PREFS_TEXT_KEY } from '../../../main/ets/model/PrefsStore';

const TEST_STORE: string = 'atomic_service_ohos_test_store';
const TEST_TEXT_KEY: string = 'roundTripText';
const TEST_COUNT_KEY: string = 'roundTripCount';

function moduleContext(): common.Context {
  const appContext = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext();
  return appContext.createModuleContext('entry');
}

export default function enrichmentDeviceTest() {
  describe('enrichmentDeviceTest', () => {

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ENRICHMENT_0100
     * @tc.name preferencesWriteFlushReopen001
     * @tc.desc Verify a value written and flushed is visible from a freshly opened preferences instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('preferences_writeFlushReopen', 0, async () => {
      const context = moduleContext();
      const store = preferences.getPreferencesSync(context, { name: TEST_STORE });
      store.clearSync();
      store.putSync(TEST_TEXT_KEY, '首选项设备侧往返');
      store.putSync(TEST_COUNT_KEY, 7);
      await store.flush();
      const reopened = preferences.getPreferencesSync(context, { name: TEST_STORE });
      expect(reopened.getSync(TEST_TEXT_KEY, '') as string).assertEqual('首选项设备侧往返');
      expect(reopened.getSync(TEST_COUNT_KEY, 0) as number).assertEqual(7);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ENRICHMENT_0200
     * @tc.name preferencesDeleteKeepsCount002
     * @tc.desc Verify deleting the text key leaves the count key untouched after reopen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('preferences_deleteKeepsCount', 0, async () => {
      const context = moduleContext();
      const store = preferences.getPreferencesSync(context, { name: TEST_STORE });
      store.deleteSync(TEST_TEXT_KEY);
      await store.flush();
      const reopened = preferences.getPreferencesSync(context, { name: TEST_STORE });
      expect(reopened.getSync(TEST_TEXT_KEY, 'missing') as string).assertEqual('missing');
      expect(reopened.getSync(TEST_COUNT_KEY, 0) as number).assertEqual(7);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ENRICHMENT_0300
     * @tc.name preferencesClearAll003
     * @tc.desc Verify clearSync removes every key from the store
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('preferences_clearAll', 0, async () => {
      const context = moduleContext();
      const store = preferences.getPreferencesSync(context, { name: TEST_STORE });
      store.clearSync();
      await store.flush();
      const reopened = preferences.getPreferencesSync(context, { name: TEST_STORE });
      expect(reopened.getSync(TEST_TEXT_KEY, 'missing') as string).assertEqual('missing');
      expect(reopened.getSync(TEST_COUNT_KEY, -1) as number).assertEqual(-1);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ENRICHMENT_0400
     * @tc.name preferencesStoreIsolation004
     * @tc.desc Verify two named stores do not share keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('preferences_storeIsolation', 0, async () => {
      const context = moduleContext();
      const first = preferences.getPreferencesSync(context, { name: TEST_STORE });
      const second = preferences.getPreferencesSync(context, { name: 'atomic_service_ohos_test_store_b' });
      second.clearSync();
      first.putSync(PREFS_TEXT_KEY, '仅 A 存储');
      await first.flush();
      await second.flush();
      expect(second.getSync(PREFS_TEXT_KEY, 'missing') as string).assertEqual('missing');
      expect(first.getSync(PREFS_TEXT_KEY, 'missing') as string).assertEqual('仅 A 存储');
      second.clearSync();
      await second.flush();
      first.clearSync();
      await first.flush();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ENRICHMENT_0500
     * @tc.name installedBundleMatchesSelfTarget005
     * @tc.desc Verify the installed bundle name equals the self jump target bundle name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('installedBundle_matchesSelfTarget', 0, async () => {
      const info = await bundleManager.getBundleInfoForSelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT);
      const target = jumpTargetByKey('self');
      expect(target !== null).assertTrue();
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      if (target !== null) {
        expect(target.bundleName).assertEqual(info.name);
      }
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ENRICHMENT_0600
     * @tc.name preferencesDemoStoreNameUnique006
     * @tc.desc Verify the demo store name differs from the device test store name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('preferences_demoStoreNameUnique', 0, () => {
      expect(PREFS_TEXT_KEY === TEST_TEXT_KEY).assertFalse();
      expect(PREFS_COUNT_KEY === TEST_COUNT_KEY).assertFalse();
      expect(TEST_STORE.includes('ohos_test')).assertTrue();
    });
  });
}

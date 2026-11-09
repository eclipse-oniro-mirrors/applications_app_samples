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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { AppInfoItem } from 'library';
import { SecurityViewModel } from '../../../main/ets/networksecurity/viewmodel/SecurityViewModel';
import { PolicyViewModel, UidPolicyMode } from '../../../main/ets/networksecurity/viewmodel/PolicyViewModel';
import { AppListViewModel } from '../../../main/ets/networksecurity/viewmodel/AppListViewModel';

// Default selected certificate index before any valid selection is applied.
const DEFAULT_SELECTED_INDEX: number = 1;

// Registers the pure logic test suite for the guard branches of the three page view models.
// Every case works on an unbound view model: no context is bound and no system API is invoked,
// so only the input guard branches are exercised here.
export default function viewModelGuardsLogicTest() {
  // Define the logic test suite that contains all view model guard cases.
  describe('ViewModelGuardsLogicSuite', () => {
    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VMGUARD_0100
     * @tc.name      testVmGuard0001
     * @tc.desc      Verify queryHost skips the query with one warn log entry when the host input is an empty string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testVmGuard0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Arrange an unbound view model and clear the pre-filled host input.
      const viewModel: SecurityViewModel = new SecurityViewModel();
      viewModel.hostInput = '';
      // Act on the empty host guard branch.
      viewModel.queryHost();
      // The guard reports one warning and nothing else.
      expect(viewModel.logs.length).assertEqual(1);
      expect(viewModel.logs[0].level).assertEqual('warn');
      expect(viewModel.logs[0].tag).assertEqual('Cleartext');
      expect(viewModel.logs[0].text).assertEqual('Enter a host name first');
      // The cleartext result keeps the untouched default fields.
      expect(viewModel.cleartext.host).assertEqual('');
      expect(viewModel.cleartext.hostAllowed).assertFalse();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VMGUARD_0200
     * @tc.name      testVmGuard0002
     * @tc.desc      Verify queryHost treats a blank-only host input like an empty one and the guard can fire repeatedly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testVmGuard0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Arrange an unbound view model and type blank characters only.
      const viewModel: SecurityViewModel = new SecurityViewModel();
      viewModel.hostInput = '    ';
      // Act twice on the same guard branch to observe repeated triggering.
      viewModel.queryHost();
      viewModel.queryHost();
      // Two warnings accumulate with the newest entry at the head.
      expect(viewModel.logs.length).assertEqual(2);
      expect(viewModel.logs[0].id).assertEqual(2);
      expect(viewModel.logs[1].id).assertEqual(1);
      expect(viewModel.logs[0].text).assertEqual('Enter a host name first');
      // The cleartext result stays on its untouched defaults after both calls.
      expect(viewModel.cleartext.host).assertEqual('');
      expect(viewModel.cleartext.hostAllowed).assertFalse();
      expect(viewModel.cleartext.globalAllowed).assertFalse();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VMGUARD_0300
     * @tc.name      testVmGuard0003
     * @tc.desc      Verify selectCert ignores negative, zero and oversized indexes when the certificate list is still empty.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testVmGuard0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      // Arrange an unbound view model whose certificate list has never been loaded.
      const viewModel: SecurityViewModel = new SecurityViewModel();
      const outOfRange: number[] = [-1, 0, 99];
      // Act on the out-of-range guard once per invalid index.
      for (let index = 0; index < outOfRange.length; index++) {
        await viewModel.selectCert(outOfRange[index]);
      }
      // The preselected index never moves and no metadata is published.
      expect(viewModel.selectedIndex).assertEqual(DEFAULT_SELECTED_INDEX);
      expect(viewModel.metaLoaded).assertFalse();
      expect(viewModel.certFiles.length).assertEqual(0);
      // The guard never enters the busy state.
      expect(viewModel.busy).assertFalse();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VMGUARD_0400
     * @tc.name      testVmGuard0004
     * @tc.desc      Verify clearLogs empties the log panel while the entry sequence keeps advancing afterwards.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testVmGuard0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Arrange one warning entry through the empty host guard.
      const viewModel: SecurityViewModel = new SecurityViewModel();
      viewModel.hostInput = '';
      viewModel.queryHost();
      expect(viewModel.logs.length).assertEqual(1);
      // Act on the clear action.
      viewModel.clearLogs();
      // The panel becomes empty right after the clear.
      expect(viewModel.logs.length).assertEqual(0);
      // A following guard warning keeps the sequence running instead of restarting.
      viewModel.queryHost();
      expect(viewModel.logs.length).assertEqual(1);
      expect(viewModel.logs[0].id).assertEqual(2);
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VMGUARD_0500
     * @tc.name      testVmGuard0005
     * @tc.desc      Verify applyTrustlist skips the empty UID input with one warning and leaves every state field untouched.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testVmGuard0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      // Arrange an unbound view model with an empty UID input.
      const viewModel: PolicyViewModel = new PolicyViewModel();
      viewModel.trustlistUid = '';
      // Act on the empty UID guard branch.
      await viewModel.applyTrustlist();
      // The guard reports one warning from the trust list section.
      expect(viewModel.logs.length).assertEqual(1);
      expect(viewModel.logs[0].level).assertEqual('warn');
      expect(viewModel.logs[0].tag).assertEqual('Trustlist');
      expect(viewModel.logs[0].text).assertEqual('UID input is empty');
      // The apply never enters the busy state and never marks the system APIs as available.
      expect(viewModel.busy).assertFalse();
      expect(viewModel.systemAvailable).assertFalse();
      // Both trust lists keep their empty defaults because no apply ran.
      expect(viewModel.trustlist.deviceIdle.length).assertEqual(0);
      expect(viewModel.trustlist.powerSave.length).assertEqual(0);
      expect(viewModel.trustlist.loaded).assertFalse();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VMGUARD_0600
     * @tc.name      testVmGuard0006
     * @tc.desc      Verify applyTrustlist rejects a blank-only UID input on every call without blocking the busy flag.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testVmGuard0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Arrange an unbound view model whose UID input holds blanks only.
      const viewModel: PolicyViewModel = new PolicyViewModel();
      viewModel.trustlistUid = '   ';
      // Act twice on the same guard branch to observe repeated triggering.
      await viewModel.applyTrustlist();
      await viewModel.applyTrustlist();
      // Two warnings accumulate with the newest entry at the head.
      expect(viewModel.logs.length).assertEqual(2);
      expect(viewModel.logs[0].id).assertEqual(2);
      expect(viewModel.logs[1].id).assertEqual(1);
      expect(viewModel.logs[0].text).assertEqual('UID input is empty');
      // The busy flag stays released after both calls and no apply touched the trust lists.
      expect(viewModel.busy).assertFalse();
      expect(viewModel.trustlist.loaded).assertFalse();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VMGUARD_0700
     * @tc.name      testVmGuard0007
     * @tc.desc      Verify applyTrustlist echoes the original non-numeric UID text in the warning and keeps the input unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testVmGuard0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Arrange an unbound view model with a text UID that cannot be parsed as a number.
      const viewModel: PolicyViewModel = new PolicyViewModel();
      viewModel.trustlistUid = 'abc';
      // Act on the unparsable UID guard branch.
      await viewModel.applyTrustlist();
      // The warning carries the rejected input text back to the log panel.
      expect(viewModel.logs.length).assertEqual(1);
      expect(viewModel.logs[0].level).assertEqual('warn');
      expect(viewModel.logs[0].text).assertEqual('Invalid UID input abc');
      // The input field keeps the typed value for the user to correct.
      expect(viewModel.trustlistUid).assertEqual('abc');
      // The apply path never ran, so no system API availability or trust list change is reported.
      expect(viewModel.systemAvailable).assertFalse();
      expect(viewModel.trustlist.powerSave.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VMGUARD_0800
     * @tc.name      testVmGuard0008
     * @tc.desc      Verify applyTrustlist rejects a negative UID text even though the text parses into a number.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testVmGuard0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Arrange an unbound view model with a negative UID typed as text.
      const viewModel: PolicyViewModel = new PolicyViewModel();
      viewModel.trustlistUid = '-5';
      // Act on the negative UID guard branch.
      await viewModel.applyTrustlist();
      // The warning names the negative text and comes from the trust list section.
      expect(viewModel.logs.length).assertEqual(1);
      expect(viewModel.logs[0].level).assertEqual('warn');
      expect(viewModel.logs[0].tag).assertEqual('Trustlist');
      expect(viewModel.logs[0].text).assertEqual('Invalid UID input -5');
      // The apply path never ran, so the busy flag and the device idle list stay untouched.
      expect(viewModel.busy).assertFalse();
      expect(viewModel.trustlist.deviceIdle.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VMGUARD_0900
     * @tc.name      testVmGuard0009
     * @tc.desc      Verify the policy log panel empties through clearLogs after repeated invalid apply attempts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testVmGuard0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Arrange two guard warnings through two unparsable apply attempts.
      const viewModel: PolicyViewModel = new PolicyViewModel();
      viewModel.trustlistUid = 'not-a-uid';
      await viewModel.applyTrustlist();
      await viewModel.applyTrustlist();
      expect(viewModel.logs.length).assertEqual(2);
      // Act on the clear action.
      viewModel.clearLogs();
      // The panel becomes empty and the apply guard never engaged the busy state.
      expect(viewModel.logs.length).assertEqual(0);
      expect(viewModel.busy).assertFalse();
      expect(viewModel.systemAvailable).assertFalse();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VMGUARD_1000
     * @tc.name      testVmGuard0010
     * @tc.desc      Verify the per-UID policy mode enum exposes the three distinct demo values in order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testVmGuard0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The demo modes map to the fixed numeric values used by the per-UID buttons.
      expect(UidPolicyMode.NONE).assertEqual(0);
      expect(UidPolicyMode.ALLOW).assertEqual(1);
      expect(UidPolicyMode.REJECT).assertEqual(2);
      // Every mode stays distinct so the page can tell the three actions apart.
      // The locals are typed as number so the comparisons stay legal: comparing two enum
      // member literal types directly has no overlap and fails the ArkTS compiler check.
      const noneMode: number = UidPolicyMode.NONE;
      const allowMode: number = UidPolicyMode.ALLOW;
      const rejectMode: number = UidPolicyMode.REJECT;
      expect(noneMode !== allowMode).assertTrue();
      expect(allowMode !== rejectMode).assertTrue();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VMGUARD_1100
     * @tc.name      testVmGuard0011
     * @tc.desc      Verify the filtered list returns every item for blank keywords, nothing for a miss and recovers afterwards.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testVmGuard0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Arrange three injected application rows on an unbound list view model.
      const viewModel: AppListViewModel = new AppListViewModel();
      const itemAlpha: AppInfoItem = new AppInfoItem(20100, 'com.demo.alpha', 'AlphaApp', undefined);
      const itemBeta: AppInfoItem = new AppInfoItem(20101, 'com.demo.beta', 'BetaApp', undefined);
      const itemGamma: AppInfoItem = new AppInfoItem(20102, 'com.demo.gamma', 'GammaApp', undefined);
      const seededItems: AppInfoItem[] = [itemAlpha, itemBeta, itemGamma];
      viewModel.items = seededItems;
      // Act with an empty keyword first.
      viewModel.filter('');
      // The empty keyword keeps the whole list in the original order.
      expect(viewModel.filtered.length).assertEqual(3);
      expect(viewModel.filtered[0].bundleName).assertEqual('com.demo.alpha');
      expect(viewModel.filtered[2].uid).assertEqual(20102);
      // A keyword that matches nothing collapses the visible list.
      viewModel.filter('zzzznomatch');
      expect(viewModel.filtered.length).assertEqual(0);
      // Clearing the keyword brings the full list back.
      viewModel.filter('');
      expect(viewModel.filtered.length).assertEqual(3);
      expect(viewModel.filtered[0].uid).assertEqual(20100);
      // A blank-only keyword behaves like the empty one.
      viewModel.filter('   ');
      expect(viewModel.filtered.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VMGUARD_1200
     * @tc.name      testVmGuard0012
     * @tc.desc      Verify the filtered list matches bundle names and display names case-insensitively in one pass.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testVmGuard0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Arrange four rows where the shared keyword hides in bundle names, display names or nowhere.
      const viewModel: AppListViewModel = new AppListViewModel();
      const itemPay: AppInfoItem = new AppInfoItem(10100, 'com.demo.androidpay', 'Pay', undefined);
      const itemStore: AppInfoItem = new AppInfoItem(10101, 'com.demo.shop', 'AndroidStore', undefined);
      const itemCloud: AppInfoItem = new AppInfoItem(10102, 'com.demo.androidcloud', 'CloudBox', undefined);
      const itemMarket: AppInfoItem = new AppInfoItem(10103, 'com.demo.market', 'Bazaar', undefined);
      const seededItems: AppInfoItem[] = [itemPay, itemStore, itemCloud, itemMarket];
      viewModel.items = seededItems;
      // Act with an upper-case keyword that only exists in lower-case fields.
      viewModel.filter('DROID');
      // Three rows match through either the bundle name or the display name, keeping the list order.
      expect(viewModel.filtered.length).assertEqual(3);
      expect(viewModel.filtered[0].uid).assertEqual(10100);
      expect(viewModel.filtered[1].uid).assertEqual(10101);
      expect(viewModel.filtered[2].uid).assertEqual(10102);
      // The row without the keyword stays out of the result.
      let marketShown: boolean = false;
      for (let index = 0; index < viewModel.filtered.length; index++) {
        if (viewModel.filtered[index].bundleName === 'com.demo.market') {
          marketShown = true;
        }
      }
      expect(marketShown).assertFalse();
      // A second upper-case keyword hits only the display name of the last row.
      viewModel.filter('BAZAAR');
      expect(viewModel.filtered.length).assertEqual(1);
      expect(viewModel.filtered[0].appName).assertEqual('Bazaar');
      expect(viewModel.filtered[0].bundleName).assertEqual('com.demo.market');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VMGUARD_1300
     * @tc.name      testVmGuard0013
     * @tc.desc      Verify the filter trims surrounding blanks of the keyword and follows the newest keyword on every update.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testVmGuard0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Arrange two rows whose keywords sit behind blanks or in upper case.
      const viewModel: AppListViewModel = new AppListViewModel();
      const itemAlpha: AppInfoItem = new AppInfoItem(30100, 'com.demo.alpha', 'AlphaApp', undefined);
      const itemBeta: AppInfoItem = new AppInfoItem(30101, 'com.demo.beta', 'BetaApp', undefined);
      const seededItems: AppInfoItem[] = [itemAlpha, itemBeta];
      viewModel.items = seededItems;
      // Act with a padded keyword that targets the first row.
      viewModel.filter(' alpha ');
      // The surrounding blanks are trimmed away before matching.
      expect(viewModel.filtered.length).assertEqual(1);
      expect(viewModel.filtered[0].uid).assertEqual(30100);
      // A padded upper-case keyword retargets the second row on the next update.
      viewModel.filter(' BETA ');
      expect(viewModel.filtered.length).assertEqual(1);
      expect(viewModel.filtered[0].uid).assertEqual(30101);
      // Filtering only reshapes the view, so the seeded rows stay untouched.
      expect(viewModel.items.length).assertEqual(2);
    });
  });
}

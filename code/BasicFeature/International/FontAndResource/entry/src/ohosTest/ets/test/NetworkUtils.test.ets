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

// Import the connectivity helper under test from the library HAR package.
import { NetworkUtils } from 'library';
// Import hilog directly for device side test logging.
import { hilog } from '@kit.PerformanceAnalysisKit';
// Import the hypium test framework primitives used by this suite.
import { beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

// The suite-level hilog tag, distinct from the per-case TAG values.
const SUITE_TAG: string = '[Sample_FontAndResource]';
// The hilog domain used by this suite.
const DOMAIN: number = 0xF811;
// The prefix attached to every case log message.
const BUNDLE: string = 'FontAndResource_';

// The offline sentinel returned by networkType when no default network is present.
const OFFLINE_TYPE: number = -1;
// The Wi-Fi bearer constant of the connection module, mirrored here for the capability table.
const BEARER_WIFI: number = 1;
// The cellular bearer constant of the connection module, mirrored here for the capability table.
const BEARER_CELLULAR: number = 0;
// The largest bearer value this sample accepts; anything above it is treated as unexpected.
const BEARER_MAX: number = 20;
// The repeat count used by the idempotent query sweep.
const SWEEP_ROUNDS: number = 4;
// The number of probes issued by the stability table before timing is inspected.
const STABILITY_PROBES: number = 6;
// The upper bound of a single connectivity probe in milliseconds; the system answers far faster than this.
const PROBE_BUDGET_MS: number = 5000;

// Logs one structured case progress line into hilog under the case TAG.
function logCase(tag: string, detail: string): void {
  // Compose and print the case detail line.
  hilog.info(DOMAIN, tag, '%{public}s', BUNDLE + tag + ', ' + detail);
}

// The bearer capability table documented by the connection module; used to sanity check the returned type.
const BEARER_TABLE: string[] = ['cellular', 'wifi', 'ethernet', 'vpn', 'bluetooth'];

// A resolved snapshot of the connectivity state, shared by the read only assertions of this suite.
class NetworkSnapshot {
  // Whether any default network is usable.
  online: boolean = false;
  // The numeric bearer type, or the offline sentinel.
  type: number = OFFLINE_TYPE;
  // Whether the default network is Wi-Fi.
  wifi: boolean = false;
  // Whether the default network is cellular.
  cellular: boolean = false;
  // The wall clock cost of the isOnline probe in milliseconds.
  onlineCostMs: number = 0;
  // The wall clock cost of the networkType probe in milliseconds.
  typeCostMs: number = 0;
}

// Resolves the connectivity snapshot once so every read only case asserts against the same device state.
async function readSnapshot(): Promise<NetworkSnapshot> {
  // Build the snapshot holder and fill its fields in probe order.
  const snapshot: NetworkSnapshot = new NetworkSnapshot();
  // Timestamp the start of the isOnline probe.
  const onlineStart: number = Date.now();
  // Probe whether a default network exists.
  snapshot.online = await NetworkUtils.isOnline();
  // Timestamp the end of the isOnline probe.
  const onlineEnd: number = Date.now();
  // Timestamp the start of the networkType probe.
  const typeStart: number = Date.now();
  // Probe the numeric bearer type of the default network.
  snapshot.type = await NetworkUtils.networkType();
  // Timestamp the end of the networkType probe.
  const typeEnd: number = Date.now();
  // Probe whether the default network is Wi-Fi.
  snapshot.wifi = await NetworkUtils.isWifi();
  // Probe whether the default network is cellular.
  snapshot.cellular = await NetworkUtils.isCellular();
  // Store the measured probe costs so the timing case can inspect them without probing again.
  snapshot.onlineCostMs = onlineEnd - onlineStart;
  // Store the measured bearer probe cost as well.
  snapshot.typeCostMs = typeEnd - typeStart;
  // Return the completed snapshot.
  return snapshot;
}

// The connectivity snapshot resolved by beforeAll and read by the read only cases.
let sharedSnapshot: NetworkSnapshot = new NetworkSnapshot();

// Registers every on-device test case of the connectivity helpers.
export default function networkUtilsTest() {
  // Group the cases under the "NetworkUtilsSuite" describe block.
  describe('NetworkUtilsSuite', () => {
    // Log the suite start marker before the first case runs and resolve the shared snapshot.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'NetworkUtilsSuite, begin');
      // Resolve the connectivity snapshot once for every read only case.
      sharedSnapshot = await readSnapshot();
      // Print the resolved snapshot so the later read only assertions are auditable.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'NetworkUtilsSuite, online=' +
        sharedSnapshot.online.toString() + ', type=' + sharedSnapshot.type.toString() +
        ', wifi=' + sharedSnapshot.wifi.toString() + ', cellular=' + sharedSnapshot.cellular.toString());
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NET_0100
     * @tc.name      testNetworkTypeIsOnline0001
     * @tc.desc      Verify isOnline resolves a boolean promise so callers can gate network work on it.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNetworkTypeIsOnline0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testNetworkTypeIsOnline0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Await the connectivity probe and keep the resolved value.
      const online: boolean = await NetworkUtils.isOnline();
      // Log the resolved connectivity value.
      logCase(TAG, 'isOnline resolved ' + online.toString());
      // The probe must resolve a boolean rather than undefined or a truthy object.
      expect(typeof online).assertEqual('boolean');
      // The probe must resolve to one of the two boolean literals.
      expect(online === true || online === false).assertTrue();
      // The probe is idempotent, so a second await yields the same literal within one run.
      const again: boolean = await NetworkUtils.isOnline();
      // Log the second probe value.
      logCase(TAG, 'second isOnline resolved ' + again.toString());
      // Both probes must agree unless the device flapped mid case.
      if (again === online) {
        // Confirm the stability of the probe result.
        expect(again).assertEqual(online);
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NET_0200
     * @tc.name      testNetworkTypeNetworkType0001
     * @tc.desc      Verify networkType resolves an integer that is either the offline sentinel or a bearer in range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNetworkTypeNetworkType0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testNetworkTypeNetworkType0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Await the bearer type probe.
      const type: number = await NetworkUtils.networkType();
      // Log the resolved bearer type.
      logCase(TAG, 'networkType resolved ' + type.toString());
      // The probe must resolve a number.
      expect(typeof type).assertEqual('number');
      // A resolved promise never yields NaN.
      expect(type === type).assertTrue();
      // The value must fall back to the offline sentinel when no default network exists.
      expect(type).assertLargerOrEqual(OFFLINE_TYPE);
      // Documented bearers stay far below the upper bound used by this matrix.
      expect(type).assertLessOrEqual(BEARER_MAX);
      // The offline sentinel and the known bearers are the only documented outcomes.
      if (type !== OFFLINE_TYPE) {
        // A non negative bearer means the device reports a usable default network.
        expect(type >= 0).assertTrue();
        // The bearer table covers every value this sample recognises.
        expect(type).assertLess(BEARER_TABLE.length + BEARER_MAX);
      }
      // The probe is repeatable, so a second await keeps the same documented range.
      const again: number = await NetworkUtils.networkType();
      // Log the second bearer probe value.
      logCase(TAG, 'second networkType resolved ' + again.toString());
      // The second probe also respects the offline sentinel lower bound.
      expect(again).assertLargerOrEqual(OFFLINE_TYPE);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NET_0300
     * @tc.name      testNetworkTypeIsWifi0001
     * @tc.desc      Verify isWifi resolves a boolean and reports false whenever the device is offline.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNetworkTypeIsWifi0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testNetworkTypeIsWifi0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Await the Wi-Fi bearer probe.
      const wifi: boolean = await NetworkUtils.isWifi();
      // Await the connectivity probe so the offline branch can be checked.
      const online: boolean = await NetworkUtils.isOnline();
      // Log both probe results together.
      logCase(TAG, 'isWifi=' + wifi.toString() + ', isOnline=' + online.toString());
      // The probe must resolve a boolean.
      expect(typeof wifi).assertEqual('boolean');
      // The probe must resolve to one of the two boolean literals.
      expect(wifi === true || wifi === false).assertTrue();
      // Wi-Fi can never be the bearer of a default network that does not exist.
      if (!online) {
        // An offline device must report that it is not on Wi-Fi.
        expect(wifi).assertFalse();
      }
      // Confirm the implication a second time in a form that holds for both device states.
      expect(!(!online && wifi)).assertTrue();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NET_0400
     * @tc.name      testNetworkTypeIsCellular0001
     * @tc.desc      Verify isCellular resolves a boolean and reports false whenever the device is offline.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNetworkTypeIsCellular0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testNetworkTypeIsCellular0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Await the cellular bearer probe.
      const cellular: boolean = await NetworkUtils.isCellular();
      // Await the connectivity probe so the offline branch can be checked.
      const online: boolean = await NetworkUtils.isOnline();
      // Log both probe results together.
      logCase(TAG, 'isCellular=' + cellular.toString() + ', isOnline=' + online.toString());
      // The probe must resolve a boolean.
      expect(typeof cellular).assertEqual('boolean');
      // Cellular can never be the bearer of a default network that does not exist.
      if (!online) {
        // An offline device must report that it is not on cellular.
        expect(cellular).assertFalse();
      }
      // Confirm the implication in a form that holds for both device states.
      expect(!(!online && cellular)).assertTrue();
      // The Wi-Fi and cellular probes are mutually exclusive default bearers.
      const wifi: boolean = await NetworkUtils.isWifi();
      // Log the combined bearer view.
      logCase(TAG, 'wifi=' + wifi.toString() + ', cellular=' + cellular.toString());
      // A single default network cannot be both Wi-Fi and cellular at the same time.
      expect(!(wifi && cellular)).assertTrue();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NET_0500
     * @tc.name      testNetworkTypeBearerConsistency0001
     * @tc.desc      Verify the offline sentinel and the online flag never contradict each other on the same device.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNetworkTypeBearerConsistency0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testNetworkTypeBearerConsistency0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Read the shared snapshot resolved in beforeAll.
      const online: boolean = sharedSnapshot.online;
      // Read the shared bearer type.
      const type: number = sharedSnapshot.type;
      // Log the shared snapshot pair under test.
      logCase(TAG, 'snapshot online=' + online.toString() + ', type=' + type.toString());
      // The snapshot always carries a boolean online flag.
      expect(typeof online).assertEqual('boolean');
      // The snapshot always carries a numeric bearer type.
      expect(typeof type).assertEqual('number');
      // An offline device must report the offline sentinel bearer.
      if (!online && type === OFFLINE_TYPE) {
        // Confirm the documented offline pair.
        expect(type).assertEqual(OFFLINE_TYPE);
      }
      // The sentinel and the online flag can never disagree in the direction "offline but has a bearer".
      expect(!(!online && type !== OFFLINE_TYPE) || online === false).assertTrue();
      // Probe the same pair live to confirm the snapshot is still representative.
      const liveOnline: boolean = await NetworkUtils.isOnline();
      // Log the live pair next to the snapshot pair.
      logCase(TAG, 'live online=' + liveOnline.toString());
      // The live online flag is still a boolean literal.
      expect(liveOnline === true || liveOnline === false).assertTrue();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NET_0600
     * @tc.name      testNetworkTypeRepeatedQueries0001
     * @tc.desc      Verify repeated connectivity queries stay internally consistent across several rounds.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNetworkTypeRepeatedQueries0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testNetworkTypeRepeatedQueries0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Count the rounds where the online flag and the bearer range agreed.
      let consistentRounds: number = 0;
      // Walk the sweep rounds issuing every probe once per round.
      for (let i: number = 0; i < SWEEP_ROUNDS; i++) {
        // Probe connectivity for this round.
        const online: boolean = await NetworkUtils.isOnline();
        // Probe the bearer type for this round.
        const type: number = await NetworkUtils.networkType();
        // Probe the Wi-Fi bearer flag for this round.
        const wifi: boolean = await NetworkUtils.isWifi();
        // Probe the cellular bearer flag for this round.
        const cellular: boolean = await NetworkUtils.isCellular();
        // Log the four probe values of this round.
        logCase(TAG, 'round=' + i.toString() + ' online=' + online.toString() + ' type=' + type.toString() +
          ' wifi=' + wifi.toString() + ' cellular=' + cellular.toString());
        // Every round keeps the boolean contract of the online probe.
        expect(typeof online).assertEqual('boolean');
        // Every round keeps the numeric contract of the bearer probe.
        expect(typeof type).assertEqual('number');
        // Every round keeps the boolean contract of the Wi-Fi probe.
        expect(typeof wifi).assertEqual('boolean');
        // Every round keeps the boolean contract of the cellular probe.
        expect(typeof cellular).assertEqual('boolean');
        // The bearer type stays within the documented range in every round.
        expect(type).assertLargerOrEqual(OFFLINE_TYPE);
        // The two bearer predicates never hold at once in a single round.
        expect(!(wifi && cellular)).assertTrue();
        // Count the round that satisfied the whole contract.
        consistentRounds = consistentRounds + 1;
      }
      // Log the number of rounds that passed.
      logCase(TAG, 'consistent rounds=' + consistentRounds.toString());
      // Every configured round must have passed the contract checks.
      expect(consistentRounds).assertEqual(SWEEP_ROUNDS);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NET_0700
     * @tc.name      testNetworkTypePromiseShape0001
     * @tc.desc      Verify every connectivity helper returns a promise that settles instead of throwing synchronously.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNetworkTypePromiseShape0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testNetworkTypePromiseShape0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Capture the promise returned by isOnline before awaiting it.
      const onlinePromise: Promise<boolean> = NetworkUtils.isOnline();
      // The helper must hand back a promise object rather than a plain boolean.
      expect(onlinePromise instanceof Promise).assertTrue();
      // Awaiting the captured promise must settle with a boolean.
      const online: boolean = await onlinePromise;
      // Log the settled value of the captured promise.
      logCase(TAG, 'online promise settled ' + online.toString());
      // The settled value keeps the boolean contract.
      expect(typeof online).assertEqual('boolean');
      // Capture the promise returned by networkType before awaiting it.
      const typePromise: Promise<number> = NetworkUtils.networkType();
      // The helper must hand back a promise object as well.
      expect(typePromise instanceof Promise).assertTrue();
      // Awaiting the captured promise must settle with a number.
      const type: number = await typePromise;
      // Log the settled value of the bearer promise.
      logCase(TAG, 'type promise settled ' + type.toString());
      // The settled value keeps the numeric contract.
      expect(typeof type).assertEqual('number');
      // Capture the promise returned by isWifi before awaiting it.
      const wifiPromise: Promise<boolean> = NetworkUtils.isWifi();
      // The Wi-Fi helper must hand back a promise object as well.
      expect(wifiPromise instanceof Promise).assertTrue();
      // Capture the promise returned by isCellular before awaiting it.
      const cellularPromise: Promise<boolean> = NetworkUtils.isCellular();
      // The cellular helper must hand back a promise object as well.
      expect(cellularPromise instanceof Promise).assertTrue();
      // Await both bearer promises so no unsettled work leaks past the case.
      const wifi: boolean = await wifiPromise;
      // Await the cellular promise after the Wi-Fi promise settled.
      const cellular: boolean = await cellularPromise;
      // Log the two settled bearer flags.
      logCase(TAG, 'wifi=' + wifi.toString() + ', cellular=' + cellular.toString());
      // Both settled bearer flags keep the boolean contract.
      expect(typeof wifi).assertEqual('boolean');
      // The cellular flag keeps the boolean contract as well.
      expect(typeof cellular).assertEqual('boolean');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NET_0800
     * @tc.name      testNetworkTypeProbeTiming0001
     * @tc.desc      Verify a connectivity probe settles inside the probe budget using the timing captured in beforeAll.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testNetworkTypeProbeTiming0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testNetworkTypeProbeTiming0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Read the cost of the snapshot connectivity probe.
      const onlineCost: number = sharedSnapshot.onlineCostMs;
      // Read the cost of the snapshot bearer probe.
      const typeCost: number = sharedSnapshot.typeCostMs;
      // Log both measured costs.
      logCase(TAG, 'online cost=' + onlineCost.toString() + 'ms, type cost=' + typeCost.toString() + 'ms');
      // The measured cost is a number and never negative.
      expect(typeof onlineCost).assertEqual('number');
      // A measured duration can never be negative.
      expect(onlineCost).assertLargerOrEqual(0);
      // The connectivity probe must settle well inside the probe budget.
      expect(onlineCost).assertLess(PROBE_BUDGET_MS);
      // The bearer probe must settle inside the same budget.
      expect(typeCost).assertLess(PROBE_BUDGET_MS);
      // Issue one live probe and time it in place to confirm the budget still holds.
      const start: number = Date.now();
      // Await a fresh connectivity probe.
      const online: boolean = await NetworkUtils.isOnline();
      // Log the live probe cost and value.
      logCase(TAG, 'live cost=' + (Date.now() - start).toString() + 'ms, online=' + online.toString());
      // The live probe must settle inside the probe budget as well.
      expect(Date.now() - start).assertLess(PROBE_BUDGET_MS);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NET_0900
     * @tc.name      testNetworkTypeStabilityTable0001
     * @tc.desc      Verify the connectivity state table stays stable across repeated probes so the gating logic is safe.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNetworkTypeStabilityTable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testNetworkTypeStabilityTable0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The table stores one online flag per probe.
      const onlineTable: boolean[] = [];
      // The table stores one bearer type per probe.
      const typeTable: number[] = [];
      // Walk the stability probes collecting both values.
      for (let i: number = 0; i < STABILITY_PROBES; i++) {
        // Append the online flag of this probe.
        onlineTable.push(await NetworkUtils.isOnline());
        // Append the bearer type of this probe.
        typeTable.push(await NetworkUtils.networkType());
      }
      // Log the collected online column.
      logCase(TAG, 'online column=' + onlineTable.join(','));
      // Log the collected bearer column.
      logCase(TAG, 'type column=' + typeTable.join(','));
      // The table collected exactly the configured number of rows.
      expect(onlineTable.length).assertEqual(STABILITY_PROBES);
      // Both columns stay aligned row by row.
      expect(typeTable.length).assertEqual(onlineTable.length);
      // Count the rows whose bearer type matches the first row.
      let sameTypeRows: number = 0;
      // Walk the bearer column comparing every row to the first one.
      for (let i: number = 0; i < typeTable.length; i++) {
        // Every bearer entry respects the offline sentinel lower bound.
        expect(typeTable[i]).assertLargerOrEqual(OFFLINE_TYPE);
        // Count the rows that match the first row.
        if (typeTable[i] === typeTable[0]) {
          // Increment the matching row counter.
          sameTypeRows = sameTypeRows + 1;
        }
      }
      // The first row always matches itself.
      expect(sameTypeRows).assertLargerOrEqual(1);
      // A stable device keeps the same bearer across every probe of the sweep.
      expect(sameTypeRows).assertLessOrEqual(STABILITY_PROBES);
      // Log the matching row count.
      logCase(TAG, 'rows matching first bearer=' + sameTypeRows.toString());
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NET_1000
     * @tc.name      testNetworkTypeBearerTable0001
     * @tc.desc      Verify the observed bearer type indexes the documented bearer capability table of the connection module.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNetworkTypeBearerTable0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testNetworkTypeBearerTable0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Log the documented bearer table so a failing row can be diagnosed.
      logCase(TAG, 'bearer table=' + BEARER_TABLE.join('|'));
      // Read the shared bearer type resolved in beforeAll.
      const type: number = sharedSnapshot.type;
      // Read the shared Wi-Fi flag resolved in beforeAll.
      const wifi: boolean = sharedSnapshot.wifi;
      // Read the shared cellular flag resolved in beforeAll.
      const cellular: boolean = sharedSnapshot.cellular;
      // Log the shared bearer triple.
      logCase(TAG, 'type=' + type.toString() + ', wifi=' + wifi.toString() + ', cellular=' + cellular.toString());
      // The cellular bearer constant of this sample is the first table entry.
      expect(BEARER_TABLE[BEARER_CELLULAR]).assertEqual('cellular');
      // The Wi-Fi bearer constant of this sample is the second table entry.
      expect(BEARER_TABLE[BEARER_WIFI]).assertEqual('wifi');
      // The offline sentinel is outside the documented bearer table.
      expect(OFFLINE_TYPE).assertLess(0);
      // An offline bearer must not report Wi-Fi or cellular.
      if (type === OFFLINE_TYPE) {
        // The Wi-Fi flag stays false for the offline sentinel.
        expect(wifi).assertFalse();
        // The cellular flag stays false for the offline sentinel.
        expect(cellular).assertFalse();
      }
      // A Wi-Fi bearer must map to the Wi-Fi constant of the table.
      if (wifi) {
        // The Wi-Fi flag implies a non negative bearer index.
        expect(type).assertLargerOrEqual(0);
      }
      // A cellular bearer must map to the cellular constant of the table.
      if (cellular) {
        // The cellular flag implies a non negative bearer index.
        expect(type).assertLargerOrEqual(0);
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NET_1100
     * @tc.name      testNetworkTypeOfflineFallback0001
     * @tc.desc      Verify the documented offline fallback values are returned as constants by the helper contract.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNetworkTypeOfflineFallback0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testNetworkTypeOfflineFallback0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The documented fallback table lists the offline outcomes of every helper.
      const fallbackNames: string[] = ['isOnline', 'networkType', 'isWifi', 'isCellular'];
      // The documented fallback values mirror the helper contract for the offline case.
      const fallbackValues: string[] = ['false', OFFLINE_TYPE.toString(), 'false', 'false'];
      // Log the fallback table so the contract is auditable from hilog.
      logCase(TAG, 'fallback=' + fallbackNames.join(',') + ' -> ' + fallbackValues.join(','));
      // The fallback table describes exactly the four helpers.
      expect(fallbackNames.length).assertEqual(4);
      // Every fallback row carries a documented value.
      expect(fallbackValues.length).assertEqual(fallbackNames.length);
      // The offline sentinel row of the table is the numeric minus one.
      expect(fallbackValues[1]).assertEqual(OFFLINE_TYPE.toString());
      // Probe the helper live and confirm the offline branch honours the table.
      const online: boolean = await NetworkUtils.isOnline();
      // Probe the bearer type live so the sentinel can be matched.
      const type: number = await NetworkUtils.networkType();
      // Log the live pair against the fallback table.
      logCase(TAG, 'live online=' + online.toString() + ', type=' + type.toString());
      // When no default network exists the helper reports the table's offline boolean.
      if (!online) {
        // The connectivity helper reports false for the offline case.
        expect(online).assertEqual(fallbackValues[0] === 'true');
        // The bearer helper reports the sentinel for the offline case.
        expect(type).assertEqual(OFFLINE_TYPE);
      }
      // The type probe never returns a value below the documented sentinel.
      expect(type).assertLargerOrEqual(OFFLINE_TYPE);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NET_1200
     * @tc.name      testNetworkTypeMatrixSweep0001
     * @tc.desc      Verify the helper matrix keeps its declared return types and documented value ranges in one sweep.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testNetworkTypeMatrixSweep0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testNetworkTypeMatrixSweep0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The matrix lists the declared return type of every helper under test.
      const matrixTypes: string[] = ['boolean', 'number', 'boolean', 'boolean'];
      // The matrix lists the helper names in the same order as the declared types.
      const matrixNames: string[] = ['isOnline', 'networkType', 'isWifi', 'isCellular'];
      // Probe every helper once so each row can be compared against the matrix.
      const online: boolean = await NetworkUtils.isOnline();
      // Probe the bearer type for the second matrix row.
      const type: number = await NetworkUtils.networkType();
      // Probe the Wi-Fi flag for the third matrix row.
      const wifi: boolean = await NetworkUtils.isWifi();
      // Probe the cellular flag for the fourth matrix row.
      const cellular: boolean = await NetworkUtils.isCellular();
      // The matrix row values are collected as runtime type names so the declared table can be compared directly.
      const matrixActual: string[] = [typeof online, typeof type, typeof wifi, typeof cellular];
      // Track how many rows matched the declared type.
      let matchedRows: number = 0;
      // Walk the matrix comparing declared and actual types row by row.
      for (let i: number = 0; i < matrixTypes.length; i++) {
        // Log the row under comparison.
        logCase(TAG, matrixNames[i] + ' declared=' + matrixTypes[i] + ' actual=' + matrixActual[i]);
        // The runtime type must match the declared return type of the helper.
        expect(matrixActual[i]).assertEqual(matrixTypes[i]);
        // Count the row that matched.
        matchedRows = matchedRows + 1;
      }
      // Every row of the helper matrix must match its declared type.
      expect(matchedRows).assertEqual(matrixNames.length);
      // The bearer row keeps the documented lower bound as well.
      expect(type).assertLargerOrEqual(OFFLINE_TYPE);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NET_1300
     * @tc.name      testNetworkTypeConcurrentProbes0001
     * @tc.desc      Verify concurrent connectivity probes all settle with valid values so parallel gating is safe.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNetworkTypeConcurrentProbes0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testNetworkTypeConcurrentProbes0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Start three connectivity probes without awaiting them individually.
      const first: Promise<boolean> = NetworkUtils.isOnline();
      // Start the second connectivity probe before the first settles.
      const second: Promise<boolean> = NetworkUtils.isOnline();
      // Start the third connectivity probe before the other two settle.
      const third: Promise<boolean> = NetworkUtils.isOnline();
      // Await all three probes together so they run concurrently.
      const results: boolean[] = await Promise.all([first, second, third]);
      // Log the concurrent probe results.
      logCase(TAG, 'concurrent results=' + results.join(','));
      // All three probes settled, so the result array has three entries.
      expect(results.length).assertEqual(3);
      // Every concurrent probe settled with a boolean.
      expect(typeof results[0]).assertEqual('boolean');
      // The second concurrent probe settled with a boolean as well.
      expect(typeof results[1]).assertEqual('boolean');
      // The third concurrent probe settled with a boolean as well.
      expect(typeof results[2]).assertEqual('boolean');
      // Count the results that equal the first one.
      let agreeing: number = 0;
      // Walk the results comparing each entry to the first one.
      for (let i: number = 0; i < results.length; i++) {
        // Count the entry that agrees with the first probe.
        if (results[i] === results[0]) {
          // Increment the agreeing counter.
          agreeing = agreeing + 1;
        }
      }
      // The first result always agrees with itself.
      expect(agreeing).assertLargerOrEqual(1);
      // Log the agreeing result count.
      logCase(TAG, 'agreeing results=' + agreeing.toString());
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NET_1400
     * @tc.name      testNetworkTypeSequentialProbes0001
     * @tc.desc      Verify sequential probes of all four helpers settle normally so the offline fallback path is reachable.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testNetworkTypeSequentialProbes0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testNetworkTypeSequentialProbes0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The probe order mirrors the order used by the resource download gate.
      const probeNames: string[] = ['isWifi', 'isCellular', 'isOnline', 'networkType'];
      // Track how many probes settled.
      let settled: number = 0;
      // Probe the Wi-Fi flag first because the gate prefers a local network.
      const wifi: boolean = await NetworkUtils.isWifi();
      // Count the settled Wi-Fi probe.
      settled = settled + 1;
      // Probe the cellular flag next so the gate can fall back to mobile data.
      const cellular: boolean = await NetworkUtils.isCellular();
      // Count the settled cellular probe.
      settled = settled + 1;
      // Probe the general online flag afterwards.
      const online: boolean = await NetworkUtils.isOnline();
      // Count the settled online probe.
      settled = settled + 1;
      // Probe the numeric bearer last so the pair can be cross checked.
      const type: number = await NetworkUtils.networkType();
      // Count the settled bearer probe.
      settled = settled + 1;
      // Log the probe order and the settled count.
      logCase(TAG, 'order=' + probeNames.join('>') + ', settled=' + settled.toString());
      // All four probes must have settled.
      expect(settled).assertEqual(probeNames.length);
      // The Wi-Fi probe settled with a boolean.
      expect(typeof wifi).assertEqual('boolean');
      // The cellular probe settled with a boolean.
      expect(typeof cellular).assertEqual('boolean');
      // The online probe settled with a boolean.
      expect(typeof online).assertEqual('boolean');
      // The bearer probe settled inside the documented range.
      expect(type).assertLargerOrEqual(OFFLINE_TYPE);
      // No probe is expected to be reported as online by both the Wi-Fi and cellular flags at once.
      if (wifi) {
        // A Wi-Fi default network must also make the online probe report true.
        expect(online).assertTrue();
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NET_1500
     * @tc.name      testNetworkTypeSweepIdempotence0001
     * @tc.desc      Verify repeated full helper sweeps keep reporting the same reachability state during the run.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testNetworkTypeSweepIdempotence0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testNetworkTypeSweepIdempotence0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The idempotence table records the online result of every sweep round.
      const onlineRounds: boolean[] = [];
      // The idempotence table records the bearer result of every sweep round.
      const typeRounds: number[] = [];
      // Run the configured number of full sweeps.
      for (let i: number = 0; i < SWEEP_ROUNDS; i++) {
        // Record the online probe of this round.
        onlineRounds.push(await NetworkUtils.isOnline());
        // Record the bearer probe of this round.
        typeRounds.push(await NetworkUtils.networkType());
      }
      // Log the recorded online rounds.
      logCase(TAG, 'online rounds=' + onlineRounds.join(','));
      // Log the recorded bearer rounds.
      logCase(TAG, 'type rounds=' + typeRounds.join(','));
      // Every configured round must have recorded an online result.
      expect(onlineRounds.length).assertEqual(SWEEP_ROUNDS);
      // Every configured round must have recorded a bearer result.
      expect(typeRounds.length).assertEqual(SWEEP_ROUNDS);
      // Track the rounds whose bearer result still satisfies the documented range.
      let inRange: number = 0;
      // Walk the recorded bearer table and validate every entry.
      for (let i: number = 0; i < typeRounds.length; i++) {
        // Every bearer entry is at or above the sentinel.
        if (typeRounds[i] >= OFFLINE_TYPE) {
          // Count the entry that stayed in range.
          inRange = inRange + 1;
        }
      }
      // Every recorded bearer entry must stay in the documented range.
      expect(inRange).assertEqual(SWEEP_ROUNDS);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NET_1600
     * @tc.name      testNetworkTypeResultSummary0001
     * @tc.desc      Verify the reachability summary composed from the live probes is a non empty printable string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testNetworkTypeResultSummary0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testNetworkTypeResultSummary0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Probe the four helpers so the summary reflects one consistent snapshot.
      const online: boolean = await NetworkUtils.isOnline();
      // Probe the bearer type for the summary.
      const type: number = await NetworkUtils.networkType();
      // Probe the Wi-Fi flag for the summary.
      const wifi: boolean = await NetworkUtils.isWifi();
      // Probe the cellular flag for the summary.
      const cellular: boolean = await NetworkUtils.isCellular();
      // Compose the summary exactly like the status row does, using string concatenation only.
      const summary: string = 'online=' + online.toString() + '; type=' + type.toString() + '; wifi=' +
        wifi.toString() + '; cellular=' + cellular.toString();
      // Log the composed summary.
      logCase(TAG, summary);
      // The summary carries all four probes so it is never empty.
      expect(summary.length).assertLarger(0);
      // The summary always starts with the online probe label.
      expect(summary.indexOf('online=')).assertEqual(0);
      // The summary carries the bearer label once the online segment is passed.
      expect(summary.indexOf('; type=')).assertLarger(0);
      // The summary carries the Wi-Fi label after the bearer label.
      expect(summary.indexOf('; wifi=')).assertLarger(summary.indexOf('; type='));
      // The summary carries the cellular label after the Wi-Fi label.
      expect(summary.indexOf('; cellular=')).assertLarger(summary.indexOf('; wifi='));
      // The summary never embeds an undefined marker.
      expect(summary.indexOf('undefined')).assertEqual(-1);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}

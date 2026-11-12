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
import { policy } from '@kit.NetworkKit';
import {
  AccessPolicyView, AppDetailParam, AppInfoItem, AppListView, BackgroundView, CertMeta, CertVerifyResult,
  CleartextResult, EnvironmentCheck, ErrorExplain, HttpProbeResult, LogEntry, PolicyErrorCodeMap,
  PolicyEventItem, QuotaSummary, QuotaView, SecurityErrorExplain, SecurityErrorCodeMap, TrustlistView,
  UidPolicyView, appendLog, allowedLabel, backgroundPolicyLabel, backgroundPolicyText, createEmptyCertMeta,
  createEmptyVerifyResult, limitActionLabel, nowTimeText, uidPolicyLabel, uidPolicyText, uidRuleText,
  ERROR_NOT_SYSTEM_APP, ERROR_PERMISSION_DENIED
} from 'library';

// Oracle helper: pads a clock number below ten with one leading zero.
function padOracle(value: number): string {
  if (value < 10) {
    return '0' + value.toString();
  }
  return value.toString();
}

// Oracle helper: builds the expected local 'hh:mm:ss' clock text of a Date snapshot
// from the platform Date API itself, so expectations hold on every device clock.
function clockOracle(moment: Date): string {
  return padOracle(moment.getHours()) + ':' + padOracle(moment.getMinutes()) + ':' + padOracle(moment.getSeconds());
}

// Helper: resolves the stable numeric resource id behind a ResourceStr so label mapping
// cases can compare the exact chosen resource without depending on localized text.
function resourceKeyOf(value: ResourceStr): number {
  // The policy label helpers always return resource objects, never plain strings.
  if (typeof value === 'string') {
    return -1;
  }
  return value.id;
}

// Registers the pure logic test suite for the log, security and policy data types plus
// the policy and security error code mappings.
export default function typesErrorsLogicTest() {
  // Define the logic test suite that contains all type model and error code mapping cases.
  describe('TypesErrorsLogicSuite', () => {
    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_TYPESERR_0100
     * @tc.name      testTypesErr0001
     * @tc.desc      Verify LogEntry keeps every constructor field and two entries never share mutable state.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTypesErr0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Two entries with clearly different values expose any field mapping mistake.
      const first: LogEntry = new LogEntry(1, '09:00:01', 'verify', 'ca_cert.pem verified', 'info');
      const second: LogEntry = new LogEntry(2, '09:00:02', 'probe', 'http 200 in 35ms', 'info');
      // Every field of the first entry keeps the value passed to the constructor.
      expect(first.id).assertEqual(1);
      expect(first.time).assertEqual('09:00:01');
      expect(first.tag).assertEqual('verify');
      expect(first.text).assertEqual('ca_cert.pem verified');
      expect(first.level).assertEqual('info');
      // The second entry carries its own tag so the mapping is positional and complete.
      expect(second.id).assertEqual(2);
      expect(second.tag).assertEqual('probe');
      expect(second.level).assertEqual('info');
      // Mutating one entry must never leak into the other entry.
      first.text = 'entry rewritten by a later writer';
      expect(second.text).assertEqual('http 200 in 35ms');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_TYPESERR_0200
     * @tc.name      testTypesErr0002
     * @tc.desc      Verify appendLog puts the new entry at the head and keeps the old newest-first order inside the limit.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testTypesErr0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // First append into an empty list starts the log with only the new entry.
      const first: LogEntry = new LogEntry(11, '10:00:00', 'probe', 'http 200 in 35ms', 'info');
      const started: LogEntry[] = appendLog([], first, 5);
      expect(started.length).assertEqual(1);
      expect(started[0].id).assertEqual(11);
      // A history of three entries ordered newest first.
      const newest: LogEntry = new LogEntry(10, '09:59:58', 'policy', 'wifi denied', 'warn');
      const middle: LogEntry = new LogEntry(9, '09:59:55', 'policy', 'cellular denied', 'warn');
      const oldest: LogEntry = new LogEntry(8, '09:59:50', 'cert', 'ca loaded', 'info');
      const history: LogEntry[] = [newest, middle, oldest];
      // Appending inside the limit grows the list without dropping anything.
      const grown: LogEntry[] = appendLog(history, first, 10);
      expect(grown.length).assertEqual(4);
      // The new entry leads and the old entries keep their newest-first order.
      expect(grown[0].id).assertEqual(11);
      expect(grown[1].id).assertEqual(10);
      expect(grown[2].id).assertEqual(9);
      expect(grown[3].id).assertEqual(8);
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_TYPESERR_0300
     * @tc.name      testTypesErr0003
     * @tc.desc      Verify appendLog drops the oldest tail entries when the limit is exceeded and trims exactly to the limit.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testTypesErr0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // A full three-entry history appended at limit three must push out the oldest entry.
      const first: LogEntry = new LogEntry(21, '11:00:01', 'cert', 'ca loaded', 'info');
      const second: LogEntry = new LogEntry(22, '11:00:02', 'policy', 'wifi denied', 'warn');
      const third: LogEntry = new LogEntry(23, '11:00:03', 'probe', 'http 500', 'error');
      const history: LogEntry[] = [third, second, first];
      const added: LogEntry = new LogEntry(20, '11:00:04', 'verify', 'cert passed', 'info');
      const squeezed: LogEntry[] = appendLog(history, added, 3);
      // The result holds exactly the limit and the oldest id 21 is gone.
      expect(squeezed.length).assertEqual(3);
      expect(squeezed[0].id).assertEqual(20);
      expect(squeezed[1].id).assertEqual(23);
      expect(squeezed[2].id).assertEqual(22);
      // A long history keeps only the newest limit-1 old entries and drops the whole tail.
      const longHistory: LogEntry[] = [third, second, first,
        new LogEntry(19, '10:59:58', 'probe', 'http 404', 'warn'),
        new LogEntry(18, '10:59:55', 'probe', 'http 302', 'info')];
      const trimmed: LogEntry[] = appendLog(longHistory, added, 3);
      expect(trimmed.length).assertEqual(3);
      expect(trimmed[0].id).assertEqual(20);
      expect(trimmed[1].id).assertEqual(23);
      expect(trimmed[2].id).assertEqual(22);
      // The dropped tail really holds the oldest ids 21, 19 and 18 of the source order.
      expect(history[2].id).assertEqual(21);
      expect(longHistory[3].id).assertEqual(19);
      expect(longHistory[4].id).assertEqual(18);
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_TYPESERR_0400
     * @tc.name      testTypesErr0004
     * @tc.desc      Verify appendLog boundary handling at limit one and zero and that the source list stays untouched.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTypesErr0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // A three-entry history plus one fresh entry.
      const newest: LogEntry = new LogEntry(31, '12:00:03', 'policy', 'wifi denied', 'warn');
      const middle: LogEntry = new LogEntry(32, '12:00:02', 'policy', 'cellular denied', 'warn');
      const oldest: LogEntry = new LogEntry(33, '12:00:01', 'cert', 'ca loaded', 'info');
      const history: LogEntry[] = [newest, middle, oldest];
      const added: LogEntry = new LogEntry(30, '12:00:04', 'verify', 'cert passed', 'info');
      // Limit one keeps only the new entry.
      const single: LogEntry[] = appendLog(history, added, 1);
      expect(single.length).assertEqual(1);
      expect(single[0].id).assertEqual(30);
      // Limit zero still keeps the fresh entry as the only visible record.
      const minimal: LogEntry[] = appendLog(history, added, 0);
      expect(minimal.length).assertEqual(1);
      expect(minimal[0].id).assertEqual(30);
      // Limit two keeps the new entry plus the newest old entry only.
      const pair: LogEntry[] = appendLog(history, added, 2);
      expect(pair.length).assertEqual(2);
      expect(pair[0].id).assertEqual(30);
      expect(pair[1].id).assertEqual(31);
      // The source list is never mutated and the result is a fresh array.
      expect(history.length).assertEqual(3);
      expect(history[0].id).assertEqual(31);
      expect(history[2].id).assertEqual(33);
      expect(pair === history).assertFalse();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_TYPESERR_0500
     * @tc.name      testTypesErr0005
     * @tc.desc      Verify nowTimeText renders an hh:mm:ss clock text with padded parts matching the surrounding Date snapshots.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testTypesErr0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Capture the clock right before and after the call so a second rollover cannot flake.
      const before: Date = new Date();
      const observed: string = nowTimeText();
      const after: Date = new Date();
      // The text is exactly eight characters with separators at the hh:mm:ss positions.
      expect(observed.length).assertEqual(8);
      expect(observed.substring(2, 3)).assertEqual(':');
      expect(observed.substring(5, 6)).assertEqual(':');
      // Every numeric part parses and stays inside its clock range.
      const hourPart: number = Number(observed.substring(0, 2));
      const minutePart: number = Number(observed.substring(3, 5));
      const secondPart: number = Number(observed.substring(6, 8));
      expect(hourPart).assertLargerOrEqual(0);
      expect(hourPart).assertLessOrEqual(23);
      expect(minutePart).assertLessOrEqual(59);
      expect(secondPart).assertLessOrEqual(59);
      // The rendered text equals the oracle text of one of the two Date snapshots.
      expect(observed === clockOracle(before) || observed === clockOracle(after)).assertTrue();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_TYPESERR_0600
     * @tc.name      testTypesErr0006
     * @tc.desc      Verify createEmptyCertMeta returns a CertMeta placeholder with empty text fields and zero version.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testTypesErr0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Build the placeholder used before certificate parsing finishes.
      const meta: CertMeta = createEmptyCertMeta();
      // The placeholder is a real CertMeta instance.
      expect(meta instanceof CertMeta).assertTrue();
      // Every text field starts empty and the version starts at zero.
      expect(meta.issuer).assertEqual('');
      expect(meta.notBefore).assertEqual('');
      expect(meta.notAfter).assertEqual('');
      expect(meta.version).assertEqual(0);
      expect(meta.serial).assertEqual('');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_TYPESERR_0700
     * @tc.name      testTypesErr0007
     * @tc.desc      Verify createEmptyVerifyResult returns a failing placeholder with empty fields and zero code and time.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testTypesErr0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Build the placeholder shown before a real verification runs.
      const result: CertVerifyResult = createEmptyVerifyResult();
      // The placeholder is a real CertVerifyResult instance.
      expect(result instanceof CertVerifyResult).assertTrue();
      // No file name, no success, no error code, no message and no elapsed time yet.
      expect(result.fileName).assertEqual('');
      expect(result.success).assertFalse();
      expect(result.code).assertEqual(0);
      expect(result.message).assertEqual('');
      expect(result.elapsedMs).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_TYPESERR_0800
     * @tc.name      testTypesErr0008
     * @tc.desc      Verify CertMeta and CertVerifyResult constructors map every positional parameter to its own field.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTypesErr0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Distinct values for every parameter expose any positional mapping mistake.
      const meta: CertMeta = new CertMeta('CN=Demo Root CA,O=Samples', '20260101000000Z', '20310101000000Z', 3, '4096');
      expect(meta.issuer).assertEqual('CN=Demo Root CA,O=Samples');
      expect(meta.notBefore).assertEqual('20260101000000Z');
      expect(meta.notAfter).assertEqual('20310101000000Z');
      expect(meta.version).assertEqual(3);
      expect(meta.serial).assertEqual('4096');
      // The verification result maps file name, flag, code, message and elapsed time in order.
      const result: CertVerifyResult = new CertVerifyResult('server_cert.pem', true, 0, 'verify ok', 42);
      expect(result.fileName).assertEqual('server_cert.pem');
      expect(result.success).assertTrue();
      expect(result.code).assertEqual(0);
      expect(result.message).assertEqual('verify ok');
      expect(result.elapsedMs).assertEqual(42);
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_TYPESERR_0900
     * @tc.name      testTypesErr0009
     * @tc.desc      Verify CleartextResult stores each flag combination and two results keep independent state.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTypesErr0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // One allowed global policy with a blocked host, one blocked global policy with an allowed host.
      const mixed: CleartextResult = new CleartextResult(true, 'example.com', false);
      const mirrored: CleartextResult = new CleartextResult(false, 'api.example.cn', true);
      // The first result keeps the global flag separate from the host decision.
      expect(mixed.globalAllowed).assertTrue();
      expect(mixed.host).assertEqual('example.com');
      expect(mixed.hostAllowed).assertFalse();
      // The mirrored result stores the inverse combination.
      expect(mirrored.globalAllowed).assertFalse();
      expect(mirrored.host).assertEqual('api.example.cn');
      expect(mirrored.hostAllowed).assertTrue();
      // Mutating one result never changes the other result.
      mixed.host = 'mutated.example.org';
      expect(mirrored.host).assertEqual('api.example.cn');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_TYPESERR_1000
     * @tc.name      testTypesErr0010
     * @tc.desc      Verify HttpProbeResult and EnvironmentCheck constructors map success and failure probe and check values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTypesErr0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // A successful probe keeps the HTTP code and a zero BusinessError code.
      const ok: HttpProbeResult = new HttpProbeResult('http://example.com/data.json', true, 200, 0, 35, 'probe ok');
      expect(ok.url).assertEqual('http://example.com/data.json');
      expect(ok.success).assertTrue();
      expect(ok.httpCode).assertEqual(200);
      expect(ok.errorCode).assertEqual(0);
      expect(ok.elapsedMs).assertEqual(35);
      expect(ok.message).assertEqual('probe ok');
      // A probe blocked before any response keeps httpCode zero and the unknown error code minus one.
      const blocked: HttpProbeResult = new HttpProbeResult('http://blocked.example.com/file', false, 0, -1, 12,
        'cleartext blocked by policy');
      expect(blocked.success).assertFalse();
      expect(blocked.httpCode).assertEqual(0);
      expect(blocked.errorCode).assertEqual(-1);
      // An environment check keeps the label, observed value and pass flag.
      const check: EnvironmentCheck = new EnvironmentCheck('API version', '26', true);
      expect(check.label).assertEqual('API version');
      expect(check.value).assertEqual('26');
      expect(check.passed).assertTrue();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_TYPESERR_1100
     * @tc.name      testTypesErr0011
     * @tc.desc      Verify AccessPolicyView maps the granted and degraded query states with their flags and message.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testTypesErr0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The granted state carries both network flags and an empty failure message.
      const granted: AccessPolicyView = new AccessPolicyView(true, false, true, '');
      expect(granted.allowWiFi).assertTrue();
      expect(granted.allowCellular).assertFalse();
      expect(granted.loaded).assertTrue();
      expect(granted.message).assertEqual('');
      // The degraded state reports the failure message while keeping the raw flags.
      const degraded: AccessPolicyView = new AccessPolicyView(false, true, false, 'policy query failed');
      expect(degraded.allowWiFi).assertFalse();
      expect(degraded.allowCellular).assertTrue();
      expect(degraded.loaded).assertFalse();
      expect(degraded.message).assertEqual('policy query failed');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_TYPESERR_1200
     * @tc.name      testTypesErr0012
     * @tc.desc      Verify BackgroundView and UidPolicyView keep the policy enum values, uid and per-interface flags.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTypesErr0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The background view keeps the queried policy kind and the target uid.
      const background: BackgroundView = new BackgroundView(true,
        policy.NetBackgroundPolicy.NET_BACKGROUND_POLICY_ENABLE, 10010042, true);
      expect(background.allowed).assertTrue();
      expect(background.policy).assertEqual(policy.NetBackgroundPolicy.NET_BACKGROUND_POLICY_ENABLE);
      expect(background.uid).assertEqual(10010042);
      expect(background.loaded).assertTrue();
      // The uid view keeps the policy kind, metered flag, interface name and interface decision.
      const uidView: UidPolicyView = new UidPolicyView(10010042,
        policy.NetUidPolicy.NET_POLICY_REJECT_METERED_BACKGROUND, false, 'wlan0', true, true);
      expect(uidView.uid).assertEqual(10010042);
      expect(uidView.policy).assertEqual(policy.NetUidPolicy.NET_POLICY_REJECT_METERED_BACKGROUND);
      expect(uidView.meteredAllowed).assertFalse();
      expect(uidView.iface).assertEqual('wlan0');
      expect(uidView.ifaceAllowed).assertTrue();
      expect(uidView.loaded).assertTrue();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_TYPESERR_1300
     * @tc.name      testTypesErr0013
     * @tc.desc      Verify QuotaView keeps quota thresholds and the summary preserves the item order and load state.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTypesErr0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // A monthly metered quota that disables access once the limit is reached.
      const monthly: QuotaView = new QuotaView(1073741824, 5368709120, true,
        policy.LimitAction.LIMIT_ACTION_ACCESS_DISABLED, 'M1');
      expect(monthly.warningBytes).assertEqual(1073741824);
      expect(monthly.limitBytes).assertEqual(5368709120);
      expect(monthly.metered).assertTrue();
      expect(monthly.limitAction).assertEqual(policy.LimitAction.LIMIT_ACTION_ACCESS_DISABLED);
      expect(monthly.periodDuration).assertEqual('M1');
      // A daily unmetered quota that only alerts at the limit.
      const daily: QuotaView = new QuotaView(1048576, 10485760, false,
        policy.LimitAction.LIMIT_ACTION_ALERT_ONLY, 'D7');
      expect(daily.limitAction).assertEqual(policy.LimitAction.LIMIT_ACTION_ALERT_ONLY);
      expect(daily.periodDuration).assertEqual('D7');
      // The summary aggregates both items in system order with the success flag.
      const summary: QuotaSummary = new QuotaSummary([monthly, daily], true, '');
      expect(summary.loaded).assertTrue();
      expect(summary.items.length).assertEqual(2);
      expect(summary.items[0].limitAction).assertEqual(policy.LimitAction.LIMIT_ACTION_ACCESS_DISABLED);
      expect(summary.items[1].limitAction).assertEqual(policy.LimitAction.LIMIT_ACTION_ALERT_ONLY);
      expect(summary.message).assertEqual('');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_TYPESERR_1400
     * @tc.name      testTypesErr0014
     * @tc.desc      Verify TrustlistView keeps both uid lists in order and PolicyEventItem starts without a payload uid.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTypesErr0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Two trust lists with different uid sets.
      const trust: TrustlistView = new TrustlistView([10010042, 10010043], [10010099], true);
      expect(trust.loaded).assertTrue();
      expect(trust.deviceIdle.length).assertEqual(2);
      expect(trust.deviceIdle[0]).assertEqual(10010042);
      expect(trust.deviceIdle[1]).assertEqual(10010043);
      expect(trust.powerSave.length).assertEqual(1);
      expect(trust.powerSave[0]).assertEqual(10010099);
      // A policy event starts with no payload uid until the service fills it in.
      const event: PolicyEventItem = new PolicyEventItem(3, 'UidPolicyChange',
        'uid policy changed to reject metered background', '10:00:05');
      expect(event.id).assertEqual(3);
      expect(event.type).assertEqual('UidPolicyChange');
      expect(event.text).assertEqual('uid policy changed to reject metered background');
      expect(event.time).assertEqual('10:00:05');
      expect(event.uid).assertUndefined();
      // The payload uid can be attached afterwards.
      event.uid = 10010042;
      expect(event.uid).assertEqual(10010042);
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_TYPESERR_1500
     * @tc.name      testTypesErr0015
     * @tc.desc      Verify AppInfoItem and AppListView keep item order and expose both success and degraded query states.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTypesErr0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // One installed app without a decoded icon.
      const demo: AppInfoItem = new AppInfoItem(10010042, 'com.example.demo', 'Demo App', undefined);
      expect(demo.uid).assertEqual(10010042);
      expect(demo.bundleName).assertEqual('com.example.demo');
      expect(demo.appName).assertEqual('Demo App');
      expect(demo.icon).assertUndefined();
      // The list view keeps both apps in system order on success.
      const other: AppInfoItem = new AppInfoItem(10010099, 'com.example.other', 'Other App', undefined);
      const listed: AppListView = new AppListView([demo, other], true, '');
      expect(listed.loaded).assertTrue();
      expect(listed.items.length).assertEqual(2);
      expect(listed.items[0].bundleName).assertEqual('com.example.demo');
      expect(listed.items[1].appName).assertEqual('Other App');
      expect(listed.message).assertEqual('');
      // A failed query degrades to an empty list with the plain failure detail.
      const degraded: AppListView = new AppListView([], false, 'getBundleInfoList failed');
      expect(degraded.loaded).assertFalse();
      expect(degraded.items.length).assertEqual(0);
      expect(degraded.message).assertEqual('getBundleInfoList failed');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_TYPESERR_1600
     * @tc.name      testTypesErr0016
     * @tc.desc      Verify AppDetailParam carries the required uid and the optional names only when the caller knows them.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTypesErr0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // A route parameter with every known field.
      const full: AppDetailParam = { uid: 10010042, bundleName: 'com.example.demo', appName: 'Demo App' };
      expect(full.uid).assertEqual(10010042);
      expect(full.bundleName).assertEqual('com.example.demo');
      expect(full.appName).assertEqual('Demo App');
      // A route parameter from an event row that only knows the uid.
      const minimal: AppDetailParam = { uid: 7 };
      expect(minimal.uid).assertEqual(7);
      expect(minimal.bundleName).assertUndefined();
      expect(minimal.appName).assertUndefined();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_TYPESERR_1700
     * @tc.name      testTypesErr0017
     * @tc.desc      Verify backgroundPolicyText maps enable, disable and trustlist kinds to their exact log words.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testTypesErr0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Every real background policy kind has its own exact log word.
      expect(backgroundPolicyText(policy.NetBackgroundPolicy.NET_BACKGROUND_POLICY_ENABLE)).assertEqual('enable');
      expect(backgroundPolicyText(policy.NetBackgroundPolicy.NET_BACKGROUND_POLICY_DISABLE)).assertEqual('disable');
      expect(backgroundPolicyText(policy.NetBackgroundPolicy.NET_BACKGROUND_POLICY_TRUSTLIST)).assertEqual('trustlist');
      // The three words are distinct so each log line tells the states apart.
      expect(backgroundPolicyText(policy.NetBackgroundPolicy.NET_BACKGROUND_POLICY_ENABLE) ===
        backgroundPolicyText(policy.NetBackgroundPolicy.NET_BACKGROUND_POLICY_DISABLE)).assertFalse();
      expect(backgroundPolicyText(policy.NetBackgroundPolicy.NET_BACKGROUND_POLICY_ENABLE) ===
        backgroundPolicyText(policy.NetBackgroundPolicy.NET_BACKGROUND_POLICY_TRUSTLIST)).assertFalse();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_TYPESERR_1800
     * @tc.name      testTypesErr0018
     * @tc.desc      Verify uidPolicyText maps the allow and reject metered background policies to their exact log words.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testTypesErr0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Both uid policy kinds print their exact log word.
      expect(uidPolicyText(policy.NetUidPolicy.NET_POLICY_ALLOW_METERED_BACKGROUND))
        .assertEqual('allow metered background');
      expect(uidPolicyText(policy.NetUidPolicy.NET_POLICY_REJECT_METERED_BACKGROUND))
        .assertEqual('reject metered background');
      // The two words differ so the log tells allow and reject apart.
      expect(uidPolicyText(policy.NetUidPolicy.NET_POLICY_ALLOW_METERED_BACKGROUND) ===
        uidPolicyText(policy.NetUidPolicy.NET_POLICY_REJECT_METERED_BACKGROUND)).assertFalse();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_TYPESERR_1900
     * @tc.name      testTypesErr0019
     * @tc.desc      Verify uidRuleText maps all five uid rule values to their exact and distinct log words.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testTypesErr0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Every real uid rule value prints its own exact log word.
      expect(uidRuleText(policy.NetUidRule.NET_RULE_ALLOW_METERED_FOREGROUND)).assertEqual('allow metered foreground');
      expect(uidRuleText(policy.NetUidRule.NET_RULE_ALLOW_METERED)).assertEqual('allow metered');
      expect(uidRuleText(policy.NetUidRule.NET_RULE_REJECT_METERED)).assertEqual('reject metered');
      expect(uidRuleText(policy.NetUidRule.NET_RULE_ALLOW_ALL)).assertEqual('allow all');
      expect(uidRuleText(policy.NetUidRule.NET_RULE_REJECT_ALL)).assertEqual('reject all');
      // Foreground-only and unrestricted allow rules still print different words.
      expect(uidRuleText(policy.NetUidRule.NET_RULE_ALLOW_METERED_FOREGROUND) ===
        uidRuleText(policy.NetUidRule.NET_RULE_ALLOW_METERED)).assertFalse();
      // The two reject rules stay distinct as well.
      expect(uidRuleText(policy.NetUidRule.NET_RULE_REJECT_METERED) ===
        uidRuleText(policy.NetUidRule.NET_RULE_REJECT_ALL)).assertFalse();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_TYPESERR_2000
     * @tc.name      testTypesErr0020
     * @tc.desc      Verify allowedLabel picks the allowed resource for true and the distinct denied resource for false.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testTypesErr0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Resolve both labels of the allowed flag.
      const allowed: ResourceStr = allowedLabel(true);
      const denied: ResourceStr = allowedLabel(false);
      // The true flag picks the allowed string resource.
      expect(resourceKeyOf(allowed)).assertEqual(resourceKeyOf($r('app.string.ns_common_allowed')));
      // The false flag picks the denied string resource.
      expect(resourceKeyOf(denied)).assertEqual(resourceKeyOf($r('app.string.ns_common_denied')));
      // The two states must resolve to different resources.
      expect(resourceKeyOf(allowed) === resourceKeyOf(denied)).assertFalse();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_TYPESERR_2100
     * @tc.name      testTypesErr0021
     * @tc.desc      Verify backgroundPolicyLabel, uidPolicyLabel and limitActionLabel pick the exact resource per enum value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testTypesErr0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Each background policy kind resolves to its own localized label resource.
      expect(resourceKeyOf(backgroundPolicyLabel(policy.NetBackgroundPolicy.NET_BACKGROUND_POLICY_ENABLE)))
        .assertEqual(resourceKeyOf($r('app.string.ns_pol_bg_enable')));
      expect(resourceKeyOf(backgroundPolicyLabel(policy.NetBackgroundPolicy.NET_BACKGROUND_POLICY_DISABLE)))
        .assertEqual(resourceKeyOf($r('app.string.ns_pol_bg_disable')));
      expect(resourceKeyOf(backgroundPolicyLabel(policy.NetBackgroundPolicy.NET_BACKGROUND_POLICY_TRUSTLIST)))
        .assertEqual(resourceKeyOf($r('app.string.ns_pol_bg_trustlist')));
      // Each uid policy kind resolves to its own label resource and the pair differs.
      expect(resourceKeyOf(uidPolicyLabel(policy.NetUidPolicy.NET_POLICY_ALLOW_METERED_BACKGROUND)))
        .assertEqual(resourceKeyOf($r('app.string.ns_pol_uid_policy_allow')));
      expect(resourceKeyOf(uidPolicyLabel(policy.NetUidPolicy.NET_POLICY_REJECT_METERED_BACKGROUND)))
        .assertEqual(resourceKeyOf($r('app.string.ns_pol_uid_policy_reject')));
      expect(resourceKeyOf(uidPolicyLabel(policy.NetUidPolicy.NET_POLICY_ALLOW_METERED_BACKGROUND)) ===
        resourceKeyOf(uidPolicyLabel(policy.NetUidPolicy.NET_POLICY_REJECT_METERED_BACKGROUND))).assertFalse();
      // Each limit action resolves to its own label resource.
      expect(resourceKeyOf(limitActionLabel(policy.LimitAction.LIMIT_ACTION_ACCESS_DISABLED)))
        .assertEqual(resourceKeyOf($r('app.string.ns_pol_limit_disabled')));
      expect(resourceKeyOf(limitActionLabel(policy.LimitAction.LIMIT_ACTION_ALERT_ONLY)))
        .assertEqual(resourceKeyOf($r('app.string.ns_pol_limit_alert')));
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_TYPESERR_2200
     * @tc.name      testTypesErr0022
     * @tc.desc      Verify isSystemRestricted reports 201 and 202 as restricted and every other business code as not.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testTypesErr0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The exported constants carry the BusinessError codes they stand for.
      expect(ERROR_PERMISSION_DENIED).assertEqual(201);
      expect(ERROR_NOT_SYSTEM_APP).assertEqual(202);
      // Both restriction codes classify as system restricted, also when passed as constants.
      expect(PolicyErrorCodeMap.isSystemRestricted(201)).assertTrue();
      expect(PolicyErrorCodeMap.isSystemRestricted(202)).assertTrue();
      expect(PolicyErrorCodeMap.isSystemRestricted(ERROR_PERMISSION_DENIED)).assertTrue();
      expect(PolicyErrorCodeMap.isSystemRestricted(ERROR_NOT_SYSTEM_APP)).assertTrue();
      // Parameter and service codes are ordinary business failures, not restrictions.
      expect(PolicyErrorCodeMap.isSystemRestricted(401)).assertFalse();
      expect(PolicyErrorCodeMap.isSystemRestricted(2100001)).assertFalse();
      expect(PolicyErrorCodeMap.isSystemRestricted(2100002)).assertFalse();
      // Codes adjacent to 201 and zero stay unrestricted.
      expect(PolicyErrorCodeMap.isSystemRestricted(200)).assertFalse();
      expect(PolicyErrorCodeMap.isSystemRestricted(203)).assertFalse();
      expect(PolicyErrorCodeMap.isSystemRestricted(0)).assertFalse();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_TYPESERR_2300
     * @tc.name      testTypesErr0023
     * @tc.desc      Verify PolicyErrorCodeMap.explain returns the registered severity per code and reuses the cached entry.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testTypesErr0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Permission failures explain with error severity and echo the code.
      const denied: ErrorExplain = PolicyErrorCodeMap.explain(201);
      expect(denied.code).assertEqual(201);
      expect(denied.level).assertEqual('error');
      // Parameter check failures explain with warning severity.
      const parameter: ErrorExplain = PolicyErrorCodeMap.explain(401);
      expect(parameter.code).assertEqual(401);
      expect(parameter.level).assertEqual('warning');
      // Internal service failures explain with error severity again.
      const internal: ErrorExplain = PolicyErrorCodeMap.explain(2100003);
      expect(internal.code).assertEqual(2100003);
      expect(internal.level).assertEqual('error');
      // Known codes resolve from the static table to the same cached entry every time.
      expect(PolicyErrorCodeMap.explain(202) === PolicyErrorCodeMap.explain(202)).assertTrue();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_TYPESERR_2400
     * @tc.name      testTypesErr0024
     * @tc.desc      Verify PolicyErrorCodeMap.explain falls back to a fresh generic entry carrying the unknown code.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTypesErr0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // An unregistered code still gets an explanation carrying the original code.
      const unknown: ErrorExplain = PolicyErrorCodeMap.explain(31415926);
      expect(unknown.code).assertEqual(31415926);
      expect(unknown.level).assertEqual('error');
      // Unknown codes build a new fallback entry on every call instead of caching.
      expect(PolicyErrorCodeMap.explain(31415926) === PolicyErrorCodeMap.explain(31415926)).assertFalse();
      // Registered codes keep the cached-instance behavior for contrast.
      expect(PolicyErrorCodeMap.explain(401) === PolicyErrorCodeMap.explain(401)).assertTrue();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_TYPESERR_2500
     * @tc.name      testTypesErr0025
     * @tc.desc      Verify SecurityErrorCodeMap.explain returns the registered severity for certificate and parameter codes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testTypesErr0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Cleartext blocked stays a warning while expired certificates are errors.
      const cleartext: SecurityErrorExplain = SecurityErrorCodeMap.explain(2300997);
      expect(cleartext.code).assertEqual(2300997);
      expect(cleartext.level).assertEqual('warning');
      const expired: SecurityErrorExplain = SecurityErrorCodeMap.explain(2305010);
      expect(expired.code).assertEqual(2305010);
      expect(expired.level).assertEqual('error');
      // Expired CRL warnings and expired certificate errors stay distinguishable.
      expect(SecurityErrorCodeMap.explain(2305012).level).assertEqual('warning');
      expect(SecurityErrorCodeMap.explain(2305011).level).assertEqual('error');
      // Parameter failures warn and unspecified certificate errors fail hard.
      expect(SecurityErrorCodeMap.explain(401).level).assertEqual('warning');
      expect(SecurityErrorCodeMap.explain(2305001).level).assertEqual('error');
      // Self-signed certificates warn and permission failures error.
      expect(SecurityErrorCodeMap.explain(2305018).level).assertEqual('warning');
      expect(SecurityErrorCodeMap.explain(201).level).assertEqual('error');
      // Known codes resolve from the static table to the same cached entry every time.
      expect(SecurityErrorCodeMap.explain(2305069) === SecurityErrorCodeMap.explain(2305069)).assertTrue();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_TYPESERR_2600
     * @tc.name      testTypesErr0026
     * @tc.desc      Verify SecurityErrorCodeMap.explain falls back to a fresh generic entry carrying the unknown code.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTypesErr0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // An unregistered code still gets an explanation carrying the original code.
      const unknown: SecurityErrorExplain = SecurityErrorCodeMap.explain(987654321);
      expect(unknown.code).assertEqual(987654321);
      expect(unknown.level).assertEqual('error');
      // Unknown codes build a new fallback entry on every call instead of caching.
      expect(SecurityErrorCodeMap.explain(987654321) === SecurityErrorCodeMap.explain(987654321)).assertFalse();
      // Registered codes keep the cached-instance behavior for contrast.
      expect(SecurityErrorCodeMap.explain(2305069) === SecurityErrorCodeMap.explain(2305069)).assertTrue();
      expect(SecurityErrorCodeMap.explain(2305069).code).assertEqual(2305069);
    });
  });
}

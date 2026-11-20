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

import { describe } from '@ohos/hypium';
import { loggedExpect } from '../support/LoggedExpect';
import { BUNDLE, loggedCase as it } from '../support/BoundedCase';
import {
  Backoff, RETRY_RULES, RetryReason, RetryRule, AttemptRecord, RetryTrace, auditRetryRules,
  backoffLabel, defaultRule, delayOf, reasonLabel, reasonLines, ruleIds, ruleLines, ruleOf,
  rulesOf, simulate, totalWait
} from '../../../main/ets/learning/session/RetryPolicy';
import {
  FIELD_DOCS, FieldDoc, FieldRole, FieldUnit, auditDictionary, conflictText, describeValue,
  dictionaryLines, docKeys, docOf, docsOfRole, missingSchemaKeys, requiredDocs, roleLabel,
  roleLines, unitLabel, valueOfKey, visibleDocs
} from '../../../main/ets/learning/payload/FieldDictionary';
import { PayloadData, sealPayload } from '../../../main/ets/learning/payload/PayloadCodec';

function payload(): PayloadData {
  const data: PayloadData = new PayloadData('doc-1', 4);
  data.title = '标题';
  data.body = '正文#标签A#标签B';
  data.cs = 1;
  data.ce = 3;
  data.dev = 'device-a';
  data.at = 1700000000000;
  data.app = '1.0.0';
  data.ck = 'bothChanged';
  return sealPayload(data);
}

export default function retryDictionaryCasesTest(): void {
  describe('RetryPolicyCases', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_RETRYPOLICYCASESB_0100
     * @tc.name      com.samples.appcontinuation_RetryPolicyCasesB_0001
     * @tc.desc      Verify rule table is consistent
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it(BUNDLE + '_RetryPolicyCasesB_0001', 0, (): void => {
      loggedExpect(RETRY_RULES.length, 'RetryDictionaryCases.test.ets:A0001', BUNDLE + '_RetryPolicyCasesB_0001').assertEqual(20);
      loggedExpect(ruleIds().length, 'RetryDictionaryCases.test.ets:A0002', BUNDLE + '_RetryPolicyCasesB_0001').assertEqual(20);
      loggedExpect(ruleLines().length, 'RetryDictionaryCases.test.ets:A0003', BUNDLE + '_RetryPolicyCasesB_0001').assertEqual(20);
      const audit = auditRetryRules();
      loggedExpect(audit.findings.length, 'RetryDictionaryCases.test.ets:A0004', BUNDLE + '_RetryPolicyCasesB_0001').assertEqual(0);
      loggedExpect(audit.ok, 'RetryDictionaryCases.test.ets:A0005', BUNDLE + '_RetryPolicyCasesB_0001').assertTrue();
      loggedExpect(audit.summary(), 'RetryDictionaryCases.test.ets:A0006', BUNDLE + '_RetryPolicyCasesB_0001').assertEqual('重试规则表自洽');
      RETRY_RULES.forEach((rule): void => {
        loggedExpect(rule.description.length > 0, 'RetryDictionaryCases.test.ets:A0007', BUNDLE + '_RetryPolicyCasesB_0001').assertTrue();
        loggedExpect(rule.maxAttempts >= 1, 'RetryDictionaryCases.test.ets:A0008', BUNDLE + '_RetryPolicyCasesB_0001').assertTrue();
        loggedExpect(rule.text().indexOf(rule.ruleId) === 0, 'RetryDictionaryCases.test.ets:A0009', BUNDLE + '_RetryPolicyCasesB_0001').assertTrue();
      });
      loggedExpect(ruleOf('RR-99'), 'RetryDictionaryCases.test.ets:A0010', BUNDLE + '_RetryPolicyCasesB_0001').assertEqual(undefined);
      loggedExpect(reasonLines().length, 'RetryDictionaryCases.test.ets:A0011', BUNDLE + '_RetryPolicyCasesB_0001').assertEqual(8);
    });

    /**
     * @tc.number    SUB_CONTINUATION_RETRYPOLICYCASESB_0200
     * @tc.name      com.samples.appcontinuation_RetryPolicyCasesB_0002
     * @tc.desc      Verify reason distribution covers all reasons
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_RetryPolicyCasesB_0002', 0, (): void => {
      loggedExpect(rulesOf(RetryReason.NETWORK).length, 'RetryDictionaryCases.test.ets:A0012', BUNDLE + '_RetryPolicyCasesB_0002').assertEqual(3);
      loggedExpect(rulesOf(RetryReason.TIMEOUT).length, 'RetryDictionaryCases.test.ets:A0013', BUNDLE + '_RetryPolicyCasesB_0002').assertEqual(3);
      loggedExpect(rulesOf(RetryReason.PERMISSION).length, 'RetryDictionaryCases.test.ets:A0014', BUNDLE + '_RetryPolicyCasesB_0002').assertEqual(2);
      loggedExpect(rulesOf(RetryReason.VERSION).length, 'RetryDictionaryCases.test.ets:A0015', BUNDLE + '_RetryPolicyCasesB_0002').assertEqual(2);
      loggedExpect(rulesOf(RetryReason.DEVICE_BUSY).length, 'RetryDictionaryCases.test.ets:A0016', BUNDLE + '_RetryPolicyCasesB_0002').assertEqual(3);
      loggedExpect(rulesOf(RetryReason.STORAGE).length, 'RetryDictionaryCases.test.ets:A0017', BUNDLE + '_RetryPolicyCasesB_0002').assertEqual(3);
      loggedExpect(rulesOf(RetryReason.PAYLOAD).length, 'RetryDictionaryCases.test.ets:A0018', BUNDLE + '_RetryPolicyCasesB_0002').assertEqual(2);
      loggedExpect(rulesOf(RetryReason.UNKNOWN).length, 'RetryDictionaryCases.test.ets:A0019', BUNDLE + '_RetryPolicyCasesB_0002').assertEqual(2);
      loggedExpect(reasonLabel(RetryReason.DEVICE_BUSY), 'RetryDictionaryCases.test.ets:A0020', BUNDLE + '_RetryPolicyCasesB_0002').assertEqual('设备繁忙');
      loggedExpect(backoffLabel(Backoff.EXPONENTIAL), 'RetryDictionaryCases.test.ets:A0021', BUNDLE + '_RetryPolicyCasesB_0002').assertEqual('指数退避');
      loggedExpect(defaultRule(RetryReason.NETWORK).ruleId, 'RetryDictionaryCases.test.ets:A0022', BUNDLE + '_RetryPolicyCasesB_0002').assertEqual('RR-01');
      loggedExpect(defaultRule(RetryReason.PAYLOAD).ruleId, 'RetryDictionaryCases.test.ets:A0023', BUNDLE + '_RetryPolicyCasesB_0002').assertEqual('RR-11');
    });

    /**
     * @tc.number    SUB_CONTINUATION_RETRYPOLICYCASESB_0300
     * @tc.name      com.samples.appcontinuation_RetryPolicyCasesB_0003
     * @tc.desc      Verify backoff delays follow strategy
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_RetryPolicyCasesB_0003', 0, (): void => {
      const network: RetryRule = defaultRule(RetryReason.NETWORK);
      loggedExpect(network.backoff, 'RetryDictionaryCases.test.ets:A0024', BUNDLE + '_RetryPolicyCasesB_0003').assertEqual(Backoff.EXPONENTIAL);
      loggedExpect(delayOf(network, 1), 'RetryDictionaryCases.test.ets:A0025', BUNDLE + '_RetryPolicyCasesB_0003').assertEqual(200);
      loggedExpect(delayOf(network, 2), 'RetryDictionaryCases.test.ets:A0026', BUNDLE + '_RetryPolicyCasesB_0003').assertEqual(400);
      loggedExpect(delayOf(network, 3), 'RetryDictionaryCases.test.ets:A0027', BUNDLE + '_RetryPolicyCasesB_0003').assertEqual(800);
      loggedExpect(delayOf(network, 4), 'RetryDictionaryCases.test.ets:A0028', BUNDLE + '_RetryPolicyCasesB_0003').assertEqual(0);
      loggedExpect(delayOf(network, 0), 'RetryDictionaryCases.test.ets:A0029', BUNDLE + '_RetryPolicyCasesB_0003').assertEqual(0);
      loggedExpect(totalWait(network), 'RetryDictionaryCases.test.ets:A0030', BUNDLE + '_RetryPolicyCasesB_0003').assertEqual(1400);
      const timeout: RetryRule = ruleOf('RR-03') === undefined ?
        defaultRule(RetryReason.TIMEOUT) : ruleOf('RR-03') as RetryRule;
      loggedExpect(delayOf(timeout, 1), 'RetryDictionaryCases.test.ets:A0031', BUNDLE + '_RetryPolicyCasesB_0003').assertEqual(300);
      loggedExpect(delayOf(timeout, 2), 'RetryDictionaryCases.test.ets:A0032', BUNDLE + '_RetryPolicyCasesB_0003').assertEqual(600);
      loggedExpect(delayOf(timeout, 3), 'RetryDictionaryCases.test.ets:A0033', BUNDLE + '_RetryPolicyCasesB_0003').assertEqual(0);
      loggedExpect(totalWait(timeout), 'RetryDictionaryCases.test.ets:A0034', BUNDLE + '_RetryPolicyCasesB_0003').assertEqual(900);
      const busy: RetryRule = ruleOf('RR-07') === undefined ?
        defaultRule(RetryReason.DEVICE_BUSY) : ruleOf('RR-07') as RetryRule;
      loggedExpect(delayOf(busy, 1), 'RetryDictionaryCases.test.ets:A0035', BUNDLE + '_RetryPolicyCasesB_0003').assertEqual(800);
      loggedExpect(delayOf(busy, 2), 'RetryDictionaryCases.test.ets:A0036', BUNDLE + '_RetryPolicyCasesB_0003').assertEqual(800);
      loggedExpect(totalWait(busy), 'RetryDictionaryCases.test.ets:A0037', BUNDLE + '_RetryPolicyCasesB_0003').assertEqual(1600);
    });

    /**
     * @tc.number    SUB_CONTINUATION_RETRYPOLICYCASESB_0400
     * @tc.name      com.samples.appcontinuation_RetryPolicyCasesB_0004
     * @tc.desc      Verify non retryable rules never delay
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_RetryPolicyCasesB_0004', 0, (): void => {
      const permission: RetryRule = ruleOf('RR-05') === undefined ?
        defaultRule(RetryReason.PERMISSION) : ruleOf('RR-05') as RetryRule;
      loggedExpect(permission.retryable(), 'RetryDictionaryCases.test.ets:A0038', BUNDLE + '_RetryPolicyCasesB_0004').assertFalse();
      loggedExpect(permission.requiresAction, 'RetryDictionaryCases.test.ets:A0039', BUNDLE + '_RetryPolicyCasesB_0004').assertTrue();
      loggedExpect(delayOf(permission, 1), 'RetryDictionaryCases.test.ets:A0040', BUNDLE + '_RetryPolicyCasesB_0004').assertEqual(0);
      loggedExpect(totalWait(permission), 'RetryDictionaryCases.test.ets:A0041', BUNDLE + '_RetryPolicyCasesB_0004').assertEqual(0);
      const version: RetryRule = ruleOf('RR-06') === undefined ?
        defaultRule(RetryReason.VERSION) : ruleOf('RR-06') as RetryRule;
      loggedExpect(version.retryable(), 'RetryDictionaryCases.test.ets:A0042', BUNDLE + '_RetryPolicyCasesB_0004').assertFalse();
      loggedExpect(version.requiresAction, 'RetryDictionaryCases.test.ets:A0043', BUNDLE + '_RetryPolicyCasesB_0004').assertTrue();
      loggedExpect(ruleOf('RR-01')?.retryable(), 'RetryDictionaryCases.test.ets:A0044', BUNDLE + '_RetryPolicyCasesB_0004').assertTrue();
      loggedExpect(ruleOf('RR-01')?.requiresAction, 'RetryDictionaryCases.test.ets:A0045', BUNDLE + '_RetryPolicyCasesB_0004').assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_RETRYPOLICYCASESB_0500
     * @tc.name      com.samples.appcontinuation_RetryPolicyCasesB_0005
     * @tc.desc      Verify simulation stops on success
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_RetryPolicyCasesB_0005', 0, (): void => {
      const network: RetryRule = defaultRule(RetryReason.NETWORK);
      const trace: RetryTrace = simulate(network, 3);
      loggedExpect(trace.attempts(), 'RetryDictionaryCases.test.ets:A0046', BUNDLE + '_RetryPolicyCasesB_0005').assertEqual(3);
      loggedExpect(trace.succeeded(), 'RetryDictionaryCases.test.ets:A0047', BUNDLE + '_RetryPolicyCasesB_0005').assertTrue();
      loggedExpect(trace.exhausted(), 'RetryDictionaryCases.test.ets:A0048', BUNDLE + '_RetryPolicyCasesB_0005').assertFalse();
      loggedExpect(trace.waited(), 'RetryDictionaryCases.test.ets:A0049', BUNDLE + '_RetryPolicyCasesB_0005').assertEqual(600);
      loggedExpect(trace.lines().length, 'RetryDictionaryCases.test.ets:A0050', BUNDLE + '_RetryPolicyCasesB_0005').assertEqual(3);
      loggedExpect(trace.lines()[0].indexOf('第 1 次') === 0, 'RetryDictionaryCases.test.ets:A0051', BUNDLE + '_RetryPolicyCasesB_0005').assertTrue();
      loggedExpect(trace.text().indexOf('已成功') > 0, 'RetryDictionaryCases.test.ets:A0052', BUNDLE + '_RetryPolicyCasesB_0005').assertTrue();
      const failing: RetryTrace = simulate(network, 99);
      loggedExpect(failing.attempts(), 'RetryDictionaryCases.test.ets:A0053', BUNDLE + '_RetryPolicyCasesB_0005').assertEqual(4);
      loggedExpect(failing.succeeded(), 'RetryDictionaryCases.test.ets:A0054', BUNDLE + '_RetryPolicyCasesB_0005').assertFalse();
      loggedExpect(failing.exhausted(), 'RetryDictionaryCases.test.ets:A0055', BUNDLE + '_RetryPolicyCasesB_0005').assertTrue();
      loggedExpect(failing.waited(), 'RetryDictionaryCases.test.ets:A0056', BUNDLE + '_RetryPolicyCasesB_0005').assertEqual(1400);
      const stop: RetryTrace = simulate(defaultRule(RetryReason.PERMISSION), 99);
      loggedExpect(stop.attempts(), 'RetryDictionaryCases.test.ets:A0057', BUNDLE + '_RetryPolicyCasesB_0005').assertEqual(1);
      loggedExpect(stop.exhausted(), 'RetryDictionaryCases.test.ets:A0058', BUNDLE + '_RetryPolicyCasesB_0005').assertTrue();
      const record: AttemptRecord = new AttemptRecord(1, RetryReason.TIMEOUT, 0, false);
      loggedExpect(record.text().indexOf('第 1 次') === 0, 'RetryDictionaryCases.test.ets:A0059', BUNDLE + '_RetryPolicyCasesB_0005').assertTrue();
      loggedExpect(record.text().indexOf('失败') > 0, 'RetryDictionaryCases.test.ets:A0060', BUNDLE + '_RetryPolicyCasesB_0005').assertTrue();
    });
  });

  describe('FieldDictionaryCases', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_FIELDDICTIONARYCASES_0100
     * @tc.name      com.samples.appcontinuation_FieldDictionaryCases_0001
     * @tc.desc      Verify dictionary covers schema
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_FieldDictionaryCases_0001', 0, (): void => {
      loggedExpect(FIELD_DOCS.length, 'RetryDictionaryCases.test.ets:A0061', BUNDLE + '_FieldDictionaryCases_0001').assertEqual(20);
      loggedExpect(docKeys().length, 'RetryDictionaryCases.test.ets:A0062', BUNDLE + '_FieldDictionaryCases_0001').assertEqual(20);
      loggedExpect(dictionaryLines().length, 'RetryDictionaryCases.test.ets:A0063', BUNDLE + '_FieldDictionaryCases_0001').assertEqual(20);
      loggedExpect(missingSchemaKeys().length, 'RetryDictionaryCases.test.ets:A0064', BUNDLE + '_FieldDictionaryCases_0001').assertEqual(0);
      const audit = auditDictionary();
      loggedExpect(audit.findings.length, 'RetryDictionaryCases.test.ets:A0065', BUNDLE + '_FieldDictionaryCases_0001').assertEqual(0);
      loggedExpect(audit.ok, 'RetryDictionaryCases.test.ets:A0066', BUNDLE + '_FieldDictionaryCases_0001').assertTrue();
      loggedExpect(audit.summary(), 'RetryDictionaryCases.test.ets:A0067', BUNDLE + '_FieldDictionaryCases_0001').assertEqual('字段字典自洽');
      FIELD_DOCS.forEach((doc: FieldDoc): void => {
        loggedExpect(doc.label.length > 0, 'RetryDictionaryCases.test.ets:A0068', BUNDLE + '_FieldDictionaryCases_0001').assertTrue();
        loggedExpect(doc.maxLength >= 0, 'RetryDictionaryCases.test.ets:A0069', BUNDLE + '_FieldDictionaryCases_0001').assertTrue();
        loggedExpect(doc.text().indexOf(doc.key) === 0, 'RetryDictionaryCases.test.ets:A0070', BUNDLE + '_FieldDictionaryCases_0001').assertTrue();
      });
      loggedExpect(docOf('missing'), 'RetryDictionaryCases.test.ets:A0071', BUNDLE + '_FieldDictionaryCases_0001').assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_CONTINUATION_FIELDDICTIONARYCASES_0200
     * @tc.name      com.samples.appcontinuation_FieldDictionaryCases_0002
     * @tc.desc      Verify role and visibility distribution
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_FieldDictionaryCases_0002', 0, (): void => {
      loggedExpect(docsOfRole(FieldRole.IDENTITY).length, 'RetryDictionaryCases.test.ets:A0072', BUNDLE + '_FieldDictionaryCases_0002').assertEqual(3);
      loggedExpect(docsOfRole(FieldRole.CONTENT).length, 'RetryDictionaryCases.test.ets:A0073', BUNDLE + '_FieldDictionaryCases_0002').assertEqual(2);
      loggedExpect(docsOfRole(FieldRole.POSITION).length, 'RetryDictionaryCases.test.ets:A0074', BUNDLE + '_FieldDictionaryCases_0002').assertEqual(2);
      loggedExpect(docsOfRole(FieldRole.CONTEXT).length, 'RetryDictionaryCases.test.ets:A0075', BUNDLE + '_FieldDictionaryCases_0002').assertEqual(3);
      loggedExpect(docsOfRole(FieldRole.INTEGRITY).length, 'RetryDictionaryCases.test.ets:A0076', BUNDLE + '_FieldDictionaryCases_0002').assertEqual(2);
      loggedExpect(docsOfRole(FieldRole.DERIVED).length, 'RetryDictionaryCases.test.ets:A0077', BUNDLE + '_FieldDictionaryCases_0002').assertEqual(8);
      loggedExpect(requiredDocs().length, 'RetryDictionaryCases.test.ets:A0078', BUNDLE + '_FieldDictionaryCases_0002').assertEqual(3);
      loggedExpect(visibleDocs().length, 'RetryDictionaryCases.test.ets:A0079', BUNDLE + '_FieldDictionaryCases_0002').assertEqual(18);
      loggedExpect(roleLines().length, 'RetryDictionaryCases.test.ets:A0080', BUNDLE + '_FieldDictionaryCases_0002').assertEqual(6);
      loggedExpect(roleLabel(FieldRole.INTEGRITY), 'RetryDictionaryCases.test.ets:A0081', BUNDLE + '_FieldDictionaryCases_0002').assertEqual('完整性');
      loggedExpect(unitLabel(FieldUnit.CHARS), 'RetryDictionaryCases.test.ets:A0082', BUNDLE + '_FieldDictionaryCases_0002').assertEqual('字符');
      loggedExpect(unitLabel(FieldUnit.MILLIS), 'RetryDictionaryCases.test.ets:A0083', BUNDLE + '_FieldDictionaryCases_0002').assertEqual('毫秒');
    });

    /**
     * @tc.number    SUB_CONTINUATION_FIELDDICTIONARYCASES_0300
     * @tc.name      com.samples.appcontinuation_FieldDictionaryCases_0003
     * @tc.desc      Verify direct fields read from payload
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_FieldDictionaryCases_0003', 0, (): void => {
      const data: PayloadData = payload();
      loggedExpect(valueOfKey(data, 'doc'), 'RetryDictionaryCases.test.ets:A0084', BUNDLE + '_FieldDictionaryCases_0003').assertEqual('doc-1');
      loggedExpect(valueOfKey(data, 'rev'), 'RetryDictionaryCases.test.ets:A0085', BUNDLE + '_FieldDictionaryCases_0003').assertEqual('4');
      loggedExpect(valueOfKey(data, 'title'), 'RetryDictionaryCases.test.ets:A0086', BUNDLE + '_FieldDictionaryCases_0003').assertEqual('标题');
      loggedExpect(valueOfKey(data, 'cs'), 'RetryDictionaryCases.test.ets:A0087', BUNDLE + '_FieldDictionaryCases_0003').assertEqual('1');
      loggedExpect(valueOfKey(data, 'ce'), 'RetryDictionaryCases.test.ets:A0088', BUNDLE + '_FieldDictionaryCases_0003').assertEqual('3');
      loggedExpect(valueOfKey(data, 'dev'), 'RetryDictionaryCases.test.ets:A0089', BUNDLE + '_FieldDictionaryCases_0003').assertEqual('device-a');
      loggedExpect(valueOfKey(data, 'at'), 'RetryDictionaryCases.test.ets:A0090', BUNDLE + '_FieldDictionaryCases_0003').assertEqual('1700000000000');
      loggedExpect(valueOfKey(data, 'ck'), 'RetryDictionaryCases.test.ets:A0091', BUNDLE + '_FieldDictionaryCases_0003').assertEqual('bothChanged');
      loggedExpect(valueOfKey(data, 'app'), 'RetryDictionaryCases.test.ets:A0092', BUNDLE + '_FieldDictionaryCases_0003').assertEqual('1.0.0');
      loggedExpect(valueOfKey(data, 'v'), 'RetryDictionaryCases.test.ets:A0093', BUNDLE + '_FieldDictionaryCases_0003').assertEqual('3');
      loggedExpect(valueOfKey(data, 'unknown'), 'RetryDictionaryCases.test.ets:A0094', BUNDLE + '_FieldDictionaryCases_0003').assertEqual('');
      const empty: PayloadData = new PayloadData('d', 1);
      loggedExpect(valueOfKey(empty, 'at'), 'RetryDictionaryCases.test.ets:A0095', BUNDLE + '_FieldDictionaryCases_0003').assertEqual('未记录时间');
    });

    /**
     * @tc.number    SUB_CONTINUATION_FIELDDICTIONARYCASES_0400
     * @tc.name      com.samples.appcontinuation_FieldDictionaryCases_0004
     * @tc.desc      Verify derived fields are computed
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_FieldDictionaryCases_0004', 0, (): void => {
      const data: PayloadData = payload();
      loggedExpect(valueOfKey(data, 'bodyLength'), 'RetryDictionaryCases.test.ets:A0096', BUNDLE + '_FieldDictionaryCases_0004').assertEqual(data.body.length.toString());
      loggedExpect(valueOfKey(data, 'selectionLength'), 'RetryDictionaryCases.test.ets:A0097', BUNDLE + '_FieldDictionaryCases_0004').assertEqual('2');
      loggedExpect(valueOfKey(data, 'payloadSize'), 'RetryDictionaryCases.test.ets:A0098', BUNDLE + '_FieldDictionaryCases_0004')
        .assertEqual((data.body.length + data.title.length).toString());
      loggedExpect(valueOfKey(data, 'conflictText'), 'RetryDictionaryCases.test.ets:A0099', BUNDLE + '_FieldDictionaryCases_0004').assertEqual('两端都改过');
      loggedExpect(valueOfKey(data, 'tagCount'), 'RetryDictionaryCases.test.ets:A0100', BUNDLE + '_FieldDictionaryCases_0004').assertEqual('2');
      loggedExpect(valueOfKey(data, 'revisionGap'), 'RetryDictionaryCases.test.ets:A0101', BUNDLE + '_FieldDictionaryCases_0004').assertEqual('0');
      const noCk: PayloadData = new PayloadData('d', 1);
      loggedExpect(valueOfKey(noCk, 'conflictText'), 'RetryDictionaryCases.test.ets:A0102', BUNDLE + '_FieldDictionaryCases_0004').assertEqual('无冲突');
      loggedExpect(valueOfKey(noCk, 'tagCount'), 'RetryDictionaryCases.test.ets:A0103', BUNDLE + '_FieldDictionaryCases_0004').assertEqual('0');
      loggedExpect(conflictText('remoteNewer'), 'RetryDictionaryCases.test.ets:A0104', BUNDLE + '_FieldDictionaryCases_0004').assertEqual('对端更新');
      loggedExpect(conflictText('localNewer'), 'RetryDictionaryCases.test.ets:A0105', BUNDLE + '_FieldDictionaryCases_0004').assertEqual('本机更新');
      loggedExpect(conflictText('weird'), 'RetryDictionaryCases.test.ets:A0106', BUNDLE + '_FieldDictionaryCases_0004').assertEqual('无法判断');
    });

    /**
     * @tc.number    SUB_CONTINUATION_FIELDDICTIONARYCASES_0500
     * @tc.name      com.samples.appcontinuation_FieldDictionaryCases_0005
     * @tc.desc      Verify describe value produces text
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it(BUNDLE + '_FieldDictionaryCases_0005', 0, (): void => {
      const data: PayloadData = payload();
      loggedExpect(describeValue(data, 'title').indexOf('标题：') === 0, 'RetryDictionaryCases.test.ets:A0107', BUNDLE + '_FieldDictionaryCases_0005').assertTrue();
      loggedExpect(describeValue(data, 'missing'), 'RetryDictionaryCases.test.ets:A0108', BUNDLE + '_FieldDictionaryCases_0005').assertEqual('missing：未定义字段');
      const empty: PayloadData = new PayloadData('d', 1);
      loggedExpect(describeValue(empty, 'title'), 'RetryDictionaryCases.test.ets:A0109', BUNDLE + '_FieldDictionaryCases_0005').assertEqual('标题：（空）');
      loggedExpect(describeValue(data, 'bodyLength').indexOf('字符') > 0, 'RetryDictionaryCases.test.ets:A0110', BUNDLE + '_FieldDictionaryCases_0005').assertTrue();
      loggedExpect(describeValue(data, 'cs').indexOf('个') > 0, 'RetryDictionaryCases.test.ets:A0111', BUNDLE + '_FieldDictionaryCases_0005').assertTrue();
    });
  });
}

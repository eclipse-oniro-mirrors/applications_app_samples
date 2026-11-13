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
  BODY_LIMIT, PAIR_SEPARATOR, PAYLOAD_FIELDS, PAYLOAD_LIMIT, PAYLOAD_MIGRATIONS, PAYLOAD_VERSION,
  PayloadKind, auditPayloadSchema, escapeValue, fieldNames, fieldOf, fieldsAt, migrationChain,
  schemaVersionLines, unescapeValue
} from '../../../main/ets/learning/payload/PayloadSchema';
import {
  PayloadData, decodePayload, diffPayloads, digestOf, encodePayload, fitWithinLimit,
  matchesDigest, sealPayload, sizeOf, utf8Length
} from '../../../main/ets/learning/payload/PayloadCodec';
import {
  CONFLICT_RULES, ConflictDecision, ConflictInput, ConflictKind, Resolution, applyResolution,
  auditConflictRules, classify, conflictLabel, conflictRuleLines, decide, losesContent,
  needsConfirmation, resolutionLabel
} from '../../../main/ets/learning/payload/ConflictPolicy';
import {
  DeviceClass, READINESS_RULES, Readiness, RuleContext, auditReadinessRules, canStart,
  deviceClassOf, evaluateReadiness, isUnsupportedReadiness, needsUserAction, readinessLabel,
  readinessRuleLines, readinessSeries
} from '../../../main/ets/learning/rules/ContinuationRules';

function mk(doc: string, rev: number): PayloadData {
  const data: PayloadData = new PayloadData(doc, rev);
  data.title = `记录-${rev}`;
  data.body = '第一行\n第二行';
  data.cs = 1;
  data.ce = 4;
  data.dev = 'unit-test';
  data.at = 1700000000000;
  data.app = '1.0.0';
  return data;
}

export default function payloadMatrixTest(): void {
  describe('PayloadSchemaMatrix', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADSCHEMAMATRIX_0100
     * @tc.name      com.samples.appcontinuation_PayloadSchemaMatrix_0001
     * @tc.desc      Verify catalog is complete
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it(BUNDLE + '_PayloadSchemaMatrix_0001', 0, (): void => {
      loggedExpect(PAYLOAD_FIELDS.length, 'PayloadMatrix.test.ets:A0001', BUNDLE + '_PayloadSchemaMatrix_0001').assertEqual(12);
      loggedExpect(fieldNames().length, 'PayloadMatrix.test.ets:A0002', BUNDLE + '_PayloadSchemaMatrix_0001').assertEqual(12);
      loggedExpect(PAYLOAD_VERSION, 'PayloadMatrix.test.ets:A0003', BUNDLE + '_PayloadSchemaMatrix_0001').assertEqual(3);
      loggedExpect(PAYLOAD_MIGRATIONS.length, 'PayloadMatrix.test.ets:A0004', BUNDLE + '_PayloadSchemaMatrix_0001').assertEqual(2);
      const audit = auditPayloadSchema();
      loggedExpect(audit.ok, 'PayloadMatrix.test.ets:A0005', BUNDLE + '_PayloadSchemaMatrix_0001').assertTrue();
      loggedExpect(audit.findings.length, 'PayloadMatrix.test.ets:A0006', BUNDLE + '_PayloadSchemaMatrix_0001').assertEqual(0);
      loggedExpect(audit.summary(), 'PayloadMatrix.test.ets:A0007', BUNDLE + '_PayloadSchemaMatrix_0001').assertEqual('载荷字段目录自洽');
      PAYLOAD_FIELDS.forEach((field): void => {
        loggedExpect(field.name.length > 0, 'PayloadMatrix.test.ets:A0008', BUNDLE + '_PayloadSchemaMatrix_0001').assertTrue();
        loggedExpect(field.label.length > 0, 'PayloadMatrix.test.ets:A0009', BUNDLE + '_PayloadSchemaMatrix_0001').assertTrue();
        loggedExpect(field.since >= 1 && field.since <= PAYLOAD_VERSION, 'PayloadMatrix.test.ets:A0010', BUNDLE + '_PayloadSchemaMatrix_0001').assertTrue();
        loggedExpect(field.describe().indexOf(field.name) === 0, 'PayloadMatrix.test.ets:A0011', BUNDLE + '_PayloadSchemaMatrix_0001').assertTrue();
        loggedExpect(field.existsIn(PAYLOAD_VERSION), 'PayloadMatrix.test.ets:A0012', BUNDLE + '_PayloadSchemaMatrix_0001').assertTrue();
      });
      loggedExpect(fieldOf('body')?.kind, 'PayloadMatrix.test.ets:A0013', BUNDLE + '_PayloadSchemaMatrix_0001').assertEqual(PayloadKind.MULTILINE);
      loggedExpect(fieldOf('missing'), 'PayloadMatrix.test.ets:A0014', BUNDLE + '_PayloadSchemaMatrix_0001').assertEqual(undefined);
      loggedExpect(fieldsAt(1).length, 'PayloadMatrix.test.ets:A0015', BUNDLE + '_PayloadSchemaMatrix_0001').assertEqual(5);
      loggedExpect(fieldsAt(2).length, 'PayloadMatrix.test.ets:A0016', BUNDLE + '_PayloadSchemaMatrix_0001').assertEqual(9);
      loggedExpect(fieldsAt(3).length, 'PayloadMatrix.test.ets:A0017', BUNDLE + '_PayloadSchemaMatrix_0001').assertEqual(12);
      loggedExpect(schemaVersionLines().length, 'PayloadMatrix.test.ets:A0018', BUNDLE + '_PayloadSchemaMatrix_0001').assertEqual(3);
    });

    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADSCHEMAMATRIX_0200
     * @tc.name      com.samples.appcontinuation_PayloadSchemaMatrix_0002
     * @tc.desc      Verify escape round trip
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_PayloadSchemaMatrix_0002', 0, (): void => {
      const samples: string[] = ['a&b=c', '100%', '多行\n内容', '制表\t符', '普通文本', ''];
      samples.forEach((sample: string): void => {
        loggedExpect(unescapeValue(escapeValue(sample)), 'PayloadMatrix.test.ets:A0019', BUNDLE + '_PayloadSchemaMatrix_0002').assertEqual(sample);
      });
      loggedExpect(escapeValue('a&b'), 'PayloadMatrix.test.ets:A0020', BUNDLE + '_PayloadSchemaMatrix_0002').assertEqual('a%26b');
      loggedExpect(escapeValue('a=b'), 'PayloadMatrix.test.ets:A0021', BUNDLE + '_PayloadSchemaMatrix_0002').assertEqual('a%3Db');
      loggedExpect(escapeValue('100%'), 'PayloadMatrix.test.ets:A0022', BUNDLE + '_PayloadSchemaMatrix_0002').assertEqual('100%25');
      loggedExpect(escapeValue('\n'), 'PayloadMatrix.test.ets:A0023', BUNDLE + '_PayloadSchemaMatrix_0002').assertEqual('%0A');
      loggedExpect(unescapeValue('%26'), 'PayloadMatrix.test.ets:A0024', BUNDLE + '_PayloadSchemaMatrix_0002').assertEqual('&');
      loggedExpect(PAIR_SEPARATOR, 'PayloadMatrix.test.ets:A0025', BUNDLE + '_PayloadSchemaMatrix_0002').assertEqual('&');
    });

    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADSCHEMAMATRIX_0300
     * @tc.name      com.samples.appcontinuation_PayloadSchemaMatrix_0003
     * @tc.desc      Verify migration chain covers versions
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_PayloadSchemaMatrix_0003', 0, (): void => {
      loggedExpect(migrationChain(3).length, 'PayloadMatrix.test.ets:A0026', BUNDLE + '_PayloadSchemaMatrix_0003').assertEqual(0);
      loggedExpect(migrationChain(1).length, 'PayloadMatrix.test.ets:A0027', BUNDLE + '_PayloadSchemaMatrix_0003').assertEqual(2);
      loggedExpect(migrationChain(2).length, 'PayloadMatrix.test.ets:A0028', BUNDLE + '_PayloadSchemaMatrix_0003').assertEqual(1);
      loggedExpect(migrationChain(0).length, 'PayloadMatrix.test.ets:A0029', BUNDLE + '_PayloadSchemaMatrix_0003').assertEqual(0);
      migrationChain(1).forEach((step): void => {
        loggedExpect(step.to === step.from + 1, 'PayloadMatrix.test.ets:A0030', BUNDLE + '_PayloadSchemaMatrix_0003').assertTrue();
        loggedExpect(step.text().indexOf('->') > 0, 'PayloadMatrix.test.ets:A0031', BUNDLE + '_PayloadSchemaMatrix_0003').assertTrue();
      });
      loggedExpect(BODY_LIMIT, 'PayloadMatrix.test.ets:A0032', BUNDLE + '_PayloadSchemaMatrix_0003').assertEqual(4096);
      loggedExpect(PAYLOAD_LIMIT, 'PayloadMatrix.test.ets:A0033', BUNDLE + '_PayloadSchemaMatrix_0003').assertEqual(8192);
    });
  });

  describe('PayloadCodecMatrix', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADCODECMATRIX_0100
     * @tc.name      com.samples.appcontinuation_PayloadCodecMatrix_0001
     * @tc.desc      Verify encode decode round trip
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_PayloadCodecMatrix_0001', 0, (): void => {
      const data: PayloadData = mk('doc-1', 2);
      const encoded: string = encodePayload(data);
      loggedExpect(encoded.indexOf('v=3') === 0, 'PayloadMatrix.test.ets:A0034', BUNDLE + '_PayloadCodecMatrix_0001').assertTrue();
      loggedExpect(encoded.indexOf('&doc=doc-1') > 0, 'PayloadMatrix.test.ets:A0035', BUNDLE + '_PayloadCodecMatrix_0001').assertTrue();
      const decoded = decodePayload(encoded);
      loggedExpect(decoded.ok(), 'PayloadMatrix.test.ets:A0036', BUNDLE + '_PayloadCodecMatrix_0001').assertTrue();
      loggedExpect(decoded.version, 'PayloadMatrix.test.ets:A0037', BUNDLE + '_PayloadCodecMatrix_0001').assertEqual(PAYLOAD_VERSION);
      loggedExpect(decoded.migrated, 'PayloadMatrix.test.ets:A0038', BUNDLE + '_PayloadCodecMatrix_0001').assertFalse();
      loggedExpect(decoded.issues.length, 'PayloadMatrix.test.ets:A0039', BUNDLE + '_PayloadCodecMatrix_0001').assertEqual(0);
      loggedExpect(decoded.data?.doc, 'PayloadMatrix.test.ets:A0040', BUNDLE + '_PayloadCodecMatrix_0001').assertEqual('doc-1');
      loggedExpect(decoded.data?.rev, 'PayloadMatrix.test.ets:A0041', BUNDLE + '_PayloadCodecMatrix_0001').assertEqual(2);
      loggedExpect(decoded.data?.title, 'PayloadMatrix.test.ets:A0042', BUNDLE + '_PayloadCodecMatrix_0001').assertEqual('记录-2');
      loggedExpect(decoded.data?.body, 'PayloadMatrix.test.ets:A0043', BUNDLE + '_PayloadCodecMatrix_0001').assertEqual('第一行\n第二行');
      loggedExpect(decoded.data?.cs, 'PayloadMatrix.test.ets:A0044', BUNDLE + '_PayloadCodecMatrix_0001').assertEqual(1);
      loggedExpect(decoded.data?.ce, 'PayloadMatrix.test.ets:A0045', BUNDLE + '_PayloadCodecMatrix_0001').assertEqual(4);
      loggedExpect(decoded.data?.dev, 'PayloadMatrix.test.ets:A0046', BUNDLE + '_PayloadCodecMatrix_0001').assertEqual('unit-test');
      const decodedSummary: string = decoded.data === undefined ? '' : decoded.data.summary();
      loggedExpect(decodedSummary.indexOf('rev 2') > 0, 'PayloadMatrix.test.ets:A0047', BUNDLE + '_PayloadCodecMatrix_0001').assertTrue();
      loggedExpect(decoded.data?.selectionValid(), 'PayloadMatrix.test.ets:A0048', BUNDLE + '_PayloadCodecMatrix_0001').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADCODECMATRIX_0200
     * @tc.name      com.samples.appcontinuation_PayloadCodecMatrix_0002
     * @tc.desc      Verify decode rejects invalid input
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_PayloadCodecMatrix_0002', 0, (): void => {
      loggedExpect(decodePayload('').ok(), 'PayloadMatrix.test.ets:A0049', BUNDLE + '_PayloadCodecMatrix_0002').assertFalse();
      loggedExpect(decodePayload('').issues.length, 'PayloadMatrix.test.ets:A0050', BUNDLE + '_PayloadCodecMatrix_0002').assertEqual(1);
      const oversize: string = `v=3&doc=${'a'.repeat(PAYLOAD_LIMIT)}`;
      loggedExpect(decodePayload(oversize).ok(), 'PayloadMatrix.test.ets:A0051', BUNDLE + '_PayloadCodecMatrix_0002').assertFalse();
      loggedExpect(decodePayload('doc=a&rev=1').ok(), 'PayloadMatrix.test.ets:A0052', BUNDLE + '_PayloadCodecMatrix_0002').assertFalse();
      loggedExpect(decodePayload('v=9&doc=a&rev=1').ok(), 'PayloadMatrix.test.ets:A0053', BUNDLE + '_PayloadCodecMatrix_0002').assertFalse();
      loggedExpect(decodePayload('v=0&doc=a&rev=1').ok(), 'PayloadMatrix.test.ets:A0054', BUNDLE + '_PayloadCodecMatrix_0002').assertFalse();
      loggedExpect(decodePayload('v=1&rev=1').ok(), 'PayloadMatrix.test.ets:A0055', BUNDLE + '_PayloadCodecMatrix_0002').assertFalse();
      const older = decodePayload('v=2&doc=d&rev=1&body=x');
      loggedExpect(older.ok(), 'PayloadMatrix.test.ets:A0056', BUNDLE + '_PayloadCodecMatrix_0002').assertTrue();
      loggedExpect(older.migrated, 'PayloadMatrix.test.ets:A0057', BUNDLE + '_PayloadCodecMatrix_0002').assertTrue();
      loggedExpect(older.data?.cs, 'PayloadMatrix.test.ets:A0058', BUNDLE + '_PayloadCodecMatrix_0002').assertEqual(0);
      const badEnum = decodePayload('v=3&doc=d&rev=1&ck=weird');
      loggedExpect(badEnum.ok(), 'PayloadMatrix.test.ets:A0059', BUNDLE + '_PayloadCodecMatrix_0002').assertTrue();
      loggedExpect(badEnum.warnOnly(), 'PayloadMatrix.test.ets:A0060', BUNDLE + '_PayloadCodecMatrix_0002').assertTrue();
      loggedExpect(badEnum.data?.ck, 'PayloadMatrix.test.ets:A0061', BUNDLE + '_PayloadCodecMatrix_0002').assertEqual('none');
      loggedExpect(badEnum.issues.length, 'PayloadMatrix.test.ets:A0062', BUNDLE + '_PayloadCodecMatrix_0002').assertEqual(1);
      loggedExpect(badEnum.issues[0].field, 'PayloadMatrix.test.ets:A0063', BUNDLE + '_PayloadCodecMatrix_0002').assertEqual('ck');
      loggedExpect(badEnum.issues[0].text().indexOf('ck') === 0, 'PayloadMatrix.test.ets:A0064', BUNDLE + '_PayloadCodecMatrix_0002').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADCODECMATRIX_0300
     * @tc.name      com.samples.appcontinuation_PayloadCodecMatrix_0003
     * @tc.desc      Verify fit within limit truncates body
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_PayloadCodecMatrix_0003', 0, (): void => {
      const data: PayloadData = mk('doc-2', 5);
      data.body = '字'.repeat(3000);
      const total: number = encodePayload(data).length;
      loggedExpect(total > 1000, 'PayloadMatrix.test.ets:A0065', BUNDLE + '_PayloadCodecMatrix_0003').assertTrue();
      const fitted = fitWithinLimit(data, 500);
      loggedExpect(fitted.truncated, 'PayloadMatrix.test.ets:A0066', BUNDLE + '_PayloadCodecMatrix_0003').assertTrue();
      loggedExpect(fitted.droppedChars > 0, 'PayloadMatrix.test.ets:A0067', BUNDLE + '_PayloadCodecMatrix_0003').assertTrue();
      loggedExpect(fitted.content.length <= 500, 'PayloadMatrix.test.ets:A0068', BUNDLE + '_PayloadCodecMatrix_0003').assertTrue();
      loggedExpect(fitted.caption().indexOf('截断') > 0, 'PayloadMatrix.test.ets:A0069', BUNDLE + '_PayloadCodecMatrix_0003').assertTrue();
      const small: PayloadData = mk('doc-3', 1);
      const untouched = fitWithinLimit(small, PAYLOAD_LIMIT);
      loggedExpect(untouched.truncated, 'PayloadMatrix.test.ets:A0070', BUNDLE + '_PayloadCodecMatrix_0003').assertFalse();
      loggedExpect(untouched.droppedChars, 'PayloadMatrix.test.ets:A0071', BUNDLE + '_PayloadCodecMatrix_0003').assertEqual(0);
      loggedExpect(untouched.caption(), 'PayloadMatrix.test.ets:A0072', BUNDLE + '_PayloadCodecMatrix_0003').assertEqual('未截断');
      const decoded = decodePayload(fitted.content);
      loggedExpect(decoded.ok(), 'PayloadMatrix.test.ets:A0073', BUNDLE + '_PayloadCodecMatrix_0003').assertTrue();
      loggedExpect(decoded.data?.selectionValid(), 'PayloadMatrix.test.ets:A0074', BUNDLE + '_PayloadCodecMatrix_0003').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADCODECMATRIX_0400
     * @tc.name      com.samples.appcontinuation_PayloadCodecMatrix_0004
     * @tc.desc      Verify digest seals payload
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_PayloadCodecMatrix_0004', 0, (): void => {
      const data: PayloadData = mk('doc-4', 7);
      loggedExpect(matchesDigest(data), 'PayloadMatrix.test.ets:A0075', BUNDLE + '_PayloadCodecMatrix_0004').assertFalse();
      const sealed: PayloadData = sealPayload(data);
      loggedExpect(sealed.sig.length, 'PayloadMatrix.test.ets:A0076', BUNDLE + '_PayloadCodecMatrix_0004').assertEqual(8);
      loggedExpect(matchesDigest(sealed), 'PayloadMatrix.test.ets:A0077', BUNDLE + '_PayloadCodecMatrix_0004').assertTrue();
      sealed.body = `${sealed.body}追加`;
      loggedExpect(matchesDigest(sealed), 'PayloadMatrix.test.ets:A0078', BUNDLE + '_PayloadCodecMatrix_0004').assertFalse();
      loggedExpect(digestOf('abc'), 'PayloadMatrix.test.ets:A0079', BUNDLE + '_PayloadCodecMatrix_0004').assertEqual(digestOf('abc'));
      loggedExpect(digestOf('abc') === digestOf('abd'), 'PayloadMatrix.test.ets:A0080', BUNDLE + '_PayloadCodecMatrix_0004').assertFalse();
      loggedExpect(digestOf('abc').length, 'PayloadMatrix.test.ets:A0081', BUNDLE + '_PayloadCodecMatrix_0004').assertEqual(8);
      loggedExpect(data.sig, 'PayloadMatrix.test.ets:A0082', BUNDLE + '_PayloadCodecMatrix_0004').assertEqual('');
    });

    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADCODECMATRIX_0500
     * @tc.name      com.samples.appcontinuation_PayloadCodecMatrix_0005
     * @tc.desc      Verify diff and size
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_PayloadCodecMatrix_0005', 0, (): void => {
      const left: PayloadData = mk('doc-5', 1);
      const right: PayloadData = mk('doc-5', 1);
      loggedExpect(diffPayloads(left, right).changed(), 'PayloadMatrix.test.ets:A0083', BUNDLE + '_PayloadCodecMatrix_0005').assertFalse();
      loggedExpect(diffPayloads(left, right).summary(), 'PayloadMatrix.test.ets:A0084', BUNDLE + '_PayloadCodecMatrix_0005').assertEqual('无字段变化');
      right.body = '不同内容';
      right.cs = 6;
      const diff = diffPayloads(left, right);
      loggedExpect(diff.changed(), 'PayloadMatrix.test.ets:A0085', BUNDLE + '_PayloadCodecMatrix_0005').assertTrue();
      loggedExpect(diff.fields().indexOf('body') >= 0, 'PayloadMatrix.test.ets:A0086', BUNDLE + '_PayloadCodecMatrix_0005').assertTrue();
      loggedExpect(diff.fields().indexOf('cs') >= 0, 'PayloadMatrix.test.ets:A0087', BUNDLE + '_PayloadCodecMatrix_0005').assertTrue();
      loggedExpect(diff.cursorOnly(), 'PayloadMatrix.test.ets:A0088', BUNDLE + '_PayloadCodecMatrix_0005').assertFalse();
      const cursorLeft: PayloadData = mk('doc-6', 1);
      const cursorRight: PayloadData = mk('doc-6', 1);
      cursorRight.cs = 9;
      loggedExpect(diffPayloads(cursorLeft, cursorRight).cursorOnly(), 'PayloadMatrix.test.ets:A0089', BUNDLE + '_PayloadCodecMatrix_0005').assertTrue();
      const size = sizeOf(left);
      loggedExpect(size.chars, 'PayloadMatrix.test.ets:A0090', BUNDLE + '_PayloadCodecMatrix_0005').assertEqual(encodePayload(left).length);
      loggedExpect(size.bytes >= size.chars, 'PayloadMatrix.test.ets:A0091', BUNDLE + '_PayloadCodecMatrix_0005').assertTrue();
      loggedExpect(size.ratio() > 0, 'PayloadMatrix.test.ets:A0092', BUNDLE + '_PayloadCodecMatrix_0005').assertTrue();
      loggedExpect(size.text().indexOf('字符') > 0, 'PayloadMatrix.test.ets:A0093', BUNDLE + '_PayloadCodecMatrix_0005').assertTrue();
      loggedExpect(utf8Length('abc'), 'PayloadMatrix.test.ets:A0094', BUNDLE + '_PayloadCodecMatrix_0005').assertEqual(3);
      loggedExpect(utf8Length('中文'), 'PayloadMatrix.test.ets:A0095', BUNDLE + '_PayloadCodecMatrix_0005').assertEqual(6);
      loggedExpect(utf8Length(''), 'PayloadMatrix.test.ets:A0096', BUNDLE + '_PayloadCodecMatrix_0005').assertEqual(0);
    });
  });

  describe('ConflictPolicyMatrix', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTPOLICYMATRIX_0100
     * @tc.name      com.samples.appcontinuation_ConflictPolicyMatrix_0001
     * @tc.desc      Verify rule table covers every combination
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it(BUNDLE + '_ConflictPolicyMatrix_0001', 0, (): void => {
      loggedExpect(CONFLICT_RULES.length, 'PayloadMatrix.test.ets:A0097', BUNDLE + '_ConflictPolicyMatrix_0001').assertEqual(28);
      loggedExpect(conflictRuleLines().length, 'PayloadMatrix.test.ets:A0098', BUNDLE + '_ConflictPolicyMatrix_0001').assertEqual(28);
      const audit = auditConflictRules();
      loggedExpect(audit.ok, 'PayloadMatrix.test.ets:A0099', BUNDLE + '_ConflictPolicyMatrix_0001').assertTrue();
      loggedExpect(audit.summary(), 'PayloadMatrix.test.ets:A0100', BUNDLE + '_ConflictPolicyMatrix_0001').assertEqual('冲突规则表自洽');
      CONFLICT_RULES.forEach((rule): void => {
        loggedExpect(rule.ruleId.indexOf('CF-') === 0, 'PayloadMatrix.test.ets:A0101', BUNDLE + '_ConflictPolicyMatrix_0001').assertTrue();
        loggedExpect(rule.reason.length > 0, 'PayloadMatrix.test.ets:A0102', BUNDLE + '_ConflictPolicyMatrix_0001').assertTrue();
        loggedExpect(rule.text().indexOf(rule.ruleId) === 0, 'PayloadMatrix.test.ets:A0103', BUNDLE + '_ConflictPolicyMatrix_0001').assertTrue();
      });
      loggedExpect(resolutionLabel(Resolution.KEEP_LOCAL), 'PayloadMatrix.test.ets:A0104', BUNDLE + '_ConflictPolicyMatrix_0001').assertEqual('保留本机');
      loggedExpect(needsConfirmation(Resolution.ASK_USER), 'PayloadMatrix.test.ets:A0105', BUNDLE + '_ConflictPolicyMatrix_0001').assertTrue();
      loggedExpect(losesContent(Resolution.DISCARD_REMOTE), 'PayloadMatrix.test.ets:A0106', BUNDLE + '_ConflictPolicyMatrix_0001').assertTrue();
      loggedExpect(losesContent(Resolution.APPEND_REMOTE), 'PayloadMatrix.test.ets:A0107', BUNDLE + '_ConflictPolicyMatrix_0001').assertFalse();
      loggedExpect(conflictLabel(ConflictKind.BOTH_CHANGED), 'PayloadMatrix.test.ets:A0108', BUNDLE + '_ConflictPolicyMatrix_0001').assertEqual('两端都改过');
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTPOLICYMATRIX_0200
     * @tc.name      com.samples.appcontinuation_ConflictPolicyMatrix_0002
     * @tc.desc      Verify classify covers every kind
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ConflictPolicyMatrix_0002', 0, (): void => {
      const same: ConflictInput = new ConflictInput(mk('a', 1), mk('a', 1));
      loggedExpect(classify(same), 'PayloadMatrix.test.ets:A0109', BUNDLE + '_ConflictPolicyMatrix_0002').assertEqual(ConflictKind.NONE);
      const newer: ConflictInput = new ConflictInput(mk('a', 1), mk('a', 3));
      loggedExpect(classify(newer), 'PayloadMatrix.test.ets:A0110', BUNDLE + '_ConflictPolicyMatrix_0002').assertEqual(ConflictKind.REMOTE_NEWER);
      const older: ConflictInput = new ConflictInput(mk('a', 3), mk('a', 1));
      loggedExpect(classify(older), 'PayloadMatrix.test.ets:A0111', BUNDLE + '_ConflictPolicyMatrix_0002').assertEqual(ConflictKind.LOCAL_NEWER);
      const bothDirty: ConflictInput = new ConflictInput(mk('a', 1), mk('a', 1));
      bothDirty.localDirty = true;
      bothDirty.remoteDirty = true;
      loggedExpect(classify(bothDirty), 'PayloadMatrix.test.ets:A0112', BUNDLE + '_ConflictPolicyMatrix_0002').assertEqual(ConflictKind.BOTH_CHANGED);
      const localEmpty: ConflictInput = new ConflictInput(new PayloadData('', 0), mk('a', 1));
      localEmpty.local.body = '';
      loggedExpect(classify(localEmpty), 'PayloadMatrix.test.ets:A0113', BUNDLE + '_ConflictPolicyMatrix_0002').assertEqual(ConflictKind.REMOTE_ONLY);
      const remoteEmpty: ConflictInput = new ConflictInput(mk('a', 1), new PayloadData('', 0));
      remoteEmpty.remote.body = '';
      loggedExpect(classify(remoteEmpty), 'PayloadMatrix.test.ets:A0114', BUNDLE + '_ConflictPolicyMatrix_0002').assertEqual(ConflictKind.LOCAL_ONLY);
      loggedExpect(classify(new ConflictInput(mk('a', 1), mk('b', 1))), 'PayloadMatrix.test.ets:A0115', BUNDLE + '_ConflictPolicyMatrix_0002').assertEqual(ConflictKind.UNKNOWN);
      const absent: ConflictInput = new ConflictInput(mk('a', 1), mk('a', 1));
      absent.remotePresent = false;
      loggedExpect(classify(absent), 'PayloadMatrix.test.ets:A0116', BUNDLE + '_ConflictPolicyMatrix_0002').assertEqual(ConflictKind.NONE);
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTPOLICYMATRIX_0300
     * @tc.name      com.samples.appcontinuation_ConflictPolicyMatrix_0003
     * @tc.desc      Verify decide matches table for every dirty combination
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ConflictPolicyMatrix_0003', 0, (): void => {
      const kinds: ConflictKind[] = [ConflictKind.NONE, ConflictKind.REMOTE_NEWER,
        ConflictKind.LOCAL_NEWER, ConflictKind.BOTH_CHANGED, ConflictKind.UNKNOWN];
      kinds.forEach((kind: ConflictKind): void => {
        [false, true].forEach((localDirty: boolean): void => {
          [false, true].forEach((remoteDirty: boolean): void => {
            const rule = CONFLICT_RULES.find((item): boolean =>
              item.matches(kind, localDirty, remoteDirty));
            loggedExpect(rule !== undefined, 'PayloadMatrix.test.ets:A0117', BUNDLE + '_ConflictPolicyMatrix_0003').assertTrue();
            loggedExpect(rule?.resolution !== undefined, 'PayloadMatrix.test.ets:A0118', BUNDLE + '_ConflictPolicyMatrix_0003').assertTrue();
          });
        });
      });
      const remote: ConflictInput = new ConflictInput(mk('a', 1), mk('a', 3));
      const decision = decide(remote);
      loggedExpect(decision.kind, 'PayloadMatrix.test.ets:A0119', BUNDLE + '_ConflictPolicyMatrix_0003').assertEqual(ConflictKind.REMOTE_NEWER);
      loggedExpect(decision.resolution, 'PayloadMatrix.test.ets:A0120', BUNDLE + '_ConflictPolicyMatrix_0003').assertEqual(Resolution.KEEP_REMOTE);
      loggedExpect(decision.matched(), 'PayloadMatrix.test.ets:A0121', BUNDLE + '_ConflictPolicyMatrix_0003').assertTrue();
      loggedExpect(decision.confirm(), 'PayloadMatrix.test.ets:A0122', BUNDLE + '_ConflictPolicyMatrix_0003').assertFalse();
      loggedExpect(decision.text().indexOf('CF-13') > 0, 'PayloadMatrix.test.ets:A0123', BUNDLE + '_ConflictPolicyMatrix_0003').assertTrue();
      const both: ConflictInput = new ConflictInput(mk('a', 2), mk('a', 2));
      both.localDirty = true;
      both.remoteDirty = true;
      loggedExpect(decide(both).resolution, 'PayloadMatrix.test.ets:A0124', BUNDLE + '_ConflictPolicyMatrix_0003').assertEqual(Resolution.ASK_USER);
      loggedExpect(decide(both).confirm(), 'PayloadMatrix.test.ets:A0125', BUNDLE + '_ConflictPolicyMatrix_0003').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTPOLICYMATRIX_0400
     * @tc.name      com.samples.appcontinuation_ConflictPolicyMatrix_0004
     * @tc.desc      Verify apply resolution produces content
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ConflictPolicyMatrix_0004', 0, (): void => {
      const local: PayloadData = mk('doc-9', 2);
      local.body = 'a\nb';
      const remote: PayloadData = mk('doc-9', 2);
      remote.body = 'b\nc';
      const input: ConflictInput = new ConflictInput(local, remote);
      input.localDirty = true;
      const preferLocal = decide(input);
      loggedExpect(preferLocal.resolution, 'PayloadMatrix.test.ets:A0126', BUNDLE + '_ConflictPolicyMatrix_0004').assertEqual(Resolution.MERGE_PREFER_LOCAL);
      const merged = applyResolution(input, preferLocal);
      loggedExpect(merged.data.body, 'PayloadMatrix.test.ets:A0127', BUNDLE + '_ConflictPolicyMatrix_0004').assertEqual('a\nb\nc');
      loggedExpect(merged.notes.length, 'PayloadMatrix.test.ets:A0128', BUNDLE + '_ConflictPolicyMatrix_0004').assertEqual(2);
      loggedExpect(merged.summary().indexOf('偏向本机') > 0, 'PayloadMatrix.test.ets:A0129', BUNDLE + '_ConflictPolicyMatrix_0004').assertTrue();
      const keepRemoteDecision: ConflictDecision = decide(new ConflictInput(local, remote));
      keepRemoteDecision.resolution = Resolution.KEEP_REMOTE;
      const keepRemote = applyResolution(new ConflictInput(local, remote), keepRemoteDecision);
      loggedExpect(keepRemote.data.body, 'PayloadMatrix.test.ets:A0130', BUNDLE + '_ConflictPolicyMatrix_0004').assertEqual('b\nc');
      const appendDecision: ConflictDecision = decide(new ConflictInput(local, remote));
      appendDecision.resolution = Resolution.APPEND_REMOTE;
      const appended = applyResolution(new ConflictInput(local, remote), appendDecision);
      loggedExpect(appended.data.body, 'PayloadMatrix.test.ets:A0131', BUNDLE + '_ConflictPolicyMatrix_0004').assertEqual('a\nb\nb\nc');
    });
  });

  describe('ContinuationRulesMatrix', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONRULESMATRIX_0100
     * @tc.name      com.samples.appcontinuation_ContinuationRulesMatrix_0001
     * @tc.desc      Verify rule table is auditable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it(BUNDLE + '_ContinuationRulesMatrix_0001', 0, (): void => {
      loggedExpect(READINESS_RULES.length, 'PayloadMatrix.test.ets:A0132', BUNDLE + '_ContinuationRulesMatrix_0001').assertEqual(12);
      loggedExpect(readinessRuleLines().length, 'PayloadMatrix.test.ets:A0133', BUNDLE + '_ContinuationRulesMatrix_0001').assertEqual(12);
      const audit = auditReadinessRules();
      loggedExpect(audit.findings.length, 'PayloadMatrix.test.ets:A0134', BUNDLE + '_ContinuationRulesMatrix_0001').assertEqual(0);
      loggedExpect(audit.ok, 'PayloadMatrix.test.ets:A0135', BUNDLE + '_ContinuationRulesMatrix_0001').assertTrue();
      loggedExpect(audit.summary(), 'PayloadMatrix.test.ets:A0136', BUNDLE + '_ContinuationRulesMatrix_0001').assertEqual('准入规则表自洽');
      READINESS_RULES.forEach((rule): void => {
        loggedExpect(rule.ruleId.indexOf('CR-') === 0, 'PayloadMatrix.test.ets:A0137', BUNDLE + '_ContinuationRulesMatrix_0001').assertTrue();
        loggedExpect(rule.maxApi >= rule.minApi, 'PayloadMatrix.test.ets:A0138', BUNDLE + '_ContinuationRulesMatrix_0001').assertTrue();
        loggedExpect(rule.hint.length > 0, 'PayloadMatrix.test.ets:A0139', BUNDLE + '_ContinuationRulesMatrix_0001').assertTrue();
      });
      loggedExpect(readinessLabel(Readiness.READY), 'PayloadMatrix.test.ets:A0140', BUNDLE + '_ContinuationRulesMatrix_0001').assertEqual('可以接续');
      loggedExpect(isUnsupportedReadiness(Readiness.NEED_UPGRADE), 'PayloadMatrix.test.ets:A0141', BUNDLE + '_ContinuationRulesMatrix_0001').assertTrue();
      loggedExpect(needsUserAction(Readiness.NEED_PERMISSION), 'PayloadMatrix.test.ets:A0142', BUNDLE + '_ContinuationRulesMatrix_0001').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONRULESMATRIX_0200
     * @tc.name      com.samples.appcontinuation_ContinuationRulesMatrix_0002
     * @tc.desc      Verify readiness depends on permission and payload
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ContinuationRulesMatrix_0002', 0, (): void => {
      const granted: RuleContext = new RuleContext(26, DeviceClass.PHONE, true);
      granted.payloadChars = 100;
      const ready = evaluateReadiness(granted);
      loggedExpect(ready.readiness, 'PayloadMatrix.test.ets:A0143', BUNDLE + '_ContinuationRulesMatrix_0002').assertEqual(Readiness.READY);
      loggedExpect(canStart(ready), 'PayloadMatrix.test.ets:A0144', BUNDLE + '_ContinuationRulesMatrix_0002').assertTrue();
      loggedExpect(ready.rule?.ruleId, 'PayloadMatrix.test.ets:A0145', BUNDLE + '_ContinuationRulesMatrix_0002').assertEqual('CR-10');
      const denied: RuleContext = new RuleContext(26, DeviceClass.PHONE, false);
      const deniedResult = evaluateReadiness(denied);
      loggedExpect(deniedResult.readiness, 'PayloadMatrix.test.ets:A0146', BUNDLE + '_ContinuationRulesMatrix_0002').assertEqual(Readiness.NEED_PERMISSION);
      loggedExpect(deniedResult.downgradedByPermission, 'PayloadMatrix.test.ets:A0147', BUNDLE + '_ContinuationRulesMatrix_0002').assertTrue();
      loggedExpect(deniedResult.hint().indexOf('权限') > 0, 'PayloadMatrix.test.ets:A0148', BUNDLE + '_ContinuationRulesMatrix_0002').assertTrue();
      const huge: RuleContext = new RuleContext(26, DeviceClass.PHONE, true);
      huge.payloadChars = 9000;
      const hugeResult = evaluateReadiness(huge);
      loggedExpect(hugeResult.readiness, 'PayloadMatrix.test.ets:A0149', BUNDLE + '_ContinuationRulesMatrix_0002').assertEqual(Readiness.PAYLOAD_TOO_LARGE);
      loggedExpect(hugeResult.downgradedByPayload, 'PayloadMatrix.test.ets:A0150', BUNDLE + '_ContinuationRulesMatrix_0002').assertTrue();
      loggedExpect(canStart(hugeResult), 'PayloadMatrix.test.ets:A0151', BUNDLE + '_ContinuationRulesMatrix_0002').assertFalse();
      loggedExpect(evaluateReadiness(new RuleContext(8, DeviceClass.PHONE, true)).readiness, 'PayloadMatrix.test.ets:A0152', BUNDLE + '_ContinuationRulesMatrix_0002')
        .assertEqual(Readiness.NEED_UPGRADE);
      loggedExpect(evaluateReadiness(new RuleContext(10, DeviceClass.WEARABLE, true)).readiness, 'PayloadMatrix.test.ets:A0153', BUNDLE + '_ContinuationRulesMatrix_0002')
        .assertEqual(Readiness.UNSUPPORTED_DEVICE);
      loggedExpect(evaluateReadiness(new RuleContext(28, DeviceClass.PHONE, true)).readiness, 'PayloadMatrix.test.ets:A0154', BUNDLE + '_ContinuationRulesMatrix_0002')
        .assertEqual(Readiness.UNKNOWN);
      loggedExpect(evaluateReadiness(new RuleContext(26, DeviceClass.UNKNOWN, true)).readiness, 'PayloadMatrix.test.ets:A0155', BUNDLE + '_ContinuationRulesMatrix_0002')
        .assertEqual(Readiness.UNKNOWN);
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONRULESMATRIX_0300
     * @tc.name      com.samples.appcontinuation_ContinuationRulesMatrix_0003
     * @tc.desc      Verify series and device mapping
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ContinuationRulesMatrix_0003', 0, (): void => {
      const series = readinessSeries(DeviceClass.PHONE, true, 100);
      loggedExpect(series.length, 'PayloadMatrix.test.ets:A0156', BUNDLE + '_ContinuationRulesMatrix_0003').assertEqual(23);
      loggedExpect(series[0], 'PayloadMatrix.test.ets:A0157', BUNDLE + '_ContinuationRulesMatrix_0003').assertEqual(Readiness.NEED_UPGRADE);
      loggedExpect(series[series.length - 1], 'PayloadMatrix.test.ets:A0158', BUNDLE + '_ContinuationRulesMatrix_0003').assertEqual(Readiness.UNKNOWN);
      const wearableSeries = readinessSeries(DeviceClass.WEARABLE, true, 100);
      loggedExpect(wearableSeries.length, 'PayloadMatrix.test.ets:A0159', BUNDLE + '_ContinuationRulesMatrix_0003').assertEqual(23);
      loggedExpect(wearableSeries[2], 'PayloadMatrix.test.ets:A0160', BUNDLE + '_ContinuationRulesMatrix_0003').assertEqual(Readiness.UNSUPPORTED_DEVICE);
      loggedExpect(deviceClassOf('phone'), 'PayloadMatrix.test.ets:A0161', BUNDLE + '_ContinuationRulesMatrix_0003').assertEqual(DeviceClass.PHONE);
      loggedExpect(deviceClassOf('tablet'), 'PayloadMatrix.test.ets:A0162', BUNDLE + '_ContinuationRulesMatrix_0003').assertEqual(DeviceClass.TABLET);
      loggedExpect(deviceClassOf('2in1'), 'PayloadMatrix.test.ets:A0163', BUNDLE + '_ContinuationRulesMatrix_0003').assertEqual(DeviceClass.PC);
      loggedExpect(deviceClassOf('tv'), 'PayloadMatrix.test.ets:A0164', BUNDLE + '_ContinuationRulesMatrix_0003').assertEqual(DeviceClass.TV);
      loggedExpect(deviceClassOf('wearable'), 'PayloadMatrix.test.ets:A0165', BUNDLE + '_ContinuationRulesMatrix_0003').assertEqual(DeviceClass.WEARABLE);
      loggedExpect(deviceClassOf('other'), 'PayloadMatrix.test.ets:A0166', BUNDLE + '_ContinuationRulesMatrix_0003').assertEqual(DeviceClass.UNKNOWN);
      loggedExpect(new RuleContext(20, DeviceClass.PHONE, true).key(), 'PayloadMatrix.test.ets:A0167', BUNDLE + '_ContinuationRulesMatrix_0003').assertEqual('20|phone|1|0|0|0');
    });
  });
}

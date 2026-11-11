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

import { describe, expect, it } from '@ohos/hypium';
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
     * @tc.name      testPayloadSchemaMatrix0001
     * @tc.desc      Verify catalog is complete
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testPayloadSchemaMatrix0001', 0, (): void => {
      expect(PAYLOAD_FIELDS.length).assertEqual(12);
      expect(fieldNames().length).assertEqual(12);
      expect(PAYLOAD_VERSION).assertEqual(3);
      expect(PAYLOAD_MIGRATIONS.length).assertEqual(2);
      const audit = auditPayloadSchema();
      expect(audit.ok).assertTrue();
      expect(audit.findings.length).assertEqual(0);
      expect(audit.summary()).assertEqual('载荷字段目录自洽');
      PAYLOAD_FIELDS.forEach((field): void => {
        expect(field.name.length > 0).assertTrue();
        expect(field.label.length > 0).assertTrue();
        expect(field.since >= 1 && field.since <= PAYLOAD_VERSION).assertTrue();
        expect(field.describe().indexOf(field.name) === 0).assertTrue();
        expect(field.existsIn(PAYLOAD_VERSION)).assertTrue();
      });
      expect(fieldOf('body')?.kind).assertEqual(PayloadKind.MULTILINE);
      expect(fieldOf('missing')).assertEqual(undefined);
      expect(fieldsAt(1).length).assertEqual(5);
      expect(fieldsAt(2).length).assertEqual(9);
      expect(fieldsAt(3).length).assertEqual(12);
      expect(schemaVersionLines().length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADSCHEMAMATRIX_0200
     * @tc.name      testPayloadSchemaMatrix0002
     * @tc.desc      Verify escape round trip
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPayloadSchemaMatrix0002', 0, (): void => {
      const samples: string[] = ['a&b=c', '100%', '多行\n内容', '制表\t符', '普通文本', ''];
      samples.forEach((sample: string): void => {
        expect(unescapeValue(escapeValue(sample))).assertEqual(sample);
      });
      expect(escapeValue('a&b')).assertEqual('a%26b');
      expect(escapeValue('a=b')).assertEqual('a%3Db');
      expect(escapeValue('100%')).assertEqual('100%25');
      expect(escapeValue('\n')).assertEqual('%0A');
      expect(unescapeValue('%26')).assertEqual('&');
      expect(PAIR_SEPARATOR).assertEqual('&');
    });

    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADSCHEMAMATRIX_0300
     * @tc.name      testPayloadSchemaMatrix0003
     * @tc.desc      Verify migration chain covers versions
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPayloadSchemaMatrix0003', 0, (): void => {
      expect(migrationChain(3).length).assertEqual(0);
      expect(migrationChain(1).length).assertEqual(2);
      expect(migrationChain(2).length).assertEqual(1);
      expect(migrationChain(0).length).assertEqual(0);
      migrationChain(1).forEach((step): void => {
        expect(step.to === step.from + 1).assertTrue();
        expect(step.text().indexOf('->') > 0).assertTrue();
      });
      expect(BODY_LIMIT).assertEqual(4096);
      expect(PAYLOAD_LIMIT).assertEqual(8192);
    });
  });

  describe('PayloadCodecMatrix', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADCODECMATRIX_0100
     * @tc.name      testPayloadCodecMatrix0001
     * @tc.desc      Verify encode decode round trip
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPayloadCodecMatrix0001', 0, (): void => {
      const data: PayloadData = mk('doc-1', 2);
      const encoded: string = encodePayload(data);
      expect(encoded.indexOf('v=3') === 0).assertTrue();
      expect(encoded.indexOf('&doc=doc-1') > 0).assertTrue();
      const decoded = decodePayload(encoded);
      expect(decoded.ok()).assertTrue();
      expect(decoded.version).assertEqual(PAYLOAD_VERSION);
      expect(decoded.migrated).assertFalse();
      expect(decoded.issues.length).assertEqual(0);
      expect(decoded.data?.doc).assertEqual('doc-1');
      expect(decoded.data?.rev).assertEqual(2);
      expect(decoded.data?.title).assertEqual('记录-2');
      expect(decoded.data?.body).assertEqual('第一行\n第二行');
      expect(decoded.data?.cs).assertEqual(1);
      expect(decoded.data?.ce).assertEqual(4);
      expect(decoded.data?.dev).assertEqual('unit-test');
      const decodedSummary: string = decoded.data === undefined ? '' : decoded.data.summary();
      expect(decodedSummary.indexOf('rev 2') > 0).assertTrue();
      expect(decoded.data?.selectionValid()).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADCODECMATRIX_0200
     * @tc.name      testPayloadCodecMatrix0002
     * @tc.desc      Verify decode rejects invalid input
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPayloadCodecMatrix0002', 0, (): void => {
      expect(decodePayload('').ok()).assertFalse();
      expect(decodePayload('').issues.length).assertEqual(1);
      const oversize: string = `v=3&doc=${'a'.repeat(PAYLOAD_LIMIT)}`;
      expect(decodePayload(oversize).ok()).assertFalse();
      expect(decodePayload('doc=a&rev=1').ok()).assertFalse();
      expect(decodePayload('v=9&doc=a&rev=1').ok()).assertFalse();
      expect(decodePayload('v=0&doc=a&rev=1').ok()).assertFalse();
      expect(decodePayload('v=1&rev=1').ok()).assertFalse();
      const older = decodePayload('v=2&doc=d&rev=1&body=x');
      expect(older.ok()).assertTrue();
      expect(older.migrated).assertTrue();
      expect(older.data?.cs).assertEqual(0);
      const badEnum = decodePayload('v=3&doc=d&rev=1&ck=weird');
      expect(badEnum.ok()).assertTrue();
      expect(badEnum.warnOnly()).assertTrue();
      expect(badEnum.data?.ck).assertEqual('none');
      expect(badEnum.issues.length).assertEqual(1);
      expect(badEnum.issues[0].field).assertEqual('ck');
      expect(badEnum.issues[0].text().indexOf('ck') === 0).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADCODECMATRIX_0300
     * @tc.name      testPayloadCodecMatrix0003
     * @tc.desc      Verify fit within limit truncates body
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPayloadCodecMatrix0003', 0, (): void => {
      const data: PayloadData = mk('doc-2', 5);
      data.body = '字'.repeat(3000);
      const total: number = encodePayload(data).length;
      expect(total > 1000).assertTrue();
      const fitted = fitWithinLimit(data, 500);
      expect(fitted.truncated).assertTrue();
      expect(fitted.droppedChars > 0).assertTrue();
      expect(fitted.content.length <= 500).assertTrue();
      expect(fitted.caption().indexOf('截断') > 0).assertTrue();
      const small: PayloadData = mk('doc-3', 1);
      const untouched = fitWithinLimit(small, PAYLOAD_LIMIT);
      expect(untouched.truncated).assertFalse();
      expect(untouched.droppedChars).assertEqual(0);
      expect(untouched.caption()).assertEqual('未截断');
      const decoded = decodePayload(fitted.content);
      expect(decoded.ok()).assertTrue();
      expect(decoded.data?.selectionValid()).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADCODECMATRIX_0400
     * @tc.name      testPayloadCodecMatrix0004
     * @tc.desc      Verify digest seals payload
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPayloadCodecMatrix0004', 0, (): void => {
      const data: PayloadData = mk('doc-4', 7);
      expect(matchesDigest(data)).assertFalse();
      const sealed: PayloadData = sealPayload(data);
      expect(sealed.sig.length).assertEqual(8);
      expect(matchesDigest(sealed)).assertTrue();
      sealed.body = `${sealed.body}追加`;
      expect(matchesDigest(sealed)).assertFalse();
      expect(digestOf('abc')).assertEqual(digestOf('abc'));
      expect(digestOf('abc') === digestOf('abd')).assertFalse();
      expect(digestOf('abc').length).assertEqual(8);
      expect(data.sig).assertEqual('');
    });

    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADCODECMATRIX_0500
     * @tc.name      testPayloadCodecMatrix0005
     * @tc.desc      Verify diff and size
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPayloadCodecMatrix0005', 0, (): void => {
      const left: PayloadData = mk('doc-5', 1);
      const right: PayloadData = mk('doc-5', 1);
      expect(diffPayloads(left, right).changed()).assertFalse();
      expect(diffPayloads(left, right).summary()).assertEqual('无字段变化');
      right.body = '不同内容';
      right.cs = 6;
      const diff = diffPayloads(left, right);
      expect(diff.changed()).assertTrue();
      expect(diff.fields().indexOf('body') >= 0).assertTrue();
      expect(diff.fields().indexOf('cs') >= 0).assertTrue();
      expect(diff.cursorOnly()).assertFalse();
      const cursorLeft: PayloadData = mk('doc-6', 1);
      const cursorRight: PayloadData = mk('doc-6', 1);
      cursorRight.cs = 9;
      expect(diffPayloads(cursorLeft, cursorRight).cursorOnly()).assertTrue();
      const size = sizeOf(left);
      expect(size.chars).assertEqual(encodePayload(left).length);
      expect(size.bytes >= size.chars).assertTrue();
      expect(size.ratio() > 0).assertTrue();
      expect(size.text().indexOf('字符') > 0).assertTrue();
      expect(utf8Length('abc')).assertEqual(3);
      expect(utf8Length('中文')).assertEqual(6);
      expect(utf8Length('')).assertEqual(0);
    });
  });

  describe('ConflictPolicyMatrix', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTPOLICYMATRIX_0100
     * @tc.name      testConflictPolicyMatrix0001
     * @tc.desc      Verify rule table covers every combination
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testConflictPolicyMatrix0001', 0, (): void => {
      expect(CONFLICT_RULES.length).assertEqual(28);
      expect(conflictRuleLines().length).assertEqual(28);
      const audit = auditConflictRules();
      expect(audit.ok).assertTrue();
      expect(audit.summary()).assertEqual('冲突规则表自洽');
      CONFLICT_RULES.forEach((rule): void => {
        expect(rule.ruleId.indexOf('CF-') === 0).assertTrue();
        expect(rule.reason.length > 0).assertTrue();
        expect(rule.text().indexOf(rule.ruleId) === 0).assertTrue();
      });
      expect(resolutionLabel(Resolution.KEEP_LOCAL)).assertEqual('保留本机');
      expect(needsConfirmation(Resolution.ASK_USER)).assertTrue();
      expect(losesContent(Resolution.DISCARD_REMOTE)).assertTrue();
      expect(losesContent(Resolution.APPEND_REMOTE)).assertFalse();
      expect(conflictLabel(ConflictKind.BOTH_CHANGED)).assertEqual('两端都改过');
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTPOLICYMATRIX_0200
     * @tc.name      testConflictPolicyMatrix0002
     * @tc.desc      Verify classify covers every kind
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testConflictPolicyMatrix0002', 0, (): void => {
      const same: ConflictInput = new ConflictInput(mk('a', 1), mk('a', 1));
      expect(classify(same)).assertEqual(ConflictKind.NONE);
      const newer: ConflictInput = new ConflictInput(mk('a', 1), mk('a', 3));
      expect(classify(newer)).assertEqual(ConflictKind.REMOTE_NEWER);
      const older: ConflictInput = new ConflictInput(mk('a', 3), mk('a', 1));
      expect(classify(older)).assertEqual(ConflictKind.LOCAL_NEWER);
      const bothDirty: ConflictInput = new ConflictInput(mk('a', 1), mk('a', 1));
      bothDirty.localDirty = true;
      bothDirty.remoteDirty = true;
      expect(classify(bothDirty)).assertEqual(ConflictKind.BOTH_CHANGED);
      const localEmpty: ConflictInput = new ConflictInput(new PayloadData('', 0), mk('a', 1));
      localEmpty.local.body = '';
      expect(classify(localEmpty)).assertEqual(ConflictKind.REMOTE_ONLY);
      const remoteEmpty: ConflictInput = new ConflictInput(mk('a', 1), new PayloadData('', 0));
      remoteEmpty.remote.body = '';
      expect(classify(remoteEmpty)).assertEqual(ConflictKind.LOCAL_ONLY);
      expect(classify(new ConflictInput(mk('a', 1), mk('b', 1)))).assertEqual(ConflictKind.UNKNOWN);
      const absent: ConflictInput = new ConflictInput(mk('a', 1), mk('a', 1));
      absent.remotePresent = false;
      expect(classify(absent)).assertEqual(ConflictKind.NONE);
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTPOLICYMATRIX_0300
     * @tc.name      testConflictPolicyMatrix0003
     * @tc.desc      Verify decide matches table for every dirty combination
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testConflictPolicyMatrix0003', 0, (): void => {
      const kinds: ConflictKind[] = [ConflictKind.NONE, ConflictKind.REMOTE_NEWER,
        ConflictKind.LOCAL_NEWER, ConflictKind.BOTH_CHANGED, ConflictKind.UNKNOWN];
      kinds.forEach((kind: ConflictKind): void => {
        [false, true].forEach((localDirty: boolean): void => {
          [false, true].forEach((remoteDirty: boolean): void => {
            const rule = CONFLICT_RULES.find((item): boolean =>
              item.matches(kind, localDirty, remoteDirty));
            expect(rule !== undefined).assertTrue();
            expect(rule?.resolution !== undefined).assertTrue();
          });
        });
      });
      const remote: ConflictInput = new ConflictInput(mk('a', 1), mk('a', 3));
      const decision = decide(remote);
      expect(decision.kind).assertEqual(ConflictKind.REMOTE_NEWER);
      expect(decision.resolution).assertEqual(Resolution.KEEP_REMOTE);
      expect(decision.matched()).assertTrue();
      expect(decision.confirm()).assertFalse();
      expect(decision.text().indexOf('CF-13') > 0).assertTrue();
      const both: ConflictInput = new ConflictInput(mk('a', 2), mk('a', 2));
      both.localDirty = true;
      both.remoteDirty = true;
      expect(decide(both).resolution).assertEqual(Resolution.ASK_USER);
      expect(decide(both).confirm()).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTPOLICYMATRIX_0400
     * @tc.name      testConflictPolicyMatrix0004
     * @tc.desc      Verify apply resolution produces content
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testConflictPolicyMatrix0004', 0, (): void => {
      const local: PayloadData = mk('doc-9', 2);
      local.body = 'a\nb';
      const remote: PayloadData = mk('doc-9', 2);
      remote.body = 'b\nc';
      const input: ConflictInput = new ConflictInput(local, remote);
      input.localDirty = true;
      const preferLocal = decide(input);
      expect(preferLocal.resolution).assertEqual(Resolution.MERGE_PREFER_LOCAL);
      const merged = applyResolution(input, preferLocal);
      expect(merged.data.body).assertEqual('a\nb\nc');
      expect(merged.notes.length).assertEqual(2);
      expect(merged.summary().indexOf('偏向本机') > 0).assertTrue();
      const keepRemoteDecision: ConflictDecision = decide(new ConflictInput(local, remote));
      keepRemoteDecision.resolution = Resolution.KEEP_REMOTE;
      const keepRemote = applyResolution(new ConflictInput(local, remote), keepRemoteDecision);
      expect(keepRemote.data.body).assertEqual('b\nc');
      const appendDecision: ConflictDecision = decide(new ConflictInput(local, remote));
      appendDecision.resolution = Resolution.APPEND_REMOTE;
      const appended = applyResolution(new ConflictInput(local, remote), appendDecision);
      expect(appended.data.body).assertEqual('a\nb\nb\nc');
    });
  });

  describe('ContinuationRulesMatrix', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONRULESMATRIX_0100
     * @tc.name      testContinuationRulesMatrix0001
     * @tc.desc      Verify rule table is auditable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testContinuationRulesMatrix0001', 0, (): void => {
      expect(READINESS_RULES.length).assertEqual(12);
      expect(readinessRuleLines().length).assertEqual(12);
      const audit = auditReadinessRules();
      expect(audit.findings.length).assertEqual(0);
      expect(audit.ok).assertTrue();
      expect(audit.summary()).assertEqual('准入规则表自洽');
      READINESS_RULES.forEach((rule): void => {
        expect(rule.ruleId.indexOf('CR-') === 0).assertTrue();
        expect(rule.maxApi >= rule.minApi).assertTrue();
        expect(rule.hint.length > 0).assertTrue();
      });
      expect(readinessLabel(Readiness.READY)).assertEqual('可以接续');
      expect(isUnsupportedReadiness(Readiness.NEED_UPGRADE)).assertTrue();
      expect(needsUserAction(Readiness.NEED_PERMISSION)).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONRULESMATRIX_0200
     * @tc.name      testContinuationRulesMatrix0002
     * @tc.desc      Verify readiness depends on permission and payload
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testContinuationRulesMatrix0002', 0, (): void => {
      const granted: RuleContext = new RuleContext(26, DeviceClass.PHONE, true);
      granted.payloadChars = 100;
      const ready = evaluateReadiness(granted);
      expect(ready.readiness).assertEqual(Readiness.READY);
      expect(canStart(ready)).assertTrue();
      expect(ready.rule?.ruleId).assertEqual('CR-10');
      const denied: RuleContext = new RuleContext(26, DeviceClass.PHONE, false);
      const deniedResult = evaluateReadiness(denied);
      expect(deniedResult.readiness).assertEqual(Readiness.NEED_PERMISSION);
      expect(deniedResult.downgradedByPermission).assertTrue();
      expect(deniedResult.hint().indexOf('权限') > 0).assertTrue();
      const huge: RuleContext = new RuleContext(26, DeviceClass.PHONE, true);
      huge.payloadChars = 9000;
      const hugeResult = evaluateReadiness(huge);
      expect(hugeResult.readiness).assertEqual(Readiness.PAYLOAD_TOO_LARGE);
      expect(hugeResult.downgradedByPayload).assertTrue();
      expect(canStart(hugeResult)).assertFalse();
      expect(evaluateReadiness(new RuleContext(8, DeviceClass.PHONE, true)).readiness)
        .assertEqual(Readiness.NEED_UPGRADE);
      expect(evaluateReadiness(new RuleContext(10, DeviceClass.WEARABLE, true)).readiness)
        .assertEqual(Readiness.UNSUPPORTED_DEVICE);
      expect(evaluateReadiness(new RuleContext(28, DeviceClass.PHONE, true)).readiness)
        .assertEqual(Readiness.UNKNOWN);
      expect(evaluateReadiness(new RuleContext(26, DeviceClass.UNKNOWN, true)).readiness)
        .assertEqual(Readiness.UNKNOWN);
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONRULESMATRIX_0300
     * @tc.name      testContinuationRulesMatrix0003
     * @tc.desc      Verify series and device mapping
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testContinuationRulesMatrix0003', 0, (): void => {
      const series = readinessSeries(DeviceClass.PHONE, true, 100);
      expect(series.length).assertEqual(23);
      expect(series[0]).assertEqual(Readiness.NEED_UPGRADE);
      expect(series[series.length - 1]).assertEqual(Readiness.UNKNOWN);
      const wearableSeries = readinessSeries(DeviceClass.WEARABLE, true, 100);
      expect(wearableSeries.length).assertEqual(23);
      expect(wearableSeries[2]).assertEqual(Readiness.UNSUPPORTED_DEVICE);
      expect(deviceClassOf('phone')).assertEqual(DeviceClass.PHONE);
      expect(deviceClassOf('tablet')).assertEqual(DeviceClass.TABLET);
      expect(deviceClassOf('2in1')).assertEqual(DeviceClass.PC);
      expect(deviceClassOf('tv')).assertEqual(DeviceClass.TV);
      expect(deviceClassOf('wearable')).assertEqual(DeviceClass.WEARABLE);
      expect(deviceClassOf('other')).assertEqual(DeviceClass.UNKNOWN);
      expect(new RuleContext(20, DeviceClass.PHONE, true).key()).assertEqual('20|phone|1|0|0|0');
    });
  });
}

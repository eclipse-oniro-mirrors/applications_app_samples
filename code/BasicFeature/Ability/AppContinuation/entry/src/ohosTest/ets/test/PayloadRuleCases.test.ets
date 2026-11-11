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
  CONFLICT_RULES, ConflictDecision, ConflictInput, ConflictKind, Resolution, applyResolution,
  auditConflictRules, classify, conflictLabel, conflictRuleLines, decide, losesContent,
  needsConfirmation, resolutionLabel
} from '../../../main/ets/learning/payload/ConflictPolicy';
import {
  PAYLOAD_FIELDS, PAYLOAD_VERSION, auditPayloadSchema, escapeValue, fieldNames, fieldOf, fieldsAt,
  migrationChain, unescapeValue, PayloadKind
} from '../../../main/ets/learning/payload/PayloadSchema';
import {
  PayloadData, decodePayload, encodePayload, sealPayload, sizeOf, utf8Length
} from '../../../main/ets/learning/payload/PayloadCodec';
import {
  DeviceClass, READINESS_RULES, Readiness, RuleContext, auditReadinessRules, canStart,
  deviceClassOf, evaluateReadiness, isUnsupportedReadiness, needsUserAction, readinessLabel,
  readinessRuleLines, readinessSeries
} from '../../../main/ets/learning/rules/ContinuationRules';

function payload(doc: string, rev: number, body: string): PayloadData {
  const data: PayloadData = new PayloadData(doc, rev);
  data.title = `标题-${rev}`;
  data.body = body;
  data.cs = 0;
  data.ce = body.length;
  data.dev = 'unit';
  data.at = 1700000000000;
  data.app = '1.0.0';
  return data;
}

function readyContext(api: number, device: DeviceClass, granted: boolean,
  payloadChars: number = 0): RuleContext {
  const context: RuleContext = new RuleContext(api, device, granted);
  context.payloadChars = payloadChars;
  context.sessionActive = true;
  context.supportsMission = true;
  return context;
}

function noneInput(localDirty: boolean, remoteDirty: boolean): ConflictInput {
  const input: ConflictInput = new ConflictInput(payload('doc', 2, '同一段正文'),
    payload('doc', 2, '同一段正文'));
  input.localDirty = localDirty;
  input.remoteDirty = remoteDirty;
  return input;
}

function remoteOnlyInput(localDirty: boolean, remoteDirty: boolean): ConflictInput {
  const local: PayloadData = new PayloadData('', 0);
  local.body = '';
  const input: ConflictInput = new ConflictInput(local, payload('doc', 1, '对端正文'));
  input.localDirty = localDirty;
  input.remoteDirty = remoteDirty;
  return input;
}

function localOnlyInput(localDirty: boolean, remoteDirty: boolean): ConflictInput {
  const remote: PayloadData = new PayloadData('', 0);
  remote.body = '';
  const input: ConflictInput = new ConflictInput(payload('doc', 1, '本机正文'), remote);
  input.localDirty = localDirty;
  input.remoteDirty = remoteDirty;
  return input;
}

function remoteNewerInput(localDirty: boolean, remoteDirty: boolean): ConflictInput {
  const input: ConflictInput = new ConflictInput(payload('doc', 1, '旧正文'),
    payload('doc', 3, '新正文'));
  input.localDirty = localDirty;
  input.remoteDirty = remoteDirty;
  return input;
}

function localNewerInput(localDirty: boolean, remoteDirty: boolean): ConflictInput {
  const input: ConflictInput = new ConflictInput(payload('doc', 5, '新正文'),
    payload('doc', 2, '旧正文'));
  input.localDirty = localDirty;
  input.remoteDirty = remoteDirty;
  return input;
}

function unknownInput(localDirty: boolean, remoteDirty: boolean): ConflictInput {
  const input: ConflictInput = new ConflictInput(payload('doc-a', 1, '甲正文'),
    payload('doc-b', 1, '乙正文'));
  input.localDirty = localDirty;
  input.remoteDirty = remoteDirty;
  return input;
}

export default function payloadRuleCasesTest(): void {
  describe('PayloadFieldCases', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADFIELDCASES_0100
     * @tc.name      testPayloadFieldCases0001
     * @tc.desc      Verify catalog shape and audit
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testPayloadFieldCases0001', 0, (): void => {
      expect(PAYLOAD_FIELDS.length).assertEqual(12);
      expect(fieldNames().length).assertEqual(12);
      expect(PAYLOAD_VERSION).assertEqual(3);
      expect(auditPayloadSchema().ok).assertTrue();
      expect(fieldsAt(1).length).assertEqual(5);
      expect(fieldsAt(2).length).assertEqual(9);
      expect(fieldsAt(3).length).assertEqual(12);
      expect(migrationChain(1).length).assertEqual(2);
      expect(migrationChain(2).length).assertEqual(1);
      expect(migrationChain(3).length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADFIELDCASES_0200
     * @tc.name      testPayloadFieldCases0002
     * @tc.desc      Verify version and document are mandatory
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPayloadFieldCases0002', 0, (): void => {
      const version = fieldOf('v');
      const doc = fieldOf('doc');
      expect(version?.required).assertTrue();
      expect(doc?.required).assertTrue();
      expect(version?.kind).assertEqual(PayloadKind.INTEGER);
      expect(doc?.kind).assertEqual(PayloadKind.IDENTIFIER);
      expect(doc?.accepts('doc-1')).assertTrue();
      expect(doc?.accepts('doc 1')).assertFalse();
      expect(version?.accepts('3')).assertTrue();
      expect(version?.accepts('v3')).assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADFIELDCASES_0300
     * @tc.name      testPayloadFieldCases0003
     * @tc.desc      Verify revision and cursor are integers
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPayloadFieldCases0003', 0, (): void => {
      const revision = fieldOf('rev');
      const cursorStart = fieldOf('cs');
      const cursorEnd = fieldOf('ce');
      expect(revision?.kind).assertEqual(PayloadKind.INTEGER);
      expect(cursorStart?.kind).assertEqual(PayloadKind.INTEGER);
      expect(cursorEnd?.kind).assertEqual(PayloadKind.INTEGER);
      expect(revision?.accepts('12')).assertTrue();
      expect(revision?.accepts('1.5')).assertFalse();
      expect(cursorStart?.accepts('0')).assertTrue();
      expect(cursorEnd?.accepts('-1')).assertTrue();
      expect(cursorStart?.since).assertEqual(2);
    });

    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADFIELDCASES_0400
     * @tc.name      testPayloadFieldCases0004
     * @tc.desc      Verify title and body are textual
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testPayloadFieldCases0004', 0, (): void => {
      const title = fieldOf('title');
      const body = fieldOf('body');
      expect(title?.kind).assertEqual(PayloadKind.TEXT);
      expect(body?.kind).assertEqual(PayloadKind.MULTILINE);
      expect(title?.maxLength).assertEqual(64);
      expect(body?.maxLength).assertEqual(4096);
      expect(title?.accepts('标题')).assertTrue();
      expect(title?.accepts('t'.repeat(65))).assertFalse();
      expect(body?.accepts('多行\n正文')).assertTrue();
      expect(body?.since).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADFIELDCASES_0500
     * @tc.name      testPayloadFieldCases0005
     * @tc.desc      Verify conflict flag is enum
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPayloadFieldCases0005', 0, (): void => {
      const flag = fieldOf('ck');
      expect(flag?.kind).assertEqual(PayloadKind.ENUM);
      expect(flag?.enumValues.length).assertEqual(5);
      expect(flag?.accepts('none')).assertTrue();
      expect(flag?.accepts('bothChanged')).assertTrue();
      expect(flag?.accepts('boom')).assertFalse();
      expect(flag?.coerce('boom')).assertEqual('none');
      expect(flag?.since).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADFIELDCASES_0600
     * @tc.name      testPayloadFieldCases0006
     * @tc.desc      Verify escape round trip for every rule
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPayloadFieldCases0006', 0, (): void => {
      const samples: string[] = ['a&b', 'a=b', '100%', '换行\n内容', '制表\t符', '普通', ''];
      samples.forEach((sample: string): void => {
        expect(unescapeValue(escapeValue(sample))).assertEqual(sample);
      });
      expect(escapeValue('&=')).assertEqual('%26%3D');
      expect(unescapeValue('%26%3D')).assertEqual('&=');
      expect(escapeValue('%')).assertEqual('%25');
    });

    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADFIELDCASES_0700
     * @tc.name      testPayloadFieldCases0007
     * @tc.desc      Verify round trip through codec
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPayloadFieldCases0007', 0, (): void => {
      const data: PayloadData = sealPayload(payload('doc-9', 4, '第一行\n第二行'));
      const encoded: string = encodePayload(data);
      const decoded = decodePayload(encoded);
      expect(decoded.ok()).assertTrue();
      expect(decoded.data?.doc).assertEqual('doc-9');
      expect(decoded.data?.rev).assertEqual(4);
      expect(decoded.data?.body).assertEqual('第一行\n第二行');
      expect(decoded.data?.selectionValid()).assertTrue();
      expect(decoded.issues.length).assertEqual(0);
      expect(sizeOf(data).chars).assertEqual(encoded.length);
      expect(utf8Length('中文')).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADFIELDCASES_0800
     * @tc.name      testPayloadFieldCases0008
     * @tc.desc      Verify decode rejects bad frames
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPayloadFieldCases0008', 0, (): void => {
      expect(decodePayload('').ok()).assertFalse();
      expect(decodePayload('v=3').ok()).assertFalse();
      expect(decodePayload('v=99&doc=a').ok()).assertFalse();
      expect(decodePayload('v=1&doc=a').ok()).assertTrue();
      expect(decodePayload('v=1&doc=a').migrated).assertTrue();
      expect(decodePayload('v=3&doc=a&ck=bad').warnOnly()).assertTrue();
      expect(decodePayload('v=3&doc=a&ck=bad').data?.ck).assertEqual('none');
      expect(decodePayload('doc=a&v=3&rev=2').data?.rev).assertEqual(2);
    });
  });

  describe('ReadinessRuleCases', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_READINESSRULECASES_0100
     * @tc.name      testReadinessRuleCases0001
     * @tc.desc      Verify low api needs upgrade
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReadinessRuleCases0001', 0, (): void => {
      const result = evaluateReadiness(readyContext(5, DeviceClass.PHONE, true));
      expect(result.rule?.ruleId).assertEqual('CR-01');
      expect(result.readiness).assertEqual(Readiness.NEED_UPGRADE);
      expect(isUnsupportedReadiness(result.readiness)).assertTrue();
      expect(canStart(result)).assertFalse();
      expect(result.text().indexOf('CR-01') > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_READINESSRULECASES_0200
     * @tc.name      testReadinessRuleCases0002
     * @tc.desc      Verify early wearable is unsupported
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReadinessRuleCases0002', 0, (): void => {
      const result = evaluateReadiness(readyContext(10, DeviceClass.WEARABLE, true));
      expect(result.rule?.ruleId).assertEqual('CR-02');
      expect(result.readiness).assertEqual(Readiness.UNSUPPORTED_DEVICE);
      expect(isUnsupportedReadiness(result.readiness)).assertTrue();
      expect(canStart(result)).assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_READINESSRULECASES_0300
     * @tc.name      testReadinessRuleCases0003
     * @tc.desc      Verify early tv is unsupported
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReadinessRuleCases0003', 0, (): void => {
      const result = evaluateReadiness(readyContext(10, DeviceClass.TV, true));
      expect(result.rule?.ruleId).assertEqual('CR-03');
      expect(result.readiness).assertEqual(Readiness.UNSUPPORTED_DEVICE);
      expect(needsUserAction(result.readiness)).assertFalse();
      expect(canStart(result)).assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_READINESSRULECASES_0400
     * @tc.name      testReadinessRuleCases0004
     * @tc.desc      Verify api9to11 phone needs permission
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReadinessRuleCases0004', 0, (): void => {
      const denied = evaluateReadiness(readyContext(10, DeviceClass.PHONE, false));
      expect(denied.rule?.ruleId).assertEqual('CR-04');
      expect(denied.readiness).assertEqual(Readiness.NEED_PERMISSION);
      expect(denied.downgradedByPermission).assertTrue();
      const granted = evaluateReadiness(readyContext(10, DeviceClass.PHONE, true));
      expect(granted.rule?.ruleId).assertEqual('CR-04');
      expect(granted.readiness).assertEqual(Readiness.READY);
      expect(canStart(granted)).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_READINESSRULECASES_0500
     * @tc.name      testReadinessRuleCases0005
     * @tc.desc      Verify api12 wearable is receive only
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReadinessRuleCases0005', 0, (): void => {
      const result = evaluateReadiness(readyContext(12, DeviceClass.WEARABLE, true));
      expect(result.rule?.ruleId).assertEqual('CR-05');
      expect(result.readiness).assertEqual(Readiness.UNSUPPORTED_DEVICE);
      expect(result.hint().length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_READINESSRULECASES_0600
     * @tc.name      testReadinessRuleCases0006
     * @tc.desc      Verify api12 big screen needs permission
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReadinessRuleCases0006', 0, (): void => {
      const denied = evaluateReadiness(readyContext(12, DeviceClass.TV, false));
      expect(denied.rule?.ruleId).assertEqual('CR-06');
      expect(denied.readiness).assertEqual(Readiness.NEED_PERMISSION);
      const granted = evaluateReadiness(readyContext(12, DeviceClass.PC, true));
      expect(granted.rule?.ruleId).assertEqual('CR-06');
      expect(granted.readiness).assertEqual(Readiness.READY);
      expect(canStart(granted)).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_READINESSRULECASES_0700
     * @tc.name      testReadinessRuleCases0007
     * @tc.desc      Verify api12 phone needs permission
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReadinessRuleCases0007', 0, (): void => {
      const result = evaluateReadiness(readyContext(13, DeviceClass.PHONE, false));
      expect(result.rule?.ruleId).assertEqual('CR-07');
      expect(result.readiness).assertEqual(Readiness.NEED_PERMISSION);
      expect(needsUserAction(result.readiness)).assertTrue();
      expect(result.hint().indexOf('权限') > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_READINESSRULECASES_0800
     * @tc.name      testReadinessRuleCases0008
     * @tc.desc      Verify api14 wearable still unsupported
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReadinessRuleCases0008', 0, (): void => {
      const result = evaluateReadiness(readyContext(15, DeviceClass.WEARABLE, true));
      expect(result.rule?.ruleId).assertEqual('CR-08');
      expect(result.readiness).assertEqual(Readiness.UNSUPPORTED_DEVICE);
      expect(canStart(result)).assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_READINESSRULECASES_0900
     * @tc.name      testReadinessRuleCases0009
     * @tc.desc      Verify api14to17 unified permission
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReadinessRuleCases0009', 0, (): void => {
      const phone = evaluateReadiness(readyContext(15, DeviceClass.PHONE, false));
      const tablet = evaluateReadiness(readyContext(15, DeviceClass.TABLET, false));
      expect(phone.rule?.ruleId).assertEqual('CR-09');
      expect(tablet.rule?.ruleId).assertEqual('CR-09');
      expect(phone.readiness).assertEqual(Readiness.NEED_PERMISSION);
      expect(tablet.readiness).assertEqual(Readiness.NEED_PERMISSION);
    });

    /**
     * @tc.number    SUB_CONTINUATION_READINESSRULECASES_1000
     * @tc.name      testReadinessRuleCases0010
     * @tc.desc      Verify api18to26 all devices
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReadinessRuleCases0010', 0, (): void => {
      const phone = evaluateReadiness(readyContext(20, DeviceClass.PHONE, true));
      const wearable = evaluateReadiness(readyContext(26, DeviceClass.WEARABLE, true));
      expect(phone.rule?.ruleId).assertEqual('CR-10');
      expect(wearable.rule?.ruleId).assertEqual('CR-10');
      expect(phone.readiness).assertEqual(Readiness.READY);
      expect(wearable.readiness).assertEqual(Readiness.READY);
      expect(canStart(wearable)).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_READINESSRULECASES_1100
     * @tc.name      testReadinessRuleCases0011
     * @tc.desc      Verify future api is unknown
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReadinessRuleCases0011', 0, (): void => {
      const result = evaluateReadiness(readyContext(28, DeviceClass.PHONE, true));
      expect(result.rule?.ruleId).assertEqual('CR-11');
      expect(result.readiness).assertEqual(Readiness.UNKNOWN);
      expect(isUnsupportedReadiness(result.readiness)).assertFalse();
      expect(canStart(result)).assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_READINESSRULECASES_1200
     * @tc.name      testReadinessRuleCases0012
     * @tc.desc      Verify unknown device is unknown
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReadinessRuleCases0012', 0, (): void => {
      const result = evaluateReadiness(readyContext(24, DeviceClass.UNKNOWN, true));
      expect(result.rule?.ruleId).assertEqual('CR-12');
      expect(result.readiness).assertEqual(Readiness.UNKNOWN);
      expect(readinessLabel(result.readiness)).assertEqual('无法判断');
      expect(readinessRuleLines().length).assertEqual(12);
      expect(auditReadinessRules().ok).assertTrue();
    });
  });

  describe('ConflictRuleCases', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTRULECASES_0100
     * @tc.name      testConflictRuleCases0001
     * @tc.desc      Verify none without dirty keeps local
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testConflictRuleCases0001', 0, (): void => {
      const input = noneInput(false, false);
      expect(classify(input)).assertEqual(ConflictKind.NONE);
      const decision = decide(input);
      expect(decision.rule?.ruleId).assertEqual('CF-01');
      expect(decision.resolution).assertEqual(Resolution.KEEP_LOCAL);
      expect(decision.confirm()).assertFalse();
      expect(decision.text().indexOf('CF-01') > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTRULECASES_0200
     * @tc.name      testConflictRuleCases0002
     * @tc.desc      Verify none with local dirty keeps local
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testConflictRuleCases0002', 0, (): void => {
      const decision = decide(noneInput(true, false));
      expect(decision.kind).assertEqual(ConflictKind.NONE);
      expect(decision.rule?.ruleId).assertEqual('CF-02');
      expect(decision.resolution).assertEqual(Resolution.KEEP_LOCAL);
      expect(losesContent(decision.resolution)).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTRULECASES_0300
     * @tc.name      testConflictRuleCases0003
     * @tc.desc      Verify none with remote dirty takes remote
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testConflictRuleCases0003', 0, (): void => {
      const decision = decide(noneInput(false, true));
      expect(decision.rule?.ruleId).assertEqual('CF-03');
      expect(decision.resolution).assertEqual(Resolution.KEEP_REMOTE);
      expect(applyResolution(noneInput(false, true), decision).data.body)
        .assertEqual('同一段正文');
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTRULECASES_0400
     * @tc.name      testConflictRuleCases0004
     * @tc.desc      Verify both dirty needs confirmation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testConflictRuleCases0004', 0, (): void => {
      const input: ConflictInput = noneInput(true, true);
      expect(classify(input)).assertEqual(ConflictKind.BOTH_CHANGED);
      const decision = decide(input);
      expect(decision.rule?.ruleId).assertEqual('CF-24');
      expect(decision.resolution).assertEqual(Resolution.ASK_USER);
      expect(decision.confirm()).assertTrue();
      expect(applyResolution(input, decision).notes.length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTRULECASES_0500
     * @tc.name      testConflictRuleCases0005
     * @tc.desc      Verify remote only adopts remote
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testConflictRuleCases0005', 0, (): void => {
      const decision = decide(remoteOnlyInput(false, false));
      expect(classify(remoteOnlyInput(false, false))).assertEqual(ConflictKind.REMOTE_ONLY);
      expect(decision.rule?.ruleId).assertEqual('CF-05');
      expect(decision.resolution).assertEqual(Resolution.KEEP_REMOTE);
      expect(applyResolution(remoteOnlyInput(false, false), decision).data.body)
        .assertEqual('对端正文');
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTRULECASES_0600
     * @tc.name      testConflictRuleCases0006
     * @tc.desc      Verify remote only with local dirty merges
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testConflictRuleCases0006', 0, (): void => {
      const decision = decide(remoteOnlyInput(true, true));
      expect(decision.rule?.ruleId).assertEqual('CF-08');
      expect(decision.resolution).assertEqual(Resolution.MERGE_PREFER_REMOTE);
      expect(decision.confirm()).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTRULECASES_0700
     * @tc.name      testConflictRuleCases0007
     * @tc.desc      Verify local only keeps local
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testConflictRuleCases0007', 0, (): void => {
      const decision = decide(localOnlyInput(false, false));
      expect(classify(localOnlyInput(false, false))).assertEqual(ConflictKind.LOCAL_ONLY);
      expect(decision.rule?.ruleId).assertEqual('CF-09');
      expect(decision.resolution).assertEqual(Resolution.KEEP_LOCAL);
      expect(applyResolution(localOnlyInput(false, false), decision).data.body)
        .assertEqual('本机正文');
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTRULECASES_0800
     * @tc.name      testConflictRuleCases0008
     * @tc.desc      Verify local only with remote dirty merges
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testConflictRuleCases0008', 0, (): void => {
      const decision = decide(localOnlyInput(false, true));
      expect(decision.rule?.ruleId).assertEqual('CF-11');
      expect(decision.resolution).assertEqual(Resolution.MERGE_PREFER_LOCAL);
      expect(decision.confirm()).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTRULECASES_0900
     * @tc.name      testConflictRuleCases0009
     * @tc.desc      Verify remote newer adopts remote
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testConflictRuleCases0009', 0, (): void => {
      const input = remoteNewerInput(false, false);
      expect(classify(input)).assertEqual(ConflictKind.REMOTE_NEWER);
      const decision = decide(input);
      expect(decision.rule?.ruleId).assertEqual('CF-13');
      expect(decision.resolution).assertEqual(Resolution.KEEP_REMOTE);
      expect(applyResolution(input, decision).data.rev).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTRULECASES_1000
     * @tc.name      testConflictRuleCases0010
     * @tc.desc      Verify remote newer with local dirty merges
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testConflictRuleCases0010', 0, (): void => {
      const decision = decide(remoteNewerInput(true, false));
      expect(decision.rule?.ruleId).assertEqual('CF-14');
      expect(decision.resolution).assertEqual(Resolution.MERGE_PREFER_LOCAL);
      const merged = applyResolution(remoteNewerInput(true, false), decision);
      expect(merged.data.body.indexOf('旧正文') >= 0).assertTrue();
      expect(merged.data.body.indexOf('新正文') >= 0).assertTrue();
      expect(merged.notes.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTRULECASES_1100
     * @tc.name      testConflictRuleCases0011
     * @tc.desc      Verify local newer keeps local
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testConflictRuleCases0011', 0, (): void => {
      const input = localNewerInput(false, false);
      expect(classify(input)).assertEqual(ConflictKind.LOCAL_NEWER);
      const decision = decide(input);
      expect(decision.rule?.ruleId).assertEqual('CF-17');
      expect(decision.resolution).assertEqual(Resolution.KEEP_LOCAL);
      expect(applyResolution(input, decision).data.rev).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTRULECASES_1200
     * @tc.name      testConflictRuleCases0012
     * @tc.desc      Verify local newer with remote dirty merges
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testConflictRuleCases0012', 0, (): void => {
      const decision = decide(localNewerInput(false, true));
      expect(decision.rule?.ruleId).assertEqual('CF-19');
      expect(decision.resolution).assertEqual(Resolution.MERGE_PREFER_REMOTE);
      expect(decision.confirm()).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTRULECASES_1300
     * @tc.name      testConflictRuleCases0013
     * @tc.desc      Verify unknown document discards remote
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testConflictRuleCases0013', 0, (): void => {
      const input = unknownInput(false, true);
      expect(classify(input)).assertEqual(ConflictKind.UNKNOWN);
      const decision = decide(input);
      expect(decision.rule?.ruleId).assertEqual('CF-26');
      expect(decision.resolution).assertEqual(Resolution.DISCARD_REMOTE);
      expect(losesContent(decision.resolution)).assertTrue();
      expect(applyResolution(input, decision).data.doc).assertEqual('doc-a');
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTRULECASES_1400
     * @tc.name      testConflictRuleCases0014
     * @tc.desc      Verify unknown document keeps local when dirty
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testConflictRuleCases0014', 0, (): void => {
      const decision = decide(unknownInput(true, false));
      expect(decision.rule?.ruleId).assertEqual('CF-27');
      expect(decision.resolution).assertEqual(Resolution.KEEP_LOCAL);
      expect(decision.confirm()).assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTRULECASES_1500
     * @tc.name      testConflictRuleCases0015
     * @tc.desc      Verify both changed merges line by line
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testConflictRuleCases0015', 0, (): void => {
      const local: PayloadData = payload('doc', 2, 'a\nb');
      const remote: PayloadData = payload('doc', 2, 'b\nc');
      const input: ConflictInput = new ConflictInput(local, remote);
      input.localDirty = true;
      const decision = decide(input);
      expect(classify(input)).assertEqual(ConflictKind.BOTH_CHANGED);
      expect(decision.rule?.ruleId).assertEqual('CF-22');
      const merged = applyResolution(input, decision);
      expect(merged.data.body).assertEqual('a\nb\nc');
      expect(merged.data.rev).assertEqual(2);
      expect(merged.data.ck).assertEqual('bothChanged');
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTRULECASES_1600
     * @tc.name      testConflictRuleCases0016
     * @tc.desc      Verify rule table and labels stay consistent
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testConflictRuleCases0016', 0, (): void => {
      expect(CONFLICT_RULES.length).assertEqual(28);
      expect(conflictRuleLines().length).assertEqual(28);
      expect(auditConflictRules().ok).assertTrue();
      expect(resolutionLabel(Resolution.KEEP_REMOTE)).assertEqual('采用对端');
      expect(conflictLabel(ConflictKind.REMOTE_ONLY)).assertEqual('仅对端有内容');
      expect(needsConfirmation(Resolution.ASK_USER)).assertTrue();
      expect(needsConfirmation(Resolution.APPEND_REMOTE)).assertFalse();
      CONFLICT_RULES.forEach((rule): void => {
        expect(rule.ruleId.indexOf('CF-') === 0).assertTrue();
        expect(rule.reason.length > 0).assertTrue();
        expect(rule.resolution !== undefined).assertTrue();
      });
    });
  });
}

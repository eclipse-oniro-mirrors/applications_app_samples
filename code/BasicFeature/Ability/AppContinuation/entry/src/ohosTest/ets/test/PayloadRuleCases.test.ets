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
     * @tc.name      com.samples.appcontinuation_PayloadFieldCases_0001
     * @tc.desc      Verify catalog shape and audit
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it(BUNDLE + '_PayloadFieldCases_0001', 0, (): void => {
      loggedExpect(PAYLOAD_FIELDS.length, 'PayloadRuleCases.test.ets:A0001', BUNDLE + '_PayloadFieldCases_0001').assertEqual(12);
      loggedExpect(fieldNames().length, 'PayloadRuleCases.test.ets:A0002', BUNDLE + '_PayloadFieldCases_0001').assertEqual(12);
      loggedExpect(PAYLOAD_VERSION, 'PayloadRuleCases.test.ets:A0003', BUNDLE + '_PayloadFieldCases_0001').assertEqual(3);
      loggedExpect(auditPayloadSchema().ok, 'PayloadRuleCases.test.ets:A0004', BUNDLE + '_PayloadFieldCases_0001').assertTrue();
      loggedExpect(fieldsAt(1).length, 'PayloadRuleCases.test.ets:A0005', BUNDLE + '_PayloadFieldCases_0001').assertEqual(5);
      loggedExpect(fieldsAt(2).length, 'PayloadRuleCases.test.ets:A0006', BUNDLE + '_PayloadFieldCases_0001').assertEqual(9);
      loggedExpect(fieldsAt(3).length, 'PayloadRuleCases.test.ets:A0007', BUNDLE + '_PayloadFieldCases_0001').assertEqual(12);
      loggedExpect(migrationChain(1).length, 'PayloadRuleCases.test.ets:A0008', BUNDLE + '_PayloadFieldCases_0001').assertEqual(2);
      loggedExpect(migrationChain(2).length, 'PayloadRuleCases.test.ets:A0009', BUNDLE + '_PayloadFieldCases_0001').assertEqual(1);
      loggedExpect(migrationChain(3).length, 'PayloadRuleCases.test.ets:A0010', BUNDLE + '_PayloadFieldCases_0001').assertEqual(0);
    });

    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADFIELDCASES_0200
     * @tc.name      com.samples.appcontinuation_PayloadFieldCases_0002
     * @tc.desc      Verify version and document are mandatory
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_PayloadFieldCases_0002', 0, (): void => {
      const version = fieldOf('v');
      const doc = fieldOf('doc');
      loggedExpect(version?.required, 'PayloadRuleCases.test.ets:A0011', BUNDLE + '_PayloadFieldCases_0002').assertTrue();
      loggedExpect(doc?.required, 'PayloadRuleCases.test.ets:A0012', BUNDLE + '_PayloadFieldCases_0002').assertTrue();
      loggedExpect(version?.kind, 'PayloadRuleCases.test.ets:A0013', BUNDLE + '_PayloadFieldCases_0002').assertEqual(PayloadKind.INTEGER);
      loggedExpect(doc?.kind, 'PayloadRuleCases.test.ets:A0014', BUNDLE + '_PayloadFieldCases_0002').assertEqual(PayloadKind.IDENTIFIER);
      loggedExpect(doc?.accepts('doc-1'), 'PayloadRuleCases.test.ets:A0015', BUNDLE + '_PayloadFieldCases_0002').assertTrue();
      loggedExpect(doc?.accepts('doc 1'), 'PayloadRuleCases.test.ets:A0016', BUNDLE + '_PayloadFieldCases_0002').assertFalse();
      loggedExpect(version?.accepts('3'), 'PayloadRuleCases.test.ets:A0017', BUNDLE + '_PayloadFieldCases_0002').assertTrue();
      loggedExpect(version?.accepts('v3'), 'PayloadRuleCases.test.ets:A0018', BUNDLE + '_PayloadFieldCases_0002').assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADFIELDCASES_0300
     * @tc.name      com.samples.appcontinuation_PayloadFieldCases_0003
     * @tc.desc      Verify revision and cursor are integers
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_PayloadFieldCases_0003', 0, (): void => {
      const revision = fieldOf('rev');
      const cursorStart = fieldOf('cs');
      const cursorEnd = fieldOf('ce');
      loggedExpect(revision?.kind, 'PayloadRuleCases.test.ets:A0019', BUNDLE + '_PayloadFieldCases_0003').assertEqual(PayloadKind.INTEGER);
      loggedExpect(cursorStart?.kind, 'PayloadRuleCases.test.ets:A0020', BUNDLE + '_PayloadFieldCases_0003').assertEqual(PayloadKind.INTEGER);
      loggedExpect(cursorEnd?.kind, 'PayloadRuleCases.test.ets:A0021', BUNDLE + '_PayloadFieldCases_0003').assertEqual(PayloadKind.INTEGER);
      loggedExpect(revision?.accepts('12'), 'PayloadRuleCases.test.ets:A0022', BUNDLE + '_PayloadFieldCases_0003').assertTrue();
      loggedExpect(revision?.accepts('1.5'), 'PayloadRuleCases.test.ets:A0023', BUNDLE + '_PayloadFieldCases_0003').assertFalse();
      loggedExpect(cursorStart?.accepts('0'), 'PayloadRuleCases.test.ets:A0024', BUNDLE + '_PayloadFieldCases_0003').assertTrue();
      loggedExpect(cursorEnd?.accepts('-1'), 'PayloadRuleCases.test.ets:A0025', BUNDLE + '_PayloadFieldCases_0003').assertTrue();
      loggedExpect(cursorStart?.since, 'PayloadRuleCases.test.ets:A0026', BUNDLE + '_PayloadFieldCases_0003').assertEqual(2);
    });

    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADFIELDCASES_0400
     * @tc.name      com.samples.appcontinuation_PayloadFieldCases_0004
     * @tc.desc      Verify title and body are textual
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it(BUNDLE + '_PayloadFieldCases_0004', 0, (): void => {
      const title = fieldOf('title');
      const body = fieldOf('body');
      loggedExpect(title?.kind, 'PayloadRuleCases.test.ets:A0027', BUNDLE + '_PayloadFieldCases_0004').assertEqual(PayloadKind.TEXT);
      loggedExpect(body?.kind, 'PayloadRuleCases.test.ets:A0028', BUNDLE + '_PayloadFieldCases_0004').assertEqual(PayloadKind.MULTILINE);
      loggedExpect(title?.maxLength, 'PayloadRuleCases.test.ets:A0029', BUNDLE + '_PayloadFieldCases_0004').assertEqual(64);
      loggedExpect(body?.maxLength, 'PayloadRuleCases.test.ets:A0030', BUNDLE + '_PayloadFieldCases_0004').assertEqual(4096);
      loggedExpect(title?.accepts('标题'), 'PayloadRuleCases.test.ets:A0031', BUNDLE + '_PayloadFieldCases_0004').assertTrue();
      loggedExpect(title?.accepts('t'.repeat(65)), 'PayloadRuleCases.test.ets:A0032', BUNDLE + '_PayloadFieldCases_0004').assertFalse();
      loggedExpect(body?.accepts('多行\n正文'), 'PayloadRuleCases.test.ets:A0033', BUNDLE + '_PayloadFieldCases_0004').assertTrue();
      loggedExpect(body?.since, 'PayloadRuleCases.test.ets:A0034', BUNDLE + '_PayloadFieldCases_0004').assertEqual(1);
    });

    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADFIELDCASES_0500
     * @tc.name      com.samples.appcontinuation_PayloadFieldCases_0005
     * @tc.desc      Verify conflict flag is enum
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_PayloadFieldCases_0005', 0, (): void => {
      const flag = fieldOf('ck');
      loggedExpect(flag?.kind, 'PayloadRuleCases.test.ets:A0035', BUNDLE + '_PayloadFieldCases_0005').assertEqual(PayloadKind.ENUM);
      loggedExpect(flag?.enumValues.length, 'PayloadRuleCases.test.ets:A0036', BUNDLE + '_PayloadFieldCases_0005').assertEqual(5);
      loggedExpect(flag?.accepts('none'), 'PayloadRuleCases.test.ets:A0037', BUNDLE + '_PayloadFieldCases_0005').assertTrue();
      loggedExpect(flag?.accepts('bothChanged'), 'PayloadRuleCases.test.ets:A0038', BUNDLE + '_PayloadFieldCases_0005').assertTrue();
      loggedExpect(flag?.accepts('boom'), 'PayloadRuleCases.test.ets:A0039', BUNDLE + '_PayloadFieldCases_0005').assertFalse();
      loggedExpect(flag?.coerce('boom'), 'PayloadRuleCases.test.ets:A0040', BUNDLE + '_PayloadFieldCases_0005').assertEqual('none');
      loggedExpect(flag?.since, 'PayloadRuleCases.test.ets:A0041', BUNDLE + '_PayloadFieldCases_0005').assertEqual(3);
    });

    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADFIELDCASES_0600
     * @tc.name      com.samples.appcontinuation_PayloadFieldCases_0006
     * @tc.desc      Verify escape round trip for every rule
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_PayloadFieldCases_0006', 0, (): void => {
      const samples: string[] = ['a&b', 'a=b', '100%', '换行\n内容', '制表\t符', '普通', ''];
      samples.forEach((sample: string): void => {
        loggedExpect(unescapeValue(escapeValue(sample)), 'PayloadRuleCases.test.ets:A0042', BUNDLE + '_PayloadFieldCases_0006').assertEqual(sample);
      });
      loggedExpect(escapeValue('&='), 'PayloadRuleCases.test.ets:A0043', BUNDLE + '_PayloadFieldCases_0006').assertEqual('%26%3D');
      loggedExpect(unescapeValue('%26%3D'), 'PayloadRuleCases.test.ets:A0044', BUNDLE + '_PayloadFieldCases_0006').assertEqual('&=');
      loggedExpect(escapeValue('%'), 'PayloadRuleCases.test.ets:A0045', BUNDLE + '_PayloadFieldCases_0006').assertEqual('%25');
    });

    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADFIELDCASES_0700
     * @tc.name      com.samples.appcontinuation_PayloadFieldCases_0007
     * @tc.desc      Verify round trip through codec
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_PayloadFieldCases_0007', 0, (): void => {
      const data: PayloadData = sealPayload(payload('doc-9', 4, '第一行\n第二行'));
      const encoded: string = encodePayload(data);
      const decoded = decodePayload(encoded);
      loggedExpect(decoded.ok(), 'PayloadRuleCases.test.ets:A0046', BUNDLE + '_PayloadFieldCases_0007').assertTrue();
      loggedExpect(decoded.data?.doc, 'PayloadRuleCases.test.ets:A0047', BUNDLE + '_PayloadFieldCases_0007').assertEqual('doc-9');
      loggedExpect(decoded.data?.rev, 'PayloadRuleCases.test.ets:A0048', BUNDLE + '_PayloadFieldCases_0007').assertEqual(4);
      loggedExpect(decoded.data?.body, 'PayloadRuleCases.test.ets:A0049', BUNDLE + '_PayloadFieldCases_0007').assertEqual('第一行\n第二行');
      loggedExpect(decoded.data?.selectionValid(), 'PayloadRuleCases.test.ets:A0050', BUNDLE + '_PayloadFieldCases_0007').assertTrue();
      loggedExpect(decoded.issues.length, 'PayloadRuleCases.test.ets:A0051', BUNDLE + '_PayloadFieldCases_0007').assertEqual(0);
      loggedExpect(sizeOf(data).chars, 'PayloadRuleCases.test.ets:A0052', BUNDLE + '_PayloadFieldCases_0007').assertEqual(encoded.length);
      loggedExpect(utf8Length('中文'), 'PayloadRuleCases.test.ets:A0053', BUNDLE + '_PayloadFieldCases_0007').assertEqual(6);
    });

    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADFIELDCASES_0800
     * @tc.name      com.samples.appcontinuation_PayloadFieldCases_0008
     * @tc.desc      Verify decode rejects bad frames
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_PayloadFieldCases_0008', 0, (): void => {
      loggedExpect(decodePayload('').ok(), 'PayloadRuleCases.test.ets:A0054', BUNDLE + '_PayloadFieldCases_0008').assertFalse();
      loggedExpect(decodePayload('v=3').ok(), 'PayloadRuleCases.test.ets:A0055', BUNDLE + '_PayloadFieldCases_0008').assertFalse();
      loggedExpect(decodePayload('v=99&doc=a').ok(), 'PayloadRuleCases.test.ets:A0056', BUNDLE + '_PayloadFieldCases_0008').assertFalse();
      loggedExpect(decodePayload('v=1&doc=a').ok(), 'PayloadRuleCases.test.ets:A0057', BUNDLE + '_PayloadFieldCases_0008').assertTrue();
      loggedExpect(decodePayload('v=1&doc=a').migrated, 'PayloadRuleCases.test.ets:A0058', BUNDLE + '_PayloadFieldCases_0008').assertTrue();
      loggedExpect(decodePayload('v=3&doc=a&ck=bad').warnOnly(), 'PayloadRuleCases.test.ets:A0059', BUNDLE + '_PayloadFieldCases_0008').assertTrue();
      loggedExpect(decodePayload('v=3&doc=a&ck=bad').data?.ck, 'PayloadRuleCases.test.ets:A0060', BUNDLE + '_PayloadFieldCases_0008').assertEqual('none');
      loggedExpect(decodePayload('doc=a&v=3&rev=2').data?.rev, 'PayloadRuleCases.test.ets:A0061', BUNDLE + '_PayloadFieldCases_0008').assertEqual(2);
    });
  });

  describe('ReadinessRuleCases', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_READINESSRULECASES_0100
     * @tc.name      com.samples.appcontinuation_ReadinessRuleCases_0001
     * @tc.desc      Verify low api needs upgrade
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ReadinessRuleCases_0001', 0, (): void => {
      const result = evaluateReadiness(readyContext(5, DeviceClass.PHONE, true));
      loggedExpect(result.rule?.ruleId, 'PayloadRuleCases.test.ets:A0062', BUNDLE + '_ReadinessRuleCases_0001').assertEqual('CR-01');
      loggedExpect(result.readiness, 'PayloadRuleCases.test.ets:A0063', BUNDLE + '_ReadinessRuleCases_0001').assertEqual(Readiness.NEED_UPGRADE);
      loggedExpect(isUnsupportedReadiness(result.readiness), 'PayloadRuleCases.test.ets:A0064', BUNDLE + '_ReadinessRuleCases_0001').assertTrue();
      loggedExpect(canStart(result), 'PayloadRuleCases.test.ets:A0065', BUNDLE + '_ReadinessRuleCases_0001').assertFalse();
      loggedExpect(result.text().indexOf('CR-01') > 0, 'PayloadRuleCases.test.ets:A0066', BUNDLE + '_ReadinessRuleCases_0001').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_READINESSRULECASES_0200
     * @tc.name      com.samples.appcontinuation_ReadinessRuleCases_0002
     * @tc.desc      Verify early wearable is unsupported
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ReadinessRuleCases_0002', 0, (): void => {
      const result = evaluateReadiness(readyContext(10, DeviceClass.WEARABLE, true));
      loggedExpect(result.rule?.ruleId, 'PayloadRuleCases.test.ets:A0067', BUNDLE + '_ReadinessRuleCases_0002').assertEqual('CR-02');
      loggedExpect(result.readiness, 'PayloadRuleCases.test.ets:A0068', BUNDLE + '_ReadinessRuleCases_0002').assertEqual(Readiness.UNSUPPORTED_DEVICE);
      loggedExpect(isUnsupportedReadiness(result.readiness), 'PayloadRuleCases.test.ets:A0069', BUNDLE + '_ReadinessRuleCases_0002').assertTrue();
      loggedExpect(canStart(result), 'PayloadRuleCases.test.ets:A0070', BUNDLE + '_ReadinessRuleCases_0002').assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_READINESSRULECASES_0300
     * @tc.name      com.samples.appcontinuation_ReadinessRuleCases_0003
     * @tc.desc      Verify early tv is unsupported
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ReadinessRuleCases_0003', 0, (): void => {
      const result = evaluateReadiness(readyContext(10, DeviceClass.TV, true));
      loggedExpect(result.rule?.ruleId, 'PayloadRuleCases.test.ets:A0071', BUNDLE + '_ReadinessRuleCases_0003').assertEqual('CR-03');
      loggedExpect(result.readiness, 'PayloadRuleCases.test.ets:A0072', BUNDLE + '_ReadinessRuleCases_0003').assertEqual(Readiness.UNSUPPORTED_DEVICE);
      loggedExpect(needsUserAction(result.readiness), 'PayloadRuleCases.test.ets:A0073', BUNDLE + '_ReadinessRuleCases_0003').assertFalse();
      loggedExpect(canStart(result), 'PayloadRuleCases.test.ets:A0074', BUNDLE + '_ReadinessRuleCases_0003').assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_READINESSRULECASES_0400
     * @tc.name      com.samples.appcontinuation_ReadinessRuleCases_0004
     * @tc.desc      Verify api9to11 phone needs permission
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ReadinessRuleCases_0004', 0, (): void => {
      const denied = evaluateReadiness(readyContext(10, DeviceClass.PHONE, false));
      loggedExpect(denied.rule?.ruleId, 'PayloadRuleCases.test.ets:A0075', BUNDLE + '_ReadinessRuleCases_0004').assertEqual('CR-04');
      loggedExpect(denied.readiness, 'PayloadRuleCases.test.ets:A0076', BUNDLE + '_ReadinessRuleCases_0004').assertEqual(Readiness.NEED_PERMISSION);
      loggedExpect(denied.downgradedByPermission, 'PayloadRuleCases.test.ets:A0077', BUNDLE + '_ReadinessRuleCases_0004').assertTrue();
      const granted = evaluateReadiness(readyContext(10, DeviceClass.PHONE, true));
      loggedExpect(granted.rule?.ruleId, 'PayloadRuleCases.test.ets:A0078', BUNDLE + '_ReadinessRuleCases_0004').assertEqual('CR-04');
      loggedExpect(granted.readiness, 'PayloadRuleCases.test.ets:A0079', BUNDLE + '_ReadinessRuleCases_0004').assertEqual(Readiness.READY);
      loggedExpect(canStart(granted), 'PayloadRuleCases.test.ets:A0080', BUNDLE + '_ReadinessRuleCases_0004').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_READINESSRULECASES_0500
     * @tc.name      com.samples.appcontinuation_ReadinessRuleCases_0005
     * @tc.desc      Verify api12 wearable is receive only
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ReadinessRuleCases_0005', 0, (): void => {
      const result = evaluateReadiness(readyContext(12, DeviceClass.WEARABLE, true));
      loggedExpect(result.rule?.ruleId, 'PayloadRuleCases.test.ets:A0081', BUNDLE + '_ReadinessRuleCases_0005').assertEqual('CR-05');
      loggedExpect(result.readiness, 'PayloadRuleCases.test.ets:A0082', BUNDLE + '_ReadinessRuleCases_0005').assertEqual(Readiness.UNSUPPORTED_DEVICE);
      loggedExpect(result.hint().length > 0, 'PayloadRuleCases.test.ets:A0083', BUNDLE + '_ReadinessRuleCases_0005').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_READINESSRULECASES_0600
     * @tc.name      com.samples.appcontinuation_ReadinessRuleCases_0006
     * @tc.desc      Verify api12 big screen needs permission
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ReadinessRuleCases_0006', 0, (): void => {
      const denied = evaluateReadiness(readyContext(12, DeviceClass.TV, false));
      loggedExpect(denied.rule?.ruleId, 'PayloadRuleCases.test.ets:A0084', BUNDLE + '_ReadinessRuleCases_0006').assertEqual('CR-06');
      loggedExpect(denied.readiness, 'PayloadRuleCases.test.ets:A0085', BUNDLE + '_ReadinessRuleCases_0006').assertEqual(Readiness.NEED_PERMISSION);
      const granted = evaluateReadiness(readyContext(12, DeviceClass.PC, true));
      loggedExpect(granted.rule?.ruleId, 'PayloadRuleCases.test.ets:A0086', BUNDLE + '_ReadinessRuleCases_0006').assertEqual('CR-06');
      loggedExpect(granted.readiness, 'PayloadRuleCases.test.ets:A0087', BUNDLE + '_ReadinessRuleCases_0006').assertEqual(Readiness.READY);
      loggedExpect(canStart(granted), 'PayloadRuleCases.test.ets:A0088', BUNDLE + '_ReadinessRuleCases_0006').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_READINESSRULECASES_0700
     * @tc.name      com.samples.appcontinuation_ReadinessRuleCases_0007
     * @tc.desc      Verify api12 phone needs permission
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ReadinessRuleCases_0007', 0, (): void => {
      const result = evaluateReadiness(readyContext(13, DeviceClass.PHONE, false));
      loggedExpect(result.rule?.ruleId, 'PayloadRuleCases.test.ets:A0089', BUNDLE + '_ReadinessRuleCases_0007').assertEqual('CR-07');
      loggedExpect(result.readiness, 'PayloadRuleCases.test.ets:A0090', BUNDLE + '_ReadinessRuleCases_0007').assertEqual(Readiness.NEED_PERMISSION);
      loggedExpect(needsUserAction(result.readiness), 'PayloadRuleCases.test.ets:A0091', BUNDLE + '_ReadinessRuleCases_0007').assertTrue();
      loggedExpect(result.hint().indexOf('权限') > 0, 'PayloadRuleCases.test.ets:A0092', BUNDLE + '_ReadinessRuleCases_0007').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_READINESSRULECASES_0800
     * @tc.name      com.samples.appcontinuation_ReadinessRuleCases_0008
     * @tc.desc      Verify api14 wearable still unsupported
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ReadinessRuleCases_0008', 0, (): void => {
      const result = evaluateReadiness(readyContext(15, DeviceClass.WEARABLE, true));
      loggedExpect(result.rule?.ruleId, 'PayloadRuleCases.test.ets:A0093', BUNDLE + '_ReadinessRuleCases_0008').assertEqual('CR-08');
      loggedExpect(result.readiness, 'PayloadRuleCases.test.ets:A0094', BUNDLE + '_ReadinessRuleCases_0008').assertEqual(Readiness.UNSUPPORTED_DEVICE);
      loggedExpect(canStart(result), 'PayloadRuleCases.test.ets:A0095', BUNDLE + '_ReadinessRuleCases_0008').assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_READINESSRULECASES_0900
     * @tc.name      com.samples.appcontinuation_ReadinessRuleCases_0009
     * @tc.desc      Verify api14to17 unified permission
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ReadinessRuleCases_0009', 0, (): void => {
      const phone = evaluateReadiness(readyContext(15, DeviceClass.PHONE, false));
      const tablet = evaluateReadiness(readyContext(15, DeviceClass.TABLET, false));
      loggedExpect(phone.rule?.ruleId, 'PayloadRuleCases.test.ets:A0096', BUNDLE + '_ReadinessRuleCases_0009').assertEqual('CR-09');
      loggedExpect(tablet.rule?.ruleId, 'PayloadRuleCases.test.ets:A0097', BUNDLE + '_ReadinessRuleCases_0009').assertEqual('CR-09');
      loggedExpect(phone.readiness, 'PayloadRuleCases.test.ets:A0098', BUNDLE + '_ReadinessRuleCases_0009').assertEqual(Readiness.NEED_PERMISSION);
      loggedExpect(tablet.readiness, 'PayloadRuleCases.test.ets:A0099', BUNDLE + '_ReadinessRuleCases_0009').assertEqual(Readiness.NEED_PERMISSION);
    });

    /**
     * @tc.number    SUB_CONTINUATION_READINESSRULECASES_1000
     * @tc.name      com.samples.appcontinuation_ReadinessRuleCases_0010
     * @tc.desc      Verify api18to26 all devices
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ReadinessRuleCases_0010', 0, (): void => {
      const phone = evaluateReadiness(readyContext(20, DeviceClass.PHONE, true));
      const wearable = evaluateReadiness(readyContext(26, DeviceClass.WEARABLE, true));
      loggedExpect(phone.rule?.ruleId, 'PayloadRuleCases.test.ets:A0100', BUNDLE + '_ReadinessRuleCases_0010').assertEqual('CR-10');
      loggedExpect(wearable.rule?.ruleId, 'PayloadRuleCases.test.ets:A0101', BUNDLE + '_ReadinessRuleCases_0010').assertEqual('CR-10');
      loggedExpect(phone.readiness, 'PayloadRuleCases.test.ets:A0102', BUNDLE + '_ReadinessRuleCases_0010').assertEqual(Readiness.READY);
      loggedExpect(wearable.readiness, 'PayloadRuleCases.test.ets:A0103', BUNDLE + '_ReadinessRuleCases_0010').assertEqual(Readiness.READY);
      loggedExpect(canStart(wearable), 'PayloadRuleCases.test.ets:A0104', BUNDLE + '_ReadinessRuleCases_0010').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_READINESSRULECASES_1100
     * @tc.name      com.samples.appcontinuation_ReadinessRuleCases_0011
     * @tc.desc      Verify future api is unknown
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ReadinessRuleCases_0011', 0, (): void => {
      const result = evaluateReadiness(readyContext(28, DeviceClass.PHONE, true));
      loggedExpect(result.rule?.ruleId, 'PayloadRuleCases.test.ets:A0105', BUNDLE + '_ReadinessRuleCases_0011').assertEqual('CR-11');
      loggedExpect(result.readiness, 'PayloadRuleCases.test.ets:A0106', BUNDLE + '_ReadinessRuleCases_0011').assertEqual(Readiness.UNKNOWN);
      loggedExpect(isUnsupportedReadiness(result.readiness), 'PayloadRuleCases.test.ets:A0107', BUNDLE + '_ReadinessRuleCases_0011').assertFalse();
      loggedExpect(canStart(result), 'PayloadRuleCases.test.ets:A0108', BUNDLE + '_ReadinessRuleCases_0011').assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_READINESSRULECASES_1200
     * @tc.name      com.samples.appcontinuation_ReadinessRuleCases_0012
     * @tc.desc      Verify unknown device is unknown
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ReadinessRuleCases_0012', 0, (): void => {
      const result = evaluateReadiness(readyContext(24, DeviceClass.UNKNOWN, true));
      loggedExpect(result.rule?.ruleId, 'PayloadRuleCases.test.ets:A0109', BUNDLE + '_ReadinessRuleCases_0012').assertEqual('CR-12');
      loggedExpect(result.readiness, 'PayloadRuleCases.test.ets:A0110', BUNDLE + '_ReadinessRuleCases_0012').assertEqual(Readiness.UNKNOWN);
      loggedExpect(readinessLabel(result.readiness), 'PayloadRuleCases.test.ets:A0111', BUNDLE + '_ReadinessRuleCases_0012').assertEqual('无法判断');
      loggedExpect(readinessRuleLines().length, 'PayloadRuleCases.test.ets:A0112', BUNDLE + '_ReadinessRuleCases_0012').assertEqual(12);
      loggedExpect(auditReadinessRules().ok, 'PayloadRuleCases.test.ets:A0113', BUNDLE + '_ReadinessRuleCases_0012').assertTrue();
    });
  });

  describe('ConflictRuleCases', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTRULECASES_0100
     * @tc.name      com.samples.appcontinuation_ConflictRuleCases_0001
     * @tc.desc      Verify none without dirty keeps local
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ConflictRuleCases_0001', 0, (): void => {
      const input = noneInput(false, false);
      loggedExpect(classify(input), 'PayloadRuleCases.test.ets:A0114', BUNDLE + '_ConflictRuleCases_0001').assertEqual(ConflictKind.NONE);
      const decision = decide(input);
      loggedExpect(decision.rule?.ruleId, 'PayloadRuleCases.test.ets:A0115', BUNDLE + '_ConflictRuleCases_0001').assertEqual('CF-01');
      loggedExpect(decision.resolution, 'PayloadRuleCases.test.ets:A0116', BUNDLE + '_ConflictRuleCases_0001').assertEqual(Resolution.KEEP_LOCAL);
      loggedExpect(decision.confirm(), 'PayloadRuleCases.test.ets:A0117', BUNDLE + '_ConflictRuleCases_0001').assertFalse();
      loggedExpect(decision.text().indexOf('CF-01') > 0, 'PayloadRuleCases.test.ets:A0118', BUNDLE + '_ConflictRuleCases_0001').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTRULECASES_0200
     * @tc.name      com.samples.appcontinuation_ConflictRuleCases_0002
     * @tc.desc      Verify none with local dirty keeps local
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ConflictRuleCases_0002', 0, (): void => {
      const decision = decide(noneInput(true, false));
      loggedExpect(decision.kind, 'PayloadRuleCases.test.ets:A0119', BUNDLE + '_ConflictRuleCases_0002').assertEqual(ConflictKind.NONE);
      loggedExpect(decision.rule?.ruleId, 'PayloadRuleCases.test.ets:A0120', BUNDLE + '_ConflictRuleCases_0002').assertEqual('CF-02');
      loggedExpect(decision.resolution, 'PayloadRuleCases.test.ets:A0121', BUNDLE + '_ConflictRuleCases_0002').assertEqual(Resolution.KEEP_LOCAL);
      loggedExpect(losesContent(decision.resolution), 'PayloadRuleCases.test.ets:A0122', BUNDLE + '_ConflictRuleCases_0002').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTRULECASES_0300
     * @tc.name      com.samples.appcontinuation_ConflictRuleCases_0003
     * @tc.desc      Verify none with remote dirty takes remote
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ConflictRuleCases_0003', 0, (): void => {
      const decision = decide(noneInput(false, true));
      loggedExpect(decision.rule?.ruleId, 'PayloadRuleCases.test.ets:A0123', BUNDLE + '_ConflictRuleCases_0003').assertEqual('CF-03');
      loggedExpect(decision.resolution, 'PayloadRuleCases.test.ets:A0124', BUNDLE + '_ConflictRuleCases_0003').assertEqual(Resolution.KEEP_REMOTE);
      loggedExpect(applyResolution(noneInput(false, true), decision).data.body, 'PayloadRuleCases.test.ets:A0125', BUNDLE + '_ConflictRuleCases_0003')
        .assertEqual('同一段正文');
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTRULECASES_0400
     * @tc.name      com.samples.appcontinuation_ConflictRuleCases_0004
     * @tc.desc      Verify both dirty needs confirmation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ConflictRuleCases_0004', 0, (): void => {
      const input: ConflictInput = noneInput(true, true);
      loggedExpect(classify(input), 'PayloadRuleCases.test.ets:A0126', BUNDLE + '_ConflictRuleCases_0004').assertEqual(ConflictKind.BOTH_CHANGED);
      const decision = decide(input);
      loggedExpect(decision.rule?.ruleId, 'PayloadRuleCases.test.ets:A0127', BUNDLE + '_ConflictRuleCases_0004').assertEqual('CF-24');
      loggedExpect(decision.resolution, 'PayloadRuleCases.test.ets:A0128', BUNDLE + '_ConflictRuleCases_0004').assertEqual(Resolution.ASK_USER);
      loggedExpect(decision.confirm(), 'PayloadRuleCases.test.ets:A0129', BUNDLE + '_ConflictRuleCases_0004').assertTrue();
      loggedExpect(applyResolution(input, decision).notes.length > 0, 'PayloadRuleCases.test.ets:A0130', BUNDLE + '_ConflictRuleCases_0004').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTRULECASES_0500
     * @tc.name      com.samples.appcontinuation_ConflictRuleCases_0005
     * @tc.desc      Verify remote only adopts remote
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ConflictRuleCases_0005', 0, (): void => {
      const decision = decide(remoteOnlyInput(false, false));
      loggedExpect(classify(remoteOnlyInput(false, false)), 'PayloadRuleCases.test.ets:A0131', BUNDLE + '_ConflictRuleCases_0005').assertEqual(ConflictKind.REMOTE_ONLY);
      loggedExpect(decision.rule?.ruleId, 'PayloadRuleCases.test.ets:A0132', BUNDLE + '_ConflictRuleCases_0005').assertEqual('CF-05');
      loggedExpect(decision.resolution, 'PayloadRuleCases.test.ets:A0133', BUNDLE + '_ConflictRuleCases_0005').assertEqual(Resolution.KEEP_REMOTE);
      loggedExpect(applyResolution(remoteOnlyInput(false, false), decision).data.body, 'PayloadRuleCases.test.ets:A0134', BUNDLE + '_ConflictRuleCases_0005')
        .assertEqual('对端正文');
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTRULECASES_0600
     * @tc.name      com.samples.appcontinuation_ConflictRuleCases_0006
     * @tc.desc      Verify remote only with local dirty merges
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ConflictRuleCases_0006', 0, (): void => {
      const decision = decide(remoteOnlyInput(true, true));
      loggedExpect(decision.rule?.ruleId, 'PayloadRuleCases.test.ets:A0135', BUNDLE + '_ConflictRuleCases_0006').assertEqual('CF-08');
      loggedExpect(decision.resolution, 'PayloadRuleCases.test.ets:A0136', BUNDLE + '_ConflictRuleCases_0006').assertEqual(Resolution.MERGE_PREFER_REMOTE);
      loggedExpect(decision.confirm(), 'PayloadRuleCases.test.ets:A0137', BUNDLE + '_ConflictRuleCases_0006').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTRULECASES_0700
     * @tc.name      com.samples.appcontinuation_ConflictRuleCases_0007
     * @tc.desc      Verify local only keeps local
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ConflictRuleCases_0007', 0, (): void => {
      const decision = decide(localOnlyInput(false, false));
      loggedExpect(classify(localOnlyInput(false, false)), 'PayloadRuleCases.test.ets:A0138', BUNDLE + '_ConflictRuleCases_0007').assertEqual(ConflictKind.LOCAL_ONLY);
      loggedExpect(decision.rule?.ruleId, 'PayloadRuleCases.test.ets:A0139', BUNDLE + '_ConflictRuleCases_0007').assertEqual('CF-09');
      loggedExpect(decision.resolution, 'PayloadRuleCases.test.ets:A0140', BUNDLE + '_ConflictRuleCases_0007').assertEqual(Resolution.KEEP_LOCAL);
      loggedExpect(applyResolution(localOnlyInput(false, false), decision).data.body, 'PayloadRuleCases.test.ets:A0141', BUNDLE + '_ConflictRuleCases_0007')
        .assertEqual('本机正文');
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTRULECASES_0800
     * @tc.name      com.samples.appcontinuation_ConflictRuleCases_0008
     * @tc.desc      Verify local only with remote dirty merges
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ConflictRuleCases_0008', 0, (): void => {
      const decision = decide(localOnlyInput(false, true));
      loggedExpect(decision.rule?.ruleId, 'PayloadRuleCases.test.ets:A0142', BUNDLE + '_ConflictRuleCases_0008').assertEqual('CF-11');
      loggedExpect(decision.resolution, 'PayloadRuleCases.test.ets:A0143', BUNDLE + '_ConflictRuleCases_0008').assertEqual(Resolution.MERGE_PREFER_LOCAL);
      loggedExpect(decision.confirm(), 'PayloadRuleCases.test.ets:A0144', BUNDLE + '_ConflictRuleCases_0008').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTRULECASES_0900
     * @tc.name      com.samples.appcontinuation_ConflictRuleCases_0009
     * @tc.desc      Verify remote newer adopts remote
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ConflictRuleCases_0009', 0, (): void => {
      const input = remoteNewerInput(false, false);
      loggedExpect(classify(input), 'PayloadRuleCases.test.ets:A0145', BUNDLE + '_ConflictRuleCases_0009').assertEqual(ConflictKind.REMOTE_NEWER);
      const decision = decide(input);
      loggedExpect(decision.rule?.ruleId, 'PayloadRuleCases.test.ets:A0146', BUNDLE + '_ConflictRuleCases_0009').assertEqual('CF-13');
      loggedExpect(decision.resolution, 'PayloadRuleCases.test.ets:A0147', BUNDLE + '_ConflictRuleCases_0009').assertEqual(Resolution.KEEP_REMOTE);
      loggedExpect(applyResolution(input, decision).data.rev, 'PayloadRuleCases.test.ets:A0148', BUNDLE + '_ConflictRuleCases_0009').assertEqual(3);
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTRULECASES_1000
     * @tc.name      com.samples.appcontinuation_ConflictRuleCases_0010
     * @tc.desc      Verify remote newer with local dirty merges
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ConflictRuleCases_0010', 0, (): void => {
      const decision = decide(remoteNewerInput(true, false));
      loggedExpect(decision.rule?.ruleId, 'PayloadRuleCases.test.ets:A0149', BUNDLE + '_ConflictRuleCases_0010').assertEqual('CF-14');
      loggedExpect(decision.resolution, 'PayloadRuleCases.test.ets:A0150', BUNDLE + '_ConflictRuleCases_0010').assertEqual(Resolution.MERGE_PREFER_LOCAL);
      const merged = applyResolution(remoteNewerInput(true, false), decision);
      loggedExpect(merged.data.body.indexOf('旧正文') >= 0, 'PayloadRuleCases.test.ets:A0151', BUNDLE + '_ConflictRuleCases_0010').assertTrue();
      loggedExpect(merged.data.body.indexOf('新正文') >= 0, 'PayloadRuleCases.test.ets:A0152', BUNDLE + '_ConflictRuleCases_0010').assertTrue();
      loggedExpect(merged.notes.length, 'PayloadRuleCases.test.ets:A0153', BUNDLE + '_ConflictRuleCases_0010').assertEqual(2);
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTRULECASES_1100
     * @tc.name      com.samples.appcontinuation_ConflictRuleCases_0011
     * @tc.desc      Verify local newer keeps local
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ConflictRuleCases_0011', 0, (): void => {
      const input = localNewerInput(false, false);
      loggedExpect(classify(input), 'PayloadRuleCases.test.ets:A0154', BUNDLE + '_ConflictRuleCases_0011').assertEqual(ConflictKind.LOCAL_NEWER);
      const decision = decide(input);
      loggedExpect(decision.rule?.ruleId, 'PayloadRuleCases.test.ets:A0155', BUNDLE + '_ConflictRuleCases_0011').assertEqual('CF-17');
      loggedExpect(decision.resolution, 'PayloadRuleCases.test.ets:A0156', BUNDLE + '_ConflictRuleCases_0011').assertEqual(Resolution.KEEP_LOCAL);
      loggedExpect(applyResolution(input, decision).data.rev, 'PayloadRuleCases.test.ets:A0157', BUNDLE + '_ConflictRuleCases_0011').assertEqual(5);
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTRULECASES_1200
     * @tc.name      com.samples.appcontinuation_ConflictRuleCases_0012
     * @tc.desc      Verify local newer with remote dirty merges
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ConflictRuleCases_0012', 0, (): void => {
      const decision = decide(localNewerInput(false, true));
      loggedExpect(decision.rule?.ruleId, 'PayloadRuleCases.test.ets:A0158', BUNDLE + '_ConflictRuleCases_0012').assertEqual('CF-19');
      loggedExpect(decision.resolution, 'PayloadRuleCases.test.ets:A0159', BUNDLE + '_ConflictRuleCases_0012').assertEqual(Resolution.MERGE_PREFER_REMOTE);
      loggedExpect(decision.confirm(), 'PayloadRuleCases.test.ets:A0160', BUNDLE + '_ConflictRuleCases_0012').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTRULECASES_1300
     * @tc.name      com.samples.appcontinuation_ConflictRuleCases_0013
     * @tc.desc      Verify unknown document discards remote
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ConflictRuleCases_0013', 0, (): void => {
      const input = unknownInput(false, true);
      loggedExpect(classify(input), 'PayloadRuleCases.test.ets:A0161', BUNDLE + '_ConflictRuleCases_0013').assertEqual(ConflictKind.UNKNOWN);
      const decision = decide(input);
      loggedExpect(decision.rule?.ruleId, 'PayloadRuleCases.test.ets:A0162', BUNDLE + '_ConflictRuleCases_0013').assertEqual('CF-26');
      loggedExpect(decision.resolution, 'PayloadRuleCases.test.ets:A0163', BUNDLE + '_ConflictRuleCases_0013').assertEqual(Resolution.DISCARD_REMOTE);
      loggedExpect(losesContent(decision.resolution), 'PayloadRuleCases.test.ets:A0164', BUNDLE + '_ConflictRuleCases_0013').assertTrue();
      loggedExpect(applyResolution(input, decision).data.doc, 'PayloadRuleCases.test.ets:A0165', BUNDLE + '_ConflictRuleCases_0013').assertEqual('doc-a');
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTRULECASES_1400
     * @tc.name      com.samples.appcontinuation_ConflictRuleCases_0014
     * @tc.desc      Verify unknown document keeps local when dirty
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ConflictRuleCases_0014', 0, (): void => {
      const decision = decide(unknownInput(true, false));
      loggedExpect(decision.rule?.ruleId, 'PayloadRuleCases.test.ets:A0166', BUNDLE + '_ConflictRuleCases_0014').assertEqual('CF-27');
      loggedExpect(decision.resolution, 'PayloadRuleCases.test.ets:A0167', BUNDLE + '_ConflictRuleCases_0014').assertEqual(Resolution.KEEP_LOCAL);
      loggedExpect(decision.confirm(), 'PayloadRuleCases.test.ets:A0168', BUNDLE + '_ConflictRuleCases_0014').assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTRULECASES_1500
     * @tc.name      com.samples.appcontinuation_ConflictRuleCases_0015
     * @tc.desc      Verify both changed merges line by line
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ConflictRuleCases_0015', 0, (): void => {
      const local: PayloadData = payload('doc', 2, 'a\nb');
      const remote: PayloadData = payload('doc', 2, 'b\nc');
      const input: ConflictInput = new ConflictInput(local, remote);
      input.localDirty = true;
      const decision = decide(input);
      loggedExpect(classify(input), 'PayloadRuleCases.test.ets:A0169', BUNDLE + '_ConflictRuleCases_0015').assertEqual(ConflictKind.BOTH_CHANGED);
      loggedExpect(decision.rule?.ruleId, 'PayloadRuleCases.test.ets:A0170', BUNDLE + '_ConflictRuleCases_0015').assertEqual('CF-22');
      const merged = applyResolution(input, decision);
      loggedExpect(merged.data.body, 'PayloadRuleCases.test.ets:A0171', BUNDLE + '_ConflictRuleCases_0015').assertEqual('a\nb\nc');
      loggedExpect(merged.data.rev, 'PayloadRuleCases.test.ets:A0172', BUNDLE + '_ConflictRuleCases_0015').assertEqual(2);
      loggedExpect(merged.data.ck, 'PayloadRuleCases.test.ets:A0173', BUNDLE + '_ConflictRuleCases_0015').assertEqual('bothChanged');
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONFLICTRULECASES_1600
     * @tc.name      com.samples.appcontinuation_ConflictRuleCases_0016
     * @tc.desc      Verify rule table and labels stay consistent
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it(BUNDLE + '_ConflictRuleCases_0016', 0, (): void => {
      loggedExpect(CONFLICT_RULES.length, 'PayloadRuleCases.test.ets:A0174', BUNDLE + '_ConflictRuleCases_0016').assertEqual(28);
      loggedExpect(conflictRuleLines().length, 'PayloadRuleCases.test.ets:A0175', BUNDLE + '_ConflictRuleCases_0016').assertEqual(28);
      loggedExpect(auditConflictRules().ok, 'PayloadRuleCases.test.ets:A0176', BUNDLE + '_ConflictRuleCases_0016').assertTrue();
      loggedExpect(resolutionLabel(Resolution.KEEP_REMOTE), 'PayloadRuleCases.test.ets:A0177', BUNDLE + '_ConflictRuleCases_0016').assertEqual('采用对端');
      loggedExpect(conflictLabel(ConflictKind.REMOTE_ONLY), 'PayloadRuleCases.test.ets:A0178', BUNDLE + '_ConflictRuleCases_0016').assertEqual('仅对端有内容');
      loggedExpect(needsConfirmation(Resolution.ASK_USER), 'PayloadRuleCases.test.ets:A0179', BUNDLE + '_ConflictRuleCases_0016').assertTrue();
      loggedExpect(needsConfirmation(Resolution.APPEND_REMOTE), 'PayloadRuleCases.test.ets:A0180', BUNDLE + '_ConflictRuleCases_0016').assertFalse();
      CONFLICT_RULES.forEach((rule): void => {
        loggedExpect(rule.ruleId.indexOf('CF-') === 0, 'PayloadRuleCases.test.ets:A0181', BUNDLE + '_ConflictRuleCases_0016').assertTrue();
        loggedExpect(rule.reason.length > 0, 'PayloadRuleCases.test.ets:A0182', BUNDLE + '_ConflictRuleCases_0016').assertTrue();
        loggedExpect(rule.resolution !== undefined, 'PayloadRuleCases.test.ets:A0183', BUNDLE + '_ConflictRuleCases_0016').assertTrue();
      });
    });
  });
}

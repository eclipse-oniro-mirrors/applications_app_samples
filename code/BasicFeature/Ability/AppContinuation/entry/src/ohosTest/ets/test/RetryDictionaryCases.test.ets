import { describe, expect, it } from '@ohos/hypium';
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
     * @tc.name      testRetryPolicyCasesB0001
     * @tc.desc      Verify rule table is consistent
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testRetryPolicyCasesB0001', 0, (): void => {
      expect(RETRY_RULES.length).assertEqual(20);
      expect(ruleIds().length).assertEqual(20);
      expect(ruleLines().length).assertEqual(20);
      const audit = auditRetryRules();
      expect(audit.findings.length).assertEqual(0);
      expect(audit.ok).assertTrue();
      expect(audit.summary()).assertEqual('重试规则表自洽');
      RETRY_RULES.forEach((rule): void => {
        expect(rule.description.length > 0).assertTrue();
        expect(rule.maxAttempts >= 1).assertTrue();
        expect(rule.text().indexOf(rule.ruleId) === 0).assertTrue();
      });
      expect(ruleOf('RR-99')).assertEqual(undefined);
      expect(reasonLines().length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CONTINUATION_RETRYPOLICYCASESB_0200
     * @tc.name      testRetryPolicyCasesB0002
     * @tc.desc      Verify reason distribution covers all reasons
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRetryPolicyCasesB0002', 0, (): void => {
      expect(rulesOf(RetryReason.NETWORK).length).assertEqual(3);
      expect(rulesOf(RetryReason.TIMEOUT).length).assertEqual(3);
      expect(rulesOf(RetryReason.PERMISSION).length).assertEqual(2);
      expect(rulesOf(RetryReason.VERSION).length).assertEqual(2);
      expect(rulesOf(RetryReason.DEVICE_BUSY).length).assertEqual(3);
      expect(rulesOf(RetryReason.STORAGE).length).assertEqual(3);
      expect(rulesOf(RetryReason.PAYLOAD).length).assertEqual(2);
      expect(rulesOf(RetryReason.UNKNOWN).length).assertEqual(2);
      expect(reasonLabel(RetryReason.DEVICE_BUSY)).assertEqual('设备繁忙');
      expect(backoffLabel(Backoff.EXPONENTIAL)).assertEqual('指数退避');
      expect(defaultRule(RetryReason.NETWORK).ruleId).assertEqual('RR-01');
      expect(defaultRule(RetryReason.PAYLOAD).ruleId).assertEqual('RR-11');
    });

    /**
     * @tc.number    SUB_CONTINUATION_RETRYPOLICYCASESB_0300
     * @tc.name      testRetryPolicyCasesB0003
     * @tc.desc      Verify backoff delays follow strategy
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRetryPolicyCasesB0003', 0, (): void => {
      const network: RetryRule = defaultRule(RetryReason.NETWORK);
      expect(network.backoff).assertEqual(Backoff.EXPONENTIAL);
      expect(delayOf(network, 1)).assertEqual(200);
      expect(delayOf(network, 2)).assertEqual(400);
      expect(delayOf(network, 3)).assertEqual(800);
      expect(delayOf(network, 4)).assertEqual(0);
      expect(delayOf(network, 0)).assertEqual(0);
      expect(totalWait(network)).assertEqual(1400);
      const timeout: RetryRule = ruleOf('RR-03') === undefined ?
        defaultRule(RetryReason.TIMEOUT) : ruleOf('RR-03') as RetryRule;
      expect(delayOf(timeout, 1)).assertEqual(300);
      expect(delayOf(timeout, 2)).assertEqual(600);
      expect(delayOf(timeout, 3)).assertEqual(0);
      expect(totalWait(timeout)).assertEqual(900);
      const busy: RetryRule = ruleOf('RR-07') === undefined ?
        defaultRule(RetryReason.DEVICE_BUSY) : ruleOf('RR-07') as RetryRule;
      expect(delayOf(busy, 1)).assertEqual(800);
      expect(delayOf(busy, 2)).assertEqual(800);
      expect(totalWait(busy)).assertEqual(1600);
    });

    /**
     * @tc.number    SUB_CONTINUATION_RETRYPOLICYCASESB_0400
     * @tc.name      testRetryPolicyCasesB0004
     * @tc.desc      Verify non retryable rules never delay
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRetryPolicyCasesB0004', 0, (): void => {
      const permission: RetryRule = ruleOf('RR-05') === undefined ?
        defaultRule(RetryReason.PERMISSION) : ruleOf('RR-05') as RetryRule;
      expect(permission.retryable()).assertFalse();
      expect(permission.requiresAction).assertTrue();
      expect(delayOf(permission, 1)).assertEqual(0);
      expect(totalWait(permission)).assertEqual(0);
      const version: RetryRule = ruleOf('RR-06') === undefined ?
        defaultRule(RetryReason.VERSION) : ruleOf('RR-06') as RetryRule;
      expect(version.retryable()).assertFalse();
      expect(version.requiresAction).assertTrue();
      expect(ruleOf('RR-01')?.retryable()).assertTrue();
      expect(ruleOf('RR-01')?.requiresAction).assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_RETRYPOLICYCASESB_0500
     * @tc.name      testRetryPolicyCasesB0005
     * @tc.desc      Verify simulation stops on success
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRetryPolicyCasesB0005', 0, (): void => {
      const network: RetryRule = defaultRule(RetryReason.NETWORK);
      const trace: RetryTrace = simulate(network, 3);
      expect(trace.attempts()).assertEqual(3);
      expect(trace.succeeded()).assertTrue();
      expect(trace.exhausted()).assertFalse();
      expect(trace.waited()).assertEqual(600);
      expect(trace.lines().length).assertEqual(3);
      expect(trace.lines()[0].indexOf('第 1 次') === 0).assertTrue();
      expect(trace.text().indexOf('已成功') > 0).assertTrue();
      const failing: RetryTrace = simulate(network, 99);
      expect(failing.attempts()).assertEqual(4);
      expect(failing.succeeded()).assertFalse();
      expect(failing.exhausted()).assertTrue();
      expect(failing.waited()).assertEqual(1400);
      const stop: RetryTrace = simulate(defaultRule(RetryReason.PERMISSION), 99);
      expect(stop.attempts()).assertEqual(1);
      expect(stop.exhausted()).assertTrue();
      const record: AttemptRecord = new AttemptRecord(1, RetryReason.TIMEOUT, 0, false);
      expect(record.text().indexOf('第 1 次') === 0).assertTrue();
      expect(record.text().indexOf('失败') > 0).assertTrue();
    });
  });

  describe('FieldDictionaryCases', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_FIELDDICTIONARYCASES_0100
     * @tc.name      testFieldDictionaryCases0001
     * @tc.desc      Verify dictionary covers schema
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFieldDictionaryCases0001', 0, (): void => {
      expect(FIELD_DOCS.length).assertEqual(20);
      expect(docKeys().length).assertEqual(20);
      expect(dictionaryLines().length).assertEqual(20);
      expect(missingSchemaKeys().length).assertEqual(0);
      const audit = auditDictionary();
      expect(audit.findings.length).assertEqual(0);
      expect(audit.ok).assertTrue();
      expect(audit.summary()).assertEqual('字段字典自洽');
      FIELD_DOCS.forEach((doc: FieldDoc): void => {
        expect(doc.label.length > 0).assertTrue();
        expect(doc.maxLength >= 0).assertTrue();
        expect(doc.text().indexOf(doc.key) === 0).assertTrue();
      });
      expect(docOf('missing')).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_CONTINUATION_FIELDDICTIONARYCASES_0200
     * @tc.name      testFieldDictionaryCases0002
     * @tc.desc      Verify role and visibility distribution
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFieldDictionaryCases0002', 0, (): void => {
      expect(docsOfRole(FieldRole.IDENTITY).length).assertEqual(3);
      expect(docsOfRole(FieldRole.CONTENT).length).assertEqual(2);
      expect(docsOfRole(FieldRole.POSITION).length).assertEqual(2);
      expect(docsOfRole(FieldRole.CONTEXT).length).assertEqual(3);
      expect(docsOfRole(FieldRole.INTEGRITY).length).assertEqual(2);
      expect(docsOfRole(FieldRole.DERIVED).length).assertEqual(8);
      expect(requiredDocs().length).assertEqual(3);
      expect(visibleDocs().length).assertEqual(18);
      expect(roleLines().length).assertEqual(6);
      expect(roleLabel(FieldRole.INTEGRITY)).assertEqual('完整性');
      expect(unitLabel(FieldUnit.CHARS)).assertEqual('字符');
      expect(unitLabel(FieldUnit.MILLIS)).assertEqual('毫秒');
    });

    /**
     * @tc.number    SUB_CONTINUATION_FIELDDICTIONARYCASES_0300
     * @tc.name      testFieldDictionaryCases0003
     * @tc.desc      Verify direct fields read from payload
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFieldDictionaryCases0003', 0, (): void => {
      const data: PayloadData = payload();
      expect(valueOfKey(data, 'doc')).assertEqual('doc-1');
      expect(valueOfKey(data, 'rev')).assertEqual('4');
      expect(valueOfKey(data, 'title')).assertEqual('标题');
      expect(valueOfKey(data, 'cs')).assertEqual('1');
      expect(valueOfKey(data, 'ce')).assertEqual('3');
      expect(valueOfKey(data, 'dev')).assertEqual('device-a');
      expect(valueOfKey(data, 'at')).assertEqual('1700000000000');
      expect(valueOfKey(data, 'ck')).assertEqual('bothChanged');
      expect(valueOfKey(data, 'app')).assertEqual('1.0.0');
      expect(valueOfKey(data, 'v')).assertEqual('3');
      expect(valueOfKey(data, 'unknown')).assertEqual('');
      const empty: PayloadData = new PayloadData('d', 1);
      expect(valueOfKey(empty, 'at')).assertEqual('未记录时间');
    });

    /**
     * @tc.number    SUB_CONTINUATION_FIELDDICTIONARYCASES_0400
     * @tc.name      testFieldDictionaryCases0004
     * @tc.desc      Verify derived fields are computed
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFieldDictionaryCases0004', 0, (): void => {
      const data: PayloadData = payload();
      expect(valueOfKey(data, 'bodyLength')).assertEqual(data.body.length.toString());
      expect(valueOfKey(data, 'selectionLength')).assertEqual('2');
      expect(valueOfKey(data, 'payloadSize'))
        .assertEqual((data.body.length + data.title.length).toString());
      expect(valueOfKey(data, 'conflictText')).assertEqual('两端都改过');
      expect(valueOfKey(data, 'tagCount')).assertEqual('2');
      expect(valueOfKey(data, 'revisionGap')).assertEqual('0');
      const noCk: PayloadData = new PayloadData('d', 1);
      expect(valueOfKey(noCk, 'conflictText')).assertEqual('无冲突');
      expect(valueOfKey(noCk, 'tagCount')).assertEqual('0');
      expect(conflictText('remoteNewer')).assertEqual('对端更新');
      expect(conflictText('localNewer')).assertEqual('本机更新');
      expect(conflictText('weird')).assertEqual('无法判断');
    });

    /**
     * @tc.number    SUB_CONTINUATION_FIELDDICTIONARYCASES_0500
     * @tc.name      testFieldDictionaryCases0005
     * @tc.desc      Verify describe value produces text
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testFieldDictionaryCases0005', 0, (): void => {
      const data: PayloadData = payload();
      expect(describeValue(data, 'title').indexOf('标题：') === 0).assertTrue();
      expect(describeValue(data, 'missing')).assertEqual('missing：未定义字段');
      const empty: PayloadData = new PayloadData('d', 1);
      expect(describeValue(empty, 'title')).assertEqual('标题：（空）');
      expect(describeValue(data, 'bodyLength').indexOf('字符') > 0).assertTrue();
      expect(describeValue(data, 'cs').indexOf('个') > 0).assertTrue();
    });
  });
}

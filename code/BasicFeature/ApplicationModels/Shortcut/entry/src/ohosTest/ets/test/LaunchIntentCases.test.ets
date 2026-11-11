import { describe, expect, it } from '@ohos/hypium';
import {
  INTENT_RULES, IntentRequest, IntentRule, IntentSource, auditIntent, parseUri, resolveIntent,
  ruleIds as intentIds, ruleLines as intentLines, ruleOf as intentRuleOf, rulesOf as intentsOf,
  sourceCounts, sourceLabel, sourceLines
} from '../../../main/ets/business/LaunchIntent';

export default function launchIntentCasesTest(): void {
  describe('LaunchIntentCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_LAUNCHINTENTCASES_0100
     * @tc.name      testLaunchIntentCases0001
     * @tc.desc      Verify rule table is consistent
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testLaunchIntentCases0001', 0, (): void => {
      expect(INTENT_RULES.length).assertEqual(20);
      expect(intentIds().length).assertEqual(20);
      expect(intentLines().length).assertEqual(20);
      const audit = auditIntent();
      expect(audit.findings.length).assertEqual(0);
      expect(audit.ok).assertTrue();
      expect(audit.summary()).assertEqual('入口规则表自洽');
      INTENT_RULES.forEach((rule: IntentRule): void => {
        expect(rule.routeId.length > 0).assertTrue();
        expect(rule.description.length > 0).assertTrue();
        expect(rule.text().indexOf(rule.ruleId) === 0).assertTrue();
      });
      expect(intentRuleOf('IN-99')).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_SHORTCUT_LAUNCHINTENTCASES_0200
     * @tc.name      testLaunchIntentCases0002
     * @tc.desc      Verify source distribution
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchIntentCases0002', 0, (): void => {
      const counts: number[] = sourceCounts();
      expect(counts.length).assertEqual(6);
      expect(counts[0]).assertEqual(5);
      expect(counts[1]).assertEqual(6);
      expect(counts[2]).assertEqual(3);
      expect(counts[3]).assertEqual(3);
      expect(counts[4]).assertEqual(2);
      expect(counts[5]).assertEqual(1);
      expect(intentsOf(IntentSource.SHORTCUT).length).assertEqual(5);
      expect(sourceLines().length).assertEqual(6);
      expect(sourceLabel(IntentSource.RESUME)).assertEqual('进程恢复');
    });

    /**
     * @tc.number    SUB_SHORTCUT_LAUNCHINTENTCASES_0300
     * @tc.name      testLaunchIntentCases0003
     * @tc.desc      Verify parse uri extracts query
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchIntentCases0003', 0, (): void => {
      const parsed = parseUri('app://detail?noteId=note-1&from=shortcut');
      expect(parsed.keys.length).assertEqual(2);
      expect(parsed.get('noteId')).assertEqual('note-1');
      expect(parsed.get('from')).assertEqual('shortcut');
      expect(parsed.uri).assertEqual('app://detail');
      const bare = parseUri('app://activity');
      expect(bare.keys.length).assertEqual(0);
      expect(bare.uri).assertEqual('app://activity');
      const malformed = parseUri('app://x?a&b=&c=1');
      expect(malformed.get('c')).assertEqual('1');
      expect(malformed.keys.length).assertEqual(2);
      expect(malformed.get('b')).assertEqual('');
      expect(malformed.get('a')).assertEqual('');
      expect(parsed.text().indexOf('deeplink') < 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_LAUNCHINTENTCASES_0400
     * @tc.name      testLaunchIntentCases0004
     * @tc.desc      Verify shortcut resolution
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchIntentCases0004', 0, (): void => {
      const note = resolveIntent(new IntentRequest(IntentSource.SHORTCUT, 'shortcut://note/new'));
      expect(note.routeId).assertEqual('sc.note.new');
      expect(note.matchedRuleId).assertEqual('IN-01');
      expect(note.fallback).assertFalse();
      expect(note.ok()).assertTrue();
      expect(note.text().indexOf('sc.note.new') === 0).assertTrue();
      const fallback = resolveIntent(new IntentRequest(IntentSource.SHORTCUT,
        'shortcut://unknown'));
      expect(fallback.routeId).assertEqual('sc.rule.center');
      expect(fallback.matchedRuleId).assertEqual('IN-18');
      expect(fallback.fallback).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_LAUNCHINTENTCASES_0500
     * @tc.name      testLaunchIntentCases0005
     * @tc.desc      Verify missing params and login are reported
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchIntentCases0005', 0, (): void => {
      const detail = resolveIntent(new IntentRequest(IntentSource.SHORTCUT, 'shortcut://detail'));
      expect(detail.ok()).assertFalse();
      expect(detail.missing.length).assertEqual(1);
      expect(detail.missing[0]).assertEqual('noteId');
      expect(detail.issues.length).assertEqual(2);
      expect(detail.text().indexOf('需处理') > 0).assertTrue();
      const authorized = new IntentRequest(IntentSource.SHORTCUT, 'shortcut://detail');
      authorized.loggedIn = true;
      authorized.put('noteId', 'note-1');
      const plan = resolveIntent(authorized);
      expect(plan.ok()).assertTrue();
      expect(plan.routeId).assertEqual('sc.detail');
      expect(plan.fallback).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_LAUNCHINTENTCASES_0600
     * @tc.name      testLaunchIntentCases0006
     * @tc.desc      Verify deeplink and unknown source
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchIntentCases0006', 0, (): void => {
      const parsed = parseUri('app://detail?noteId=note-9');
      parsed.source = IntentSource.DEEPLINK;
      parsed.loggedIn = true;
      const plan = resolveIntent(parsed);
      expect(plan.routeId).assertEqual('sc.detail');
      expect(plan.matchedRuleId).assertEqual('IN-07');
      expect(plan.ok()).assertTrue();
      const unknown = resolveIntent(new IntentRequest(IntentSource.UNKNOWN, 'x://anything'));
      expect(unknown.routeId).assertEqual('sc.rule.center');
      expect(unknown.matchedRuleId).assertEqual('IN-20');
      expect(unknown.fallback).assertTrue();
      expect(unknown.ok()).assertTrue();
      const extra = new IntentRequest(IntentSource.DEEPLINK, 'app://note');
      extra.put('unexpected', 'value');
      const extraPlan = resolveIntent(extra);
      expect(extraPlan.routeId).assertEqual('sc.note.new');
      expect(extraPlan.issues.length).assertEqual(1);
      expect(extraPlan.issues[0].indexOf('忽略多余参数') === 0).assertTrue();
    });
  });
}

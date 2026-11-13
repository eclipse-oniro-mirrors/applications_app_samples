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
import { caseName, expect, it } from '../support/TestCase';
import {
  ENTRY_RULES, EntryRequest, EntryRule, EntrySource, auditEntry, parseUri, resolveEntry,
  ruleIds as entryIds, ruleLines as entryLines, ruleOf as entryRuleOf, rulesOf as entriesOf,
  sourceCounts, sourceLabel, sourceLines
} from '../../../main/ets/business/LaunchIntent';

export default function launchEntryCasesTest(): void {
  describe('LaunchEntryCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_LAUNCHENTRYCASES_0100
     * @tc.name      testLaunchEntryCases0001
     * @tc.desc      Verify rule table is consistent
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it(caseName('LaunchEntryCases', '0001'), 0, (): void => {
      expect(ENTRY_RULES.length, caseName('LaunchEntryCases', '0001'), 'LaunchIntentCases.test.ets:A0001').assertEqual(20);
      expect(entryIds().length, caseName('LaunchEntryCases', '0001'), 'LaunchIntentCases.test.ets:A0002').assertEqual(20);
      expect(entryLines().length, caseName('LaunchEntryCases', '0001'), 'LaunchIntentCases.test.ets:A0003').assertEqual(20);
      const audit = auditEntry();
      expect(audit.findings.length, caseName('LaunchEntryCases', '0001'), 'LaunchIntentCases.test.ets:A0004').assertEqual(0);
      expect(audit.ok, caseName('LaunchEntryCases', '0001'), 'LaunchIntentCases.test.ets:A0005').assertTrue();
      expect(audit.summary(), caseName('LaunchEntryCases', '0001'), 'LaunchIntentCases.test.ets:A0006').assertEqual('入口规则表自洽');
      ENTRY_RULES.forEach((rule: EntryRule): void => {
        expect(rule.routeId.length > 0, caseName('LaunchEntryCases', '0001'), 'LaunchIntentCases.test.ets:A0007').assertTrue();
        expect(rule.description.length > 0, caseName('LaunchEntryCases', '0001'), 'LaunchIntentCases.test.ets:A0008').assertTrue();
        expect(rule.text().indexOf(rule.ruleId) === 0, caseName('LaunchEntryCases', '0001'), 'LaunchIntentCases.test.ets:A0009').assertTrue();
      });
      expect(entryRuleOf('IN-99'), caseName('LaunchEntryCases', '0001'), 'LaunchIntentCases.test.ets:A0010').assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_SHORTCUT_LAUNCHENTRYCASES_0200
     * @tc.name      testLaunchEntryCases0002
     * @tc.desc      Verify source distribution
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('LaunchEntryCases', '0002'), 0, (): void => {
      const counts: number[] = sourceCounts();
      expect(counts.length, caseName('LaunchEntryCases', '0002'), 'LaunchIntentCases.test.ets:A0011').assertEqual(6);
      expect(counts[0], caseName('LaunchEntryCases', '0002'), 'LaunchIntentCases.test.ets:A0012').assertEqual(5);
      expect(counts[1], caseName('LaunchEntryCases', '0002'), 'LaunchIntentCases.test.ets:A0013').assertEqual(6);
      expect(counts[2], caseName('LaunchEntryCases', '0002'), 'LaunchIntentCases.test.ets:A0014').assertEqual(3);
      expect(counts[3], caseName('LaunchEntryCases', '0002'), 'LaunchIntentCases.test.ets:A0015').assertEqual(3);
      expect(counts[4], caseName('LaunchEntryCases', '0002'), 'LaunchIntentCases.test.ets:A0016').assertEqual(2);
      expect(counts[5], caseName('LaunchEntryCases', '0002'), 'LaunchIntentCases.test.ets:A0017').assertEqual(1);
      expect(entriesOf(EntrySource.SHORTCUT).length, caseName('LaunchEntryCases', '0002'), 'LaunchIntentCases.test.ets:A0018').assertEqual(5);
      expect(sourceLines().length, caseName('LaunchEntryCases', '0002'), 'LaunchIntentCases.test.ets:A0019').assertEqual(6);
      expect(sourceLabel(EntrySource.RESUME), caseName('LaunchEntryCases', '0002'), 'LaunchIntentCases.test.ets:A0020').assertEqual('进程恢复');
    });

    /**
     * @tc.number    SUB_SHORTCUT_LAUNCHENTRYCASES_0300
     * @tc.name      testLaunchEntryCases0003
     * @tc.desc      Verify parse uri extracts query
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('LaunchEntryCases', '0003'), 0, (): void => {
      const parsed = parseUri('app://detail?noteId=note-1&from=shortcut');
      expect(parsed.keys.length, caseName('LaunchEntryCases', '0003'), 'LaunchIntentCases.test.ets:A0021').assertEqual(2);
      expect(parsed.get('noteId'), caseName('LaunchEntryCases', '0003'), 'LaunchIntentCases.test.ets:A0022').assertEqual('note-1');
      expect(parsed.get('from'), caseName('LaunchEntryCases', '0003'), 'LaunchIntentCases.test.ets:A0023').assertEqual('shortcut');
      expect(parsed.uri, caseName('LaunchEntryCases', '0003'), 'LaunchIntentCases.test.ets:A0024').assertEqual('app://detail');
      const bare = parseUri('app://calls');
      expect(bare.keys.length, caseName('LaunchEntryCases', '0003'), 'LaunchIntentCases.test.ets:A0025').assertEqual(0);
      expect(bare.uri, caseName('LaunchEntryCases', '0003'), 'LaunchIntentCases.test.ets:A0026').assertEqual('app://calls');
      const malformed = parseUri('app://x?a&b=&c=1');
      expect(malformed.get('c'), caseName('LaunchEntryCases', '0003'), 'LaunchIntentCases.test.ets:A0027').assertEqual('1');
      expect(malformed.keys.length, caseName('LaunchEntryCases', '0003'), 'LaunchIntentCases.test.ets:A0028').assertEqual(2);
      expect(malformed.get('b'), caseName('LaunchEntryCases', '0003'), 'LaunchIntentCases.test.ets:A0029').assertEqual('');
      expect(malformed.get('a'), caseName('LaunchEntryCases', '0003'), 'LaunchIntentCases.test.ets:A0030').assertEqual('');
      expect(parsed.text().indexOf('deeplink') < 0, caseName('LaunchEntryCases', '0003'), 'LaunchIntentCases.test.ets:A0031').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_LAUNCHENTRYCASES_0400
     * @tc.name      testLaunchEntryCases0004
     * @tc.desc      Verify shortcut resolution
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('LaunchEntryCases', '0004'), 0, (): void => {
      const note = resolveEntry(new EntryRequest(EntrySource.SHORTCUT, 'shortcut://note/new'));
      expect(note.routeId, caseName('LaunchEntryCases', '0004'), 'LaunchIntentCases.test.ets:A0032').assertEqual('sc.note.new');
      expect(note.matchedRuleId, caseName('LaunchEntryCases', '0004'), 'LaunchIntentCases.test.ets:A0033').assertEqual('IN-01');
      expect(note.fallback, caseName('LaunchEntryCases', '0004'), 'LaunchIntentCases.test.ets:A0034').assertFalse();
      expect(note.ok(), caseName('LaunchEntryCases', '0004'), 'LaunchIntentCases.test.ets:A0035').assertTrue();
      expect(note.text().indexOf('sc.note.new') === 0, caseName('LaunchEntryCases', '0004'), 'LaunchIntentCases.test.ets:A0036').assertTrue();
      const fallback = resolveEntry(new EntryRequest(EntrySource.SHORTCUT,
        'shortcut://unknown'));
      expect(fallback.routeId, caseName('LaunchEntryCases', '0004'), 'LaunchIntentCases.test.ets:A0037').assertEqual('sc.rule.center');
      expect(fallback.matchedRuleId, caseName('LaunchEntryCases', '0004'), 'LaunchIntentCases.test.ets:A0038').assertEqual('IN-18');
      expect(fallback.fallback, caseName('LaunchEntryCases', '0004'), 'LaunchIntentCases.test.ets:A0039').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_LAUNCHENTRYCASES_0500
     * @tc.name      testLaunchEntryCases0005
     * @tc.desc      Verify missing params and login are reported
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('LaunchEntryCases', '0005'), 0, (): void => {
      const detail = resolveEntry(new EntryRequest(EntrySource.SHORTCUT, 'shortcut://detail'));
      expect(detail.ok(), caseName('LaunchEntryCases', '0005'), 'LaunchIntentCases.test.ets:A0040').assertFalse();
      expect(detail.missing.length, caseName('LaunchEntryCases', '0005'), 'LaunchIntentCases.test.ets:A0041').assertEqual(1);
      expect(detail.missing[0], caseName('LaunchEntryCases', '0005'), 'LaunchIntentCases.test.ets:A0042').assertEqual('noteId');
      expect(detail.issues.length, caseName('LaunchEntryCases', '0005'), 'LaunchIntentCases.test.ets:A0043').assertEqual(2);
      expect(detail.text().indexOf('需处理') > 0, caseName('LaunchEntryCases', '0005'), 'LaunchIntentCases.test.ets:A0044').assertTrue();
      const authorized = new EntryRequest(EntrySource.SHORTCUT, 'shortcut://detail');
      authorized.loggedIn = true;
      authorized.put('noteId', 'note-1');
      const plan = resolveEntry(authorized);
      expect(plan.ok(), caseName('LaunchEntryCases', '0005'), 'LaunchIntentCases.test.ets:A0045').assertTrue();
      expect(plan.routeId, caseName('LaunchEntryCases', '0005'), 'LaunchIntentCases.test.ets:A0046').assertEqual('sc.detail');
      expect(plan.fallback, caseName('LaunchEntryCases', '0005'), 'LaunchIntentCases.test.ets:A0047').assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_LAUNCHENTRYCASES_0600
     * @tc.name      testLaunchEntryCases0006
     * @tc.desc      Verify deeplink and unknown source
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('LaunchEntryCases', '0006'), 0, (): void => {
      const parsed = parseUri('app://detail?noteId=note-9');
      parsed.source = EntrySource.DEEPLINK;
      parsed.loggedIn = true;
      const plan = resolveEntry(parsed);
      expect(plan.routeId, caseName('LaunchEntryCases', '0006'), 'LaunchIntentCases.test.ets:A0048').assertEqual('sc.detail');
      expect(plan.matchedRuleId, caseName('LaunchEntryCases', '0006'), 'LaunchIntentCases.test.ets:A0049').assertEqual('IN-07');
      expect(plan.ok(), caseName('LaunchEntryCases', '0006'), 'LaunchIntentCases.test.ets:A0050').assertTrue();
      const unknown = resolveEntry(new EntryRequest(EntrySource.UNKNOWN, 'x://anything'));
      expect(unknown.routeId, caseName('LaunchEntryCases', '0006'), 'LaunchIntentCases.test.ets:A0051').assertEqual('sc.rule.center');
      expect(unknown.matchedRuleId, caseName('LaunchEntryCases', '0006'), 'LaunchIntentCases.test.ets:A0052').assertEqual('IN-20');
      expect(unknown.fallback, caseName('LaunchEntryCases', '0006'), 'LaunchIntentCases.test.ets:A0053').assertTrue();
      expect(unknown.ok(), caseName('LaunchEntryCases', '0006'), 'LaunchIntentCases.test.ets:A0054').assertTrue();
      const extra = new EntryRequest(EntrySource.DEEPLINK, 'app://note');
      extra.put('unexpected', 'value');
      const extraPlan = resolveEntry(extra);
      expect(extraPlan.routeId, caseName('LaunchEntryCases', '0006'), 'LaunchIntentCases.test.ets:A0055').assertEqual('sc.note.new');
      expect(extraPlan.issues.length, caseName('LaunchEntryCases', '0006'), 'LaunchIntentCases.test.ets:A0056').assertEqual(1);
      expect(extraPlan.issues[0].indexOf('忽略多余参数') === 0, caseName('LaunchEntryCases', '0006'), 'LaunchIntentCases.test.ets:A0057').assertTrue();
    });
  });
}

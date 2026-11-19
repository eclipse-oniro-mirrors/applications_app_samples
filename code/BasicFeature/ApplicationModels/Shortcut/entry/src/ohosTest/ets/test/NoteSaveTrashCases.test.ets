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
  SAVE_RULES, SaveDecision, SaveInput, SaveOutcome, SaveRule, TRASH_RETENTION_DAYS, TrashBin,
  TrashEntry, TrashState, decideSave, saveAdvice, saveLines, trashLines
} from '../../../main/ets/business/NoteTrash';

/** 一天毫秒数。 */
const DAY: number = 86400000;

/** 造一份保存输入。 */
function inputOf(baseline: number, local: number, remote: number): SaveInput {
  const input: SaveInput = new SaveInput();
  input.baselineRevision = baseline;
  input.localRevision = local;
  input.remoteRevision = remote;
  return input;
}

export default function noteSaveTrashCasesTest(): void {
  describe('SaveRuleCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_SAVERULECASES_0100
     * @tc.name      testSaveRuleCases0001
     * @tc.desc      Verify rule table has ten entries
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it(caseName('SaveRuleCases', '0001'), 0, (): void => {
      expect(SAVE_RULES.length, caseName('SaveRuleCases', '0001'), 'NoteSaveTrashCases.test.ets:A0001').assertEqual(10);
      const codes: string[] = SAVE_RULES.map((rule: SaveRule): string => rule.code);
      expect(codes[0], caseName('SaveRuleCases', '0001'), 'NoteSaveTrashCases.test.ets:A0002').assertEqual('SV-01');
      expect(codes[9], caseName('SaveRuleCases', '0001'), 'NoteSaveTrashCases.test.ets:A0003').assertEqual('SV-10');
      expect(codes.filter((code: string, index: number): boolean =>
        codes.indexOf(code) === index).length, caseName('SaveRuleCases', '0001'), 'NoteSaveTrashCases.test.ets:A0004').assertEqual(10);
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVERULECASES_0200
     * @tc.name      testSaveRuleCases0002
     * @tc.desc      Verify rule describe joins facts
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SaveRuleCases', '0002'), 0, (): void => {
      const rule: SaveRule | undefined = SAVE_RULES.find((item: SaveRule): boolean =>
        item.code === 'SV-05');
      expect(rule?.describe(), caseName('SaveRuleCases', '0002'), 'NoteSaveTrashCases.test.ets:A0005').assertEqual(
        'SV-05｜双方都前进且修订号不同 → 另存为新分支｜另存为新分支，两侧都保留');
      expect(rule?.describe().split('｜').length, caseName('SaveRuleCases', '0002'), 'NoteSaveTrashCases.test.ets:A0006').assertEqual(3);
      expect(rule === undefined, caseName('SaveRuleCases', '0002'), 'NoteSaveTrashCases.test.ets:A0007').assertFalse();
      expect(rule?.outcome, caseName('SaveRuleCases', '0002'), 'NoteSaveTrashCases.test.ets:A0008').assertEqual(SaveOutcome.BRANCH);
      expect(rule?.describe().indexOf('SV-05') === 0, caseName('SaveRuleCases', '0002'), 'NoteSaveTrashCases.test.ets:A0009').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVERULECASES_0300
     * @tc.name      testSaveRuleCases0003
     * @tc.desc      Verify outcome enum is closed
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SaveRuleCases', '0003'), 0, (): void => {
      expect(SaveOutcome.SAFE, caseName('SaveRuleCases', '0003'), 'NoteSaveTrashCases.test.ets:A0010').assertEqual('可直接保存');
      expect(SaveOutcome.BRANCH, caseName('SaveRuleCases', '0003'), 'NoteSaveTrashCases.test.ets:A0011').assertEqual('另存为新分支');
      expect(SaveOutcome.CONFIRM, caseName('SaveRuleCases', '0003'), 'NoteSaveTrashCases.test.ets:A0012').assertEqual('需用户确认');
      expect(SaveOutcome.BLOCKED, caseName('SaveRuleCases', '0003'), 'NoteSaveTrashCases.test.ets:A0013').assertEqual('保存被阻止');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVERULECASES_0400
     * @tc.name      testSaveRuleCases0004
     * @tc.desc      Verify every rule carries note
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SaveRuleCases', '0004'), 0, (): void => {
      expect(SAVE_RULES.every((rule: SaveRule): boolean => rule.note.length > 0), caseName('SaveRuleCases', '0004'), 'NoteSaveTrashCases.test.ets:A0014').assertTrue();
      expect(SAVE_RULES.every((rule: SaveRule): boolean =>
        rule.condition.length > 0), caseName('SaveRuleCases', '0004'), 'NoteSaveTrashCases.test.ets:A0015').assertTrue();
      expect(SAVE_RULES.length > 0, caseName('SaveRuleCases', '0004'), 'NoteSaveTrashCases.test.ets:A0016').assertTrue();
      expect(SAVE_RULES.every((rule: SaveRule): boolean => rule.code.length > 0), caseName('SaveRuleCases', '0004'), 'NoteSaveTrashCases.test.ets:A0017').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVERULECASES_0500
     * @tc.name      testSaveRuleCases0005
     * @tc.desc      Verify blocking rules are listed
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SaveRuleCases', '0005'), 0, (): void => {
      const blocked: SaveRule[] = SAVE_RULES.filter((rule: SaveRule): boolean =>
        rule.outcome === SaveOutcome.BLOCKED);
      expect(blocked.length, caseName('SaveRuleCases', '0005'), 'NoteSaveTrashCases.test.ets:A0018').assertEqual(3);
      expect(blocked.map((rule: SaveRule): string => rule.code).join(','), caseName('SaveRuleCases', '0005'), 'NoteSaveTrashCases.test.ets:A0019').assertEqual(
        'SV-07,SV-08,SV-09');
      expect(blocked.filter((rule: SaveRule, index: number): boolean =>
        blocked.indexOf(rule) === index).length, caseName('SaveRuleCases', '0005'), 'NoteSaveTrashCases.test.ets:A0020').assertEqual(3);
      expect(blocked.length < SAVE_RULES.length, caseName('SaveRuleCases', '0005'), 'NoteSaveTrashCases.test.ets:A0021').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVERULECASES_0600
     * @tc.name      testSaveRuleCases0006
     * @tc.desc      Verify outcome distribution is stable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SaveRuleCases', '0006'), 0, (): void => {
      const safe: number = SAVE_RULES.filter((rule: SaveRule): boolean =>
        rule.outcome === SaveOutcome.SAFE).length;
      const confirm: number = SAVE_RULES.filter((rule: SaveRule): boolean =>
        rule.outcome === SaveOutcome.CONFIRM).length;
      const branch: number = SAVE_RULES.filter((rule: SaveRule): boolean =>
        rule.outcome === SaveOutcome.BRANCH).length;
      expect(safe, caseName('SaveRuleCases', '0006'), 'NoteSaveTrashCases.test.ets:A0022').assertEqual(3);
      expect(confirm, caseName('SaveRuleCases', '0006'), 'NoteSaveTrashCases.test.ets:A0023').assertEqual(3);
      expect(branch, caseName('SaveRuleCases', '0006'), 'NoteSaveTrashCases.test.ets:A0024').assertEqual(1);
      expect(safe + confirm + branch + 3, caseName('SaveRuleCases', '0006'), 'NoteSaveTrashCases.test.ets:A0025').assertEqual(SAVE_RULES.length);
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVERULECASES_0700
     * @tc.name      testSaveRuleCases0007
     * @tc.desc      Verify save lines match table
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it(caseName('SaveRuleCases', '0007'), 0, (): void => {
      const lines: string[] = saveLines();
      expect(lines.length, caseName('SaveRuleCases', '0007'), 'NoteSaveTrashCases.test.ets:A0026').assertEqual(SAVE_RULES.length);
      expect(lines.every((line: string): boolean => line.indexOf('→') > 0), caseName('SaveRuleCases', '0007'), 'NoteSaveTrashCases.test.ets:A0027').assertTrue();
      expect(lines[0].indexOf('SV-01') === 0, caseName('SaveRuleCases', '0007'), 'NoteSaveTrashCases.test.ets:A0028').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVERULECASES_0800
     * @tc.name      testSaveRuleCases0008
     * @tc.desc      Verify save input defaults to no facts
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it(caseName('SaveRuleCases', '0008'), 0, (): void => {
      const input: SaveInput = new SaveInput();
      expect(input.baselineRevision, caseName('SaveRuleCases', '0008'), 'NoteSaveTrashCases.test.ets:A0029').assertEqual(0);
      expect(input.localRevision, caseName('SaveRuleCases', '0008'), 'NoteSaveTrashCases.test.ets:A0030').assertEqual(0);
      expect(input.remoteRevision, caseName('SaveRuleCases', '0008'), 'NoteSaveTrashCases.test.ets:A0031').assertEqual(0);
      expect(input.recoveryActive, caseName('SaveRuleCases', '0008'), 'NoteSaveTrashCases.test.ets:A0032').assertFalse();
      expect(input.trashed, caseName('SaveRuleCases', '0008'), 'NoteSaveTrashCases.test.ets:A0033').assertFalse();
      expect(input.writeUncertain, caseName('SaveRuleCases', '0008'), 'NoteSaveTrashCases.test.ets:A0034').assertFalse();
    });
  });

  describe('SaveDecisionCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_0100
     * @tc.name      testSaveDecisionCases0001
     * @tc.desc      Verify decision defaults are safe
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it(caseName('SaveDecisionCases', '0001'), 0, (): void => {
      const decision: SaveDecision = new SaveDecision();
      expect(decision.outcome, caseName('SaveDecisionCases', '0001'), 'NoteSaveTrashCases.test.ets:A0035').assertEqual(SaveOutcome.SAFE);
      expect(decision.code, caseName('SaveDecisionCases', '0001'), 'NoteSaveTrashCases.test.ets:A0036').assertEqual('');
      expect(decision.message, caseName('SaveDecisionCases', '0001'), 'NoteSaveTrashCases.test.ets:A0037').assertEqual('');
      expect(decision.writable(), caseName('SaveDecisionCases', '0001'), 'NoteSaveTrashCases.test.ets:A0038').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_0200
     * @tc.name      testSaveDecisionCases0002
     * @tc.desc      Verify writable only for safe
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SaveDecisionCases', '0002'), 0, (): void => {
      expect(new SaveDecision('a', SaveOutcome.SAFE, '').writable(), caseName('SaveDecisionCases', '0002'), 'NoteSaveTrashCases.test.ets:A0039').assertTrue();
      expect(new SaveDecision('a', SaveOutcome.BRANCH, '').writable(), caseName('SaveDecisionCases', '0002'), 'NoteSaveTrashCases.test.ets:A0040').assertFalse();
      expect(new SaveDecision('a', SaveOutcome.CONFIRM, '').writable(), caseName('SaveDecisionCases', '0002'), 'NoteSaveTrashCases.test.ets:A0041').assertFalse();
      expect(new SaveDecision('a', SaveOutcome.BLOCKED, '').writable(), caseName('SaveDecisionCases', '0002'), 'NoteSaveTrashCases.test.ets:A0042').assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_0300
     * @tc.name      testSaveDecisionCases0003
     * @tc.desc      Verify decision describe joins facts
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SaveDecisionCases', '0003'), 0, (): void => {
      const decision: SaveDecision = new SaveDecision('SV-05', SaveOutcome.BRANCH, '另存分支');
      expect(decision.describe(), caseName('SaveDecisionCases', '0003'), 'NoteSaveTrashCases.test.ets:A0043').assertEqual('SV-05｜另存为新分支｜另存分支');
      expect(decision.describe().split('｜').length, caseName('SaveDecisionCases', '0003'), 'NoteSaveTrashCases.test.ets:A0044').assertEqual(3);
      expect(decision.code, caseName('SaveDecisionCases', '0003'), 'NoteSaveTrashCases.test.ets:A0045').assertEqual('SV-05');
      expect(decision.outcome, caseName('SaveDecisionCases', '0003'), 'NoteSaveTrashCases.test.ets:A0046').assertEqual(SaveOutcome.BRANCH);
      expect(decision.message, caseName('SaveDecisionCases', '0003'), 'NoteSaveTrashCases.test.ets:A0047').assertEqual('另存分支');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_0400
     * @tc.name      testSaveDecisionCases0004
     * @tc.desc      Verify identical revisions are safe
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SaveDecisionCases', '0004'), 0, (): void => {
      const decision: SaveDecision = decideSave(inputOf(3, 3, 3));
      expect(decision.code, caseName('SaveDecisionCases', '0004'), 'NoteSaveTrashCases.test.ets:A0048').assertEqual('SV-01');
      expect(decision.outcome, caseName('SaveDecisionCases', '0004'), 'NoteSaveTrashCases.test.ets:A0049').assertEqual(SaveOutcome.SAFE);
      expect(decision.writable(), caseName('SaveDecisionCases', '0004'), 'NoteSaveTrashCases.test.ets:A0050').assertTrue();
      expect(decision.message, caseName('SaveDecisionCases', '0004'), 'NoteSaveTrashCases.test.ets:A0051').assertEqual('没有新变化，保存不改变内容');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_0500
     * @tc.name      testSaveDecisionCases0005
     * @tc.desc      Verify local ahead is safe
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SaveDecisionCases', '0005'), 0, (): void => {
      const decision: SaveDecision = decideSave(inputOf(2, 5, 2));
      expect(decision.code, caseName('SaveDecisionCases', '0005'), 'NoteSaveTrashCases.test.ets:A0052').assertEqual('SV-02');
      expect(decision.outcome, caseName('SaveDecisionCases', '0005'), 'NoteSaveTrashCases.test.ets:A0053').assertEqual(SaveOutcome.SAFE);
      expect(saveAdvice(decision), caseName('SaveDecisionCases', '0005'), 'NoteSaveTrashCases.test.ets:A0054').assertEqual('可以保存');
      expect(decision.message, caseName('SaveDecisionCases', '0005'), 'NoteSaveTrashCases.test.ets:A0055').assertEqual('常规保存');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_0600
     * @tc.name      testSaveDecisionCases0006
     * @tc.desc      Verify remote ahead needs confirmation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SaveDecisionCases', '0006'), 0, (): void => {
      const decision: SaveDecision = decideSave(inputOf(2, 2, 5));
      expect(decision.code, caseName('SaveDecisionCases', '0006'), 'NoteSaveTrashCases.test.ets:A0056').assertEqual('SV-03');
      expect(decision.outcome, caseName('SaveDecisionCases', '0006'), 'NoteSaveTrashCases.test.ets:A0057').assertEqual(SaveOutcome.CONFIRM);
      expect(decision.writable(), caseName('SaveDecisionCases', '0006'), 'NoteSaveTrashCases.test.ets:A0058').assertFalse();
      expect(decision.message, caseName('SaveDecisionCases', '0006'), 'NoteSaveTrashCases.test.ets:A0059').assertEqual('本机内容已过期，保存会覆盖对端');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_0700
     * @tc.name      testSaveDecisionCases0007
     * @tc.desc      Verify converged revisions are safe
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SaveDecisionCases', '0007'), 0, (): void => {
      const decision: SaveDecision = decideSave(inputOf(2, 6, 6));
      expect(decision.code, caseName('SaveDecisionCases', '0007'), 'NoteSaveTrashCases.test.ets:A0060').assertEqual('SV-04');
      expect(decision.outcome, caseName('SaveDecisionCases', '0007'), 'NoteSaveTrashCases.test.ets:A0061').assertEqual(SaveOutcome.SAFE);
      expect(decision.message, caseName('SaveDecisionCases', '0007'), 'NoteSaveTrashCases.test.ets:A0062').assertEqual('收敛到同一版本');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_0800
     * @tc.name      testSaveDecisionCases0008
     * @tc.desc      Verify diverged revisions branch
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SaveDecisionCases', '0008'), 0, (): void => {
      const decision: SaveDecision = decideSave(inputOf(2, 5, 7));
      expect(decision.code, caseName('SaveDecisionCases', '0008'), 'NoteSaveTrashCases.test.ets:A0063').assertEqual('SV-05');
      expect(decision.outcome, caseName('SaveDecisionCases', '0008'), 'NoteSaveTrashCases.test.ets:A0064').assertEqual(SaveOutcome.BRANCH);
      expect(decision.writable(), caseName('SaveDecisionCases', '0008'), 'NoteSaveTrashCases.test.ets:A0065').assertFalse();
      expect(decision.message, caseName('SaveDecisionCases', '0008'), 'NoteSaveTrashCases.test.ets:A0066').assertEqual('另存为新分支，两侧都保留');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_0900
     * @tc.name      testSaveDecisionCases0009
     * @tc.desc      Verify remote below baseline needs confirm
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SaveDecisionCases', '0009'), 0, (): void => {
      const decision: SaveDecision = decideSave(inputOf(5, 5, 3));
      expect(decision.code, caseName('SaveDecisionCases', '0009'), 'NoteSaveTrashCases.test.ets:A0067').assertEqual('SV-06');
      expect(decision.outcome, caseName('SaveDecisionCases', '0009'), 'NoteSaveTrashCases.test.ets:A0068').assertEqual(SaveOutcome.CONFIRM);
      expect(decision.message, caseName('SaveDecisionCases', '0009'), 'NoteSaveTrashCases.test.ets:A0069').assertEqual('对端可能回滚过，保存前需确认');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_1000
     * @tc.name      testSaveDecisionCases0010
     * @tc.desc      Verify missing local revision blocks
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SaveDecisionCases', '0010'), 0, (): void => {
      const zero: SaveDecision = decideSave(inputOf(3, 0, 3));
      expect(zero.code, caseName('SaveDecisionCases', '0010'), 'NoteSaveTrashCases.test.ets:A0070').assertEqual('SV-07');
      expect(zero.outcome, caseName('SaveDecisionCases', '0010'), 'NoteSaveTrashCases.test.ets:A0071').assertEqual(SaveOutcome.BLOCKED);
      expect(zero.message, caseName('SaveDecisionCases', '0010'), 'NoteSaveTrashCases.test.ets:A0072').assertEqual('缺少本机修订号，不允许写入');
      const negative: SaveDecision = decideSave(inputOf(3, -2, 3));
      expect(negative.code, caseName('SaveDecisionCases', '0010'), 'NoteSaveTrashCases.test.ets:A0073').assertEqual('SV-07');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_1100
     * @tc.name      testSaveDecisionCases0011
     * @tc.desc      Verify active recovery blocks
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SaveDecisionCases', '0011'), 0, (): void => {
      const input: SaveInput = inputOf(1, 2, 1);
      input.recoveryActive = true;
      const decision: SaveDecision = decideSave(input);
      expect(decision.code, caseName('SaveDecisionCases', '0011'), 'NoteSaveTrashCases.test.ets:A0074').assertEqual('SV-08');
      expect(decision.outcome, caseName('SaveDecisionCases', '0011'), 'NoteSaveTrashCases.test.ets:A0075').assertEqual(SaveOutcome.BLOCKED);
      expect(decision.message, caseName('SaveDecisionCases', '0011'), 'NoteSaveTrashCases.test.ets:A0076').assertEqual('恢复在途时写入会产生不确定结果');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_1200
     * @tc.name      testSaveDecisionCases0012
     * @tc.desc      Verify trashed note blocks
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SaveDecisionCases', '0012'), 0, (): void => {
      const input: SaveInput = inputOf(1, 2, 1);
      input.trashed = true;
      const decision: SaveDecision = decideSave(input);
      expect(decision.code, caseName('SaveDecisionCases', '0012'), 'NoteSaveTrashCases.test.ets:A0077').assertEqual('SV-09');
      expect(decision.outcome, caseName('SaveDecisionCases', '0012'), 'NoteSaveTrashCases.test.ets:A0078').assertEqual(SaveOutcome.BLOCKED);
      expect(decision.message, caseName('SaveDecisionCases', '0012'), 'NoteSaveTrashCases.test.ets:A0079').assertEqual('回收站内笔记不可直接保存');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_1300
     * @tc.name      testSaveDecisionCases0013
     * @tc.desc      Verify uncertain write needs confirm
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SaveDecisionCases', '0013'), 0, (): void => {
      const input: SaveInput = inputOf(1, 2, 1);
      input.writeUncertain = true;
      const decision: SaveDecision = decideSave(input);
      expect(decision.code, caseName('SaveDecisionCases', '0013'), 'NoteSaveTrashCases.test.ets:A0080').assertEqual('SV-10');
      expect(decision.outcome, caseName('SaveDecisionCases', '0013'), 'NoteSaveTrashCases.test.ets:A0081').assertEqual(SaveOutcome.CONFIRM);
      expect(decision.message, caseName('SaveDecisionCases', '0013'), 'NoteSaveTrashCases.test.ets:A0082').assertEqual('需先读回磁盘再决定');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_1400
     * @tc.name      testSaveDecisionCases0014
     * @tc.desc      Verify recovery beats every other block
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SaveDecisionCases', '0014'), 0, (): void => {
      const input: SaveInput = inputOf(1, 0, 1);
      input.recoveryActive = true;
      input.trashed = true;
      input.writeUncertain = true;
      expect(decideSave(input).code, caseName('SaveDecisionCases', '0014'), 'NoteSaveTrashCases.test.ets:A0083').assertEqual('SV-08');
      expect(decideSave(input).outcome, caseName('SaveDecisionCases', '0014'), 'NoteSaveTrashCases.test.ets:A0084').assertEqual(SaveOutcome.BLOCKED);
      expect(saveAdvice(decideSave(input)), caseName('SaveDecisionCases', '0014'), 'NoteSaveTrashCases.test.ets:A0085').assertEqual(decideSave(input).message);
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_1500
     * @tc.name      testSaveDecisionCases0015
     * @tc.desc      Verify trash beats missing revision
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SaveDecisionCases', '0015'), 0, (): void => {
      const input: SaveInput = inputOf(1, 0, 1);
      input.trashed = true;
      input.writeUncertain = true;
      expect(decideSave(input).code, caseName('SaveDecisionCases', '0015'), 'NoteSaveTrashCases.test.ets:A0086').assertEqual('SV-09');
      expect(decideSave(input).outcome, caseName('SaveDecisionCases', '0015'), 'NoteSaveTrashCases.test.ets:A0087').assertEqual(SaveOutcome.BLOCKED);
      expect(decideSave(input).code === 'SV-08', caseName('SaveDecisionCases', '0015'), 'NoteSaveTrashCases.test.ets:A0088').assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_1600
     * @tc.name      testSaveDecisionCases0016
     * @tc.desc      Verify missing revision beats uncertain write
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SaveDecisionCases', '0016'), 0, (): void => {
      const input: SaveInput = inputOf(1, 0, 1);
      input.writeUncertain = true;
      expect(decideSave(input).code, caseName('SaveDecisionCases', '0016'), 'NoteSaveTrashCases.test.ets:A0089').assertEqual('SV-07');
      expect(decideSave(input).outcome, caseName('SaveDecisionCases', '0016'), 'NoteSaveTrashCases.test.ets:A0090').assertEqual(SaveOutcome.BLOCKED);
      expect(decideSave(input).code === 'SV-09', caseName('SaveDecisionCases', '0016'), 'NoteSaveTrashCases.test.ets:A0091').assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_1700
     * @tc.name      testSaveDecisionCases0017
     * @tc.desc      Verify uncertain write beats divergence
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SaveDecisionCases', '0017'), 0, (): void => {
      const input: SaveInput = inputOf(2, 5, 7);
      input.writeUncertain = true;
      const decision: SaveDecision = decideSave(input);
      expect(decision.code, caseName('SaveDecisionCases', '0017'), 'NoteSaveTrashCases.test.ets:A0092').assertEqual('SV-10');
      expect(decision.code === 'SV-05', caseName('SaveDecisionCases', '0017'), 'NoteSaveTrashCases.test.ets:A0093').assertFalse();
      expect(decision.code === 'SV-07', caseName('SaveDecisionCases', '0017'), 'NoteSaveTrashCases.test.ets:A0094').assertFalse();
      expect(decision.message.length > 0, caseName('SaveDecisionCases', '0017'), 'NoteSaveTrashCases.test.ets:A0095').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_1800
     * @tc.name      testSaveDecisionCases0018
     * @tc.desc      Verify rollback beats no change
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SaveDecisionCases', '0018'), 0, (): void => {
      const decision: SaveDecision = decideSave(inputOf(4, 4, 2));
      expect(decision.code, caseName('SaveDecisionCases', '0018'), 'NoteSaveTrashCases.test.ets:A0096').assertEqual('SV-06');
      expect(decision.code === 'SV-01', caseName('SaveDecisionCases', '0018'), 'NoteSaveTrashCases.test.ets:A0097').assertFalse();
      expect(decision.message.length > 0, caseName('SaveDecisionCases', '0018'), 'NoteSaveTrashCases.test.ets:A0098').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_1900
     * @tc.name      testSaveDecisionCases0019
     * @tc.desc      Verify rollback beats divergence
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SaveDecisionCases', '0019'), 0, (): void => {
      const decision: SaveDecision = decideSave(inputOf(6, 9, 5));
      expect(decision.code, caseName('SaveDecisionCases', '0019'), 'NoteSaveTrashCases.test.ets:A0099').assertEqual('SV-06');
      expect(decision.outcome, caseName('SaveDecisionCases', '0019'), 'NoteSaveTrashCases.test.ets:A0100').assertEqual(SaveOutcome.CONFIRM);
      expect(decision.code === 'SV-05', caseName('SaveDecisionCases', '0019'), 'NoteSaveTrashCases.test.ets:A0101').assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_2000
     * @tc.name      testSaveDecisionCases0020
     * @tc.desc      Verify local rollback is not special
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SaveDecisionCases', '0020'), 0, (): void => {
      const decision: SaveDecision = decideSave(inputOf(5, 3, 5));
      expect(decision.code, caseName('SaveDecisionCases', '0020'), 'NoteSaveTrashCases.test.ets:A0102').assertEqual('SV-01');
      expect(decision.outcome, caseName('SaveDecisionCases', '0020'), 'NoteSaveTrashCases.test.ets:A0103').assertEqual(SaveOutcome.SAFE);
      expect(decision.code === 'SV-06', caseName('SaveDecisionCases', '0020'), 'NoteSaveTrashCases.test.ets:A0104').assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_2100
     * @tc.name      testSaveDecisionCases0021
     * @tc.desc      Verify zero baseline with local only is safe
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SaveDecisionCases', '0021'), 0, (): void => {
      const decision: SaveDecision = decideSave(inputOf(0, 1, 0));
      expect(decision.code, caseName('SaveDecisionCases', '0021'), 'NoteSaveTrashCases.test.ets:A0105').assertEqual('SV-02');
      expect(decision.outcome, caseName('SaveDecisionCases', '0021'), 'NoteSaveTrashCases.test.ets:A0106').assertEqual(SaveOutcome.SAFE);
      expect(saveAdvice(decision).length > 0, caseName('SaveDecisionCases', '0021'), 'NoteSaveTrashCases.test.ets:A0107').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_2200
     * @tc.name      testSaveDecisionCases0022
     * @tc.desc      Verify zero baseline cannot show remote only
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SaveDecisionCases', '0022'), 0, (): void => {
      expect(decideSave(inputOf(0, 0, 1)).code, caseName('SaveDecisionCases', '0022'), 'NoteSaveTrashCases.test.ets:A0108').assertEqual('SV-07');
      expect(decideSave(inputOf(0, 1, 0)).code, caseName('SaveDecisionCases', '0022'), 'NoteSaveTrashCases.test.ets:A0109').assertEqual('SV-02');
      expect(decideSave(inputOf(0, 0, 0)).code, caseName('SaveDecisionCases', '0022'), 'NoteSaveTrashCases.test.ets:A0110').assertEqual('SV-07');
      expect(decideSave(inputOf(0, 0, 1)).outcome, caseName('SaveDecisionCases', '0022'), 'NoteSaveTrashCases.test.ets:A0111').assertEqual(SaveOutcome.BLOCKED);
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_2300
     * @tc.name      testSaveDecisionCases0023
     * @tc.desc      Verify revisions are decision only
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SaveDecisionCases', '0023'), 0, (): void => {
      const first: SaveDecision = decideSave(inputOf(2, 5, 2));
      const second: SaveDecision = decideSave(inputOf(2, 5, 2));
      expect(first.code, caseName('SaveDecisionCases', '0023'), 'NoteSaveTrashCases.test.ets:A0112').assertEqual(second.code);
      expect(first.message, caseName('SaveDecisionCases', '0023'), 'NoteSaveTrashCases.test.ets:A0113').assertEqual(second.message);
      expect(first.outcome, caseName('SaveDecisionCases', '0023'), 'NoteSaveTrashCases.test.ets:A0114').assertEqual(second.outcome);
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_2400
     * @tc.name      testSaveDecisionCases0024
     * @tc.desc      Verify advice for safe decision
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SaveDecisionCases', '0024'), 0, (): void => {
      expect(saveAdvice(decideSave(inputOf(3, 3, 3))), caseName('SaveDecisionCases', '0024'), 'NoteSaveTrashCases.test.ets:A0115').assertEqual('可以保存');
      expect(saveAdvice(new SaveDecision('x', SaveOutcome.SAFE, '任意')), caseName('SaveDecisionCases', '0024'), 'NoteSaveTrashCases.test.ets:A0116').assertEqual('可以保存');
      expect(saveAdvice(new SaveDecision('x', SaveOutcome.SAFE, '任意')).length, caseName('SaveDecisionCases', '0024'), 'NoteSaveTrashCases.test.ets:A0117').assertEqual(4);
      expect(saveAdvice(new SaveDecision('x', SaveOutcome.SAFE, '完全不同的提示')), caseName('SaveDecisionCases', '0024'), 'NoteSaveTrashCases.test.ets:A0118')
        .assertEqual('可以保存');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_2500
     * @tc.name      testSaveDecisionCases0025
     * @tc.desc      Verify advice for branch prefers new note
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SaveDecisionCases', '0025'), 0, (): void => {
      const advice: string = saveAdvice(decideSave(inputOf(2, 5, 7)));
      expect(advice, caseName('SaveDecisionCases', '0025'), 'NoteSaveTrashCases.test.ets:A0119').assertEqual('建议另存为新分支，保留两侧内容');
      expect(advice.indexOf('两侧') > 0, caseName('SaveDecisionCases', '0025'), 'NoteSaveTrashCases.test.ets:A0120').assertTrue();
      expect(advice === '可以保存', caseName('SaveDecisionCases', '0025'), 'NoteSaveTrashCases.test.ets:A0121').assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_2600
     * @tc.name      testSaveDecisionCases0026
     * @tc.desc      Verify advice for confirm reuses message
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SaveDecisionCases', '0026'), 0, (): void => {
      const decision: SaveDecision = decideSave(inputOf(2, 2, 5));
      expect(saveAdvice(decision), caseName('SaveDecisionCases', '0026'), 'NoteSaveTrashCases.test.ets:A0122').assertEqual(decision.message);
      expect(saveAdvice(decision).indexOf('覆盖对端') > 0, caseName('SaveDecisionCases', '0026'), 'NoteSaveTrashCases.test.ets:A0123').assertTrue();
      expect(decision.code.length, caseName('SaveDecisionCases', '0026'), 'NoteSaveTrashCases.test.ets:A0124').assertEqual(5);
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_2700
     * @tc.name      testSaveDecisionCases0027
     * @tc.desc      Verify advice for blocked reuses message
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SaveDecisionCases', '0027'), 0, (): void => {
      const input: SaveInput = inputOf(1, 2, 1);
      input.recoveryActive = true;
      const decision: SaveDecision = decideSave(input);
      expect(saveAdvice(decision), caseName('SaveDecisionCases', '0027'), 'NoteSaveTrashCases.test.ets:A0125').assertEqual('恢复在途时写入会产生不确定结果');
      expect(saveAdvice(decision).indexOf('可以保存'), caseName('SaveDecisionCases', '0027'), 'NoteSaveTrashCases.test.ets:A0126').assertEqual(-1);
      expect(decision.code, caseName('SaveDecisionCases', '0027'), 'NoteSaveTrashCases.test.ets:A0127').assertEqual('SV-08');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_2800
     * @tc.name      testSaveDecisionCases0028
     * @tc.desc      Verify advice never empty
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SaveDecisionCases', '0028'), 0, (): void => {
      const cases: SaveInput[] = [inputOf(3, 3, 3), inputOf(2, 5, 2), inputOf(2, 2, 5),
        inputOf(2, 5, 7), inputOf(5, 5, 3), inputOf(3, 0, 3)];
      expect(cases.every((input: SaveInput): boolean =>
        saveAdvice(decideSave(input)).length > 0), caseName('SaveDecisionCases', '0028'), 'NoteSaveTrashCases.test.ets:A0128').assertTrue();
      expect(cases.length, caseName('SaveDecisionCases', '0028'), 'NoteSaveTrashCases.test.ets:A0129').assertEqual(6);
      expect(cases.every((input: SaveInput): boolean =>
        decideSave(input).code.length === 5), caseName('SaveDecisionCases', '0028'), 'NoteSaveTrashCases.test.ets:A0130').assertTrue();
    });
  });

  describe('TrashEntryCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_TRASHENTRYCASES_0100
     * @tc.name      testTrashEntryCases0001
     * @tc.desc      Verify entry defaults to trashed
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it(caseName('TrashEntryCases', '0001'), 0, (): void => {
      const entry: TrashEntry = new TrashEntry('n1', '标题');
      expect(entry.noteId, caseName('TrashEntryCases', '0001'), 'NoteSaveTrashCases.test.ets:A0131').assertEqual('n1');
      expect(entry.title, caseName('TrashEntryCases', '0001'), 'NoteSaveTrashCases.test.ets:A0132').assertEqual('标题');
      expect(entry.state, caseName('TrashEntryCases', '0001'), 'NoteSaveTrashCases.test.ets:A0133').assertEqual(TrashState.TRASHED);
      expect(entry.revision, caseName('TrashEntryCases', '0001'), 'NoteSaveTrashCases.test.ets:A0134').assertEqual(0);
      expect(entry.trashedAt, caseName('TrashEntryCases', '0001'), 'NoteSaveTrashCases.test.ets:A0135').assertEqual(0);
      expect(entry.origin, caseName('TrashEntryCases', '0001'), 'NoteSaveTrashCases.test.ets:A0136').assertEqual('');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHENTRYCASES_0200
     * @tc.name      testTrashEntryCases0002
     * @tc.desc      Verify entry describe marks unrecorded origin
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TrashEntryCases', '0002'), 0, (): void => {
      const entry: TrashEntry = new TrashEntry('n1', '周报');
      entry.revision = 4;
      expect(entry.describe(), caseName('TrashEntryCases', '0002'), 'NoteSaveTrashCases.test.ets:A0137').assertEqual('周报｜回收站｜修订 4｜来源 未记录');
      expect(entry.describe().indexOf('未记录') > 0, caseName('TrashEntryCases', '0002'), 'NoteSaveTrashCases.test.ets:A0138').assertTrue();
      expect(entry.noteId, caseName('TrashEntryCases', '0002'), 'NoteSaveTrashCases.test.ets:A0139').assertEqual('n1');
      expect(entry.title, caseName('TrashEntryCases', '0002'), 'NoteSaveTrashCases.test.ets:A0140').assertEqual('周报');
      expect(entry.revision, caseName('TrashEntryCases', '0002'), 'NoteSaveTrashCases.test.ets:A0141').assertEqual(4);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHENTRYCASES_0300
     * @tc.name      testTrashEntryCases0003
     * @tc.desc      Verify entry describe shows origin
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TrashEntryCases', '0003'), 0, (): void => {
      const entry: TrashEntry = new TrashEntry('n1', '周报');
      entry.revision = 2;
      entry.origin = '手动删除';
      expect(entry.describe(), caseName('TrashEntryCases', '0003'), 'NoteSaveTrashCases.test.ets:A0142').assertEqual('周报｜回收站｜修订 2｜来源 手动删除');
      expect(entry.describe().split('｜').length, caseName('TrashEntryCases', '0003'), 'NoteSaveTrashCases.test.ets:A0143').assertEqual(4);
      expect(entry.origin, caseName('TrashEntryCases', '0003'), 'NoteSaveTrashCases.test.ets:A0144').assertEqual('手动删除');
      expect(entry.state, caseName('TrashEntryCases', '0003'), 'NoteSaveTrashCases.test.ets:A0145').assertEqual(TrashState.TRASHED);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHENTRYCASES_0400
     * @tc.name      testTrashEntryCases0004
     * @tc.desc      Verify restorable within retention
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TrashEntryCases', '0004'), 0, (): void => {
      const entry: TrashEntry = new TrashEntry('n1', 'a');
      entry.trashedAt = 1000;
      expect(entry.restorable(1000, 10 * DAY), caseName('TrashEntryCases', '0004'), 'NoteSaveTrashCases.test.ets:A0146').assertTrue();
      expect(entry.restorable(1000 + 10 * DAY, 10 * DAY), caseName('TrashEntryCases', '0004'), 'NoteSaveTrashCases.test.ets:A0147').assertTrue();
      expect(entry.state, caseName('TrashEntryCases', '0004'), 'NoteSaveTrashCases.test.ets:A0148').assertEqual(TrashState.TRASHED);
      expect(entry.trashedAt, caseName('TrashEntryCases', '0004'), 'NoteSaveTrashCases.test.ets:A0149').assertEqual(1000);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHENTRYCASES_0500
     * @tc.name      testTrashEntryCases0005
     * @tc.desc      Verify restorable rejects expired
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TrashEntryCases', '0005'), 0, (): void => {
      const entry: TrashEntry = new TrashEntry('n1', 'a');
      entry.trashedAt = 1000;
      expect(entry.restorable(1001 + 10 * DAY, 10 * DAY), caseName('TrashEntryCases', '0005'), 'NoteSaveTrashCases.test.ets:A0150').assertFalse();
      expect(entry.state, caseName('TrashEntryCases', '0005'), 'NoteSaveTrashCases.test.ets:A0151').assertEqual(TrashState.TRASHED);
      expect(entry.restorable(1000 + 40 * DAY, 10 * DAY), caseName('TrashEntryCases', '0005'), 'NoteSaveTrashCases.test.ets:A0152').assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHENTRYCASES_0600
     * @tc.name      testTrashEntryCases0006
     * @tc.desc      Verify restorable rejects non trashed
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TrashEntryCases', '0006'), 0, (): void => {
      const entry: TrashEntry = new TrashEntry('n1', 'a');
      entry.state = TrashState.ACTIVE;
      expect(entry.restorable(1000, 10 * DAY), caseName('TrashEntryCases', '0006'), 'NoteSaveTrashCases.test.ets:A0153').assertFalse();
      entry.state = TrashState.PURGED;
      expect(entry.restorable(1000, 10 * DAY), caseName('TrashEntryCases', '0006'), 'NoteSaveTrashCases.test.ets:A0154').assertFalse();
      expect(entry.state, caseName('TrashEntryCases', '0006'), 'NoteSaveTrashCases.test.ets:A0155').assertEqual(TrashState.PURGED);
      expect(entry.title, caseName('TrashEntryCases', '0006'), 'NoteSaveTrashCases.test.ets:A0156').assertEqual('a');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHENTRYCASES_0700
     * @tc.name      testTrashEntryCases0007
     * @tc.desc      Verify state enum is closed
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TrashEntryCases', '0007'), 0, (): void => {
      expect(TrashState.ACTIVE, caseName('TrashEntryCases', '0007'), 'NoteSaveTrashCases.test.ets:A0157').assertEqual('正常');
      expect(TrashState.TRASHED, caseName('TrashEntryCases', '0007'), 'NoteSaveTrashCases.test.ets:A0158').assertEqual('回收站');
      expect(TrashState.PURGED, caseName('TrashEntryCases', '0007'), 'NoteSaveTrashCases.test.ets:A0159').assertEqual('已清除');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHENTRYCASES_0800
     * @tc.name      testTrashEntryCases0008
     * @tc.desc      Verify retention is thirty days
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TrashEntryCases', '0008'), 0, (): void => {
      expect(TRASH_RETENTION_DAYS, caseName('TrashEntryCases', '0008'), 'NoteSaveTrashCases.test.ets:A0160').assertEqual(30);
      expect(TRASH_RETENTION_DAYS * DAY, caseName('TrashEntryCases', '0008'), 'NoteSaveTrashCases.test.ets:A0161').assertEqual(2592000000);
      expect(TRASH_RETENTION_DAYS > 0, caseName('TrashEntryCases', '0008'), 'NoteSaveTrashCases.test.ets:A0162').assertTrue();
      expect(TRASH_RETENTION_DAYS * DAY > 0, caseName('TrashEntryCases', '0008'), 'NoteSaveTrashCases.test.ets:A0163').assertTrue();
    });
  });

  describe('TrashBinCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_TRASHBINCASES_0100
     * @tc.name      testTrashBinCases0001
     * @tc.desc      Verify trash adds entry
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TrashBinCases', '0001'), 0, (): void => {
      const bin: TrashBin = new TrashBin();
      expect(bin.trash('n1', '周报', 3, 1000, '手动删除'), caseName('TrashBinCases', '0001'), 'NoteSaveTrashCases.test.ets:A0164').assertTrue();
      expect(bin.size(), caseName('TrashBinCases', '0001'), 'NoteSaveTrashCases.test.ets:A0165').assertEqual(1);
      expect(bin.inTrash('n1'), caseName('TrashBinCases', '0001'), 'NoteSaveTrashCases.test.ets:A0166').assertTrue();
      expect(bin.trashed().length, caseName('TrashBinCases', '0001'), 'NoteSaveTrashCases.test.ets:A0167').assertEqual(1);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHBINCASES_0200
     * @tc.name      testTrashBinCases0002
     * @tc.desc      Verify trash rejects empty id
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TrashBinCases', '0002'), 0, (): void => {
      const bin: TrashBin = new TrashBin();
      expect(bin.trash('', '无编号', 1, 1000, ''), caseName('TrashBinCases', '0002'), 'NoteSaveTrashCases.test.ets:A0168').assertFalse();
      expect(bin.size(), caseName('TrashBinCases', '0002'), 'NoteSaveTrashCases.test.ets:A0169').assertEqual(0);
      expect(bin.trash('n1', 'x', 1, 1000, ''), caseName('TrashBinCases', '0002'), 'NoteSaveTrashCases.test.ets:A0170').assertTrue();
      expect(bin.size(), caseName('TrashBinCases', '0002'), 'NoteSaveTrashCases.test.ets:A0171').assertEqual(1);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHBINCASES_0300
     * @tc.name      testTrashBinCases0003
     * @tc.desc      Verify trash updates existing entry
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TrashBinCases', '0003'), 0, (): void => {
      const bin: TrashBin = new TrashBin();
      bin.trash('n1', '旧标题', 1, 1000, '手动删除');
      expect(bin.trash('n1', '新标题', 5, 2000, '批量删除'), caseName('TrashBinCases', '0003'), 'NoteSaveTrashCases.test.ets:A0172').assertTrue();
      expect(bin.size(), caseName('TrashBinCases', '0003'), 'NoteSaveTrashCases.test.ets:A0173').assertEqual(1);
      expect(bin.entryOf('n1')?.revision, caseName('TrashBinCases', '0003'), 'NoteSaveTrashCases.test.ets:A0174').assertEqual(5);
      expect(bin.entryOf('n1')?.origin, caseName('TrashBinCases', '0003'), 'NoteSaveTrashCases.test.ets:A0175').assertEqual('批量删除');
      expect(bin.entryOf('n1')?.trashedAt, caseName('TrashBinCases', '0003'), 'NoteSaveTrashCases.test.ets:A0176').assertEqual(2000);
      expect(bin.entryOf('n1')?.title, caseName('TrashBinCases', '0003'), 'NoteSaveTrashCases.test.ets:A0177').assertEqual('旧标题');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHBINCASES_0400
     * @tc.name      testTrashBinCases0004
     * @tc.desc      Verify entry of miss returns undefined
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TrashBinCases', '0004'), 0, (): void => {
      const bin: TrashBin = new TrashBin();
      bin.trash('n1', 'a', 1, 1000, '');
      expect(bin.entryOf('n1') !== undefined, caseName('TrashBinCases', '0004'), 'NoteSaveTrashCases.test.ets:A0178').assertTrue();
      expect(bin.entryOf('n2') === undefined, caseName('TrashBinCases', '0004'), 'NoteSaveTrashCases.test.ets:A0179').assertTrue();
      expect(bin.inTrash('n2'), caseName('TrashBinCases', '0004'), 'NoteSaveTrashCases.test.ets:A0180').assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHBINCASES_0500
     * @tc.name      testTrashBinCases0005
     * @tc.desc      Verify trashed lists only trashed
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TrashBinCases', '0005'), 0, (): void => {
      const bin: TrashBin = new TrashBin();
      bin.trash('n1', 'a', 1, 1000, '');
      bin.trash('n2', 'b', 1, 1000, '');
      bin.restore('n1', 2000);
      const items: TrashEntry[] = bin.trashed();
      expect(items.length, caseName('TrashBinCases', '0005'), 'NoteSaveTrashCases.test.ets:A0181').assertEqual(1);
      expect(items[0].noteId, caseName('TrashBinCases', '0005'), 'NoteSaveTrashCases.test.ets:A0182').assertEqual('n2');
      expect(bin.size(), caseName('TrashBinCases', '0005'), 'NoteSaveTrashCases.test.ets:A0183').assertEqual(2);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHBINCASES_0600
     * @tc.name      testTrashBinCases0006
     * @tc.desc      Verify restore within retention
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TrashBinCases', '0006'), 0, (): void => {
      const bin: TrashBin = new TrashBin();
      bin.trash('n1', 'a', 1, 1000, '');
      expect(bin.restore('n1', 1000 + 30 * DAY), caseName('TrashBinCases', '0006'), 'NoteSaveTrashCases.test.ets:A0184').assertTrue();
      expect(bin.inTrash('n1'), caseName('TrashBinCases', '0006'), 'NoteSaveTrashCases.test.ets:A0185').assertFalse();
      expect(bin.entryOf('n1')?.state, caseName('TrashBinCases', '0006'), 'NoteSaveTrashCases.test.ets:A0186').assertEqual(TrashState.ACTIVE);
      expect(bin.trashed().length, caseName('TrashBinCases', '0006'), 'NoteSaveTrashCases.test.ets:A0187').assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHBINCASES_0700
     * @tc.name      testTrashBinCases0007
     * @tc.desc      Verify restore after retention fails
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TrashBinCases', '0007'), 0, (): void => {
      const bin: TrashBin = new TrashBin();
      bin.trash('n1', 'a', 1, 1000, '');
      expect(bin.restore('n1', 1001 + 30 * DAY), caseName('TrashBinCases', '0007'), 'NoteSaveTrashCases.test.ets:A0188').assertFalse();
      expect(bin.inTrash('n1'), caseName('TrashBinCases', '0007'), 'NoteSaveTrashCases.test.ets:A0189').assertTrue();
      expect(bin.entryOf('n1')?.state, caseName('TrashBinCases', '0007'), 'NoteSaveTrashCases.test.ets:A0190').assertEqual(TrashState.TRASHED);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHBINCASES_0800
     * @tc.name      testTrashBinCases0008
     * @tc.desc      Verify restore rejects unknown id
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TrashBinCases', '0008'), 0, (): void => {
      const bin: TrashBin = new TrashBin();
      expect(bin.restore('missing', 1000), caseName('TrashBinCases', '0008'), 'NoteSaveTrashCases.test.ets:A0191').assertFalse();
      expect(bin.size(), caseName('TrashBinCases', '0008'), 'NoteSaveTrashCases.test.ets:A0192').assertEqual(0);
      expect(bin.restore('', 1000), caseName('TrashBinCases', '0008'), 'NoteSaveTrashCases.test.ets:A0193').assertFalse();
      expect(bin.trashed().length, caseName('TrashBinCases', '0008'), 'NoteSaveTrashCases.test.ets:A0194').assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHBINCASES_0900
     * @tc.name      testTrashBinCases0009
     * @tc.desc      Verify restore rejects already active
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TrashBinCases', '0009'), 0, (): void => {
      const bin: TrashBin = new TrashBin();
      bin.trash('n1', 'a', 1, 1000, '');
      bin.restore('n1', 2000);
      expect(bin.restore('n1', 3000), caseName('TrashBinCases', '0009'), 'NoteSaveTrashCases.test.ets:A0195').assertFalse();
      expect(bin.entryOf('n1')?.state, caseName('TrashBinCases', '0009'), 'NoteSaveTrashCases.test.ets:A0196').assertEqual(TrashState.ACTIVE);
      expect(bin.entryOf('n1') === undefined, caseName('TrashBinCases', '0009'), 'NoteSaveTrashCases.test.ets:A0197').assertFalse();
      expect(bin.trashed().length, caseName('TrashBinCases', '0009'), 'NoteSaveTrashCases.test.ets:A0198').assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHBINCASES_1000
     * @tc.name      testTrashBinCases0010
     * @tc.desc      Verify purge removes only expired
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TrashBinCases', '0010'), 0, (): void => {
      const bin: TrashBin = new TrashBin();
      bin.trash('old', '旧', 1, 1000, '');
      bin.trash('fresh', '新', 1, 1000 + 20 * DAY, '');
      const removed: TrashEntry[] = bin.purge(1001 + 30 * DAY);
      expect(removed.length, caseName('TrashBinCases', '0010'), 'NoteSaveTrashCases.test.ets:A0199').assertEqual(1);
      expect(removed[0].noteId, caseName('TrashBinCases', '0010'), 'NoteSaveTrashCases.test.ets:A0200').assertEqual('old');
      expect(bin.entryOf('old')?.state, caseName('TrashBinCases', '0010'), 'NoteSaveTrashCases.test.ets:A0201').assertEqual(TrashState.PURGED);
      expect(bin.entryOf('fresh')?.state, caseName('TrashBinCases', '0010'), 'NoteSaveTrashCases.test.ets:A0202').assertEqual(TrashState.TRASHED);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHBINCASES_1100
     * @tc.name      testTrashBinCases0011
     * @tc.desc      Verify purge keeps boundary entry
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TrashBinCases', '0011'), 0, (): void => {
      const bin: TrashBin = new TrashBin();
      bin.trash('n1', 'a', 1, 1000, '');
      expect(bin.purge(1000 + 30 * DAY).length, caseName('TrashBinCases', '0011'), 'NoteSaveTrashCases.test.ets:A0203').assertEqual(0);
      expect(bin.entryOf('n1')?.state, caseName('TrashBinCases', '0011'), 'NoteSaveTrashCases.test.ets:A0204').assertEqual(TrashState.TRASHED);
      expect(bin.purge(1001 + 30 * DAY).length, caseName('TrashBinCases', '0011'), 'NoteSaveTrashCases.test.ets:A0205').assertEqual(1);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHBINCASES_1200
     * @tc.name      testTrashBinCases0012
     * @tc.desc      Verify purge skips active entries
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TrashBinCases', '0012'), 0, (): void => {
      const bin: TrashBin = new TrashBin();
      bin.trash('n1', 'a', 1, 1000, '');
      bin.restore('n1', 2000);
      expect(bin.purge(1001 + 40 * DAY).length, caseName('TrashBinCases', '0012'), 'NoteSaveTrashCases.test.ets:A0206').assertEqual(0);
      expect(bin.entryOf('n1')?.state, caseName('TrashBinCases', '0012'), 'NoteSaveTrashCases.test.ets:A0207').assertEqual(TrashState.ACTIVE);
      expect(bin.size(), caseName('TrashBinCases', '0012'), 'NoteSaveTrashCases.test.ets:A0208').assertEqual(1);
      expect(bin.trashed().length, caseName('TrashBinCases', '0012'), 'NoteSaveTrashCases.test.ets:A0209').assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHBINCASES_1300
     * @tc.name      testTrashBinCases0013
     * @tc.desc      Verify purged entry cannot be restored
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TrashBinCases', '0013'), 0, (): void => {
      const bin: TrashBin = new TrashBin();
      bin.trash('n1', 'a', 1, 1000, '');
      bin.purge(1001 + 30 * DAY);
      expect(bin.restore('n1', 1002 + 30 * DAY), caseName('TrashBinCases', '0013'), 'NoteSaveTrashCases.test.ets:A0210').assertFalse();
      expect(bin.inTrash('n1'), caseName('TrashBinCases', '0013'), 'NoteSaveTrashCases.test.ets:A0211').assertFalse();
      expect(bin.entryOf('n1')?.state, caseName('TrashBinCases', '0013'), 'NoteSaveTrashCases.test.ets:A0212').assertEqual(TrashState.PURGED);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHBINCASES_1400
     * @tc.name      testTrashBinCases0014
     * @tc.desc      Verify size counts purged entries
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TrashBinCases', '0014'), 0, (): void => {
      const bin: TrashBin = new TrashBin();
      bin.trash('a', 'a', 1, 1000, '');
      bin.trash('b', 'b', 1, 1000, '');
      bin.purge(1001 + 30 * DAY);
      expect(bin.size(), caseName('TrashBinCases', '0014'), 'NoteSaveTrashCases.test.ets:A0213').assertEqual(2);
      expect(bin.trashed().length, caseName('TrashBinCases', '0014'), 'NoteSaveTrashCases.test.ets:A0214').assertEqual(0);
      expect(bin.entryOf('a')?.state, caseName('TrashBinCases', '0014'), 'NoteSaveTrashCases.test.ets:A0215').assertEqual(TrashState.PURGED);
      expect(bin.trash('c', 'c', 1, 1000, ''), caseName('TrashBinCases', '0014'), 'NoteSaveTrashCases.test.ets:A0216').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHBINCASES_1500
     * @tc.name      testTrashBinCases0015
     * @tc.desc      Verify retrash after restore works
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TrashBinCases', '0015'), 0, (): void => {
      const bin: TrashBin = new TrashBin();
      bin.trash('n1', 'a', 1, 1000, '');
      bin.restore('n1', 2000);
      expect(bin.trash('n1', 'a', 2, 3000, '再次删除'), caseName('TrashBinCases', '0015'), 'NoteSaveTrashCases.test.ets:A0217').assertTrue();
      expect(bin.inTrash('n1'), caseName('TrashBinCases', '0015'), 'NoteSaveTrashCases.test.ets:A0218').assertTrue();
      expect(bin.entryOf('n1')?.trashedAt, caseName('TrashBinCases', '0015'), 'NoteSaveTrashCases.test.ets:A0219').assertEqual(3000);
      expect(bin.size(), caseName('TrashBinCases', '0015'), 'NoteSaveTrashCases.test.ets:A0220').assertEqual(1);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHBINCASES_1600
     * @tc.name      testTrashBinCases0016
     * @tc.desc      Verify empty bin reports nothing
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TrashBinCases', '0016'), 0, (): void => {
      const bin: TrashBin = new TrashBin();
      expect(bin.size(), caseName('TrashBinCases', '0016'), 'NoteSaveTrashCases.test.ets:A0221').assertEqual(0);
      expect(bin.trashed().length, caseName('TrashBinCases', '0016'), 'NoteSaveTrashCases.test.ets:A0222').assertEqual(0);
      expect(bin.purge(1000).length, caseName('TrashBinCases', '0016'), 'NoteSaveTrashCases.test.ets:A0223').assertEqual(0);
      expect(bin.inTrash('any'), caseName('TrashBinCases', '0016'), 'NoteSaveTrashCases.test.ets:A0224').assertFalse();
    });
  });

  describe('TrashLinesCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_TRASHLINESCASES_0100
     * @tc.name      testTrashLinesCases0001
     * @tc.desc      Verify empty bin line
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TrashLinesCases', '0001'), 0, (): void => {
      const lines: string[] = trashLines(new TrashBin(), 1000);
      expect(lines.length, caseName('TrashLinesCases', '0001'), 'NoteSaveTrashCases.test.ets:A0225').assertEqual(1);
      expect(lines[0], caseName('TrashLinesCases', '0001'), 'NoteSaveTrashCases.test.ets:A0226').assertEqual('回收站为空');
      expect(lines[0].length, caseName('TrashLinesCases', '0001'), 'NoteSaveTrashCases.test.ets:A0227').assertEqual(5);
      expect(lines[0].indexOf('为空') > 0, caseName('TrashLinesCases', '0001'), 'NoteSaveTrashCases.test.ets:A0228').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHLINESCASES_0200
     * @tc.name      testTrashLinesCases0002
     * @tc.desc      Verify headline counts items
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TrashLinesCases', '0002'), 0, (): void => {
      const bin: TrashBin = new TrashBin();
      bin.trash('n1', 'a', 1, 1000, '');
      bin.trash('n2', 'b', 1, 1000, '');
      const lines: string[] = trashLines(bin, 1000);
      expect(lines[0], caseName('TrashLinesCases', '0002'), 'NoteSaveTrashCases.test.ets:A0229').assertEqual('回收站 2 项｜保留 30 天');
      expect(lines.length, caseName('TrashLinesCases', '0002'), 'NoteSaveTrashCases.test.ets:A0230').assertEqual(3);
      expect(lines[0].indexOf('保留 30 天') > 0, caseName('TrashLinesCases', '0002'), 'NoteSaveTrashCases.test.ets:A0231').assertTrue();
      expect(lines[0].split('｜').length, caseName('TrashLinesCases', '0002'), 'NoteSaveTrashCases.test.ets:A0232').assertEqual(2);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHLINESCASES_0300
     * @tc.name      testTrashLinesCases0003
     * @tc.desc      Verify line shows restorable state
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TrashLinesCases', '0003'), 0, (): void => {
      const bin: TrashBin = new TrashBin();
      bin.trash('n1', '周报', 3, 1000, '手动删除');
      const lines: string[] = trashLines(bin, 1000 + 2 * DAY);
      expect(lines[1], caseName('TrashLinesCases', '0003'), 'NoteSaveTrashCases.test.ets:A0233').assertEqual('周报｜回收站｜修订 3｜来源 手动删除｜可恢复（已存 2 天）');
      expect(lines[1].indexOf('可恢复') > 0, caseName('TrashLinesCases', '0003'), 'NoteSaveTrashCases.test.ets:A0234').assertTrue();
      expect(lines[1].indexOf('已存 2 天') > 0, caseName('TrashLinesCases', '0003'), 'NoteSaveTrashCases.test.ets:A0235').assertTrue();
      expect(lines[1].split('｜').length, caseName('TrashLinesCases', '0003'), 'NoteSaveTrashCases.test.ets:A0236').assertEqual(5);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHLINESCASES_0400
     * @tc.name      testTrashLinesCases0004
     * @tc.desc      Verify line marks expired entry
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TrashLinesCases', '0004'), 0, (): void => {
      const bin: TrashBin = new TrashBin();
      bin.trash('n1', '周报', 1, 1000, '');
      const lines: string[] = trashLines(bin, 1000 + 40 * DAY);
      expect(lines[1].indexOf('已过期') > 0, caseName('TrashLinesCases', '0004'), 'NoteSaveTrashCases.test.ets:A0237').assertTrue();
      expect(lines[1].indexOf('可恢复'), caseName('TrashLinesCases', '0004'), 'NoteSaveTrashCases.test.ets:A0238').assertEqual(-1);
      expect(lines.length, caseName('TrashLinesCases', '0004'), 'NoteSaveTrashCases.test.ets:A0239').assertEqual(2);
      expect(lines[1].substring(lines[1].length - 3), caseName('TrashLinesCases', '0004'), 'NoteSaveTrashCases.test.ets:A0240').assertEqual('已过期');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHLINESCASES_0500
     * @tc.name      testTrashLinesCases0005
     * @tc.desc      Verify days are floored
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TrashLinesCases', '0005'), 0, (): void => {
      const bin: TrashBin = new TrashBin();
      bin.trash('n1', 'a', 1, 0, '');
      expect(trashLines(bin, DAY - 1)[1].indexOf('已存 0 天') > 0, caseName('TrashLinesCases', '0005'), 'NoteSaveTrashCases.test.ets:A0241').assertTrue();
      expect(trashLines(bin, 3 * DAY + 5)[1].indexOf('已存 3 天') > 0, caseName('TrashLinesCases', '0005'), 'NoteSaveTrashCases.test.ets:A0242').assertTrue();
      expect(trashLines(bin, 0)[1].indexOf('已存 0 天') > 0, caseName('TrashLinesCases', '0005'), 'NoteSaveTrashCases.test.ets:A0243').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHLINESCASES_0600
     * @tc.name      testTrashLinesCases0006
     * @tc.desc      Verify lines skip restored entries
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TrashLinesCases', '0006'), 0, (): void => {
      const bin: TrashBin = new TrashBin();
      bin.trash('n1', 'a', 1, 1000, '');
      bin.trash('n2', 'b', 1, 1000, '');
      bin.restore('n1', 2000);
      const lines: string[] = trashLines(bin, 2000);
      expect(lines[0], caseName('TrashLinesCases', '0006'), 'NoteSaveTrashCases.test.ets:A0244').assertEqual('回收站 1 项｜保留 30 天');
      expect(lines.length, caseName('TrashLinesCases', '0006'), 'NoteSaveTrashCases.test.ets:A0245').assertEqual(2);
      expect(lines[1].indexOf('b｜') === 0, caseName('TrashLinesCases', '0006'), 'NoteSaveTrashCases.test.ets:A0246').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHLINESCASES_0700
     * @tc.name      testTrashLinesCases0007
     * @tc.desc      Verify lines skip purged entries
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TrashLinesCases', '0007'), 0, (): void => {
      const bin: TrashBin = new TrashBin();
      bin.trash('n1', 'a', 1, 1000, '');
      bin.purge(1001 + 30 * DAY);
      const lines: string[] = trashLines(bin, 1002 + 30 * DAY);
      expect(lines.length, caseName('TrashLinesCases', '0007'), 'NoteSaveTrashCases.test.ets:A0247').assertEqual(1);
      expect(lines[0], caseName('TrashLinesCases', '0007'), 'NoteSaveTrashCases.test.ets:A0248').assertEqual('回收站为空');
      expect(bin.size(), caseName('TrashLinesCases', '0007'), 'NoteSaveTrashCases.test.ets:A0249').assertEqual(1);
    });
  });
}

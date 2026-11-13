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
      expect(SAVE_RULES.length, caseName('SaveRuleCases', '0001')).assertEqual(10);
      const codes: string[] = SAVE_RULES.map((rule: SaveRule): string => rule.code);
      expect(codes[0], caseName('SaveRuleCases', '0001')).assertEqual('SV-01');
      expect(codes[9], caseName('SaveRuleCases', '0001')).assertEqual('SV-10');
      expect(codes.filter((code: string, index: number): boolean =>
        codes.indexOf(code) === index).length, caseName('SaveRuleCases', '0001')).assertEqual(10);
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
      expect(rule?.describe(), caseName('SaveRuleCases', '0002')).assertEqual(
        'SV-05｜双方都前进且修订号不同 → 另存为新分支｜另存为新分支，两侧都保留');
      expect(rule?.describe().split('｜').length, caseName('SaveRuleCases', '0002')).assertEqual(3);
      expect(rule === undefined, caseName('SaveRuleCases', '0002')).assertFalse();
      expect(rule?.outcome, caseName('SaveRuleCases', '0002')).assertEqual(SaveOutcome.BRANCH);
      expect(rule?.describe().indexOf('SV-05') === 0, caseName('SaveRuleCases', '0002')).assertTrue();
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
      expect(SaveOutcome.SAFE, caseName('SaveRuleCases', '0003')).assertEqual('可直接保存');
      expect(SaveOutcome.BRANCH, caseName('SaveRuleCases', '0003')).assertEqual('另存为新分支');
      expect(SaveOutcome.CONFIRM, caseName('SaveRuleCases', '0003')).assertEqual('需用户确认');
      expect(SaveOutcome.BLOCKED, caseName('SaveRuleCases', '0003')).assertEqual('保存被阻止');
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
      expect(SAVE_RULES.every((rule: SaveRule): boolean => rule.note.length > 0), caseName('SaveRuleCases', '0004')).assertTrue();
      expect(SAVE_RULES.every((rule: SaveRule): boolean =>
        rule.condition.length > 0), caseName('SaveRuleCases', '0004')).assertTrue();
      expect(SAVE_RULES.length > 0, caseName('SaveRuleCases', '0004')).assertTrue();
      expect(SAVE_RULES.every((rule: SaveRule): boolean => rule.code.length > 0), caseName('SaveRuleCases', '0004')).assertTrue();
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
      expect(blocked.length, caseName('SaveRuleCases', '0005')).assertEqual(3);
      expect(blocked.map((rule: SaveRule): string => rule.code).join(','), caseName('SaveRuleCases', '0005')).assertEqual(
        'SV-07,SV-08,SV-09');
      expect(blocked.filter((rule: SaveRule, index: number): boolean =>
        blocked.indexOf(rule) === index).length, caseName('SaveRuleCases', '0005')).assertEqual(3);
      expect(blocked.length < SAVE_RULES.length, caseName('SaveRuleCases', '0005')).assertTrue();
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
      expect(safe, caseName('SaveRuleCases', '0006')).assertEqual(3);
      expect(confirm, caseName('SaveRuleCases', '0006')).assertEqual(3);
      expect(branch, caseName('SaveRuleCases', '0006')).assertEqual(1);
      expect(safe + confirm + branch + 3, caseName('SaveRuleCases', '0006')).assertEqual(SAVE_RULES.length);
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
      expect(lines.length, caseName('SaveRuleCases', '0007')).assertEqual(SAVE_RULES.length);
      expect(lines.every((line: string): boolean => line.indexOf('→') > 0), caseName('SaveRuleCases', '0007')).assertTrue();
      expect(lines[0].indexOf('SV-01') === 0, caseName('SaveRuleCases', '0007')).assertTrue();
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
      expect(input.baselineRevision, caseName('SaveRuleCases', '0008')).assertEqual(0);
      expect(input.localRevision, caseName('SaveRuleCases', '0008')).assertEqual(0);
      expect(input.remoteRevision, caseName('SaveRuleCases', '0008')).assertEqual(0);
      expect(input.recoveryActive, caseName('SaveRuleCases', '0008')).assertFalse();
      expect(input.trashed, caseName('SaveRuleCases', '0008')).assertFalse();
      expect(input.writeUncertain, caseName('SaveRuleCases', '0008')).assertFalse();
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
      expect(decision.outcome, caseName('SaveDecisionCases', '0001')).assertEqual(SaveOutcome.SAFE);
      expect(decision.code, caseName('SaveDecisionCases', '0001')).assertEqual('');
      expect(decision.message, caseName('SaveDecisionCases', '0001')).assertEqual('');
      expect(decision.writable(), caseName('SaveDecisionCases', '0001')).assertTrue();
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
      expect(new SaveDecision('a', SaveOutcome.SAFE, '').writable(), caseName('SaveDecisionCases', '0002')).assertTrue();
      expect(new SaveDecision('a', SaveOutcome.BRANCH, '').writable(), caseName('SaveDecisionCases', '0002')).assertFalse();
      expect(new SaveDecision('a', SaveOutcome.CONFIRM, '').writable(), caseName('SaveDecisionCases', '0002')).assertFalse();
      expect(new SaveDecision('a', SaveOutcome.BLOCKED, '').writable(), caseName('SaveDecisionCases', '0002')).assertFalse();
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
      expect(decision.describe(), caseName('SaveDecisionCases', '0003')).assertEqual('SV-05｜另存为新分支｜另存分支');
      expect(decision.describe().split('｜').length, caseName('SaveDecisionCases', '0003')).assertEqual(3);
      expect(decision.code, caseName('SaveDecisionCases', '0003')).assertEqual('SV-05');
      expect(decision.outcome, caseName('SaveDecisionCases', '0003')).assertEqual(SaveOutcome.BRANCH);
      expect(decision.message, caseName('SaveDecisionCases', '0003')).assertEqual('另存分支');
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
      expect(decision.code, caseName('SaveDecisionCases', '0004')).assertEqual('SV-01');
      expect(decision.outcome, caseName('SaveDecisionCases', '0004')).assertEqual(SaveOutcome.SAFE);
      expect(decision.writable(), caseName('SaveDecisionCases', '0004')).assertTrue();
      expect(decision.message, caseName('SaveDecisionCases', '0004')).assertEqual('没有新变化，保存不改变内容');
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
      expect(decision.code, caseName('SaveDecisionCases', '0005')).assertEqual('SV-02');
      expect(decision.outcome, caseName('SaveDecisionCases', '0005')).assertEqual(SaveOutcome.SAFE);
      expect(saveAdvice(decision), caseName('SaveDecisionCases', '0005')).assertEqual('可以保存');
      expect(decision.message, caseName('SaveDecisionCases', '0005')).assertEqual('常规保存');
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
      expect(decision.code, caseName('SaveDecisionCases', '0006')).assertEqual('SV-03');
      expect(decision.outcome, caseName('SaveDecisionCases', '0006')).assertEqual(SaveOutcome.CONFIRM);
      expect(decision.writable(), caseName('SaveDecisionCases', '0006')).assertFalse();
      expect(decision.message, caseName('SaveDecisionCases', '0006')).assertEqual('本机内容已过期，保存会覆盖对端');
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
      expect(decision.code, caseName('SaveDecisionCases', '0007')).assertEqual('SV-04');
      expect(decision.outcome, caseName('SaveDecisionCases', '0007')).assertEqual(SaveOutcome.SAFE);
      expect(decision.message, caseName('SaveDecisionCases', '0007')).assertEqual('收敛到同一版本');
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
      expect(decision.code, caseName('SaveDecisionCases', '0008')).assertEqual('SV-05');
      expect(decision.outcome, caseName('SaveDecisionCases', '0008')).assertEqual(SaveOutcome.BRANCH);
      expect(decision.writable(), caseName('SaveDecisionCases', '0008')).assertFalse();
      expect(decision.message, caseName('SaveDecisionCases', '0008')).assertEqual('另存为新分支，两侧都保留');
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
      expect(decision.code, caseName('SaveDecisionCases', '0009')).assertEqual('SV-06');
      expect(decision.outcome, caseName('SaveDecisionCases', '0009')).assertEqual(SaveOutcome.CONFIRM);
      expect(decision.message, caseName('SaveDecisionCases', '0009')).assertEqual('对端可能回滚过，保存前需确认');
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
      expect(zero.code, caseName('SaveDecisionCases', '0010')).assertEqual('SV-07');
      expect(zero.outcome, caseName('SaveDecisionCases', '0010')).assertEqual(SaveOutcome.BLOCKED);
      expect(zero.message, caseName('SaveDecisionCases', '0010')).assertEqual('缺少本机修订号，不允许写入');
      const negative: SaveDecision = decideSave(inputOf(3, -2, 3));
      expect(negative.code, caseName('SaveDecisionCases', '0010')).assertEqual('SV-07');
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
      expect(decision.code, caseName('SaveDecisionCases', '0011')).assertEqual('SV-08');
      expect(decision.outcome, caseName('SaveDecisionCases', '0011')).assertEqual(SaveOutcome.BLOCKED);
      expect(decision.message, caseName('SaveDecisionCases', '0011')).assertEqual('恢复在途时写入会产生不确定结果');
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
      expect(decision.code, caseName('SaveDecisionCases', '0012')).assertEqual('SV-09');
      expect(decision.outcome, caseName('SaveDecisionCases', '0012')).assertEqual(SaveOutcome.BLOCKED);
      expect(decision.message, caseName('SaveDecisionCases', '0012')).assertEqual('回收站内笔记不可直接保存');
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
      expect(decision.code, caseName('SaveDecisionCases', '0013')).assertEqual('SV-10');
      expect(decision.outcome, caseName('SaveDecisionCases', '0013')).assertEqual(SaveOutcome.CONFIRM);
      expect(decision.message, caseName('SaveDecisionCases', '0013')).assertEqual('需先读回磁盘再决定');
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
      expect(decideSave(input).code, caseName('SaveDecisionCases', '0014')).assertEqual('SV-08');
      expect(decideSave(input).outcome, caseName('SaveDecisionCases', '0014')).assertEqual(SaveOutcome.BLOCKED);
      expect(saveAdvice(decideSave(input)), caseName('SaveDecisionCases', '0014')).assertEqual(decideSave(input).message);
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
      expect(decideSave(input).code, caseName('SaveDecisionCases', '0015')).assertEqual('SV-09');
      expect(decideSave(input).outcome, caseName('SaveDecisionCases', '0015')).assertEqual(SaveOutcome.BLOCKED);
      expect(decideSave(input).code === 'SV-08', caseName('SaveDecisionCases', '0015')).assertFalse();
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
      expect(decideSave(input).code, caseName('SaveDecisionCases', '0016')).assertEqual('SV-07');
      expect(decideSave(input).outcome, caseName('SaveDecisionCases', '0016')).assertEqual(SaveOutcome.BLOCKED);
      expect(decideSave(input).code === 'SV-09', caseName('SaveDecisionCases', '0016')).assertFalse();
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
      expect(decision.code, caseName('SaveDecisionCases', '0017')).assertEqual('SV-10');
      expect(decision.code === 'SV-05', caseName('SaveDecisionCases', '0017')).assertFalse();
      expect(decision.code === 'SV-07', caseName('SaveDecisionCases', '0017')).assertFalse();
      expect(decision.message.length > 0, caseName('SaveDecisionCases', '0017')).assertTrue();
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
      expect(decision.code, caseName('SaveDecisionCases', '0018')).assertEqual('SV-06');
      expect(decision.code === 'SV-01', caseName('SaveDecisionCases', '0018')).assertFalse();
      expect(decision.message.length > 0, caseName('SaveDecisionCases', '0018')).assertTrue();
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
      expect(decision.code, caseName('SaveDecisionCases', '0019')).assertEqual('SV-06');
      expect(decision.outcome, caseName('SaveDecisionCases', '0019')).assertEqual(SaveOutcome.CONFIRM);
      expect(decision.code === 'SV-05', caseName('SaveDecisionCases', '0019')).assertFalse();
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
      expect(decision.code, caseName('SaveDecisionCases', '0020')).assertEqual('SV-01');
      expect(decision.outcome, caseName('SaveDecisionCases', '0020')).assertEqual(SaveOutcome.SAFE);
      expect(decision.code === 'SV-06', caseName('SaveDecisionCases', '0020')).assertFalse();
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
      expect(decision.code, caseName('SaveDecisionCases', '0021')).assertEqual('SV-02');
      expect(decision.outcome, caseName('SaveDecisionCases', '0021')).assertEqual(SaveOutcome.SAFE);
      expect(saveAdvice(decision).length > 0, caseName('SaveDecisionCases', '0021')).assertTrue();
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
      expect(decideSave(inputOf(0, 0, 1)).code, caseName('SaveDecisionCases', '0022')).assertEqual('SV-07');
      expect(decideSave(inputOf(0, 1, 0)).code, caseName('SaveDecisionCases', '0022')).assertEqual('SV-02');
      expect(decideSave(inputOf(0, 0, 0)).code, caseName('SaveDecisionCases', '0022')).assertEqual('SV-07');
      expect(decideSave(inputOf(0, 0, 1)).outcome, caseName('SaveDecisionCases', '0022')).assertEqual(SaveOutcome.BLOCKED);
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
      expect(first.code, caseName('SaveDecisionCases', '0023')).assertEqual(second.code);
      expect(first.message, caseName('SaveDecisionCases', '0023')).assertEqual(second.message);
      expect(first.outcome, caseName('SaveDecisionCases', '0023')).assertEqual(second.outcome);
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
      expect(saveAdvice(decideSave(inputOf(3, 3, 3))), caseName('SaveDecisionCases', '0024')).assertEqual('可以保存');
      expect(saveAdvice(new SaveDecision('x', SaveOutcome.SAFE, '任意')), caseName('SaveDecisionCases', '0024')).assertEqual('可以保存');
      expect(saveAdvice(new SaveDecision('x', SaveOutcome.SAFE, '任意')).length, caseName('SaveDecisionCases', '0024')).assertEqual(4);
      expect(saveAdvice(new SaveDecision('x', SaveOutcome.SAFE, '完全不同的提示')), caseName('SaveDecisionCases', '0024'))
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
      expect(advice, caseName('SaveDecisionCases', '0025')).assertEqual('建议另存为新分支，保留两侧内容');
      expect(advice.indexOf('两侧') > 0, caseName('SaveDecisionCases', '0025')).assertTrue();
      expect(advice === '可以保存', caseName('SaveDecisionCases', '0025')).assertFalse();
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
      expect(saveAdvice(decision), caseName('SaveDecisionCases', '0026')).assertEqual(decision.message);
      expect(saveAdvice(decision).indexOf('覆盖对端') > 0, caseName('SaveDecisionCases', '0026')).assertTrue();
      expect(decision.code.length, caseName('SaveDecisionCases', '0026')).assertEqual(5);
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
      expect(saveAdvice(decision), caseName('SaveDecisionCases', '0027')).assertEqual('恢复在途时写入会产生不确定结果');
      expect(saveAdvice(decision).indexOf('可以保存'), caseName('SaveDecisionCases', '0027')).assertEqual(-1);
      expect(decision.code, caseName('SaveDecisionCases', '0027')).assertEqual('SV-08');
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
        saveAdvice(decideSave(input)).length > 0), caseName('SaveDecisionCases', '0028')).assertTrue();
      expect(cases.length, caseName('SaveDecisionCases', '0028')).assertEqual(6);
      expect(cases.every((input: SaveInput): boolean =>
        decideSave(input).code.length === 5), caseName('SaveDecisionCases', '0028')).assertTrue();
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
      expect(entry.noteId, caseName('TrashEntryCases', '0001')).assertEqual('n1');
      expect(entry.title, caseName('TrashEntryCases', '0001')).assertEqual('标题');
      expect(entry.state, caseName('TrashEntryCases', '0001')).assertEqual(TrashState.TRASHED);
      expect(entry.revision, caseName('TrashEntryCases', '0001')).assertEqual(0);
      expect(entry.trashedAt, caseName('TrashEntryCases', '0001')).assertEqual(0);
      expect(entry.origin, caseName('TrashEntryCases', '0001')).assertEqual('');
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
      expect(entry.describe(), caseName('TrashEntryCases', '0002')).assertEqual('周报｜回收站｜修订 4｜来源 未记录');
      expect(entry.describe().indexOf('未记录') > 0, caseName('TrashEntryCases', '0002')).assertTrue();
      expect(entry.noteId, caseName('TrashEntryCases', '0002')).assertEqual('n1');
      expect(entry.title, caseName('TrashEntryCases', '0002')).assertEqual('周报');
      expect(entry.revision, caseName('TrashEntryCases', '0002')).assertEqual(4);
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
      expect(entry.describe(), caseName('TrashEntryCases', '0003')).assertEqual('周报｜回收站｜修订 2｜来源 手动删除');
      expect(entry.describe().split('｜').length, caseName('TrashEntryCases', '0003')).assertEqual(4);
      expect(entry.origin, caseName('TrashEntryCases', '0003')).assertEqual('手动删除');
      expect(entry.state, caseName('TrashEntryCases', '0003')).assertEqual(TrashState.TRASHED);
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
      expect(entry.restorable(1000, 10 * DAY), caseName('TrashEntryCases', '0004')).assertTrue();
      expect(entry.restorable(1000 + 10 * DAY, 10 * DAY), caseName('TrashEntryCases', '0004')).assertTrue();
      expect(entry.state, caseName('TrashEntryCases', '0004')).assertEqual(TrashState.TRASHED);
      expect(entry.trashedAt, caseName('TrashEntryCases', '0004')).assertEqual(1000);
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
      expect(entry.restorable(1001 + 10 * DAY, 10 * DAY), caseName('TrashEntryCases', '0005')).assertFalse();
      expect(entry.state, caseName('TrashEntryCases', '0005')).assertEqual(TrashState.TRASHED);
      expect(entry.restorable(1000 + 40 * DAY, 10 * DAY), caseName('TrashEntryCases', '0005')).assertFalse();
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
      expect(entry.restorable(1000, 10 * DAY), caseName('TrashEntryCases', '0006')).assertFalse();
      entry.state = TrashState.PURGED;
      expect(entry.restorable(1000, 10 * DAY), caseName('TrashEntryCases', '0006')).assertFalse();
      expect(entry.state, caseName('TrashEntryCases', '0006')).assertEqual(TrashState.PURGED);
      expect(entry.title, caseName('TrashEntryCases', '0006')).assertEqual('a');
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
      expect(TrashState.ACTIVE, caseName('TrashEntryCases', '0007')).assertEqual('正常');
      expect(TrashState.TRASHED, caseName('TrashEntryCases', '0007')).assertEqual('回收站');
      expect(TrashState.PURGED, caseName('TrashEntryCases', '0007')).assertEqual('已清除');
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
      expect(TRASH_RETENTION_DAYS, caseName('TrashEntryCases', '0008')).assertEqual(30);
      expect(TRASH_RETENTION_DAYS * DAY, caseName('TrashEntryCases', '0008')).assertEqual(2592000000);
      expect(TRASH_RETENTION_DAYS > 0, caseName('TrashEntryCases', '0008')).assertTrue();
      expect(TRASH_RETENTION_DAYS * DAY > 0, caseName('TrashEntryCases', '0008')).assertTrue();
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
      expect(bin.trash('n1', '周报', 3, 1000, '手动删除'), caseName('TrashBinCases', '0001')).assertTrue();
      expect(bin.size(), caseName('TrashBinCases', '0001')).assertEqual(1);
      expect(bin.inTrash('n1'), caseName('TrashBinCases', '0001')).assertTrue();
      expect(bin.trashed().length, caseName('TrashBinCases', '0001')).assertEqual(1);
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
      expect(bin.trash('', '无编号', 1, 1000, ''), caseName('TrashBinCases', '0002')).assertFalse();
      expect(bin.size(), caseName('TrashBinCases', '0002')).assertEqual(0);
      expect(bin.trash('n1', 'x', 1, 1000, ''), caseName('TrashBinCases', '0002')).assertTrue();
      expect(bin.size(), caseName('TrashBinCases', '0002')).assertEqual(1);
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
      expect(bin.trash('n1', '新标题', 5, 2000, '批量删除'), caseName('TrashBinCases', '0003')).assertTrue();
      expect(bin.size(), caseName('TrashBinCases', '0003')).assertEqual(1);
      expect(bin.entryOf('n1')?.revision, caseName('TrashBinCases', '0003')).assertEqual(5);
      expect(bin.entryOf('n1')?.origin, caseName('TrashBinCases', '0003')).assertEqual('批量删除');
      expect(bin.entryOf('n1')?.trashedAt, caseName('TrashBinCases', '0003')).assertEqual(2000);
      expect(bin.entryOf('n1')?.title, caseName('TrashBinCases', '0003')).assertEqual('旧标题');
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
      expect(bin.entryOf('n1') !== undefined, caseName('TrashBinCases', '0004')).assertTrue();
      expect(bin.entryOf('n2') === undefined, caseName('TrashBinCases', '0004')).assertTrue();
      expect(bin.inTrash('n2'), caseName('TrashBinCases', '0004')).assertFalse();
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
      expect(items.length, caseName('TrashBinCases', '0005')).assertEqual(1);
      expect(items[0].noteId, caseName('TrashBinCases', '0005')).assertEqual('n2');
      expect(bin.size(), caseName('TrashBinCases', '0005')).assertEqual(2);
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
      expect(bin.restore('n1', 1000 + 30 * DAY), caseName('TrashBinCases', '0006')).assertTrue();
      expect(bin.inTrash('n1'), caseName('TrashBinCases', '0006')).assertFalse();
      expect(bin.entryOf('n1')?.state, caseName('TrashBinCases', '0006')).assertEqual(TrashState.ACTIVE);
      expect(bin.trashed().length, caseName('TrashBinCases', '0006')).assertEqual(0);
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
      expect(bin.restore('n1', 1001 + 30 * DAY), caseName('TrashBinCases', '0007')).assertFalse();
      expect(bin.inTrash('n1'), caseName('TrashBinCases', '0007')).assertTrue();
      expect(bin.entryOf('n1')?.state, caseName('TrashBinCases', '0007')).assertEqual(TrashState.TRASHED);
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
      expect(bin.restore('missing', 1000), caseName('TrashBinCases', '0008')).assertFalse();
      expect(bin.size(), caseName('TrashBinCases', '0008')).assertEqual(0);
      expect(bin.restore('', 1000), caseName('TrashBinCases', '0008')).assertFalse();
      expect(bin.trashed().length, caseName('TrashBinCases', '0008')).assertEqual(0);
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
      expect(bin.restore('n1', 3000), caseName('TrashBinCases', '0009')).assertFalse();
      expect(bin.entryOf('n1')?.state, caseName('TrashBinCases', '0009')).assertEqual(TrashState.ACTIVE);
      expect(bin.entryOf('n1') === undefined, caseName('TrashBinCases', '0009')).assertFalse();
      expect(bin.trashed().length, caseName('TrashBinCases', '0009')).assertEqual(0);
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
      expect(removed.length, caseName('TrashBinCases', '0010')).assertEqual(1);
      expect(removed[0].noteId, caseName('TrashBinCases', '0010')).assertEqual('old');
      expect(bin.entryOf('old')?.state, caseName('TrashBinCases', '0010')).assertEqual(TrashState.PURGED);
      expect(bin.entryOf('fresh')?.state, caseName('TrashBinCases', '0010')).assertEqual(TrashState.TRASHED);
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
      expect(bin.purge(1000 + 30 * DAY).length, caseName('TrashBinCases', '0011')).assertEqual(0);
      expect(bin.entryOf('n1')?.state, caseName('TrashBinCases', '0011')).assertEqual(TrashState.TRASHED);
      expect(bin.purge(1001 + 30 * DAY).length, caseName('TrashBinCases', '0011')).assertEqual(1);
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
      expect(bin.purge(1001 + 40 * DAY).length, caseName('TrashBinCases', '0012')).assertEqual(0);
      expect(bin.entryOf('n1')?.state, caseName('TrashBinCases', '0012')).assertEqual(TrashState.ACTIVE);
      expect(bin.size(), caseName('TrashBinCases', '0012')).assertEqual(1);
      expect(bin.trashed().length, caseName('TrashBinCases', '0012')).assertEqual(0);
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
      expect(bin.restore('n1', 1002 + 30 * DAY), caseName('TrashBinCases', '0013')).assertFalse();
      expect(bin.inTrash('n1'), caseName('TrashBinCases', '0013')).assertFalse();
      expect(bin.entryOf('n1')?.state, caseName('TrashBinCases', '0013')).assertEqual(TrashState.PURGED);
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
      expect(bin.size(), caseName('TrashBinCases', '0014')).assertEqual(2);
      expect(bin.trashed().length, caseName('TrashBinCases', '0014')).assertEqual(0);
      expect(bin.entryOf('a')?.state, caseName('TrashBinCases', '0014')).assertEqual(TrashState.PURGED);
      expect(bin.trash('c', 'c', 1, 1000, ''), caseName('TrashBinCases', '0014')).assertTrue();
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
      expect(bin.trash('n1', 'a', 2, 3000, '再次删除'), caseName('TrashBinCases', '0015')).assertTrue();
      expect(bin.inTrash('n1'), caseName('TrashBinCases', '0015')).assertTrue();
      expect(bin.entryOf('n1')?.trashedAt, caseName('TrashBinCases', '0015')).assertEqual(3000);
      expect(bin.size(), caseName('TrashBinCases', '0015')).assertEqual(1);
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
      expect(bin.size(), caseName('TrashBinCases', '0016')).assertEqual(0);
      expect(bin.trashed().length, caseName('TrashBinCases', '0016')).assertEqual(0);
      expect(bin.purge(1000).length, caseName('TrashBinCases', '0016')).assertEqual(0);
      expect(bin.inTrash('any'), caseName('TrashBinCases', '0016')).assertFalse();
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
      expect(lines.length, caseName('TrashLinesCases', '0001')).assertEqual(1);
      expect(lines[0], caseName('TrashLinesCases', '0001')).assertEqual('回收站为空');
      expect(lines[0].length, caseName('TrashLinesCases', '0001')).assertEqual(5);
      expect(lines[0].indexOf('为空') > 0, caseName('TrashLinesCases', '0001')).assertTrue();
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
      expect(lines[0], caseName('TrashLinesCases', '0002')).assertEqual('回收站 2 项｜保留 30 天');
      expect(lines.length, caseName('TrashLinesCases', '0002')).assertEqual(3);
      expect(lines[0].indexOf('保留 30 天') > 0, caseName('TrashLinesCases', '0002')).assertTrue();
      expect(lines[0].split('｜').length, caseName('TrashLinesCases', '0002')).assertEqual(2);
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
      expect(lines[1], caseName('TrashLinesCases', '0003')).assertEqual('周报｜回收站｜修订 3｜来源 手动删除｜可恢复（已存 2 天）');
      expect(lines[1].indexOf('可恢复') > 0, caseName('TrashLinesCases', '0003')).assertTrue();
      expect(lines[1].indexOf('已存 2 天') > 0, caseName('TrashLinesCases', '0003')).assertTrue();
      expect(lines[1].split('｜').length, caseName('TrashLinesCases', '0003')).assertEqual(5);
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
      expect(lines[1].indexOf('已过期') > 0, caseName('TrashLinesCases', '0004')).assertTrue();
      expect(lines[1].indexOf('可恢复'), caseName('TrashLinesCases', '0004')).assertEqual(-1);
      expect(lines.length, caseName('TrashLinesCases', '0004')).assertEqual(2);
      expect(lines[1].substring(lines[1].length - 3), caseName('TrashLinesCases', '0004')).assertEqual('已过期');
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
      expect(trashLines(bin, DAY - 1)[1].indexOf('已存 0 天') > 0, caseName('TrashLinesCases', '0005')).assertTrue();
      expect(trashLines(bin, 3 * DAY + 5)[1].indexOf('已存 3 天') > 0, caseName('TrashLinesCases', '0005')).assertTrue();
      expect(trashLines(bin, 0)[1].indexOf('已存 0 天') > 0, caseName('TrashLinesCases', '0005')).assertTrue();
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
      expect(lines[0], caseName('TrashLinesCases', '0006')).assertEqual('回收站 1 项｜保留 30 天');
      expect(lines.length, caseName('TrashLinesCases', '0006')).assertEqual(2);
      expect(lines[1].indexOf('b｜') === 0, caseName('TrashLinesCases', '0006')).assertTrue();
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
      expect(lines.length, caseName('TrashLinesCases', '0007')).assertEqual(1);
      expect(lines[0], caseName('TrashLinesCases', '0007')).assertEqual('回收站为空');
      expect(bin.size(), caseName('TrashLinesCases', '0007')).assertEqual(1);
    });
  });
}

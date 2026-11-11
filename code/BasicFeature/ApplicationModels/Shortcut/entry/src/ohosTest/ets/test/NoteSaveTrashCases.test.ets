import { describe, expect, it } from '@ohos/hypium';
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

    it('testSaveRuleCases0001', 0, (): void => {
      expect(SAVE_RULES.length).assertEqual(10);
      const codes: string[] = SAVE_RULES.map((rule: SaveRule): string => rule.code);
      expect(codes[0]).assertEqual('SV-01');
      expect(codes[9]).assertEqual('SV-10');
      expect(codes.filter((code: string, index: number): boolean =>
        codes.indexOf(code) === index).length).assertEqual(10);
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVERULECASES_0200
     * @tc.name      testSaveRuleCases0002
     * @tc.desc      Verify rule describe joins facts
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSaveRuleCases0002', 0, (): void => {
      const rule: SaveRule | undefined = SAVE_RULES.find((item: SaveRule): boolean =>
        item.code === 'SV-05');
      expect(rule?.describe()).assertEqual(
        'SV-05｜双方都前进且修订号不同 → 另存为新分支｜另存为新分支，两侧都保留');
      expect(rule?.describe().split('｜').length).assertEqual(3);
      expect(rule === undefined).assertFalse();
      expect(rule?.outcome).assertEqual(SaveOutcome.BRANCH);
      expect(rule?.describe().indexOf('SV-05') === 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVERULECASES_0300
     * @tc.name      testSaveRuleCases0003
     * @tc.desc      Verify outcome enum is closed
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSaveRuleCases0003', 0, (): void => {
      expect(SaveOutcome.SAFE).assertEqual('可直接保存');
      expect(SaveOutcome.BRANCH).assertEqual('另存为新分支');
      expect(SaveOutcome.CONFIRM).assertEqual('需用户确认');
      expect(SaveOutcome.BLOCKED).assertEqual('保存被阻止');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVERULECASES_0400
     * @tc.name      testSaveRuleCases0004
     * @tc.desc      Verify every rule carries note
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSaveRuleCases0004', 0, (): void => {
      expect(SAVE_RULES.every((rule: SaveRule): boolean => rule.note.length > 0)).assertTrue();
      expect(SAVE_RULES.every((rule: SaveRule): boolean =>
        rule.condition.length > 0)).assertTrue();
      expect(SAVE_RULES.length > 0).assertTrue();
      expect(SAVE_RULES.every((rule: SaveRule): boolean => rule.code.length > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVERULECASES_0500
     * @tc.name      testSaveRuleCases0005
     * @tc.desc      Verify blocking rules are listed
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSaveRuleCases0005', 0, (): void => {
      const blocked: SaveRule[] = SAVE_RULES.filter((rule: SaveRule): boolean =>
        rule.outcome === SaveOutcome.BLOCKED);
      expect(blocked.length).assertEqual(3);
      expect(blocked.map((rule: SaveRule): string => rule.code).join(',')).assertEqual(
        'SV-07,SV-08,SV-09');
      expect(blocked.filter((rule: SaveRule, index: number): boolean =>
        blocked.indexOf(rule) === index).length).assertEqual(3);
      expect(blocked.length < SAVE_RULES.length).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVERULECASES_0600
     * @tc.name      testSaveRuleCases0006
     * @tc.desc      Verify outcome distribution is stable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSaveRuleCases0006', 0, (): void => {
      const safe: number = SAVE_RULES.filter((rule: SaveRule): boolean =>
        rule.outcome === SaveOutcome.SAFE).length;
      const confirm: number = SAVE_RULES.filter((rule: SaveRule): boolean =>
        rule.outcome === SaveOutcome.CONFIRM).length;
      const branch: number = SAVE_RULES.filter((rule: SaveRule): boolean =>
        rule.outcome === SaveOutcome.BRANCH).length;
      expect(safe).assertEqual(3);
      expect(confirm).assertEqual(3);
      expect(branch).assertEqual(1);
      expect(safe + confirm + branch + 3).assertEqual(SAVE_RULES.length);
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVERULECASES_0700
     * @tc.name      testSaveRuleCases0007
     * @tc.desc      Verify save lines match table
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testSaveRuleCases0007', 0, (): void => {
      const lines: string[] = saveLines();
      expect(lines.length).assertEqual(SAVE_RULES.length);
      expect(lines.every((line: string): boolean => line.indexOf('→') > 0)).assertTrue();
      expect(lines[0].indexOf('SV-01') === 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVERULECASES_0800
     * @tc.name      testSaveRuleCases0008
     * @tc.desc      Verify save input defaults to no facts
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testSaveRuleCases0008', 0, (): void => {
      const input: SaveInput = new SaveInput();
      expect(input.baselineRevision).assertEqual(0);
      expect(input.localRevision).assertEqual(0);
      expect(input.remoteRevision).assertEqual(0);
      expect(input.recoveryActive).assertFalse();
      expect(input.trashed).assertFalse();
      expect(input.writeUncertain).assertFalse();
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

    it('testSaveDecisionCases0001', 0, (): void => {
      const decision: SaveDecision = new SaveDecision();
      expect(decision.outcome).assertEqual(SaveOutcome.SAFE);
      expect(decision.code).assertEqual('');
      expect(decision.message).assertEqual('');
      expect(decision.writable()).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_0200
     * @tc.name      testSaveDecisionCases0002
     * @tc.desc      Verify writable only for safe
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSaveDecisionCases0002', 0, (): void => {
      expect(new SaveDecision('a', SaveOutcome.SAFE, '').writable()).assertTrue();
      expect(new SaveDecision('a', SaveOutcome.BRANCH, '').writable()).assertFalse();
      expect(new SaveDecision('a', SaveOutcome.CONFIRM, '').writable()).assertFalse();
      expect(new SaveDecision('a', SaveOutcome.BLOCKED, '').writable()).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_0300
     * @tc.name      testSaveDecisionCases0003
     * @tc.desc      Verify decision describe joins facts
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSaveDecisionCases0003', 0, (): void => {
      const decision: SaveDecision = new SaveDecision('SV-05', SaveOutcome.BRANCH, '另存分支');
      expect(decision.describe()).assertEqual('SV-05｜另存为新分支｜另存分支');
      expect(decision.describe().split('｜').length).assertEqual(3);
      expect(decision.code).assertEqual('SV-05');
      expect(decision.outcome).assertEqual(SaveOutcome.BRANCH);
      expect(decision.message).assertEqual('另存分支');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_0400
     * @tc.name      testSaveDecisionCases0004
     * @tc.desc      Verify identical revisions are safe
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSaveDecisionCases0004', 0, (): void => {
      const decision: SaveDecision = decideSave(inputOf(3, 3, 3));
      expect(decision.code).assertEqual('SV-01');
      expect(decision.outcome).assertEqual(SaveOutcome.SAFE);
      expect(decision.writable()).assertTrue();
      expect(decision.message).assertEqual('没有新变化，保存不改变内容');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_0500
     * @tc.name      testSaveDecisionCases0005
     * @tc.desc      Verify local ahead is safe
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSaveDecisionCases0005', 0, (): void => {
      const decision: SaveDecision = decideSave(inputOf(2, 5, 2));
      expect(decision.code).assertEqual('SV-02');
      expect(decision.outcome).assertEqual(SaveOutcome.SAFE);
      expect(saveAdvice(decision)).assertEqual('可以保存');
      expect(decision.message).assertEqual('常规保存');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_0600
     * @tc.name      testSaveDecisionCases0006
     * @tc.desc      Verify remote ahead needs confirmation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSaveDecisionCases0006', 0, (): void => {
      const decision: SaveDecision = decideSave(inputOf(2, 2, 5));
      expect(decision.code).assertEqual('SV-03');
      expect(decision.outcome).assertEqual(SaveOutcome.CONFIRM);
      expect(decision.writable()).assertFalse();
      expect(decision.message).assertEqual('本机内容已过期，保存会覆盖对端');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_0700
     * @tc.name      testSaveDecisionCases0007
     * @tc.desc      Verify converged revisions are safe
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSaveDecisionCases0007', 0, (): void => {
      const decision: SaveDecision = decideSave(inputOf(2, 6, 6));
      expect(decision.code).assertEqual('SV-04');
      expect(decision.outcome).assertEqual(SaveOutcome.SAFE);
      expect(decision.message).assertEqual('收敛到同一版本');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_0800
     * @tc.name      testSaveDecisionCases0008
     * @tc.desc      Verify diverged revisions branch
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSaveDecisionCases0008', 0, (): void => {
      const decision: SaveDecision = decideSave(inputOf(2, 5, 7));
      expect(decision.code).assertEqual('SV-05');
      expect(decision.outcome).assertEqual(SaveOutcome.BRANCH);
      expect(decision.writable()).assertFalse();
      expect(decision.message).assertEqual('另存为新分支，两侧都保留');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_0900
     * @tc.name      testSaveDecisionCases0009
     * @tc.desc      Verify remote below baseline needs confirm
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSaveDecisionCases0009', 0, (): void => {
      const decision: SaveDecision = decideSave(inputOf(5, 5, 3));
      expect(decision.code).assertEqual('SV-06');
      expect(decision.outcome).assertEqual(SaveOutcome.CONFIRM);
      expect(decision.message).assertEqual('对端可能回滚过，保存前需确认');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_1000
     * @tc.name      testSaveDecisionCases0010
     * @tc.desc      Verify missing local revision blocks
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSaveDecisionCases0010', 0, (): void => {
      const zero: SaveDecision = decideSave(inputOf(3, 0, 3));
      expect(zero.code).assertEqual('SV-07');
      expect(zero.outcome).assertEqual(SaveOutcome.BLOCKED);
      expect(zero.message).assertEqual('缺少本机修订号，不允许写入');
      const negative: SaveDecision = decideSave(inputOf(3, -2, 3));
      expect(negative.code).assertEqual('SV-07');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_1100
     * @tc.name      testSaveDecisionCases0011
     * @tc.desc      Verify active recovery blocks
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSaveDecisionCases0011', 0, (): void => {
      const input: SaveInput = inputOf(1, 2, 1);
      input.recoveryActive = true;
      const decision: SaveDecision = decideSave(input);
      expect(decision.code).assertEqual('SV-08');
      expect(decision.outcome).assertEqual(SaveOutcome.BLOCKED);
      expect(decision.message).assertEqual('恢复在途时写入会产生不确定结果');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_1200
     * @tc.name      testSaveDecisionCases0012
     * @tc.desc      Verify trashed note blocks
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSaveDecisionCases0012', 0, (): void => {
      const input: SaveInput = inputOf(1, 2, 1);
      input.trashed = true;
      const decision: SaveDecision = decideSave(input);
      expect(decision.code).assertEqual('SV-09');
      expect(decision.outcome).assertEqual(SaveOutcome.BLOCKED);
      expect(decision.message).assertEqual('回收站内笔记不可直接保存');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_1300
     * @tc.name      testSaveDecisionCases0013
     * @tc.desc      Verify uncertain write needs confirm
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSaveDecisionCases0013', 0, (): void => {
      const input: SaveInput = inputOf(1, 2, 1);
      input.writeUncertain = true;
      const decision: SaveDecision = decideSave(input);
      expect(decision.code).assertEqual('SV-10');
      expect(decision.outcome).assertEqual(SaveOutcome.CONFIRM);
      expect(decision.message).assertEqual('需先读回磁盘再决定');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_1400
     * @tc.name      testSaveDecisionCases0014
     * @tc.desc      Verify recovery beats every other block
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSaveDecisionCases0014', 0, (): void => {
      const input: SaveInput = inputOf(1, 0, 1);
      input.recoveryActive = true;
      input.trashed = true;
      input.writeUncertain = true;
      expect(decideSave(input).code).assertEqual('SV-08');
      expect(decideSave(input).outcome).assertEqual(SaveOutcome.BLOCKED);
      expect(saveAdvice(decideSave(input))).assertEqual(decideSave(input).message);
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_1500
     * @tc.name      testSaveDecisionCases0015
     * @tc.desc      Verify trash beats missing revision
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSaveDecisionCases0015', 0, (): void => {
      const input: SaveInput = inputOf(1, 0, 1);
      input.trashed = true;
      input.writeUncertain = true;
      expect(decideSave(input).code).assertEqual('SV-09');
      expect(decideSave(input).outcome).assertEqual(SaveOutcome.BLOCKED);
      expect(decideSave(input).code === 'SV-08').assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_1600
     * @tc.name      testSaveDecisionCases0016
     * @tc.desc      Verify missing revision beats uncertain write
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSaveDecisionCases0016', 0, (): void => {
      const input: SaveInput = inputOf(1, 0, 1);
      input.writeUncertain = true;
      expect(decideSave(input).code).assertEqual('SV-07');
      expect(decideSave(input).outcome).assertEqual(SaveOutcome.BLOCKED);
      expect(decideSave(input).code === 'SV-09').assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_1700
     * @tc.name      testSaveDecisionCases0017
     * @tc.desc      Verify uncertain write beats divergence
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSaveDecisionCases0017', 0, (): void => {
      const input: SaveInput = inputOf(2, 5, 7);
      input.writeUncertain = true;
      const decision: SaveDecision = decideSave(input);
      expect(decision.code).assertEqual('SV-10');
      expect(decision.code === 'SV-05').assertFalse();
      expect(decision.code === 'SV-07').assertFalse();
      expect(decision.message.length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_1800
     * @tc.name      testSaveDecisionCases0018
     * @tc.desc      Verify rollback beats no change
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSaveDecisionCases0018', 0, (): void => {
      const decision: SaveDecision = decideSave(inputOf(4, 4, 2));
      expect(decision.code).assertEqual('SV-06');
      expect(decision.code === 'SV-01').assertFalse();
      expect(decision.message.length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_1900
     * @tc.name      testSaveDecisionCases0019
     * @tc.desc      Verify rollback beats divergence
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSaveDecisionCases0019', 0, (): void => {
      const decision: SaveDecision = decideSave(inputOf(6, 9, 5));
      expect(decision.code).assertEqual('SV-06');
      expect(decision.outcome).assertEqual(SaveOutcome.CONFIRM);
      expect(decision.code === 'SV-05').assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_2000
     * @tc.name      testSaveDecisionCases0020
     * @tc.desc      Verify local rollback is not special
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSaveDecisionCases0020', 0, (): void => {
      const decision: SaveDecision = decideSave(inputOf(5, 3, 5));
      expect(decision.code).assertEqual('SV-01');
      expect(decision.outcome).assertEqual(SaveOutcome.SAFE);
      expect(decision.code === 'SV-06').assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_2100
     * @tc.name      testSaveDecisionCases0021
     * @tc.desc      Verify zero baseline with local only is safe
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSaveDecisionCases0021', 0, (): void => {
      const decision: SaveDecision = decideSave(inputOf(0, 1, 0));
      expect(decision.code).assertEqual('SV-02');
      expect(decision.outcome).assertEqual(SaveOutcome.SAFE);
      expect(saveAdvice(decision).length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_2200
     * @tc.name      testSaveDecisionCases0022
     * @tc.desc      Verify zero baseline cannot show remote only
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSaveDecisionCases0022', 0, (): void => {
      expect(decideSave(inputOf(0, 0, 1)).code).assertEqual('SV-07');
      expect(decideSave(inputOf(0, 1, 0)).code).assertEqual('SV-02');
      expect(decideSave(inputOf(0, 0, 0)).code).assertEqual('SV-07');
      expect(decideSave(inputOf(0, 0, 1)).outcome).assertEqual(SaveOutcome.BLOCKED);
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_2300
     * @tc.name      testSaveDecisionCases0023
     * @tc.desc      Verify revisions are decision only
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSaveDecisionCases0023', 0, (): void => {
      const first: SaveDecision = decideSave(inputOf(2, 5, 2));
      const second: SaveDecision = decideSave(inputOf(2, 5, 2));
      expect(first.code).assertEqual(second.code);
      expect(first.message).assertEqual(second.message);
      expect(first.outcome).assertEqual(second.outcome);
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_2400
     * @tc.name      testSaveDecisionCases0024
     * @tc.desc      Verify advice for safe decision
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSaveDecisionCases0024', 0, (): void => {
      expect(saveAdvice(decideSave(inputOf(3, 3, 3)))).assertEqual('可以保存');
      expect(saveAdvice(new SaveDecision('x', SaveOutcome.SAFE, '任意'))).assertEqual('可以保存');
      expect(saveAdvice(new SaveDecision('x', SaveOutcome.SAFE, '任意')).length).assertEqual(4);
      expect(saveAdvice(new SaveDecision('x', SaveOutcome.SAFE, '完全不同的提示')))
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

    it('testSaveDecisionCases0025', 0, (): void => {
      const advice: string = saveAdvice(decideSave(inputOf(2, 5, 7)));
      expect(advice).assertEqual('建议另存为新分支，保留两侧内容');
      expect(advice.indexOf('两侧') > 0).assertTrue();
      expect(advice === '可以保存').assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_2600
     * @tc.name      testSaveDecisionCases0026
     * @tc.desc      Verify advice for confirm reuses message
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSaveDecisionCases0026', 0, (): void => {
      const decision: SaveDecision = decideSave(inputOf(2, 2, 5));
      expect(saveAdvice(decision)).assertEqual(decision.message);
      expect(saveAdvice(decision).indexOf('覆盖对端') > 0).assertTrue();
      expect(decision.code.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_2700
     * @tc.name      testSaveDecisionCases0027
     * @tc.desc      Verify advice for blocked reuses message
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSaveDecisionCases0027', 0, (): void => {
      const input: SaveInput = inputOf(1, 2, 1);
      input.recoveryActive = true;
      const decision: SaveDecision = decideSave(input);
      expect(saveAdvice(decision)).assertEqual('恢复在途时写入会产生不确定结果');
      expect(saveAdvice(decision).indexOf('可以保存')).assertEqual(-1);
      expect(decision.code).assertEqual('SV-08');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SAVEDECISIONCASES_2800
     * @tc.name      testSaveDecisionCases0028
     * @tc.desc      Verify advice never empty
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSaveDecisionCases0028', 0, (): void => {
      const cases: SaveInput[] = [inputOf(3, 3, 3), inputOf(2, 5, 2), inputOf(2, 2, 5),
        inputOf(2, 5, 7), inputOf(5, 5, 3), inputOf(3, 0, 3)];
      expect(cases.every((input: SaveInput): boolean =>
        saveAdvice(decideSave(input)).length > 0)).assertTrue();
      expect(cases.length).assertEqual(6);
      expect(cases.every((input: SaveInput): boolean =>
        decideSave(input).code.length === 5)).assertTrue();
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

    it('testTrashEntryCases0001', 0, (): void => {
      const entry: TrashEntry = new TrashEntry('n1', '标题');
      expect(entry.noteId).assertEqual('n1');
      expect(entry.title).assertEqual('标题');
      expect(entry.state).assertEqual(TrashState.TRASHED);
      expect(entry.revision).assertEqual(0);
      expect(entry.trashedAt).assertEqual(0);
      expect(entry.origin).assertEqual('');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHENTRYCASES_0200
     * @tc.name      testTrashEntryCases0002
     * @tc.desc      Verify entry describe marks unrecorded origin
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTrashEntryCases0002', 0, (): void => {
      const entry: TrashEntry = new TrashEntry('n1', '周报');
      entry.revision = 4;
      expect(entry.describe()).assertEqual('周报｜回收站｜修订 4｜来源 未记录');
      expect(entry.describe().indexOf('未记录') > 0).assertTrue();
      expect(entry.noteId).assertEqual('n1');
      expect(entry.title).assertEqual('周报');
      expect(entry.revision).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHENTRYCASES_0300
     * @tc.name      testTrashEntryCases0003
     * @tc.desc      Verify entry describe shows origin
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTrashEntryCases0003', 0, (): void => {
      const entry: TrashEntry = new TrashEntry('n1', '周报');
      entry.revision = 2;
      entry.origin = '手动删除';
      expect(entry.describe()).assertEqual('周报｜回收站｜修订 2｜来源 手动删除');
      expect(entry.describe().split('｜').length).assertEqual(4);
      expect(entry.origin).assertEqual('手动删除');
      expect(entry.state).assertEqual(TrashState.TRASHED);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHENTRYCASES_0400
     * @tc.name      testTrashEntryCases0004
     * @tc.desc      Verify restorable within retention
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTrashEntryCases0004', 0, (): void => {
      const entry: TrashEntry = new TrashEntry('n1', 'a');
      entry.trashedAt = 1000;
      expect(entry.restorable(1000, 10 * DAY)).assertTrue();
      expect(entry.restorable(1000 + 10 * DAY, 10 * DAY)).assertTrue();
      expect(entry.state).assertEqual(TrashState.TRASHED);
      expect(entry.trashedAt).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHENTRYCASES_0500
     * @tc.name      testTrashEntryCases0005
     * @tc.desc      Verify restorable rejects expired
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTrashEntryCases0005', 0, (): void => {
      const entry: TrashEntry = new TrashEntry('n1', 'a');
      entry.trashedAt = 1000;
      expect(entry.restorable(1001 + 10 * DAY, 10 * DAY)).assertFalse();
      expect(entry.state).assertEqual(TrashState.TRASHED);
      expect(entry.restorable(1000 + 40 * DAY, 10 * DAY)).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHENTRYCASES_0600
     * @tc.name      testTrashEntryCases0006
     * @tc.desc      Verify restorable rejects non trashed
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTrashEntryCases0006', 0, (): void => {
      const entry: TrashEntry = new TrashEntry('n1', 'a');
      entry.state = TrashState.ACTIVE;
      expect(entry.restorable(1000, 10 * DAY)).assertFalse();
      entry.state = TrashState.PURGED;
      expect(entry.restorable(1000, 10 * DAY)).assertFalse();
      expect(entry.state).assertEqual(TrashState.PURGED);
      expect(entry.title).assertEqual('a');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHENTRYCASES_0700
     * @tc.name      testTrashEntryCases0007
     * @tc.desc      Verify state enum is closed
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTrashEntryCases0007', 0, (): void => {
      expect(TrashState.ACTIVE).assertEqual('正常');
      expect(TrashState.TRASHED).assertEqual('回收站');
      expect(TrashState.PURGED).assertEqual('已清除');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHENTRYCASES_0800
     * @tc.name      testTrashEntryCases0008
     * @tc.desc      Verify retention is thirty days
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTrashEntryCases0008', 0, (): void => {
      expect(TRASH_RETENTION_DAYS).assertEqual(30);
      expect(TRASH_RETENTION_DAYS * DAY).assertEqual(2592000000);
      expect(TRASH_RETENTION_DAYS > 0).assertTrue();
      expect(TRASH_RETENTION_DAYS * DAY > 0).assertTrue();
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

    it('testTrashBinCases0001', 0, (): void => {
      const bin: TrashBin = new TrashBin();
      expect(bin.trash('n1', '周报', 3, 1000, '手动删除')).assertTrue();
      expect(bin.size()).assertEqual(1);
      expect(bin.inTrash('n1')).assertTrue();
      expect(bin.trashed().length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHBINCASES_0200
     * @tc.name      testTrashBinCases0002
     * @tc.desc      Verify trash rejects empty id
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTrashBinCases0002', 0, (): void => {
      const bin: TrashBin = new TrashBin();
      expect(bin.trash('', '无编号', 1, 1000, '')).assertFalse();
      expect(bin.size()).assertEqual(0);
      expect(bin.trash('n1', 'x', 1, 1000, '')).assertTrue();
      expect(bin.size()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHBINCASES_0300
     * @tc.name      testTrashBinCases0003
     * @tc.desc      Verify trash updates existing entry
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTrashBinCases0003', 0, (): void => {
      const bin: TrashBin = new TrashBin();
      bin.trash('n1', '旧标题', 1, 1000, '手动删除');
      expect(bin.trash('n1', '新标题', 5, 2000, '批量删除')).assertTrue();
      expect(bin.size()).assertEqual(1);
      expect(bin.entryOf('n1')?.revision).assertEqual(5);
      expect(bin.entryOf('n1')?.origin).assertEqual('批量删除');
      expect(bin.entryOf('n1')?.trashedAt).assertEqual(2000);
      expect(bin.entryOf('n1')?.title).assertEqual('旧标题');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHBINCASES_0400
     * @tc.name      testTrashBinCases0004
     * @tc.desc      Verify entry of miss returns undefined
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTrashBinCases0004', 0, (): void => {
      const bin: TrashBin = new TrashBin();
      bin.trash('n1', 'a', 1, 1000, '');
      expect(bin.entryOf('n1') !== undefined).assertTrue();
      expect(bin.entryOf('n2') === undefined).assertTrue();
      expect(bin.inTrash('n2')).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHBINCASES_0500
     * @tc.name      testTrashBinCases0005
     * @tc.desc      Verify trashed lists only trashed
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTrashBinCases0005', 0, (): void => {
      const bin: TrashBin = new TrashBin();
      bin.trash('n1', 'a', 1, 1000, '');
      bin.trash('n2', 'b', 1, 1000, '');
      bin.restore('n1', 2000);
      const items: TrashEntry[] = bin.trashed();
      expect(items.length).assertEqual(1);
      expect(items[0].noteId).assertEqual('n2');
      expect(bin.size()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHBINCASES_0600
     * @tc.name      testTrashBinCases0006
     * @tc.desc      Verify restore within retention
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTrashBinCases0006', 0, (): void => {
      const bin: TrashBin = new TrashBin();
      bin.trash('n1', 'a', 1, 1000, '');
      expect(bin.restore('n1', 1000 + 30 * DAY)).assertTrue();
      expect(bin.inTrash('n1')).assertFalse();
      expect(bin.entryOf('n1')?.state).assertEqual(TrashState.ACTIVE);
      expect(bin.trashed().length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHBINCASES_0700
     * @tc.name      testTrashBinCases0007
     * @tc.desc      Verify restore after retention fails
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTrashBinCases0007', 0, (): void => {
      const bin: TrashBin = new TrashBin();
      bin.trash('n1', 'a', 1, 1000, '');
      expect(bin.restore('n1', 1001 + 30 * DAY)).assertFalse();
      expect(bin.inTrash('n1')).assertTrue();
      expect(bin.entryOf('n1')?.state).assertEqual(TrashState.TRASHED);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHBINCASES_0800
     * @tc.name      testTrashBinCases0008
     * @tc.desc      Verify restore rejects unknown id
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTrashBinCases0008', 0, (): void => {
      const bin: TrashBin = new TrashBin();
      expect(bin.restore('missing', 1000)).assertFalse();
      expect(bin.size()).assertEqual(0);
      expect(bin.restore('', 1000)).assertFalse();
      expect(bin.trashed().length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHBINCASES_0900
     * @tc.name      testTrashBinCases0009
     * @tc.desc      Verify restore rejects already active
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTrashBinCases0009', 0, (): void => {
      const bin: TrashBin = new TrashBin();
      bin.trash('n1', 'a', 1, 1000, '');
      bin.restore('n1', 2000);
      expect(bin.restore('n1', 3000)).assertFalse();
      expect(bin.entryOf('n1')?.state).assertEqual(TrashState.ACTIVE);
      expect(bin.entryOf('n1') === undefined).assertFalse();
      expect(bin.trashed().length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHBINCASES_1000
     * @tc.name      testTrashBinCases0010
     * @tc.desc      Verify purge removes only expired
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTrashBinCases0010', 0, (): void => {
      const bin: TrashBin = new TrashBin();
      bin.trash('old', '旧', 1, 1000, '');
      bin.trash('fresh', '新', 1, 1000 + 20 * DAY, '');
      const removed: TrashEntry[] = bin.purge(1001 + 30 * DAY);
      expect(removed.length).assertEqual(1);
      expect(removed[0].noteId).assertEqual('old');
      expect(bin.entryOf('old')?.state).assertEqual(TrashState.PURGED);
      expect(bin.entryOf('fresh')?.state).assertEqual(TrashState.TRASHED);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHBINCASES_1100
     * @tc.name      testTrashBinCases0011
     * @tc.desc      Verify purge keeps boundary entry
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTrashBinCases0011', 0, (): void => {
      const bin: TrashBin = new TrashBin();
      bin.trash('n1', 'a', 1, 1000, '');
      expect(bin.purge(1000 + 30 * DAY).length).assertEqual(0);
      expect(bin.entryOf('n1')?.state).assertEqual(TrashState.TRASHED);
      expect(bin.purge(1001 + 30 * DAY).length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHBINCASES_1200
     * @tc.name      testTrashBinCases0012
     * @tc.desc      Verify purge skips active entries
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTrashBinCases0012', 0, (): void => {
      const bin: TrashBin = new TrashBin();
      bin.trash('n1', 'a', 1, 1000, '');
      bin.restore('n1', 2000);
      expect(bin.purge(1001 + 40 * DAY).length).assertEqual(0);
      expect(bin.entryOf('n1')?.state).assertEqual(TrashState.ACTIVE);
      expect(bin.size()).assertEqual(1);
      expect(bin.trashed().length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHBINCASES_1300
     * @tc.name      testTrashBinCases0013
     * @tc.desc      Verify purged entry cannot be restored
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTrashBinCases0013', 0, (): void => {
      const bin: TrashBin = new TrashBin();
      bin.trash('n1', 'a', 1, 1000, '');
      bin.purge(1001 + 30 * DAY);
      expect(bin.restore('n1', 1002 + 30 * DAY)).assertFalse();
      expect(bin.inTrash('n1')).assertFalse();
      expect(bin.entryOf('n1')?.state).assertEqual(TrashState.PURGED);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHBINCASES_1400
     * @tc.name      testTrashBinCases0014
     * @tc.desc      Verify size counts purged entries
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTrashBinCases0014', 0, (): void => {
      const bin: TrashBin = new TrashBin();
      bin.trash('a', 'a', 1, 1000, '');
      bin.trash('b', 'b', 1, 1000, '');
      bin.purge(1001 + 30 * DAY);
      expect(bin.size()).assertEqual(2);
      expect(bin.trashed().length).assertEqual(0);
      expect(bin.entryOf('a')?.state).assertEqual(TrashState.PURGED);
      expect(bin.trash('c', 'c', 1, 1000, '')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHBINCASES_1500
     * @tc.name      testTrashBinCases0015
     * @tc.desc      Verify retrash after restore works
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTrashBinCases0015', 0, (): void => {
      const bin: TrashBin = new TrashBin();
      bin.trash('n1', 'a', 1, 1000, '');
      bin.restore('n1', 2000);
      expect(bin.trash('n1', 'a', 2, 3000, '再次删除')).assertTrue();
      expect(bin.inTrash('n1')).assertTrue();
      expect(bin.entryOf('n1')?.trashedAt).assertEqual(3000);
      expect(bin.size()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHBINCASES_1600
     * @tc.name      testTrashBinCases0016
     * @tc.desc      Verify empty bin reports nothing
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTrashBinCases0016', 0, (): void => {
      const bin: TrashBin = new TrashBin();
      expect(bin.size()).assertEqual(0);
      expect(bin.trashed().length).assertEqual(0);
      expect(bin.purge(1000).length).assertEqual(0);
      expect(bin.inTrash('any')).assertFalse();
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

    it('testTrashLinesCases0001', 0, (): void => {
      const lines: string[] = trashLines(new TrashBin(), 1000);
      expect(lines.length).assertEqual(1);
      expect(lines[0]).assertEqual('回收站为空');
      expect(lines[0].length).assertEqual(5);
      expect(lines[0].indexOf('为空') > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHLINESCASES_0200
     * @tc.name      testTrashLinesCases0002
     * @tc.desc      Verify headline counts items
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTrashLinesCases0002', 0, (): void => {
      const bin: TrashBin = new TrashBin();
      bin.trash('n1', 'a', 1, 1000, '');
      bin.trash('n2', 'b', 1, 1000, '');
      const lines: string[] = trashLines(bin, 1000);
      expect(lines[0]).assertEqual('回收站 2 项｜保留 30 天');
      expect(lines.length).assertEqual(3);
      expect(lines[0].indexOf('保留 30 天') > 0).assertTrue();
      expect(lines[0].split('｜').length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHLINESCASES_0300
     * @tc.name      testTrashLinesCases0003
     * @tc.desc      Verify line shows restorable state
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTrashLinesCases0003', 0, (): void => {
      const bin: TrashBin = new TrashBin();
      bin.trash('n1', '周报', 3, 1000, '手动删除');
      const lines: string[] = trashLines(bin, 1000 + 2 * DAY);
      expect(lines[1]).assertEqual('周报｜回收站｜修订 3｜来源 手动删除｜可恢复（已存 2 天）');
      expect(lines[1].indexOf('可恢复') > 0).assertTrue();
      expect(lines[1].indexOf('已存 2 天') > 0).assertTrue();
      expect(lines[1].split('｜').length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHLINESCASES_0400
     * @tc.name      testTrashLinesCases0004
     * @tc.desc      Verify line marks expired entry
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTrashLinesCases0004', 0, (): void => {
      const bin: TrashBin = new TrashBin();
      bin.trash('n1', '周报', 1, 1000, '');
      const lines: string[] = trashLines(bin, 1000 + 40 * DAY);
      expect(lines[1].indexOf('已过期') > 0).assertTrue();
      expect(lines[1].indexOf('可恢复')).assertEqual(-1);
      expect(lines.length).assertEqual(2);
      expect(lines[1].substring(lines[1].length - 3)).assertEqual('已过期');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHLINESCASES_0500
     * @tc.name      testTrashLinesCases0005
     * @tc.desc      Verify days are floored
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTrashLinesCases0005', 0, (): void => {
      const bin: TrashBin = new TrashBin();
      bin.trash('n1', 'a', 1, 0, '');
      expect(trashLines(bin, DAY - 1)[1].indexOf('已存 0 天') > 0).assertTrue();
      expect(trashLines(bin, 3 * DAY + 5)[1].indexOf('已存 3 天') > 0).assertTrue();
      expect(trashLines(bin, 0)[1].indexOf('已存 0 天') > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHLINESCASES_0600
     * @tc.name      testTrashLinesCases0006
     * @tc.desc      Verify lines skip restored entries
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTrashLinesCases0006', 0, (): void => {
      const bin: TrashBin = new TrashBin();
      bin.trash('n1', 'a', 1, 1000, '');
      bin.trash('n2', 'b', 1, 1000, '');
      bin.restore('n1', 2000);
      const lines: string[] = trashLines(bin, 2000);
      expect(lines[0]).assertEqual('回收站 1 项｜保留 30 天');
      expect(lines.length).assertEqual(2);
      expect(lines[1].indexOf('b｜') === 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TRASHLINESCASES_0700
     * @tc.name      testTrashLinesCases0007
     * @tc.desc      Verify lines skip purged entries
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTrashLinesCases0007', 0, (): void => {
      const bin: TrashBin = new TrashBin();
      bin.trash('n1', 'a', 1, 1000, '');
      bin.purge(1001 + 30 * DAY);
      const lines: string[] = trashLines(bin, 1002 + 30 * DAY);
      expect(lines.length).assertEqual(1);
      expect(lines[0]).assertEqual('回收站为空');
      expect(bin.size()).assertEqual(1);
    });
  });
}

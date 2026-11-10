import { describe, expect, it } from '@ohos/hypium';
import { QueryOutcome, QueryRecord, RefreshSource } from '../../../main/ets/autostart/AutoStartupTypes';
import {
  DEFAULT_REMINDER, ReminderChannel, ReminderConfig, ReminderDecision, ReminderInput,
  ReminderVerdict, afterRemind, auditReminderConfig, confirmedOff, confirmedOn, inQuietHours,
  planReminder, quietText, resetDaily
} from '../../../main/ets/autostart/notify/ReminderPolicy';
import {
  MESSAGES, TEMPLATES, TemplateEntry, MessageEntry, MessageKey, auditMessages,
  extractPlaceholders, messageLines, messageOf, renderTemplate, templateLines, templateOf, textOf,
  userFacingCount, valuesOf
} from '../../../main/ets/autostart/text/MessageCatalog';

function recordOf(result: string, outcome: QueryOutcome): QueryRecord {
  const record: QueryRecord = new QueryRecord();
  record.id = 1;
  record.timestamp = 1700000000000;
  record.source = RefreshSource.MANUAL;
  record.outcome = outcome;
  record.result = result;
  record.supportResult = 'true';
  record.statusResult = result;
  record.errorCode = '';
  record.errorMessage = '';
  record.durationMillis = 40;
  return record;
}

function inputAt(hour: number, latest: QueryRecord | undefined): ReminderInput {
  const input: ReminderInput = new ReminderInput();
  input.now = new Date(2026, 0, 5, hour, 30, 0).getTime();
  input.latest = latest;
  return input;
}

export default function reminderTextCasesTest(): void {
  describe('QuietHourCases', (): void => {
    /**
     * @tc.number    SUB_STARTUP_QUIETHOURCASES_0100
     * @tc.name      testQuietHourCases0001
     * @tc.desc      Verify cross midnight quiet window
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testQuietHourCases0001', 0, (): void => {
      expect(inQuietHours(23, DEFAULT_REMINDER)).assertTrue();
      expect(inQuietHours(2, DEFAULT_REMINDER)).assertTrue();
      expect(inQuietHours(22, DEFAULT_REMINDER)).assertTrue();
      expect(inQuietHours(8, DEFAULT_REMINDER)).assertFalse();
      expect(inQuietHours(12, DEFAULT_REMINDER)).assertFalse();
      expect(quietText(DEFAULT_REMINDER).indexOf('22:00') > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_QUIETHOURCASES_0200
     * @tc.name      testQuietHourCases0002
     * @tc.desc      Verify same day window and disabled
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testQuietHourCases0002', 0, (): void => {
      const day: ReminderConfig = new ReminderConfig();
      day.quietStartHour = 12;
      day.quietEndHour = 14;
      expect(inQuietHours(12, day)).assertTrue();
      expect(inQuietHours(13, day)).assertTrue();
      expect(inQuietHours(14, day)).assertFalse();
      const off: ReminderConfig = new ReminderConfig();
      off.quietHoursEnabled = false;
      expect(inQuietHours(23, off)).assertFalse();
      expect(quietText(off)).assertEqual('未启用静默时段');
      const empty: ReminderConfig = new ReminderConfig();
      empty.quietStartHour = 5;
      empty.quietEndHour = 5;
      expect(inQuietHours(5, empty)).assertFalse();
    });
  });

  describe('ReminderDecisionCases', (): void => {
    /**
     * @tc.number    SUB_STARTUP_REMINDERDECISIONCASES_0100
     * @tc.name      testReminderDecisionCases0001
     * @tc.desc      Verify confirmed on suppresses reminder
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReminderDecisionCases0001', 0, (): void => {
      const input: ReminderInput = inputAt(10, recordOf('已开启', QueryOutcome.SUCCESS));
      const decision: ReminderDecision = planReminder(input);
      expect(decision.verdict).assertEqual(ReminderVerdict.NOT_NEEDED);
      expect(decision.shouldShow()).assertFalse();
      expect(decision.channel).assertEqual(ReminderChannel.NONE);
      expect(confirmedOn(input.latest)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_REMINDERDECISIONCASES_0200
     * @tc.name      testReminderDecisionCases0002
     * @tc.desc      Verify failure is not treated as off
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReminderDecisionCases0002', 0, (): void => {
      const failed: ReminderInput = inputAt(10, recordOf('未开启', QueryOutcome.FAILURE));
      expect(planReminder(failed).verdict).assertEqual(ReminderVerdict.NOT_CONFIRMED);
      const timeout: ReminderInput = inputAt(10, recordOf('未开启', QueryOutcome.TIMEOUT));
      expect(planReminder(timeout).verdict).assertEqual(ReminderVerdict.NOT_CONFIRMED);
      const missing: ReminderInput = inputAt(10, undefined);
      expect(planReminder(missing).verdict).assertEqual(ReminderVerdict.NOT_CONFIRMED);
      expect(confirmedOff(undefined)).assertFalse();
      expect(confirmedOff(recordOf('', QueryOutcome.SUCCESS))).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_REMINDERDECISIONCASES_0300
     * @tc.name      testReminderDecisionCases0003
     * @tc.desc      Verify first reminder uses banner
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReminderDecisionCases0003', 0, (): void => {
      const input: ReminderInput = inputAt(10, recordOf('未开启', QueryOutcome.SUCCESS));
      const decision: ReminderDecision = planReminder(input);
      expect(decision.verdict).assertEqual(ReminderVerdict.SHOULD_REMIND);
      expect(decision.channel).assertEqual(ReminderChannel.BANNER);
      expect(decision.shouldShow()).assertTrue();
      expect(decision.text().indexOf('shouldRemind') === 0).assertTrue();
      expect(confirmedOff(input.latest)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_REMINDERDECISIONCASES_0400
     * @tc.name      testReminderDecisionCases0004
     * @tc.desc      Verify later reminder uses toast
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReminderDecisionCases0004', 0, (): void => {
      const input: ReminderInput = inputAt(10, recordOf('未开启', QueryOutcome.SUCCESS));
      input.todayCount = 1;
      const decision: ReminderDecision = planReminder(input);
      expect(decision.verdict).assertEqual(ReminderVerdict.SHOULD_REMIND);
      expect(decision.channel).assertEqual(ReminderChannel.TOAST);
      expect(decision.verdict === ReminderVerdict.NOT_NEEDED).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_REMINDERDECISIONCASES_0500
     * @tc.name      testReminderDecisionCases0005
     * @tc.desc      Verify interval guard returns wait time
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReminderDecisionCases0005', 0, (): void => {
      const input: ReminderInput = inputAt(10, recordOf('未开启', QueryOutcome.SUCCESS));
      input.lastRemindedAt = input.now - 60 * 1000;
      const decision: ReminderDecision = planReminder(input);
      expect(decision.verdict).assertEqual(ReminderVerdict.TOO_SOON);
      expect(decision.waitMillis).assertEqual(DEFAULT_REMINDER.minIntervalMs - 60000);
      expect(decision.message.indexOf('不足') > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_REMINDERDECISIONCASES_0600
     * @tc.name      testReminderDecisionCases0006
     * @tc.desc      Verify daily and total limits
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReminderDecisionCases0006', 0, (): void => {
      const daily: ReminderInput = inputAt(10, recordOf('未开启', QueryOutcome.SUCCESS));
      daily.todayCount = DEFAULT_REMINDER.dailyLimit;
      expect(planReminder(daily).verdict).assertEqual(ReminderVerdict.LIMIT_REACHED);
      expect(planReminder(daily).message.indexOf('今日') === 0).assertTrue();
      const total: ReminderInput = inputAt(10, recordOf('未开启', QueryOutcome.SUCCESS));
      total.totalCount = DEFAULT_REMINDER.totalLimit;
      expect(planReminder(total).verdict).assertEqual(ReminderVerdict.LIMIT_REACHED);
      expect(planReminder(total).message.indexOf('累计') === 0).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_REMINDERDECISIONCASES_0700
     * @tc.name      testReminderDecisionCases0007
     * @tc.desc      Verify quiet hours and silence win
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReminderDecisionCases0007', 0, (): void => {
      const night: ReminderInput = inputAt(23, recordOf('未开启', QueryOutcome.SUCCESS));
      expect(planReminder(night).verdict).assertEqual(ReminderVerdict.SILENCED);
      expect(planReminder(night).message.indexOf('静默') >= 0).assertTrue();
      const muted: ReminderInput = inputAt(10, recordOf('未开启', QueryOutcome.SUCCESS));
      muted.userSilenced = true;
      expect(planReminder(muted).verdict).assertEqual(ReminderVerdict.SILENCED);
      expect(planReminder(muted).message.indexOf('关闭提醒') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_REMINDERDECISIONCASES_0800
     * @tc.name      testReminderDecisionCases0008
     * @tc.desc      Verify counters advance and reset daily
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReminderDecisionCases0008', 0, (): void => {
      const input: ReminderInput = inputAt(10, recordOf('未开启', QueryOutcome.SUCCESS));
      const reminded: ReminderInput = afterRemind(input);
      expect(reminded.todayCount).assertEqual(1);
      expect(reminded.totalCount).assertEqual(1);
      expect(reminded.lastRemindedAt).assertEqual(input.now);
      expect(input.todayCount).assertEqual(0);
      const nextDay: ReminderInput = resetDaily(reminded);
      expect(nextDay.todayCount).assertEqual(0);
      expect(nextDay.totalCount).assertEqual(1);
      expect(nextDay.lastRemindedAt).assertEqual(input.now);
    });

    /**
     * @tc.number    SUB_STARTUP_REMINDERDECISIONCASES_0900
     * @tc.name      testReminderDecisionCases0009
     * @tc.desc      Verify config audit catches bad values
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReminderDecisionCases0009', 0, (): void => {
      expect(auditReminderConfig().ok).assertTrue();
      expect(auditReminderConfig().summary()).assertEqual('提醒配置自洽');
      const bad: ReminderConfig = new ReminderConfig();
      bad.minIntervalMs = 0;
      bad.dailyLimit = 0;
      bad.totalLimit = 1;
      bad.quietStartHour = 30;
      const audit = auditReminderConfig(bad);
      expect(audit.ok).assertFalse();
      expect(audit.findings.length).assertEqual(3);
      expect(DEFAULT_REMINDER.text().indexOf('10 分钟') > 0).assertTrue();
    });
  });

  describe('MessageCatalogCases', (): void => {
    /**
     * @tc.number    SUB_STARTUP_MESSAGECATALOGCASES_0100
     * @tc.name      testMessageCatalogCases0001
     * @tc.desc      Verify message table is consistent
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testMessageCatalogCases0001', 0, (): void => {
      expect(MESSAGES.length).assertEqual(15);
      expect(messageLines().length).assertEqual(15);
      expect(auditMessages().ok).assertTrue();
      expect(auditMessages().summary()).assertEqual('文案表自洽');
      expect(userFacingCount()).assertEqual(15);
      expect(textOf(MessageKey.STATUS_ON)).assertEqual('已开启开机自启');
      expect(textOf(MessageKey.EXPORT_EMPTY)).assertEqual('没有可导出的记录');
    });

    /**
     * @tc.number    SUB_STARTUP_MESSAGECATALOGCASES_0200
     * @tc.name      testMessageCatalogCases0002
     * @tc.desc      Verify unknown key yields empty entry
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testMessageCatalogCases0002', 0, (): void => {
      const entry: MessageEntry = messageOf('missing' as MessageKey);
      expect(entry.text).assertEqual('');
      expect(entry.userFacing).assertFalse();
      expect(textOf('missing' as MessageKey)).assertEqual('');
      expect(templateOf('missing').template).assertEqual('');
      expect(messageOf(MessageKey.APP_TITLE).overflow()).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_MESSAGECATALOGCASES_0300
     * @tc.name      testMessageCatalogCases0003
     * @tc.desc      Verify entry clips and reports overflow
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testMessageCatalogCases0003', 0, (): void => {
      const entry: MessageEntry = new MessageEntry(MessageKey.STATUS_OFF, 'x'.repeat(40), 10);
      expect(entry.overflow()).assertTrue();
      expect(entry.clipped().length).assertEqual(10);
      expect(entry.clipped().endsWith('…')).assertTrue();
      expect(entry.describe().indexOf('40/10') > 0).assertTrue();
      const short: MessageEntry = new MessageEntry(MessageKey.STATUS_ON, '短文案', 10);
      expect(short.clipped()).assertEqual('短文案');
      expect(short.overflow()).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_MESSAGECATALOGCASES_0400
     * @tc.name      testMessageCatalogCases0004
     * @tc.desc      Verify placeholder extraction is ordered
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testMessageCatalogCases0004', 0, (): void => {
      expect(extractPlaceholders('共 {count} 条，最近 {time}').length).assertEqual(2);
      expect(extractPlaceholders('共 {count} 条，最近 {time}')[1]).assertEqual('time');
      expect(extractPlaceholders('无占位符').length).assertEqual(0);
      expect(extractPlaceholders('{a}{a}{b}').length).assertEqual(2);
      expect(extractPlaceholders('{未闭合').length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STARTUP_MESSAGECATALOGCASES_0500
     * @tc.name      testMessageCatalogCases0005
     * @tc.desc      Verify templates render with values
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testMessageCatalogCases0005', 0, (): void => {
      expect(TEMPLATES.length).assertEqual(7);
      expect(templateLines().length).assertEqual(7);
      const rendered: string = renderTemplate('historyCount',
        valuesOf([['count', '3'], ['time', '09:15']]));
      expect(rendered).assertEqual('共 3 条记录，最近一次在 09:15');
      const partial: string = renderTemplate('exportSummary', valuesOf([['format', 'CSV']]));
      expect(partial.indexOf('{rows}') >= 0).assertTrue();
      expect(valuesOf([['k']]).size).assertEqual(0);
      expect(valuesOf([['k', 'v'], ['k2', 'v2']]).size).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STARTUP_MESSAGECATALOGCASES_0600
     * @tc.name      testMessageCatalogCases0006
     * @tc.desc      Verify template completeness is checkable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testMessageCatalogCases0006', 0, (): void => {
      const template: TemplateEntry = templateOf('checkResult');
      expect(template.placeholders.length).assertEqual(3);
      expect(template.complete(valuesOf([['passed', '1'], ['warned', '2'], ['failed', '3']])))
        .assertTrue();
      expect(template.complete(valuesOf([['passed', '1']]))).assertFalse();
      const rendered: string = template.render(
        valuesOf([['passed', '20'], ['warned', '1'], ['failed', '0']]));
      expect(rendered).assertEqual('20 项通过，1 项提醒，0 项不通过');
    });

    /**
     * @tc.number    SUB_STARTUP_MESSAGECATALOGCASES_0700
     * @tc.name      testMessageCatalogCases0007
     * @tc.desc      Verify catalog covers core states
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testMessageCatalogCases0007', 0, (): void => {
      const keys: MessageKey[] = [MessageKey.STATUS_ON, MessageKey.STATUS_OFF,
        MessageKey.STATUS_UNKNOWN, MessageKey.QUERY_FAILED, MessageKey.UNSUPPORTED];
      keys.forEach((key: MessageKey): void => {
        const entry: MessageEntry = messageOf(key);
        expect(entry.text.length > 0).assertTrue();
        expect(entry.overflow()).assertFalse();
        expect(entry.maxLength <= 64).assertTrue();
      });
      expect(keys.length).assertEqual(5);
    });
  });
}

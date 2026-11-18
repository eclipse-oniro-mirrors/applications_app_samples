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

import { describe, expect } from '@ohos/hypium';
import { traceParameter, loggedIt as it } from '../support/TestLog';
import { configureTestText } from '../support/TestTextResources';
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
  configureTestText();
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
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_QuietHourCases_0001|ReminderTextCases.test.ets|assert0001|assertTrue|actual|expected=true', inQuietHours(23, DEFAULT_REMINDER))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_QuietHourCases_0001|ReminderTextCases.test.ets|assert0002|assertTrue|actual|expected=true', inQuietHours(2, DEFAULT_REMINDER))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_QuietHourCases_0001|ReminderTextCases.test.ets|assert0003|assertTrue|actual|expected=true', inQuietHours(22, DEFAULT_REMINDER))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_QuietHourCases_0001|ReminderTextCases.test.ets|assert0004|assertFalse|actual|expected=false', inQuietHours(8, DEFAULT_REMINDER))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_QuietHourCases_0001|ReminderTextCases.test.ets|assert0005|assertFalse|actual|expected=false', inQuietHours(12, DEFAULT_REMINDER))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_QuietHourCases_0001|ReminderTextCases.test.ets|assert0006|assertTrue|actual|expected=true', quietText(DEFAULT_REMINDER).indexOf('22:00') > 0)).assertTrue();
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
      configureTestText();
      const day: ReminderConfig = new ReminderConfig();
      day.quietStartHour = 12;
      day.quietEndHour = 14;
      expect(traceParameter('com.samples.appstartupauto_QuietHourCases_0002|ReminderTextCases.test.ets|assert0007|assertTrue|actual|expected=true', inQuietHours(12, day))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_QuietHourCases_0002|ReminderTextCases.test.ets|assert0008|assertTrue|actual|expected=true', inQuietHours(13, day))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_QuietHourCases_0002|ReminderTextCases.test.ets|assert0009|assertFalse|actual|expected=false', inQuietHours(14, day))).assertFalse();
      const off: ReminderConfig = new ReminderConfig();
      off.quietHoursEnabled = false;
      expect(traceParameter('com.samples.appstartupauto_QuietHourCases_0002|ReminderTextCases.test.ets|assert0010|assertFalse|actual|expected=false', inQuietHours(23, off))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_QuietHourCases_0002|ReminderTextCases.test.ets|assert0011|assertEqual|actual', quietText(off))).assertEqual(traceParameter('com.samples.appstartupauto_QuietHourCases_0002|ReminderTextCases.test.ets|assert0011|assertEqual|expected', '未启用静默时段'));
      const empty: ReminderConfig = new ReminderConfig();
      empty.quietStartHour = 5;
      empty.quietEndHour = 5;
      expect(traceParameter('com.samples.appstartupauto_QuietHourCases_0002|ReminderTextCases.test.ets|assert0012|assertFalse|actual|expected=false', inQuietHours(5, empty))).assertFalse();
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
      configureTestText();
      const input: ReminderInput = inputAt(10, recordOf('已开启', QueryOutcome.SUCCESS));
      const decision: ReminderDecision = planReminder(input);
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0001|ReminderTextCases.test.ets|assert0013|assertEqual|actual', decision.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0001|ReminderTextCases.test.ets|assert0013|assertEqual|expected', ReminderVerdict.NOT_NEEDED));
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0001|ReminderTextCases.test.ets|assert0014|assertFalse|actual|expected=false', decision.shouldShow())).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0001|ReminderTextCases.test.ets|assert0015|assertEqual|actual', decision.channel)).assertEqual(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0001|ReminderTextCases.test.ets|assert0015|assertEqual|expected', ReminderChannel.NONE));
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0001|ReminderTextCases.test.ets|assert0016|assertTrue|actual|expected=true', confirmedOn(input.latest))).assertTrue();
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
      configureTestText();
      const failed: ReminderInput = inputAt(10, recordOf('未开启', QueryOutcome.FAILURE));
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0002|ReminderTextCases.test.ets|assert0017|assertEqual|actual', planReminder(failed).verdict)).assertEqual(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0002|ReminderTextCases.test.ets|assert0017|assertEqual|expected', ReminderVerdict.NOT_CONFIRMED));
      const timeout: ReminderInput = inputAt(10, recordOf('未开启', QueryOutcome.TIMEOUT));
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0002|ReminderTextCases.test.ets|assert0018|assertEqual|actual', planReminder(timeout).verdict)).assertEqual(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0002|ReminderTextCases.test.ets|assert0018|assertEqual|expected', ReminderVerdict.NOT_CONFIRMED));
      const missing: ReminderInput = inputAt(10, undefined);
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0002|ReminderTextCases.test.ets|assert0019|assertEqual|actual', planReminder(missing).verdict)).assertEqual(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0002|ReminderTextCases.test.ets|assert0019|assertEqual|expected', ReminderVerdict.NOT_CONFIRMED));
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0002|ReminderTextCases.test.ets|assert0020|assertFalse|actual|expected=false', confirmedOff(undefined))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0002|ReminderTextCases.test.ets|assert0021|assertFalse|actual|expected=false', confirmedOff(recordOf('', QueryOutcome.SUCCESS)))).assertFalse();
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
      configureTestText();
      const input: ReminderInput = inputAt(10, recordOf('未开启', QueryOutcome.SUCCESS));
      const decision: ReminderDecision = planReminder(input);
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0003|ReminderTextCases.test.ets|assert0022|assertEqual|actual', decision.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0003|ReminderTextCases.test.ets|assert0022|assertEqual|expected', ReminderVerdict.SHOULD_REMIND));
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0003|ReminderTextCases.test.ets|assert0023|assertEqual|actual', decision.channel)).assertEqual(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0003|ReminderTextCases.test.ets|assert0023|assertEqual|expected', ReminderChannel.BANNER));
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0003|ReminderTextCases.test.ets|assert0024|assertTrue|actual|expected=true', decision.shouldShow())).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0003|ReminderTextCases.test.ets|assert0025|assertTrue|actual|expected=true', decision.text().indexOf('shouldRemind') === 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0003|ReminderTextCases.test.ets|assert0026|assertTrue|actual|expected=true', confirmedOff(input.latest))).assertTrue();
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
      configureTestText();
      const input: ReminderInput = inputAt(10, recordOf('未开启', QueryOutcome.SUCCESS));
      input.todayCount = 1;
      const decision: ReminderDecision = planReminder(input);
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0004|ReminderTextCases.test.ets|assert0027|assertEqual|actual', decision.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0004|ReminderTextCases.test.ets|assert0027|assertEqual|expected', ReminderVerdict.SHOULD_REMIND));
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0004|ReminderTextCases.test.ets|assert0028|assertEqual|actual', decision.channel)).assertEqual(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0004|ReminderTextCases.test.ets|assert0028|assertEqual|expected', ReminderChannel.TOAST));
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0004|ReminderTextCases.test.ets|assert0029|assertFalse|actual|expected=false', decision.verdict === ReminderVerdict.NOT_NEEDED)).assertFalse();
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
      configureTestText();
      const input: ReminderInput = inputAt(10, recordOf('未开启', QueryOutcome.SUCCESS));
      input.lastRemindedAt = input.now - 60 * 1000;
      const decision: ReminderDecision = planReminder(input);
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0005|ReminderTextCases.test.ets|assert0030|assertEqual|actual', decision.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0005|ReminderTextCases.test.ets|assert0030|assertEqual|expected', ReminderVerdict.TOO_SOON));
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0005|ReminderTextCases.test.ets|assert0031|assertEqual|actual', decision.waitMillis)).assertEqual(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0005|ReminderTextCases.test.ets|assert0031|assertEqual|expected', DEFAULT_REMINDER.minIntervalMs - 60000));
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0005|ReminderTextCases.test.ets|assert0032|assertTrue|actual|expected=true', decision.message.indexOf('不足') > 0)).assertTrue();
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
      configureTestText();
      const daily: ReminderInput = inputAt(10, recordOf('未开启', QueryOutcome.SUCCESS));
      daily.todayCount = DEFAULT_REMINDER.dailyLimit;
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0006|ReminderTextCases.test.ets|assert0033|assertEqual|actual', planReminder(daily).verdict)).assertEqual(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0006|ReminderTextCases.test.ets|assert0033|assertEqual|expected', ReminderVerdict.LIMIT_REACHED));
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0006|ReminderTextCases.test.ets|assert0034|assertTrue|actual|expected=true', planReminder(daily).message.indexOf('今日') === 0)).assertTrue();
      const total: ReminderInput = inputAt(10, recordOf('未开启', QueryOutcome.SUCCESS));
      total.totalCount = DEFAULT_REMINDER.totalLimit;
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0006|ReminderTextCases.test.ets|assert0035|assertEqual|actual', planReminder(total).verdict)).assertEqual(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0006|ReminderTextCases.test.ets|assert0035|assertEqual|expected', ReminderVerdict.LIMIT_REACHED));
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0006|ReminderTextCases.test.ets|assert0036|assertTrue|actual|expected=true', planReminder(total).message.indexOf('累计') === 0)).assertTrue();
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
      configureTestText();
      const night: ReminderInput = inputAt(23, recordOf('未开启', QueryOutcome.SUCCESS));
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0007|ReminderTextCases.test.ets|assert0037|assertEqual|actual', planReminder(night).verdict)).assertEqual(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0007|ReminderTextCases.test.ets|assert0037|assertEqual|expected', ReminderVerdict.SILENCED));
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0007|ReminderTextCases.test.ets|assert0038|assertTrue|actual|expected=true', planReminder(night).message.indexOf('静默') >= 0)).assertTrue();
      const muted: ReminderInput = inputAt(10, recordOf('未开启', QueryOutcome.SUCCESS));
      muted.userSilenced = true;
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0007|ReminderTextCases.test.ets|assert0039|assertEqual|actual', planReminder(muted).verdict)).assertEqual(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0007|ReminderTextCases.test.ets|assert0039|assertEqual|expected', ReminderVerdict.SILENCED));
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0007|ReminderTextCases.test.ets|assert0040|assertTrue|actual|expected=true', planReminder(muted).message.indexOf('关闭提醒') >= 0)).assertTrue();
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
      configureTestText();
      const input: ReminderInput = inputAt(10, recordOf('未开启', QueryOutcome.SUCCESS));
      const reminded: ReminderInput = afterRemind(input);
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0008|ReminderTextCases.test.ets|assert0041|assertEqual|actual', reminded.todayCount)).assertEqual(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0008|ReminderTextCases.test.ets|assert0041|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0008|ReminderTextCases.test.ets|assert0042|assertEqual|actual', reminded.totalCount)).assertEqual(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0008|ReminderTextCases.test.ets|assert0042|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0008|ReminderTextCases.test.ets|assert0043|assertEqual|actual', reminded.lastRemindedAt)).assertEqual(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0008|ReminderTextCases.test.ets|assert0043|assertEqual|expected', input.now));
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0008|ReminderTextCases.test.ets|assert0044|assertEqual|actual', input.todayCount)).assertEqual(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0008|ReminderTextCases.test.ets|assert0044|assertEqual|expected', 0));
      const nextDay: ReminderInput = resetDaily(reminded);
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0008|ReminderTextCases.test.ets|assert0045|assertEqual|actual', nextDay.todayCount)).assertEqual(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0008|ReminderTextCases.test.ets|assert0045|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0008|ReminderTextCases.test.ets|assert0046|assertEqual|actual', nextDay.totalCount)).assertEqual(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0008|ReminderTextCases.test.ets|assert0046|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0008|ReminderTextCases.test.ets|assert0047|assertEqual|actual', nextDay.lastRemindedAt)).assertEqual(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0008|ReminderTextCases.test.ets|assert0047|assertEqual|expected', input.now));
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
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0009|ReminderTextCases.test.ets|assert0048|assertTrue|actual|expected=true', auditReminderConfig().ok)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0009|ReminderTextCases.test.ets|assert0049|assertEqual|actual', auditReminderConfig().summary())).assertEqual(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0009|ReminderTextCases.test.ets|assert0049|assertEqual|expected', '提醒配置自洽'));
      const bad: ReminderConfig = new ReminderConfig();
      bad.minIntervalMs = 0;
      bad.dailyLimit = 0;
      bad.totalLimit = 1;
      bad.quietStartHour = 30;
      const audit = auditReminderConfig(bad);
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0009|ReminderTextCases.test.ets|assert0050|assertFalse|actual|expected=false', audit.ok)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0009|ReminderTextCases.test.ets|assert0051|assertEqual|actual', audit.findings.length)).assertEqual(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0009|ReminderTextCases.test.ets|assert0051|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_ReminderDecisionCases_0009|ReminderTextCases.test.ets|assert0052|assertTrue|actual|expected=true', DEFAULT_REMINDER.text().indexOf('10 分钟') > 0)).assertTrue();
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
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0001|ReminderTextCases.test.ets|assert0053|assertEqual|actual', MESSAGES.length)).assertEqual(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0001|ReminderTextCases.test.ets|assert0053|assertEqual|expected', 15));
      expect(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0001|ReminderTextCases.test.ets|assert0054|assertEqual|actual', messageLines().length)).assertEqual(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0001|ReminderTextCases.test.ets|assert0054|assertEqual|expected', 15));
      expect(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0001|ReminderTextCases.test.ets|assert0055|assertTrue|actual|expected=true', auditMessages().ok)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0001|ReminderTextCases.test.ets|assert0056|assertEqual|actual', auditMessages().summary())).assertEqual(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0001|ReminderTextCases.test.ets|assert0056|assertEqual|expected', '文案表自洽'));
      expect(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0001|ReminderTextCases.test.ets|assert0057|assertEqual|actual', userFacingCount())).assertEqual(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0001|ReminderTextCases.test.ets|assert0057|assertEqual|expected', 15));
      expect(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0001|ReminderTextCases.test.ets|assert0058|assertEqual|actual', textOf(MessageKey.STATUS_ON))).assertEqual(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0001|ReminderTextCases.test.ets|assert0058|assertEqual|expected', '已开启开机自启'));
      expect(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0001|ReminderTextCases.test.ets|assert0059|assertEqual|actual', textOf(MessageKey.EXPORT_EMPTY))).assertEqual(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0001|ReminderTextCases.test.ets|assert0059|assertEqual|expected', '没有可导出的记录'));
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
      configureTestText();
      const entry: MessageEntry = messageOf('missing' as MessageKey);
      expect(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0002|ReminderTextCases.test.ets|assert0060|assertEqual|actual', entry.text)).assertEqual(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0002|ReminderTextCases.test.ets|assert0060|assertEqual|expected', ''));
      expect(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0002|ReminderTextCases.test.ets|assert0061|assertFalse|actual|expected=false', entry.userFacing)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0002|ReminderTextCases.test.ets|assert0062|assertEqual|actual', textOf('missing' as MessageKey))).assertEqual(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0002|ReminderTextCases.test.ets|assert0062|assertEqual|expected', ''));
      expect(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0002|ReminderTextCases.test.ets|assert0063|assertEqual|actual', templateOf('missing').template)).assertEqual(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0002|ReminderTextCases.test.ets|assert0063|assertEqual|expected', ''));
      expect(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0002|ReminderTextCases.test.ets|assert0064|assertFalse|actual|expected=false', messageOf(MessageKey.APP_TITLE).overflow())).assertFalse();
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
      configureTestText();
      const entry: MessageEntry = new MessageEntry(MessageKey.STATUS_OFF, 'x'.repeat(40), 10);
      expect(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0003|ReminderTextCases.test.ets|assert0065|assertTrue|actual|expected=true', entry.overflow())).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0003|ReminderTextCases.test.ets|assert0066|assertEqual|actual', entry.clipped().length)).assertEqual(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0003|ReminderTextCases.test.ets|assert0066|assertEqual|expected', 10));
      expect(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0003|ReminderTextCases.test.ets|assert0067|assertTrue|actual|expected=true', entry.clipped().endsWith('…'))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0003|ReminderTextCases.test.ets|assert0068|assertTrue|actual|expected=true', entry.describe().indexOf('40/10') > 0)).assertTrue();
      const short: MessageEntry = new MessageEntry(MessageKey.STATUS_ON, '短文案', 10);
      expect(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0003|ReminderTextCases.test.ets|assert0069|assertEqual|actual', short.clipped())).assertEqual(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0003|ReminderTextCases.test.ets|assert0069|assertEqual|expected', '短文案'));
      expect(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0003|ReminderTextCases.test.ets|assert0070|assertFalse|actual|expected=false', short.overflow())).assertFalse();
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
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0004|ReminderTextCases.test.ets|assert0071|assertEqual|actual', extractPlaceholders('共 {count} 条，最近 {time}').length)).assertEqual(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0004|ReminderTextCases.test.ets|assert0071|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0004|ReminderTextCases.test.ets|assert0072|assertEqual|actual', extractPlaceholders('共 {count} 条，最近 {time}')[1])).assertEqual(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0004|ReminderTextCases.test.ets|assert0072|assertEqual|expected', 'time'));
      expect(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0004|ReminderTextCases.test.ets|assert0073|assertEqual|actual', extractPlaceholders('无占位符').length)).assertEqual(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0004|ReminderTextCases.test.ets|assert0073|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0004|ReminderTextCases.test.ets|assert0074|assertEqual|actual', extractPlaceholders('{a}{a}{b}').length)).assertEqual(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0004|ReminderTextCases.test.ets|assert0074|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0004|ReminderTextCases.test.ets|assert0075|assertEqual|actual', extractPlaceholders('{未闭合').length)).assertEqual(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0004|ReminderTextCases.test.ets|assert0075|assertEqual|expected', 0));
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
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0005|ReminderTextCases.test.ets|assert0076|assertEqual|actual', TEMPLATES.length)).assertEqual(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0005|ReminderTextCases.test.ets|assert0076|assertEqual|expected', 7));
      expect(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0005|ReminderTextCases.test.ets|assert0077|assertEqual|actual', templateLines().length)).assertEqual(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0005|ReminderTextCases.test.ets|assert0077|assertEqual|expected', 7));
      const rendered: string = renderTemplate('historyCount',
        valuesOf([['count', '3'], ['time', '09:15']]));
      expect(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0005|ReminderTextCases.test.ets|assert0078|assertEqual|actual', rendered)).assertEqual(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0005|ReminderTextCases.test.ets|assert0078|assertEqual|expected', '共 3 条记录，最近一次在 09:15'));
      const partial: string = renderTemplate('exportSummary', valuesOf([['format', 'CSV']]));
      expect(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0005|ReminderTextCases.test.ets|assert0079|assertTrue|actual|expected=true', partial.indexOf('{rows}') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0005|ReminderTextCases.test.ets|assert0080|assertEqual|actual', valuesOf([['k']]).size)).assertEqual(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0005|ReminderTextCases.test.ets|assert0080|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0005|ReminderTextCases.test.ets|assert0081|assertEqual|actual', valuesOf([['k', 'v'], ['k2', 'v2']]).size)).assertEqual(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0005|ReminderTextCases.test.ets|assert0081|assertEqual|expected', 2));
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
      configureTestText();
      const template: TemplateEntry = templateOf('checkResult');
      expect(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0006|ReminderTextCases.test.ets|assert0082|assertEqual|actual', template.placeholders.length)).assertEqual(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0006|ReminderTextCases.test.ets|assert0082|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0006|ReminderTextCases.test.ets|assert0083|assertTrue|actual|expected=true', template.complete(valuesOf([['passed', '1'], ['warned', '2'], ['failed', '3']]))))
        .assertTrue();
      expect(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0006|ReminderTextCases.test.ets|assert0084|assertFalse|actual|expected=false', template.complete(valuesOf([['passed', '1']])))).assertFalse();
      const rendered: string = template.render(
        valuesOf([['passed', '20'], ['warned', '1'], ['failed', '0']]));
      expect(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0006|ReminderTextCases.test.ets|assert0085|assertEqual|actual', rendered)).assertEqual(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0006|ReminderTextCases.test.ets|assert0085|assertEqual|expected', '20 项通过，1 项提醒，0 项不通过'));
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
      configureTestText();
      const keys: MessageKey[] = [MessageKey.STATUS_ON, MessageKey.STATUS_OFF,
        MessageKey.STATUS_UNKNOWN, MessageKey.QUERY_FAILED, MessageKey.UNSUPPORTED];
      keys.forEach((key: MessageKey): void => {
        const entry: MessageEntry = messageOf(key);
        expect(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0007|ReminderTextCases.test.ets|assert0086|assertTrue|actual|expected=true', entry.text.length > 0)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0007|ReminderTextCases.test.ets|assert0087|assertFalse|actual|expected=false', entry.overflow())).assertFalse();
        expect(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0007|ReminderTextCases.test.ets|assert0088|assertTrue|actual|expected=true', entry.maxLength <= 64)).assertTrue();
      });
      expect(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0007|ReminderTextCases.test.ets|assert0089|assertEqual|actual', keys.length)).assertEqual(traceParameter('com.samples.appstartupauto_MessageCatalogCases_0007|ReminderTextCases.test.ets|assert0089|assertEqual|expected', 5));
    });
  });
}

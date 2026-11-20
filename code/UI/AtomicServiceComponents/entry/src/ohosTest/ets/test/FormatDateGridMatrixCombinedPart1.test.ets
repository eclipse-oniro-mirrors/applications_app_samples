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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { delayTick } from './shared/AsyncYield';
import { formatTime, formatDateTime, buildDownloadFileName, buildDownloadContent } from '../../../main/ets/utils/FormatUtil';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_AtomicService]';

export default function FormatDateGridMatrixCombinedPart1Test(): void {
  describe('FmtDate1', () => {
    /**
     * @tc.number    SUB_ATOMIC_FDGP1_0100
     * @tc.name      testDateGrid0001
     * @tc.desc      Verify date formatting for 1970-01-01 00:00:00. Plus Verify date formatting for 1999-12-31 23:59:59. Plus Verify date formatting for 2000-02-29 12:30:45. Plus Verify date formatting for 2001-01-01 01:02:03. Plus Verify date formatting for 2023-05-30 06:07:08. Plus Verify date formatting for 2024-02-29 23:00:01. Plus Verify date formatting for 2024-12-31 00:00:00. Plus Verify date formatting for 2025-03-01 09:08:07. Plus Verify date formatting for 2026-07-18 14:25:36. Plus Verify date formatting for 2030-10-10 22:03:04. Plus Verify date formatting for 2100-01-01 11:12:13. Plus Verify date formatting for 2024-04-01 00:00:00. Plus Verify date formatting for 2024-04-15 06:30:00. Plus Verify date formatting for 2024-04-30 18:15:00. Plus Verify date formatting for 2025-08-05 00:01:02. Plus Verify date formatting for 2025-08-05 05:10:20. Plus Verify date formatting for 2025-08-05 12:34:56. Plus Verify date formatting for 2025-08-05 23:59:58. Plus Verify download content timestamp for 2026-01-02 03:04:05. Plus Verify download content timestamp for 2026-12-31 23:59:59. Plus Verify download content timestamp for 2024-02-29 00:00:00.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0001 begin');
      await delayTick();
      const date: Date = new Date(1970, 0, 1, 0, 0, 0);
      expect(formatTime(date)).assertEqual('00:00:00');
      expect(formatDateTime(date)).assertEqual('1970-01-01 00:00:00');
      expect(buildDownloadFileName(date)).assertEqual('atomic-service-demo-19700101-000000.txt');
      {
      const date: Date = new Date(1999, 11, 31, 23, 59, 59);
      expect(formatTime(date)).assertEqual('23:59:59');
      expect(formatDateTime(date)).assertEqual('1999-12-31 23:59:59');
      expect(buildDownloadFileName(date)).assertEqual('atomic-service-demo-19991231-235959.txt');
      }
      {
      const date: Date = new Date(2000, 1, 29, 12, 30, 45);
      expect(formatTime(date)).assertEqual('12:30:45');
      expect(formatDateTime(date)).assertEqual('2000-02-29 12:30:45');
      expect(buildDownloadFileName(date)).assertEqual('atomic-service-demo-20000229-123045.txt');
      }
      {
      const date: Date = new Date(2001, 0, 1, 1, 2, 3);
      expect(formatTime(date)).assertEqual('01:02:03');
      expect(formatDateTime(date)).assertEqual('2001-01-01 01:02:03');
      expect(buildDownloadFileName(date)).assertEqual('atomic-service-demo-20010101-010203.txt');
      }
      {
      const date: Date = new Date(2023, 4, 30, 6, 7, 8);
      expect(formatTime(date)).assertEqual('06:07:08');
      expect(formatDateTime(date)).assertEqual('2023-05-30 06:07:08');
      expect(buildDownloadFileName(date)).assertEqual('atomic-service-demo-20230530-060708.txt');
      }
      {
      const date: Date = new Date(2024, 1, 29, 23, 0, 1);
      expect(formatTime(date)).assertEqual('23:00:01');
      expect(formatDateTime(date)).assertEqual('2024-02-29 23:00:01');
      expect(buildDownloadFileName(date)).assertEqual('atomic-service-demo-20240229-230001.txt');
      }
      {
      const date: Date = new Date(2024, 11, 31, 0, 0, 0);
      expect(formatTime(date)).assertEqual('00:00:00');
      expect(formatDateTime(date)).assertEqual('2024-12-31 00:00:00');
      expect(buildDownloadFileName(date)).assertEqual('atomic-service-demo-20241231-000000.txt');
      }
      {
      const date: Date = new Date(2025, 2, 1, 9, 8, 7);
      expect(formatTime(date)).assertEqual('09:08:07');
      expect(formatDateTime(date)).assertEqual('2025-03-01 09:08:07');
      expect(buildDownloadFileName(date)).assertEqual('atomic-service-demo-20250301-090807.txt');
      }
      {
      const date: Date = new Date(2026, 6, 18, 14, 25, 36);
      expect(formatTime(date)).assertEqual('14:25:36');
      expect(formatDateTime(date)).assertEqual('2026-07-18 14:25:36');
      expect(buildDownloadFileName(date)).assertEqual('atomic-service-demo-20260718-142536.txt');
      }
      {
      const date: Date = new Date(2030, 9, 10, 22, 3, 4);
      expect(formatTime(date)).assertEqual('22:03:04');
      expect(formatDateTime(date)).assertEqual('2030-10-10 22:03:04');
      expect(buildDownloadFileName(date)).assertEqual('atomic-service-demo-20301010-220304.txt');
      }
      {
      const date: Date = new Date(2100, 0, 1, 11, 12, 13);
      expect(formatTime(date)).assertEqual('11:12:13');
      expect(formatDateTime(date)).assertEqual('2100-01-01 11:12:13');
      expect(buildDownloadFileName(date)).assertEqual('atomic-service-demo-21000101-111213.txt');
      }
      {
      const date: Date = new Date(2024, 3, 1, 0, 0, 0);
      expect(formatTime(date)).assertEqual('00:00:00');
      expect(formatDateTime(date)).assertEqual('2024-04-01 00:00:00');
      expect(buildDownloadFileName(date)).assertEqual('atomic-service-demo-20240401-000000.txt');
      }
      {
      const date: Date = new Date(2024, 3, 15, 6, 30, 0);
      expect(formatTime(date)).assertEqual('06:30:00');
      expect(formatDateTime(date)).assertEqual('2024-04-15 06:30:00');
      expect(buildDownloadFileName(date)).assertEqual('atomic-service-demo-20240415-063000.txt');
      }
      {
      const date: Date = new Date(2024, 3, 30, 18, 15, 0);
      expect(formatTime(date)).assertEqual('18:15:00');
      expect(formatDateTime(date)).assertEqual('2024-04-30 18:15:00');
      expect(buildDownloadFileName(date)).assertEqual('atomic-service-demo-20240430-181500.txt');
      }
      {
      const date: Date = new Date(2025, 7, 5, 0, 1, 2);
      expect(formatTime(date)).assertEqual('00:01:02');
      expect(formatDateTime(date)).assertEqual('2025-08-05 00:01:02');
      expect(buildDownloadFileName(date)).assertEqual('atomic-service-demo-20250805-000102.txt');
      }
      {
      const date: Date = new Date(2025, 7, 5, 5, 10, 20);
      expect(formatTime(date)).assertEqual('05:10:20');
      expect(formatDateTime(date)).assertEqual('2025-08-05 05:10:20');
      expect(buildDownloadFileName(date)).assertEqual('atomic-service-demo-20250805-051020.txt');
      }
      {
      const date: Date = new Date(2025, 7, 5, 12, 34, 56);
      expect(formatTime(date)).assertEqual('12:34:56');
      expect(formatDateTime(date)).assertEqual('2025-08-05 12:34:56');
      expect(buildDownloadFileName(date)).assertEqual('atomic-service-demo-20250805-123456.txt');
      }
      {
      const date: Date = new Date(2025, 7, 5, 23, 59, 58);
      expect(formatTime(date)).assertEqual('23:59:58');
      expect(formatDateTime(date)).assertEqual('2025-08-05 23:59:58');
      expect(buildDownloadFileName(date)).assertEqual('atomic-service-demo-20250805-235958.txt');
      }
      {
      const date: Date = new Date(2026, 0, 2, 3, 4, 5);
      const content: string = buildDownloadContent(date);
      const lines: string[] = content.split('\n');
      expect(lines.length).assertEqual(4);
      expect(lines[0]).assertEqual('AtomicServiceComponents sample download file');
      expect(lines[1]).assertEqual('Generated at: 2026-01-02 03:04:05');
      expect(lines[2]).assertEqual('Component: DownloadFileButton');
      expect(lines[3]).assertEqual('Note: This file is saved by DocumentViewPicker; if the picker is unavailable it falls back to the app sandbox.');
      }
      {
      const date: Date = new Date(2026, 11, 31, 23, 59, 59);
      const content: string = buildDownloadContent(date);
      const lines: string[] = content.split('\n');
      expect(lines.length).assertEqual(4);
      expect(lines[0]).assertEqual('AtomicServiceComponents sample download file');
      expect(lines[1]).assertEqual('Generated at: 2026-12-31 23:59:59');
      expect(lines[2]).assertEqual('Component: DownloadFileButton');
      expect(lines[3]).assertEqual('Note: This file is saved by DocumentViewPicker; if the picker is unavailable it falls back to the app sandbox.');
      }
      {
      const date: Date = new Date(2024, 1, 29, 0, 0, 0);
      const content: string = buildDownloadContent(date);
      const lines: string[] = content.split('\n');
      expect(lines.length).assertEqual(4);
      expect(lines[0]).assertEqual('AtomicServiceComponents sample download file');
      expect(lines[1]).assertEqual('Generated at: 2024-02-29 00:00:00');
      expect(lines[2]).assertEqual('Component: DownloadFileButton');
      expect(lines[3]).assertEqual('Note: This file is saved by DocumentViewPicker; if the picker is unavailable it falls back to the app sandbox.');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0001 end');
    })

  })
}

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
import { QueryOutcome, QueryRecord, RefreshSource, parseRefreshSource } from '../../../main/ets/autostart/AutoStartupTypes';
import { normalizeRecord, parseHistory, serializeHistory } from '../../../main/ets/autostart/AutoStartupHistory';
import { ArchiveDocument, ArchivedQuery, decodeArchive, encodeArchive } from '../../../main/ets/autostart/archive/StartupArchive';
import { RevisitTracker } from '../../../main/ets/autostart/revisit/RevisitTracker';

const NOW: number = 1700000000000;
const LEGACY: string[] = ['首次进入', '手动刷新', '返回前台', '设置后查询'];
const SOURCES: RefreshSource[] = [RefreshSource.INITIAL, RefreshSource.MANUAL,
  RefreshSource.FOREGROUND, RefreshSource.SETTINGS];

function legacyRecord(source: string): QueryRecord {
  const record = new QueryRecord();
  record.id = 1;
  record.timestamp = NOW;
  record.source = source as RefreshSource;
  record.result = '已开启';
  record.supportResult = 'true';
  record.statusResult = 'true';
  record.outcome = QueryOutcome.SUCCESS;
  return record;
}

export default function refreshSourceCompatibilityTests(): void {
  configureTestText();
  describe('RefreshSourceCompatibility', (): void => {
    /** @tc.number SUB_STARTUP_REFRESH_SOURCE_0100
     * @tc.name testRefreshSourceCompatibility0001
     * @tc.desc Accept all historical sources and retain stable English source IDs. */
    it('testRefreshSourceCompatibility0001', 0, (): void => {
      configureTestText();
      LEGACY.forEach((value: string, index: number): void => {
        expect(traceParameter('com.samples.appstartupauto_RefreshSourceCompatibility_0001|RefreshSourceCompatibility.test.ets|assert0001|assertEqual|actual', parseRefreshSource(value))).assertEqual(traceParameter('com.samples.appstartupauto_RefreshSourceCompatibility_0001|RefreshSourceCompatibility.test.ets|assert0001|assertEqual|expected', SOURCES[index]));
        expect(traceParameter('com.samples.appstartupauto_RefreshSourceCompatibility_0001|RefreshSourceCompatibility.test.ets|assert0002|assertEqual|actual', parseRefreshSource(SOURCES[index]))).assertEqual(traceParameter('com.samples.appstartupauto_RefreshSourceCompatibility_0001|RefreshSourceCompatibility.test.ets|assert0002|assertEqual|expected', SOURCES[index]));
        expect(traceParameter('com.samples.appstartupauto_RefreshSourceCompatibility_0001|RefreshSourceCompatibility.test.ets|assert0003|assertEqual|actual', normalizeRecord(legacyRecord(value))?.source)).assertEqual(traceParameter('com.samples.appstartupauto_RefreshSourceCompatibility_0001|RefreshSourceCompatibility.test.ets|assert0003|assertEqual|expected', SOURCES[index]));
      });
      expect(traceParameter('com.samples.appstartupauto_RefreshSourceCompatibility_0001|RefreshSourceCompatibility.test.ets|assert0004|assertTrue|actual|expected=true', parseRefreshSource('invalid') === undefined)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RefreshSourceCompatibility_0001|RefreshSourceCompatibility.test.ets|assert0005|assertTrue|actual|expected=true', normalizeRecord(legacyRecord('invalid')) === undefined)).assertTrue();
    });

    /** @tc.number SUB_STARTUP_REFRESH_SOURCE_0200
     * @tc.name testRefreshSourceCompatibility0002
     * @tc.desc Read legacy arrays and schema-1 histories; new writes use stable IDs. */
    it('testRefreshSourceCompatibility0002', 0, (): void => {
      configureTestText();
      LEGACY.forEach((value: string, index: number): void => {
        const legacy = legacyRecord(value);
        const array = parseHistory(JSON.stringify([legacy]), NOW);
        const schema = parseHistory(JSON.stringify({ schema: 1, savedAt: NOW, records: [legacy] }), NOW);
        expect(traceParameter('com.samples.appstartupauto_RefreshSourceCompatibility_0002|RefreshSourceCompatibility.test.ets|assert0006|assertEqual|actual', array.records.length)).assertEqual(traceParameter('com.samples.appstartupauto_RefreshSourceCompatibility_0002|RefreshSourceCompatibility.test.ets|assert0006|assertEqual|expected', 1));
        expect(traceParameter('com.samples.appstartupauto_RefreshSourceCompatibility_0002|RefreshSourceCompatibility.test.ets|assert0007|assertEqual|actual', schema.records.length)).assertEqual(traceParameter('com.samples.appstartupauto_RefreshSourceCompatibility_0002|RefreshSourceCompatibility.test.ets|assert0007|assertEqual|expected', 1));
        expect(traceParameter('com.samples.appstartupauto_RefreshSourceCompatibility_0002|RefreshSourceCompatibility.test.ets|assert0008|assertEqual|actual', array.records[0].source)).assertEqual(traceParameter('com.samples.appstartupauto_RefreshSourceCompatibility_0002|RefreshSourceCompatibility.test.ets|assert0008|assertEqual|expected', SOURCES[index]));
        expect(traceParameter('com.samples.appstartupauto_RefreshSourceCompatibility_0002|RefreshSourceCompatibility.test.ets|assert0009|assertEqual|actual', schema.records[0].source)).assertEqual(traceParameter('com.samples.appstartupauto_RefreshSourceCompatibility_0002|RefreshSourceCompatibility.test.ets|assert0009|assertEqual|expected', SOURCES[index]));
        const encoded = serializeHistory([legacy], NOW);
        expect(traceParameter('com.samples.appstartupauto_RefreshSourceCompatibility_0002|RefreshSourceCompatibility.test.ets|assert0010|assertTrue|actual|expected=true', encoded.includes(`"source":"${SOURCES[index]}"`))).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_RefreshSourceCompatibility_0002|RefreshSourceCompatibility.test.ets|assert0011|assertFalse|actual|expected=false', encoded.includes(value))).assertFalse();
      });
    });

    /** @tc.number SUB_STARTUP_REFRESH_SOURCE_0300
     * @tc.name testRefreshSourceCompatibility0003
     * @tc.desc Normalize historical RDB document payloads without changing IDs or schema. */
    it('testRefreshSourceCompatibility0003', 0, (): void => {
      configureTestText();
      LEGACY.forEach((value: string, index: number): void => {
        const document = new ArchiveDocument();
        document.revision = 7;
        document.nextId = 2;
        document.operationId = 'legacy-source';
        document.rows = [new ArchivedQuery(1, legacyRecord(value), NOW)];
        const restored = decodeArchive(JSON.stringify(document));
        expect(traceParameter('com.samples.appstartupauto_RefreshSourceCompatibility_0003|RefreshSourceCompatibility.test.ets|assert0012|assertEqual|actual', restored.schema)).assertEqual(traceParameter('com.samples.appstartupauto_RefreshSourceCompatibility_0003|RefreshSourceCompatibility.test.ets|assert0012|assertEqual|expected', 1));
        expect(traceParameter('com.samples.appstartupauto_RefreshSourceCompatibility_0003|RefreshSourceCompatibility.test.ets|assert0013|assertEqual|actual', restored.revision)).assertEqual(traceParameter('com.samples.appstartupauto_RefreshSourceCompatibility_0003|RefreshSourceCompatibility.test.ets|assert0013|assertEqual|expected', 7));
        expect(traceParameter('com.samples.appstartupauto_RefreshSourceCompatibility_0003|RefreshSourceCompatibility.test.ets|assert0014|assertEqual|actual', restored.rows[0].archiveId)).assertEqual(traceParameter('com.samples.appstartupauto_RefreshSourceCompatibility_0003|RefreshSourceCompatibility.test.ets|assert0014|assertEqual|expected', 1));
        expect(traceParameter('com.samples.appstartupauto_RefreshSourceCompatibility_0003|RefreshSourceCompatibility.test.ets|assert0015|assertEqual|actual', restored.rows[0].record.source)).assertEqual(traceParameter('com.samples.appstartupauto_RefreshSourceCompatibility_0003|RefreshSourceCompatibility.test.ets|assert0015|assertEqual|expected', SOURCES[index]));
        expect(traceParameter('com.samples.appstartupauto_RefreshSourceCompatibility_0003|RefreshSourceCompatibility.test.ets|assert0016|assertFalse|actual|expected=false', encodeArchive(restored).includes(value))).assertFalse();
      });
    });

    /** @tc.number SUB_STARTUP_REFRESH_SOURCE_0400
     * @tc.name testRefreshSourceCompatibility0004
     * @tc.desc Restore nested revisit evidence with a historical source value. */
    it('testRefreshSourceCompatibility0004', 0, (): void => {
      configureTestText();
      LEGACY.forEach((value: string, index: number): void => {
        const original = new RevisitTracker();
        original.begin(legacyRecord(value), 2, NOW);
        const restored = new RevisitTracker();
        restored.restore(original.serialize(), NOW);
        expect(traceParameter('com.samples.appstartupauto_RefreshSourceCompatibility_0004|RefreshSourceCompatibility.test.ets|assert0017|assertEqual|actual', restored.snapshot().before?.source)).assertEqual(traceParameter('com.samples.appstartupauto_RefreshSourceCompatibility_0004|RefreshSourceCompatibility.test.ets|assert0017|assertEqual|expected', SOURCES[index]));
        expect(traceParameter('com.samples.appstartupauto_RefreshSourceCompatibility_0004|RefreshSourceCompatibility.test.ets|assert0018|assertEqual|actual', restored.snapshot().sessionId)).assertEqual(traceParameter('com.samples.appstartupauto_RefreshSourceCompatibility_0004|RefreshSourceCompatibility.test.ets|assert0018|assertEqual|expected', original.snapshot().sessionId));
        expect(traceParameter('com.samples.appstartupauto_RefreshSourceCompatibility_0004|RefreshSourceCompatibility.test.ets|assert0019|assertFalse|actual|expected=false', restored.serialize().includes(`"source":"${value}"`))).assertFalse();
      });
    });
  });
}

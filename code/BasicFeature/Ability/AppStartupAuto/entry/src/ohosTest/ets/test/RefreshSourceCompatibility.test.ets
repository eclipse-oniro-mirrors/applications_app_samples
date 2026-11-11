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
import { loggedIt as it } from '../support/TestLog';
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
  describe('RefreshSourceCompatibility', (): void => {
    /** @tc.number SUB_STARTUP_REFRESH_SOURCE_0100
     * @tc.name testRefreshSourceCompatibility0001
     * @tc.desc Accept all historical sources and retain stable English source IDs. */
    it('testRefreshSourceCompatibility0001', 0, (): void => {
      LEGACY.forEach((value: string, index: number): void => {
        expect(parseRefreshSource(value)).assertEqual(SOURCES[index]);
        expect(parseRefreshSource(SOURCES[index])).assertEqual(SOURCES[index]);
        expect(normalizeRecord(legacyRecord(value))?.source).assertEqual(SOURCES[index]);
      });
      expect(parseRefreshSource('invalid') === undefined).assertTrue();
      expect(normalizeRecord(legacyRecord('invalid')) === undefined).assertTrue();
    });

    /** @tc.number SUB_STARTUP_REFRESH_SOURCE_0200
     * @tc.name testRefreshSourceCompatibility0002
     * @tc.desc Read legacy arrays and schema-1 histories; new writes use stable IDs. */
    it('testRefreshSourceCompatibility0002', 0, (): void => {
      LEGACY.forEach((value: string, index: number): void => {
        const legacy = legacyRecord(value);
        const array = parseHistory(JSON.stringify([legacy]), NOW);
        const schema = parseHistory(JSON.stringify({ schema: 1, savedAt: NOW, records: [legacy] }), NOW);
        expect(array.records.length).assertEqual(1);
        expect(schema.records.length).assertEqual(1);
        expect(array.records[0].source).assertEqual(SOURCES[index]);
        expect(schema.records[0].source).assertEqual(SOURCES[index]);
        const encoded = serializeHistory([legacy], NOW);
        expect(encoded.includes(`"source":"${SOURCES[index]}"`)).assertTrue();
        expect(encoded.includes(value)).assertFalse();
      });
    });

    /** @tc.number SUB_STARTUP_REFRESH_SOURCE_0300
     * @tc.name testRefreshSourceCompatibility0003
     * @tc.desc Normalize historical RDB document payloads without changing IDs or schema. */
    it('testRefreshSourceCompatibility0003', 0, (): void => {
      LEGACY.forEach((value: string, index: number): void => {
        const document = new ArchiveDocument();
        document.revision = 7;
        document.nextId = 2;
        document.operationId = 'legacy-source';
        document.rows = [new ArchivedQuery(1, legacyRecord(value), NOW)];
        const restored = decodeArchive(JSON.stringify(document));
        expect(restored.schema).assertEqual(1);
        expect(restored.revision).assertEqual(7);
        expect(restored.rows[0].archiveId).assertEqual(1);
        expect(restored.rows[0].record.source).assertEqual(SOURCES[index]);
        expect(encodeArchive(restored).includes(value)).assertFalse();
      });
    });

    /** @tc.number SUB_STARTUP_REFRESH_SOURCE_0400
     * @tc.name testRefreshSourceCompatibility0004
     * @tc.desc Restore nested revisit evidence with a historical source value. */
    it('testRefreshSourceCompatibility0004', 0, (): void => {
      LEGACY.forEach((value: string, index: number): void => {
        const original = new RevisitTracker();
        original.begin(legacyRecord(value), 2, NOW);
        const restored = new RevisitTracker();
        restored.restore(original.serialize(), NOW);
        expect(restored.snapshot().before?.source).assertEqual(SOURCES[index]);
        expect(restored.snapshot().sessionId).assertEqual(original.snapshot().sessionId);
        expect(restored.serialize().includes(`"source":"${value}"`)).assertFalse();
      });
    });
  });
}

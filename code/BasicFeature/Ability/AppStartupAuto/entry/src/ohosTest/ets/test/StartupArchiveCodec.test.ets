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
import {
  ArchiveDocument, ArchivedQuery, ARCHIVE_MAX_BYTES, ARCHIVE_MAX_ENTRIES,
  archiveRecord, archiveUtf8Bytes, decodeArchive, encodeArchive
} from '../../../main/ets/autostart/archive/StartupArchive';
import { QueryOutcome, RefreshSource } from '../../../main/ets/autostart/AutoStartupTypes';
import { archiveFailureCode, archiveSample } from '../support/StartupArchiveSupport';

function codecDocument(): ArchiveDocument {
  const document = new ArchiveDocument(); document.revision = 4; document.nextId = 8;
  document.operationId = 'codec-save';
  const record = archiveSample(91, 1700000000000, QueryOutcome.FAILURE, '查询失败', RefreshSource.SETTINGS);
  record.errorCode = '16000050'; record.statusResult = '16000050';
  document.rows.push(new ArchivedQuery(7, record, 1700000000003));
  return document;
}

export default function startupArchiveCodecTests(): void {
  configureTestText();
  describe('StartupArchiveCodec', (): void => {
    /**
     * @tc.number SUB_STARTUP_ARCHIVECODEC_0100
     * @tc.name testStartupArchiveCodecWaveThree0001
     * @tc.desc 长期证据去掉原始错误说明但保留正式查询字段与原记录
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveCodecWaveThree0001', 0, (): void => {
      configureTestText();
      const source = archiveSample(17, 1700000000000, QueryOutcome.FAILURE, '查询失败');
      source.errorCode = '16000050'; source.errorMessage = 'private user@example.com';
      const saved = archiveRecord(source);
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0001|StartupArchiveCodec.test.ets|assert0001|assertEqual|actual', saved.errorMessage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0001|StartupArchiveCodec.test.ets|assert0001|assertEqual|expected', ''));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0001|StartupArchiveCodec.test.ets|assert0002|assertEqual|actual', saved.errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0001|StartupArchiveCodec.test.ets|assert0002|assertEqual|expected', '16000050'));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0001|StartupArchiveCodec.test.ets|assert0003|assertEqual|actual', saved.outcome)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0001|StartupArchiveCodec.test.ets|assert0003|assertEqual|expected', QueryOutcome.FAILURE));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0001|StartupArchiveCodec.test.ets|assert0004|assertEqual|actual', source.errorMessage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0001|StartupArchiveCodec.test.ets|assert0004|assertEqual|expected', 'private user@example.com'));
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVECODEC_0200
     * @tc.name testStartupArchiveCodecWaveThree0002
     * @tc.desc 持久化往返保留归档编号与原查询编号并恢复可用实例
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveCodecWaveThree0002', 0, (): void => {
      configureTestText();
      const decoded = decodeArchive(encodeArchive(codecDocument()));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0002|StartupArchiveCodec.test.ets|assert0005|assertEqual|actual', decoded.rows[0].archiveId)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0002|StartupArchiveCodec.test.ets|assert0005|assertEqual|expected', 7));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0002|StartupArchiveCodec.test.ets|assert0006|assertEqual|actual', decoded.rows[0].record.id)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0002|StartupArchiveCodec.test.ets|assert0006|assertEqual|expected', 91));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0002|StartupArchiveCodec.test.ets|assert0007|assertEqual|actual', decoded.rows[0].viewRecord().id)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0002|StartupArchiveCodec.test.ets|assert0007|assertEqual|expected', 7));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0002|StartupArchiveCodec.test.ets|assert0008|assertEqual|actual', decoded.rows[0].record.source)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0002|StartupArchiveCodec.test.ets|assert0008|assertEqual|expected', RefreshSource.SETTINGS));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0002|StartupArchiveCodec.test.ets|assert0009|assertEqual|actual', decoded.revision)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0002|StartupArchiveCodec.test.ets|assert0009|assertEqual|expected', 4));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0002|StartupArchiveCodec.test.ets|assert0010|assertEqual|actual', decoded.operationId)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0002|StartupArchiveCodec.test.ets|assert0010|assertEqual|expected', 'codec-save'));
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVECODEC_0300
     * @tc.name testStartupArchiveCodecWaveThree0003
     * @tc.desc 修改解码后的副本和展示记录不污染已解码证据
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveCodecWaveThree0003', 0, (): void => {
      configureTestText();
      const document = decodeArchive(encodeArchive(codecDocument()));
      const clone = document.clone(); clone.rows[0].record.result = 'changed'; clone.rows = [];
      const display = document.rows[0].viewRecord(); display.errorCode = 'changed';
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0003|StartupArchiveCodec.test.ets|assert0011|assertEqual|actual', document.rows[0].record.result)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0003|StartupArchiveCodec.test.ets|assert0011|assertEqual|expected', '查询失败'));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0003|StartupArchiveCodec.test.ets|assert0012|assertEqual|actual', document.rows[0].record.errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0003|StartupArchiveCodec.test.ets|assert0012|assertEqual|expected', '16000050'));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0003|StartupArchiveCodec.test.ets|assert0013|assertEqual|actual', document.rows[0].record.id)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0003|StartupArchiveCodec.test.ets|assert0013|assertEqual|expected', 91));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0003|StartupArchiveCodec.test.ets|assert0014|assertEqual|actual', document.rows[0].savedAt)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0003|StartupArchiveCodec.test.ets|assert0014|assertEqual|expected', 1700000000003));
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVECODEC_0400
     * @tc.name testStartupArchiveCodecWaveThree0004
     * @tc.desc 无效JSON与空载荷和数组不会被当作可写空归档
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveCodecWaveThree0004', 0, (): void => {
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0004|StartupArchiveCodec.test.ets|assert0015|assertEqual|actual', archiveFailureCode((): void => {
        decodeArchive('{broken');
      }))).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0004|StartupArchiveCodec.test.ets|assert0015|assertEqual|expected', 'INVALID'));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0004|StartupArchiveCodec.test.ets|assert0016|assertEqual|actual', archiveFailureCode((): void => {
        decodeArchive('null');
      }))).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0004|StartupArchiveCodec.test.ets|assert0016|assertEqual|expected', 'INVALID'));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0004|StartupArchiveCodec.test.ets|assert0017|assertEqual|actual', archiveFailureCode((): void => {
        decodeArchive('[]');
      }))).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0004|StartupArchiveCodec.test.ets|assert0017|assertEqual|expected', 'SCHEMA'));
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVECODEC_0500
     * @tc.name testStartupArchiveCodecWaveThree0005
     * @tc.desc 未支持版本和缺少元数据的文档必须拒绝而不是迁移覆盖
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveCodecWaveThree0005', 0, (): void => {
      configureTestText();
      const future = codecDocument(); future.schema = 2;
      const obsolete = codecDocument(); obsolete.schema = 0;
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0005|StartupArchiveCodec.test.ets|assert0018|assertEqual|actual', archiveFailureCode((): void => {
        encodeArchive(future);
      }))).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0005|StartupArchiveCodec.test.ets|assert0018|assertEqual|expected', 'SCHEMA'));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0005|StartupArchiveCodec.test.ets|assert0019|assertEqual|actual', archiveFailureCode((): void => {
        encodeArchive(obsolete);
      }))).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0005|StartupArchiveCodec.test.ets|assert0019|assertEqual|expected', 'SCHEMA'));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0005|StartupArchiveCodec.test.ets|assert0020|assertEqual|actual', archiveFailureCode((): void => {
        decodeArchive('{"schema":1}');
      }))).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0005|StartupArchiveCodec.test.ets|assert0020|assertEqual|expected', 'INVALID'));
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVECODEC_0600
     * @tc.name testStartupArchiveCodecWaveThree0006
     * @tc.desc 重复归档主键和重复证据及倒退分配序号不能写入
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveCodecWaveThree0006', 0, (): void => {
      configureTestText();
      const duplicateId = codecDocument();
      duplicateId.rows.push(new ArchivedQuery(7, archiveSample(92, 1700000000001), 1700000000004));
      const duplicateEvidence = codecDocument(); duplicateEvidence.nextId = 9;
      duplicateEvidence.rows.push(new ArchivedQuery(8, duplicateEvidence.rows[0].record.clone(), 1700000000004));
      const sequence = codecDocument(); sequence.nextId = 7;
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0006|StartupArchiveCodec.test.ets|assert0021|assertEqual|actual', archiveFailureCode((): void => {
        encodeArchive(duplicateId);
      }))).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0006|StartupArchiveCodec.test.ets|assert0021|assertEqual|expected', 'INVALID'));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0006|StartupArchiveCodec.test.ets|assert0022|assertEqual|actual', archiveFailureCode((): void => {
        encodeArchive(duplicateEvidence);
      }))).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0006|StartupArchiveCodec.test.ets|assert0022|assertEqual|expected', 'INVALID'));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0006|StartupArchiveCodec.test.ets|assert0023|assertEqual|actual', archiveFailureCode((): void => {
        encodeArchive(sequence);
      }))).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0006|StartupArchiveCodec.test.ets|assert0023|assertEqual|expected', 'INVALID'));
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVECODEC_0700
     * @tc.name testStartupArchiveCodecWaveThree0007
     * @tc.desc 含私密原始说明和非法来源或无采样时间的存档不能恢复
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveCodecWaveThree0007', 0, (): void => {
      configureTestText();
      const privateData = codecDocument(); privateData.rows[0].record.errorMessage = 'raw private error';
      const badSource = codecDocument(); badSource.rows[0].record.source = 'invalid' as RefreshSource;
      const unknownTime = codecDocument(); unknownTime.rows[0].record.timestamp = 0;
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0007|StartupArchiveCodec.test.ets|assert0024|assertEqual|actual', archiveFailureCode((): void => {
        encodeArchive(privateData);
      }))).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0007|StartupArchiveCodec.test.ets|assert0024|assertEqual|expected', 'PRIVACY'));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0007|StartupArchiveCodec.test.ets|assert0025|assertEqual|actual', archiveFailureCode((): void => {
        encodeArchive(badSource);
      }))).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0007|StartupArchiveCodec.test.ets|assert0025|assertEqual|expected', 'INVALID'));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0007|StartupArchiveCodec.test.ets|assert0026|assertEqual|actual', archiveFailureCode((): void => {
        encodeArchive(unknownTime);
      }))).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0007|StartupArchiveCodec.test.ets|assert0026|assertEqual|expected', 'INVALID'));
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVECODEC_0800
     * @tc.name testStartupArchiveCodecWaveThree0008
     * @tc.desc 字节预算按真实UTF8计算而不是UTF16字符数量
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveCodecWaveThree0008', 0, (): void => {
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0008|StartupArchiveCodec.test.ets|assert0027|assertEqual|actual', archiveUtf8Bytes('abc'))).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0008|StartupArchiveCodec.test.ets|assert0027|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0008|StartupArchiveCodec.test.ets|assert0028|assertEqual|actual', archiveUtf8Bytes('证据'))).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0008|StartupArchiveCodec.test.ets|assert0028|assertEqual|expected', 6));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0008|StartupArchiveCodec.test.ets|assert0029|assertEqual|actual', archiveUtf8Bytes('😀'))).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0008|StartupArchiveCodec.test.ets|assert0029|assertEqual|expected', 4));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0008|StartupArchiveCodec.test.ets|assert0030|assertEqual|actual', archiveUtf8Bytes('A证😀'))).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0008|StartupArchiveCodec.test.ets|assert0030|assertEqual|expected', 8));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0008|StartupArchiveCodec.test.ets|assert0031|assertEqual|actual', archiveUtf8Bytes('\uD800'))).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0008|StartupArchiveCodec.test.ets|assert0031|assertEqual|expected', 3));
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVECODEC_0900
     * @tc.name testStartupArchiveCodecWaveThree0009
     * @tc.desc 五百条完整归档可往返而多一条被容量守卫拒绝
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveCodecWaveThree0009', 0, (): void => {
      configureTestText();
      const document = new ArchiveDocument(); document.nextId = ARCHIVE_MAX_ENTRIES + 1;
      for (let index = 1; index <= ARCHIVE_MAX_ENTRIES; index++) {
        document.rows.push(new ArchivedQuery(index, archiveSample(index, 1700000000000 + index), 1700000001000));
      }
      const decoded = decodeArchive(encodeArchive(document));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0009|StartupArchiveCodec.test.ets|assert0032|assertEqual|actual', decoded.rows[0].record.timestamp)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0009|StartupArchiveCodec.test.ets|assert0032|assertEqual|expected', 1700000000001));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0009|StartupArchiveCodec.test.ets|assert0033|assertEqual|actual', decoded.rows[ARCHIVE_MAX_ENTRIES - 1].archiveId)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0009|StartupArchiveCodec.test.ets|assert0033|assertEqual|expected', ARCHIVE_MAX_ENTRIES));
      document.nextId++;
      document.rows.push(new ArchivedQuery(ARCHIVE_MAX_ENTRIES + 1, archiveSample(999, 1700000009999), 1700000010000));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0009|StartupArchiveCodec.test.ets|assert0034|assertEqual|actual', archiveFailureCode((): void => {
        encodeArchive(document);
      }))).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0009|StartupArchiveCodec.test.ets|assert0034|assertEqual|expected', 'CAPACITY'));
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVECODEC_1000
     * @tc.name testStartupArchiveCodecWaveThree0010
     * @tc.desc 编码和解码均限制实际字节载荷且不会一概拒绝合法小文档
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveCodecWaveThree0010', 0, (): void => {
      configureTestText();
      const document = new ArchiveDocument(); document.nextId = ARCHIVE_MAX_ENTRIES + 1;
      for (let index = 1; index <= ARCHIVE_MAX_ENTRIES; index++) {
        const record = archiveSample(index, 1700000000000 + index);
        record.result = '证'.repeat(200); record.supportResult = '据'.repeat(200);
        record.statusResult = '录'.repeat(200); record.errorCode = '码'.repeat(64);
        document.rows.push(new ArchivedQuery(index, record, 1700000001000));
      }
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0010|StartupArchiveCodec.test.ets|assert0035|assertEqual|actual', archiveFailureCode((): void => {
        encodeArchive(document);
      }))).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0010|StartupArchiveCodec.test.ets|assert0035|assertEqual|expected', 'CAPACITY'));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0010|StartupArchiveCodec.test.ets|assert0036|assertEqual|actual', archiveFailureCode((): void => {
        decodeArchive('证'.repeat(ARCHIVE_MAX_BYTES));
      }))).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0010|StartupArchiveCodec.test.ets|assert0036|assertEqual|expected', 'CAPACITY'));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0010|StartupArchiveCodec.test.ets|assert0037|assertEqual|actual', decodeArchive(encodeArchive(codecDocument())).rows[0].record.errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0010|StartupArchiveCodec.test.ets|assert0037|assertEqual|expected', '16000050'));
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVECODEC_1100
     * @tc.name testStartupArchiveCodecWaveThree0011
     * @tc.desc 不保存原始说明的去重键仍区分真实采样时间和结果
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveCodecWaveThree0011', 0, (): void => {
      configureTestText();
      const first = archiveSample(1, 1700000000000); first.errorMessage = 'first private';
      const repeated = first.clone(); repeated.errorMessage = 'second private';
      const later = first.clone(); later.timestamp++;
      const changed = first.clone(); changed.result = '未开启'; changed.statusResult = 'false';
      const saved = new ArchivedQuery(1, archiveRecord(first), 1700000001000);
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0011|StartupArchiveCodec.test.ets|assert0038|assertEqual|actual', saved.evidenceKey())).assertEqual(
        traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0011|StartupArchiveCodec.test.ets|assert0038|assertEqual|expected', new ArchivedQuery(2, archiveRecord(repeated), 1700000001001).evidenceKey()));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0011|StartupArchiveCodec.test.ets|assert0039|assertFalse|actual|expected=false', saved.evidenceKey() === new ArchivedQuery(3, archiveRecord(later), 1700000001002).evidenceKey()))
        .assertFalse();
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveCodecWaveThree_0011|StartupArchiveCodec.test.ets|assert0040|assertFalse|actual|expected=false', saved.evidenceKey() === new ArchivedQuery(4, archiveRecord(changed), 1700000001003).evidenceKey()))
        .assertFalse();
    });
  });
}

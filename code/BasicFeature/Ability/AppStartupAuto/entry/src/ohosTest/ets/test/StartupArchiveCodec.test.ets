import { describe, expect, it } from '@ohos/hypium';
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
      const source = archiveSample(17, 1700000000000, QueryOutcome.FAILURE, '查询失败');
      source.errorCode = '16000050'; source.errorMessage = 'private user@example.com';
      const saved = archiveRecord(source);
      expect(saved.errorMessage).assertEqual('');
      expect(saved.errorCode).assertEqual('16000050');
      expect(saved.outcome).assertEqual(QueryOutcome.FAILURE);
      expect(source.errorMessage).assertEqual('private user@example.com');
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
      const decoded = decodeArchive(encodeArchive(codecDocument()));
      expect(decoded.rows[0].archiveId).assertEqual(7);
      expect(decoded.rows[0].record.id).assertEqual(91);
      expect(decoded.rows[0].viewRecord().id).assertEqual(7);
      expect(decoded.rows[0].record.source).assertEqual(RefreshSource.SETTINGS);
      expect(decoded.revision).assertEqual(4);
      expect(decoded.operationId).assertEqual('codec-save');
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
      const document = decodeArchive(encodeArchive(codecDocument()));
      const clone = document.clone(); clone.rows[0].record.result = 'changed'; clone.rows = [];
      const display = document.rows[0].viewRecord(); display.errorCode = 'changed';
      expect(document.rows[0].record.result).assertEqual('查询失败');
      expect(document.rows[0].record.errorCode).assertEqual('16000050');
      expect(document.rows[0].record.id).assertEqual(91);
      expect(document.rows[0].savedAt).assertEqual(1700000000003);
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
      expect(archiveFailureCode((): void => {
        decodeArchive('{broken');
      })).assertEqual('INVALID');
      expect(archiveFailureCode((): void => {
        decodeArchive('null');
      })).assertEqual('INVALID');
      expect(archiveFailureCode((): void => {
        decodeArchive('[]');
      })).assertEqual('SCHEMA');
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
      const future = codecDocument(); future.schema = 2;
      const obsolete = codecDocument(); obsolete.schema = 0;
      expect(archiveFailureCode((): void => {
        encodeArchive(future);
      })).assertEqual('SCHEMA');
      expect(archiveFailureCode((): void => {
        encodeArchive(obsolete);
      })).assertEqual('SCHEMA');
      expect(archiveFailureCode((): void => {
        decodeArchive('{"schema":1}');
      })).assertEqual('INVALID');
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
      const duplicateId = codecDocument();
      duplicateId.rows.push(new ArchivedQuery(7, archiveSample(92, 1700000000001), 1700000000004));
      const duplicateEvidence = codecDocument(); duplicateEvidence.nextId = 9;
      duplicateEvidence.rows.push(new ArchivedQuery(8, duplicateEvidence.rows[0].record.clone(), 1700000000004));
      const sequence = codecDocument(); sequence.nextId = 7;
      expect(archiveFailureCode((): void => {
        encodeArchive(duplicateId);
      })).assertEqual('INVALID');
      expect(archiveFailureCode((): void => {
        encodeArchive(duplicateEvidence);
      })).assertEqual('INVALID');
      expect(archiveFailureCode((): void => {
        encodeArchive(sequence);
      })).assertEqual('INVALID');
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
      const privateData = codecDocument(); privateData.rows[0].record.errorMessage = 'raw private error';
      const badSource = codecDocument(); badSource.rows[0].record.source = 'invalid' as RefreshSource;
      const unknownTime = codecDocument(); unknownTime.rows[0].record.timestamp = 0;
      expect(archiveFailureCode((): void => {
        encodeArchive(privateData);
      })).assertEqual('PRIVACY');
      expect(archiveFailureCode((): void => {
        encodeArchive(badSource);
      })).assertEqual('INVALID');
      expect(archiveFailureCode((): void => {
        encodeArchive(unknownTime);
      })).assertEqual('INVALID');
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
      expect(archiveUtf8Bytes('abc')).assertEqual(3);
      expect(archiveUtf8Bytes('证据')).assertEqual(6);
      expect(archiveUtf8Bytes('😀')).assertEqual(4);
      expect(archiveUtf8Bytes('A证😀')).assertEqual(8);
      expect(archiveUtf8Bytes('\uD800')).assertEqual(3);
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
      const document = new ArchiveDocument(); document.nextId = ARCHIVE_MAX_ENTRIES + 1;
      for (let index = 1; index <= ARCHIVE_MAX_ENTRIES; index++) {
        document.rows.push(new ArchivedQuery(index, archiveSample(index, 1700000000000 + index), 1700000001000));
      }
      const decoded = decodeArchive(encodeArchive(document));
      expect(decoded.rows[0].record.timestamp).assertEqual(1700000000001);
      expect(decoded.rows[ARCHIVE_MAX_ENTRIES - 1].archiveId).assertEqual(ARCHIVE_MAX_ENTRIES);
      document.nextId++;
      document.rows.push(new ArchivedQuery(ARCHIVE_MAX_ENTRIES + 1, archiveSample(999, 1700000009999), 1700000010000));
      expect(archiveFailureCode((): void => {
        encodeArchive(document);
      })).assertEqual('CAPACITY');
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
      const document = new ArchiveDocument(); document.nextId = ARCHIVE_MAX_ENTRIES + 1;
      for (let index = 1; index <= ARCHIVE_MAX_ENTRIES; index++) {
        const record = archiveSample(index, 1700000000000 + index);
        record.result = '证'.repeat(200); record.supportResult = '据'.repeat(200);
        record.statusResult = '录'.repeat(200); record.errorCode = '码'.repeat(64);
        document.rows.push(new ArchivedQuery(index, record, 1700000001000));
      }
      expect(archiveFailureCode((): void => {
        encodeArchive(document);
      })).assertEqual('CAPACITY');
      expect(archiveFailureCode((): void => {
        decodeArchive('证'.repeat(ARCHIVE_MAX_BYTES));
      })).assertEqual('CAPACITY');
      expect(decodeArchive(encodeArchive(codecDocument())).rows[0].record.errorCode).assertEqual('16000050');
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
      const first = archiveSample(1, 1700000000000); first.errorMessage = 'first private';
      const repeated = first.clone(); repeated.errorMessage = 'second private';
      const later = first.clone(); later.timestamp++;
      const changed = first.clone(); changed.result = '未开启'; changed.statusResult = 'false';
      const saved = new ArchivedQuery(1, archiveRecord(first), 1700000001000);
      expect(saved.evidenceKey()).assertEqual(
        new ArchivedQuery(2, archiveRecord(repeated), 1700000001001).evidenceKey());
      expect(saved.evidenceKey() === new ArchivedQuery(3, archiveRecord(later), 1700000001002).evidenceKey())
        .assertFalse();
      expect(saved.evidenceKey() === new ArchivedQuery(4, archiveRecord(changed), 1700000001003).evidenceKey())
        .assertFalse();
    });
  });
}

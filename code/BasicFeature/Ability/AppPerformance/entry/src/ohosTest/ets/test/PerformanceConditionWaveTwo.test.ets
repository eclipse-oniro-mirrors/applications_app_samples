import { describe, expect, it } from '@ohos/hypium';
import { ExperimentRecord } from '../../../main/ets/core/ExperimentLedger';
import { ConditionSource, ConditionVerdict, compareConditions, fieldsOfRecord, fingerprintOf,
  missingFieldsOf } from '../../../main/ets/core/report/ConditionFingerprint';
import { ReportFormat, ReportMeta, exportReport } from '../../../main/ets/core/report/ReportExport';
import { waveRecord } from '../support/PerformanceWaveOneFixtures';

/** Persisted tuple input only; production code parses and hashes it. */
function tupleRecord(id: string, mode: string, files: string[], modules: string[],
  targets: string[]): ExperimentRecord {
  const record = waveRecord(id);
  record.mode = mode;
  record.condition = JSON.stringify(['fixture-board · fixture-os', '1.0.fixture', true,
    record.workloadId, record.asset, files, modules, targets]);
  return record;
}

export default function performanceConditionWaveTwoTests(): void {
  describe('PerformanceConditionWaveTwo', (): void => {
    /**
     * @tc.number SUB_PERFORMANCE_CONDITIONWAVETWO_0100
     * @tc.name testPerformanceConditionWaveTwo0001
     * @tc.desc 损坏或非数组条件不制造环境，显式来源仍能补齐且保留资源事实
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceConditionWaveTwo0001', 0, (): void => {
      const broken = waveRecord('broken'); broken.condition = '{bad-json';
      const absent = fieldsOfRecord(broken);
      expect(missingFieldsOf(absent).join('|')).assertEqual('设备型号|系统版本|应用版本');
      const supplied = fieldsOfRecord(broken, ConditionSource.of('KnownModel', 'KnownOS', '2.0'));
      expect(supplied.foreground).assertEqual('');
      expect(supplied.assetBytes).assertEqual(32);
      expect(missingFieldsOf(supplied).length).assertEqual(0);
      const object = waveRecord('object'); object.condition = '{"device":"not-a-tuple"}';
      expect(fieldsOfRecord(object).device).assertEqual('');
      expect(fieldsOfRecord(object).appVersion).assertEqual('');
    });

    /**
     * @tc.number SUB_PERFORMANCE_CONDITIONWAVETWO_0200
     * @tc.name testPerformanceConditionWaveTwo0002
     * @tc.desc 非字符串环境版本不被强制转文字，字符串前后台按合法业务值归一化
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceConditionWaveTwo0002', 0, (): void => {
      const malformed = waveRecord('malformed'); malformed.condition = '[23,false," 后台 "]';
      const fields = fieldsOfRecord(malformed);
      expect(fields.device).assertEqual('');
      expect(fields.appVersion).assertEqual('');
      expect(fields.foreground).assertEqual('后台');
      const foreground = waveRecord('foreground');
      foreground.condition = '["fixture-board · fixture-os","1.0.fixture"," 前台 "]';
      expect(fieldsOfRecord(foreground).foreground).assertEqual('前台');
      foreground.condition = '["fixture-board · fixture-os","1.0.fixture",9]';
      expect(fieldsOfRecord(foreground).foreground).assertEqual('');
      foreground.condition = '["fixture-board · fixture-os","1.0.fixture","unknown"]';
      expect(fieldsOfRecord(foreground).foreground).assertEqual('');
    });

    /**
     * @tc.number SUB_PERFORMANCE_CONDITIONWAVETWO_0300
     * @tc.name testPerformanceConditionWaveTwo0003
     * @tc.desc 模块回收条件只取模块目标，修改文件回收清单不改变模块目标摘要
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceConditionWaveTwo0003', 0, (): void => {
      const original = fieldsOfRecord(tupleRecord('original', 'modules', [], ['entry', 'feature'], ['entry.hap']));
      const changedFiles = fieldsOfRecord(tupleRecord('files-changed', 'modules', [],
        ['entry', 'feature'], ['other.hap']));
      const changedModules = fieldsOfRecord(tupleRecord('modules-changed', 'modules', [], ['entry'], ['entry.hap']));
      expect(original.targetCount).assertEqual(2);
      expect(changedFiles.targetDigest).assertEqual(original.targetDigest);
      expect(changedModules.targetDigest === original.targetDigest).assertFalse();
      expect(missingFieldsOf(original).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_PERFORMANCE_CONDITIONWAVETWO_0400
     * @tc.name testPerformanceConditionWaveTwo0004
     * @tc.desc 文件目标排序、重复和空白不影响集合摘要，但删除真实目标会改变摘要
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceConditionWaveTwo0004', 0, (): void => {
      const noisy = fieldsOfRecord(tupleRecord('noisy', 'files', [], [], [' b.so ', 'a.so', 'b.so', '  ']));
      const canonical = fieldsOfRecord(tupleRecord('canonical', 'files', [], [], ['a.so', 'b.so']));
      const reduced = fieldsOfRecord(tupleRecord('reduced', 'files', [], [], ['a.so']));
      expect(noisy.targetCount).assertEqual(2);
      expect(noisy.targetDigest).assertEqual(canonical.targetDigest);
      expect(reduced.targetDigest === canonical.targetDigest).assertFalse();
      expect(noisy.scopeDigest).assertEqual(canonical.scopeDigest);
    });

    /**
     * @tc.number SUB_PERFORMANCE_CONDITIONWAVETWO_0500
     * @tc.name testPerformanceConditionWaveTwo0005
     * @tc.desc 错误目标容器和混合类型元素不会伪造可用目标集合
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceConditionWaveTwo0005', 0, (): void => {
      const nonArray = waveRecord('non-array'); nonArray.mode = 'files';
      nonArray.condition = '["fixture-board · fixture-os","1.0.fixture",true,"W-TEXT","sample.txt",[],[],"entry.hap"]';
      expect(missingFieldsOf(fieldsOfRecord(nonArray)).join('|')).assertEqual('目标集合');
      const mixed = waveRecord('mixed'); mixed.mode = 'files';
      mixed.condition = '["fixture-board · fixture-os","1.0.fixture",true,"W-TEXT","sample.txt",[],[],' +
        '["libentry.so",null,7,false,"  "," libentry.so ","entry.hap"]]';
      expect(fieldsOfRecord(mixed).targetCount).assertEqual(2);
      const empty = waveRecord('empty'); empty.mode = 'files';
      empty.condition = '["fixture-board · fixture-os","1.0.fixture",true,"W-TEXT","sample.txt",[],[],' +
        '[null,false,7,"  "]]';
      expect(fieldsOfRecord(empty).targetDigest).assertEqual('');
      expect(fieldsOfRecord(nonArray).scopeDigest).assertEqual('');
    });

    /**
     * @tc.number SUB_PERFORMANCE_CONDITIONWAVETWO_0600
     * @tc.name testPerformanceConditionWaveTwo0006
     * @tc.desc 安装清单不同即使关键指纹相同也不能标同条件，报告不暴露目标名
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceConditionWaveTwo0006', 0, (): void => {
      const left = tupleRecord('left', 'files', ['entry.hap'], ['entry'], ['entry.hap']);
      const right = tupleRecord('right', 'files', ['entry.hap', 'private-feature.hap'], ['entry'], ['entry.hap']);
      const first = fieldsOfRecord(left); const second = fieldsOfRecord(right);
      expect(fingerprintOf(first)).assertEqual(fingerprintOf(second));
      const comparison = compareConditions(first, second);
      expect(comparison.verdict).assertEqual(ConditionVerdict.PARTIAL);
      expect(comparison.diffs.map((diff): string => diff.label).join('|')).assertEqual('安装/回收目标清单');
      const outcome = exportReport([left, right], new ReportMeta('条件变化', 1700000001000), ReportFormat.MARKDOWN);
      expect(outcome.ok).assertTrue();
      expect(outcome.text.indexOf('private-feature.hap')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_PERFORMANCE_CONDITIONWAVETWO_0700
     * @tc.name testPerformanceConditionWaveTwo0007
     * @tc.desc 多项关键条件差异一次完整解释，不遗漏业务负载、模式和资源事实
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceConditionWaveTwo0007', 0, (): void => {
      const base = fieldsOfRecord(tupleRecord('base', 'control', ['entry.hap'], ['entry'], []));
      const changed = tupleRecord('changed', 'modules', ['entry.hap'], ['entry', 'feature'], []);
      changed.workloadId = 'W-NOTES'; changed.workloadLabel = '业务列表';
      changed.beforeBytes = 64; changed.digestBefore = '12345678';
      const other = fieldsOfRecord(changed, ConditionSource.of('fixture-board', 'next-os', '2.0', 'next-protocol'));
      const comparison = compareConditions(base, other);
      expect(comparison.diffs.map((diff): string => diff.label).join('|')).assertEqual(
        '系统版本|应用版本|负载标识|回收模式|资源大小|资源摘要|目标集合|采样协议|安装/回收目标清单');
      expect(comparison.diffs[0].left + '→' + comparison.diffs[0].right).assertEqual('fixture-os→next-os');
      expect(comparison.diffs[1].left + '→' + comparison.diffs[1].right).assertEqual('1.0.fixture→2.0');
      expect(comparison.diffs[2].right).assertEqual('业务列表（W-NOTES）');
      expect(comparison.diffs[3].left + '→' + comparison.diffs[3].right).assertEqual('对照组→模块回收');
      expect(comparison.diffs[4].left + '→' + comparison.diffs[4].right).assertEqual('32→64');
      expect(comparison.diffs[5].left + '→' + comparison.diffs[5].right).assertEqual('abcdef12→12345678');
      expect(comparison.diffs[7].right).assertEqual('next-protocol');
    });

    /**
     * @tc.number SUB_PERFORMANCE_CONDITIONWAVETWO_0800
     * @tc.name testPerformanceConditionWaveTwo0008
     * @tc.desc 双侧不同关键字段缺失分别登记，不能生成部分指纹或正常差异比较
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceConditionWaveTwo0008', 0, (): void => {
      const left = fieldsOfRecord(waveRecord('left')); left.device = '';
      const right = fieldsOfRecord(waveRecord('right')); right.appVersion = ''; right.assetDigest = '';
      const comparison = compareConditions(left, right);
      expect(comparison.missing.join('|')).assertEqual('左侧缺少设备型号|右侧缺少应用版本|右侧缺少资源摘要');
      expect(comparison.fingerprint).assertEqual('');
      expect(comparison.diffs.length).assertEqual(0);
    });
  });
}

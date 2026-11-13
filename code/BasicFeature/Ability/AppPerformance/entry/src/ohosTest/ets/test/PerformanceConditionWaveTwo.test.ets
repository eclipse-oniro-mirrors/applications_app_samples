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

import { traceParameter } from '../support/TestLog';
import { describe, expect } from '@ohos/hypium';
import { loggedIt as it } from '../support/TestLog';
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
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0001 PerformanceConditionWaveTwo.test:46 assertEqual actual', missingFieldsOf(absent).join('|'))).assertEqual(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0001 PerformanceConditionWaveTwo.test:46 assertEqual expected', '设备型号|系统版本|应用版本'));
      const supplied = fieldsOfRecord(broken, ConditionSource.of('KnownModel', 'KnownOS', '2.0'));
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0001 PerformanceConditionWaveTwo.test:48 assertEqual actual', supplied.foreground)).assertEqual(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0001 PerformanceConditionWaveTwo.test:48 assertEqual expected', ''));
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0001 PerformanceConditionWaveTwo.test:49 assertEqual actual', supplied.assetBytes)).assertEqual(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0001 PerformanceConditionWaveTwo.test:49 assertEqual expected', 32));
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0001 PerformanceConditionWaveTwo.test:50 assertEqual actual', missingFieldsOf(supplied).length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0001 PerformanceConditionWaveTwo.test:50 assertEqual expected', 0));
      const object = waveRecord('object'); object.condition = '{"device":"not-a-tuple"}';
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0001 PerformanceConditionWaveTwo.test:52 assertEqual actual', fieldsOfRecord(object).device)).assertEqual(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0001 PerformanceConditionWaveTwo.test:52 assertEqual expected', ''));
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0001 PerformanceConditionWaveTwo.test:53 assertEqual actual', fieldsOfRecord(object).appVersion)).assertEqual(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0001 PerformanceConditionWaveTwo.test:53 assertEqual expected', ''));
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
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0002 PerformanceConditionWaveTwo.test:67 assertEqual actual', fields.device)).assertEqual(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0002 PerformanceConditionWaveTwo.test:67 assertEqual expected', ''));
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0002 PerformanceConditionWaveTwo.test:68 assertEqual actual', fields.appVersion)).assertEqual(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0002 PerformanceConditionWaveTwo.test:68 assertEqual expected', ''));
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0002 PerformanceConditionWaveTwo.test:69 assertEqual actual', fields.foreground)).assertEqual(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0002 PerformanceConditionWaveTwo.test:69 assertEqual expected', '后台'));
      const foreground = waveRecord('foreground');
      foreground.condition = '["fixture-board · fixture-os","1.0.fixture"," 前台 "]';
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0002 PerformanceConditionWaveTwo.test:72 assertEqual actual', fieldsOfRecord(foreground).foreground)).assertEqual(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0002 PerformanceConditionWaveTwo.test:72 assertEqual expected', '前台'));
      foreground.condition = '["fixture-board · fixture-os","1.0.fixture",9]';
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0002 PerformanceConditionWaveTwo.test:74 assertEqual actual', fieldsOfRecord(foreground).foreground)).assertEqual(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0002 PerformanceConditionWaveTwo.test:74 assertEqual expected', ''));
      foreground.condition = '["fixture-board · fixture-os","1.0.fixture","unknown"]';
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0002 PerformanceConditionWaveTwo.test:76 assertEqual actual', fieldsOfRecord(foreground).foreground)).assertEqual(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0002 PerformanceConditionWaveTwo.test:76 assertEqual expected', ''));
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
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0003 PerformanceConditionWaveTwo.test:92 assertEqual actual', original.targetCount)).assertEqual(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0003 PerformanceConditionWaveTwo.test:92 assertEqual expected', 2));
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0003 PerformanceConditionWaveTwo.test:93 assertEqual actual', changedFiles.targetDigest)).assertEqual(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0003 PerformanceConditionWaveTwo.test:93 assertEqual expected', original.targetDigest));
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0003 PerformanceConditionWaveTwo.test:94 assertFalse actual', changedModules.targetDigest === original.targetDigest)).assertFalse();
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0003 PerformanceConditionWaveTwo.test:95 assertEqual actual', missingFieldsOf(original).length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0003 PerformanceConditionWaveTwo.test:95 assertEqual expected', 0));
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
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0004 PerformanceConditionWaveTwo.test:110 assertEqual actual', noisy.targetCount)).assertEqual(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0004 PerformanceConditionWaveTwo.test:110 assertEqual expected', 2));
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0004 PerformanceConditionWaveTwo.test:111 assertEqual actual', noisy.targetDigest)).assertEqual(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0004 PerformanceConditionWaveTwo.test:111 assertEqual expected', canonical.targetDigest));
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0004 PerformanceConditionWaveTwo.test:112 assertFalse actual', reduced.targetDigest === canonical.targetDigest)).assertFalse();
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0004 PerformanceConditionWaveTwo.test:113 assertEqual actual', noisy.scopeDigest)).assertEqual(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0004 PerformanceConditionWaveTwo.test:113 assertEqual expected', canonical.scopeDigest));
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
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0005 PerformanceConditionWaveTwo.test:127 assertEqual actual', missingFieldsOf(fieldsOfRecord(nonArray)).join('|'))).assertEqual(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0005 PerformanceConditionWaveTwo.test:127 assertEqual expected', '目标集合'));
      const mixed = waveRecord('mixed'); mixed.mode = 'files';
      mixed.condition = '["fixture-board · fixture-os","1.0.fixture",true,"W-TEXT","sample.txt",[],[],' +
        '["libentry.so",null,7,false,"  "," libentry.so ","entry.hap"]]';
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0005 PerformanceConditionWaveTwo.test:131 assertEqual actual', fieldsOfRecord(mixed).targetCount)).assertEqual(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0005 PerformanceConditionWaveTwo.test:131 assertEqual expected', 2));
      const empty = waveRecord('empty'); empty.mode = 'files';
      empty.condition = '["fixture-board · fixture-os","1.0.fixture",true,"W-TEXT","sample.txt",[],[],' +
        '[null,false,7,"  "]]';
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0005 PerformanceConditionWaveTwo.test:135 assertEqual actual', fieldsOfRecord(empty).targetDigest)).assertEqual(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0005 PerformanceConditionWaveTwo.test:135 assertEqual expected', ''));
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0005 PerformanceConditionWaveTwo.test:136 assertEqual actual', fieldsOfRecord(nonArray).scopeDigest)).assertEqual(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0005 PerformanceConditionWaveTwo.test:136 assertEqual expected', ''));
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
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0006 PerformanceConditionWaveTwo.test:151 assertEqual actual', fingerprintOf(first))).assertEqual(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0006 PerformanceConditionWaveTwo.test:151 assertEqual expected', fingerprintOf(second)));
      const comparison = compareConditions(first, second);
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0006 PerformanceConditionWaveTwo.test:153 assertEqual actual', comparison.verdict)).assertEqual(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0006 PerformanceConditionWaveTwo.test:153 assertEqual expected', ConditionVerdict.PARTIAL));
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0006 PerformanceConditionWaveTwo.test:154 assertEqual actual', comparison.diffs.map((diff): string => diff.label).join('|'))).assertEqual(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0006 PerformanceConditionWaveTwo.test:154 assertEqual expected', '安装/回收目标清单'));
      const outcome = exportReport([left, right], new ReportMeta('条件变化', 1700000001000), ReportFormat.MARKDOWN);
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0006 PerformanceConditionWaveTwo.test:156 assertTrue actual', outcome.ok)).assertTrue();
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0006 PerformanceConditionWaveTwo.test:157 assertEqual actual', outcome.text.indexOf('private-feature.hap'))).assertEqual(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0006 PerformanceConditionWaveTwo.test:157 assertEqual expected', -1));
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
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0007 PerformanceConditionWaveTwo.test:175 assertEqual actual', comparison.diffs.map((diff): string => diff.label).join('|'))).assertEqual(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0007 PerformanceConditionWaveTwo.test:175 assertEqual expected', 
        '系统版本|应用版本|负载标识|回收模式|资源大小|资源摘要|目标集合|采样协议|安装/回收目标清单'));
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0007 PerformanceConditionWaveTwo.test:177 assertEqual actual', comparison.diffs[0].left + '→' + comparison.diffs[0].right)).assertEqual(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0007 PerformanceConditionWaveTwo.test:177 assertEqual expected', 'fixture-os→next-os'));
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0007 PerformanceConditionWaveTwo.test:178 assertEqual actual', comparison.diffs[1].left + '→' + comparison.diffs[1].right)).assertEqual(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0007 PerformanceConditionWaveTwo.test:178 assertEqual expected', '1.0.fixture→2.0'));
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0007 PerformanceConditionWaveTwo.test:179 assertEqual actual', comparison.diffs[2].right)).assertEqual(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0007 PerformanceConditionWaveTwo.test:179 assertEqual expected', '业务列表（W-NOTES）'));
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0007 PerformanceConditionWaveTwo.test:180 assertEqual actual', comparison.diffs[3].left + '→' + comparison.diffs[3].right)).assertEqual(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0007 PerformanceConditionWaveTwo.test:180 assertEqual expected', '对照组→模块回收'));
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0007 PerformanceConditionWaveTwo.test:181 assertEqual actual', comparison.diffs[4].left + '→' + comparison.diffs[4].right)).assertEqual(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0007 PerformanceConditionWaveTwo.test:181 assertEqual expected', '32→64'));
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0007 PerformanceConditionWaveTwo.test:182 assertEqual actual', comparison.diffs[5].left + '→' + comparison.diffs[5].right)).assertEqual(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0007 PerformanceConditionWaveTwo.test:182 assertEqual expected', 'abcdef12→12345678'));
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0007 PerformanceConditionWaveTwo.test:183 assertEqual actual', comparison.diffs[7].right)).assertEqual(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0007 PerformanceConditionWaveTwo.test:183 assertEqual expected', 'next-protocol'));
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
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0008 PerformanceConditionWaveTwo.test:198 assertEqual actual', comparison.missing.join('|'))).assertEqual(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0008 PerformanceConditionWaveTwo.test:198 assertEqual expected', '左侧缺少设备型号|右侧缺少应用版本|右侧缺少资源摘要'));
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0008 PerformanceConditionWaveTwo.test:199 assertEqual actual', comparison.fingerprint)).assertEqual(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0008 PerformanceConditionWaveTwo.test:199 assertEqual expected', ''));
      expect(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0008 PerformanceConditionWaveTwo.test:200 assertEqual actual', comparison.diffs.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceConditionWaveTwo_0008 PerformanceConditionWaveTwo.test:200 assertEqual expected', 0));
    });
  });
}

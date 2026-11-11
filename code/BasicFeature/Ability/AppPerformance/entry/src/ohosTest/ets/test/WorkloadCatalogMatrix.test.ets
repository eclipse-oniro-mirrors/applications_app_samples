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

import { describe, expect, it } from '@ohos/hypium';
import {
  KeyValueLine, WorkloadCheck, WorkloadKind, WorkloadSpec, decodeText, firstLine, nonEmptyLines,
  parseKeyValueLines, parseTableRows, valueOf, verifyFormDraft, verifyImageIndex, verifyNoteList,
  verifyText, verifyWorkload, workloadKindLabel
} from '../../../main/ets/core/WorkloadCatalog';

function bytesOf(text: string): Uint8Array {
  const values: number[] = [];
  for (let index: number = 0; index < text.length; index++) {
    values.push(text.charCodeAt(index) & 0x7f);
  }
  return new Uint8Array(values);
}

function specOf(kind: WorkloadKind, minimumBytes: number = 1): WorkloadSpec {
  return new WorkloadSpec('W-TEST', '测试负载', kind, '', '', minimumBytes);
}

export default function workloadCatalogMatrixTest(): void {
  describe('WorkloadCatalogMatrixCases', (): void => {
    /**
     * @tc.number    SUB_PERFORMANCE_WORKLOADCATALOGMATRIX_0100
     * @tc.name      testWorkloadCatalogMatrix0001
     * @tc.desc      Verify every workload kind has a distinct label
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWorkloadCatalogMatrix0001', 0, (): void => {
      expect(workloadKindLabel(WorkloadKind.TEXT)).assertEqual('文本');
      expect(workloadKindLabel(WorkloadKind.NOTE_LIST)).assertEqual('笔记列表');
      expect(workloadKindLabel(WorkloadKind.IMAGE_INDEX)).assertEqual('图片索引');
      expect(workloadKindLabel(WorkloadKind.FORM_DRAFT)).assertEqual('表单草稿');
    });

    /**
     * @tc.number    SUB_PERFORMANCE_WORKLOADCATALOGMATRIX_0200
     * @tc.name      testWorkloadCatalogMatrix0002
     * @tc.desc      Verify workload spec and check render their labels and counts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWorkloadCatalogMatrix0002', 0, (): void => {
      const spec: WorkloadSpec = new WorkloadSpec('W-TEXT', '纯文本样本', WorkloadKind.TEXT, 'sample.txt', '示例');
      expect(spec.text().indexOf('纯文本样本') >= 0).assertTrue();
      expect(spec.text().indexOf('sample.txt') >= 0).assertTrue();
      const check: WorkloadCheck = new WorkloadCheck();
      check.ok = true;
      check.headline = '文本内容可读';
      check.entryCount = 3;
      expect(check.text().startsWith('✓')).assertTrue();
      expect(check.text().indexOf('3 条') >= 0).assertTrue();
      check.ok = false;
      check.entryCount = -1;
      expect(check.text().startsWith('✗')).assertTrue();
      expect(check.text().indexOf('条') >= 0).assertFalse();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_WORKLOADCATALOGMATRIX_0300
     * @tc.name      testWorkloadCatalogMatrix0003
     * @tc.desc      Verify nonEmptyLines ignores blanks and comment lines
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWorkloadCatalogMatrix0003', 0, (): void => {
      expect(nonEmptyLines('a\nb\n\n#comment\nc')).assertEqual(3);
      expect(nonEmptyLines('#only comment\n\n')).assertEqual(0);
      expect(nonEmptyLines('  \n\t\n')).assertEqual(0);
      expect(nonEmptyLines('single')).assertEqual(1);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_WORKLOADCATALOGMATRIX_0400
     * @tc.name      testWorkloadCatalogMatrix0004
     * @tc.desc      Verify firstLine skips comments, trims and reports empty input
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWorkloadCatalogMatrix0004', 0, (): void => {
      expect(firstLine('#head\n  hello world  \nsecond')).assertEqual('hello world');
      expect(firstLine('#head\n\n')).assertEqual('（空）');
      const long: string = 'x'.repeat(60);
      expect(firstLine(long).length).assertEqual(40);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_WORKLOADCATALOGMATRIX_0500
     * @tc.name      testWorkloadCatalogMatrix0005
     * @tc.desc      Verify key=value parsing trims both sides and skips malformed lines
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWorkloadCatalogMatrix0005', 0, (): void => {
      const pairs: KeyValueLine[] = parseKeyValueLines('#c\n key = value \nno-separator\n=x\nlast=1');
      expect(pairs.length).assertEqual(2);
      expect(pairs[0].key).assertEqual('key');
      expect(pairs[0].value).assertEqual('value');
      expect(pairs[1].key).assertEqual('last');
      expect(pairs[1].value).assertEqual('1');
    });

    /**
     * @tc.number    SUB_PERFORMANCE_WORKLOADCATALOGMATRIX_0600
     * @tc.name      testWorkloadCatalogMatrix0006
     * @tc.desc      Verify table parsing trims cells and preserves empty cells
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWorkloadCatalogMatrix0006', 0, (): void => {
      const rows: string[][] = parseTableRows('#c\na|b|c\nx||z\n');
      expect(rows.length).assertEqual(2);
      expect(rows[0].length).assertEqual(3);
      expect(rows[0][1]).assertEqual('b');
      expect(rows[1][1]).assertEqual('');
      expect(parseTableRows('#only').length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_WORKLOADCATALOGMATRIX_0700
     * @tc.name      testWorkloadCatalogMatrix0007
     * @tc.desc      Verify decodeText returns empty for empty input and decodes bytes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWorkloadCatalogMatrix0007', 0, (): void => {
      expect(decodeText(new Uint8Array(0))).assertEqual('');
      expect(decodeText(bytesOf('hello'))).assertEqual('hello');
      expect(decodeText(bytesOf('a\nb'))).assertEqual('a\nb');
    });

    /**
     * @tc.number    SUB_PERFORMANCE_WORKLOADCATALOGMATRIX_0800
     * @tc.name      testWorkloadCatalogMatrix0008
     * @tc.desc      Verify a text sample below the minimum size is reported as missing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWorkloadCatalogMatrix0008', 0, (): void => {
      const check: WorkloadCheck = verifyText(bytesOf('ab'), specOf(WorkloadKind.TEXT, 10));
      expect(check.ok).assertFalse();
      expect(check.headline.indexOf('样本不足 10 字节') >= 0).assertTrue();
      expect(check.facts[0]).assertEqual('实际 2 字节');
    });

    /**
     * @tc.number    SUB_PERFORMANCE_WORKLOADCATALOGMATRIX_0900
     * @tc.name      testWorkloadCatalogMatrix0009
     * @tc.desc      Verify a readable text sample reports line count and first line fact
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWorkloadCatalogMatrix0009', 0, (): void => {
      const check: WorkloadCheck = verifyText(bytesOf('#head\nalpha\nbeta\n'), specOf(WorkloadKind.TEXT));
      expect(check.ok).assertTrue();
      expect(check.entryCount).assertEqual(2);
      expect(check.headline).assertEqual('文本内容可读');
      expect(check.facts.some((item: string): boolean => item === '首行：alpha')).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_WORKLOADCATALOGMATRIX_1000
     * @tc.name      testWorkloadCatalogMatrix0010
     * @tc.desc      Verify a comment-only text sample is rejected as unreadable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWorkloadCatalogMatrix0010', 0, (): void => {
      const check: WorkloadCheck = verifyText(bytesOf('#head\n#another\n'), specOf(WorkloadKind.TEXT));
      expect(check.ok).assertFalse();
      expect(check.headline).assertEqual('没有任何有效行');
      expect(check.entryCount).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_WORKLOADCATALOGMATRIX_1100
     * @tc.name      testWorkloadCatalogMatrix0011
     * @tc.desc      Verify note list validation accepts three-column rows
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWorkloadCatalogMatrix0011', 0, (): void => {
      const check: WorkloadCheck = verifyNoteList(bytesOf('title|body|2024-01-01\nother|text|2024-01-02\n'),
        specOf(WorkloadKind.NOTE_LIST));
      expect(check.ok).assertTrue();
      expect(check.entryCount).assertEqual(2);
      expect(check.headline).assertEqual('笔记列表结构完整');
      expect(check.facts[0]).assertEqual('2 条笔记');
    });

    /**
     * @tc.number    SUB_PERFORMANCE_WORKLOADCATALOGMATRIX_1200
     * @tc.name      testWorkloadCatalogMatrix0012
     * @tc.desc      Verify note list validation reports malformed rows and empty bodies
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWorkloadCatalogMatrix0012', 0, (): void => {
      const malformed: WorkloadCheck = verifyNoteList(bytesOf('a|b\nc|d|e\n'), specOf(WorkloadKind.NOTE_LIST));
      const emptyBody: WorkloadCheck = verifyNoteList(bytesOf('|body|t\n'), specOf(WorkloadKind.NOTE_LIST));
      expect(malformed.ok).assertFalse();
      expect(malformed.headline.indexOf('1 行字段异常') >= 0).assertTrue();
      expect(emptyBody.ok).assertFalse();
      expect(emptyBody.headline.indexOf('1 行内容为空') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_WORKLOADCATALOGMATRIX_1300
     * @tc.name      testWorkloadCatalogMatrix0013
     * @tc.desc      Verify a note sample below the minimum size is rejected before parsing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWorkloadCatalogMatrix0013', 0, (): void => {
      const check: WorkloadCheck = verifyNoteList(bytesOf('a|b|c'), specOf(WorkloadKind.NOTE_LIST, 20));
      expect(check.ok).assertFalse();
      expect(check.headline).assertEqual('笔记样本不足');
      expect(check.entryCount).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_WORKLOADCATALOGMATRIX_1400
     * @tc.name      testWorkloadCatalogMatrix0014
     * @tc.desc      Verify image index validation sums pixels for legal dimensions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWorkloadCatalogMatrix0014', 0, (): void => {
      const check: WorkloadCheck = verifyImageIndex(bytesOf('a.png|2|3\nb.png|4|5\n'),
        specOf(WorkloadKind.IMAGE_INDEX));
      expect(check.ok).assertTrue();
      expect(check.entryCount).assertEqual(2);
      expect(check.facts.some((item: string): boolean => item === '合计 26 像素')).assertTrue();
      expect(check.headline).assertEqual('图片索引可解析');
    });

    /**
     * @tc.number    SUB_PERFORMANCE_WORKLOADCATALOGMATRIX_1500
     * @tc.name      testWorkloadCatalogMatrix0015
     * @tc.desc      Verify zero, negative and non-numeric image sizes are rejected
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWorkloadCatalogMatrix0015', 0, (): void => {
      const zero: WorkloadCheck = verifyImageIndex(bytesOf('a.png|0|3\n'), specOf(WorkloadKind.IMAGE_INDEX));
      const negative: WorkloadCheck = verifyImageIndex(bytesOf('a.png|-1|3\n'), specOf(WorkloadKind.IMAGE_INDEX));
      const text: WorkloadCheck = verifyImageIndex(bytesOf('a.png|wide|3\n'), specOf(WorkloadKind.IMAGE_INDEX));
      expect(zero.ok).assertFalse();
      expect(negative.ok).assertFalse();
      expect(text.ok).assertFalse();
      expect(zero.headline.indexOf('尺寸非法') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_WORKLOADCATALOGMATRIX_1600
     * @tc.name      testWorkloadCatalogMatrix0016
     * @tc.desc      Verify an empty image index is rejected instead of passing silently
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWorkloadCatalogMatrix0016', 0, (): void => {
      const check: WorkloadCheck = verifyImageIndex(bytesOf('#empty\n'), specOf(WorkloadKind.IMAGE_INDEX));
      expect(check.ok).assertFalse();
      expect(check.entryCount).assertEqual(0);
      expect(check.facts.some((item: string): boolean => item === '合计 0 像素')).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_WORKLOADCATALOGMATRIX_1700
     * @tc.name      testWorkloadCatalogMatrix0017
     * @tc.desc      Verify form validation requires all five documented fields
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWorkloadCatalogMatrix0017', 0, (): void => {
      const partial: WorkloadCheck = verifyFormDraft(bytesOf('step=1\nname=A\n'),
        specOf(WorkloadKind.FORM_DRAFT));
      expect(partial.ok).assertFalse();
      expect(partial.entryCount).assertEqual(2);
      expect(partial.headline.indexOf('phone') >= 0).assertTrue();
      expect(partial.headline.indexOf('address') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_WORKLOADCATALOGMATRIX_1800
     * @tc.name      testWorkloadCatalogMatrix0018
     * @tc.desc      Verify a complete form draft passes and reports the current step
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWorkloadCatalogMatrix0018', 0, (): void => {
      const check: WorkloadCheck = verifyFormDraft(
        bytesOf('step=2\nname=A\nphone=1\naddress=B\nnote=C\n'), specOf(WorkloadKind.FORM_DRAFT));
      expect(check.ok).assertTrue();
      expect(check.entryCount).assertEqual(5);
      expect(check.headline).assertEqual('表单草稿字段齐全');
      expect(check.facts.some((item: string): boolean => item === '当前步骤：2')).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_WORKLOADCATALOGMATRIX_1900
     * @tc.name      testWorkloadCatalogMatrix0019
     * @tc.desc      Verify empty values do not satisfy a required form field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWorkloadCatalogMatrix0019', 0, (): void => {
      const check: WorkloadCheck = verifyFormDraft(bytesOf('step=\nname=A\nphone=1\naddress=B\nnote=C\n'),
        specOf(WorkloadKind.FORM_DRAFT));
      expect(check.ok).assertFalse();
      expect(check.entryCount).assertEqual(4);
      expect(check.headline.indexOf('step') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_WORKLOADCATALOGMATRIX_2000
     * @tc.name      testWorkloadCatalogMatrix0020
     * @tc.desc      Verify valueOf returns the first match and an empty string when absent
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWorkloadCatalogMatrix0020', 0, (): void => {
      const pairs: KeyValueLine[] = parseKeyValueLines('a=1\nb=2\na=3');
      expect(valueOf(pairs, 'a')).assertEqual('1');
      expect(valueOf(pairs, 'b')).assertEqual('2');
      expect(valueOf(pairs, 'missing')).assertEqual('');
    });

    /**
     * @tc.number    SUB_PERFORMANCE_WORKLOADCATALOGMATRIX_2100
     * @tc.name      testWorkloadCatalogMatrix0021
     * @tc.desc      Verify dispatch routes each kind to its own validator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWorkloadCatalogMatrix0021', 0, (): void => {
      const text: WorkloadCheck = verifyWorkload(specOf(WorkloadKind.TEXT), bytesOf('alpha\n'));
      const notes: WorkloadCheck = verifyWorkload(specOf(WorkloadKind.NOTE_LIST), bytesOf('a|b|c\n'));
      const images: WorkloadCheck = verifyWorkload(specOf(WorkloadKind.IMAGE_INDEX), bytesOf('a.png|1|1\n'));
      const form: WorkloadCheck = verifyWorkload(specOf(WorkloadKind.FORM_DRAFT),
        bytesOf('step=0\nname=A\nphone=1\naddress=B\nnote=C\n'));
      expect(text.headline).assertEqual('文本内容可读');
      expect(notes.headline).assertEqual('笔记列表结构完整');
      expect(images.headline).assertEqual('图片索引可解析');
      expect(form.headline).assertEqual('表单草稿字段齐全');
    });
  });
}

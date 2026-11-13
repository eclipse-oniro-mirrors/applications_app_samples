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
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0001 WorkloadCatalogMatrix.test:46 assertEqual actual', workloadKindLabel(WorkloadKind.TEXT))).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0001 WorkloadCatalogMatrix.test:46 assertEqual expected', '文本'));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0001 WorkloadCatalogMatrix.test:47 assertEqual actual', workloadKindLabel(WorkloadKind.NOTE_LIST))).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0001 WorkloadCatalogMatrix.test:47 assertEqual expected', '笔记列表'));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0001 WorkloadCatalogMatrix.test:48 assertEqual actual', workloadKindLabel(WorkloadKind.IMAGE_INDEX))).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0001 WorkloadCatalogMatrix.test:48 assertEqual expected', '图片索引'));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0001 WorkloadCatalogMatrix.test:49 assertEqual actual', workloadKindLabel(WorkloadKind.FORM_DRAFT))).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0001 WorkloadCatalogMatrix.test:49 assertEqual expected', '表单草稿'));
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
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0002 WorkloadCatalogMatrix.test:62 assertTrue actual', spec.text().indexOf('纯文本样本') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0002 WorkloadCatalogMatrix.test:63 assertTrue actual', spec.text().indexOf('sample.txt') >= 0)).assertTrue();
      const check: WorkloadCheck = new WorkloadCheck();
      check.ok = true;
      check.headline = '文本内容可读';
      check.entryCount = 3;
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0002 WorkloadCatalogMatrix.test:68 assertTrue actual', check.text().startsWith('✓'))).assertTrue();
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0002 WorkloadCatalogMatrix.test:69 assertTrue actual', check.text().indexOf('3 条') >= 0)).assertTrue();
      check.ok = false;
      check.entryCount = -1;
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0002 WorkloadCatalogMatrix.test:72 assertTrue actual', check.text().startsWith('✗'))).assertTrue();
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0002 WorkloadCatalogMatrix.test:73 assertFalse actual', check.text().indexOf('条') >= 0)).assertFalse();
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
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0003 WorkloadCatalogMatrix.test:85 assertEqual actual', nonEmptyLines('a\nb\n\n#comment\nc'))).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0003 WorkloadCatalogMatrix.test:85 assertEqual expected', 3));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0003 WorkloadCatalogMatrix.test:86 assertEqual actual', nonEmptyLines('#only comment\n\n'))).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0003 WorkloadCatalogMatrix.test:86 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0003 WorkloadCatalogMatrix.test:87 assertEqual actual', nonEmptyLines('  \n\t\n'))).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0003 WorkloadCatalogMatrix.test:87 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0003 WorkloadCatalogMatrix.test:88 assertEqual actual', nonEmptyLines('single'))).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0003 WorkloadCatalogMatrix.test:88 assertEqual expected', 1));
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
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0004 WorkloadCatalogMatrix.test:100 assertEqual actual', firstLine('#head\n  hello world  \nsecond'))).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0004 WorkloadCatalogMatrix.test:100 assertEqual expected', 'hello world'));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0004 WorkloadCatalogMatrix.test:101 assertEqual actual', firstLine('#head\n\n'))).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0004 WorkloadCatalogMatrix.test:101 assertEqual expected', '（空）'));
      const long: string = 'x'.repeat(60);
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0004 WorkloadCatalogMatrix.test:103 assertEqual actual', firstLine(long).length)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0004 WorkloadCatalogMatrix.test:103 assertEqual expected', 40));
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
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0005 WorkloadCatalogMatrix.test:116 assertEqual actual', pairs.length)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0005 WorkloadCatalogMatrix.test:116 assertEqual expected', 2));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0005 WorkloadCatalogMatrix.test:117 assertEqual actual', pairs[0].key)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0005 WorkloadCatalogMatrix.test:117 assertEqual expected', 'key'));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0005 WorkloadCatalogMatrix.test:118 assertEqual actual', pairs[0].value)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0005 WorkloadCatalogMatrix.test:118 assertEqual expected', 'value'));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0005 WorkloadCatalogMatrix.test:119 assertEqual actual', pairs[1].key)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0005 WorkloadCatalogMatrix.test:119 assertEqual expected', 'last'));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0005 WorkloadCatalogMatrix.test:120 assertEqual actual', pairs[1].value)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0005 WorkloadCatalogMatrix.test:120 assertEqual expected', '1'));
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
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0006 WorkloadCatalogMatrix.test:133 assertEqual actual', rows.length)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0006 WorkloadCatalogMatrix.test:133 assertEqual expected', 2));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0006 WorkloadCatalogMatrix.test:134 assertEqual actual', rows[0].length)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0006 WorkloadCatalogMatrix.test:134 assertEqual expected', 3));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0006 WorkloadCatalogMatrix.test:135 assertEqual actual', rows[0][1])).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0006 WorkloadCatalogMatrix.test:135 assertEqual expected', 'b'));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0006 WorkloadCatalogMatrix.test:136 assertEqual actual', rows[1][1])).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0006 WorkloadCatalogMatrix.test:136 assertEqual expected', ''));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0006 WorkloadCatalogMatrix.test:137 assertEqual actual', parseTableRows('#only').length)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0006 WorkloadCatalogMatrix.test:137 assertEqual expected', 0));
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
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0007 WorkloadCatalogMatrix.test:149 assertEqual actual', decodeText(new Uint8Array(0)))).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0007 WorkloadCatalogMatrix.test:149 assertEqual expected', ''));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0007 WorkloadCatalogMatrix.test:150 assertEqual actual', decodeText(bytesOf('hello')))).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0007 WorkloadCatalogMatrix.test:150 assertEqual expected', 'hello'));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0007 WorkloadCatalogMatrix.test:151 assertEqual actual', decodeText(bytesOf('a\nb')))).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0007 WorkloadCatalogMatrix.test:151 assertEqual expected', 'a\nb'));
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
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0008 WorkloadCatalogMatrix.test:164 assertFalse actual', check.ok)).assertFalse();
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0008 WorkloadCatalogMatrix.test:165 assertTrue actual', check.headline.indexOf('样本不足 10 字节') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0008 WorkloadCatalogMatrix.test:166 assertEqual actual', check.facts[0])).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0008 WorkloadCatalogMatrix.test:166 assertEqual expected', '实际 2 字节'));
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
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0009 WorkloadCatalogMatrix.test:179 assertTrue actual', check.ok)).assertTrue();
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0009 WorkloadCatalogMatrix.test:180 assertEqual actual', check.entryCount)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0009 WorkloadCatalogMatrix.test:180 assertEqual expected', 2));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0009 WorkloadCatalogMatrix.test:181 assertEqual actual', check.headline)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0009 WorkloadCatalogMatrix.test:181 assertEqual expected', '文本内容可读'));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0009 WorkloadCatalogMatrix.test:182 assertTrue actual', check.facts.some((item: string): boolean => item === '首行：alpha'))).assertTrue();
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
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0010 WorkloadCatalogMatrix.test:195 assertFalse actual', check.ok)).assertFalse();
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0010 WorkloadCatalogMatrix.test:196 assertEqual actual', check.headline)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0010 WorkloadCatalogMatrix.test:196 assertEqual expected', '没有任何有效行'));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0010 WorkloadCatalogMatrix.test:197 assertEqual actual', check.entryCount)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0010 WorkloadCatalogMatrix.test:197 assertEqual expected', 0));
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
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0011 WorkloadCatalogMatrix.test:211 assertTrue actual', check.ok)).assertTrue();
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0011 WorkloadCatalogMatrix.test:212 assertEqual actual', check.entryCount)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0011 WorkloadCatalogMatrix.test:212 assertEqual expected', 2));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0011 WorkloadCatalogMatrix.test:213 assertEqual actual', check.headline)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0011 WorkloadCatalogMatrix.test:213 assertEqual expected', '笔记列表结构完整'));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0011 WorkloadCatalogMatrix.test:214 assertEqual actual', check.facts[0])).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0011 WorkloadCatalogMatrix.test:214 assertEqual expected', '2 条笔记'));
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
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0012 WorkloadCatalogMatrix.test:228 assertFalse actual', malformed.ok)).assertFalse();
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0012 WorkloadCatalogMatrix.test:229 assertTrue actual', malformed.headline.indexOf('1 行字段异常') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0012 WorkloadCatalogMatrix.test:230 assertFalse actual', emptyBody.ok)).assertFalse();
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0012 WorkloadCatalogMatrix.test:231 assertTrue actual', emptyBody.headline.indexOf('1 行内容为空') >= 0)).assertTrue();
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
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0013 WorkloadCatalogMatrix.test:244 assertFalse actual', check.ok)).assertFalse();
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0013 WorkloadCatalogMatrix.test:245 assertEqual actual', check.headline)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0013 WorkloadCatalogMatrix.test:245 assertEqual expected', '笔记样本不足'));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0013 WorkloadCatalogMatrix.test:246 assertEqual actual', check.entryCount)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0013 WorkloadCatalogMatrix.test:246 assertEqual expected', -1));
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
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0014 WorkloadCatalogMatrix.test:260 assertTrue actual', check.ok)).assertTrue();
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0014 WorkloadCatalogMatrix.test:261 assertEqual actual', check.entryCount)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0014 WorkloadCatalogMatrix.test:261 assertEqual expected', 2));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0014 WorkloadCatalogMatrix.test:262 assertTrue actual', check.facts.some((item: string): boolean => item === '合计 26 像素'))).assertTrue();
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0014 WorkloadCatalogMatrix.test:263 assertEqual actual', check.headline)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0014 WorkloadCatalogMatrix.test:263 assertEqual expected', '图片索引可解析'));
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
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0015 WorkloadCatalogMatrix.test:278 assertFalse actual', zero.ok)).assertFalse();
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0015 WorkloadCatalogMatrix.test:279 assertFalse actual', negative.ok)).assertFalse();
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0015 WorkloadCatalogMatrix.test:280 assertFalse actual', text.ok)).assertFalse();
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0015 WorkloadCatalogMatrix.test:281 assertTrue actual', zero.headline.indexOf('尺寸非法') >= 0)).assertTrue();
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
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0016 WorkloadCatalogMatrix.test:294 assertFalse actual', check.ok)).assertFalse();
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0016 WorkloadCatalogMatrix.test:295 assertEqual actual', check.entryCount)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0016 WorkloadCatalogMatrix.test:295 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0016 WorkloadCatalogMatrix.test:296 assertTrue actual', check.facts.some((item: string): boolean => item === '合计 0 像素'))).assertTrue();
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
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0017 WorkloadCatalogMatrix.test:310 assertFalse actual', partial.ok)).assertFalse();
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0017 WorkloadCatalogMatrix.test:311 assertEqual actual', partial.entryCount)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0017 WorkloadCatalogMatrix.test:311 assertEqual expected', 2));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0017 WorkloadCatalogMatrix.test:312 assertTrue actual', partial.headline.indexOf('phone') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0017 WorkloadCatalogMatrix.test:313 assertTrue actual', partial.headline.indexOf('address') >= 0)).assertTrue();
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
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0018 WorkloadCatalogMatrix.test:327 assertTrue actual', check.ok)).assertTrue();
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0018 WorkloadCatalogMatrix.test:328 assertEqual actual', check.entryCount)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0018 WorkloadCatalogMatrix.test:328 assertEqual expected', 5));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0018 WorkloadCatalogMatrix.test:329 assertEqual actual', check.headline)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0018 WorkloadCatalogMatrix.test:329 assertEqual expected', '表单草稿字段齐全'));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0018 WorkloadCatalogMatrix.test:330 assertTrue actual', check.facts.some((item: string): boolean => item === '当前步骤：2'))).assertTrue();
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
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0019 WorkloadCatalogMatrix.test:344 assertFalse actual', check.ok)).assertFalse();
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0019 WorkloadCatalogMatrix.test:345 assertEqual actual', check.entryCount)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0019 WorkloadCatalogMatrix.test:345 assertEqual expected', 4));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0019 WorkloadCatalogMatrix.test:346 assertTrue actual', check.headline.indexOf('step') >= 0)).assertTrue();
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
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0020 WorkloadCatalogMatrix.test:359 assertEqual actual', valueOf(pairs, 'a'))).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0020 WorkloadCatalogMatrix.test:359 assertEqual expected', '1'));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0020 WorkloadCatalogMatrix.test:360 assertEqual actual', valueOf(pairs, 'b'))).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0020 WorkloadCatalogMatrix.test:360 assertEqual expected', '2'));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0020 WorkloadCatalogMatrix.test:361 assertEqual actual', valueOf(pairs, 'missing'))).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0020 WorkloadCatalogMatrix.test:361 assertEqual expected', ''));
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
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0021 WorkloadCatalogMatrix.test:378 assertEqual actual', text.headline)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0021 WorkloadCatalogMatrix.test:378 assertEqual expected', '文本内容可读'));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0021 WorkloadCatalogMatrix.test:379 assertEqual actual', notes.headline)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0021 WorkloadCatalogMatrix.test:379 assertEqual expected', '笔记列表结构完整'));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0021 WorkloadCatalogMatrix.test:380 assertEqual actual', images.headline)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0021 WorkloadCatalogMatrix.test:380 assertEqual expected', '图片索引可解析'));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0021 WorkloadCatalogMatrix.test:381 assertEqual actual', form.headline)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogMatrix_0021 WorkloadCatalogMatrix.test:381 assertEqual expected', '表单草稿字段齐全'));
    });
  });
}

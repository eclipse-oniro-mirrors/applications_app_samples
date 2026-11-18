/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { DetailModel, DetailRow } from '../main/ets/feature/DetailModel';

const SAMPLE_SEC: number = 1700000000;

function labelsOf(rows: DetailRow[]): string {
  const parts: string[] = [];
  for (let index = 0; index < rows.length; index++) {
    parts.push(rows[index].label);
  }
  return parts.join('|');
}

function valueOf(rows: DetailRow[], label: string): string {
  for (let index = 0; index < rows.length; index++) {
    if (rows[index].label === label) {
      return rows[index].value;
    }
  }
  return '';
}

function countLabel(rows: DetailRow[], label: string): number {
  let count: number = 0;
  for (let index = 0; index < rows.length; index++) {
    if (rows[index].label === label) {
      count += 1;
    }
  }
  return count;
}

export default function detailModelMatrixTest(): void {
  describe('DetailModelMatrixTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX_0001
     * @tc.name      testPlainRowCount0001
     * @tc.desc      plain files have seven detail rows
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPlainRowCount0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(DetailModel.build('a.txt', 'file:///a', 10, SAMPLE_SEC, true).length).assertEqual(7);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX_0002
     * @tc.name      testDlpRowCount0002
     * @tc.desc      dlp files add the inner file row
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDlpRowCount0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(DetailModel.build('a.txt.dlp', 'file:///a', 10, SAMPLE_SEC, true).length).assertEqual(8);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX_0003
     * @tc.name      testPlainLabels0003
     * @tc.desc      plain row labels keep the fixed order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPlainLabels0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const rows: DetailRow[] = DetailModel.build('a.txt', '', 10, SAMPLE_SEC, true);
      expect(labelsOf(rows)).assertEqual('名称|类型|MIME|大小|修改时间|加密文件|访问路径');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX_0004
     * @tc.name      testDlpLabels0004
     * @tc.desc      dlp rows insert the inner file label
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDlpLabels0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const rows: DetailRow[] = DetailModel.build('a.txt.dlp', '', 10, SAMPLE_SEC, true);
      expect(labelsOf(rows)).assertEqual('名称|类型|MIME|大小|修改时间|加密文件|容器内文件|访问路径');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX_0005
     * @tc.name      testUniqueLabels0005
     * @tc.desc      detail rows never repeat a label
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUniqueLabels0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const rows: DetailRow[] = DetailModel.build('a.txt.dlp', '', 10, SAMPLE_SEC, true);
      expect(countLabel(rows, '名称')).assertEqual(1);
      expect(countLabel(rows, '访问路径')).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX_0006
     * @tc.name      testNameValue0006
     * @tc.desc      the name row keeps the original name
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNameValue0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const rows: DetailRow[] = DetailModel.build('shared/report.txt', '', 10, SAMPLE_SEC, true);
      expect(valueOf(rows, '名称')).assertEqual('shared/report.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX_0007
     * @tc.name      testKindValues0007
     * @tc.desc      the type row uses the chinese kind label
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKindValues0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(valueOf(DetailModel.build('a.txt', '', 1, 0, true), '类型')).assertEqual('文本');
      expect(valueOf(DetailModel.build('a.docx', '', 1, 0, true), '类型')).assertEqual('文档');
      expect(valueOf(DetailModel.build('a.mp4', '', 1, 0, true), '类型')).assertEqual('视频');
      expect(valueOf(DetailModel.build('README', '', 1, 0, true), '类型')).assertEqual('未知');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX_0008
     * @tc.name      testDlpKindValue0008
     * @tc.desc      dlp types follow the inner extension
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDlpKindValue0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(valueOf(DetailModel.build('a.png.dlp', '', 1, 0, true), '类型')).assertEqual('图片');
      expect(valueOf(DetailModel.build('a.dlp', '', 1, 0, true), '类型')).assertEqual('未知');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX_0009
     * @tc.name      testMimeValues0009
     * @tc.desc      the mime row reflects the extension
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMimeValues0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(valueOf(DetailModel.build('a.txt', '', 1, 0, true), 'MIME')).assertEqual('text/plain');
      expect(valueOf(DetailModel.build('a.png', '', 1, 0, true), 'MIME')).assertEqual('image/png');
      expect(valueOf(DetailModel.build('a.mp3', '', 1, 0, true), 'MIME')).assertEqual('audio/mpeg');
      expect(valueOf(DetailModel.build('a.xyz', '', 1, 0, true), 'MIME'))
        .assertEqual('application/octet-stream');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX_0010
     * @tc.name      testSizeValues0010
     * @tc.desc      the size row formats bytes with units
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSizeValues0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(valueOf(DetailModel.build('a.txt', '', 0, 0, true), '大小')).assertEqual('0 B');
      expect(valueOf(DetailModel.build('a.txt', '', 1536, 0, true), '大小')).assertEqual('1.5 KB');
      expect(valueOf(DetailModel.build('a.txt', '', 1048576, 0, true), '大小')).assertEqual('1 MB');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX_0011
     * @tc.name      testSizeUnknown0011
     * @tc.desc      negative sizes are shown as unknown
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSizeUnknown0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(valueOf(DetailModel.build('a.txt', '', -1, 0, true), '大小')).assertEqual('未知');
      expect(valueOf(DetailModel.build('a.txt', '', -999, 0, true), '大小')).assertEqual('未知');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX_0012
     * @tc.name      testTimeValues0012
     * @tc.desc      the modified row formats valid timestamps
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTimeValues0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(valueOf(DetailModel.build('a.txt', '', 1, SAMPLE_SEC, true), '修改时间'))
        .assertEqual('2023/11/14 22:13:20');
      expect(valueOf(DetailModel.build('a.txt', '', 1, 86400, true), '修改时间'))
        .assertEqual('1970/01/02 00:00:00');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX_0013
     * @tc.name      testTimeUnknown0013
     * @tc.desc      zero and negative timestamps are unknown
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTimeUnknown0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(valueOf(DetailModel.build('a.txt', '', 1, 0, true), '修改时间')).assertEqual('未知');
      expect(valueOf(DetailModel.build('a.txt', '', 1, -1, true), '修改时间')).assertEqual('未知');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX_0014
     * @tc.name      testDlpFlagValues0014
     * @tc.desc      the dlp row reflects the container suffix
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDlpFlagValues0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(valueOf(DetailModel.build('a.txt', '', 1, 0, true), '加密文件')).assertEqual('否');
      expect(valueOf(DetailModel.build('a.txt.dlp', '', 1, 0, true), '加密文件')).assertEqual('是');
      expect(valueOf(DetailModel.build('a.dlp', '', 1, 0, true), '加密文件')).assertEqual('是');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX_0015
     * @tc.name      testInnerValue0015
     * @tc.desc      the inner file row shows the unwrapped name
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInnerValue0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(valueOf(DetailModel.build('annual.tar.gz.dlp', '', 1, 0, true), '容器内文件'))
        .assertEqual('annual.tar.gz');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX_0016
     * @tc.name      testUriValues0016
     * @tc.desc      the access path row keeps or replaces uris
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUriValues0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(valueOf(DetailModel.build('a.txt', 'file:///docs/a.txt', 1, 0, true), '访问路径'))
        .assertEqual('file:///docs/a.txt');
      expect(valueOf(DetailModel.build('a.txt', '', 1, 0, true), '访问路径')).assertEqual('未知');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX_0017
     * @tc.name      testSummaryText0017
     * @tc.desc      summaries combine kind and size
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSummaryText0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(DetailModel.summary('a.txt', 1536)).assertEqual('文本 · 1.5 KB');
      expect(DetailModel.summary('a.docx', 2048)).assertEqual('文档 · 2 KB');
      expect(DetailModel.summary('a.png', 0)).assertEqual('图片 · 0 B');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX_0018
     * @tc.name      testSummaryUnknown0018
     * @tc.desc      summaries report unknown sizes explicitly
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSummaryUnknown0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(DetailModel.summary('a.txt', -1)).assertEqual('文本 · 大小未知');
      expect(DetailModel.summary('README', -1)).assertEqual('未知 · 大小未知');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX_0019
     * @tc.name      testSummaryDlp0019
     * @tc.desc      summaries use the inner extension for dlp files
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSummaryDlp0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(DetailModel.summary('a.txt.dlp', 1024)).assertEqual('文本 · 1 KB');
      expect(DetailModel.summary('a.dlp', 1024)).assertEqual('未知 · 1 KB');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX_0020
     * @tc.name      testUppercaseName0020
     * @tc.desc      uppercase extensions still produce correct types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUppercaseName0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(valueOf(DetailModel.build('REPORT.PDF', '', 1, 0, true), '类型')).assertEqual('文档');
      expect(valueOf(DetailModel.build('PHOTO.JPG', '', 1, 0, true), 'MIME')).assertEqual('image/jpeg');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX_0021
     * @tc.name      testLocalTimeFlag0021
     * @tc.desc      utc formatting is stable across calls
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocalTimeFlag0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const first: string = valueOf(DetailModel.build('a.txt', '', 1, SAMPLE_SEC, true), '修改时间');
      const second: string = valueOf(DetailModel.build('a.txt', '', 1, SAMPLE_SEC, true), '修改时间');
      expect(first).assertEqual(second);
      expect(first).assertEqual('2023/11/14 22:13:20');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX_0022
     * @tc.name      testLongName0022
     * @tc.desc      long names are preserved with their extension
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLongName0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let name: string = '';
      for (let index = 0; index < 80; index++) {
        name += 'a';
      }
      name += '.txt';
      const rows: DetailRow[] = DetailModel.build(name, '', 1, 0, true);
      expect(valueOf(rows, '名称')).assertEqual(name);
      expect(valueOf(rows, '类型')).assertEqual('文本');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX_0023
     * @tc.name      testValuesNonEmpty0023
     * @tc.desc      every row has a non empty value
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValuesNonEmpty0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const rows: DetailRow[] = DetailModel.build('a.txt.dlp', 'file:///a', 1536, SAMPLE_SEC, true);
      for (let index = 0; index < rows.length; index++) {
        expect(rows[index].value.length > 0).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX_0024
     * @tc.name      testMultiDotDlp0024
     * @tc.desc      multi dot dlp names keep the inner extension
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMultiDotDlp0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(valueOf(DetailModel.build('v1.2.report.docx.dlp', '', 1, 0, true), '容器内文件'))
        .assertEqual('v1.2.report.docx');
      expect(valueOf(DetailModel.build('v1.2.report.docx.dlp', '', 1, 0, true), '类型'))
        .assertEqual('文档');
    })
  });
}

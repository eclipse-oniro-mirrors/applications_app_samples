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

function labelsOf(rows: Array<DetailRow>): string {
  const parts: Array<string> = [];
  for (let index = 0; index < rows.length; index++) {
    parts.push(rows[index].label);
  }
  return parts.join('|');
}

function valueOf(rows: Array<DetailRow>, label: string): string {
  for (let index = 0; index < rows.length; index++) {
    if (rows[index].label === label) {
      return rows[index].value;
    }
  }
  return '';
}

export default function detailModelTest(): void {
  describe('DetailModelTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMODEL_0001
     * @tc.name      testRowsCount0001
     * @tc.desc      plain files have seven detail rows
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRowsCount0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRowsCount0001 begin');
      console.info('testRowsCount0001 begin');
      const rows: Array<DetailRow> = DetailModel.build('a.txt', 'file:///a.txt', 10, SAMPLE_SEC, true);
      expect(rows.length).assertEqual(7);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMODEL_0002
     * @tc.name      testRowOrder0002
     * @tc.desc      rows keep the fixed presentation order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRowOrder0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRowOrder0002 begin');
      console.info('testRowOrder0002 begin');
      const rows: Array<DetailRow> = DetailModel.build('a.txt', 'file:///a.txt', 10, SAMPLE_SEC, true);
      expect(labelsOf(rows)).assertEqual('名称|类型|MIME|大小|修改时间|加密文件|访问路径');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMODEL_0003
     * @tc.name      testNameValue0003
     * @tc.desc      name row keeps the original file name
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNameValue0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNameValue0003 begin');
      console.info('testNameValue0003 begin');
      const rows: Array<DetailRow> = DetailModel.build('年度报告.txt', '', 10, SAMPLE_SEC, true);
      expect(valueOf(rows, '名称')).assertEqual('年度报告.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMODEL_0004
     * @tc.name      testTypeText0004
     * @tc.desc      text files show the text kind label
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypeText0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTypeText0004 begin');
      console.info('testTypeText0004 begin');
      const rows: Array<DetailRow> = DetailModel.build('a.txt', '', 10, SAMPLE_SEC, true);
      expect(valueOf(rows, '类型')).assertEqual('文本');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMODEL_0005
     * @tc.name      testTypeDocument0005
     * @tc.desc      office files show the document kind label
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypeDocument0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTypeDocument0005 begin');
      console.info('testTypeDocument0005 begin');
      const rows: Array<DetailRow> = DetailModel.build('a.docx', '', 10, SAMPLE_SEC, true);
      expect(valueOf(rows, '类型')).assertEqual('文档');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMODEL_0006
     * @tc.name      testTypeImage0006
     * @tc.desc      images show the image kind label
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypeImage0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTypeImage0006 begin');
      console.info('testTypeImage0006 begin');
      const rows: Array<DetailRow> = DetailModel.build('a.png', '', 10, SAMPLE_SEC, true);
      expect(valueOf(rows, '类型')).assertEqual('图片');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMODEL_0007
     * @tc.name      testTypeUnknown0007
     * @tc.desc      unknown extensions show the unknown label
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypeUnknown0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTypeUnknown0007 begin');
      console.info('testTypeUnknown0007 begin');
      const rows: Array<DetailRow> = DetailModel.build('README', '', 10, SAMPLE_SEC, true);
      expect(valueOf(rows, '类型')).assertEqual('未知');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMODEL_0008
     * @tc.name      testTypeDlp0008
     * @tc.desc      dlp wrapped files use the inner extension for the type
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypeDlp0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTypeDlp0008 begin');
      console.info('testTypeDlp0008 begin');
      const rows: Array<DetailRow> = DetailModel.build('a.txt.dlp', '', 10, SAMPLE_SEC, true);
      expect(valueOf(rows, '类型')).assertEqual('文本');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMODEL_0009
     * @tc.name      testMimeText0009
     * @tc.desc      mime row reports the text mime type
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMimeText0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMimeText0009 begin');
      console.info('testMimeText0009 begin');
      const rows: Array<DetailRow> = DetailModel.build('a.txt', '', 10, SAMPLE_SEC, true);
      expect(valueOf(rows, 'MIME')).assertEqual('text/plain');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMODEL_0010
     * @tc.name      testMimeDocx0010
     * @tc.desc      mime row reports the word mime type
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMimeDocx0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMimeDocx0010 begin');
      console.info('testMimeDocx0010 begin');
      const rows: Array<DetailRow> = DetailModel.build('a.docx', '', 10, SAMPLE_SEC, true);
      expect(valueOf(rows, 'MIME')).assertEqual(
        'application/vnd.openxmlformats-officedocument.wordprocessingml.document');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMODEL_0011
     * @tc.name      testSizeFormat0011
     * @tc.desc      known sizes are formatted with units
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSizeFormat0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSizeFormat0011 begin');
      console.info('testSizeFormat0011 begin');
      const rows: Array<DetailRow> = DetailModel.build('a.txt', '', 1536, SAMPLE_SEC, true);
      expect(valueOf(rows, '大小')).assertEqual('1.5 KB');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMODEL_0012
     * @tc.name      testSizeZero0012
     * @tc.desc      zero size is displayed as zero bytes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSizeZero0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSizeZero0012 begin');
      console.info('testSizeZero0012 begin');
      const rows: Array<DetailRow> = DetailModel.build('a.txt', '', 0, SAMPLE_SEC, true);
      expect(valueOf(rows, '大小')).assertEqual('0 B');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMODEL_0013
     * @tc.name      testSizeUnknown0013
     * @tc.desc      negative sizes are shown as unknown
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSizeUnknown0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSizeUnknown0013 begin');
      console.info('testSizeUnknown0013 begin');
      const rows: Array<DetailRow> = DetailModel.build('a.txt', '', -1, SAMPLE_SEC, true);
      expect(valueOf(rows, '大小')).assertEqual('未知');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMODEL_0014
     * @tc.name      testModifiedUtc0014
     * @tc.desc      modified time uses the utc formatter when requested
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testModifiedUtc0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testModifiedUtc0014 begin');
      console.info('testModifiedUtc0014 begin');
      const rows: Array<DetailRow> = DetailModel.build('a.txt', '', 10, SAMPLE_SEC, true);
      expect(valueOf(rows, '修改时间')).assertEqual('2023/11/14 22:13:20');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMODEL_0015
     * @tc.name      testModifiedZero0015
     * @tc.desc      zero timestamp is shown as unknown
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testModifiedZero0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testModifiedZero0015 begin');
      console.info('testModifiedZero0015 begin');
      const rows: Array<DetailRow> = DetailModel.build('a.txt', '', 10, 0, true);
      expect(valueOf(rows, '修改时间')).assertEqual('未知');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMODEL_0016
     * @tc.name      testModifiedNegative0016
     * @tc.desc      negative timestamps are shown as unknown
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testModifiedNegative0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testModifiedNegative0016 begin');
      console.info('testModifiedNegative0016 begin');
      const rows: Array<DetailRow> = DetailModel.build('a.txt', '', 10, -5, true);
      expect(valueOf(rows, '修改时间')).assertEqual('未知');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMODEL_0017
     * @tc.name      testUriValue0017
     * @tc.desc      access path keeps the source uri
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUriValue0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testUriValue0017 begin');
      console.info('testUriValue0017 begin');
      const rows: Array<DetailRow> = DetailModel.build('a.txt', 'file:///docs/a.txt', 10, SAMPLE_SEC, true);
      expect(valueOf(rows, '访问路径')).assertEqual('file:///docs/a.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMODEL_0018
     * @tc.name      testUriEmpty0018
     * @tc.desc      empty uris are shown as unknown
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUriEmpty0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testUriEmpty0018 begin');
      console.info('testUriEmpty0018 begin');
      const rows: Array<DetailRow> = DetailModel.build('a.txt', '', 10, SAMPLE_SEC, true);
      expect(valueOf(rows, '访问路径')).assertEqual('未知');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMODEL_0019
     * @tc.name      testDlpRows0019
     * @tc.desc      dlp files gain an inner file row
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDlpRows0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDlpRows0019 begin');
      console.info('testDlpRows0019 begin');
      const rows: Array<DetailRow> = DetailModel.build('a.txt.dlp', '', 10, SAMPLE_SEC, true);
      expect(rows.length).assertEqual(8);
      expect(valueOf(rows, '容器内文件')).assertEqual('a.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMODEL_0020
     * @tc.name      testDlpFlag0020
     * @tc.desc      dlp flag reflects the container suffix
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDlpFlag0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDlpFlag0020 begin');
      console.info('testDlpFlag0020 begin');
      const rows: Array<DetailRow> = DetailModel.build('a.txt.dlp', '', 10, SAMPLE_SEC, true);
      expect(valueOf(rows, '加密文件')).assertEqual('是');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMODEL_0021
     * @tc.name      testPlainFlag0021
     * @tc.desc      plain files show the negative dlp flag
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPlainFlag0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPlainFlag0021 begin');
      console.info('testPlainFlag0021 begin');
      const rows: Array<DetailRow> = DetailModel.build('a.txt', '', 10, SAMPLE_SEC, true);
      expect(valueOf(rows, '加密文件')).assertEqual('否');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMODEL_0022
     * @tc.name      testDlpOrder0022
     * @tc.desc      the inner file row sits before the access path
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDlpOrder0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDlpOrder0022 begin');
      console.info('testDlpOrder0022 begin');
      const rows: Array<DetailRow> = DetailModel.build('a.txt.dlp', '', 10, SAMPLE_SEC, true);
      expect(labelsOf(rows)).assertEqual('名称|类型|MIME|大小|修改时间|加密文件|容器内文件|访问路径');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMODEL_0023
     * @tc.name      testSummaryKnown0023
     * @tc.desc      summary combines kind and formatted size
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSummaryKnown0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSummaryKnown0023 begin');
      console.info('testSummaryKnown0023 begin');
      expect(DetailModel.summary('a.txt', 1536)).assertEqual('文本 · 1.5 KB');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMODEL_0024
     * @tc.name      testSummaryUnknownSize0024
     * @tc.desc      summary reports unknown sizes explicitly
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSummaryUnknownSize0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSummaryUnknownSize0024 begin');
      console.info('testSummaryUnknownSize0024 begin');
      expect(DetailModel.summary('a.txt', -1)).assertEqual('文本 · 大小未知');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMODEL_0025
     * @tc.name      testSummaryDocx0025
     * @tc.desc      summary uses the document label for office files
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSummaryDocx0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSummaryDocx0025 begin');
      console.info('testSummaryDocx0025 begin');
      expect(DetailModel.summary('a.docx', 2048)).assertEqual('文档 · 2 KB');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMODEL_0026
     * @tc.name      testLongName0026
     * @tc.desc      long names are preserved in the name row
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLongName0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLongName0026 begin');
      console.info('testLongName0026 begin');
      let name: string = 'report';
      for (let index = 0; index < 40; index++) {
        name += 'x';
      }
      name += '.txt';
      const rows: Array<DetailRow> = DetailModel.build(name, '', 10, SAMPLE_SEC, true);
      expect(valueOf(rows, '名称')).assertEqual(name);
    })
  });
}

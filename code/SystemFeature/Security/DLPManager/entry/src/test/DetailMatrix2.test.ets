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

function valueOf(rows: Array<DetailRow>, label: string): string {
  for (let index = 0; index < rows.length; index++) {
    if (rows[index].label === label) {
      return rows[index].value;
    }
  }
  return '';
}

function labelsOf(rows: Array<DetailRow>): string {
  const parts: Array<string> = [];
  for (let index = 0; index < rows.length; index++) {
    parts.push(rows[index].label);
  }
  return parts.join('|');
}

export default function detailMatrix2Test(): void {
  describe('DetailMatrix2Test', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX2_0001
     * @tc.name      testKindLog0001
     * @tc.desc      log files are described as text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKindLog0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const rows: Array<DetailRow> = DetailModel.build('app.log', '', 10, 0, true);
      expect(valueOf(rows, '类型')).assertEqual('文本');
      expect(valueOf(rows, 'MIME')).assertEqual('text/plain');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX2_0002
     * @tc.name      testKindXlsx0002
     * @tc.desc      spreadsheets are described as documents
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKindXlsx0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const rows: Array<DetailRow> = DetailModel.build('data.xlsx', '', 10, 0, true);
      expect(valueOf(rows, '类型')).assertEqual('文档');
      expect(valueOf(rows, 'MIME')).assertEqual(
        'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX2_0003
     * @tc.name      testKindApk0003
     * @tc.desc      packages are described as programs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKindApk0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const rows: Array<DetailRow> = DetailModel.build('tool.apk', '', 10, 0, true);
      expect(valueOf(rows, '类型')).assertEqual('程序');
      expect(valueOf(rows, 'MIME')).assertEqual('application/vnd.harmonyos.package');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX2_0004
     * @tc.name      testKindArchive0004
     * @tc.desc      archives are described as archive files
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKindArchive0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const rows: Array<DetailRow> = DetailModel.build('backup.tar.gz', '', 10, 0, true);
      expect(valueOf(rows, '类型')).assertEqual('压缩包');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX2_0005
     * @tc.name      testSizeFormats0005
     * @tc.desc      size rows use readable units
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSizeFormats0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(valueOf(DetailModel.build('a.txt', '', 1536, 0, true), '大小')).assertEqual('1.5 KB');
      expect(valueOf(DetailModel.build('a.txt', '', 1048576, 0, true), '大小')).assertEqual('1 MB');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX2_0006
     * @tc.name      testTime20380006
     * @tc.desc      timestamps around 2038 format correctly
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTime20380006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const rows: Array<DetailRow> = DetailModel.build('a.txt', '', 1, 2147483647, true);
      expect(valueOf(rows, '修改时间')).assertEqual('2038/01/19 03:14:07');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX2_0007
     * @tc.name      testDlpOnlyUnknown0007
     * @tc.desc      dlp containers without inner extensions are unknown
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDlpOnlyUnknown0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const rows: Array<DetailRow> = DetailModel.build('secret.dlp', '', 10, 0, true);
      expect(valueOf(rows, '加密文件')).assertEqual('是');
      expect(valueOf(rows, '类型')).assertEqual('未知');
      expect(valueOf(rows, '容器内文件')).assertEqual('secret');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX2_0008
     * @tc.name      testDlpInnerArchive0008
     * @tc.desc      dlp wrapped archives keep their inner type
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDlpInnerArchive0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const rows: Array<DetailRow> = DetailModel.build('a.zip.dlp', '', 10, 0, true);
      expect(valueOf(rows, '类型')).assertEqual('压缩包');
      expect(valueOf(rows, '容器内文件')).assertEqual('a.zip');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX2_0009
     * @tc.name      testUriWithQuery0009
     * @tc.desc      access paths keep query strings
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUriWithQuery0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const rows: Array<DetailRow> = DetailModel.build('a.txt', 'file:///a?x=1', 10, 0, true);
      expect(valueOf(rows, '访问路径')).assertEqual('file:///a?x=1');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX2_0010
     * @tc.name      testSummarySweep0010
     * @tc.desc      summaries cover the common kinds
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSummarySweep0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(DetailModel.summary('a.txt', 10)).assertEqual('文本 · 10 B');
      expect(DetailModel.summary('a.png', 10)).assertEqual('图片 · 10 B');
      expect(DetailModel.summary('a.mp3', 10)).assertEqual('音频 · 10 B');
      expect(DetailModel.summary('a.zip', 10)).assertEqual('压缩包 · 10 B');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX2_0011
     * @tc.name      testSummaryUnknownSize0011
     * @tc.desc      unknown sizes are labeled in summaries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSummaryUnknownSize0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(DetailModel.summary('a.docx', -1)).assertEqual('文档 · 大小未知');
      expect(DetailModel.summary('a.xyz', -1)).assertEqual('未知 · 大小未知');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX2_0012
     * @tc.name      testLabelsDlp0012
     * @tc.desc      dlp rows keep a unique label order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLabelsDlp0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const rows: Array<DetailRow> = DetailModel.build('a.txt.dlp', '', 1, 0, true);
      expect(labelsOf(rows)).assertEqual('名称|类型|MIME|大小|修改时间|加密文件|容器内文件|访问路径');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX2_0013
     * @tc.name      testValuesNonEmpty0013
     * @tc.desc      all detail values are populated
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValuesNonEmpty0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const rows: Array<DetailRow> = DetailModel.build('a.txt', 'file:///a', 0, 946684800, true);
      for (let index = 0; index < rows.length; index++) {
        expect(rows[index].value.length > 0).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX2_0014
     * @tc.name      testLongDlpName0014
     * @tc.desc      long dlp names keep the inner name intact
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLongDlpName0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let name: string = '';
      for (let index = 0; index < 60; index++) {
        name += 'x';
      }
      name += '.docx.dlp';
      const rows: Array<DetailRow> = DetailModel.build(name, '', 1, 0, true);
      expect(valueOf(rows, '容器内文件').endsWith('.docx')).assertTrue();
      expect(valueOf(rows, '类型')).assertEqual('文档');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX2_0015
     * @tc.name      testMimeFallback0015
     * @tc.desc      unknown extensions fall back to octet stream
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMimeFallback0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const rows: Array<DetailRow> = DetailModel.build('a.custom', '', 1, 0, true);
      expect(valueOf(rows, 'MIME')).assertEqual('application/octet-stream');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX2_0016
     * @tc.name      testRowCountStable0016
     * @tc.desc      row counts stay stable for repeated builds
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRowCountStable0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const first: number = DetailModel.build('a.txt', '', 1, 0, true).length;
      const second: number = DetailModel.build('a.txt', '', 999, 123, true).length;
      expect(first).assertEqual(7);
      expect(second).assertEqual(7);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX2_0017
     * @tc.name      testDateOnlyTime0017
     * @tc.desc      detail time includes date and time parts
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDateOnlyTime0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const rows: Array<DetailRow> = DetailModel.build('a.txt', '', 1, 946684800, true);
      expect(valueOf(rows, '修改时间')).assertEqual('2000/01/01 00:00:00');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX2_0018
     * @tc.name      testSummaryDlpInner0018
     * @tc.desc      dlp summaries use the inner kind
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSummaryDlpInner0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(DetailModel.summary('a.png.dlp', 1024)).assertEqual('图片 · 1 KB');
      expect(DetailModel.summary('a.zip.dlp', 1024)).assertEqual('压缩包 · 1 KB');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX2_0019
     * @tc.name      testKindMp40019
     * @tc.desc      videos are described as video files
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKindMp40019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const rows: Array<DetailRow> = DetailModel.build('clip.mp4', '', 10, 0, true);
      expect(valueOf(rows, '类型')).assertEqual('视频');
      expect(valueOf(rows, 'MIME')).assertEqual('video/mp4');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX2_0020
     * @tc.name      testKindSvg0020
     * @tc.desc      svg files are described as images
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKindSvg0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const rows: Array<DetailRow> = DetailModel.build('icon.svg', '', 10, 0, true);
      expect(valueOf(rows, '类型')).assertEqual('图片');
      expect(valueOf(rows, 'MIME')).assertEqual('image/svg+xml');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX2_0021
     * @tc.name      testPlainDlpFlag0021
     * @tc.desc      plain files report a negative dlp flag
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPlainDlpFlag0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(valueOf(DetailModel.build('a.docx', '', 1, 0, true), '加密文件')).assertEqual('否');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DETAILMATRIX2_0022
     * @tc.name      testBuildNoUri0022
     * @tc.desc      missing uris are labeled unknown
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildNoUri0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(valueOf(DetailModel.build('a.txt', '', 1, 0, true), '访问路径')).assertEqual('未知');
    })
  });
}

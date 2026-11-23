/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it } from '@ohos/hypium';
import { CatalogVector, verifyCatalog } from '../Shared/MatrixFixture';

export default function registerMatrixCatalog002(): void {
  describe('MatrixCatalog002', (): void => {
    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0001
     * @tc.name MatrixCatalog002_0001
     * @tc.desc Verify catalog input vector 1 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0001', 0, (): void => {
      const vector = new CatalogVector(8, "a%20b", 3, 4, "a%20b0", "a%20b0", "a%20b1");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0002
     * @tc.name MatrixCatalog002_0002
     * @tc.desc Verify catalog input vector 2 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0002', 0, (): void => {
      const vector = new CatalogVector(48, "http://example.test/video", 0, 24, "http://example.test/video24", "http://example.test/video0", "http://example.test/video47");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0003
     * @tc.name MatrixCatalog002_0003
     * @tc.desc Verify catalog input vector 3 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0003', 0, (): void => {
      const vector = new CatalogVector(11, "null", 4, 5, "null10", "null5", "null4");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0004
     * @tc.name MatrixCatalog002_0004
     * @tc.desc Verify catalog input vector 4 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0004', 0, (): void => {
      const vector = new CatalogVector(4, "x@y", 3, 2, "x@y0", "x@y0", "x@y1");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0005
     * @tc.name MatrixCatalog002_0005
     * @tc.desc Verify catalog input vector 5 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0005', 0, (): void => {
      const vector = new CatalogVector(47, "x\ny", 1, 23, "x\ny", "x\ny", "x\ny");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0006
     * @tc.name MatrixCatalog002_0006
     * @tc.desc Verify catalog input vector 6 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0006', 0, (): void => {
      const vector = new CatalogVector(8, "trailing-space ", 0, 4, "trailing-space 4", "trailing-space 0", "trailing-space 7");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0007
     * @tc.name MatrixCatalog002_0007
     * @tc.desc Verify catalog input vector 7 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0007', 0, (): void => {
      const vector = new CatalogVector(15, "trailing-space ", 1, 7, "trailing-space ", "trailing-space ", "trailing-space ");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0008
     * @tc.name MatrixCatalog002_0008
     * @tc.desc Verify catalog input vector 8 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0008', 0, (): void => {
      const vector = new CatalogVector(10, "\n", 2, 5, "\n4", "\n9", "\n0");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0009
     * @tc.name MatrixCatalog002_0009
     * @tc.desc Verify catalog input vector 9 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0009', 0, (): void => {
      const vector = new CatalogVector(17, "http://[::1]:5000/video", 4, 8, "http://[::1]:5000/video16", "http://[::1]:5000/video8", "http://[::1]:5000/video7");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0010
     * @tc.name MatrixCatalog002_0010
     * @tc.desc Verify catalog input vector 10 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0010', 0, (): void => {
      const vector = new CatalogVector(65, "clip\u0000suffix", 1, 32, "clip\u0000suffix", "clip\u0000suffix", "clip\u0000suffix");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0011
     * @tc.name MatrixCatalog002_0011
     * @tc.desc Verify catalog input vector 11 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0011', 0, (): void => {
      const vector = new CatalogVector(3, "title|pipe", 2, 1, "title|pipe1", "title|pipe2", "title|pipe0");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0012
     * @tc.name MatrixCatalog002_0012
     * @tc.desc Verify catalog input vector 12 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0012', 0, (): void => {
      const vector = new CatalogVector(65, "x@y", 1, 32, "x@y", "x@y", "x@y");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0013
     * @tc.name MatrixCatalog002_0013
     * @tc.desc Verify catalog input vector 13 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0013', 0, (): void => {
      const vector = new CatalogVector(96, "CaseSensitive", 3, 48, "CaseSensitive0", "CaseSensitive0", "CaseSensitive1");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0014
     * @tc.name MatrixCatalog002_0014
     * @tc.desc Verify catalog input vector 14 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0014', 0, (): void => {
      const vector = new CatalogVector(48, "clip+plus", 0, 24, "clip+plus24", "clip+plus0", "clip+plus47");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0015
     * @tc.name MatrixCatalog002_0015
     * @tc.desc Verify catalog input vector 15 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0015', 0, (): void => {
      const vector = new CatalogVector(17, "//clip", 4, 8, "//clip16", "//clip8", "//clip7");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0016
     * @tc.name MatrixCatalog002_0016
     * @tc.desc Verify catalog input vector 16 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0016', 0, (): void => {
      const vector = new CatalogVector(10, "trailing/", 3, 5, "trailing/1", "trailing/0", "trailing/1");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0017
     * @tc.name MatrixCatalog002_0017
     * @tc.desc Verify catalog input vector 17 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0017', 0, (): void => {
      const vector = new CatalogVector(8, "a:b:c", 4, 4, "a:b:c0", "a:b:c4", "a:b:c3");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0018
     * @tc.name MatrixCatalog002_0018
     * @tc.desc Verify catalog input vector 18 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0018', 0, (): void => {
      const vector = new CatalogVector(15, "trailing/", 3, 7, "trailing/1", "trailing/0", "trailing/0");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0019
     * @tc.name MatrixCatalog002_0019
     * @tc.desc Verify catalog input vector 19 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0019', 0, (): void => {
      const vector = new CatalogVector(5, "https://example.test/video", 1, 2, "https://example.test/video", "https://example.test/video", "https://example.test/video");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0020
     * @tc.name MatrixCatalog002_0020
     * @tc.desc Verify catalog input vector 20 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0020', 0, (): void => {
      const vector = new CatalogVector(12, "片段", 3, 6, "片段0", "片段0", "片段1");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0021
     * @tc.name MatrixCatalog002_0021
     * @tc.desc Verify catalog input vector 21 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0021', 0, (): void => {
      const vector = new CatalogVector(7, "/clip", 4, 3, "/clip6", "/clip3", "/clip2");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0022
     * @tc.name MatrixCatalog002_0022
     * @tc.desc Verify catalog input vector 22 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0022', 0, (): void => {
      const vector = new CatalogVector(64, "CaseSensitive", 2, 32, "CaseSensitive31", "CaseSensitive63", "CaseSensitive0");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0023
     * @tc.name MatrixCatalog002_0023
     * @tc.desc Verify catalog input vector 23 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0023', 0, (): void => {
      const vector = new CatalogVector(25, "日本語", 0, 12, "日本語12", "日本語0", "日本語24");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0024
     * @tc.name MatrixCatalog002_0024
     * @tc.desc Verify catalog input vector 24 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0024', 0, (): void => {
      const vector = new CatalogVector(4, "clip\\name", 4, 2, "clip\\name0", "clip\\name2", "clip\\name1");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0025
     * @tc.name MatrixCatalog002_0025
     * @tc.desc Verify catalog input vector 25 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0025', 0, (): void => {
      const vector = new CatalogVector(33, "file:///video/", 0, 16, "file:///video/16", "file:///video/0", "file:///video/32");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0026
     * @tc.name MatrixCatalog002_0026
     * @tc.desc Verify catalog input vector 26 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0026', 0, (): void => {
      const vector = new CatalogVector(12, "space in name", 4, 6, "space in name0", "space in name6", "space in name5");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0027
     * @tc.name MatrixCatalog002_0027
     * @tc.desc Verify catalog input vector 27 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0027', 0, (): void => {
      const vector = new CatalogVector(65, "\r\n", 2, 32, "\r\n32", "\r\n64", "\r\n0");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0028
     * @tc.name MatrixCatalog002_0028
     * @tc.desc Verify catalog input vector 28 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0028', 0, (): void => {
      const vector = new CatalogVector(64, "title,comma", 0, 32, "title,comma32", "title,comma0", "title,comma63");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0029
     * @tc.name MatrixCatalog002_0029
     * @tc.desc Verify catalog input vector 29 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0029', 0, (): void => {
      const vector = new CatalogVector(129, "https://example.test/video", 0, 64, "https://example.test/video64", "https://example.test/video0", "https://example.test/video128");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0030
     * @tc.name MatrixCatalog002_0030
     * @tc.desc Verify catalog input vector 30 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0030', 0, (): void => {
      const vector = new CatalogVector(16, "a/b#fragment", 3, 8, "a/b#fragment0", "a/b#fragment0", "a/b#fragment1");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0031
     * @tc.name MatrixCatalog002_0031
     * @tc.desc Verify catalog input vector 31 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0031', 0, (): void => {
      const vector = new CatalogVector(15, "x@y", 1, 7, "x@y", "x@y", "x@y");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0032
     * @tc.name MatrixCatalog002_0032
     * @tc.desc Verify catalog input vector 32 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0032', 0, (): void => {
      const vector = new CatalogVector(3, "x@y", 1, 1, "x@y", "x@y", "x@y");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0033
     * @tc.name MatrixCatalog002_0033
     * @tc.desc Verify catalog input vector 33 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0033', 0, (): void => {
      const vector = new CatalogVector(7, "C:\\video", 3, 3, "C:\\video1", "C:\\video0", "C:\\video0");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0034
     * @tc.name MatrixCatalog002_0034
     * @tc.desc Verify catalog input vector 34 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0034', 0, (): void => {
      const vector = new CatalogVector(6, "🎬", 1, 3, "🎬", "🎬", "🎬");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0035
     * @tc.name MatrixCatalog002_0035
     * @tc.desc Verify catalog input vector 35 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0035', 0, (): void => {
      const vector = new CatalogVector(63, "a%20b", 1, 31, "a%20b", "a%20b", "a%20b");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0036
     * @tc.name MatrixCatalog002_0036
     * @tc.desc Verify catalog input vector 36 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0036', 0, (): void => {
      const vector = new CatalogVector(15, "space in name", 1, 7, "space in name", "space in name", "space in name");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0037
     * @tc.name MatrixCatalog002_0037
     * @tc.desc Verify catalog input vector 37 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0037', 0, (): void => {
      const vector = new CatalogVector(96, "\t", 4, 48, "\t0", "\t48", "\t47");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0038
     * @tc.name MatrixCatalog002_0038
     * @tc.desc Verify catalog input vector 38 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0038', 0, (): void => {
      const vector = new CatalogVector(16, "title,comma", 4, 8, "title,comma0", "title,comma8", "title,comma7");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0039
     * @tc.name MatrixCatalog002_0039
     * @tc.desc Verify catalog input vector 39 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0039', 0, (): void => {
      const vector = new CatalogVector(6, "\r\n", 0, 3, "\r\n3", "\r\n0", "\r\n5");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0040
     * @tc.name MatrixCatalog002_0040
     * @tc.desc Verify catalog input vector 40 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0040', 0, (): void => {
      const vector = new CatalogVector(97, "한글", 3, 48, "한글0", "한글0", "한글0");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0041
     * @tc.name MatrixCatalog002_0041
     * @tc.desc Verify catalog input vector 41 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0041', 0, (): void => {
      const vector = new CatalogVector(48, "é", 0, 24, "é24", "é0", "é47");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0042
     * @tc.name MatrixCatalog002_0042
     * @tc.desc Verify catalog input vector 42 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0042', 0, (): void => {
      const vector = new CatalogVector(3, "a\"quote", 0, 1, "a\"quote1", "a\"quote0", "a\"quote2");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0043
     * @tc.name MatrixCatalog002_0043
     * @tc.desc Verify catalog input vector 43 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0043', 0, (): void => {
      const vector = new CatalogVector(6, "https://example.test/video", 0, 3, "https://example.test/video3", "https://example.test/video0", "https://example.test/video5");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0044
     * @tc.name MatrixCatalog002_0044
     * @tc.desc Verify catalog input vector 44 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0044', 0, (): void => {
      const vector = new CatalogVector(64, "中文/路径", 1, 32, "中文/路径", "中文/路径", "中文/路径");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0045
     * @tc.name MatrixCatalog002_0045
     * @tc.desc Verify catalog input vector 45 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0045', 0, (): void => {
      const vector = new CatalogVector(23, "a;b", 4, 11, "a;b22", "a;b11", "a;b10");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0046
     * @tc.name MatrixCatalog002_0046
     * @tc.desc Verify catalog input vector 46 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0046', 0, (): void => {
      const vector = new CatalogVector(47, "العربية", 2, 23, "العربية23", "العربية46", "العربية0");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0047
     * @tc.name MatrixCatalog002_0047
     * @tc.desc Verify catalog input vector 47 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0047', 0, (): void => {
      const vector = new CatalogVector(10, "title,comma", 4, 5, "title,comma0", "title,comma5", "title,comma4");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0048
     * @tc.name MatrixCatalog002_0048
     * @tc.desc Verify catalog input vector 48 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0048', 0, (): void => {
      const vector = new CatalogVector(128, "%00", 1, 64, "%00", "%00", "%00");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0049
     * @tc.name MatrixCatalog002_0049
     * @tc.desc Verify catalog input vector 49 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0049', 0, (): void => {
      const vector = new CatalogVector(32, "a/b#fragment", 3, 16, "a/b#fragment0", "a/b#fragment0", "a/b#fragment1");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG002_0050
     * @tc.name MatrixCatalog002_0050
     * @tc.desc Verify catalog input vector 50 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog002_0050', 0, (): void => {
      const vector = new CatalogVector(33, "\n", 1, 16, "\n", "\n", "\n");
      verifyCatalog(vector);
    });

  });
}

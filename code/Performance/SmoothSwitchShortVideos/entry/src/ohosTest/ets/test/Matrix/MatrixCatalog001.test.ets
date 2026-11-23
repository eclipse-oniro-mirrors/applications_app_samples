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

export default function registerMatrixCatalog001(): void {
  describe('MatrixCatalog001', (): void => {
    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0001
     * @tc.name MatrixCatalog001_0001
     * @tc.desc Verify catalog input vector 1 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0001', 0, (): void => {
      const vector = new CatalogVector(17, "a\"quote", 1, 8, "a\"quote", "a\"quote", "a\"quote");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0002
     * @tc.name MatrixCatalog001_0002
     * @tc.desc Verify catalog input vector 2 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0002', 0, (): void => {
      const vector = new CatalogVector(32, "🎬", 0, 16, "🎬16", "🎬0", "🎬31");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0003
     * @tc.name MatrixCatalog001_0003
     * @tc.desc Verify catalog input vector 3 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0003', 0, (): void => {
      const vector = new CatalogVector(127, "C:\\video", 4, 63, "C:\\video126", "C:\\video63", "C:\\video62");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0004
     * @tc.name MatrixCatalog001_0004
     * @tc.desc Verify catalog input vector 4 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0004', 0, (): void => {
      const vector = new CatalogVector(17, "title|pipe", 2, 8, "title|pipe8", "title|pipe16", "title|pipe0");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0005
     * @tc.name MatrixCatalog001_0005
     * @tc.desc Verify catalog input vector 5 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0005', 0, (): void => {
      const vector = new CatalogVector(10, "C:\\video", 4, 5, "C:\\video0", "C:\\video5", "C:\\video4");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0006
     * @tc.name MatrixCatalog001_0006
     * @tc.desc Verify catalog input vector 6 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0006', 0, (): void => {
      const vector = new CatalogVector(65, "HTTP://VIDEO", 0, 32, "HTTP://VIDEO32", "HTTP://VIDEO0", "HTTP://VIDEO64");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0007
     * @tc.name MatrixCatalog001_0007
     * @tc.desc Verify catalog input vector 7 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0007', 0, (): void => {
      const vector = new CatalogVector(7, "עברית", 0, 3, "עברית3", "עברית0", "עברית6");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0008
     * @tc.name MatrixCatalog001_0008
     * @tc.desc Verify catalog input vector 8 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0008', 0, (): void => {
      const vector = new CatalogVector(96, "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", 2, 48, "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx47", "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx95", "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0009
     * @tc.name MatrixCatalog001_0009
     * @tc.desc Verify catalog input vector 9 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0009', 0, (): void => {
      const vector = new CatalogVector(15, "x@y", 0, 7, "x@y7", "x@y0", "x@y14");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0010
     * @tc.name MatrixCatalog001_0010
     * @tc.desc Verify catalog input vector 10 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0010', 0, (): void => {
      const vector = new CatalogVector(8, "​", 4, 4, "​0", "​4", "​3");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0011
     * @tc.name MatrixCatalog001_0011
     * @tc.desc Verify catalog input vector 11 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0011', 0, (): void => {
      const vector = new CatalogVector(31, "file:///video/", 3, 15, "file:///video/1", "file:///video/0", "file:///video/0");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0012
     * @tc.name MatrixCatalog001_0012
     * @tc.desc Verify catalog input vector 12 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0012', 0, (): void => {
      const vector = new CatalogVector(4, "100%", 2, 2, "100%1", "100%3", "100%0");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0013
     * @tc.name MatrixCatalog001_0013
     * @tc.desc Verify catalog input vector 13 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0013', 0, (): void => {
      const vector = new CatalogVector(23, "한글", 2, 11, "한글11", "한글22", "한글0");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0014
     * @tc.name MatrixCatalog001_0014
     * @tc.desc Verify catalog input vector 14 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0014', 0, (): void => {
      const vector = new CatalogVector(7, "片段", 0, 3, "片段3", "片段0", "片段6");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0015
     * @tc.name MatrixCatalog001_0015
     * @tc.desc Verify catalog input vector 15 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0015', 0, (): void => {
      const vector = new CatalogVector(6, "http://[::1]:5000/video", 1, 3, "http://[::1]:5000/video", "http://[::1]:5000/video", "http://[::1]:5000/video");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0016
     * @tc.name MatrixCatalog001_0016
     * @tc.desc Verify catalog input vector 16 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0016', 0, (): void => {
      const vector = new CatalogVector(17, "x\ny", 2, 8, "x\ny8", "x\ny16", "x\ny0");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0017
     * @tc.name MatrixCatalog001_0017
     * @tc.desc Verify catalog input vector 17 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0017', 0, (): void => {
      const vector = new CatalogVector(95, "http://[::1]:5000/video", 1, 47, "http://[::1]:5000/video", "http://[::1]:5000/video", "http://[::1]:5000/video");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0018
     * @tc.name MatrixCatalog001_0018
     * @tc.desc Verify catalog input vector 18 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0018', 0, (): void => {
      const vector = new CatalogVector(11, "title;semi", 0, 5, "title;semi5", "title;semi0", "title;semi10");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0019
     * @tc.name MatrixCatalog001_0019
     * @tc.desc Verify catalog input vector 19 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0019', 0, (): void => {
      const vector = new CatalogVector(4, "é", 1, 2, "é", "é", "é");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0020
     * @tc.name MatrixCatalog001_0020
     * @tc.desc Verify catalog input vector 20 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0020', 0, (): void => {
      const vector = new CatalogVector(8, "한글", 1, 4, "한글", "한글", "한글");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0021
     * @tc.name MatrixCatalog001_0021
     * @tc.desc Verify catalog input vector 21 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0021', 0, (): void => {
      const vector = new CatalogVector(17, "null", 2, 8, "null8", "null16", "null0");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0022
     * @tc.name MatrixCatalog001_0022
     * @tc.desc Verify catalog input vector 22 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0022', 0, (): void => {
      const vector = new CatalogVector(128, "http://example.test/video", 2, 64, "http://example.test/video63", "http://example.test/video127", "http://example.test/video0");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0023
     * @tc.name MatrixCatalog001_0023
     * @tc.desc Verify catalog input vector 23 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0023', 0, (): void => {
      const vector = new CatalogVector(97, "%00", 0, 48, "%0048", "%000", "%0096");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0024
     * @tc.name MatrixCatalog001_0024
     * @tc.desc Verify catalog input vector 24 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0024', 0, (): void => {
      const vector = new CatalogVector(7, "100%", 2, 3, "100%3", "100%6", "100%0");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0025
     * @tc.name MatrixCatalog001_0025
     * @tc.desc Verify catalog input vector 25 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0025', 0, (): void => {
      const vector = new CatalogVector(1, "العربية", 1, 0, "العربية", "العربية", "العربية");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0026
     * @tc.name MatrixCatalog001_0026
     * @tc.desc Verify catalog input vector 26 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0026', 0, (): void => {
      const vector = new CatalogVector(49, "русский", 4, 24, "русский48", "русский24", "русский23");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0027
     * @tc.name MatrixCatalog001_0027
     * @tc.desc Verify catalog input vector 27 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0027', 0, (): void => {
      const vector = new CatalogVector(11, "title,comma", 1, 5, "title,comma", "title,comma", "title,comma");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0028
     * @tc.name MatrixCatalog001_0028
     * @tc.desc Verify catalog input vector 28 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0028', 0, (): void => {
      const vector = new CatalogVector(33, "name=clip", 1, 16, "name=clip", "name=clip", "name=clip");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0029
     * @tc.name MatrixCatalog001_0029
     * @tc.desc Verify catalog input vector 29 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0029', 0, (): void => {
      const vector = new CatalogVector(48, "العربية", 4, 24, "العربية0", "العربية24", "العربية23");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0030
     * @tc.name MatrixCatalog001_0030
     * @tc.desc Verify catalog input vector 30 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0030', 0, (): void => {
      const vector = new CatalogVector(4, "한글", 3, 2, "한글0", "한글0", "한글1");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0031
     * @tc.name MatrixCatalog001_0031
     * @tc.desc Verify catalog input vector 31 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0031', 0, (): void => {
      const vector = new CatalogVector(16, "😀🎥", 3, 8, "😀🎥0", "😀🎥0", "😀🎥1");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0032
     * @tc.name MatrixCatalog001_0032
     * @tc.desc Verify catalog input vector 32 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0032', 0, (): void => {
      const vector = new CatalogVector(8, "x\ty", 0, 4, "x\ty4", "x\ty0", "x\ty7");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0033
     * @tc.name MatrixCatalog001_0033
     * @tc.desc Verify catalog input vector 33 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0033', 0, (): void => {
      const vector = new CatalogVector(63, "हिन्दी", 1, 31, "हिन्दी", "हिन्दी", "हिन्दी");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0034
     * @tc.name MatrixCatalog001_0034
     * @tc.desc Verify catalog input vector 34 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0034', 0, (): void => {
      const vector = new CatalogVector(65, "العربية", 3, 32, "العربية0", "العربية0", "العربية0");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0035
     * @tc.name MatrixCatalog001_0035
     * @tc.desc Verify catalog input vector 35 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0035', 0, (): void => {
      const vector = new CatalogVector(64, "a;b", 2, 32, "a;b31", "a;b63", "a;b0");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0036
     * @tc.name MatrixCatalog001_0036
     * @tc.desc Verify catalog input vector 36 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0036', 0, (): void => {
      const vector = new CatalogVector(95, "עברית", 3, 47, "עברית1", "עברית0", "עברית0");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0037
     * @tc.name MatrixCatalog001_0037
     * @tc.desc Verify catalog input vector 37 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0037', 0, (): void => {
      const vector = new CatalogVector(11, "x\ny", 2, 5, "x\ny5", "x\ny10", "x\ny0");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0038
     * @tc.name MatrixCatalog001_0038
     * @tc.desc Verify catalog input vector 38 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0038', 0, (): void => {
      const vector = new CatalogVector(47, "//clip", 2, 23, "//clip23", "//clip46", "//clip0");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0039
     * @tc.name MatrixCatalog001_0039
     * @tc.desc Verify catalog input vector 39 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0039', 0, (): void => {
      const vector = new CatalogVector(25, "a/b#fragment", 1, 12, "a/b#fragment", "a/b#fragment", "a/b#fragment");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0040
     * @tc.name MatrixCatalog001_0040
     * @tc.desc Verify catalog input vector 40 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0040', 0, (): void => {
      const vector = new CatalogVector(49, "HTTP://VIDEO", 4, 24, "HTTP://VIDEO48", "HTTP://VIDEO24", "HTTP://VIDEO23");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0041
     * @tc.name MatrixCatalog001_0041
     * @tc.desc Verify catalog input vector 41 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0041', 0, (): void => {
      const vector = new CatalogVector(4, "\u2029", 2, 2, "\u20291", "\u20293", "\u20290");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0042
     * @tc.name MatrixCatalog001_0042
     * @tc.desc Verify catalog input vector 42 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0042', 0, (): void => {
      const vector = new CatalogVector(3, "﻿", 3, 1, "﻿1", "﻿0", "﻿0");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0043
     * @tc.name MatrixCatalog001_0043
     * @tc.desc Verify catalog input vector 43 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0043', 0, (): void => {
      const vector = new CatalogVector(47, "\u2029", 0, 23, "\u202923", "\u20290", "\u202946");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0044
     * @tc.name MatrixCatalog001_0044
     * @tc.desc Verify catalog input vector 44 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0044', 0, (): void => {
      const vector = new CatalogVector(128, "clip+plus", 1, 64, "clip+plus", "clip+plus", "clip+plus");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0045
     * @tc.name MatrixCatalog001_0045
     * @tc.desc Verify catalog input vector 45 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0045', 0, (): void => {
      const vector = new CatalogVector(11, "한글", 2, 5, "한글5", "한글10", "한글0");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0046
     * @tc.name MatrixCatalog001_0046
     * @tc.desc Verify catalog input vector 46 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0046', 0, (): void => {
      const vector = new CatalogVector(65, "😀🎥", 0, 32, "😀🎥32", "😀🎥0", "😀🎥64");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0047
     * @tc.name MatrixCatalog001_0047
     * @tc.desc Verify catalog input vector 47 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0047', 0, (): void => {
      const vector = new CatalogVector(4, "", 1, 2, "", "", "");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0048
     * @tc.name MatrixCatalog001_0048
     * @tc.desc Verify catalog input vector 48 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0048', 0, (): void => {
      const vector = new CatalogVector(10, "русский", 1, 5, "русский", "русский", "русский");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0049
     * @tc.name MatrixCatalog001_0049
     * @tc.desc Verify catalog input vector 49 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0049', 0, (): void => {
      const vector = new CatalogVector(12, "title,comma", 1, 6, "title,comma", "title,comma", "title,comma");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0050
     * @tc.name MatrixCatalog001_0050
     * @tc.desc Verify catalog input vector 50 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0050', 0, (): void => {
      const vector = new CatalogVector(96, "हिन्दी", 1, 48, "हिन्दी", "हिन्दी", "हिन्दी");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0051
     * @tc.name MatrixCatalog001_0051
     * @tc.desc Verify catalog input vector 51 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0051', 0, (): void => {
      const vector = new CatalogVector(129, "a\"quote", 4, 64, "a\"quote128", "a\"quote64", "a\"quote63");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0052
     * @tc.name MatrixCatalog001_0052
     * @tc.desc Verify catalog input vector 52 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0052', 0, (): void => {
      const vector = new CatalogVector(31, "clip\\name", 0, 15, "clip\\name15", "clip\\name0", "clip\\name30");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0053
     * @tc.name MatrixCatalog001_0053
     * @tc.desc Verify catalog input vector 53 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0053', 0, (): void => {
      const vector = new CatalogVector(8, "русский", 4, 4, "русский0", "русский4", "русский3");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0054
     * @tc.name MatrixCatalog001_0054
     * @tc.desc Verify catalog input vector 54 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0054', 0, (): void => {
      const vector = new CatalogVector(129, "😀🎥", 4, 64, "😀🎥128", "😀🎥64", "😀🎥63");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0055
     * @tc.name MatrixCatalog001_0055
     * @tc.desc Verify catalog input vector 55 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0055', 0, (): void => {
      const vector = new CatalogVector(63, "\u2028", 0, 31, "\u202831", "\u20280", "\u202862");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0056
     * @tc.name MatrixCatalog001_0056
     * @tc.desc Verify catalog input vector 56 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0056', 0, (): void => {
      const vector = new CatalogVector(2, "C:\\video", 1, 1, "C:\\video", "C:\\video", "C:\\video");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0057
     * @tc.name MatrixCatalog001_0057
     * @tc.desc Verify catalog input vector 57 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0057', 0, (): void => {
      const vector = new CatalogVector(11, "/clip", 4, 5, "/clip10", "/clip5", "/clip4");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0058
     * @tc.name MatrixCatalog001_0058
     * @tc.desc Verify catalog input vector 58 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0058', 0, (): void => {
      const vector = new CatalogVector(33, "é", 4, 16, "é32", "é16", "é15");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0059
     * @tc.name MatrixCatalog001_0059
     * @tc.desc Verify catalog input vector 59 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0059', 0, (): void => {
      const vector = new CatalogVector(6, "x\ry", 3, 3, "x\ry1", "x\ry0", "x\ry1");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0060
     * @tc.name MatrixCatalog001_0060
     * @tc.desc Verify catalog input vector 60 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0060', 0, (): void => {
      const vector = new CatalogVector(10, "https://example.test/video", 4, 5, "https://example.test/video0", "https://example.test/video5", "https://example.test/video4");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0061
     * @tc.name MatrixCatalog001_0061
     * @tc.desc Verify catalog input vector 61 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0061', 0, (): void => {
      const vector = new CatalogVector(129, "a/b#fragment", 4, 64, "a/b#fragment128", "a/b#fragment64", "a/b#fragment63");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0062
     * @tc.name MatrixCatalog001_0062
     * @tc.desc Verify catalog input vector 62 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0062', 0, (): void => {
      const vector = new CatalogVector(15, "\r\n", 2, 7, "\r\n7", "\r\n14", "\r\n0");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0063
     * @tc.name MatrixCatalog001_0063
     * @tc.desc Verify catalog input vector 63 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0063', 0, (): void => {
      const vector = new CatalogVector(17, "./clip", 3, 8, "./clip0", "./clip0", "./clip0");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0064
     * @tc.name MatrixCatalog001_0064
     * @tc.desc Verify catalog input vector 64 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0064', 0, (): void => {
      const vector = new CatalogVector(31, "a:b:c", 0, 15, "a:b:c15", "a:b:c0", "a:b:c30");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0065
     * @tc.name MatrixCatalog001_0065
     * @tc.desc Verify catalog input vector 65 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0065', 0, (): void => {
      const vector = new CatalogVector(49, "x#y", 0, 24, "x#y24", "x#y0", "x#y48");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0066
     * @tc.name MatrixCatalog001_0066
     * @tc.desc Verify catalog input vector 66 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0066', 0, (): void => {
      const vector = new CatalogVector(25, "http://example.test/video", 2, 12, "http://example.test/video12", "http://example.test/video24", "http://example.test/video0");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0067
     * @tc.name MatrixCatalog001_0067
     * @tc.desc Verify catalog input vector 67 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0067', 0, (): void => {
      const vector = new CatalogVector(24, "x#y", 1, 12, "x#y", "x#y", "x#y");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0068
     * @tc.name MatrixCatalog001_0068
     * @tc.desc Verify catalog input vector 68 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0068', 0, (): void => {
      const vector = new CatalogVector(64, "é", 0, 32, "é32", "é0", "é63");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0069
     * @tc.name MatrixCatalog001_0069
     * @tc.desc Verify catalog input vector 69 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0069', 0, (): void => {
      const vector = new CatalogVector(129, "a/b#fragment", 3, 64, "a/b#fragment0", "a/b#fragment0", "a/b#fragment0");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0070
     * @tc.name MatrixCatalog001_0070
     * @tc.desc Verify catalog input vector 70 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0070', 0, (): void => {
      const vector = new CatalogVector(96, "%2F", 3, 48, "%2F0", "%2F0", "%2F1");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0071
     * @tc.name MatrixCatalog001_0071
     * @tc.desc Verify catalog input vector 71 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0071', 0, (): void => {
      const vector = new CatalogVector(48, "中文/路径", 4, 24, "中文/路径0", "中文/路径24", "中文/路径23");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0072
     * @tc.name MatrixCatalog001_0072
     * @tc.desc Verify catalog input vector 72 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0072', 0, (): void => {
      const vector = new CatalogVector(16, "null", 1, 8, "null", "null", "null");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0073
     * @tc.name MatrixCatalog001_0073
     * @tc.desc Verify catalog input vector 73 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0073', 0, (): void => {
      const vector = new CatalogVector(17, "\r\n", 1, 8, "\r\n", "\r\n", "\r\n");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0074
     * @tc.name MatrixCatalog001_0074
     * @tc.desc Verify catalog input vector 74 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0074', 0, (): void => {
      const vector = new CatalogVector(5, "trailing-space ", 3, 2, "trailing-space 0", "trailing-space 0", "trailing-space 0");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0075
     * @tc.name MatrixCatalog001_0075
     * @tc.desc Verify catalog input vector 75 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0075', 0, (): void => {
      const vector = new CatalogVector(5, "\u2028", 2, 2, "\u20282", "\u20284", "\u20280");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0076
     * @tc.name MatrixCatalog001_0076
     * @tc.desc Verify catalog input vector 76 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0076', 0, (): void => {
      const vector = new CatalogVector(4, "http://[::1]:5000/video", 1, 2, "http://[::1]:5000/video", "http://[::1]:5000/video", "http://[::1]:5000/video");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0077
     * @tc.name MatrixCatalog001_0077
     * @tc.desc Verify catalog input vector 77 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0077', 0, (): void => {
      const vector = new CatalogVector(128, "https://example.test/v?q=a&token=", 0, 64, "https://example.test/v?q=a&token=64", "https://example.test/v?q=a&token=0", "https://example.test/v?q=a&token=127");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0078
     * @tc.name MatrixCatalog001_0078
     * @tc.desc Verify catalog input vector 78 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0078', 0, (): void => {
      const vector = new CatalogVector(7, "title,comma", 3, 3, "title,comma1", "title,comma0", "title,comma0");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0079
     * @tc.name MatrixCatalog001_0079
     * @tc.desc Verify catalog input vector 79 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0079', 0, (): void => {
      const vector = new CatalogVector(95, "./clip", 2, 47, "./clip47", "./clip94", "./clip0");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0080
     * @tc.name MatrixCatalog001_0080
     * @tc.desc Verify catalog input vector 80 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0080', 0, (): void => {
      const vector = new CatalogVector(3, "a:b:c", 1, 1, "a:b:c", "a:b:c", "a:b:c");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0081
     * @tc.name MatrixCatalog001_0081
     * @tc.desc Verify catalog input vector 81 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0081', 0, (): void => {
      const vector = new CatalogVector(1, "https://example.test/v?q=a&token=", 1, 0, "https://example.test/v?q=a&token=", "https://example.test/v?q=a&token=", "https://example.test/v?q=a&token=");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0082
     * @tc.name MatrixCatalog001_0082
     * @tc.desc Verify catalog input vector 82 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0082', 0, (): void => {
      const vector = new CatalogVector(3, "//clip", 4, 1, "//clip2", "//clip1", "//clip0");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0083
     * @tc.name MatrixCatalog001_0083
     * @tc.desc Verify catalog input vector 83 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0083', 0, (): void => {
      const vector = new CatalogVector(6, "http://[::1]:5000/video", 3, 3, "http://[::1]:5000/video1", "http://[::1]:5000/video0", "http://[::1]:5000/video1");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0084
     * @tc.name MatrixCatalog001_0084
     * @tc.desc Verify catalog input vector 84 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0084', 0, (): void => {
      const vector = new CatalogVector(23, "x#y", 3, 11, "x#y1", "x#y0", "x#y0");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0085
     * @tc.name MatrixCatalog001_0085
     * @tc.desc Verify catalog input vector 85 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0085', 0, (): void => {
      const vector = new CatalogVector(47, "x\ry", 1, 23, "x\ry", "x\ry", "x\ry");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0086
     * @tc.name MatrixCatalog001_0086
     * @tc.desc Verify catalog input vector 86 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0086', 0, (): void => {
      const vector = new CatalogVector(12, "%2F", 3, 6, "%2F0", "%2F0", "%2F1");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0087
     * @tc.name MatrixCatalog001_0087
     * @tc.desc Verify catalog input vector 87 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0087', 0, (): void => {
      const vector = new CatalogVector(64, "./clip", 4, 32, "./clip0", "./clip32", "./clip31");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0088
     * @tc.name MatrixCatalog001_0088
     * @tc.desc Verify catalog input vector 88 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0088', 0, (): void => {
      const vector = new CatalogVector(6, "trailing/", 3, 3, "trailing/1", "trailing/0", "trailing/1");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0089
     * @tc.name MatrixCatalog001_0089
     * @tc.desc Verify catalog input vector 89 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0089', 0, (): void => {
      const vector = new CatalogVector(4, "a;b", 2, 2, "a;b1", "a;b3", "a;b0");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0090
     * @tc.name MatrixCatalog001_0090
     * @tc.desc Verify catalog input vector 90 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0090', 0, (): void => {
      const vector = new CatalogVector(33, "x\ty", 3, 16, "x\ty0", "x\ty0", "x\ty0");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0091
     * @tc.name MatrixCatalog001_0091
     * @tc.desc Verify catalog input vector 91 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0091', 0, (): void => {
      const vector = new CatalogVector(5, "trailing-space ", 1, 2, "trailing-space ", "trailing-space ", "trailing-space ");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0092
     * @tc.name MatrixCatalog001_0092
     * @tc.desc Verify catalog input vector 92 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0092', 0, (): void => {
      const vector = new CatalogVector(129, "a/b#fragment", 2, 64, "a/b#fragment64", "a/b#fragment128", "a/b#fragment0");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0093
     * @tc.name MatrixCatalog001_0093
     * @tc.desc Verify catalog input vector 93 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0093', 0, (): void => {
      const vector = new CatalogVector(2, "title|pipe", 1, 1, "title|pipe", "title|pipe", "title|pipe");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0094
     * @tc.name MatrixCatalog001_0094
     * @tc.desc Verify catalog input vector 94 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0094', 0, (): void => {
      const vector = new CatalogVector(63, "🎬", 1, 31, "🎬", "🎬", "🎬");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0095
     * @tc.name MatrixCatalog001_0095
     * @tc.desc Verify catalog input vector 95 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0095', 0, (): void => {
      const vector = new CatalogVector(25, "a;b", 3, 12, "a;b0", "a;b0", "a;b0");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0096
     * @tc.name MatrixCatalog001_0096
     * @tc.desc Verify catalog input vector 96 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0096', 0, (): void => {
      const vector = new CatalogVector(128, "\r\n", 1, 64, "\r\n", "\r\n", "\r\n");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0097
     * @tc.name MatrixCatalog001_0097
     * @tc.desc Verify catalog input vector 97 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0097', 0, (): void => {
      const vector = new CatalogVector(32, "clip+plus", 3, 16, "clip+plus0", "clip+plus0", "clip+plus1");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0098
     * @tc.name MatrixCatalog001_0098
     * @tc.desc Verify catalog input vector 98 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0098', 0, (): void => {
      const vector = new CatalogVector(11, "x\ny", 0, 5, "x\ny5", "x\ny0", "x\ny10");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0099
     * @tc.name MatrixCatalog001_0099
     * @tc.desc Verify catalog input vector 99 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0099', 0, (): void => {
      const vector = new CatalogVector(24, "x\ny", 4, 12, "x\ny0", "x\ny12", "x\ny11");
      verifyCatalog(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXCATALOG001_0100
     * @tc.name MatrixCatalog001_0100
     * @tc.desc Verify catalog input vector 100 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixCatalog001_0100', 0, (): void => {
      const vector = new CatalogVector(49, "CaseSensitive", 0, 24, "CaseSensitive24", "CaseSensitive0", "CaseSensitive48");
      verifyCatalog(vector);
    });

  });
}

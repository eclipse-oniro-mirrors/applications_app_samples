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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { Log, add, minus, nativeMulti } from 'library';

export default function libraryEdgeTest(): void {
  describe('HspLibraryEdgeTest', () => {
    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_LIBRARY_EDGE_0100
     * @tc.name      testHspLibraryEdge0001
     * @tc.desc      Verify combined arithmetic and native result.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspLibraryEdge0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(add(minus(10, 3), nativeMulti(2, 4))).assertEqual(15);
          expect(typeof add).assertEqual('function');
          expect(typeof nativeMulti).assertEqual('function');
          Log.info('hsp edge ' + 1);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_LIBRARY_EDGE_0200
     * @tc.name      testHspLibraryEdge0002
     * @tc.desc      Verify zero arithmetic invariants.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspLibraryEdge0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(add(0, 0)).assertEqual(minus(0, 0));
          expect(typeof add).assertEqual('function');
          expect(typeof nativeMulti).assertEqual('function');
          Log.info('hsp edge ' + 2);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_LIBRARY_EDGE_0300
     * @tc.name      testHspLibraryEdge0003
     * @tc.desc      Verify native and arithmetic identity.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspLibraryEdge0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(nativeMulti(1, 7)).assertEqual(add(7, 0));
          expect(typeof add).assertEqual('function');
          expect(typeof nativeMulti).assertEqual('function');
          Log.info('hsp edge ' + 3);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}

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

import { beforeEachIt, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Graphics3d]';

export default function g3dMeshMatrix3Test(): void {
  describe('G3dMeshMatrix3Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    G3D_MESH_0163
     * @tc.name      g3dMesh0163
     * @tc.desc      3072 顶点 2 维网格按 0.5 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0163 begin');
      const vertices: number = 3072;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 0.5);
      expect(indices).assertEqual(6144);
      expect(triangles).assertEqual(2048);
      expect(scaled).assertEqual(1536);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0163 end');
    })

    /**
     * @tc.number    G3D_MESH_0164
     * @tc.name      g3dMesh0164
     * @tc.desc      3072 顶点 2 维网格按 1 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0164 begin');
      const vertices: number = 3072;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 1);
      expect(indices).assertEqual(6144);
      expect(triangles).assertEqual(2048);
      expect(scaled).assertEqual(3072);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0164 end');
    })

    /**
     * @tc.number    G3D_MESH_0165
     * @tc.name      g3dMesh0165
     * @tc.desc      3072 顶点 2 维网格按 2 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0165 begin');
      const vertices: number = 3072;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 2);
      expect(indices).assertEqual(6144);
      expect(triangles).assertEqual(2048);
      expect(scaled).assertEqual(6144);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0165 end');
    })

    /**
     * @tc.number    G3D_MESH_0166
     * @tc.name      g3dMesh0166
     * @tc.desc      3072 顶点 2 维网格按 3 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0166 begin');
      const vertices: number = 3072;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 3);
      expect(indices).assertEqual(6144);
      expect(triangles).assertEqual(2048);
      expect(scaled).assertEqual(9216);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0166 end');
    })

    /**
     * @tc.number    G3D_MESH_0167
     * @tc.name      g3dMesh0167
     * @tc.desc      3072 顶点 2 维网格按 4 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0167 begin');
      const vertices: number = 3072;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 4);
      expect(indices).assertEqual(6144);
      expect(triangles).assertEqual(2048);
      expect(scaled).assertEqual(12288);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0167 end');
    })

    /**
     * @tc.number    G3D_MESH_0168
     * @tc.name      g3dMesh0168
     * @tc.desc      3072 顶点 2 维网格按 8 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0168 begin');
      const vertices: number = 3072;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 8);
      expect(indices).assertEqual(6144);
      expect(triangles).assertEqual(2048);
      expect(scaled).assertEqual(24576);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0168 end');
    })

    /**
     * @tc.number    G3D_MESH_0169
     * @tc.name      g3dMesh0169
     * @tc.desc      3072 顶点 3 维网格按 0.5 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0169 begin');
      const vertices: number = 3072;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 0.5);
      expect(indices).assertEqual(9216);
      expect(triangles).assertEqual(3072);
      expect(scaled).assertEqual(1536);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0169 end');
    })

    /**
     * @tc.number    G3D_MESH_0170
     * @tc.name      g3dMesh0170
     * @tc.desc      3072 顶点 3 维网格按 1 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0170 begin');
      const vertices: number = 3072;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 1);
      expect(indices).assertEqual(9216);
      expect(triangles).assertEqual(3072);
      expect(scaled).assertEqual(3072);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0170 end');
    })

    /**
     * @tc.number    G3D_MESH_0171
     * @tc.name      g3dMesh0171
     * @tc.desc      3072 顶点 3 维网格按 2 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0171 begin');
      const vertices: number = 3072;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 2);
      expect(indices).assertEqual(9216);
      expect(triangles).assertEqual(3072);
      expect(scaled).assertEqual(6144);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0171 end');
    })

    /**
     * @tc.number    G3D_MESH_0172
     * @tc.name      g3dMesh0172
     * @tc.desc      3072 顶点 3 维网格按 3 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0172 begin');
      const vertices: number = 3072;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 3);
      expect(indices).assertEqual(9216);
      expect(triangles).assertEqual(3072);
      expect(scaled).assertEqual(9216);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0172 end');
    })

    /**
     * @tc.number    G3D_MESH_0173
     * @tc.name      g3dMesh0173
     * @tc.desc      3072 顶点 3 维网格按 4 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0173 begin');
      const vertices: number = 3072;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 4);
      expect(indices).assertEqual(9216);
      expect(triangles).assertEqual(3072);
      expect(scaled).assertEqual(12288);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0173 end');
    })

    /**
     * @tc.number    G3D_MESH_0174
     * @tc.name      g3dMesh0174
     * @tc.desc      3072 顶点 3 维网格按 8 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0174 begin');
      const vertices: number = 3072;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 8);
      expect(indices).assertEqual(9216);
      expect(triangles).assertEqual(3072);
      expect(scaled).assertEqual(24576);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0174 end');
    })

    /**
     * @tc.number    G3D_MESH_0175
     * @tc.name      g3dMesh0175
     * @tc.desc      3072 顶点 4 维网格按 0.5 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0175 begin');
      const vertices: number = 3072;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 0.5);
      expect(indices).assertEqual(12288);
      expect(triangles).assertEqual(4096);
      expect(scaled).assertEqual(1536);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0175 end');
    })

    /**
     * @tc.number    G3D_MESH_0176
     * @tc.name      g3dMesh0176
     * @tc.desc      3072 顶点 4 维网格按 1 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0176 begin');
      const vertices: number = 3072;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 1);
      expect(indices).assertEqual(12288);
      expect(triangles).assertEqual(4096);
      expect(scaled).assertEqual(3072);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0176 end');
    })

    /**
     * @tc.number    G3D_MESH_0177
     * @tc.name      g3dMesh0177
     * @tc.desc      3072 顶点 4 维网格按 2 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0177 begin');
      const vertices: number = 3072;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 2);
      expect(indices).assertEqual(12288);
      expect(triangles).assertEqual(4096);
      expect(scaled).assertEqual(6144);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0177 end');
    })

    /**
     * @tc.number    G3D_MESH_0178
     * @tc.name      g3dMesh0178
     * @tc.desc      3072 顶点 4 维网格按 3 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0178 begin');
      const vertices: number = 3072;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 3);
      expect(indices).assertEqual(12288);
      expect(triangles).assertEqual(4096);
      expect(scaled).assertEqual(9216);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0178 end');
    })

    /**
     * @tc.number    G3D_MESH_0179
     * @tc.name      g3dMesh0179
     * @tc.desc      3072 顶点 4 维网格按 4 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0179 begin');
      const vertices: number = 3072;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 4);
      expect(indices).assertEqual(12288);
      expect(triangles).assertEqual(4096);
      expect(scaled).assertEqual(12288);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0179 end');
    })

    /**
     * @tc.number    G3D_MESH_0180
     * @tc.name      g3dMesh0180
     * @tc.desc      3072 顶点 4 维网格按 8 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0180 begin');
      const vertices: number = 3072;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 8);
      expect(indices).assertEqual(12288);
      expect(triangles).assertEqual(4096);
      expect(scaled).assertEqual(24576);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0180 end');
    })
  })
}

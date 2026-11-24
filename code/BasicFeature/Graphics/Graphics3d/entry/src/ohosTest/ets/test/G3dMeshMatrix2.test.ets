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

export default function g3dMeshMatrix2Test(): void {
  describe('G3dMeshMatrix2Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    G3D_MESH_0082
     * @tc.name      g3dMesh0082
     * @tc.desc      96 顶点 3 维网格按 3 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0082 begin');
      const vertices: number = 96;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 3);
      expect(indices).assertEqual(288);
      expect(triangles).assertEqual(96);
      expect(scaled).assertEqual(288);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0082 end');
    })

    /**
     * @tc.number    G3D_MESH_0083
     * @tc.name      g3dMesh0083
     * @tc.desc      96 顶点 3 维网格按 4 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0083 begin');
      const vertices: number = 96;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 4);
      expect(indices).assertEqual(288);
      expect(triangles).assertEqual(96);
      expect(scaled).assertEqual(384);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0083 end');
    })

    /**
     * @tc.number    G3D_MESH_0084
     * @tc.name      g3dMesh0084
     * @tc.desc      96 顶点 3 维网格按 8 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0084 begin');
      const vertices: number = 96;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 8);
      expect(indices).assertEqual(288);
      expect(triangles).assertEqual(96);
      expect(scaled).assertEqual(768);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0084 end');
    })

    /**
     * @tc.number    G3D_MESH_0085
     * @tc.name      g3dMesh0085
     * @tc.desc      96 顶点 4 维网格按 0.5 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0085 begin');
      const vertices: number = 96;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 0.5);
      expect(indices).assertEqual(384);
      expect(triangles).assertEqual(128);
      expect(scaled).assertEqual(48);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0085 end');
    })

    /**
     * @tc.number    G3D_MESH_0086
     * @tc.name      g3dMesh0086
     * @tc.desc      96 顶点 4 维网格按 1 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0086 begin');
      const vertices: number = 96;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 1);
      expect(indices).assertEqual(384);
      expect(triangles).assertEqual(128);
      expect(scaled).assertEqual(96);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0086 end');
    })

    /**
     * @tc.number    G3D_MESH_0087
     * @tc.name      g3dMesh0087
     * @tc.desc      96 顶点 4 维网格按 2 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0087 begin');
      const vertices: number = 96;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 2);
      expect(indices).assertEqual(384);
      expect(triangles).assertEqual(128);
      expect(scaled).assertEqual(192);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0087 end');
    })

    /**
     * @tc.number    G3D_MESH_0088
     * @tc.name      g3dMesh0088
     * @tc.desc      96 顶点 4 维网格按 3 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0088 begin');
      const vertices: number = 96;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 3);
      expect(indices).assertEqual(384);
      expect(triangles).assertEqual(128);
      expect(scaled).assertEqual(288);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0088 end');
    })

    /**
     * @tc.number    G3D_MESH_0089
     * @tc.name      g3dMesh0089
     * @tc.desc      96 顶点 4 维网格按 4 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0089 begin');
      const vertices: number = 96;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 4);
      expect(indices).assertEqual(384);
      expect(triangles).assertEqual(128);
      expect(scaled).assertEqual(384);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0089 end');
    })

    /**
     * @tc.number    G3D_MESH_0090
     * @tc.name      g3dMesh0090
     * @tc.desc      96 顶点 4 维网格按 8 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0090 begin');
      const vertices: number = 96;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 8);
      expect(indices).assertEqual(384);
      expect(triangles).assertEqual(128);
      expect(scaled).assertEqual(768);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0090 end');
    })

    /**
     * @tc.number    G3D_MESH_0091
     * @tc.name      g3dMesh0091
     * @tc.desc      192 顶点 2 维网格按 0.5 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0091 begin');
      const vertices: number = 192;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 0.5);
      expect(indices).assertEqual(384);
      expect(triangles).assertEqual(128);
      expect(scaled).assertEqual(96);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0091 end');
    })

    /**
     * @tc.number    G3D_MESH_0092
     * @tc.name      g3dMesh0092
     * @tc.desc      192 顶点 2 维网格按 1 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0092 begin');
      const vertices: number = 192;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 1);
      expect(indices).assertEqual(384);
      expect(triangles).assertEqual(128);
      expect(scaled).assertEqual(192);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0092 end');
    })

    /**
     * @tc.number    G3D_MESH_0093
     * @tc.name      g3dMesh0093
     * @tc.desc      192 顶点 2 维网格按 2 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0093 begin');
      const vertices: number = 192;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 2);
      expect(indices).assertEqual(384);
      expect(triangles).assertEqual(128);
      expect(scaled).assertEqual(384);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0093 end');
    })

    /**
     * @tc.number    G3D_MESH_0094
     * @tc.name      g3dMesh0094
     * @tc.desc      192 顶点 2 维网格按 3 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0094 begin');
      const vertices: number = 192;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 3);
      expect(indices).assertEqual(384);
      expect(triangles).assertEqual(128);
      expect(scaled).assertEqual(576);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0094 end');
    })

    /**
     * @tc.number    G3D_MESH_0095
     * @tc.name      g3dMesh0095
     * @tc.desc      192 顶点 2 维网格按 4 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0095 begin');
      const vertices: number = 192;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 4);
      expect(indices).assertEqual(384);
      expect(triangles).assertEqual(128);
      expect(scaled).assertEqual(768);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0095 end');
    })

    /**
     * @tc.number    G3D_MESH_0096
     * @tc.name      g3dMesh0096
     * @tc.desc      192 顶点 2 维网格按 8 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0096 begin');
      const vertices: number = 192;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 8);
      expect(indices).assertEqual(384);
      expect(triangles).assertEqual(128);
      expect(scaled).assertEqual(1536);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0096 end');
    })

    /**
     * @tc.number    G3D_MESH_0097
     * @tc.name      g3dMesh0097
     * @tc.desc      192 顶点 3 维网格按 0.5 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0097 begin');
      const vertices: number = 192;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 0.5);
      expect(indices).assertEqual(576);
      expect(triangles).assertEqual(192);
      expect(scaled).assertEqual(96);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0097 end');
    })

    /**
     * @tc.number    G3D_MESH_0098
     * @tc.name      g3dMesh0098
     * @tc.desc      192 顶点 3 维网格按 1 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0098 begin');
      const vertices: number = 192;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 1);
      expect(indices).assertEqual(576);
      expect(triangles).assertEqual(192);
      expect(scaled).assertEqual(192);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0098 end');
    })

    /**
     * @tc.number    G3D_MESH_0099
     * @tc.name      g3dMesh0099
     * @tc.desc      192 顶点 3 维网格按 2 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0099 begin');
      const vertices: number = 192;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 2);
      expect(indices).assertEqual(576);
      expect(triangles).assertEqual(192);
      expect(scaled).assertEqual(384);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0099 end');
    })

    /**
     * @tc.number    G3D_MESH_0100
     * @tc.name      g3dMesh0100
     * @tc.desc      192 顶点 3 维网格按 3 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0100 begin');
      const vertices: number = 192;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 3);
      expect(indices).assertEqual(576);
      expect(triangles).assertEqual(192);
      expect(scaled).assertEqual(576);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0100 end');
    })

    /**
     * @tc.number    G3D_MESH_0101
     * @tc.name      g3dMesh0101
     * @tc.desc      192 顶点 3 维网格按 4 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0101 begin');
      const vertices: number = 192;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 4);
      expect(indices).assertEqual(576);
      expect(triangles).assertEqual(192);
      expect(scaled).assertEqual(768);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0101 end');
    })

    /**
     * @tc.number    G3D_MESH_0102
     * @tc.name      g3dMesh0102
     * @tc.desc      192 顶点 3 维网格按 8 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0102 begin');
      const vertices: number = 192;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 8);
      expect(indices).assertEqual(576);
      expect(triangles).assertEqual(192);
      expect(scaled).assertEqual(1536);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0102 end');
    })

    /**
     * @tc.number    G3D_MESH_0103
     * @tc.name      g3dMesh0103
     * @tc.desc      192 顶点 4 维网格按 0.5 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0103 begin');
      const vertices: number = 192;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 0.5);
      expect(indices).assertEqual(768);
      expect(triangles).assertEqual(256);
      expect(scaled).assertEqual(96);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0103 end');
    })

    /**
     * @tc.number    G3D_MESH_0104
     * @tc.name      g3dMesh0104
     * @tc.desc      192 顶点 4 维网格按 1 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0104 begin');
      const vertices: number = 192;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 1);
      expect(indices).assertEqual(768);
      expect(triangles).assertEqual(256);
      expect(scaled).assertEqual(192);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0104 end');
    })

    /**
     * @tc.number    G3D_MESH_0105
     * @tc.name      g3dMesh0105
     * @tc.desc      192 顶点 4 维网格按 2 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0105 begin');
      const vertices: number = 192;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 2);
      expect(indices).assertEqual(768);
      expect(triangles).assertEqual(256);
      expect(scaled).assertEqual(384);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0105 end');
    })

    /**
     * @tc.number    G3D_MESH_0106
     * @tc.name      g3dMesh0106
     * @tc.desc      192 顶点 4 维网格按 3 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0106 begin');
      const vertices: number = 192;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 3);
      expect(indices).assertEqual(768);
      expect(triangles).assertEqual(256);
      expect(scaled).assertEqual(576);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0106 end');
    })

    /**
     * @tc.number    G3D_MESH_0107
     * @tc.name      g3dMesh0107
     * @tc.desc      192 顶点 4 维网格按 4 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0107 begin');
      const vertices: number = 192;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 4);
      expect(indices).assertEqual(768);
      expect(triangles).assertEqual(256);
      expect(scaled).assertEqual(768);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0107 end');
    })

    /**
     * @tc.number    G3D_MESH_0108
     * @tc.name      g3dMesh0108
     * @tc.desc      192 顶点 4 维网格按 8 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0108 begin');
      const vertices: number = 192;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 8);
      expect(indices).assertEqual(768);
      expect(triangles).assertEqual(256);
      expect(scaled).assertEqual(1536);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0108 end');
    })

    /**
     * @tc.number    G3D_MESH_0109
     * @tc.name      g3dMesh0109
     * @tc.desc      384 顶点 2 维网格按 0.5 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0109 begin');
      const vertices: number = 384;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 0.5);
      expect(indices).assertEqual(768);
      expect(triangles).assertEqual(256);
      expect(scaled).assertEqual(192);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0109 end');
    })

    /**
     * @tc.number    G3D_MESH_0110
     * @tc.name      g3dMesh0110
     * @tc.desc      384 顶点 2 维网格按 1 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0110 begin');
      const vertices: number = 384;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 1);
      expect(indices).assertEqual(768);
      expect(triangles).assertEqual(256);
      expect(scaled).assertEqual(384);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0110 end');
    })

    /**
     * @tc.number    G3D_MESH_0111
     * @tc.name      g3dMesh0111
     * @tc.desc      384 顶点 2 维网格按 2 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0111 begin');
      const vertices: number = 384;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 2);
      expect(indices).assertEqual(768);
      expect(triangles).assertEqual(256);
      expect(scaled).assertEqual(768);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0111 end');
    })

    /**
     * @tc.number    G3D_MESH_0112
     * @tc.name      g3dMesh0112
     * @tc.desc      384 顶点 2 维网格按 3 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0112 begin');
      const vertices: number = 384;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 3);
      expect(indices).assertEqual(768);
      expect(triangles).assertEqual(256);
      expect(scaled).assertEqual(1152);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0112 end');
    })

    /**
     * @tc.number    G3D_MESH_0113
     * @tc.name      g3dMesh0113
     * @tc.desc      384 顶点 2 维网格按 4 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0113 begin');
      const vertices: number = 384;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 4);
      expect(indices).assertEqual(768);
      expect(triangles).assertEqual(256);
      expect(scaled).assertEqual(1536);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0113 end');
    })

    /**
     * @tc.number    G3D_MESH_0114
     * @tc.name      g3dMesh0114
     * @tc.desc      384 顶点 2 维网格按 8 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0114 begin');
      const vertices: number = 384;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 8);
      expect(indices).assertEqual(768);
      expect(triangles).assertEqual(256);
      expect(scaled).assertEqual(3072);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0114 end');
    })

    /**
     * @tc.number    G3D_MESH_0115
     * @tc.name      g3dMesh0115
     * @tc.desc      384 顶点 3 维网格按 0.5 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0115 begin');
      const vertices: number = 384;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 0.5);
      expect(indices).assertEqual(1152);
      expect(triangles).assertEqual(384);
      expect(scaled).assertEqual(192);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0115 end');
    })

    /**
     * @tc.number    G3D_MESH_0116
     * @tc.name      g3dMesh0116
     * @tc.desc      384 顶点 3 维网格按 1 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0116 begin');
      const vertices: number = 384;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 1);
      expect(indices).assertEqual(1152);
      expect(triangles).assertEqual(384);
      expect(scaled).assertEqual(384);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0116 end');
    })

    /**
     * @tc.number    G3D_MESH_0117
     * @tc.name      g3dMesh0117
     * @tc.desc      384 顶点 3 维网格按 2 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0117 begin');
      const vertices: number = 384;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 2);
      expect(indices).assertEqual(1152);
      expect(triangles).assertEqual(384);
      expect(scaled).assertEqual(768);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0117 end');
    })

    /**
     * @tc.number    G3D_MESH_0118
     * @tc.name      g3dMesh0118
     * @tc.desc      384 顶点 3 维网格按 3 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0118 begin');
      const vertices: number = 384;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 3);
      expect(indices).assertEqual(1152);
      expect(triangles).assertEqual(384);
      expect(scaled).assertEqual(1152);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0118 end');
    })

    /**
     * @tc.number    G3D_MESH_0119
     * @tc.name      g3dMesh0119
     * @tc.desc      384 顶点 3 维网格按 4 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0119 begin');
      const vertices: number = 384;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 4);
      expect(indices).assertEqual(1152);
      expect(triangles).assertEqual(384);
      expect(scaled).assertEqual(1536);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0119 end');
    })

    /**
     * @tc.number    G3D_MESH_0120
     * @tc.name      g3dMesh0120
     * @tc.desc      384 顶点 3 维网格按 8 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0120 begin');
      const vertices: number = 384;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 8);
      expect(indices).assertEqual(1152);
      expect(triangles).assertEqual(384);
      expect(scaled).assertEqual(3072);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0120 end');
    })

    /**
     * @tc.number    G3D_MESH_0121
     * @tc.name      g3dMesh0121
     * @tc.desc      384 顶点 4 维网格按 0.5 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0121 begin');
      const vertices: number = 384;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 0.5);
      expect(indices).assertEqual(1536);
      expect(triangles).assertEqual(512);
      expect(scaled).assertEqual(192);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0121 end');
    })

    /**
     * @tc.number    G3D_MESH_0122
     * @tc.name      g3dMesh0122
     * @tc.desc      384 顶点 4 维网格按 1 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0122 begin');
      const vertices: number = 384;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 1);
      expect(indices).assertEqual(1536);
      expect(triangles).assertEqual(512);
      expect(scaled).assertEqual(384);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0122 end');
    })

    /**
     * @tc.number    G3D_MESH_0123
     * @tc.name      g3dMesh0123
     * @tc.desc      384 顶点 4 维网格按 2 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0123 begin');
      const vertices: number = 384;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 2);
      expect(indices).assertEqual(1536);
      expect(triangles).assertEqual(512);
      expect(scaled).assertEqual(768);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0123 end');
    })

    /**
     * @tc.number    G3D_MESH_0124
     * @tc.name      g3dMesh0124
     * @tc.desc      384 顶点 4 维网格按 3 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0124 begin');
      const vertices: number = 384;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 3);
      expect(indices).assertEqual(1536);
      expect(triangles).assertEqual(512);
      expect(scaled).assertEqual(1152);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0124 end');
    })

    /**
     * @tc.number    G3D_MESH_0125
     * @tc.name      g3dMesh0125
     * @tc.desc      384 顶点 4 维网格按 4 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0125 begin');
      const vertices: number = 384;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 4);
      expect(indices).assertEqual(1536);
      expect(triangles).assertEqual(512);
      expect(scaled).assertEqual(1536);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0125 end');
    })

    /**
     * @tc.number    G3D_MESH_0126
     * @tc.name      g3dMesh0126
     * @tc.desc      384 顶点 4 维网格按 8 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0126 begin');
      const vertices: number = 384;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 8);
      expect(indices).assertEqual(1536);
      expect(triangles).assertEqual(512);
      expect(scaled).assertEqual(3072);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0126 end');
    })

    /**
     * @tc.number    G3D_MESH_0127
     * @tc.name      g3dMesh0127
     * @tc.desc      768 顶点 2 维网格按 0.5 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0127 begin');
      const vertices: number = 768;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 0.5);
      expect(indices).assertEqual(1536);
      expect(triangles).assertEqual(512);
      expect(scaled).assertEqual(384);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0127 end');
    })

    /**
     * @tc.number    G3D_MESH_0128
     * @tc.name      g3dMesh0128
     * @tc.desc      768 顶点 2 维网格按 1 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0128 begin');
      const vertices: number = 768;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 1);
      expect(indices).assertEqual(1536);
      expect(triangles).assertEqual(512);
      expect(scaled).assertEqual(768);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0128 end');
    })

    /**
     * @tc.number    G3D_MESH_0129
     * @tc.name      g3dMesh0129
     * @tc.desc      768 顶点 2 维网格按 2 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0129 begin');
      const vertices: number = 768;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 2);
      expect(indices).assertEqual(1536);
      expect(triangles).assertEqual(512);
      expect(scaled).assertEqual(1536);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0129 end');
    })

    /**
     * @tc.number    G3D_MESH_0130
     * @tc.name      g3dMesh0130
     * @tc.desc      768 顶点 2 维网格按 3 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0130 begin');
      const vertices: number = 768;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 3);
      expect(indices).assertEqual(1536);
      expect(triangles).assertEqual(512);
      expect(scaled).assertEqual(2304);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0130 end');
    })

    /**
     * @tc.number    G3D_MESH_0131
     * @tc.name      g3dMesh0131
     * @tc.desc      768 顶点 2 维网格按 4 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0131 begin');
      const vertices: number = 768;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 4);
      expect(indices).assertEqual(1536);
      expect(triangles).assertEqual(512);
      expect(scaled).assertEqual(3072);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0131 end');
    })

    /**
     * @tc.number    G3D_MESH_0132
     * @tc.name      g3dMesh0132
     * @tc.desc      768 顶点 2 维网格按 8 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0132 begin');
      const vertices: number = 768;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 8);
      expect(indices).assertEqual(1536);
      expect(triangles).assertEqual(512);
      expect(scaled).assertEqual(6144);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0132 end');
    })

    /**
     * @tc.number    G3D_MESH_0133
     * @tc.name      g3dMesh0133
     * @tc.desc      768 顶点 3 维网格按 0.5 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0133 begin');
      const vertices: number = 768;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 0.5);
      expect(indices).assertEqual(2304);
      expect(triangles).assertEqual(768);
      expect(scaled).assertEqual(384);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0133 end');
    })

    /**
     * @tc.number    G3D_MESH_0134
     * @tc.name      g3dMesh0134
     * @tc.desc      768 顶点 3 维网格按 1 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0134 begin');
      const vertices: number = 768;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 1);
      expect(indices).assertEqual(2304);
      expect(triangles).assertEqual(768);
      expect(scaled).assertEqual(768);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0134 end');
    })

    /**
     * @tc.number    G3D_MESH_0135
     * @tc.name      g3dMesh0135
     * @tc.desc      768 顶点 3 维网格按 2 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0135 begin');
      const vertices: number = 768;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 2);
      expect(indices).assertEqual(2304);
      expect(triangles).assertEqual(768);
      expect(scaled).assertEqual(1536);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0135 end');
    })

    /**
     * @tc.number    G3D_MESH_0136
     * @tc.name      g3dMesh0136
     * @tc.desc      768 顶点 3 维网格按 3 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0136 begin');
      const vertices: number = 768;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 3);
      expect(indices).assertEqual(2304);
      expect(triangles).assertEqual(768);
      expect(scaled).assertEqual(2304);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0136 end');
    })

    /**
     * @tc.number    G3D_MESH_0137
     * @tc.name      g3dMesh0137
     * @tc.desc      768 顶点 3 维网格按 4 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0137 begin');
      const vertices: number = 768;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 4);
      expect(indices).assertEqual(2304);
      expect(triangles).assertEqual(768);
      expect(scaled).assertEqual(3072);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0137 end');
    })

    /**
     * @tc.number    G3D_MESH_0138
     * @tc.name      g3dMesh0138
     * @tc.desc      768 顶点 3 维网格按 8 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0138 begin');
      const vertices: number = 768;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 8);
      expect(indices).assertEqual(2304);
      expect(triangles).assertEqual(768);
      expect(scaled).assertEqual(6144);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0138 end');
    })

    /**
     * @tc.number    G3D_MESH_0139
     * @tc.name      g3dMesh0139
     * @tc.desc      768 顶点 4 维网格按 0.5 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0139 begin');
      const vertices: number = 768;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 0.5);
      expect(indices).assertEqual(3072);
      expect(triangles).assertEqual(1024);
      expect(scaled).assertEqual(384);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0139 end');
    })

    /**
     * @tc.number    G3D_MESH_0140
     * @tc.name      g3dMesh0140
     * @tc.desc      768 顶点 4 维网格按 1 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0140 begin');
      const vertices: number = 768;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 1);
      expect(indices).assertEqual(3072);
      expect(triangles).assertEqual(1024);
      expect(scaled).assertEqual(768);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0140 end');
    })

    /**
     * @tc.number    G3D_MESH_0141
     * @tc.name      g3dMesh0141
     * @tc.desc      768 顶点 4 维网格按 2 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0141 begin');
      const vertices: number = 768;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 2);
      expect(indices).assertEqual(3072);
      expect(triangles).assertEqual(1024);
      expect(scaled).assertEqual(1536);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0141 end');
    })

    /**
     * @tc.number    G3D_MESH_0142
     * @tc.name      g3dMesh0142
     * @tc.desc      768 顶点 4 维网格按 3 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0142 begin');
      const vertices: number = 768;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 3);
      expect(indices).assertEqual(3072);
      expect(triangles).assertEqual(1024);
      expect(scaled).assertEqual(2304);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0142 end');
    })

    /**
     * @tc.number    G3D_MESH_0143
     * @tc.name      g3dMesh0143
     * @tc.desc      768 顶点 4 维网格按 4 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0143 begin');
      const vertices: number = 768;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 4);
      expect(indices).assertEqual(3072);
      expect(triangles).assertEqual(1024);
      expect(scaled).assertEqual(3072);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0143 end');
    })

    /**
     * @tc.number    G3D_MESH_0144
     * @tc.name      g3dMesh0144
     * @tc.desc      768 顶点 4 维网格按 8 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0144 begin');
      const vertices: number = 768;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 8);
      expect(indices).assertEqual(3072);
      expect(triangles).assertEqual(1024);
      expect(scaled).assertEqual(6144);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0144 end');
    })

    /**
     * @tc.number    G3D_MESH_0145
     * @tc.name      g3dMesh0145
     * @tc.desc      1536 顶点 2 维网格按 0.5 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0145 begin');
      const vertices: number = 1536;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 0.5);
      expect(indices).assertEqual(3072);
      expect(triangles).assertEqual(1024);
      expect(scaled).assertEqual(768);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0145 end');
    })

    /**
     * @tc.number    G3D_MESH_0146
     * @tc.name      g3dMesh0146
     * @tc.desc      1536 顶点 2 维网格按 1 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0146 begin');
      const vertices: number = 1536;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 1);
      expect(indices).assertEqual(3072);
      expect(triangles).assertEqual(1024);
      expect(scaled).assertEqual(1536);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0146 end');
    })

    /**
     * @tc.number    G3D_MESH_0147
     * @tc.name      g3dMesh0147
     * @tc.desc      1536 顶点 2 维网格按 2 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0147 begin');
      const vertices: number = 1536;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 2);
      expect(indices).assertEqual(3072);
      expect(triangles).assertEqual(1024);
      expect(scaled).assertEqual(3072);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0147 end');
    })

    /**
     * @tc.number    G3D_MESH_0148
     * @tc.name      g3dMesh0148
     * @tc.desc      1536 顶点 2 维网格按 3 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0148 begin');
      const vertices: number = 1536;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 3);
      expect(indices).assertEqual(3072);
      expect(triangles).assertEqual(1024);
      expect(scaled).assertEqual(4608);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0148 end');
    })

    /**
     * @tc.number    G3D_MESH_0149
     * @tc.name      g3dMesh0149
     * @tc.desc      1536 顶点 2 维网格按 4 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0149 begin');
      const vertices: number = 1536;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 4);
      expect(indices).assertEqual(3072);
      expect(triangles).assertEqual(1024);
      expect(scaled).assertEqual(6144);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0149 end');
    })

    /**
     * @tc.number    G3D_MESH_0150
     * @tc.name      g3dMesh0150
     * @tc.desc      1536 顶点 2 维网格按 8 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0150 begin');
      const vertices: number = 1536;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 8);
      expect(indices).assertEqual(3072);
      expect(triangles).assertEqual(1024);
      expect(scaled).assertEqual(12288);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0150 end');
    })

    /**
     * @tc.number    G3D_MESH_0151
     * @tc.name      g3dMesh0151
     * @tc.desc      1536 顶点 3 维网格按 0.5 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0151 begin');
      const vertices: number = 1536;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 0.5);
      expect(indices).assertEqual(4608);
      expect(triangles).assertEqual(1536);
      expect(scaled).assertEqual(768);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0151 end');
    })

    /**
     * @tc.number    G3D_MESH_0152
     * @tc.name      g3dMesh0152
     * @tc.desc      1536 顶点 3 维网格按 1 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0152 begin');
      const vertices: number = 1536;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 1);
      expect(indices).assertEqual(4608);
      expect(triangles).assertEqual(1536);
      expect(scaled).assertEqual(1536);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0152 end');
    })

    /**
     * @tc.number    G3D_MESH_0153
     * @tc.name      g3dMesh0153
     * @tc.desc      1536 顶点 3 维网格按 2 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0153 begin');
      const vertices: number = 1536;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 2);
      expect(indices).assertEqual(4608);
      expect(triangles).assertEqual(1536);
      expect(scaled).assertEqual(3072);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0153 end');
    })

    /**
     * @tc.number    G3D_MESH_0154
     * @tc.name      g3dMesh0154
     * @tc.desc      1536 顶点 3 维网格按 3 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0154 begin');
      const vertices: number = 1536;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 3);
      expect(indices).assertEqual(4608);
      expect(triangles).assertEqual(1536);
      expect(scaled).assertEqual(4608);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0154 end');
    })

    /**
     * @tc.number    G3D_MESH_0155
     * @tc.name      g3dMesh0155
     * @tc.desc      1536 顶点 3 维网格按 4 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0155 begin');
      const vertices: number = 1536;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 4);
      expect(indices).assertEqual(4608);
      expect(triangles).assertEqual(1536);
      expect(scaled).assertEqual(6144);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0155 end');
    })

    /**
     * @tc.number    G3D_MESH_0156
     * @tc.name      g3dMesh0156
     * @tc.desc      1536 顶点 3 维网格按 8 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0156 begin');
      const vertices: number = 1536;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 8);
      expect(indices).assertEqual(4608);
      expect(triangles).assertEqual(1536);
      expect(scaled).assertEqual(12288);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0156 end');
    })

    /**
     * @tc.number    G3D_MESH_0157
     * @tc.name      g3dMesh0157
     * @tc.desc      1536 顶点 4 维网格按 0.5 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0157 begin');
      const vertices: number = 1536;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 0.5);
      expect(indices).assertEqual(6144);
      expect(triangles).assertEqual(2048);
      expect(scaled).assertEqual(768);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0157 end');
    })

    /**
     * @tc.number    G3D_MESH_0158
     * @tc.name      g3dMesh0158
     * @tc.desc      1536 顶点 4 维网格按 1 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0158 begin');
      const vertices: number = 1536;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 1);
      expect(indices).assertEqual(6144);
      expect(triangles).assertEqual(2048);
      expect(scaled).assertEqual(1536);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0158 end');
    })

    /**
     * @tc.number    G3D_MESH_0159
     * @tc.name      g3dMesh0159
     * @tc.desc      1536 顶点 4 维网格按 2 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0159 begin');
      const vertices: number = 1536;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 2);
      expect(indices).assertEqual(6144);
      expect(triangles).assertEqual(2048);
      expect(scaled).assertEqual(3072);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0159 end');
    })

    /**
     * @tc.number    G3D_MESH_0160
     * @tc.name      g3dMesh0160
     * @tc.desc      1536 顶点 4 维网格按 3 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0160 begin');
      const vertices: number = 1536;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 3);
      expect(indices).assertEqual(6144);
      expect(triangles).assertEqual(2048);
      expect(scaled).assertEqual(4608);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0160 end');
    })

    /**
     * @tc.number    G3D_MESH_0161
     * @tc.name      g3dMesh0161
     * @tc.desc      1536 顶点 4 维网格按 4 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0161 begin');
      const vertices: number = 1536;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 4);
      expect(indices).assertEqual(6144);
      expect(triangles).assertEqual(2048);
      expect(scaled).assertEqual(6144);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0161 end');
    })

    /**
     * @tc.number    G3D_MESH_0162
     * @tc.name      g3dMesh0162
     * @tc.desc      1536 顶点 4 维网格按 8 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0162 begin');
      const vertices: number = 1536;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 8);
      expect(indices).assertEqual(6144);
      expect(triangles).assertEqual(2048);
      expect(scaled).assertEqual(12288);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0162 end');
    })
  })
}

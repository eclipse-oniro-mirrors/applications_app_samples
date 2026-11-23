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

export default function g3dMeshMatrix1Test(): void {
  describe('G3dMeshMatrix1Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    G3D_MESH_0001
     * @tc.name      g3dMesh0001
     * @tc.desc      8 顶点 2 维网格按 0.5 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0001 begin');
      const vertices: number = 8;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 0.5);
      expect(indices).assertEqual(16);
      expect(triangles).assertEqual(5);
      expect(scaled).assertEqual(4);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0001 end');
    })

    /**
     * @tc.number    G3D_MESH_0002
     * @tc.name      g3dMesh0002
     * @tc.desc      8 顶点 2 维网格按 1 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0002 begin');
      const vertices: number = 8;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 1);
      expect(indices).assertEqual(16);
      expect(triangles).assertEqual(5);
      expect(scaled).assertEqual(8);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0002 end');
    })

    /**
     * @tc.number    G3D_MESH_0003
     * @tc.name      g3dMesh0003
     * @tc.desc      8 顶点 2 维网格按 2 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0003 begin');
      const vertices: number = 8;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 2);
      expect(indices).assertEqual(16);
      expect(triangles).assertEqual(5);
      expect(scaled).assertEqual(16);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0003 end');
    })

    /**
     * @tc.number    G3D_MESH_0004
     * @tc.name      g3dMesh0004
     * @tc.desc      8 顶点 2 维网格按 3 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0004 begin');
      const vertices: number = 8;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 3);
      expect(indices).assertEqual(16);
      expect(triangles).assertEqual(5);
      expect(scaled).assertEqual(24);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0004 end');
    })

    /**
     * @tc.number    G3D_MESH_0005
     * @tc.name      g3dMesh0005
     * @tc.desc      8 顶点 2 维网格按 4 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0005 begin');
      const vertices: number = 8;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 4);
      expect(indices).assertEqual(16);
      expect(triangles).assertEqual(5);
      expect(scaled).assertEqual(32);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0005 end');
    })

    /**
     * @tc.number    G3D_MESH_0006
     * @tc.name      g3dMesh0006
     * @tc.desc      8 顶点 2 维网格按 8 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0006 begin');
      const vertices: number = 8;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 8);
      expect(indices).assertEqual(16);
      expect(triangles).assertEqual(5);
      expect(scaled).assertEqual(64);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0006 end');
    })

    /**
     * @tc.number    G3D_MESH_0007
     * @tc.name      g3dMesh0007
     * @tc.desc      8 顶点 3 维网格按 0.5 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0007 begin');
      const vertices: number = 8;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 0.5);
      expect(indices).assertEqual(24);
      expect(triangles).assertEqual(8);
      expect(scaled).assertEqual(4);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0007 end');
    })

    /**
     * @tc.number    G3D_MESH_0008
     * @tc.name      g3dMesh0008
     * @tc.desc      8 顶点 3 维网格按 1 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0008 begin');
      const vertices: number = 8;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 1);
      expect(indices).assertEqual(24);
      expect(triangles).assertEqual(8);
      expect(scaled).assertEqual(8);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0008 end');
    })

    /**
     * @tc.number    G3D_MESH_0009
     * @tc.name      g3dMesh0009
     * @tc.desc      8 顶点 3 维网格按 2 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0009 begin');
      const vertices: number = 8;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 2);
      expect(indices).assertEqual(24);
      expect(triangles).assertEqual(8);
      expect(scaled).assertEqual(16);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0009 end');
    })

    /**
     * @tc.number    G3D_MESH_0010
     * @tc.name      g3dMesh0010
     * @tc.desc      8 顶点 3 维网格按 3 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0010 begin');
      const vertices: number = 8;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 3);
      expect(indices).assertEqual(24);
      expect(triangles).assertEqual(8);
      expect(scaled).assertEqual(24);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0010 end');
    })

    /**
     * @tc.number    G3D_MESH_0011
     * @tc.name      g3dMesh0011
     * @tc.desc      8 顶点 3 维网格按 4 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0011 begin');
      const vertices: number = 8;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 4);
      expect(indices).assertEqual(24);
      expect(triangles).assertEqual(8);
      expect(scaled).assertEqual(32);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0011 end');
    })

    /**
     * @tc.number    G3D_MESH_0012
     * @tc.name      g3dMesh0012
     * @tc.desc      8 顶点 3 维网格按 8 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0012 begin');
      const vertices: number = 8;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 8);
      expect(indices).assertEqual(24);
      expect(triangles).assertEqual(8);
      expect(scaled).assertEqual(64);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0012 end');
    })

    /**
     * @tc.number    G3D_MESH_0013
     * @tc.name      g3dMesh0013
     * @tc.desc      8 顶点 4 维网格按 0.5 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0013 begin');
      const vertices: number = 8;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 0.5);
      expect(indices).assertEqual(32);
      expect(triangles).assertEqual(10);
      expect(scaled).assertEqual(4);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0013 end');
    })

    /**
     * @tc.number    G3D_MESH_0014
     * @tc.name      g3dMesh0014
     * @tc.desc      8 顶点 4 维网格按 1 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0014 begin');
      const vertices: number = 8;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 1);
      expect(indices).assertEqual(32);
      expect(triangles).assertEqual(10);
      expect(scaled).assertEqual(8);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0014 end');
    })

    /**
     * @tc.number    G3D_MESH_0015
     * @tc.name      g3dMesh0015
     * @tc.desc      8 顶点 4 维网格按 2 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0015 begin');
      const vertices: number = 8;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 2);
      expect(indices).assertEqual(32);
      expect(triangles).assertEqual(10);
      expect(scaled).assertEqual(16);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0015 end');
    })

    /**
     * @tc.number    G3D_MESH_0016
     * @tc.name      g3dMesh0016
     * @tc.desc      8 顶点 4 维网格按 3 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0016 begin');
      const vertices: number = 8;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 3);
      expect(indices).assertEqual(32);
      expect(triangles).assertEqual(10);
      expect(scaled).assertEqual(24);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0016 end');
    })

    /**
     * @tc.number    G3D_MESH_0017
     * @tc.name      g3dMesh0017
     * @tc.desc      8 顶点 4 维网格按 4 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0017 begin');
      const vertices: number = 8;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 4);
      expect(indices).assertEqual(32);
      expect(triangles).assertEqual(10);
      expect(scaled).assertEqual(32);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0017 end');
    })

    /**
     * @tc.number    G3D_MESH_0018
     * @tc.name      g3dMesh0018
     * @tc.desc      8 顶点 4 维网格按 8 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0018 begin');
      const vertices: number = 8;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 8);
      expect(indices).assertEqual(32);
      expect(triangles).assertEqual(10);
      expect(scaled).assertEqual(64);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0018 end');
    })

    /**
     * @tc.number    G3D_MESH_0019
     * @tc.name      g3dMesh0019
     * @tc.desc      24 顶点 2 维网格按 0.5 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0019 begin');
      const vertices: number = 24;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 0.5);
      expect(indices).assertEqual(48);
      expect(triangles).assertEqual(16);
      expect(scaled).assertEqual(12);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0019 end');
    })

    /**
     * @tc.number    G3D_MESH_0020
     * @tc.name      g3dMesh0020
     * @tc.desc      24 顶点 2 维网格按 1 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0020 begin');
      const vertices: number = 24;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 1);
      expect(indices).assertEqual(48);
      expect(triangles).assertEqual(16);
      expect(scaled).assertEqual(24);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0020 end');
    })

    /**
     * @tc.number    G3D_MESH_0021
     * @tc.name      g3dMesh0021
     * @tc.desc      24 顶点 2 维网格按 2 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0021 begin');
      const vertices: number = 24;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 2);
      expect(indices).assertEqual(48);
      expect(triangles).assertEqual(16);
      expect(scaled).assertEqual(48);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0021 end');
    })

    /**
     * @tc.number    G3D_MESH_0022
     * @tc.name      g3dMesh0022
     * @tc.desc      24 顶点 2 维网格按 3 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0022 begin');
      const vertices: number = 24;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 3);
      expect(indices).assertEqual(48);
      expect(triangles).assertEqual(16);
      expect(scaled).assertEqual(72);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0022 end');
    })

    /**
     * @tc.number    G3D_MESH_0023
     * @tc.name      g3dMesh0023
     * @tc.desc      24 顶点 2 维网格按 4 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0023 begin');
      const vertices: number = 24;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 4);
      expect(indices).assertEqual(48);
      expect(triangles).assertEqual(16);
      expect(scaled).assertEqual(96);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0023 end');
    })

    /**
     * @tc.number    G3D_MESH_0024
     * @tc.name      g3dMesh0024
     * @tc.desc      24 顶点 2 维网格按 8 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0024 begin');
      const vertices: number = 24;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 8);
      expect(indices).assertEqual(48);
      expect(triangles).assertEqual(16);
      expect(scaled).assertEqual(192);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0024 end');
    })

    /**
     * @tc.number    G3D_MESH_0025
     * @tc.name      g3dMesh0025
     * @tc.desc      24 顶点 3 维网格按 0.5 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0025 begin');
      const vertices: number = 24;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 0.5);
      expect(indices).assertEqual(72);
      expect(triangles).assertEqual(24);
      expect(scaled).assertEqual(12);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0025 end');
    })

    /**
     * @tc.number    G3D_MESH_0026
     * @tc.name      g3dMesh0026
     * @tc.desc      24 顶点 3 维网格按 1 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0026 begin');
      const vertices: number = 24;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 1);
      expect(indices).assertEqual(72);
      expect(triangles).assertEqual(24);
      expect(scaled).assertEqual(24);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0026 end');
    })

    /**
     * @tc.number    G3D_MESH_0027
     * @tc.name      g3dMesh0027
     * @tc.desc      24 顶点 3 维网格按 2 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0027 begin');
      const vertices: number = 24;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 2);
      expect(indices).assertEqual(72);
      expect(triangles).assertEqual(24);
      expect(scaled).assertEqual(48);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0027 end');
    })

    /**
     * @tc.number    G3D_MESH_0028
     * @tc.name      g3dMesh0028
     * @tc.desc      24 顶点 3 维网格按 3 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0028 begin');
      const vertices: number = 24;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 3);
      expect(indices).assertEqual(72);
      expect(triangles).assertEqual(24);
      expect(scaled).assertEqual(72);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0028 end');
    })

    /**
     * @tc.number    G3D_MESH_0029
     * @tc.name      g3dMesh0029
     * @tc.desc      24 顶点 3 维网格按 4 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0029 begin');
      const vertices: number = 24;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 4);
      expect(indices).assertEqual(72);
      expect(triangles).assertEqual(24);
      expect(scaled).assertEqual(96);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0029 end');
    })

    /**
     * @tc.number    G3D_MESH_0030
     * @tc.name      g3dMesh0030
     * @tc.desc      24 顶点 3 维网格按 8 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0030 begin');
      const vertices: number = 24;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 8);
      expect(indices).assertEqual(72);
      expect(triangles).assertEqual(24);
      expect(scaled).assertEqual(192);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0030 end');
    })

    /**
     * @tc.number    G3D_MESH_0031
     * @tc.name      g3dMesh0031
     * @tc.desc      24 顶点 4 维网格按 0.5 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0031 begin');
      const vertices: number = 24;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 0.5);
      expect(indices).assertEqual(96);
      expect(triangles).assertEqual(32);
      expect(scaled).assertEqual(12);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0031 end');
    })

    /**
     * @tc.number    G3D_MESH_0032
     * @tc.name      g3dMesh0032
     * @tc.desc      24 顶点 4 维网格按 1 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0032 begin');
      const vertices: number = 24;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 1);
      expect(indices).assertEqual(96);
      expect(triangles).assertEqual(32);
      expect(scaled).assertEqual(24);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0032 end');
    })

    /**
     * @tc.number    G3D_MESH_0033
     * @tc.name      g3dMesh0033
     * @tc.desc      24 顶点 4 维网格按 2 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0033 begin');
      const vertices: number = 24;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 2);
      expect(indices).assertEqual(96);
      expect(triangles).assertEqual(32);
      expect(scaled).assertEqual(48);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0033 end');
    })

    /**
     * @tc.number    G3D_MESH_0034
     * @tc.name      g3dMesh0034
     * @tc.desc      24 顶点 4 维网格按 3 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0034 begin');
      const vertices: number = 24;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 3);
      expect(indices).assertEqual(96);
      expect(triangles).assertEqual(32);
      expect(scaled).assertEqual(72);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0034 end');
    })

    /**
     * @tc.number    G3D_MESH_0035
     * @tc.name      g3dMesh0035
     * @tc.desc      24 顶点 4 维网格按 4 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0035 begin');
      const vertices: number = 24;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 4);
      expect(indices).assertEqual(96);
      expect(triangles).assertEqual(32);
      expect(scaled).assertEqual(96);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0035 end');
    })

    /**
     * @tc.number    G3D_MESH_0036
     * @tc.name      g3dMesh0036
     * @tc.desc      24 顶点 4 维网格按 8 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0036 begin');
      const vertices: number = 24;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 8);
      expect(indices).assertEqual(96);
      expect(triangles).assertEqual(32);
      expect(scaled).assertEqual(192);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0036 end');
    })

    /**
     * @tc.number    G3D_MESH_0037
     * @tc.name      g3dMesh0037
     * @tc.desc      36 顶点 2 维网格按 0.5 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0037 begin');
      const vertices: number = 36;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 0.5);
      expect(indices).assertEqual(72);
      expect(triangles).assertEqual(24);
      expect(scaled).assertEqual(18);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0037 end');
    })

    /**
     * @tc.number    G3D_MESH_0038
     * @tc.name      g3dMesh0038
     * @tc.desc      36 顶点 2 维网格按 1 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0038 begin');
      const vertices: number = 36;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 1);
      expect(indices).assertEqual(72);
      expect(triangles).assertEqual(24);
      expect(scaled).assertEqual(36);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0038 end');
    })

    /**
     * @tc.number    G3D_MESH_0039
     * @tc.name      g3dMesh0039
     * @tc.desc      36 顶点 2 维网格按 2 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0039 begin');
      const vertices: number = 36;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 2);
      expect(indices).assertEqual(72);
      expect(triangles).assertEqual(24);
      expect(scaled).assertEqual(72);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0039 end');
    })

    /**
     * @tc.number    G3D_MESH_0040
     * @tc.name      g3dMesh0040
     * @tc.desc      36 顶点 2 维网格按 3 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0040 begin');
      const vertices: number = 36;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 3);
      expect(indices).assertEqual(72);
      expect(triangles).assertEqual(24);
      expect(scaled).assertEqual(108);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0040 end');
    })

    /**
     * @tc.number    G3D_MESH_0041
     * @tc.name      g3dMesh0041
     * @tc.desc      36 顶点 2 维网格按 4 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0041 begin');
      const vertices: number = 36;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 4);
      expect(indices).assertEqual(72);
      expect(triangles).assertEqual(24);
      expect(scaled).assertEqual(144);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0041 end');
    })

    /**
     * @tc.number    G3D_MESH_0042
     * @tc.name      g3dMesh0042
     * @tc.desc      36 顶点 2 维网格按 8 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0042 begin');
      const vertices: number = 36;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 8);
      expect(indices).assertEqual(72);
      expect(triangles).assertEqual(24);
      expect(scaled).assertEqual(288);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0042 end');
    })

    /**
     * @tc.number    G3D_MESH_0043
     * @tc.name      g3dMesh0043
     * @tc.desc      36 顶点 3 维网格按 0.5 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0043 begin');
      const vertices: number = 36;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 0.5);
      expect(indices).assertEqual(108);
      expect(triangles).assertEqual(36);
      expect(scaled).assertEqual(18);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0043 end');
    })

    /**
     * @tc.number    G3D_MESH_0044
     * @tc.name      g3dMesh0044
     * @tc.desc      36 顶点 3 维网格按 1 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0044 begin');
      const vertices: number = 36;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 1);
      expect(indices).assertEqual(108);
      expect(triangles).assertEqual(36);
      expect(scaled).assertEqual(36);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0044 end');
    })

    /**
     * @tc.number    G3D_MESH_0045
     * @tc.name      g3dMesh0045
     * @tc.desc      36 顶点 3 维网格按 2 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0045 begin');
      const vertices: number = 36;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 2);
      expect(indices).assertEqual(108);
      expect(triangles).assertEqual(36);
      expect(scaled).assertEqual(72);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0045 end');
    })

    /**
     * @tc.number    G3D_MESH_0046
     * @tc.name      g3dMesh0046
     * @tc.desc      36 顶点 3 维网格按 3 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0046 begin');
      const vertices: number = 36;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 3);
      expect(indices).assertEqual(108);
      expect(triangles).assertEqual(36);
      expect(scaled).assertEqual(108);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0046 end');
    })

    /**
     * @tc.number    G3D_MESH_0047
     * @tc.name      g3dMesh0047
     * @tc.desc      36 顶点 3 维网格按 4 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0047 begin');
      const vertices: number = 36;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 4);
      expect(indices).assertEqual(108);
      expect(triangles).assertEqual(36);
      expect(scaled).assertEqual(144);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0047 end');
    })

    /**
     * @tc.number    G3D_MESH_0048
     * @tc.name      g3dMesh0048
     * @tc.desc      36 顶点 3 维网格按 8 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0048 begin');
      const vertices: number = 36;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 8);
      expect(indices).assertEqual(108);
      expect(triangles).assertEqual(36);
      expect(scaled).assertEqual(288);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0048 end');
    })

    /**
     * @tc.number    G3D_MESH_0049
     * @tc.name      g3dMesh0049
     * @tc.desc      36 顶点 4 维网格按 0.5 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0049 begin');
      const vertices: number = 36;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 0.5);
      expect(indices).assertEqual(144);
      expect(triangles).assertEqual(48);
      expect(scaled).assertEqual(18);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0049 end');
    })

    /**
     * @tc.number    G3D_MESH_0050
     * @tc.name      g3dMesh0050
     * @tc.desc      36 顶点 4 维网格按 1 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0050 begin');
      const vertices: number = 36;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 1);
      expect(indices).assertEqual(144);
      expect(triangles).assertEqual(48);
      expect(scaled).assertEqual(36);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0050 end');
    })

    /**
     * @tc.number    G3D_MESH_0051
     * @tc.name      g3dMesh0051
     * @tc.desc      36 顶点 4 维网格按 2 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0051 begin');
      const vertices: number = 36;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 2);
      expect(indices).assertEqual(144);
      expect(triangles).assertEqual(48);
      expect(scaled).assertEqual(72);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0051 end');
    })

    /**
     * @tc.number    G3D_MESH_0052
     * @tc.name      g3dMesh0052
     * @tc.desc      36 顶点 4 维网格按 3 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0052 begin');
      const vertices: number = 36;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 3);
      expect(indices).assertEqual(144);
      expect(triangles).assertEqual(48);
      expect(scaled).assertEqual(108);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0052 end');
    })

    /**
     * @tc.number    G3D_MESH_0053
     * @tc.name      g3dMesh0053
     * @tc.desc      36 顶点 4 维网格按 4 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0053 begin');
      const vertices: number = 36;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 4);
      expect(indices).assertEqual(144);
      expect(triangles).assertEqual(48);
      expect(scaled).assertEqual(144);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0053 end');
    })

    /**
     * @tc.number    G3D_MESH_0054
     * @tc.name      g3dMesh0054
     * @tc.desc      36 顶点 4 维网格按 8 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0054 begin');
      const vertices: number = 36;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 8);
      expect(indices).assertEqual(144);
      expect(triangles).assertEqual(48);
      expect(scaled).assertEqual(288);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0054 end');
    })

    /**
     * @tc.number    G3D_MESH_0055
     * @tc.name      g3dMesh0055
     * @tc.desc      48 顶点 2 维网格按 0.5 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0055 begin');
      const vertices: number = 48;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 0.5);
      expect(indices).assertEqual(96);
      expect(triangles).assertEqual(32);
      expect(scaled).assertEqual(24);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0055 end');
    })

    /**
     * @tc.number    G3D_MESH_0056
     * @tc.name      g3dMesh0056
     * @tc.desc      48 顶点 2 维网格按 1 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0056 begin');
      const vertices: number = 48;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 1);
      expect(indices).assertEqual(96);
      expect(triangles).assertEqual(32);
      expect(scaled).assertEqual(48);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0056 end');
    })

    /**
     * @tc.number    G3D_MESH_0057
     * @tc.name      g3dMesh0057
     * @tc.desc      48 顶点 2 维网格按 2 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0057 begin');
      const vertices: number = 48;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 2);
      expect(indices).assertEqual(96);
      expect(triangles).assertEqual(32);
      expect(scaled).assertEqual(96);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0057 end');
    })

    /**
     * @tc.number    G3D_MESH_0058
     * @tc.name      g3dMesh0058
     * @tc.desc      48 顶点 2 维网格按 3 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0058 begin');
      const vertices: number = 48;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 3);
      expect(indices).assertEqual(96);
      expect(triangles).assertEqual(32);
      expect(scaled).assertEqual(144);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0058 end');
    })

    /**
     * @tc.number    G3D_MESH_0059
     * @tc.name      g3dMesh0059
     * @tc.desc      48 顶点 2 维网格按 4 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0059 begin');
      const vertices: number = 48;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 4);
      expect(indices).assertEqual(96);
      expect(triangles).assertEqual(32);
      expect(scaled).assertEqual(192);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0059 end');
    })

    /**
     * @tc.number    G3D_MESH_0060
     * @tc.name      g3dMesh0060
     * @tc.desc      48 顶点 2 维网格按 8 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0060 begin');
      const vertices: number = 48;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 8);
      expect(indices).assertEqual(96);
      expect(triangles).assertEqual(32);
      expect(scaled).assertEqual(384);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0060 end');
    })

    /**
     * @tc.number    G3D_MESH_0061
     * @tc.name      g3dMesh0061
     * @tc.desc      48 顶点 3 维网格按 0.5 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0061 begin');
      const vertices: number = 48;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 0.5);
      expect(indices).assertEqual(144);
      expect(triangles).assertEqual(48);
      expect(scaled).assertEqual(24);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0061 end');
    })

    /**
     * @tc.number    G3D_MESH_0062
     * @tc.name      g3dMesh0062
     * @tc.desc      48 顶点 3 维网格按 1 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0062 begin');
      const vertices: number = 48;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 1);
      expect(indices).assertEqual(144);
      expect(triangles).assertEqual(48);
      expect(scaled).assertEqual(48);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0062 end');
    })

    /**
     * @tc.number    G3D_MESH_0063
     * @tc.name      g3dMesh0063
     * @tc.desc      48 顶点 3 维网格按 2 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0063 begin');
      const vertices: number = 48;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 2);
      expect(indices).assertEqual(144);
      expect(triangles).assertEqual(48);
      expect(scaled).assertEqual(96);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0063 end');
    })

    /**
     * @tc.number    G3D_MESH_0064
     * @tc.name      g3dMesh0064
     * @tc.desc      48 顶点 3 维网格按 3 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0064 begin');
      const vertices: number = 48;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 3);
      expect(indices).assertEqual(144);
      expect(triangles).assertEqual(48);
      expect(scaled).assertEqual(144);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0064 end');
    })

    /**
     * @tc.number    G3D_MESH_0065
     * @tc.name      g3dMesh0065
     * @tc.desc      48 顶点 3 维网格按 4 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0065 begin');
      const vertices: number = 48;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 4);
      expect(indices).assertEqual(144);
      expect(triangles).assertEqual(48);
      expect(scaled).assertEqual(192);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0065 end');
    })

    /**
     * @tc.number    G3D_MESH_0066
     * @tc.name      g3dMesh0066
     * @tc.desc      48 顶点 3 维网格按 8 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0066 begin');
      const vertices: number = 48;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 8);
      expect(indices).assertEqual(144);
      expect(triangles).assertEqual(48);
      expect(scaled).assertEqual(384);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0066 end');
    })

    /**
     * @tc.number    G3D_MESH_0067
     * @tc.name      g3dMesh0067
     * @tc.desc      48 顶点 4 维网格按 0.5 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0067 begin');
      const vertices: number = 48;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 0.5);
      expect(indices).assertEqual(192);
      expect(triangles).assertEqual(64);
      expect(scaled).assertEqual(24);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0067 end');
    })

    /**
     * @tc.number    G3D_MESH_0068
     * @tc.name      g3dMesh0068
     * @tc.desc      48 顶点 4 维网格按 1 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0068 begin');
      const vertices: number = 48;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 1);
      expect(indices).assertEqual(192);
      expect(triangles).assertEqual(64);
      expect(scaled).assertEqual(48);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0068 end');
    })

    /**
     * @tc.number    G3D_MESH_0069
     * @tc.name      g3dMesh0069
     * @tc.desc      48 顶点 4 维网格按 2 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0069 begin');
      const vertices: number = 48;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 2);
      expect(indices).assertEqual(192);
      expect(triangles).assertEqual(64);
      expect(scaled).assertEqual(96);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0069 end');
    })

    /**
     * @tc.number    G3D_MESH_0070
     * @tc.name      g3dMesh0070
     * @tc.desc      48 顶点 4 维网格按 3 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0070 begin');
      const vertices: number = 48;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 3);
      expect(indices).assertEqual(192);
      expect(triangles).assertEqual(64);
      expect(scaled).assertEqual(144);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0070 end');
    })

    /**
     * @tc.number    G3D_MESH_0071
     * @tc.name      g3dMesh0071
     * @tc.desc      48 顶点 4 维网格按 4 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0071 begin');
      const vertices: number = 48;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 4);
      expect(indices).assertEqual(192);
      expect(triangles).assertEqual(64);
      expect(scaled).assertEqual(192);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0071 end');
    })

    /**
     * @tc.number    G3D_MESH_0072
     * @tc.name      g3dMesh0072
     * @tc.desc      48 顶点 4 维网格按 8 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0072 begin');
      const vertices: number = 48;
      const dims: number = 4;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 8);
      expect(indices).assertEqual(192);
      expect(triangles).assertEqual(64);
      expect(scaled).assertEqual(384);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0072 end');
    })

    /**
     * @tc.number    G3D_MESH_0073
     * @tc.name      g3dMesh0073
     * @tc.desc      96 顶点 2 维网格按 0.5 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0073 begin');
      const vertices: number = 96;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 0.5);
      expect(indices).assertEqual(192);
      expect(triangles).assertEqual(64);
      expect(scaled).assertEqual(48);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0073 end');
    })

    /**
     * @tc.number    G3D_MESH_0074
     * @tc.name      g3dMesh0074
     * @tc.desc      96 顶点 2 维网格按 1 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0074 begin');
      const vertices: number = 96;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 1);
      expect(indices).assertEqual(192);
      expect(triangles).assertEqual(64);
      expect(scaled).assertEqual(96);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0074 end');
    })

    /**
     * @tc.number    G3D_MESH_0075
     * @tc.name      g3dMesh0075
     * @tc.desc      96 顶点 2 维网格按 2 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0075 begin');
      const vertices: number = 96;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 2);
      expect(indices).assertEqual(192);
      expect(triangles).assertEqual(64);
      expect(scaled).assertEqual(192);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0075 end');
    })

    /**
     * @tc.number    G3D_MESH_0076
     * @tc.name      g3dMesh0076
     * @tc.desc      96 顶点 2 维网格按 3 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0076 begin');
      const vertices: number = 96;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 3);
      expect(indices).assertEqual(192);
      expect(triangles).assertEqual(64);
      expect(scaled).assertEqual(288);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0076 end');
    })

    /**
     * @tc.number    G3D_MESH_0077
     * @tc.name      g3dMesh0077
     * @tc.desc      96 顶点 2 维网格按 4 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0077 begin');
      const vertices: number = 96;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 4);
      expect(indices).assertEqual(192);
      expect(triangles).assertEqual(64);
      expect(scaled).assertEqual(384);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0077 end');
    })

    /**
     * @tc.number    G3D_MESH_0078
     * @tc.name      g3dMesh0078
     * @tc.desc      96 顶点 2 维网格按 8 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0078 begin');
      const vertices: number = 96;
      const dims: number = 2;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 8);
      expect(indices).assertEqual(192);
      expect(triangles).assertEqual(64);
      expect(scaled).assertEqual(768);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0078 end');
    })

    /**
     * @tc.number    G3D_MESH_0079
     * @tc.name      g3dMesh0079
     * @tc.desc      96 顶点 3 维网格按 0.5 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0079 begin');
      const vertices: number = 96;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 0.5);
      expect(indices).assertEqual(288);
      expect(triangles).assertEqual(96);
      expect(scaled).assertEqual(48);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0079 end');
    })

    /**
     * @tc.number    G3D_MESH_0080
     * @tc.name      g3dMesh0080
     * @tc.desc      96 顶点 3 维网格按 1 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0080 begin');
      const vertices: number = 96;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 1);
      expect(indices).assertEqual(288);
      expect(triangles).assertEqual(96);
      expect(scaled).assertEqual(96);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0080 end');
    })

    /**
     * @tc.number    G3D_MESH_0081
     * @tc.name      g3dMesh0081
     * @tc.desc      96 顶点 3 维网格按 2 倍缩放的索引与三角面推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dMesh0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0081 begin');
      const vertices: number = 96;
      const dims: number = 3;
      const indices: number = vertices * dims;
      const triangles: number = Math.floor(indices / 3);
      const scaled: number = Math.round(vertices * 2);
      expect(indices).assertEqual(288);
      expect(triangles).assertEqual(96);
      expect(scaled).assertEqual(192);
      expect(triangles * 3 <= indices).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dMesh0081 end');
    })
  })
}

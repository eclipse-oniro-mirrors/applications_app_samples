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
import { Scene, SceneResourceFactory, Node, NodeType, Camera } from '@kit.ArkGraphics3D';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Graphics3d]';

export default function g3dApiSmokeTest(): void {
  describe('G3dApiSmoke', () => {
    /**
     * @tc.number G3D_API_0001
     * @tc.name g3d_api_model_and_camera
     * @tc.desc 真实业务 GLB 加载、节点可达及相机属性读写，finally 销毁 native 场景
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('g3d_api_model_and_camera', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3d_api_model_and_camera begin');
      let scene: Scene | undefined = undefined;
      try {
        scene = await Scene.load($rawfile('gltf/DamagedHelmet/glTF/DamagedHelmet.glb'));
        const root: Node | null = scene.root;
        hilog.info(DOMAIN, TAG, '模型 root=%{public}s children=%{public}d', root?.name, root?.children.count());
        expect(root !== null).assertTrue();
        if (root === null) {
          throw new Error('业务 GLB 未生成根节点');
        }
        expect(root.children.count() > 0).assertTrue();
        const model: Node | null = scene.getNodeByPath('rootNode_/Scene/node_damagedHelmet_-6514');
        hilog.info(DOMAIN, TAG, '业务模型 path=%{public}s', model?.path);
        expect(model !== null).assertTrue();
        const factory: SceneResourceFactory = scene.getResourceFactory();
        const camera: Camera = await factory.createCamera({ name: 'SmokeCamera' });
        // 工厂创建的节点先挂入场景树，场景路径查询才有明确的可达前提。
        root.children.append(camera);
        hilog.info(DOMAIN, TAG, 'attached name=%{public}s parent=%{public}s path=%{public}s',
          camera.name, camera.parent?.name, camera.path);
        expect(camera.name).assertEqual('SmokeCamera');
        expect(camera.parent?.name).assertEqual(root.name);
        camera.position = { x: 0, y: 0, z: 5 };
        camera.fov = Math.PI / 3;
        camera.nearPlane = 0.1;
        camera.farPlane = 100;
        camera.enabled = true;
        hilog.info(DOMAIN, TAG, 'camera=%{public}s position=%{public}s fov=%{public}s near=%{public}s far=%{public}s',
          camera.path, JSON.stringify(camera.position), String(camera.fov), String(camera.nearPlane), String(camera.farPlane));
        expect(camera.nodeType).assertEqual(NodeType.CAMERA);
        expect(camera.position.z).assertEqual(5);
        expect(Math.abs(camera.fov - Math.PI / 3) < 0.0001).assertTrue();
        expect(Math.abs(camera.nearPlane - 0.1) < 0.0001).assertTrue();
        expect(camera.farPlane).assertEqual(100);
        expect(camera.enabled).assertTrue();
        // 本机返回的 camera.path 仅含根路径；按实际挂接的父子名称查询目标节点。
        const cameraPath: string = root.name + '/' + camera.name;
        const found: Node | null = scene.getNodeByPath(cameraPath, NodeType.CAMERA);
        hilog.info(DOMAIN, TAG, '相机反查 path=%{public}s name=%{public}s', cameraPath, found?.name);
        expect(found?.name).assertEqual('SmokeCamera');
        camera.enabled = false;
        hilog.info(DOMAIN, TAG, 'disabled=%{public}s', String(camera.enabled));
        expect(camera.enabled).assertFalse();
      } finally {
        try {
          scene?.destroy();
        } finally {
          hilog.info(DOMAIN, TAG, '%{public}s', 'g3d_api_model_and_camera end');
        }
      }
    });

    /**
     * @tc.number G3D_API_0002
     * @tc.name g3d_api_native_node_container
     * @tc.desc 真实节点工厂与 children 的追加、头部插入、移除、清空
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('g3d_api_native_node_container', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3d_api_native_node_container begin');
      let scene: Scene | undefined = undefined;
      try {
        scene = await Scene.load();
        const factory: SceneResourceFactory = scene.getResourceFactory();
        const parent: Node = await factory.createNode({ name: 'SmokeParent' });
        const first: Node = await factory.createNode({ name: 'SmokeFirst' });
        const second: Node = await factory.createNode({ name: 'SmokeSecond' });
        parent.children.append(first);
        hilog.info(DOMAIN, TAG, 'append count=%{public}d child=%{public}s',
          parent.children.count(), parent.children.get(0)?.name);
        expect(parent.children.count()).assertEqual(1);
        expect(parent.children.get(0)?.name).assertEqual('SmokeFirst');
        expect(first.parent?.name).assertEqual('SmokeParent');
        parent.children.insertAfter(second, null);
        hilog.info(DOMAIN, TAG, 'insert count=%{public}d first=%{public}s second=%{public}s',
          parent.children.count(), parent.children.get(0)?.name, parent.children.get(1)?.name);
        expect(parent.children.count()).assertEqual(2);
        expect(parent.children.get(0)?.name).assertEqual('SmokeSecond');
        expect(parent.children.get(1)?.name).assertEqual('SmokeFirst');
        parent.children.remove(second);
        hilog.info(DOMAIN, TAG, 'remove count=%{public}d child=%{public}s',
          parent.children.count(), parent.children.get(0)?.name);
        expect(parent.children.count()).assertEqual(1);
        expect(parent.children.get(0)?.name).assertEqual('SmokeFirst');
        parent.children.clear();
        hilog.info(DOMAIN, TAG, 'clear count=%{public}d', parent.children.count());
        expect(parent.children.count()).assertEqual(0);
      } finally {
        try {
          scene?.destroy();
        } finally {
          hilog.info(DOMAIN, TAG, '%{public}s', 'g3d_api_native_node_container end');
        }
      }
    });
  });
}

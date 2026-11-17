/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';

import { Scene, Camera, Material, SceneResourceFactory, Geometry, EnvironmentBackgroundType, PostProcessSettings,
  ToneMappingType, PlaneGeometry, MeshResource, CullMode, MaterialType } from '@kit.ArkGraphics3D';
import {lookAt, OrbitCameraHelper } from '../common/utils';

@Entry
@Component
struct material_cullmode {
  scene: Scene | null = null;
  @State sceneOpt: SceneOptions | null = null;
  cam: Camera | null = null;
  orbitCamera: OrbitCameraHelper = new OrbitCameraHelper();
  material: Material | null = null;

  onPageShow(): void {
    this.Init();
  }

  aboutToDisappear(): void {
    if (this.scene) {
      this.scene.destroy();
    }
    this.cam = null;
    this.scene = null;
  }

  Init(): void {
    if (this.scene == null) {
      // 加载一个空场景（用于承载生成的平面）
      Scene.load()
        .then(async (scene: Scene) => {
          this.scene = scene;
          if (!this.scene.root) {
            return;
          }
          let rf: SceneResourceFactory = scene.getResourceFactory();
          // 创建一个平面几何体及其网格
          let planeGeom: PlaneGeometry = new PlaneGeometry();
          planeGeom.size = {x: 1.3, y: 1};
          let meshRes: MeshResource = await rf.createMesh({name: 'planeMesh'}, planeGeom);
          let plane: Geometry = await rf.createGeometry({name: 'plane'}, meshRes);
          // 创建一个着色器材质并绑定到平面
          this.material = await rf.createMaterial({name: 'planeMat'}, MaterialType.SHADER);
          plane.mesh.subMeshes[0].material = this.material;

          // 创建基于图像的光照环境
          scene.environment = await rf.createEnvironment({ name: 'env' });
          scene.environment.backgroundType = EnvironmentBackgroundType.BACKGROUND_CUBEMAP;
          scene.environment.environmentImage = await rf.createImage({ name: 'cube', uri: $rawfile('Environment/quarry_02_2k_skybox.ktx') });
          scene.environment.radianceImage = await rf.createImage({ name: 'rad', uri: $rawfile('Environment/quarry_02_2k_radiance.ktx') });
          scene.environment.irradianceCoefficients =
            [{ x: 1.080343842506409, y: 0.936282396316528, z: 0.665518164634705 },
              { x: 0.959947884082794, y: 0.828918874263763, z: 0.569704353809357 },
              { x: 0.848236382007599, y: 0.715092182159424, z: 0.473145037889481 },
              { x: -0.591795265674591, y: -0.501678705215454, z: -0.334018945693970 },
              { x: -0.775423347949982, y: -0.655484378337860, z: -0.437325984239578 },
              { x: 1.053589701652527, y: 0.887459456920624, z: 0.587381422519684 },
              { x: -0.018954016268253, y: -0.014871496707201, z: -0.008891185745597 },
              { x: -0.566255271434784, y: -0.476870059967041, z: -0.314557582139969 },
              { x: -0.239390164613724, y: -0.200478553771973, z: -0.132790848612785 }];
          // 创建并设置相机以查看场景，并启用轨道控制
          this.cam = await rf.createCamera({ name: 'CullCam' });
          this.cam.enabled = true;
          lookAt(this.cam,{x:0,y:0,z:-3},{x:0,y:0,z:0},{x:0,y:1,z:0});
          this.sceneOpt = { scene: this.scene, modelType: ModelType.SURFACE } as SceneOptions;
          this.orbitCamera.SetOrbitFromEye(this.cam.position, this.scene.root.position, this.cam.rotation);
          // 启用色调映射以获得更好的 HDR 显示效果
          (this.cam.postProcess as PostProcessSettings) = {
            toneMapping: {
              type: ToneMappingType.ACES,
              exposure: 0.7,
            }
          };
        });
    }
  }

  // 禁用面剔除
  setCullNone(): void {
    if (this.material) {
      this.material.cullMode = CullMode.NONE;
    }
  }

  // 剔除正面
  setCullFront(): void {
    if (this.material) {
      this.material.cullMode = CullMode.FRONT;
    }
  }

  // 剔除背面（默认模式）
  setCullBack(): void {
    if (this.material) {
      this.material.cullMode = CullMode.BACK;
    }
  }

  build() {
    Column() {
      if (this.sceneOpt) {
        // 通过 Component3D 呈现 3D 场景
        Component3D(this.sceneOpt)
          .onTouch((event: TouchEvent) => {
            // 处理触摸输入以实现轨道相机旋转
            this.orbitCamera.HandleTouchEvent(event);
            if (this.cam) {
              this.cam.position = this.orbitCamera.GetCameraPosition();
              this.cam.rotation = this.orbitCamera.GetCameraRotation();
            }
          })
          .gesture(
            PinchGesture({ fingers: 2 })
              .onActionStart((event: GestureEvent) => {
                console.info('Pinch start');
              })
              .onActionUpdate((event: GestureEvent) => {
                // 处理捏合手势以实现相机缩放
                this.orbitCamera.HandlePinchGestureActionUpdate(event);
                if (this.cam) {
                  this.cam.position = this.orbitCamera.GetCameraPosition();
                  this.cam.rotation = this.orbitCamera.GetCameraRotation();
                }
              })
              .onActionEnd(() => {
                this.orbitCamera.HandlePinchGestureActionEnd();
              }))
      } else {
        Text('loading ...');
      }

      Text('Cull mode demo');
      Button('No culling').onClick(() => this.setCullNone());
      Button('Front face culling').onClick(() => this.setCullFront());
      Button('Back face culling').onClick(() => this.setCullBack());

      Button('back').onClick(() => {
        router.back();
      });
    }.width('100%').height('70%');
  }
}
'use static'
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

import { Camera, Environment, Geometry, Image, Material, MaterialType, Scene, SceneResourceFactory,
  SceneResourceParameters, Shader, ShaderMaterial, EnvironmentBackgroundType } from '@kit.ArkGraphics3D';
import router from '@ohos.router';
import { Component3D, Column, Row, Button, Text, Component, Entry, $rawfile, SceneOptions, ModelType } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

let globalScene: Scene | null = null;

// [Start create_material_promise]
function createMaterialPromise(): Promise<Material> {
  // 确保在访问 sceneFactory 之前场景已加载完成
  if (!globalScene) {
    throw new Error('Scene is not loaded yet.');
  }

  let sceneFactory = globalScene!.getResourceFactory();
  let sceneMaterialParameter: SceneResourceParameters = { name: 'material' };
  // 创建材质
  return sceneFactory.createMaterial(sceneMaterialParameter, MaterialType.SHADER);
}
// [End create_material_promise]

// [Start create_shader_promise]
function createShaderPromise(): Promise<Shader> {
  // 确保在访问 sceneFactory 之前场景已加载完成
  if (!globalScene) {
    throw new Error('Scene is not loaded yet.');
  }

  let sceneFactory: SceneResourceFactory = globalScene!.getResourceFactory();
  // 创建shader资源（通过SceneResourceParameters配置），路径和文件名可根据项目实际资源自定义
  let sceneShaderParameter: SceneResourceParameters = {
    name: 'shaderResource',
    uri: $rawfile('shaders/custom_shader/custom_material_sample.shader')
  };
  return sceneFactory.createShader(sceneShaderParameter);
}
// [End create_shader_promise]

// [Start create_image_promise]
function createImagePromise(): Promise<Image> {
  // 确保在访问 sceneFactory 之前场景已加载完成
  if (!globalScene) {
    throw new Error('Scene is not loaded yet.');
  }

  let sceneFactory: SceneResourceFactory = globalScene!.getResourceFactory();
  let sceneImageParameter: SceneResourceParameters = {
    name: 'image',
    uri: $rawfile('image/Cube_BaseColor.png')
  };

  return sceneFactory.createImage(sceneImageParameter);
}
// [End create_image_promise]

// [Start create_environment_promise]
async function createEnvironmentPromise(): Promise<Environment> {
  // 确保在访问 sceneFactory 之前场景已加载完成
  if (!globalScene) {
    throw new Error('Scene is not loaded yet.');
  }

  try {
    let sceneFactory: SceneResourceFactory = globalScene!.getResourceFactory();
    // 加载环境贴图资源，路径和文件名可根据项目实际资源自定义，支持资源类型包括.ktx、.jpg、.png等
    let sceneImageParameter: SceneResourceParameters = { name: 'image', uri: $rawfile('image/Cube_BaseColor.png') };
    let imageEntity = await sceneFactory.createImage(sceneImageParameter);
    // 创建环境
    let sceneEnvironmentParameter: SceneResourceParameters = { name: 'env' };
    let envEntity = await sceneFactory.createEnvironment(sceneEnvironmentParameter);

    envEntity.backgroundType = EnvironmentBackgroundType.BACKGROUND_EQUIRECTANGULAR;
    // 设置环境相关属性
    envEntity.environmentImage = imageEntity;
    envEntity.indirectDiffuseFactor.x = 1;
    envEntity.indirectDiffuseFactor.y = 1;
    envEntity.indirectDiffuseFactor.z = 1;
    return envEntity;
  } catch (error) {
    if (error instanceof Error) {
      throw error;
    }
    throw new Error('Failed to create environment: ${String(error)}')
  }
}
// [End create_environment_promise]

@Entry
@Component
struct materialPage {
  scene: Scene | null = null;
  @State sceneOpt: SceneOptions | undefined = undefined;
  rf: SceneResourceFactory | null = null;
  cam: Camera | null = null;
  shader: Shader | null = null;
  material: ShaderMaterial | null = null;
  geom: Geometry | null = null;
  image: Image | null = null;
  originalMat: ShaderMaterial | null = null;
  blankMat: Material | null = null;
  shaderMat: ShaderMaterial | null = null;
  imageMat: ShaderMaterial | null = null;
  env: Environment | null = null;

  aboutToAppear(): void {
    this.init();
  }

  aboutToDisappear(): void {
    if (this.scene) {
      this.scene!.destroy();
    }
    this.scene = null;
    this.rf = null;
    this.cam = null;
    this.shader = null;
    this.material = null;
    this.geom = null;
    this.image = null;
    this.originalMat = null;
    this.blankMat = null;
    this.shaderMat = null;
    this.imageMat = null;
    this.env = null;
    globalScene = null;
  }

  init(): void {
    // [Start scene_load_init]
    if (this.scene === null) {
      // 加载场景资源，支持.gltf和.glb格式，路径和文件名可根据项目实际资源自定义
      Scene.load($rawfile('gltf/CubeWithFloor/glTF/AnimatedCube.glb'))
        .then(async (result: Scene) => {
          // 全局保存已加载的场景，以便复用
          globalScene = result;
          this.scene = result;
          this.sceneOpt = { scene: this.scene!, modelType: ModelType.SURFACE } as SceneOptions;
          this.rf = this.scene!.getResourceFactory();
          // [StartExclude scene_load_init]
          // [Start scene_camera_init]
          this.cam = await this.rf!.createCamera({ 'name': 'Camera1' });
          this.cam!.enabled = true;
          this.cam!.position.z = 5;
          // [End scene_camera_init]
          // 创建几何对象
          // [Start geometry_node_get]
          this.geom = this.scene!.getNodeByPath('rootNode_/Unnamed Node 1/AnimatedCube') as Geometry;

          // 记录原始材质
          this.originalMat = this.geom!.mesh.subMeshes[0].material as ShaderMaterial;
          // [End geometry_node_get]
          // [EndExclude scene_load_init]
        })
        .catch((error: Error) => {
          console.error('init error: ' + error + '.');
        });
    }
    // [End scene_load_init]
  }

  build() {
    Row() {
      Column() {
        Column() {
          if (this.sceneOpt) {
            Component3D(this.sceneOpt);
          } else {
            Text('Loading...');
          }
        }
        .height('30%');

        // [Start material_button_action]
        Button('Replace with a blank material')
          // [StartExclude material_button_action]
          .id('material')
          .margin({ top: 80, left: 6 })
          .width('60%')
          .height(40)
          // [EndExclude material_button_action]
          .onClick(() => {
            console.info('Start to replace with a blank material');
            (async () => {
              if (!this.blankMat) {
                this.blankMat = await createMaterialPromise();
              }
              if (!this.scene || !this.rf) {
                return;
              }
              this.geom = this.scene!.getNodeByPath('rootNode_/Unnamed Node 1/AnimatedCube') as Geometry;
              this.geom!.mesh.materialOverride = undefined;
              if (this.blankMat) {
                this.geom!.mesh.subMeshes[0].material = this.blankMat!;
              }
            })().catch(error => {
              console.error('Failed to create blank material:', error);
            });
          })

        Button('Replace with a Shader material')
          // [StartExclude material_button_action]
          .id('shader')
          .margin({ top: 20, left: 6 })
          .width('60%')
          .height(40)
          // [EndExclude material_button_action]
          .onClick(() => {
            console.info('Start to replace with a shader material');
            (async () => {
              if (!this.shader) {
                this.shader = await createShaderPromise();
              }
              if (!this.scene || !this.rf) {
                return;
              }
              if (!this.shaderMat) {
                let rf = this.scene!.getResourceFactory();
                this.shaderMat = await rf.createMaterial({ name: 'shaderMat' }, MaterialType.SHADER) as ShaderMaterial;
              }
              if (this.shader) {
                this.shaderMat!.colorShader = this.shader!;
              }
              this.geom = this.scene!.getNodeByPath('rootNode_/Unnamed Node 1/AnimatedCube') as Geometry;
              this.geom!.mesh.materialOverride = undefined;
              if (this.shaderMat) {
                this.geom!.mesh.subMeshes[0].material = this.shaderMat as Material;
              }
            })().catch(error => {
              console.error('Failed to create shader material:', error);
            });
          })
        // [End material_button_action]

        // [Start replace_with_image_material]
        Button('Replace with a Image material')
          // [StartExclude replace_with_image_material]
          .id('image')
          .margin({ top: 20, left: 6 })
          .width('60%')
          .height(40)
          // [EndExclude replace_with_image_material]
          .onClick(() => {
            console.info('Start to replace with a material of image');
            (async () => {
              if (!this.scene || !this.cam || !this.rf) {
                return;
              }

              // 创建shader
              this.shader = await this.rf!.createShader({
                name: 'shaderResource',
                uri: $rawfile('shaders/custom_shader/custom_material_sample.shader')
              });

              // 创建材质
              this.imageMat = await this.rf!.createMaterial({ name: 'imageMat' }, MaterialType.SHADER) as ShaderMaterial;

              // 绑定shader到纹理上
              this.imageMat!.colorShader = this.shader!;
              let createdImage = await createImagePromise();
              if (createdImage) {
                this.imageMat!.colorShader!.inputs['BASE_COLOR_Image'] = createdImage;
              }

              this.geom = this.scene!.getNodeByPath('rootNode_/Unnamed Node 1/AnimatedCube') as Geometry;

              this.geom!.mesh.materialOverride = undefined;
              this.geom!.mesh.subMeshes[0].material = this.imageMat as Material;
            })().catch(error => {
              console.error('Failed to create image material:', error);
            });
          })
        // [End replace_with_image_material]

        // [Start environment_button_action]
        Button('Add to Environment')
          // [StartExclude environment_button_action]
          .id('env')
          .margin({ top: 20, left: 6 })
          .width('60%')
          .height(40)
          // [EndExclude environment_button_action]
          .onClick(() => {
            console.info('Start to replace with a material of image');
            (async () => {
              if (!this.scene || !this.cam) {
                return;
              }
              this.env = await createEnvironmentPromise();
              if (this.env) {
                this.scene!.environment = this.env!;
              }
            })().catch(error => {
              console.error('Failed to create environment:', error);
            });
          })
        // [End environment_button_action]

        Button('back')
          .id('back')
          .margin({ top: 20, left: 6 })
          .width('60%')
          .height(40)
          .onClick(() => {
            this.getUIContext().getRouter().back();
          })
      }
      .width('100%');
    }
    .height('100%');
  }
}

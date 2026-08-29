/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

// [Start resource_header]
import { Camera, Environment, Geometry, Image, Material, MaterialType, Scene, SceneResourceFactory,
    SceneResourceParameters, Shader, ShaderMaterial, EnvironmentBackgroundType } from '@kit.ArkGraphics3D';
  // [End resource_header]
  import { router } from '@kit.ArkUI';
  
  let globalScene: Scene | null = null;
  
  // [Start create_material_promise]
  function createMaterialPromise(): Promise<Material> {
    // Ensure the scene is loaded before accessing sceneFactory
    if (!globalScene) {
      return Promise.reject(new Error('Scene is not loaded yet.'));
    }
    let sceneFactory: SceneResourceFactory = globalScene.getResourceFactory();
    let sceneMaterialParameter: SceneResourceParameters = { name: 'material' };
    // Create Material
    return sceneFactory.createMaterial(sceneMaterialParameter, MaterialType.SHADER);
  }
  // [End create_material_promise]
  
  // [Start create_shader_promise]
  function createShaderPromise(): Promise<Shader> {
    // Ensure the scene is loaded before accessing sceneFactory
    if (!globalScene) {
      return Promise.reject(new Error('Scene is not loaded yet.'));
    }
    let sceneFactory: SceneResourceFactory = globalScene.getResourceFactory();
  
    // Create a SceneResourceParameters object and use it to create a shader
    let sceneResourceParameter: SceneResourceParameters = {
      name: 'shaderResource',
      uri: $rawfile('shaders/custom_shader/custom_material_sample.shader')
    };
  
    return sceneFactory.createShader(sceneResourceParameter);
  }
  // [End create_shader_promise]
  
  // [Start create_image_promise]
  function createImagePromise(): Promise<Image> {
    // Ensure the scene is loaded before accessing sceneFactory
    if (!globalScene) {
      return Promise.reject(new Error('Scene is not loaded yet.'));
    }
    let sceneFactory: SceneResourceFactory = globalScene.getResourceFactory();
  
    let sceneImageParameter: SceneResourceParameters = {
      name: 'image',
      uri: $rawfile('image/Cube_BaseColor.png')
    };
  
    return sceneFactory.createImage(sceneImageParameter);
  }
  // [End create_image_promise]
  
  // [Start create_environment_promise]
  function createEnvironmentPromise(): Promise<Environment> {
    // Ensure the scene is loaded before accessing sceneFactory
    if (!globalScene) {
      return Promise.reject(new Error('Scene is not loaded yet.'));
    }
    let sceneFactory: SceneResourceFactory = globalScene.getResourceFactory();
  
    // Manually load environment maps (.ktx/.jpg/.png etc.)
    let sceneImageParameter: SceneResourceParameters = { name: 'image', uri: $rawfile('image/Cube_BaseColor.png') };
    return sceneFactory.createImage(sceneImageParameter).then(async (imageEntity: Image) => {
      // Create Environment
      let sceneEnvironmentParameter: SceneResourceParameters = { name: 'env' };
      let envEntity: Environment = await sceneFactory.createEnvironment(sceneEnvironmentParameter);
      envEntity.backgroundType = EnvironmentBackgroundType.BACKGROUND_EQUIRECTANGULAR;
      envEntity.environmentImage = imageEntity;
      // Set environment related properties
      envEntity.indirectDiffuseFactor.x = 1;
      envEntity.indirectDiffuseFactor.y = 1;
      envEntity.indirectDiffuseFactor.z = 1;
      envEntity.indirectDiffuseFactor.w = 1;
      return envEntity;
    });
  }
   // [End create_environment_promise]
  
  @Entry
  @Component
  struct materialPage {
    scene: Scene | null = null;
    @State sceneOpt: SceneOptions | null = null;
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
  
    onPageShow(): void {
      this.init();
    }
  
    onPageHide(): void {
      if (this.scene) {
        this.scene.destroy();
      }
      this.scene = null;
      this.sceneOpt = null;
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
        // Switched from .gltf to .glb; same content, different format
        Scene.load($rawfile('gltf/CubeWithFloor/glTF/AnimatedCube.glb'))
          .then(async (result: Scene) => {
            // Assign loaded scene to globalScene for unified resource creation
            globalScene = result;
            this.scene = result;
            this.sceneOpt = { scene: this.scene, modelType: ModelType.SURFACE } as SceneOptions;
            this.rf = this.scene.getResourceFactory();
            // [StartExclude scene_load_init]
            // [Start scene_camera_init]
            this.cam = await this.rf.createCamera({ name: 'Camera1' });
            this.cam.enabled = true;
            this.cam.position.z = 5;
            // [End scene_camera_init]
            // create a geometry
            // [Start geometry_node_get]
            this.geom = this.scene.getNodeByPath('rootNode_/Unnamed Node 1/AnimatedCube') as Geometry;
  
            // record original material
            this.originalMat = this.geom.mesh.subMeshes[0].material;
            // [End geometry_node_get]
            // [EndExclude scene_load_init]
          })
          .catch((error: string) => {
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
              Text('Loading···');
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
            .onClick(async (): Promise<void> => {
              console.info('Start to replace with a blank material');
  
              if (!this.blankMat) {
                this.blankMat = await createMaterialPromise();
              }
  
              if (!this.scene || !this.rf) {
                return;
              }
  
              this.geom = this.scene.getNodeByPath('rootNode_/Unnamed Node 1/AnimatedCube') as Geometry;
  
              this.geom.mesh.materialOverride = undefined;
              if (this.blankMat) {
                this.geom.mesh.subMeshes[0].material = this.blankMat;
              }
  
            });
  
          Button('Replace with a Shader material')
            // [StartExclude material_button_action]
            .id('shader')
            .margin({ top: 20, left: 6 })
            .width('60%')
            .height(40)
            // [EndExclude material_button_action]
            .onClick(async (): Promise<void> => {
              console.info('Start to replace with a shader material');
  
              if (!this.shader) {
                this.shader = await createShaderPromise();
              }
  
              if (!this.scene || !this.rf) {
                return;
              }
  
              if (!this.shaderMat) {
                let rf = this.scene.getResourceFactory();
                this.shaderMat = await rf.createMaterial({ name: 'shaderMat' }, MaterialType.SHADER);
              }
  
              if (this.shader) {
                this.shaderMat.colorShader = this.shader;
              }
  
              this.geom = this.scene.getNodeByPath('rootNode_/Unnamed Node 1/AnimatedCube') as Geometry;
  
              this.geom.mesh.materialOverride = undefined;
  
              if (this.shaderMat) {
                this.geom.mesh.subMeshes[0].material = this.shaderMat;
              }
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
            .onClick(async (): Promise<void> => {
              console.info('Start to replace with a material of image');
  
              if (!this.scene || !this.cam || !this.rf) {
                return;
              }
  
              // create shader
              this.shader = await this.rf.createShader({
                name: 'shaderResource',
                uri: $rawfile('shaders/custom_shader/custom_material_sample.shader')
              });
  
              // create imageMat
              this.imageMat = await this.rf.createMaterial({ name: 'imageMat' }, MaterialType.SHADER) as ShaderMaterial;
  
              // bind between shader and imageMat
              this.imageMat.colorShader = this.shader;
              let createdImage =  await createImagePromise();
              if (createdImage) {
                this.imageMat.colorShader.inputs['BASE_COLOR_Image'] = createdImage;
              }
  
              this.geom = this.scene.getNodeByPath('rootNode_/Unnamed Node 1/AnimatedCube') as Geometry;
  
              this.geom.mesh.materialOverride = undefined;
              this.geom.mesh.subMeshes[0].material = this.imageMat;
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
            .onClick(async (): Promise<void> => {
              console.info('Start to replace with a material of image');
  
              if (!this.scene || !this.cam) {
                return;
              }
  
              this.env = await createEnvironmentPromise();
              if (this.env) {
                this.scene.environment = this.env;
              }
            });
          // [End environment_button_action]
  
          Button('back')
            .id('back')
            .margin({ top: 20, left: 6 })
            .width('60%')
            .height(40)
            .onClick(() => {
              router.back();
            })
        }
        .width('100%');
      }
      .height('100%');
    }
  }